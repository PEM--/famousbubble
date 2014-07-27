## Rationals behind HTML DOM declared as JS
* **TODO**

## Rationals behind CSS rules declared as JS
* At least, one RTT and one latency for lading a CSS file.
* Avoid declaring multiple variables on the same topic.
* Control over 'when the rules are injected'.
* Modification on the fly for changing theming without relying on a new CSS file.
* Capability to debug the rule during their injection on the client with breakpoint at the injection time.
* Injection of rule depending on feature detection avoiding unused rules to be injected.
* Better mixins in JS than in CSS.
* Removal of vendor-prefix hell also via feature detection and closures (a polyfill approach).
* Componentization via a single JS file carrying the HTML as Web API and the CSS as CSSOM rules.
* **Probably**: For creating a DSL oriented feature like Emmet for reducing the load while retaining a well-known short syntax.
* **Maybe (but in study)**: For using a constraints based approach for layout calculation (the simplex method from the mathematician Dantzig).
* **Maybe (but also in study)**: For using a physic engine based approach also for the layout calculation.
