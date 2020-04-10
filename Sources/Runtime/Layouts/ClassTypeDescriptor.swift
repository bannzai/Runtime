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

public struct ClassTypeDescriptor: TypeDescriptor {
    public var flags: ContextDescriptorFlags
    public var parent: Int32
    public var mangledName: RelativePointer<Int32, CChar>
    public var fieldTypesAccessor: RelativePointer<Int32, Int>
    public var fieldDescriptor: RelativePointer<Int32, FieldDescriptor>
    public var superClass: RelativePointer<Int32, Any.Type>
    public var negativeSizeAndBoundsUnion: NegativeSizeAndBoundsUnion
    public var metadataPositiveSizeInWords: Int32
    public var numImmediateMembers: Int32
    public var numberOfFields: Int32
    public var offsetToTheFieldOffsetVector: RelativeVectorPointer<Int32, Int>
    public var genericContextHeader: TargetTypeGenericContextDescriptorHeader
    
    public struct NegativeSizeAndBoundsUnion: Union {
        public var raw: Int32
        
        public var metadataNegativeSizeInWords: Int32 {
            return raw
        }
        
        mutating public func resilientMetadataBounds() -> UnsafeMutablePointer<RelativePointer<Int32, TargetStoredClassMetadataBounds>> {
            return bind()
        }
    }
}

public struct TargetStoredClassMetadataBounds {
    public var immediateMembersOffset: Int
    public var bounds: TargetMetadataBounds
}

public struct TargetMetadataBounds {
    public var negativeSizeWords: UInt32
    public var positiveSizeWords: UInt32
}
