//
//  OSlideImproveView.swift
//  FNP
//
//  Created by Andrey Chernyshev on 12.07.2021.
//

import UIKit

final class OSlideImproveView: OSlideView {
    lazy var titleLabel = makeTitleLabel()
    lazy var tag1 = makeTag(title: "Onboarding.Improve.Cell1", tag: 1)
    lazy var tag2 = makeTag(title: "Onboarding.Improve.Cell2", tag: 2)
    lazy var tag3 = makeTag(title: "Onboarding.Improve.Cell3", tag: 3)
    lazy var tag4 = makeTag(title: "Onboarding.Improve.Cell4", tag: 4)
    lazy var tag5 = makeTag(title: "Onboarding.Improve.Cell5", tag: 5)
    lazy var tag6 = makeTag(title: "Onboarding.Improve.Cell6", tag: 6)
    lazy var tag7 = makeTag(title: "Onboarding.Improve.Cell7", tag: 7)
    lazy var button = makeButton()
    
    override init(step: OnboardingView.Step, scope: OnboardingScope) {
        super.init(step: step, scope: scope)
        
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func moveToThis() {
        super.moveToThis()
        
        SDKStorage.shared
            .amplitudeManager
            .logEvent(name: "Improve Screen", parameters: [:])
    }
}

// MARK: Private
private extension OSlideImproveView {
    @objc
    func selected(tapGesture: UITapGestureRecognizer) {
        guard let tagView = tapGesture.view as? OImproveCell else {
            return
        }
        
        tagView.isSelected = !tagView.isSelected
    }
}

// MARK: Make constraints
private extension OSlideImproveView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17.scale),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17.scale),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 134.scale : 70.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 46.scale),
            tag1.widthAnchor.constraint(equalToConstant: 122.scale),
            tag1.heightAnchor.constraint(equalToConstant: 122.scale),
            tag1.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 323.scale : 240.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 86.scale),
            tag2.widthAnchor.constraint(equalToConstant: 89.scale),
            tag2.heightAnchor.constraint(equalToConstant: 89.scale),
            tag2.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 230.scale : 147.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 165.scale),
            tag3.widthAnchor.constraint(equalToConstant: 136.scale),
            tag3.heightAnchor.constraint(equalToConstant: 136.scale),
            tag3.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 268.scale : 185.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag4.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.scale),
            tag4.widthAnchor.constraint(equalToConstant: 90.scale),
            tag4.heightAnchor.constraint(equalToConstant: 90.scale),
            tag4.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 439.scale : 356.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag5.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 101.scale),
            tag5.widthAnchor.constraint(equalToConstant: 143.scale),
            tag5.heightAnchor.constraint(equalToConstant: 143.scale),
            tag5.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 432.scale : 349.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag6.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 242.scale),
            tag6.widthAnchor.constraint(equalToConstant: 120.scale),
            tag6.heightAnchor.constraint(equalToConstant: 120.scale),
            tag6.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 390.scale : 307.scale)
        ])
        
        NSLayoutConstraint.activate([
            tag7.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 250.scale),
            tag7.widthAnchor.constraint(equalToConstant: 78.scale),
            tag7.heightAnchor.constraint(equalToConstant: 78.scale),
            tag7.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 512.scale : 429.scale)
        ])
        
        NSLayoutConstraint.activate([
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 26.scale),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -26.scale),
            button.heightAnchor.constraint(equalToConstant: 60.scale),
            button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: ScreenSize.isIphoneXFamily ? -70.scale : -30.scale)
        ])
    }
}

// MARK: Lazy initialization
private extension OSlideImproveView {
    func makeTitleLabel() -> UILabel {
        let attrs = TextAttributes()
            .textColor(Appearance.blackColor)
            .font(Fonts.SFProRounded.bold(size: 25.scale))
            .lineHeight(29.scale)
            .textAlignment(.center)
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = "Onboarding.Improve.Title".localized.attributed(with: attrs)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeTag(title: String, tag: Int) -> OImproveCell {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selected(tapGesture:)))
        
        let view = OImproveCell()
        view.tag = tag
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapGesture)
        view.isSelected = false
        view.label.text = title.localized
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeButton() -> UIButton {
        let attrs = TextAttributes()
            .textColor(UIColor.white)
            .font(Fonts.SFProRounded.semiBold(size: 20.scale))
            .textAlignment(.center)
        
        let view = UIButton()
        view.backgroundColor = Appearance.mainColor
        view.layer.cornerRadius = 30.scale
        view.setAttributedTitle("Onboarding.Proceed".localized.attributed(with: attrs), for: .normal)
        view.addTarget(self, action: #selector(onNext), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}
