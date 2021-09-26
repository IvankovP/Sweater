<#import "parts/common.ftlh" as c>

<@c.page>
    <form class="d-flex mb-3 col-md-6" method="get">
        <input class="form-control me-2" type="search" name="filter" placeholder="Filter" value="${filter}">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
    <p class="mb-3">
        <a class="btn btn-primary" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Add new message
        </a>
    </p>
    <div class="collapse" id="collapseExample">
        <div class="mb-2 col-md-6">
            <form method="post" enctype="multipart/form-data">
                <input class="form-control mb-2" type="text" name="tag" placeholder="Title">
                <input class="form-control mb-2" type="text" name="text" placeholder="Enter text">
                <input class="form-control mb-2" type="file" name="file" placeholder="Upload file">
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button class="btn btn-primary" type="submit">Add</button>
            </form>
        </div>
    </div>
    <div>
        <h3>Messages:</h3>
    </div>
    <div class="row row-cols-1 row-cols-md-2 g-4">
        <#list messages as message>
            <div class="col">
                <div class="card">
                    <#if message.filename??> <#--приведение к булево-->
                        <img src="/img/${message.filename}" class="card-img-top" alt="No image">
                    </#if>
                    <div class="card-body">
                        <h5 class="card-title">${message.tag}</h5>
                        <p class="card-text">${message.text}</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Author: ${message.authorName}</small>
                    </div>
                </div>
            </div>
        <#else> No messages
        </#list>
    </div>
</@c.page>