<#macro login path isRegisterForm=false>
    <form action="${path}" method="post">
        <div class="mb-2 col-md-4">
            <input class="form-control" type="text" name="username" placeholder="Login"/>
        </div>
        <div class="mb-2 col-md-4">
            <input class="form-control" type="password" name="password" placeholder="Password"/>
        </div>
        <#if !isRegisterForm>
            <div>
                <a href="/registration">Add new user</a>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <div>
            <button class="btn btn-primary mt-2" type="submit"><#if !isRegisterForm>Sign In<#else>Add</#if></button>
        </div>
    </form>
</#macro>

<#macro logout path>
    <form action="${path}" method="post" class="d-flex">
        <button class="btn btn-outline-success" type="submit">Sign Out</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</#macro>