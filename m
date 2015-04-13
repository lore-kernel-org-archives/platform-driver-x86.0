From: =?ISO-8859-2?Q?Giedrius_Statkevi=E8ius?=
	<giedrius.statkevicius@gmail.com>
Subject: Re: [PATCH] platform: add samsung-wmi driver for newer Samsung
 laptops
Date: Mon, 13 Apr 2015 09:01:10 +0300 (EEST)
Message-ID: <alpine.LNX.2.03.1504130851490.1155@localhost.localdomain>
References: <1428429233-19568-1-git-send-email-gavinli@thegavinli.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:37900 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751382AbbDMGBk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Apr 2015 02:01:40 -0400
Received: by wiun10 with SMTP id n10so54037033wiu.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Apr 2015 23:01:39 -0700 (PDT)
In-Reply-To: <1428429233-19568-1-git-send-email-gavinli@thegavinli.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: gavinli@thegavinli.com
Cc: platform-driver-x86@vger.kernel.org, Gavin Li <git@thegavinli.com>

Hi Gavin Li,

On Tue, 7 Apr 2015, gavinli@thegavinli.com wrote:

> From: Gavin Li <git@thegavinli.com>
> 
> This driver adds support for coarse (on or off) fan control and
> the keyboard backlight on newer Samsung laptops.
> ---
>  drivers/platform/x86/Kconfig       |  10 ++
>  drivers/platform/x86/Makefile      |   1 +
>  drivers/platform/x86/samsung-wmi.c | 221 +++++++++++++++++++++++++++++++++++++
>  3 files changed, 232 insertions(+)
>  create mode 100644 drivers/platform/x86/samsung-wmi.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 9752761..96f4620 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -813,6 +813,16 @@ config SAMSUNG_LAPTOP
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called samsung-laptop.
>  
> +config SAMSUNG_WMI
> +	tristate "Samsung WMI driver (for newer Samsung laptops)"
> +	depends on ACPI
> +	depends on ACPI_WMI
> +	select LEDS_CLASS
> +	select NEW_LEDS
> +	  ---help---
> +	  This driver adds support for coarse (on or off) fan control
> +	  and the keyboard backlight for newer Samsung laptops.
> +
>  config MXM_WMI
>         tristate "WMI support for MXM Laptop Graphics"
>         depends on ACPI_WMI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index f82232b..4c65e51 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -48,6 +48,7 @@ obj-$(CONFIG_XO1_RFKILL)	+= xo1-rfkill.o
>  obj-$(CONFIG_XO15_EBOOK)	+= xo15-ebook.o
>  obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>  obj-$(CONFIG_SAMSUNG_LAPTOP)	+= samsung-laptop.o
> +obj-$(CONFIG_SAMSUNG_WMI)	+= samsung-wmi.o
>  obj-$(CONFIG_MXM_WMI)		+= mxm-wmi.o
>  obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
>  obj-$(CONFIG_INTEL_OAKTRAIL)	+= intel_oaktrail.o
> diff --git a/drivers/platform/x86/samsung-wmi.c b/drivers/platform/x86/samsung-wmi.c
> new file mode 100644
> index 0000000..c93cfe4
> --- /dev/null
> +++ b/drivers/platform/x86/samsung-wmi.c
> @@ -0,0 +1,221 @@
> +/*
> + *  Samsung WMI driver
> + *
> + *  Copyright (C) 2015 Gavin Li <git@thegavinli.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License as published by
> + *  the Free Software Foundation; either version 2 of the License, or
> + *  (at your option) any later version.
> + *
> + *  This program is distributed in the hope that it will be useful,
> + *  but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *  GNU General Public License for more details.
> + *
> + *  You should have received a copy of the GNU General Public License along
> + *  with this program; if not, write to the Free Software Foundation, Inc.,
> + *  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/leds.h>
> +#include <linux/platform_device.h>
> +
> +#define DRIVER_NAME "samsung-wmi"
> +#define WMI_GUID "C16C47BA-50E3-444A-AF3A-B1C348380001"
> +
> +struct samsung_wmi_packet {
> +	uint16_t magic;
> +	uint16_t opcode;
> +	uint8_t reqres;
> +	uint8_t data[16];
> +} __packed;
> +
> +static struct platform_device *samsung_wmi_device;
> +
> +static inline bool string_matches(const char *str, const char *kwd) {
> +	size_t len = strlen(kwd);
> +	if (strncmp(str, kwd, len) != 0)
> +		return false;
> +	return str[len] == '\0' || str[len] == '\n';
> +}
> +
> +static int samsung_wmi_method_call(uint16_t opcode, void *data, size_t len) {
> +	struct samsung_wmi_packet inpkt = {
> +		.magic = 0x5843,
> +		.opcode = opcode,
> +	};
> +	struct acpi_buffer inbuf = { sizeof(inpkt), &inpkt };
> +	struct acpi_buffer outbuf = { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *outobj;
> +	struct samsung_wmi_packet *outpkt;
> +	acpi_status st;
> +	int ret = -EIO;
> +	/********/

