module Data.Services exposing (..)

import Components.Emphasis exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (Service)


servicesList : List Service
servicesList =
    [ { id = 1
      , name = "Emotional Wellbeing"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Our Emotional Wellbeing services can help you if are experiencing any of the following:"
                    , emphasis " low mood, anxiety, worry, panic, bereavement, relationship difficulties, poor sleep and low self-esteem."
                    , text "Our services are open to anybody over the age of 16 who may be experiencing any of these problems and want to feel better. We also have a number of therapists with specialised skills that can support you to improve your thoughts and feelings and improve your emotional wellbeing."
                    ]
                , p []
                    [ text " Our services include:"
                    , br [] []
                    , emphasis "Living Well: "
                    , text "if you have a long term physical health problem or a physical symptom that cannot be diagnosed.     Perinatal - if you or your partner is pregnant or have given birth within the last 12 months."
                    , br [] []
                    , emphasis "Victims of crime: "
                    , text "specialist support for adults and children who have been a victim of crime such as: hate crime, domestic or sexual abuse and we can also support with pre-trial therapy."
                    , br [] []
                    , emphasis "NICU: "
                    , text "specialist support if you have had experience of NICU (neonatal intensive care unit) at any time. We understand that this can be a high time of distress for families and we often parents and extended family accessing our mental health services."
                    , br [] []
                    , emphasis "Talking Therapies: "
                    , text "enable you to improve your mood, build confidence and self esteem and feel better about your emotional and physical health and have better relationships with others. "
                    ]
                ]
      }
    , { id = 2
      , name = "Personal Development"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Our training provision provides both entry point into support and progression route within our services, with our programmes designed to deliver a responsive educational programme of wellbeing and mental health recovery focussed workshops and courses."
                    , br [] []
                    , text "Our"
                    , emphasis " MindFit programme "
                    , text "of therapeutic courses include the Programme, centred around our recommended route a carefully designed progression package which leads individuals to improved wellbeing."
                    , br [] []
                    , emphasis "MindFit "
                    , text "has been developed to provide a voyage of self discovery, with learners progressing carefully through a series of 5 week long courses."
                    , br [] []
                    , text "Courses in the programme include:"
                    , br [] []
                    , emphasis "The Planner: "
                    , text "the first steps to feeling happier, welcome and at ease in a small group."
                    , br [] []
                    , emphasis "The Journey: "
                    , text "leads to feeling stronger, more confident and assertive."
                    , br [] []
                    , emphasis "The Prize: "
                    , text "which adds the final touches and polishes new skills to achieve lasting positive changes."
                    ]
                ]
      }
    , { id = 3
      , name = "Employment Support"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text " Our Employment Support Team provide an "
                    , emphasis "individually tailored service "
                    , text "for any person looking to gain employment, go into education, volunteering or job searching."
                    , br [] []
                    , text "Our experienced staff will work with you on a one to one basis to develop your own personal action plan and support you to achieve your goals."
                    ]
                , p []
                    [ text "Our package of support includes:"
                    , br [] []
                    , emphasis "Workshops and Training Courses "
                    , text "to help you build your CV, develop interview skills, build your confidence and identify your strengths and skills."
                    , br [] []
                    , emphasis "Volunteer led work clubs "
                    , text "to support with job searching and CV building."
                    , br [] []
                    , emphasis "Digital inclusion "
                    , text "and IT support on a 1 to 1 or group basis."
                    , br [] []
                    , emphasis "Support "
                    , text "to find the right training course and qualifications."
                    , br [] []
                    , emphasis "Volunteer placement "
                    , text "opportunities to enhance your portfolio and develop your work skills."
                    , br [] []
                    , emphasis "Money advice "
                    , text "and support find the right childcare provision"
                    , br [] []
                    , text "Access to "
                    , emphasis "therapeutic services"
                    , text ", including one to one support and group activity to boost your confidence and self-esteem."
                    , br [] []
                    , emphasis "Legal Clinics. "
                    , text "We work with a number of local solicitors who provide free legal clinics at our centres."
                    ]
                ]
      }
    , { id = 4
      , name = "Money, Debt & Benefit Advice"
      , isVisible = False
      , description = section [ class "description-service pa3 gray" ] [ p [] [ text "Lancashire Women's Centres offer a Financial Conduct Authority (FCA) regulated debt counselling and money advice appointments offering a range of services.\n\nSuch as:\n\nBenefit advice including rent arrears,\nBenefit applications\nMandatory reconsiderations and appeals\nDebt issues and options,\nBack to work calculations\nBudgeting advice.\nlegal Clinics - We work with a number of local solicitors who provide free legal clinics at our centres.\nSessions are delivered out of each of our centres and work in partnership with Shelter within Blackburn Library.\nWe offer 1-to-1 sessions by experienced staff offering support and impartial advice to those in need." ] ]
      }
    , { id = 5
      , name = "Volunteering & Mentoring"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Use your Skills, Life Experiences and Spare Time to Support Others, Volunteers are at the heart of our centres. If you want to get involved, meet new people, learn new skills or rediscover old ones then please get in touch with your local centre. We have lots of projects and work streams were we are dependent on Volunteers and Mentor and we also need general volunteers and mentors as there are times in all our lives when we could really benefit from the help of another person. We might just want someone to discuss options with, someone to talk through ideas for the future or support with forms and appointments or advice on the internal services we can offer. Mentoring offers you the opportunity to develop a relationship that is based on trust, confidentiality and mutual involvement to set goals and decide achievements. Your sessions will involve setting personal goals, guidance and action planning to help a successful outcome."
                    ]
                ]
      }
    , { id = 6
      , name = "Women in Crisis"
      , isVisible = False
      , description = section [ class "description-service pa3 gray" ] [ p [] [ text " We continue to build upon the recommendations of Baroness Corston’s 2007 report into women in the criminal justice system and have developed a package of services which provide a gendered considered response to the issues of female offending behaviour. Using this approach, we support a number of localised multi agency programmes where we are able to use our expertise in the provision of gender specific interventions to improve outcomes for women. We now offer a package of services which work with women at all points in the criminal justice system, as well as women at risk of offending, placing staff within police custody and prison settings to support engagement as well as further extending our community provision." ] ]
      }
    , { id = 7
      , name = "Meeting Others"
      , isVisible = False
      , description = section [ class "description-service pa3 gray" ] [ p [] [ text "Our Peer Support Groups i.e. BETTER TOGETHER - for continued Mental Health & Wellbeing Come along to this informal, friendly peer support group for a brew & chat" ] ]
      }
    ]
