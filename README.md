# Medallia DXA Flutter Sample Apps

Two sample apps implementing the Flutter Medallia DXA SDK.

# sample_nav_1

A sample app to help implement Medallia DXA on a Flutter app using navigation API 1.0. DXA SDK for Flutter documentation: https://developer.medallia.com/medallia-dxa/docs/getting-started-3

## Tab bars

Routing-wise, there are two ways to build a tab bar layout:

1. Every tab has its own route, e.g. TabBarScreenIndividual.
Every tab manages its own Navigator, which in turn creates a Route for the tab and any new screens created inside this tab.
The SDK considers each tab as its own, and thus will result in discrete screens when switching between tabs. 

2. All tabs are in the same route, e.g. TabBarScreenGroup.
The SDK considers every tab to be part of the same screen, because every tab is created in the same route.


# sample_nav_2

A sample app to help implement Medallia DXA on a Flutter app using navigation API 2.0. DXA SDK for Flutter documentation: https://developer.medallia.com/medallia-dxa/docs/getting-started-3


## Popups

On navigation 2.0 popups can be tricky if the app is using the imperative way of API 1.0 to show them, with the method 'showDialog'.

The name provided by the Router Delegate, passed to the SDK using the parameter `screenNameCallback` in the method `setRouterDelegateAndScreenNameCallback`, will be from the last screen handled by the router. 

For example:
The Router has this stack: `['Screen 1 (root)', 'Screen 1 details']`, and a popup is shown using API 1.0. The name for the popup will be 'Screen 1 details'

**This applies to any screen, not just popups**. If the app has a hybrid setup with a Router and imperative navigation, the Router delegate name callback will always override any other screen name provided by
RouteSettings.

If you want to have custom names on popups, the Router has to be aware of this route. This app has an example on how to this: Check on main.dart the 'GoRoute' instance with path: 'custom-dialog', and the custom 'Page' on dialog_page.dart.


