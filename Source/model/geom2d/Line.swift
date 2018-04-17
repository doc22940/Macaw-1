import Foundation

open class Line: Locus {

    open let x1: Double
    open let y1: Double
    open let x2: Double
    open let y2: Double

    public init(x1: Double = 0, y1: Double = 0, x2: Double = 0, y2: Double = 0) {
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
    }

    override open func bounds() -> Rect {
        return Rect(
            x: min(x1, x2),
            y: min(y1, y2),
            w: abs(x1 - x2),
            h: abs(y1 - y2))
    }
    
    internal override func toDictionary() -> [String:Any] {
        return ["type": "Line", "x1": x1, "y1": y1, "x2": x2, "y2": y2]
    }
    
    internal convenience init(dictionary: [String:Any]) {
        self.init(x1: parse(dictionary["x1"]),
                  y1: parse(dictionary["y1"]),
                  x2: parse(dictionary["x2"]),
                  y2: parse(dictionary["y2"]))
    }
}
