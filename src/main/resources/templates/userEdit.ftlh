<#import "parts/common.ftlh" as c>

<@c.page>
    <h3>User editor</h3>
    <form method="post" action="/users">
        <input type="hidden" name="userId" value="${user.id}"/>
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <div class="mb-2 col-md-4">
            <label>
                Name: <input class="form-control" type="text" name="username" value="${user.username}"/>
            </label>
        </div>
        <#list roles as role>
            <div class="form-check">
                <label class="form-check-label">
                    <input class="form-check-input" type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                </label>
            </div>
        </#list>
        <div>
            <button class="btn btn-success mt-2" type="submit">Save</button>
        </div>
    </form>
</@c.page>