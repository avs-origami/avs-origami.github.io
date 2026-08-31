**[Battery-Free Wireless Sensing with Neuromorphic Cameras        05/2023 - 09/2023]**

This project developed a set of a set of low-power remote sensing devices that
are powered exclusively by solar energy harvesting and are able to encode and
transmit a wide variety of data through the use of a neuromorphic camera to
process visible-light signals.

The contributions presented in the paper are roughly divided into two distinct
components: digital sensing tags, which use a microprocessor to transmit
binary encoded signals, and analong sensing tags, which operate without a
microprocessor to directly convert analog signals into signals via frequency
modulation. My work consisted primarily of developing the design of the analog
sensing tags, including the mechanism for encoding and transmitting various
types of sensor data as well as refining some parts of the energy harvesting
circuit that was used in the final design of both the analog and digital sensing
tags. I additionally began the experiments with the microphone sensor option
that was presented for the analog tags, and first confirmed that the captured
spectral data from the microphone was rich enough to perform machine learning
inference to distinguish between various classes of sounds, and further
experimented with reconstructing the original audio from the transmitted data.

I worked alongside a team of graduate researchers, and they published the final
draft of the paper in the September 2024 issue of ACM IMWUT. The PDF can be
found at [https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf], and my
contributions specifically can be found in the following places:

  - Most of the hardware design presented in [Section 5](https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf#section.5) (the analog NeuroCamTags)
    including the circuit design ([Fig. 7](https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf#page=9)!), which contains few modifications from
    the design I originally developed

  - The specific choice of solar panels ([Section 4.1](https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf#subsection.4.1)!) and timer IC ([Section 5.1](https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf#subsection.5.1)!)
    that effectively balance size constraints with providing a consistent power
    source that is effective for both the digital and analog sensing devices

  - Initial experimentation with using machine learning to classify different
    sounds captured by the microphone sensor, which was later refined by other
    team members ([Fig. 15](https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf#page=17) and [Section 7.2](https://epic.eecs.utk.edu/files/NeuroCamTag_Final_ACM_IMWUT.pdf#subsection.7.2)!)

I additionally made several contributions that were not included in the paper,
but were still pivotal in driving the paper in the direction it eventually took:

  - Preliminary PCB design of the analog sensing tags

  - Experiments with the analog tags to mitigate the impacts of fluctuating
    light levels on the effective operation of the devices

  - Testing various low-power LEDs to reduce the minimum power requirements
    while ensuring that the signal was bright enough to be detected

This work was performed under the mentorship of Prof. Sai Swaminathan at the
EPIC Lab in the EECS department at the University of Tennessee, Knoxville.

[<<< Go back](/projects)