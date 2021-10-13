# 我們該如何執行這個 server

該 server 為 Rails GraphQL API Server，共有 5 個 API 可以使用，可以透過第三方 API 測試工具 (EX: Postman / Insomnia) 操作 API，Rails GraphQL 本身也有提供 Graphiql 介面操作，但目前只支援 development 環境，需要將程式碼下載至 local 方便操作，以下將說明如何透過第三方 API 測試工具 Insomnia 操作 API。

## fetchCourses API
- 目的：提供使用者取得系統中所有「課程」(Course) 的資訊，其中包含課程中的「章節」(Chapter) 資訊和「單元」(Unit) 資訊。
- 範例：
```
> POST /graphql HTTP/1.1
> Host: thawing-fortress-15880.herokuapp.com
> User-Agent: insomnia/2021.5.0
> Content-Type: application/json
> Accept: */*
> Content-Length: 210

query {
  fetchCourses {
    id
    name
    description
    chapters {
      id
      name
      units {
        id
        name
        body
        description
      }
    }
  }
}
```

## fetchCourse API
- 目的：提供使用者取得指定「課程」(Course) 的資訊，其中包含課程中的「章節」(Chapter) 資訊和「單元」(Unit) 資訊。
- 範例：
```
> POST /graphql HTTP/1.1
> Host: thawing-fortress-15880.herokuapp.com
> User-Agent: insomnia/2021.5.0
> Content-Type: application/json
> Accept: */*
> Content-Length: 216

query {
  fetchCourse(id: 1) {
    id
    name
    description
    chapters {
      id
      name
      units {
        id
        name
        body
        description
      }
    }
  }
}
```

## createCourse API
- 目的：提供使用者建立「課程」(Course) 與課程中的「章節」(Chapter) 和「單元」(Unit)。
- 範例：
```
> POST /graphql HTTP/1.1
> Host: thawing-fortress-15880.herokuapp.com
> User-Agent: insomnia/2021.5.0
> Content-Type: application/json
> Accept: */*
> Content-Length: 1147

mutation {
  createCourse(
    input: {
      attributes: {
        name: "name_999",
        lecturer: "lecturer_999",
        description: "description_999",
        chaptersAttributes: [
          {
            name: "chname_999",
            unitsAttributes: [
              { name: "unit_name_999_1", description: "unit_description_999_1", body: "unit_body_999_1" },
              { name: "unit_name_999_2", description: "unit_description_999_2", body: "unit_body_999_2" }
            ]
          },
          {
            name: "chname_666"
            unitsAttributes: [
              { name: "unit_name_666_1", description: "unit_description_666_1", body: "unit_body_666_1" },
              { name: "unit_name_666_2", description: "unit_description_666_2", body: "unit_body_666_2" }
            ]
          }
        ]
      }
    }
  ) {
    course {
      id
      name
      description
      lecturer
      chapters {
        id
        name
        units {
          name
          description
          body
        }
      }
    }
  }
}
```

## updateCourse API
- 目的：提供使用者編輯「課程」(Course) 與課程中的「章節」(Chapter) 和「單元」(Unit)。
- 範例：
```
> POST /graphql HTTP/1.1
> Host: thawing-fortress-15880.herokuapp.com
> User-Agent: insomnia/2021.5.0
> Content-Type: application/json
> Accept: */*
> Content-Length: 1196

mutation {
  deleteCourse(input: {id: 2}) {
    course {
      id
      name
      description
      chapters {
        id
        name
        units {
          id
          name
          description
          body
        }
      }
    }
  }
}
```

## deleteCourse API
- 目的：提供使用者刪除指定的「課程」(Course)，「課程」(Course) 中的「章節」(Chapter) 和「單元」(Unit) 也應該同時被刪除。
- 範例：
```
> POST /graphql HTTP/1.1
g> User-Agent: insomnia/2021.5.0
> Content-Type: application/json
> Accept: */*
> Content-Length: 276

mutation {
  updateCourse(
    input: {
      id: 1,
      attributes: {
        name: "name_1",
        lecturer: "lecturer_1",
        description: "description_1",
        chaptersAttributes: [
          {
            id: 1,
            name: "chapter_name_1",
            unitsAttributes: [
              { id: 1, name: "unit_name_1", description: "unit_description_1", body: "unit_body_1" },
              { id: 2, name: "unit_name_2", description: "unit_description_2", body: "unit_body_2" }
            ]
          },
          {
            id: 2,
            name: "chapter_name_2"
            unitsAttributes: [
              { id: 3, name: "unit_name_3", description: "unit_description_3", body: "unit_body_3" },
              { id: 4,name: "unit_name_4", description: "unit_description_4", body: "unit_body_4" }
            ]
          }
        ]
      }
    }
  ) {
    course {
      id
      name
      description
      lecturer
      chapters {
        id
        name
        units {
          id
          name
          description
          body
        }
      }
    }
  }
}
```

# 專案的架構，API server 的架構邏輯

該專案是由 Rails GraphQL API Server 為後端 API 架構搭配 PostgreSQL Database，並且部署在 Heroku Server 上。

# 你對於使用到的第三方 Gem 的理解，以及他們的功能簡介

除了原生 Rails 內建的 gems 以外，另外加入的部分都分為以下三大類：

- 用於測試的 gems
1. factory_bot_rails
2. faker
3. rspec-rails

- 用於統一 code style 的 gems
1. rubocop
2. rubocop-performance
3. rubocop-rails
4. rubocop-rake
5. rubocop-rspec

- 用於 GraphQL Server 的 gems
1. graphiql-rails
2. graphql
3. graphql-rails-generators

# 你在程式碼中寫註解的原則，遇到什麼狀況會寫註解

遇到複雜的邏輯時，讓之後遇到的工程師可以相對快速的了解這段邏輯的應用，也是讓自己過了兩個月之後再遇見的時候不會覺得很出戲XD

# 當有多種實作方式時，請說明為什麼你會選擇此種方式

如果不考慮時間因素，我會選擇相對成熟的實作方式，或是可以使用新的技術嘗試看看，如果考慮時間因素，那就會選擇相對成熟且快速的方式。

# 在這份專案中你遇到的困難、問題，以及解決的方法

在這個專案中有遇到幾個問題
1. GraphQL 架構的實作以及檔案分佈管理沒有遵循的規則，反覆測試之後實作出自己覺得還不錯的檔案架構。
2. GraphQL API 測試實作部分有稍微卡一下，想說有沒有比較好的規則遵循，也是反覆的測試之後找到自己還算滿意的測試規則。
3. 關於要怎麼在 GraphQL 架構下建立或更新關聯 model 的部分，有困擾我一陣子，後來想到可以透過 accepts_nested_attributes_for 方法實作，但不確定是否是最佳解。
