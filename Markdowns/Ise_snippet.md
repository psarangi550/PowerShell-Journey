#### How to Save WebSite Info Using Powershell #####


- if we want to `execute the Script Often` and `we want to Store that Script` as `Powershell Snippet` then we can use the `ISE-Snippet` as below
- we can use the `New-IseSnippet` cmdlet for the Same as well
- we can use the command as below  with the `-Ttitle` which takes the String as an Args and also we can use the `-Description` to provide a meaningful description to it
- we have to use the flag as  `-Text` to define the `Snippet` for the same using the `@'<snippet>'`  which can be wtitten as below

    ```
        New-IseSnippet -Title "<any str>" -Description "<any description>" -Text @'<snippet we want to use>'
    ```

- we can get the Snippet using it as `Get-IseSnippet` to get the Snippet that we have created
- we can also use the `Where-Object` in here as well and based on the `Ttile` we can be able to retrieve the Snippet
- in order to use it then we can use it by using the `ctrl+j` which will start the snippet and we can choose the `Snippet` that we want to use in here as well
- By default Powershell will save the `Snippet` to `C:\Users\<your username>\Documents\WindowsPowerShell\Snippet`
