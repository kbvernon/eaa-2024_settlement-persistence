function Div(div)
  -- desert cinnamon callout
  if div.classes:includes("callout-cinnamon") then
    -- default title
    local title = "Note"
    -- use first element of div as title if this is a header
    if div.content[1] ~= nil and div.content[1].t == "Header" then
      title = pandoc.utils.stringify(div.content[1])
      div.content:remove(1)
    end
    -- return a callout instead of the Div
    return quarto.Callout({
      type = "cinnamon",
      content = { pandoc.Div(div) },
      title = title,
      collapse = false
    })
  end
  
  -- desert cerulean callout
  if div.classes:includes("callout-cerulean") then
    -- default title
    local title = "Note"
    -- use first element of div as title if this is a header
    if div.content[1] ~= nil and div.content[1].t == "Header" then
        title = pandoc.utils.stringify(div.content[1])
        div.content:remove(1)
    end
    -- return a callout instead of the Div
    return quarto.Callout({
      type = "cerulean",
      content = { pandoc.Div(div) },
      title = title,
      collapse = false
    })
  end
end