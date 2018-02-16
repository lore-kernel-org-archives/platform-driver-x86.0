From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 08/12] xhci: Add Intel extended cap / otg phy mux handling
Date: Fri, 16 Feb 2018 15:53:30 +0200
Message-ID: <CAHp75VdFXO+r25PPKEvTv61oNSReL9uqbF-ni8Z1YaxAzSze3Q@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-9-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f179.google.com ([209.85.220.179]:34496 "EHLO
        mail-qk0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032862AbeBPNxb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 16 Feb 2018 08:53:31 -0500
In-Reply-To: <20180216104751.8371-9-hdegoede@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> The xHCI controller on various Intel SoCs has an extended cap mmio-range
> which contains registers to control the muxing to the xHCI (host mode)
> or the dwc3 (device mode) and vbus-detection for the otg usb-phy.
>
> Having a role-sw driver included in the xhci code (under drivers/usb/host)
> is not desirable. So this commit adds a simple handler for this extended
> capability, which creates a platform device with the caps mmio region as
> resource, this allows us to write a separate platform role-sw driver for
> the role-switch.
>
> Note this commit adds a call to the new xhci_ext_cap_init() function
> to xhci_pci_probe(), it is added here because xhci_ext_cap_init() must
> be called only once. If in the future we also want to handle ext-caps
> on non pci xHCI HCDs from xhci_ext_cap_init() a call to it should also
> be added to other bus probe paths.

SPDX?

> +/*
> + * XHCI extended capability handling
> + *
> + * Copyright (c) 2017 Hans de Goede <hdegoede@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */

> +       pdev = platform_device_alloc("intel_xhci_usb_sw", PLATFORM_DEVID_NONE);

Perhaps,

#define USB_SW_DRV_NAME "..."

> +       if (!pdev) {
> +               xhci_err(xhci, "couldn't allocate intel_xhci_usb_sw pdev\n");

...and re-use it everywhere here.

pdev -> platform device.

> +               return -ENOMEM;
> +       }
> +
> +       res.start = hcd->rsrc_start + cap_offset;
> +       res.end   = res.start + 0x3ff;

Is this magic always the same? Where its value comes from?
At least define with comment.



> +int xhci_ext_cap_init(struct xhci_hcd *xhci)
> +{
> +       void __iomem *base = &xhci->cap_regs->hc_capbase;
> +       u32 cap_offset, val;
> +       int ret;
> +
> +       cap_offset = xhci_find_next_ext_cap(base, 0, 0);
> +
> +       while (cap_offset) {
> +               val = readl(base + cap_offset);
> +
> +               switch (XHCI_EXT_CAPS_ID(val)) {
> +               case XHCI_EXT_CAPS_VENDOR_INTEL:
> +                       if (xhci->quirks & XHCI_INTEL_USB_ROLE_SW) {

> +                               ret = xhci_create_intel_xhci_sw_pdev(
> +                                                           xhci, cap_offset);

Can we leave xhci on previous line?

> +                               if (ret)
> +                                       return ret;
> +                       }
> +                       break;
> +               }
> +               cap_offset = xhci_find_next_ext_cap(base, cap_offset, 0);
> +       }
> +
> +       return 0;
> +}


-- 
With Best Regards,
Andy Shevchenko
