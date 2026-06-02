---
html_theme.sidebar_secondary.remove:
sd_hide_title: true
---

<!-- CSS overrides on the homepage only -->
<style>
.bd-main .bd-content .bd-article-container {
  max-width: 70rem; /* Make homepage a little wider instead of 60em */
}
/* Override all h1 headers except for the hidden ones */
h1:not(.sd-d-none) {
  font-weight: bold;
  font-size: 48px;
  text-align: center;
  margin-bottom: 4rem;
}
/* Override all h3 headers that are not in hero */
h3:not(#hero h3) {
  font-weight: bold;
  text-align: center;
}
</style>

(homepage)=
# NWM Evaluation Manager

# NWM Evaluation & Verification

`nwm_eval_mgr` is a Python package that conducts evaluation and verification for NWM/NextGen simulations, hindcasts, and forecasts. It provides tools for data retrieval, forecast and observation pairing, metric computation, and visualization to assess the performance of NWM/NextGen products against observations and reference datasets. The package is designed to be flexible and customizable, allowing users to tailor their evaluation workflows to specific needs and datasets. With `nwm_eval_mgr`, users can gain insights into the strengths and weaknesses of NWM/NextGen products, identify areas for improvement, and ultimately enhance the skill of hydrologic forecasts.

![overview](_images/plots_collage.png)

----


:::{toctree}
:maxdepth: 1
:hidden:

User Guide<user_guide.rst>
FAQ<faq.rst>
Configuration<config.md>
Technical Reference <tech_reference/index.md>
API </API/index.rst>
:::