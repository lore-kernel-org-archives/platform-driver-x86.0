From: Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v2 05/11] mux: Add Intel Cherrytrail USB mux driver
Date: Fri,  8 Sep 2017 17:45:12 +0200
Message-ID: <20170908154514.4463-1-peda@axentia.se>
References: <20170905164221.11266-6-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170905164221.11266-6-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Peter Rosin <peda@axentia.se>, MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, devel@driverdev.osuosl.org, Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 2017-09-05 18:42, Hans de Goede wrote:
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
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> -Complete rewrite as a stand-alone platform-driver rather then as a phy
>  driver, since this is just a mux, not a phy
> 
> Changes in v3:
> -Make this a mux subsys driver instead of listening to USB_HOST extcon
>  cable events and responding to those
> 
> Changes in v4 (of patch, v2 of new mux based series):
> -Rename C-file to use - in name
> -Add MAINTAINERS entry
> -Various code-style fixes
> ---
>  MAINTAINERS                     |   5 +
>  drivers/mux/Kconfig             |  11 ++
>  drivers/mux/Makefile            |  10 +-
>  drivers/mux/intel-cht-usb-mux.c | 257 ++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 279 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/mux/intel-cht-usb-mux.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 14a2fd905217..dfaed958db85 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8991,6 +8991,11 @@ F:	include/linux/dt-bindings/mux/
>  F:	include/linux/mux/
>  F:	drivers/mux/
>  
> +MULTIPLEXER SUBSYSTEM INTEL CHT USB MUX DRIVER
> +M:	Hans de Goede <hdegoede@redhat.com>
> +S:	Maintained
> +F:	drivers/mix/intel-cht-usb-mux.c

s/mix/mux/

(also in patch 06/11)

> +
>  MULTISOUND SOUND DRIVER
>  M:	Andrew Veliath <andrewtv@usa.net>
>  S:	Maintained
> diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> index 19e4e904c9bf..947cfd7af02a 100644
> --- a/drivers/mux/Kconfig
> +++ b/drivers/mux/Kconfig
> @@ -34,6 +34,17 @@ config MUX_GPIO
>  	  To compile the driver as a module, choose M here: the module will
>  	  be called mux-gpio.
>  
> +config MUX_INTEL_CHT_USB_MUX
> +	tristate "Intel Cherrytrail USB Multiplexer"
> +	depends on ACPI && X86 && EXTCON
> +	help
> +	  This driver adds support for the internal USB mux for muxing the OTG
> +	  USB data lines between the xHCI host controller and the dwc3 gadget
> +	  controller found on Intel Cherrytrail SoCs.
> +
> +	  To compile the driver as a module, choose M here: the module will
> +	  be called mux-intel_cht_usb_mux.

s/_/-/g

