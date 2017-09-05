From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 00/11] mux/typec: Add USB / TypeC mux drivers and hook
 them up on some x86 systems
Date: Tue, 5 Sep 2017 12:54:30 +0200
Message-ID: <3ad961e0-7c69-fbb8-7282-afdadecf03cc@redhat.com>
References: <20170901214845.7153-1-hdegoede@redhat.com>
 <56a7fa03-013c-8d7d-a914-a4dc1f879647@axentia.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56a7fa03-013c-8d7d-a914-a4dc1f879647@axentia.se>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Rosin <peda@axentia.se>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: platform-driver-x86.vger.kernel.org

Hi Peter,

On 04-09-17 13:18, Peter Rosin wrote:
> On 2017-09-01 23:48, Hans de Goede wrote:
>> Hi All,
>>
>> This series consists of 4 parts:
>>
>> 1) Core mux changes to add support for getting mux-controllers on
>>     non DT platforms and to add some standardised state values for USB
>>
>> 2) Add Intel CHT USB mux and Pericom-PI3USB30532 Type-C mux drivers
>>
>> 3) Hookup the Intel CHT USB mux driver for CHT devices without Type-C
>>
>> 4) Hookup both the Intel CHT USB mux and Pericom-PI3USB30532 Type-C mux
>>     drivers to the fusb302 Type-C port controller found on some CHT x86 devs
>>
>> Please review, or in the case of the drivers/mux changes (which are a dep
>> for some of the other patches) merge if the patches are ready.
> 
> Hi Hans,
> 
> I see commonalities with this and the below patch seriess from Stephen
> Boyd [added to Cc].
> 
> https://lkml.org/lkml/2017/7/11/696 [PATCH 0/3] USB Mux support for Chipidea
> https://lkml.org/lkml/2017/7/14/654 [PATCH v2 0/3] USB Mux support for Chipidea

Interesting, it seems that Stephen and I are trying to use the mux-framework
for identical (device/host selection) purposes, except that in some cases
I also gave a Type-C cross-switch to deal with.

I noticed this discussion in the thread:

"""
 > +		usb-switch-states = <0>, <1>;

I don't see the need for usb-switch-states? Just assume states 0/1 and
if someone later needs some other states, make them add a property that
overrides the defaults. Just document that 0 is host and 1 is device.
"""

I think it makes sense to just agree on fixed "state" values for
certain use-cases, as done in my
"mux: consumer.h: Add MUX_USB_* state constant defines"
patch. This means that the "state" register in the hardware and the
state as passed to mux_control_select() may not map 1:1, but that can
easily be mapped in the driver and it allows inter-changeble (compatible)
mux drivers for some common mux use-cases such as an USB device/host
mux.

Edit: Ah I see you already suggest this below, good :)

> Stephen had a patch that added mux_control_get_optional() that I think
> could be of use for this series?

Ack, I think that would be useful. If you plan to merge Stephen's
patch for this, please give me a link to a git repo with that merged
then I will rebase my series on top.

> Anyway, there seems to be some interest in using the mux subsystem for
> handling the USB host/device role. I think the role-switch interface
> between the USB and mux subsystems should be done similarly, regardless
> of what particular USB driver needs to switch role using whatever
> particular mux driver. If at all possible. >
> The way I read it, the pi3usb30532 driver is the one adding the need to
> involve the DP states and the inverted bit.

Correct, the pi3usb30532 mux is a mux designed for Type-C ports, it
switches to 4 high-speed differential data-pairs the Type-C connector
has to one on: USB-controller(s), DisplayPort outputs on the GPU, or
a combination of both (2 data-pairs to each). It also takes into account
if the Type-C connector has been inserted normally or "upside-down",
which is where the inverted bits comes into play.

> Those things are not used by
> anything else, and I think it clutters up things for everybody when the
> weird needs of one driver "invades" the mux states needed to control the
> USB role. So, I would like USB role switching to have 2 states, device
> and host (0 and 1 is used by the above chipidea code). And then the USB
> switch can of course be idle, which is best represented with one of
> MUX_IDLE_DISCONNECT, MUX_IDLE_AS_IS or one of the modes depending on if
> the USB switch can or can't disconnect (or other considerations). Now,
> you can't explicitly set the idle state using mux_control_select(), it
> can only be set implicitly using mux_control_deselect(), so that will
> require some changes in the consumer logic.
> 
> Regarding the pi3usb30532 driver, I think the above is in fact also
> better since the "swap bit" means something totally different when the
> switch is "open" (if I read the datasheet correctly >
> I.e. PI3USB30532_CONF_OPEN | PI3USB30532_CONF_SWAP is not sane,

The only "datasheet" I could find is "PI3USB30532-PI3USB31532_App_Type-C application Note_Rev.A.pdf"
and that says the swap bits does not do anything when the switch is "open"
but that does not matter for the rest of the discussion, I do agree
that mapping deselected to open makes sense.

> and that
> would just go away completely if the driver implemented MUX_IDLE_DISCONNECT
> as PI3USB30532_CONF_OPEN and removed the possibility to explicitly set the
> "open" state with mux_control_select().
> 
> So, I think the generic USB role switch interface should be something like:
> 
> #define MUX_USB_DEVICE		(0) /* USB device mode */
> #define MUX_USB_HOST		(1) /* USB host mode */

Those 2 work for me.

> And then the pi3usb30532 driver can extend that:
> 
> #define MUX_PI3USB30352_HOST_AND_DP_SRC	(2)    /* USB host + 2 lanes Display Port */
> #define MUX_PI3USB30352_DP_SRC		(3)    /* 4 lanes Display Port source */
> #define MUX_PI3USB30352_POLARITY_INV	BIT(2) /* Polarity inverted bit */
> #define MUX_PI3USB30352_STATES		(8)

Erm, I would like to keep mux-driver specific knowledge out of the
tcpm code and there might be more Type-C mux drivers in the future,
how about:

#define MUX_TYPEC_POLARITY_INV    BIT(0)   /* Polarity inverted bit */
#define MUX_TYPEC_DEVICE          (0 << 1) /* USB device mode */
#define MUX_TYPEC_HOST            (1 << 1) /* USB host mode */
#define MUX_TYPEC_HOST_AND_DP_SRC (2 << 1) /* USB host + 2 lanes Display Port */
#define MUX_TYPEC_DP_SRC          (3 << 1) /* 4 lanes Display Port source */
#define MUX_TYPEC_STATES          (4 << 1)

?

> Another idea is to expose the inverted bit as a separate mux controller,
> but I suspect that you're not too keen on operating three muxes in the
> tcpm driver...

That won't be pretty I think, so thanks but no thanks :)

> BTW, I don't think these USB defines belong in mux/consumer.h, please add
> them in a new include/linux/mux/usb.h file or something. And I'd like some
> MAINTAINER entry to cover the new mux drivers...

Ok, I will fix both for the next version

> I'll respond to the individual patches with nits etc, but it generally looks
> tidy, thank you for that!

Thank you for all the feedback and reviews.

Regards,

Hans
