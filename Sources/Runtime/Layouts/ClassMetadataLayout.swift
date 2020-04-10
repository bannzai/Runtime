// MIT License
//
// Copyright (c) 2017 Wesley Wickwire
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Swift public class or objc class
public struct AnyClassMetadataLayout {
    public var _kind: Int // isaPointer for classes
    public var superClass: Any.Type
    public var objCRuntimeReserve: (Int, Int)
    public var rodataPointer: Int
    
    public var isSwiftClass: Bool {
        return (rodataPointer & classIsSwiftMask()) != 0
    }
}

public struct ClassMetadataLayout: NominalMetadataLayoutType {
    public var _kind: Int // isaPointer for classes
    public var superClass: Any.Type
    public var objCRuntimeReserve: (Int, Int)
    public var rodataPointer: Int
    public var classFlags: Int32
    public var instanceAddressPoint: UInt32
    public var instanceSize: UInt32
    public var instanceAlignmentMask: UInt16
    public var reserved: UInt16
    public var classSize: UInt32
    public var classAddressPoint: UInt32
    public var typeDescriptor: UnsafeMutablePointer<ClassTypeDescriptor>
    public var iVarDestroyer: UnsafeRawPointer
}
