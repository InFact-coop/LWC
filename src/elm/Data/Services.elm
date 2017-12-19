module Data.Services exposing (..)

import Types exposing (Service)
import Html.Attributes exposing (..)
import Html exposing (..)
import Components.Emphasis exposing (..)


servicesList : List Service
servicesList =
    [ { id = 1
      , name = "Emotional Wellbeing"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Our Emotional Wellbeing services can help you if are experiencing any of the following: low mood, anxiety, worry, panic, bereavement, relationship difficulties, poor sleep and low self-esteem.\n\n\n       Our services are open to anybody over the age of 16 who may be experiencing any of these problems and want to feel better. We also have a number of therapists with specialised skills that can support you to improve your thoughts and feelings and improve your emotional wellbeing.\n          Our services include: \n            Living Well - if you have a long term physical health problem or a physical symptom that cannot be diagnosed.\n \n        Perinatal - if you or your partner is pregnant or have given birth within the last 12 months.\n          Victims of crime - specialist support for adults and children who have been a victim of crime such as: hate crime, domestic or sexual abuse and we can also support with pre-trial therapy.\n            NICU - specialist support if you have had experience of NICU (neonatal intensive care unit) at any time. We understand that this can be a high time of distress for families and we often parents and extended family accessing our mental health services.\n              Talking Therapies enable you to improve your mood, build confidence and self esteem and feel better about your emotional and physical health and have better relationships with others.             "
                    ]
                ]
      }
    , { id = 2
      , name = "Personal Development"
      , isVisible = False
      , description = section [ class "description-service pa3 gray" ] [ p [] [ text "Our training provision provides both entry point into support and progression route within our services, with our programmes designed to deliver a responsive educational programme of wellbeing and mental health recovery focussed workshops and courses. Our MindFit programme of therapeutic courses include the Programme, centred around our recommended route a carefully designed progression package which leads individuals to improved wellbeing.\n        MindFit has been developed to provide a voyage of self discovery, with learners progressing carefully through a series of 5 week long courses.\n\nCourses in the programme include:\n\nThe Planner - the first steps to feeling happier, welcome and at ease in a small group.\n\nThe Journey - leads to feeling stronger, more confident and assertive.\n\nThe Prize - which adds the final touches and polishes new skills to achieve lasting positive changes." ] ]
      }
    , { id = 3
      , name = "Employment Support"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text " Our Employment Support Team provide an individually tailored service for any person looking to gain employment, go into education, volunteering or job searching.Our experienced staff will work with you on a one to one basis to develop your own personal action plan and support you to achieve your goals.\n\nOur package of support includes:\n\nWorkshops and Training Courses to help you build your CV, develop interview skills, build your confidence and identify your strengths and skills.\nVolunteer led work clubs to support with job searching and CV building.\nDigital inclusion and IT support on a 1 to 1 or group basis.\nSupport to find the right training course and qualifications.\nVolunteer placement opportunities to enhance your portfolio and develop your work skills.\nMoney advice and support.\nSupport find the right childcare provision\nAccess to therapeutic services, including one to one support and group activity to boost your confidence and self-esteem. legal Clinics - We work with a number of local solicitors who provide free legal clinics at our centres."
                    ]
                ]
      }
    , { id = 4
      , name = "Money, Debt & Benefit Advice"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Lancashire Women's Centres offer a Financial Conduct Authority (FCA) regulated "
                    , emphasis "debt counselling and money advice"
                    , text " appointments offering a range of services. These include:"
                    ]
                , ul
                    []
                    [ li [] [ text "Benefit advice including rent arrears" ]
                    , li [] [ text "Benefit applications" ]
                    , li [] [ text "Mandatory reconsiderations and appeals" ]
                    , li [] [ text "Debt issues and options" ]
                    , li [] [ text "Back to work calculations" ]
                    , li [] [ text "Budgeting advice" ]
                    , li [] [ text "Legal Clinics" ]
                    ]
                , p
                    []
                    [ text "We work with a number of local solicitors who provide "
                    , emphasis "free legal clinics"
                    , text " at our centres. Sessions are delivered out of each of our centres and work in partnership with Shelter within Blackburn Library. We offer "
                    , emphasis "1-to-1 sessions"
                    , text " by experienced staff offering "
                    , emphasis "support and impartial advice"
                    , text " to those in need."
                    ]
                ]
      }
    , { id = 5
      , name = "Volunteering & Mentoring"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Use your "
                    , emphasis " Skills"
                    , text ", "
                    , emphasis "Life Experiences"
                    , text " and "
                    , emphasis "Spare Time"
                    , text " to "
                    , emphasis "Support Others"
                    , text ". Volunteers are at the heart of our centres. If you want to get involved, meet new people, learn new skills or rediscover old ones then please get in touch with your local centre. We have "
                    , emphasis "lots of projects"
                    , text " and work streams where we are dependent on Volunteers and Mentors, just as we also need general volunteers and mentors as there are times in all our lives when we could really benefit from the "
                    , emphasis "help of another person"
                    , text ". We might just want someone to "
                    , emphasis "discuss options with"
                    , text ", someone to talk through "
                    , emphasis "ideas for the future"
                    , text " or support with forms and appointments or advice on the internal services we can offer. Mentoring offers you the opportunity to develop a "
                    , emphasis "relationship that is based on trust"
                    , text ", confidentiality and mutual involvement to set goals and decide achievements. Your sessions will involve "
                    , emphasis "setting personal goals, guidance"
                    , text " and "
                    , emphasis "action planning"
                    , text " to help a successful outcome."
                    ]
                ]
      }
    , { id = 6
      , name = "Women in Crisis"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text " We continue to build upon the recommendations of Baroness Corston’s 2007 report into "
                    , emphasis "women in the criminal justice system"
                    , text " and have developed a package of services which provide a gendered considered response to the issues of "
                    , emphasis "female offending behaviour"
                    , text ". Using this approach, we support a number of localised multi agency programmes where we are able to use our expertise in the provision of gender specific interventions to "
                    , emphasis "improve outcomes for women"
                    , text ". We now offer a package of services which work with women at all points in the criminal justice system, as well as "
                    , emphasis "women at risk of offending"
                    , text ", placing staff within police custody and prison settings to support engagement as well as further extending our community provision."
                    ]
                ]
      }
    , { id = 7
      , name = "Meeting Others"
      , isVisible = False
      , description =
            section [ class "description-service pa3 gray" ]
                [ p []
                    [ text "Our Peer Support Groups (i.e. "
                    , emphasis "BETTER TOGETHER"
                    , text ") are for continued "
                    , emphasis "Mental Health & Wellbeing"
                    , text ". Come along to this informal, friendly "
                    , emphasis "Peer Support group"
                    , text " for a brew & chat"
                    ]
                ]
      }
    ]
