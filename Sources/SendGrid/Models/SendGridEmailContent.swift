import Vapor

public struct SendGridEmailContent: Content {
    
    /// A content type is required, this tells email clients how to display the email.
    ///
    /// Your content type must be a string with length of at least one character.
    /// Cannot contain ‘;’, or CRLF characters.
    ///
    /// - html: "text/html"
    /// - text: "text/plain"
    public enum SendGridEmailContentType: String, Content {
        case html = "text/html"
        case text = "text/plain"
    }
    
    /// See `SendGridEmailContentType`
    public var type: SendGridEmailContentType
    
    /// A content value is required, this is the content of the email you are sending.
    ///
    /// The content value must be a string at least one character in length.
    /// Following RFC 1341, section 7.2, if either text/html or text/plain are to be
    /// sent in your email: text/plain needs to be first, followed by text/html,
    /// followed by any other content.
    public var value: String
    
    public init(type: SendGridEmailContentType, value: String) {
        self.type = type
        self.value = value
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case value
    }
    
}
