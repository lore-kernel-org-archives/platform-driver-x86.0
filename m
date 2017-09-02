From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 03/11] mux: consumer.h: Add MUX_USB_* state constant defines
Date: Sat, 2 Sep 2017 13:10:42 +0300
Message-ID: <CAHp75Ve_x+NaX=yw=JtL9b2napKmLcNQTJ_bWxpQy1jX4MEdYA@mail.gmail.com>
References: <20170901214845.7153-1-hdegoede@redhat.com> <20170901214845.7153-4-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f171.google.com ([209.85.216.171]:36815 "EHLO
        mail-qt0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752243AbdIBKKn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Sep 2017 06:10:43 -0400
In-Reply-To: <20170901214845.7153-4-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Peter Rosin <peda@axentia.se>, Mathias Nyman <mathias.nyman@intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, USB <linux-usb@vger.kernel.org>

On Sat, Sep 2, 2017 at 12:48 AM, Hans de Goede <hdegoede@redhat.com> wrote:
> Add MUX_USB_* state constant defines, which can be used by USB
> device/host and Type-C polarity/role/altmode mux drivers and consumers
> to ensure that they agree on the meaning of the mux_control_select()
> state argument.

> +/*
> + * Mux state values for USB muxes, used for both USB device/host role muxes
> + * as well as for Type-C polarity/role/altmode muxes.
> + *
> + * MUX_USB_POLARITY_INV may be or-ed together with any other mux-state as
> + * inverted-polarity (Type-C plugged in upside down) can happen with any
> + * other mux-state.
> + */
> +#define MUX_USB_POLARITY_INV   BIT(0)   /* Polarity inverted bit */
> +#define MUX_USB_NONE           (1 << 1) /* Mux open / not connected */
> +#define MUX_USB_DEVICE         (2 << 1) /* USB device mode */
> +#define MUX_USB_HOST           (3 << 1) /* USB host mode */
> +#define MUX_USB_HOST_AND_DP_SRC        (4 << 1) /* USB host + 2 lanes Display Port */
> +#define MUX_USB_DP_SRC         (5 << 1) /* 4 lanes Display Port source */
> +#define MUX_USB_STATES         (6 << 1)

I would put OR'ed bits higher.

Like allocate 4 (8) bits for states and start special flagst from bit
8 and so on.


-- 
With Best Regards,
Andy Shevchenko
