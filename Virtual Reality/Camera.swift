//
//  Camera.swift
//  Virtual Reality
//
//  Created by Admin on 5/16/16.
//  Copyright © 2016 Morra. All rights reserved.
//

import GLKit

class Camera: NSObject {
    
    private var projectionMatrix = GLKMatrix4()
    private var viewMatrix = GLKMatrix4()
    
    // MARK: - Projection matrix properties
    var fovRadians: Float = GLKMathDegreesToRadians(65.0) {
        didSet {
            self.updateProjectionMatrix()
        }
        
    }
    
    var aspect: Float = (350.0 / 480.0) {
        didSet {
            self.updateProjectionMatrix()
        }
    }
    
    var nearZ: Float = 0.1 {
        didSet {
            self.updateProjectionMatrix()
        }
    }
    
    var farZ: Float = 0.1 {
        didSet {
            self.updateProjectionMatrix()
        }
    }
    
    
    // MARK: - View matrix - yaw, pitch
    var yaw: Float = 0.0 {
        didSet {
            self.updateProjectionMatrix()
        }
    }
    
    var pitch: Float = 0.0 {
        didSet {
            self.updateProjectionMatrix()
        }
    }
    
    
    // MARK: - Matrix getters
    var projection: GLKMatrix4 {
        get {
            return self.projectionMatrix
        }
    }
    
    var view: GLKMatrix4 {
        get {
            return self.viewMatrix
        }
    }
    
    
    // MARK: - Init
    init(fovRadians: Float = GLKMathDegreesToRadians(65.0), aspect: Float = (320.0 / 480.0), nearZ: Float = 0.1, farZ: Float = 100) {
        
        super.init()
        
        self.fovRadians = fovRadians
        self.aspect = aspect
        self.nearZ = nearZ
        self.farZ = farZ
        self.updateProjectionMatrix()
        self.updateViewMatrix()
        
    }
    
    
    // MARK: - Updaters
    private func updateProjectionMatrix() {
        
        self.projectionMatrix = GLKMatrix4MakePerspective(self.fovRadians, self.aspect, self.nearZ, self.farZ)
        
    }
    
    private func updateViewMatrix() {
        
        let cosPitch = cosf(self.pitch)
        let sinPitch = sinf(self.pitch)
        let cosYaw = cosf(self.yaw)
        let sinYaw = sinf(self.yaw)
        
        let xAxis = GLKVector3(v: (cosYaw, 0, -sinYaw))
        let yAxis = GLKVector3(v: (sinYaw * sinPitch, cosPitch, cosYaw * sinPitch))
        let zAxis = GLKVector3(v: (sinYaw * cosPitch, -sinPitch, cosPitch * cosYaw))
        
        self.viewMatrix = GLKMatrix4(m: (xAxis.x, yAxis.x, zAxis.x, 0, xAxis.y, yAxis.y, zAxis.y, 0, xAxis.z, yAxis.z, zAxis.z, 0, 0, 0, 0, 1))
    }
    
}
