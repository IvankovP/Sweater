<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
    <h3>Registration new user</h3>
    ${message!""}
    <@l.login "/registration" true></@l.login>
</@c.page>