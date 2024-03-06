# sample_nav_1

A sample app to help implement Medallia DXA on a Flutter app using navigation API 1.0. DXA SDK for Flutter documentation: https://developer.medallia.com/medallia-dxa/docs/getting-started-3

## Tab bars

Routing-wise, there are two ways to build a tab bar layout:

1. Every tab has its own route, e.g. TabBarScreenIndividual.
Every tab manages its own Navigator, which in turn creates a Route for the tab and any new screens created inside this tab.
The SDK considers each tab as its own, and thus will result in discrete screens when switching between tabs. 

2. All tabs are in the same route, e.g. TabBarScreenGroup.
The SDK considers every tab to be part of the same screen, because every tab is created in the same route.