> +
>  config MUX_MMIO
>  	tristate "MMIO register bitfield-controlled Multiplexer"
>  	depends on (OF && MFD_SYSCON) || COMPILE_TEST
> diff --git a/drivers/mux/Makefile b/drivers/mux/Makefile
> index 0e1e59760e3f..6cf41be2754f 100644
> --- a/drivers/mux/Makefile
> +++ b/drivers/mux/Makefile
> @@ -5,9 +5,11 @@
>  mux-core-objs			:= core.o
>  mux-adg792a-objs		:= adg792a.o
>  mux-gpio-objs			:= gpio.o
> +mux-intel-cht-usb-mux-objs	:= intel-cht-usb-mux.o
>  mux-mmio-objs			:= mmio.o
>  
> -obj-$(CONFIG_MULTIPLEXER)	+= mux-core.o
> -obj-$(CONFIG_MUX_ADG792A)	+= mux-adg792a.o
> -obj-$(CONFIG_MUX_GPIO)		+= mux-gpio.o
> -obj-$(CONFIG_MUX_MMIO)		+= mux-mmio.o
> +obj-$(CONFIG_MULTIPLEXER)		+= mux-core.o
> +obj-$(CONFIG_MUX_ADG792A)		+= mux-adg792a.o
> +obj-$(CONFIG_MUX_GPIO)			+= mux-gpio.o
> +obj-$(CONFIG_MUX_INTEL_CHT_USB_MUX)	+= mux-intel-cht-usb-mux.o
> +obj-$(CONFIG_MUX_MMIO)			+= mux-mmio.o
> diff --git a/drivers/mux/intel-cht-usb-mux.c b/drivers/mux/intel-cht-usb-mux.c
> new file mode 100644
> index 000000000000..9cd1a1f5027f
> --- /dev/null
> +++ b/drivers/mux/intel-cht-usb-mux.c
> @@ -0,0 +1,257 @@
> +/*
> + * Intel Cherrytrail USB OTG MUX driver
> + *
> + * Copyright (c) 2016 Hans de Goede <hdegoede@redhat.com>

2017?

> + *
> + * Loosely based on android x86 kernel code which is:
> + *
> + * Copyright (C) 2014 Intel Corp.
> + *
> + * Author: Wu, Hao
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation, or (at your option)
> + * any later version.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/err.h>
> +#include <linux/extcon.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mux/driver.h>
> +#include <linux/mux/usb.h>
> +#include <linux/platform_device.h>
> +#include <linux/workqueue.h>
> +
> +/* register definition */
> +#define DUAL_ROLE_CFG0			0x68
> +#define SW_VBUS_VALID			(1 << 24)
> +#define SW_IDPIN_EN			(1 << 21)
> +#define SW_IDPIN			(1 << 20)
> +
> +#define DUAL_ROLE_CFG1			0x6c
> +#define HOST_MODE			(1 << 29)
> +
> +#define DUAL_ROLE_CFG1_POLL_TIMEOUT	1000
> +
> +#define DRV_NAME			"intel_cht_usb_mux"
> +
> +struct intel_cht_usb_data {
> +	struct mutex cfg0_lock;
> +	void __iomem *base;
> +	struct extcon_dev *vbus_extcon;
> +	struct notifier_block vbus_nb;
> +	struct work_struct vbus_work;
> +};
> +
> +struct intel_cht_extcon_info {
> +	const char *hid;
> +	int hrv;
> +	const char *extcon;
> +};
> +
> +static const struct intel_cht_extcon_info vbus_providers[] = {
> +	{ .hid = "INT33F4", .hrv = -1, .extcon = "axp288_extcon" },
> +	{ .hid = "INT34D3", .hrv =  3, .extcon = "cht_wcove_pwrsrc" },
> +};
> +
> +static const unsigned int vbus_cable_ids[] = {
> +	EXTCON_CHG_USB_SDP, EXTCON_CHG_USB_CDP, EXTCON_CHG_USB_DCP,
> +	EXTCON_CHG_USB_ACA, EXTCON_CHG_USB_FAST,
> +};
> +
> +static int intel_cht_usb_set_mux(struct mux_control *mux, int state)
> +{
> +	struct intel_cht_usb_data *data = mux_chip_priv(mux->chip);
> +	unsigned long timeout;
> +	bool host_mode;
> +	u32 val;
> +
> +	mutex_lock(&data->cfg0_lock);
> +
> +	/* Set idpin value as requested */
> +	val = readl(data->base + DUAL_ROLE_CFG0);
> +	if (state == MUX_USB_DEVICE) {
> +		val |= SW_IDPIN;
> +		host_mode = false;
> +	} else {
> +		val &= ~SW_IDPIN;
> +		host_mode = true;
> +	}
> +	val |= SW_IDPIN_EN;
> +	writel(val, data->base + DUAL_ROLE_CFG0);
> +
> +	mutex_unlock(&data->cfg0_lock);
> +
> +	/* In most case it takes about 600ms to finish mode switching */
> +	timeout = jiffies + msecs_to_jiffies(DUAL_ROLE_CFG1_POLL_TIMEOUT);
> +
> +	/* Polling on CFG1 register to confirm mode switch.*/
> +	while (1) {
> +		val = readl(data->base + DUAL_ROLE_CFG1);
> +		if (!!(val & HOST_MODE) == host_mode)
> +			break;
> +
> +		/* Interval for polling is set to about 5 - 10 ms */
> +		usleep_range(5000, 10000);
> +
> +		if (time_after(jiffies, timeout)) {
> +			dev_warn(&mux->chip->dev,
> +				 "Timeout waiting for mux to switch\n");
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}

I think what Andy was after was something like this (untested):

	do {
		val = readl(data->base + DUAL_ROLE_CFG1);
		if (!!(val & HOST_MODE) == host_mode)
			return 0;

		/* Interval for polling is set to about 5 - 10 ms */
		usleep_range(5000, 10000);
	} while (time_before(jiffies, timeout));

	dev_warn(&mux->chip->dev, "Timeout waiting for mux to switch\n");
	return -ETIMEDOUT;
}

Note that I changed the return value to fail on timeout. I don't know
why you didn't pass on the failure before?

> +
> +static void intel_cht_usb_set_vbus_valid(struct intel_cht_usb_data *data,
> +					     bool valid)
> +{
> +	u32 val;
> +
> +	mutex_lock(&data->cfg0_lock);
> +
> +	val = readl(data->base + DUAL_ROLE_CFG0);
> +	if (valid)
> +		val |= SW_VBUS_VALID;
> +	else
> +		val &= ~SW_VBUS_VALID;
> +
> +	val |= SW_IDPIN_EN;
> +	writel(val, data->base + DUAL_ROLE_CFG0);
> +
> +	mutex_unlock(&data->cfg0_lock);
> +}
> +
> +static void intel_cht_usb_vbus_work(struct work_struct *work)
> +{
> +	struct intel_cht_usb_data *data =
> +		container_of(work, struct intel_cht_usb_data, vbus_work);
> +	bool vbus_present = false;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(vbus_cable_ids); i++) {
> +		if (extcon_get_state(data->vbus_extcon, vbus_cable_ids[i]) > 0) {
> +			vbus_present = true;
> +			break;
> +		}
> +	}
> +
> +	intel_cht_usb_set_vbus_valid(data, vbus_present);
> +}
> +
> +static int intel_cht_usb_vbus_extcon_evt(struct notifier_block *nb,
> +					     unsigned long event, void *param)
> +{
> +	struct intel_cht_usb_data *data =
> +		container_of(nb, struct intel_cht_usb_data, vbus_nb);
> +
> +	schedule_work(&data->vbus_work);
> +
> +	return NOTIFY_OK;
> +}
> +
> +static const struct mux_control_ops intel_cht_usb_ops = {
> +	.set = intel_cht_usb_set_mux,
> +};
> +
> +static int intel_cht_usb_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct intel_cht_usb_data *data;
> +	struct mux_chip *mux_chip;
> +	struct resource *res;
> +	resource_size_t size;
> +	int i, ret;
> +
> +	mux_chip = devm_mux_chip_alloc(dev, 1, sizeof(*data));
> +	if (IS_ERR(mux_chip))
> +		return PTR_ERR(mux_chip);
> +
> +	mux_chip->ops = &intel_cht_usb_ops;
> +	mux_chip->mux[0].idle_state = MUX_USB_DEVICE;
> +	/* Keep initial state as is, for e.g. booting from an USB disk */
> +	mux_chip->mux[0].cached_state = MUX_USB_DEVICE;

