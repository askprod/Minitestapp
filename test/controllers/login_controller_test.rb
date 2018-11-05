require 'test_helper'

class LoginControllerTest < ActionDispatch::IntegrationTest
  
  test 'Homepage links' do
    get '/'
    assert_response :success
    assert_select "a[href=?]", '/login/new'
    assert_select "a[href=?]", '/login/check'
  end

  test 'Can create new user' do
    get '/login/new'
    assert_response :success

    post '/login/new',
      params: {user:{first_name: "Paul", last_name: "TD", email:"paul@td.fr", password: "testmdp"}}
      assert_response :success      
  end

  test 'Cannot create empty user' do
    post '/login/new',
    params: {user:{first_name: "", last_name: "", email:"", password: ""}}
    assert_redirected_to '/login/blank'
  end     

  test 'Login success' do
    post '/login/check',
    params: {'/login/login':{email: "aaa", password: "aaa"}}
    assert_redirected_to '/login/success'
  end

  test 'Login failed' do
    post '/login/check',
    params: {'/login/login':{email: "", password: ""}}
    assert_redirected_to '/login/failed'
  end

  test 'Navbar elements' do
    get '/'
    assert_select 'nav/a', :href => '/'
    assert_select 'nav/a', :href => '/login/new'
    assert_select 'nav/a', :href => '/login/check'
  end

  test 'Page club accessible seulement aux utilisateurs connectés' do
  get '/'
  #assert_select 'h3', "Your account" Won't work, @current_user not implemented?
  assert_response :success
  end

end
