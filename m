From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 09/12] usb: roles: Add Intel XHCI USB role switch driver
Date: Fri, 16 Feb 2018 15:47:04 +0200
Message-ID: <CAHp75VfnqbSecz4y-ThLRPVjTe6jrBPgwEnGEuxb6AunvNDvvg@mail.gmail.com>
References: <20180216104751.8371-1-hdegoede@redhat.com> <20180216104751.8371-10-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180216104751.8371-10-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mathias Nyman <mathias.nyman@intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB <linux-usb@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Feb 16, 2018 at 12:47 PM, Hans de Goede <hdegoede@redhat.com> wrote:
> Various Intel SoCs (Cherry Trail, Broxton and others) have an internal USB
> role switch for swiching the OTG USB data lines between the xHCI host
> controller and the dwc3 gadget controller.
>
> Note on some Cherry Trail systems there is ACPI/AML code listening to
> edge interrupts on the id-pin (through an _AIE ACPI method) and switching
> the role between ROLE_HOST and ROLE_NONE based on the id-pin. Note it does
> not set the role to ROLE_DEVICE, because device-mode is usually not used
> under Windows.
>
> The presence of AML code which modifies the cfg0 reg (on some systems)
> means that we our read/write/modify of cfg0 may race with the AML code
> doing the same to avoid this we take the global ACPI lock while doing
> the read/write/modify.

> +/* register definition */
> +#define DUAL_ROLE_CFG0                 0x68
> +#define SW_VBUS_VALID                  (1 << 24)
> +#define SW_IDPIN_EN                    (1 << 21)
> +#define SW_IDPIN                       (1 << 20)
> +
> +#define DUAL_ROLE_CFG1                 0x6c
> +#define HOST_MODE                      (1 << 29)

Does it make sense to use BIT() macro above?


> +struct intel_xhci_acpi_match {
> +       const char *hid;
> +       int hrv;
> +};

Consider to unify with struct acpi_ac_bl.

> +static const struct intel_xhci_acpi_match allow_userspace_ctrl_ids[] = {
> +       { "INT33F4",  3 }, /* X-Powers AXP288 PMIC */
> +};
> +
> +static int intel_xhci_usb_set_role(struct device *dev, enum usb_role role)
> +{
> +       struct intel_xhci_usb_data *data = dev_get_drvdata(dev);
> +       unsigned long timeout;
> +       acpi_status status;

> +       u32 glk = -1U;

I prefer to see consistency and moreover less confusing set, like

~0U

> +       u32 val;
> +
> +       /*
> +        * On many CHT devices ACPI event (_AEI) handlers read / modify /
> +        * write the cfg0 register, just like we do. Take the ACPI lock
> +        * to avoid us racing with the AML code.
> +        */
> +       status = acpi_acquire_global_lock(ACPI_WAIT_FOREVER, &glk);

FOREVER?!
Wouldn't be slightly long under certain circumstances?

> +       if (ACPI_FAILURE(status) && status != AE_NOT_CONFIGURED) {
> +               dev_err(dev, "Error could not acquire lock\n");
> +               return -EIO;
> +       }

> +       acpi_release_global_lock(glk);

> +       /* Polling on CFG1 register to confirm mode switch.*/
> +       do {
> +               val = readl(data->base + DUAL_ROLE_CFG1);

> +               if (!!(val & HOST_MODE) == (role == USB_ROLE_HOST))

I would prefer ^ instead of first ==, but it's up to you.

> +                       return 0;
> +
> +               /* Interval for polling is set to about 5 - 10 ms */
> +               usleep_range(5000, 10000);
> +       } while (time_before(jiffies, timeout));
> +
> +       dev_warn(dev, "Timeout waiting for role-switch\n");
> +       return -ETIMEDOUT;
> +}

> +static int intel_xhci_usb_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct intel_xhci_usb_data *data;
> +       struct resource *res;
> +       resource_size_t size;
> +       int i, ret;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);

> +       size = (res->end + 1) - res->start;

resource_size()

> +       data->base = devm_ioremap_nocache(dev, res->start, size);

So, what's wrong with devm_ioremap_resource() ?
...which also prints an error message.

> +       if (IS_ERR(data->base)) {
> +               ret = PTR_ERR(data->base);

> +               dev_err(dev, "Error iomaping registers: %d\n", ret);

At least printing return code is useless. Driver core does this.

> +               return ret;
> +       }
> +

> +       data->role_sw = usb_role_switch_register(dev, &sw_desc);
> +       if (IS_ERR(data->role_sw)) {
> +               ret = PTR_ERR(data->role_sw);

> +               dev_err(dev, "Error registering role-switch: %d\n", ret);

Ditto.

> +               return ret;
> +       }
> +
> +       return 0;
> +}

> +static const struct platform_device_id intel_xhci_usb_table[] = {
> +       { .name = DRV_NAME },

> +       {},

No comma, please.

> +};

-- 
With Best Regards,
Andy Shevchenko
