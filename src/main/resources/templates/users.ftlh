<#import "parts/common.ftlh" as c>

<@c.page>
    <h3>Users list</h3>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Roles</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td hidden>${user.id}</td>
                <td>${user.username}</td>
                <td>
                    <#list user.roles as role>
                        ${role}<#sep>,
                    </#list>
                </td>
                <td class="text-end">
                    <a type="button" class="btn btn-success" href="/users/${user.id}">Edit</a>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>