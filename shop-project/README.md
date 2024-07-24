# 2024-07-19 
## 메인페이지 완성
![메인페이지](https://github.com/user-attachments/assets/47fd8382-f2cd-434b-968d-2ac52fb8befa)

### 아직 메인페이지에 쓸 데이터를 안넣은 관계로 현재 비어있는 상태이다. 데이터를 넣는다면 아우터 페이지처럼 나올 예정이다.
<br>

## 아우터페이지 완성
![main](https://github.com/user-attachments/assets/41960bc9-1968-4bb3-9939-1b2a98b0a412)

### 현재 아우터만 데이터를 넣은상태여서 메인 페이지도 데이터를 넣는다면 이 형태로 나올 예정이다.

## 회원가입페이지 완성
![join](https://github.com/user-attachments/assets/0bf6a435-93de-4d3e-bb1e-b0c043fd88ac)

db의 유저 테이블의 컬럼에 있는 기준으로 만들었다.<be>

## 내일 할 일

### 회원가입을 하기위한 유효성검사 및 아이디 중복값 체크를 할거다

추가로 이미지도 주소를 갖고오는게 아닌 다운을 받아서 보관하기 및 원래 img에서 goods의 정보를 받아왔는데 img테이블에서 받는게 아닌 goods테이블에서 img테이블의 컬럼을 갖고오는 식으로 수정하기
```markdown
```sql
SELECT goods.id, goods.name, goods.price, img.path, img.type
FROM goods
JOIN img ON goods.id = img.goods_id;
```
ImgsEntity 대신 GoodsEntity를 사용할 예정입니다.
# 2024-07-20
## 회원가입 유효성 검사 및 아이디 중복값 체크
#### 회원가입을 위해 먼저 UsersEntity를 만들었다. 그 후UsersService와 UsersServiceImpl / UsersDAO와 UsersDAOImpl / UsersController를 만들어주었다.

# 회원가입 폼

아래는 회원가입 폼의 HTML 코드입니다:

```html
<form method="post" name="joinForm">
    <div class="form-group">
        <label for="id">아이디</label>
        <input id="id" placeholder="아이디" name="id" type="text">
    </div>
    <div class="form-group">
        <label for="password">비밀번호</label>
        <input id="password" placeholder="비밀번호" type="password" name="password">
    </div>
    <div class="form-group">
        <label for="confirm-password">비밀번호 확인</label>
        <input id="confirm-password" placeholder="비밀번호 확인" type="password" name="confirm_password">
    </div>
    <div class="form-group">
        <label for="name">이름</label>
        <input id="name" placeholder="이름" name="name">
    </div>
    <div class="form-group">
        <label for="phone">전화번호</label>
        <input id="phone" placeholder="010-1234-1234" maxlength="13" name="phone">
    </div>
    <div class="form-group">
        <label for="email">이메일</label>
        <input id="email" placeholder="이메일" name="email">
    </div>
    <div class="submit-button-wrapper">
        <button type="submit" onclick="check(event)">회원가입</button>
    </div>
</form>

```
# 데이터베이스 쿼리
1. 회원가입 정보를 데이터베이스에 저장하기 위한 MyBatis SQL 매퍼 쿼리는 다음과 같다:
```
	<insert id="users_insert" parameterType="kr.co.dong.domain.UsersEntity">
		insert into users(login,pw,name,number,email,joinDay) 
		values (#{login},#{pw},#{name},#{number},#{email},now())
	</insert>
```
1. usersEntity의 객체 속성값들을 사용하였다
2. users 테이블의 joinDay는 now()를 이용하여 가입한 현재 날짜와 시간값을 넣어주었다.
# 회원가입 로직
```
	@PostMapping(value = "join")
	public String join_insert(@RequestParam("id") String id, @RequestParam("password") String password,
			@RequestParam("confirm_password") String confirm_password, @RequestParam("name") String name,
			@RequestParam("phone") String phone, @RequestParam("email") String email) {
			
		int id_check = service.id_check(id);
		
		if(id_check > 0) {
			System.out.println("중복된값이있다?!");
			return "join";
		}
		UsersEntity usersEntity = new UsersEntity();
	
		usersEntity.setLogin(id);
		System.out.println("ID :" + id);
		usersEntity.setPw(password);
		System.out.println("PW" + password);
		usersEntity.setName(name);
		System.out.println("Name" + name);
		usersEntity.setNumber(phone);
		System.out.println("phone" + phone);
		usersEntity.setEmail(email);
		System.out.println("email" + email);

		int result = service.users_insert(usersEntity);

		if (result > 0) {
			return "redirect:login";
		} else {
			System.out.println(result);
			return "join";
		}
	}
```
1. id_check는 아이디 값이 users 테이블에 중복된 아이디 값이 있는 확인해서 만약 있다면 return join을 해서 join페이지로 다시 돌아간다.
2. 새 UsersEntity 객체를 생성한다음 set을 통해 값을 넣은 후 users_insert 메서드를 호출하여 데이터베이스에 삽입한다.
3. 삽입이 성공하면 login 페이지로 가고, 실패하면 다시 join 페이지로 이동한다.
# DAO

```
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int users_insert(UsersEntity ue) {
		// TODO Auto-generated method stub
		return sqlSession.insert("kr.co.dong.usersMapper.users_insert",ue);
	}

	@Override
	public int id_check(String id) {
		return sqlSession.selectOne("kr.co.dong.usersMapper.id_check", id);
	}
```
1. users_insert 메서드는 SqlSession을 통해 usersMapper의 users_insert 쿼리를 실행하여 사용자 정보를 데이터베이스에 삽입합니다.
2. id_check 메서드는 주어진 아이디를 데이터베이스에서 검색하여 중복 여부를 확인합니다.
# Service 유효성검사
```
	public int users_insert(UsersEntity ue) {
		if(!Pattern.matches("^[a-zA-Z]{1}[a-zA-Z0-9_]{4,11}$", ue.getLogin())) {
			System.out.println("정규식으로");
			return 0;			
		}else if(!Pattern.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{5,}$", ue.getPw())) {
			return 0;
		}else if(!Pattern.matches("^[\\w-]+(\\.[\\w-]+)*@[\\w-]+(\\.[\\w-]+)*(\\.[a-zA-Z]{2,})$", ue.getEmail()) ) {
			return 0;
		}else if(!Pattern.matches("^\\d{3}-\\d{3,4}-\\d{4}$", ue.getNumber())) {
			return 0;
		}else if(!Pattern.matches("[가-힣]*$", ue.getName())) {
			return 0;
		}
		return dao.users_insert(ue);
	}

	@Override
	public int id_check(String id) {
		return dao.id_check(id);
	}
```
1. 입력된 아이디, 비밀번호, 이메일, 전화번호, 이름의 형식이 정규식에 맞는지 검사합니다.
2. 정규식 검사를 통과하지 못한 경우, 검증 실패 메시지를 출력하고 0을 반환합니다.
3. 모든 검증을 통과하면 dao.users_insert(ue)를 호출하여 사용자 정보를 데이터베이스에 삽입합니다.

### 내일 할 일
#### 로그인창 만들기와 로그인해보기

# 2024-07-20
## 로그인창

### jsp

```
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<html>
<head>
<title>Home</title>
</head>
<body>
	<div id="wrap">
		<%@include file="include/loginBeforeHeader.jsp"%>

		<div class="wrapper">
			<div id="formContent">
				<div class="fadeIn first">
					<h2 class="my-5">로그인</h2>
				</div>
				<!-- Login Form -->
				<form method="post" action="login">
					<input name="id" type="text" id="id" class="fadeIn"
						placeholder="아이디"> <input name="pw" type="password"
						id="pw" class="fadeIn" placeholder="비밀번호">
					<div id="formFooter">
						<a class="underlineHover" href="#">비밀번호/아이디 찾기</a> <a
							href="${contextPath }/join">회원가입</a>
					</div>
					<input type="submit" class="fadeIn fourth" value="로그인">
				</form>
				<!-- error가 비어있지 않는 경우 ${error}을 보여줘라는뜻 -->
				<c:if test="${not empty error}">
					<div class="error-message" style="color: red;">${error}</div>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
</body>
</html>
```

### mybatis
```
	<select id="sucess" resultType="kr.co.dong.domain.UsersEntity">
		select login,pw,name from users
		where login = #{login} and pw = #{pw}
	</select>
```
sql문을 login과 pw가 동시에 같을때 login, pw ,name을 가져오게 짜봤다.

### DAO
```
	public UsersEntity success(UsersEntity ue) {
		Map<String, Object> login = new HashMap<String, Object>();
		login.put("login", ue.getLogin());
		login.put("pw",ue.getPw());
		return sqlSession.selectOne("kr.co.dong.usersMapper.sucess",login);
	}
```
selectOne인데 두개의 값을 받기 위하여 Map을 만들어서 넣어줬다. (여기서 그냥 Map을 매개변수로 받으면 됐는데 이때는 몰랐다.)

### Service
```
	@Override
	public UsersEntity success(UsersEntity ue) {
		return  dao.success(ue);
	}
```
아이디부근에선 회원가입과 달리 유효성검사같은게 없어서 간단하게 만들었다.

### Controller
```
	// GetMapping을 하지않으면 405오류 걸림
	@GetMapping(value = "login")
	public String login() {
		return "login";
	}

	// 로그인 세션
	@PostMapping(value = "login")
	public String loginForm(@RequestParam(value = "id") String id, @RequestParam(value = "pw") String pw, Model model,
			HttpServletRequest request) {
		if (id == null || pw == null) {
			return "login";
		}
		UsersEntity ue = new UsersEntity();
		ue.setLogin(id);
		ue.setPw(pw);

		UsersEntity sucess = service.success(ue);
		if (sucess == null) {
			return "login";
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("user", sucess);
			session.setAttribute("username", sucess.getName());
			return "redirect:/";
		}
	}
```
처음에는 GetMapping을 안썻는데 이걸 안쓰면 405오류가 걸렸다.
405에러는 서버에 요청하지 않는 메소드를 사용했을때 발생한다는걸 찾았다. 그래서 GetMapping을써서 선언해줬다. <br>
@RequestParam을 통해 jsp에 있는 파라미터 값들을 가져왔다. 그 후 조건문으로 id와 pw가 null이면 login페이지로 다시 리턴 시켰다. <br>
저 조건문을 넘어가면 UsersEntity에 id와 pw값을 넣은후 service의 success(ue)를 넣어서 sucess가 null일시 다시 로그인 페이지 리턴 그게 아닐시 절대경로로 리다이렉트해줬다. <br>
여기서 ```HttpSession session = request.getSession()```을 써서 세션을 불러와줬다. 그 후 serAttribute를 통해 속성을 추가해줬다. 필요한 속성들은 "user"나 "username"을 통해 사용할 수 있다.

### 로그아웃
```
	@RequestMapping(value = { "logout", "goods/logout" })
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		String referer = request.getHeader("Referer"); // 이전 url로 돌아가기위해사용
		return "redirect:" + referer;
	}
```
처음에는 ```value="logout"```만 해줬다 근데 goods/{id}페이지에서 변수가 발생했다. 그 변수는 goods/{id}에서 로그아웃을 할 시 goods/logout이 발생했다 그래서 그걸 방지하기위해 ``` value = {"logout","goods/logout"}을 통해 막아 주었다.

# 2024-07-21

## 상품페이지

상품 페이지를 꾸며볼거다. <br>
상품 페이지 구성
![57](https://github.com/user-attachments/assets/f0fd17c6-fa79-42d6-bb67-5ad4ab0f69c3)

피그마로 구성해본 상품페이지다. (바뀔 수 도 있음)

### mybatis
```
	<select id="goods_page" resultType="kr.co.dong.domain.GoodsEntity">
		select goods.name,goods.price,img.path
  		from goods 
  		join img on img.goods_id= goods.id
  		where goods.id = #{goods.id};
	</select>
```
현재는 goods.name goods.price img.path만 받아왔다. 나중에 좀 더 조인할 예정이다.
### DAO
```
	@Override
	public GoodsEntity goods_page(String id) {
		// TODO Auto-generated method stub
		return goodsDAO.goods_page(id);
	}
```
### Service
```
	@Override
	public GoodsEntity goods_page(String id) {
		// TODO Auto-generated method stub
		return goodsDAO.goods_page(id);
	}
```
### Controller
```
	@GetMapping(value = "goods/{id}")
	public String goods(@PathVariable("id")String id,Model model) {
		GoodsEntity ge = service.goods_page(id);
		model.addAttribute("list", ge);
		return "goods";
	}
```
### jsp
```
	<div id="wrap">
        <c:choose>
            <c:when test="${not empty user}">
                <%@ include file="include/loginAfterHeader.jsp" %>
            </c:when>
            <c:otherwise>
                <%@ include file="include/loginBeforeHeader.jsp" %>
            </c:otherwise>
        </c:choose>
        <div class="page_container">
			<div class="page_img_box">
				<img class="goods_page" src="${contextPath }/${list.path}">
			</div>
			<div class="page_content">
				<h1 class="title">${list.name }</h1>
				<div>${list.price } 원</div>
				<input type="button" value="구매하기">
				<input type="button" value="장바구니넣기">				
			</div>
		</div>
	</div>
	<%@ include file="include/footer.jsp"%>
```
현재는 받은 정보가 없어 아직 저거밖에 못했다 나중엔 브랜드도 조인해서 만들예정이다.

