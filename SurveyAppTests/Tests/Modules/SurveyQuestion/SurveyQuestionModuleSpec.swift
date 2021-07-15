//
//  SurveyQuestionModuleSpec.swift
//  SurveyApp Tests
//
//  Created by Chananchida F. on 7/12/21.
//  
//

import Quick
import Nimble

@testable import SurveyApp

final class SurveyQuestionModuleSpec: QuickSpec {

    override func spec() {

        var output: SurveyQuestionOutput!
        var module: SurveyQuestionModule!

        describe("a SurveyQuestionModule") {
            describe("its initializers are called") {
                beforeEach {
                    output = SurveyQuestionOutputMock()
                    module = SurveyQuestionModule()
                    module.output = output
                }

                it("sets view output with presenter") {
                    let view = module.view
                    expect(view.output).to(beAKindOf(SurveyQuestionPresenter.self))
                }

                it("sets presenter's view, router, interactor, input, output") {
                    let presenter = module.presenter
                    expect(presenter.view).to(beAKindOf(SurveyQuestionViewController.self))
                    expect(presenter.router).to(beAKindOf(SurveyQuestionRouter.self))
                    expect(presenter.interactor).to(beAKindOf(SurveyQuestionInteractor.self))
                    expect(presenter.output) === output
                    expect(presenter) === module.input
                }

                it("sets interactor output with presenter") {
                    let interactor = module.interactor
                    expect(interactor.output).to(beAKindOf(SurveyQuestionPresenter.self))
                }

                it("sets router's view") {
                    let router = module.router
                    expect(router.view).to(beAKindOf(SurveyQuestionViewController.self))
                }
            }
        }
    }
}
