# Chunking

Vectorising the complete text of a news results in very bad search results. Its better to chunk the news into each paragraph and vectorise them.

## Main Workflow: GET overview page

The starting workflow pulls an overview page and get all newspage URLs out of it:

![Vectorise all news of an overview page](./Vectorise%20all%20news%20of%20an%20overview%20page.png)

What the workflow exactly do:
1. Defines a static URL of an overview page for the test
2. Get the HTML of that URL
3. Extract all URLs to the linked newspage
4. Select all already existing URLs from the database with that URLs
5. Split the URLs into already existing ones and the new ones
6. For each new URL of a newspage: Execute Subworkflow

## Sub Workflow: GET newspage

The sub workflow pulls a newspage, chunks the text and vectorise all of them:

![Pull and Vectorise Newspage](./Pull%20and%20Vectorise%20Newspage.png)

What the workflow exactly do:
1. Get the HTML of the newspage
2. Map HTML to JSON object and transform HTML of the text to Markdown
3. Combine all news data to a news DB object
4. Stores the news in the PostgreSQL
5. Split the text into chunks by paragraphs
6. For each chunk:
    1. Define `vectorisingText` as combination of title and text
    2. Use local embedding model to add the embedding vectors 
    3. Combine all chunk data to a chunk DB object
    4. Stores the chunk in the PostgreSQL

# Search

The search is changed to make a semantic search with the embeddings to find matchable results and then reranking the results by exact matchings of the search term in the title or text.

![Search for News](./Search%20for%20News.png)

What the workflow exactly do:
1. An example searchText is defined
2. Vectorising the searchText 
3. Select the 20 nearest news out of the database
4. Reranking the news, priorise matches in title over text over rest