Comment is not needed

> +	if (len > 16) {
> +		ret = -EINVAL;
> +		goto err0;
> +	}
> +	memcpy(inpkt.data, data, len);
> +	st = wmi_evaluate_method(WMI_GUID, 1, 0, &inbuf, &outbuf);
> +	if (ACPI_FAILURE(st)) {
> +		dev_err(&samsung_wmi_device->dev, "opcode 0x%x failed: %s\n",
> +				opcode, acpi_format_exception(st));
> +		goto err0;
> +	}
> +	outobj = outbuf.pointer;
> +	if (outobj->type != ACPI_TYPE_BUFFER) {
> +		goto err1;
> +	}
> +	if (outobj->buffer.length < sizeof(outpkt)) {
> +		goto err1;
> +	}

Don't need {} here.

> +	outpkt = (struct samsung_wmi_packet *)outobj->buffer.pointer;
> +	memcpy(data, outpkt->data, len);
> +	ret = 0;
> +err1:
> +	kfree(outobj);
> +err0:
> +	return ret;

Could really improve the labels

> +}
> +
> +static int samsung_wmi_method_call_with_unlock(
> +		uint16_t unlock_opcode,
> +		uint16_t opcode, void *data, size_t len) {
> +	unsigned int unlock_data = 0xAABB;
> +	int ret;
> +	/********/

Comment is not needed

> +	ret = samsung_wmi_method_call(unlock_opcode, &unlock_data, sizeof(unlock_data));
> +	if (ret)
> +		goto err0;
> +	if (unlock_data != 0xCCDD) {
> +		dev_err(&samsung_wmi_device->dev, "incorrect unlock response!\n");
> +		ret = -EIO;
> +		goto err0;
> +	}
> +	ret = samsung_wmi_method_call(opcode, data, len);
> +err0:
> +	return ret;

Could improve the label

> +}
> +
> +static ssize_t samsung_wmi_fan_mode_show(struct device *dev, struct device_attribute *attr,
> +		char *buf) {
> +	uint32_t data = 0;
> +	if (samsung_wmi_method_call_with_unlock(0x31, 0x31, &data, sizeof(data)))
> +		return -EIO;
> +	if (data)
> +		strcpy(buf, "[auto off] on\n");
> +	else
> +		strcpy(buf, "auto off [on]\n");
> +	return strlen(buf);
> +}
> +
> +static ssize_t samsung_wmi_fan_mode_store(struct device *dev, struct device_attribute *attr,
> +		const char *buf, size_t count) {
> +	uint32_t data;
> +	if (string_matches(buf, "auto"))
> +		data = 0x810001;
> +	else if (string_matches(buf, "on"))
> +		data = 0;
> +	else if (string_matches(buf, "off"))
> +		data = 0x800001;
> +	else
> +		return -EINVAL;
> +	if (samsung_wmi_method_call_with_unlock(0x31, 0x32, &data, sizeof(data)))
> +		return -EIO;
> +	else
> +		return count;
> +}
> +
> +static void samsung_wmi_kbd_backlight_led_brightness_set(
> +		struct led_classdev *cdev, enum led_brightness brightness) {
> +	unsigned int data = brightness;
> +	if (data > 4)
> +		data = 4;
> +	data = (data << 8) | 0x82;
> +	/********/

This comment is not needed

> +	samsung_wmi_method_call_with_unlock(0x78, 0x78, &data, sizeof(data));
> +}
> +
> +static DEVICE_ATTR(fan_mode, S_IRUGO | S_IWUSR, samsung_wmi_fan_mode_show, samsung_wmi_fan_mode_store);
> +
> +static struct platform_driver samsung_wmi_driver = {
> +	.driver = {
> +		.name = DRIVER_NAME,
> +		.owner = THIS_MODULE,
> +	},

If I remember correctly you don't need to set .owner to THIS_MODULE anymore

> +};
> +
> +static struct led_classdev samsung_wmi_kbd_backlight_led = {
> +	.name = DRIVER_NAME "::kbd_backlight",
> +	.max_brightness = 4,
> +	.brightness_set = samsung_wmi_kbd_backlight_led_brightness_set,
> +};
> +
> +static int kb_default_brightness = -1;
> +module_param(kb_default_brightness, int, S_IRUGO);
> +MODULE_PARM_DESC(kb_default_brightness,
> +		"Default keyboard backlight brightness right after initialization");
> +
> +static int samsung_wmi_init(void) {
> +	int ret;
> +	// check whether method is present
> +	if (!wmi_has_guid(WMI_GUID))
> +		return -ENODEV;
> +	// we're good to go
> +	ret = platform_driver_register(&samsung_wmi_driver);
> +	if (ret) {
> +		goto err0;
> +	}

{} are not needed if there is only one statement

> +	samsung_wmi_device = platform_device_alloc(DRIVER_NAME, -1);
> +	if (!samsung_wmi_device) {
> +		ret = -ENOMEM;
> +		goto err1;
> +	}
> +	ret = platform_device_add(samsung_wmi_device);
> +	if (ret) {
> +		goto err2;
> +	}

Same

> +	ret = device_create_file(&samsung_wmi_device->dev, &dev_attr_fan_mode);
> +	if (ret) {
> +		goto err3;
> +	}
Same

> +	ret = led_classdev_register(&samsung_wmi_device->dev,
> +			&samsung_wmi_kbd_backlight_led);
> +	if (ret) {
> +		goto err4;
> +	}

Same

> +	if (kb_default_brightness >= 0) {
> +		led_set_brightness(&samsung_wmi_kbd_backlight_led, kb_default_brightness);
> +	}

Same

> +	return 0;
> +//err5:
> +	led_classdev_unregister(&samsung_wmi_kbd_backlight_led);
> +err4:
> +	device_remove_file(&samsung_wmi_device->dev, &dev_attr_fan_mode);
> +err3:
> +	platform_device_del(samsung_wmi_device);
> +err2:
> +	platform_device_put(samsung_wmi_device);
> +err1:
> +	platform_driver_unregister(&samsung_wmi_driver);
> +err0:
> +	return ret;

err5 is commented here so why not remove it? Also, you could think of better
label names. This is a good essay/rant on them:
https://plus.google.com/106378716002406849458/posts/dnanfhQ4mHQ

> +}
> +
> +static void samsung_wmi_exit(void) {
> +	led_classdev_unregister(&samsung_wmi_kbd_backlight_led);
> +	device_remove_file(&samsung_wmi_device->dev, &dev_attr_fan_mode);
> +	platform_device_unregister(samsung_wmi_device);
> +	platform_driver_unregister(&samsung_wmi_driver);
> +}
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Gavin Li");
> +MODULE_DESCRIPTION("WMI driver for some Samsung laptops.");
> +MODULE_ALIAS("wmi:" WMI_GUID);
> +module_init(samsung_wmi_init);
> +module_exit(samsung_wmi_exit);
> -- 
> 2.3.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Su pagarba / Regards,
Giedrius
