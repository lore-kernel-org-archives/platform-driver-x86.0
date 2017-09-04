From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH 00/11] mux/typec: Add USB / TypeC mux drivers and hook
 them up on some x86 systems
Date: Mon, 4 Sep 2017 13:18:58 +0200
Message-ID: <56a7fa03-013c-8d7d-a914-a4dc1f879647@axentia.se>
References: <20170901214845.7153-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170901214845.7153-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, Stephen Boyd <stephen.boyd@linaro.org>
List-Id: platform-driver-x86.vger.kernel.org

On 2017-09-01 23:48, Hans de Goede wrote:
> Hi All,
> 
> This series consists of 4 parts:
> 
> 1) Core mux changes to add support for getting mux-controllers on
>    non DT platforms and to add some standardised state values for USB
> 
> 2) Add Intel CHT USB mux and Pericom-PI3USB30532 Type-C mux drivers
> 
> 3) Hookup the Intel CHT USB mux driver for CHT devices without Type-C
> 
> 4) Hookup both the Intel CHT USB mux and Pericom-PI3USB30532 Type-C mux
>    drivers to the fusb302 Type-C port controller found on some CHT x86 devs
> 
> Please review, or in the case of the drivers/mux changes (which are a dep
> for some of the other patches) merge if the patches are ready.

Hi Hans,

I see commonalities with this and the below patch seriess from Stephen
Boyd [added to Cc].

https://lkml.org/lkml/2017/7/11/696 [PATCH 0/3] USB Mux support for Chipidea
https://lkml.org/lkml/2017/7/14/654 [PATCH v2 0/3] USB Mux support for Chipidea

Stephen had a patch that added mux_control_get_optional() that I think
could be of use for this series?

Anyway, there seems to be some interest in using the mux subsystem for
handling the USB host/device role. I think the role-switch interface
between the USB and mux subsystems should be done similarly, regardless
of what particular USB driver needs to switch role using whatever
particular mux driver. If at all possible.

The way I read it, the pi3usb30532 driver is the one adding the need to
involve the DP states and the inverted bit. Those things are not used by
anything else, and I think it clutters up things for everybody when the
weird needs of one driver "invades" the mux states needed to control the
USB role. So, I would like USB role switching to have 2 states, device
and host (0 and 1 is used by the above chipidea code). And then the USB
switch can of course be idle, which is best represented with one of
MUX_IDLE_DISCONNECT, MUX_IDLE_AS_IS or one of the modes depending on if
the USB switch can or can't disconnect (or other considerations). Now,
you can't explicitly set the idle state using mux_control_select(), it
can only be set implicitly using mux_control_deselect(), so that will
require some changes in the consumer logic.

Regarding the pi3usb30532 driver, I think the above is in fact also
better since the "swap bit" means something totally different when the
switch is "open" (if I read the datasheet correctly).

I.e. PI3USB30532_CONF_OPEN | PI3USB30532_CONF_SWAP is not sane, and that
would just go away completely if the driver implemented MUX_IDLE_DISCONNECT
as PI3USB30532_CONF_OPEN and removed the possibility to explicitly set the
"open" state with mux_control_select().

So, I think the generic USB role switch interface should be something like:

#define MUX_USB_DEVICE		(0) /* USB device mode */
#define MUX_USB_HOST		(1) /* USB host mode */

And then the pi3usb30532 driver can extend that:

#define MUX_PI3USB30352_HOST_AND_DP_SRC	(2)    /* USB host + 2 lanes Display Port */
#define MUX_PI3USB30352_DP_SRC		(3)    /* 4 lanes Display Port source */
#define MUX_PI3USB30352_POLARITY_INV	BIT(2) /* Polarity inverted bit */
#define MUX_PI3USB30352_STATES		(8)

Another idea is to expose the inverted bit as a separate mux controller,
but I suspect that you're not too keen on operating three muxes in the
tcpm driver... That will get simpler with mux_control_get_optional() though.

BTW, I don't think these USB defines belong in mux/consumer.h, please add
them in a new include/linux/mux/usb.h file or something. And I'd like some
MAINTAINER entry to cover the new mux drivers...

I'll respond to the individual patches with nits etc, but it generally looks
tidy, thank you for that!

Cheers,
Peter
