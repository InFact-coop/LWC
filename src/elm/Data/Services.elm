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
                , a [ href "#talk-to-us", class "no-underline tc flex justify-center" ]
                    [ p [ class "tc no-underline w-50 pt2 pb2 pl3 pr3 bg-purple br1 white dim" ] [ text "Contact us" ]
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
                , a [ href "#talk-to-us", class "no-underline tc flex justify-center" ]
                    [ p [ class "tc no-underline w-50 pt2 pb2 pl3 pr3 bg-purple br1 white dim" ] [ text "Contact us" ]
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
                , a [ href "#talk-to-us", class "no-underline tc flex justify-center" ]
                    [ p [ class "tc no-underline w-50 pt2 pb2 pl3 pr3 bg-purple br1 white dim" ] [ text "Contact us" ]
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
                , a [ href "#talk-to-us", class "no-underline tc flex justify-center" ]
                    [ p [ class "tc no-underline w-50 pt2 pb2 pl3 pr3 bg-purple br1 white dim" ] [ text "Contact us" ]
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
                    , text "."
                    ]
                , p []
                    [ text "Volunteers are at the heart of our centres. If you want to get involved, meet new people, learn new skills or rediscover old ones then please get in touch with your local centre. We have "
                    , emphasis "lots of projects"
                    , text " and work streams where we are dependent on Volunteers and Mentors, just as we also need general volunteers and mentors as there are times in all our lives when we could really benefit from the "
                    , emphasis "help of another person"
                    , text ". We might just want someone to "
                    , emphasis "discuss options with"
                    , text ", someone to talk through "
                    , emphasis "ideas for the future"
                    , text " or support with forms and appointments or advice on the internal services we can offer."
                    ]
                , p []
                    [ text " Mentoring offers you the opportunity to develop a "
                    , emphasis "relationship that is based on trust"
                    , text ", confidentiality and mutual involvement to set goals and decide achievements. Your sessions will involve "
                    , emphasis "setting personal goals, guidance"
                    , text " and "
                    , emphasis "action planning"
                    , text " to help a successful outcome."
                    ]
                , a [ href "http://womenscentre.org/how-you-can-help/volunteer", class "no-underline tc flex justify-center" ]
                    [ p [ class "tc no-underline w-50 pt2 pb2 pl3 pr3 bg-purple br1 white dim" ] [ text "Find out more" ]
                    ]
                ]
      }
    , { id = 6
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
                , a [ href "#talk-to-us", class "no-underline tc flex justify-center" ]
                    [ p [ class "tc no-underline w-50 pt2 pb2 pl3 pr3 bg-purple br1 white dim" ] [ text "Contact us" ]
                    ]
                ]
      }
    ]
