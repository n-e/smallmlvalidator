Message = Element*
Element = TagPair / Text

// We allow tags containing no content
TagPair = o:OTag Element* c:CTag & {return o === c}
Text = (BodyChar / Entity)+

/* TAGS */
OTag = NormalOTag / AOTag
CTag = NormalCTag / ACTag

NormalOTag = '<' n:TagName '>' {return n}
NormalCTag = '</' n:TagName '>' {return n}
TagName = [buis] / "tt"

AOTag = '<a href="' URLScheme AttrText '">' { return 'a'}
ACTag = '</a>' { return 'a'}

URLScheme = 'http://' / 'https://' / 'ftp://'
AttrText = (AttrChar / Entity)+

/* ENTITIES */
Entity = '&' EntityName ';'
EntityName = 'lt' / 'gt' / 'quot' / 'amp'

// Any character except control characters (0-31, 127)
// and <, >, &.
// For attrs we additionnaly forbid " as all attributes must be
// "-quoted.
BodyChar = [^\0-\x1F\x7F<>&]
AttrChar = [^\0-\x1F\x7F<>&"]
