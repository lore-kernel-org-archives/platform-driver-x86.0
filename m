From: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 05/11] mux: Add Intel Cherrytrail USB mux driver
Date: Sat, 2 Sep 2017 13:19:05 +0300
Message-ID: <CAHp75VfEmHMTh_p==2_O6R4dqzUTDr9-qpQ2n9NQ77=teAkqRg@mail.gmail.com>
References: <20170901214845.7153-1-hdegoede@redhat.com> <20170901214845.7153-6-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901214845.7153-6-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Heikki Krogerus <heikki.krogerus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Andy Shevchenko <andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Platform Driver <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, USB <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Sep 2, 2017 at 12:48 AM, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> Intel Cherrytrail SoCs have an internal USB mux for muxing the otg-port
> USB data lines between the xHCI host controller and the dwc3 gadget
> controller. On some Cherrytrail systems this mux is controlled through
> AML code reacting on a GPIO IRQ connected to the USB OTG id pin (through
> an _AIE ACPI method) so things just work.
>
> But on other Cherrytrail systems we need to control the mux ourselves
> this driver exports the mux through the mux subsys, so that other drivers
> can control it if necessary.
>
> This driver also updates the vbus-valid reporting to the dwc3 gadget
> controller, as this uses the same registers as the mux. This is needed
> for gadget/device mode to work properly (even on systems which control
> the mux from their AML code).
>
> Note this depends on the xhci driver registering a platform device
> named "intel_cht_usb_mux", which has an IOMEM resource 0 which points
> to the Intel Vendor Defined XHCI extended capabilities region.

> +static void intel_cht_usb_mux_set_sw_mode(struct intel_cht_usb_mux *mux)
> +{
> +       u32 data;
> +
> +       data = readl(mux->base + DUAL_ROLE_CFG0);

> +       if (!(data & SW_IDPIN_EN)) {

Do we need it? I think this kind of microoptimixzations not worth it
for most cases.

> +               data |= SW_IDPIN_EN;
> +               writel(data, mux->base + DUAL_ROLE_CFG0);
> +       }
> +}

> +       /* In most case it takes about 600ms to finish mode switching */
> +       timeout = jiffies + msecs_to_jiffies(DUAL_ROLE_CFG1_POLL_TIMEOUT);
> +
> +       /* Polling on CFG1 register to confirm mode switch.*/

> +       while (1) {

do {} while (time_before()); ?

> +               data = readl(mux->base + DUAL_ROLE_CFG1);
> +               if (!!(data & HOST_MODE) == host_mode)
> +                       break;
> +
> +               /* Interval for polling is set to about 5 - 10 ms */
> +               usleep_range(5000, 10000);
> +
> +               if (time_after(jiffies, timeout)) {
> +                       dev_warn(&mux_ctrl->chip->dev,
> +                                "Timeout waiting for mux to switch\n");
> +                       break;
> +               }
> +       }


> +static void intel_cht_usb_mux_vbus_work(struct work_struct *work)
> +{
> +       struct intel_cht_usb_mux *mux =
> +               container_of(work, struct intel_cht_usb_mux, vbus_work);
> +       bool vbus_present = false;
> +       int i;

unsigned int i; ?

> +
> +       for (i = 0; i < ARRAY_SIZE(vbus_cable_ids); i++) {
> +               if (extcon_get_state(mux->vbus_extcon, vbus_cable_ids[i]) > 0) {
> +                       vbus_present = true;
> +                       break;
> +               }
> +       }
> +
> +       intel_cht_usb_mux_set_vbus_valid(mux, vbus_present);
> +}

> +static int intel_cht_usb_mux_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct intel_cht_usb_mux *mux;
> +       struct mux_chip *mux_chip;
> +       struct resource *res;
> +       resource_size_t size;

> +       int i, ret;

Ditto.

> +       for (i = 0 ; i < ARRAY_SIZE(vbus_providers); i++) {
> +               if (!acpi_dev_present(vbus_providers[i].hid, NULL,
> +                                     vbus_providers[i].hrv))
> +                       continue;

-- 
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