This I don't like. The cached_state is owned by the core. But I get that the
initial idle state is special and might also be special for other muxes. So,
I think some sanctioned and explicit way to special case the initial idle
state is the way to go. Honestly, I can't think of more than two sane modes
to initialize a mux though. Either you initialize it to whatever the idle
state is (like what is happening today), or you keep it in it's current
state. So, I'm thinking something like this in the driver should be
sufficient:

	mux_chip->mux[0].init_as_is = true;

I'll reply with a suggested patch implementing that...

[time passes]

When I tried to describe that commit, I realized that I had a very hard
time coming up with something sensible. The problem I had was that if it
is crucial that the mux is left alone, then registering a mux controller
for it may not be the wisest thing to do. Because mux consumers are then
provided with a way to trample on whatever depends on the mux to be in
its specific pre-registration position. The correct thing to do is to wait
with the mux controller registration until it is ok to set it to its idle
state. But maybe that kind of thinking is just utopia?

Another way would be lock the mux controller in a specific state during
registration it. But if there are competing mux consumers it gets hairy
to decide which consumer should be responsible for unselecting it. Seems
like a non-starter to me...

(I obviously have the above comment also for patch 06/11)

Cheers,
Peter

> +	mux_chip->mux[0].states = MUX_USB_STATES;
> +	data = mux_chip_priv(mux_chip);
> +	mutex_init(&data->cfg0_lock);
> +
> +	/*
> +	 * Besides controlling the mux we also need to control the vbus_valid
> +	 * flag for device/gadget mode to work properly. To do this we monitor
> +	 * the extcon interface exported by the PMIC drivers for the PMICs used
> +	 * with the Cherry Trail SoC.
> +	 *
> +	 * We try to get the extcon_dev before registering the mux as this
> +	 * may lead to us exiting with -EPROBE_DEFER.
> +	 */
> +	for (i = 0 ; i < ARRAY_SIZE(vbus_providers); i++) {
> +		if (!acpi_dev_present(vbus_providers[i].hid, NULL,
> +				      vbus_providers[i].hrv))
> +			continue;
> +
> +		data->vbus_extcon = extcon_get_extcon_dev(
> +						vbus_providers[i].extcon);
> +		if (data->vbus_extcon == NULL)
> +			return -EPROBE_DEFER;
> +
> +		dev_info(dev, "using extcon '%s' for vbus-valid\n",
> +			 vbus_providers[i].extcon);
> +		break;
> +	}
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	size = (res->end + 1) - res->start;
> +	data->base = devm_ioremap_nocache(dev, res->start, size);
> +	if (IS_ERR(data->base)) {
> +		ret = PTR_ERR(data->base);
> +		dev_err(dev, "can't iomap registers: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = devm_mux_chip_register(dev, mux_chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (data->vbus_extcon) {
> +		INIT_WORK(&data->vbus_work, intel_cht_usb_vbus_work);
> +		data->vbus_nb.notifier_call = intel_cht_usb_vbus_extcon_evt;
> +		ret = devm_extcon_register_notifier_all(dev, data->vbus_extcon,
> +							&data->vbus_nb);
> +		if (ret) {
> +			dev_err(dev, "can't register vbus extcon notifier: %d\n",
> +				ret);
> +			return ret;
> +		}
> +
> +		/* Sync initial mode */
> +		schedule_work(&data->vbus_work);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct platform_device_id intel_cht_usb_table[] = {
> +	{ .name = DRV_NAME },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(platform, intel_cht_usb_table);
> +
> +static struct platform_driver intel_cht_usb_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +	},
> +	.id_table = intel_cht_usb_table,
> +	.probe = intel_cht_usb_probe,
> +};
> +
> +module_platform_driver(intel_cht_usb_driver);
> +
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("Intel Cherrytrail USB mux driver");
> +MODULE_LICENSE("GPL");
> 
