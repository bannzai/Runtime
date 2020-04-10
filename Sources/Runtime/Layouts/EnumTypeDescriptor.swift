//
//  EnumTypeDescriptor.swift
//  Runtime
//
//  Created by Wes Wickwire on 4/6/19.
//

public struct EnumTypeDescriptor: TypeDescriptor {
    public var flags: ContextDescriptorFlags
    public var parent: RelativePointer<Int32, UnsafeRawPointer>
    public var mangledName: RelativePointer<Int32, CChar>
    public var accessFunctionPointer: RelativePointer<Int32, UnsafeRawPointer>
    public var fieldDescriptor: RelativePointer<Int32, FieldDescriptor>
    public var numPayloadCasesAndPayloadSizeOffset: UInt32
    public var numEmptyCases: UInt32
    public var offsetToTheFieldOffsetVector: RelativeVectorPointer<Int32, Int32>
    public var genericContextHeader: TargetTypeGenericContextDescriptorHeader
    
    public var numberOfFields: Int32 {
        get { return 0 }
        set {   }
    }
}
