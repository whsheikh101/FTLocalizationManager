//
//  FTButton.swift
//  LocalizationHandler
//
//  Created by Abdulla Kunhi on 4/25/18.
//  Copyright © 2018 Abdulla Kunhi. All rights reserved.
//

import UIKit

open class FTButton: UIButton {
    
    @IBInspectable open var respectLocale: Bool = true {
        didSet {
            configrueView()
        }
    }
    
    @IBInspectable open var normalImage: UIImage? {
        didSet {
            configrueView()
        }
    }
    
    @IBInspectable open var selectedImage: UIImage? {
        didSet {
            configrueView()
        }
    }
    
    @IBInspectable open var localizedTitleNormal: String? {
        didSet {
            configrueView()
        }
    }
    
    @IBInspectable open var localizedTitleSelected: String? {
        didSet {
            configrueView()
        }
    }
    @IBInspectable open var localizedTitleHighlighted: String? {
        didSet {
            configrueView()
        }
    }
    
    @IBInspectable open var localizedTitleDisabled: String? {
        didSet {
            configrueView()
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        configrueView()
    }
    
    fileprivate var shouldFlip: Bool {
        return respectLocale && Language.current.isRTL
    }
    
    private func configrueView() {
        
        if let localizedTitleNormal = localizedTitleNormal {
            setTitle(NSLocalizedString(localizedTitleNormal, comment: ""), for: .normal)
        }
        if let localizedTitleSelected = localizedTitleSelected {
            setTitle(NSLocalizedString(localizedTitleSelected, comment: ""), for: .selected)
        }
        if let localizedTitleHighlighted = localizedTitleHighlighted {
            setTitle(NSLocalizedString(localizedTitleHighlighted, comment: ""), for: .highlighted)
        }
        if let localizedTitleDisabled = localizedTitleDisabled {
            setTitle(NSLocalizedString(localizedTitleDisabled, comment: ""), for: .disabled)
        }
        
        setImage(normalImage, for: .normal)
        setImage(selectedImage, for: .selected)
    }
    
    open override func setImage(_ image: UIImage?, for state: UIControl.State) {
        
        guard let newImage = image, let cgImage = image?.cgImage else {
            super.setImage(image, for: state)
            return
        }
        
        let image = shouldFlip ? UIImage(cgImage: cgImage, scale: newImage.scale, orientation: .upMirrored) : newImage
        
        // set image
        super.setImage(image, for: state)
    }
}
