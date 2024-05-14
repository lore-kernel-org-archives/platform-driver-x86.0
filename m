Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6287C1802C7
	for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2024 18:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715710495; cv=none; b=mtJX6IstxURINIqFK8iDCuuXUWo99WE+ExBct3w6AfVWndFBDG0zAd5RPKyZ6oP2HfffN+Iir94r7xtSM3w2qJzMH/5S4XtHa60ciHU9WWQ1RZaXzdwHUCQAtjul+xyifE/QUNFNzIc7gN5Ibq3nGkomx0crH4XHEsjwZy4o00o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715710495; c=relaxed/simple;
	bh=uYar0kB9F+CAZ9m73BB3KI2hzzXy5omeUTewm5rlcs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDpljzo/Wibdzl+AsHEa3Vy9Pb11X+noi3ZAMh6WJ949N0uKAiMBSAEuflqQ1Sq4iYvX7FGsQxaW+kZM4kIV8je2wkWaV7JpG59ykPCHf7E8A3OkOCRhFGpx056ldDLBJjlwgfV1ZYbG+833VhVxshtRI9LwPLX6rxXmqz3/pjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KeghAmYZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KeghAmYZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715710492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6nj9tMU1uS2o3ib0sAlZyfvxbRkvEz+91g+pC4aoqlg=;
	b=KeghAmYZZw5omTebH2783WtRdUNZ4dxzM6KYItulMXtccis9jUJ+2dD5smzFG+4pDaTgTl
	fPAJlC6PPtnFXRVDFKhQ6ikaa92nd/SfLHMIgNMj171PzeHIZ2e54tTN4sLi+XUYcEJnLu
	qee4bvIzENDp85NPQalBupnrGMVgxYc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-woL8d5IlMg6Q2lU9swNbPg-1; Tue, 14 May 2024 14:14:50 -0400
X-MC-Unique: woL8d5IlMg6Q2lU9swNbPg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a59ad486084so302703266b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2024 11:14:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715710489; x=1716315289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6nj9tMU1uS2o3ib0sAlZyfvxbRkvEz+91g+pC4aoqlg=;
        b=iuCIOK861WEouo2uPAcIhzk4dEYo/M1CZPc4OuXT1egnA+6LRt69pBIQTEweh/iolS
         +ifHP9EDYT0y8G2q4oEIFwetLXciqr82hOPOUD2glE5XvX8uBPxDD/KdDPCdViLuuv6T
         dD04f7lI6sVMaySx0QypM7BmqUjXvA2vyFN3RWLH7zshojYKfyDaBECtd62gQyU2QlxY
         Ya3aeKjKvL72Ofp4zSj6Ww34XXwmALRAihjKeFRXRHF8jhagmQ45Cz8Y/fxKaHh7IcBP
         k3tlKH8m6mjOR1GKNU0bQAwJUlrLI4Qm323MemUTL3BZ9tPEJeIT8QmGx4G+pO1WemY7
         5kiA==
X-Gm-Message-State: AOJu0YwfWkX/I5Se4nW3Z9hSkh90hVkfCXb9WuSs9aoxh50MbaAVA01O
	eFjeAmblnRzI4sC1O9HjMQufmaxRVd85KWTyvRhPCCk/vht9WnrQ6QpGmZ4deXZNQEHgs8bBhf3
	laiR22WkutIsOoAvTyh1wxvfB3lAQMhutS9okVF0JRqPfGFrXWOMfU/gKOBkbh95N5s+JxPxz2/
	7yu/Q=
X-Received: by 2002:a17:906:7192:b0:a59:cdc9:6fe1 with SMTP id a640c23a62f3a-a5a2d55ef06mr930666366b.19.1715710488941;
        Tue, 14 May 2024 11:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIHc5FnylPVs66wsdKGx70jMThxp2ql/S71z9FkgWnJEkFkc8ZZtkCHG2oZeAeMFS3PvC5tQ==
X-Received: by 2002:a17:906:7192:b0:a59:cdc9:6fe1 with SMTP id a640c23a62f3a-a5a2d55ef06mr930664366b.19.1715710488460;
        Tue, 14 May 2024 11:14:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a1781d553sm750336366b.43.2024.05.14.11.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 11:14:47 -0700 (PDT)
Message-ID: <32c8c3a5-866f-4799-894e-02018046a9e4@redhat.com>
Date: Tue, 14 May 2024 20:14:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: Add new MeeGoPad ANX7428 Type-C Cross
 Switch driver
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240514180343.70795-1-hdegoede@redhat.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240514180343.70795-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/14/24 8:03 PM, Hans de Goede wrote:
> Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for USB3.1 Gen 1
> and DisplayPort over Type-C alternate mode support.
> 
> The ANX7428 has a microcontroller which takes care of the PD negotiation
> and automatically sets the builtin Crosspoint Switch to send the right
> signal to the 4 highspeed pairs of the Type-C connector. It also takes
> care of HPD and AUX channel routing for DP alternate mode.
> 
> IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
> things look like there simple is a USB-3 Type-A connector and a
> separate DisplayPort connector. Except that the BIOS does not
> power on the ANX7428 at boot (meh).
> 
> Add a driver to power on the ANX7428. This driver is added under
> drivers/platform/x86 rather than under drivers/usb/typec for 2 reasons:
> 
> 1. This driver is specifically written to work with how the ANX7428 is
> described in the ACPI tables of the MeeGoPad x86 (Cherry Trail) devices.
> 
> 2. This driver only powers on the ANX7428 and does not do anything wrt
> its Type-C functionality. It should be possible to tell the controller
> which data- and/or power-role to negotiate and to swap the role(s) after
> negotiation but the MeeGoPad top-set boxes always draw their power from
> a separate power-connector and they only support USB host-mode. So this
> functionality is unnecessary and due to lack of documentation this is
> tricky to support.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans




> ---
> Changes in v2:
> - Switch to read_poll_timeout() for waiting for the microcontroller to boot
> - Address a few other small review remarks from Andy
> ---
>  drivers/platform/x86/Kconfig            |  11 ++
>  drivers/platform/x86/Makefile           |   3 +
>  drivers/platform/x86/meegopad_anx7428.c | 148 ++++++++++++++++++++++++
>  3 files changed, 162 insertions(+)
>  create mode 100644 drivers/platform/x86/meegopad_anx7428.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index e5601d8fba68..0ec952b5d03e 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -666,6 +666,17 @@ config ACPI_QUICKSTART
>  	  To compile this driver as a module, choose M here: the module will be
>  	  called quickstart.
>  
> +config MEEGOPAD_ANX7428
> +	tristate "MeeGoPad ANX7428 Type-C Switch"
> +	depends on ACPI && GPIOLIB && I2C
> +	help
> +	  Some MeeGoPad top-set boxes have an ANX7428 Type-C Switch for
> +	  USB3.1 Gen 1 and DisplayPort over Type-C alternate mode support.
> +
> +	  This driver takes care of powering on the ANX7428 on supported
> +	  MeeGoPad top-set boxes. After this the ANX7428 takes care of Type-C
> +	  connector orientation and PD alternate mode switching autonomously.
> +
>  config MSI_EC
>  	tristate "MSI EC Extras"
>  	depends on ACPI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index cf3032e4e27f..e1b142947067 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -75,6 +75,9 @@ obj-y				+= intel/
>  # Microsoft
>  obj-$(CONFIG_ACPI_QUICKSTART)  += quickstart.o
>  
> +# MeeGoPad
> +obj-$(CONFIG_MEEGOPAD_ANX7428)	+= meegopad_anx7428.o
> +
>  # MSI
>  obj-$(CONFIG_MSI_EC)		+= msi-ec.o
>  obj-$(CONFIG_MSI_LAPTOP)	+= msi-laptop.o
> diff --git a/drivers/platform/x86/meegopad_anx7428.c b/drivers/platform/x86/meegopad_anx7428.c
> new file mode 100644
> index 000000000000..8c025e39f3f1
> --- /dev/null
> +++ b/drivers/platform/x86/meegopad_anx7428.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver to power on the Analogix ANX7428 USB Type-C crosspoint switch
> + * on MeeGoPad top-set boxes.
> + *
> + * The MeeGoPad T8 and T9 are Cherry Trail top-set boxes which
> + * use an ANX7428 to provide a Type-C port with USB3.1 Gen 1 and
> + * DisplayPort over Type-C alternate mode support.
> + *
> + * The ANX7428 has a microcontroller which takes care of the PD
> + * negotiation and automatically sets the builtin Crosspoint Switch
> + * to send the right signal to the 4 highspeed pairs of the Type-C
> + * connector. It also takes care of HPD and AUX channel routing for
> + * DP alternate mode.
> + *
> + * IOW the ANX7428 operates fully autonomous and to the x5-Z8350 SoC
> + * things look like there simple is a USB-3 Type-A connector and a
> + * separate DisplayPort connector. Except that the BIOS does not
> + * power on the ANX7428 at boot. This driver takes care of powering
> + * on the ANX7428.
> + *
> + * It should be possible to tell the micro-controller which data- and/or
> + * power-role to negotiate and to swap the role(s) after negotiation
> + * but the MeeGoPad top-set boxes always draw their power from a separate
> + * power-connector and they only support USB host-mode. So this functionality
> + * is unnecessary and due to lack of documentation this is tricky to support.
> + *
> + * For a more complete ANX7428 driver see drivers/usb/misc/anx7418/ of
> + * the LineageOS kernel for the LG G5 (International) aka the LG H850:
> + * https://github.com/LineageOS/android_kernel_lge_msm8996/
> + *
> + * (C) Copyright 2024 Hans de Goede <hansg@kernel.org>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +
> +/* Register addresses and fields */
> +#define VENDOR_ID			0x00
> +#define DEVICE_ID			0x02
> +
> +#define TX_STATUS			0x16
> +#define STATUS_SUCCESS			BIT(0)
> +#define STATUS_ERROR			BIT(1)
> +#define OCM_STARTUP			BIT(7)
> +
> +static bool force;
> +module_param(force, bool, 0444);
> +MODULE_PARM_DESC(force, "Force the driver to probe on unknown boards");
> +
> +static const struct acpi_gpio_params enable_gpio = { 0, 0, false };
> +static const struct acpi_gpio_params reset_gpio = { 1, 0, true };
> +
> +static const struct acpi_gpio_mapping meegopad_anx7428_gpios[] = {
> +	{ "enable-gpios", &enable_gpio, 1 },
> +	{ "reset-gpios", &reset_gpio, 1 },
> +	{ }
> +};
> +
> +static const struct dmi_system_id meegopad_anx7428_ids[] = {
> +	{
> +		/* Meegopad T08 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Default string"),
> +			DMI_MATCH(DMI_BOARD_NAME, "T3 MRD"),
> +			DMI_MATCH(DMI_BOARD_VERSION, "V1.1"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static int anx7428_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct gpio_desc *gpio;
> +	int ret, val;
> +
> +	if (!dmi_check_system(meegopad_anx7428_ids) && !force) {
> +		dev_warn(dev, "Not probing unknown board, pass meegopad_anx7428.force=1 to probe");
> +		return -ENODEV;
> +	}
> +
> +	ret = devm_acpi_dev_add_driver_gpios(dev, meegopad_anx7428_gpios);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Set GPIOs to desired values while getting them, they are not needed
> +	 * afterwards. Ordering and delays come from android_kernel_lge_msm8996.
> +	 */
> +	gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(gpio))
> +		return dev_err_probe(dev, PTR_ERR(gpio), "getting enable GPIO\n");
> +
> +	fsleep(10000);
> +
> +	gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(gpio))
> +		return dev_err_probe(dev, PTR_ERR(gpio), "getting reset GPIO\n");
> +
> +	/* Wait for the OCM (On Chip Microcontroller) to start */
> +	ret = read_poll_timeout(i2c_smbus_read_byte_data, val,
> +				val >= 0 && (val & OCM_STARTUP),
> +				5000, 50000, true, client, TX_STATUS);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "On Chip Microcontroller did not start, status: 0x%02x\n",
> +				     val);
> +
> +	ret = i2c_smbus_read_word_data(client, VENDOR_ID);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "reading vendor-id register\n");
> +	val = ret;
> +
> +	ret = i2c_smbus_read_word_data(client, DEVICE_ID);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "reading device-id register\n");
> +
> +	dev_dbg(dev, "Powered on ANX7428 id %04x:%04x\n", val, ret);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id anx7428_acpi_match[] = {
> +	{ "ANXO7418" }, /* ACPI says 7418 (max 2 DP lanes version) but HW is 7428 */
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, anx7428_acpi_match);
> +
> +static struct i2c_driver anx7428_driver = {
> +	.driver = {
> +		.name = "meegopad_anx7428",
> +		.acpi_match_table = anx7428_acpi_match,
> +	},
> +	.probe = anx7428_probe,
> +};
> +
> +module_i2c_driver(anx7428_driver);
> +
> +MODULE_AUTHOR("Hans de Goede <hansg@kernel.org>");
> +MODULE_DESCRIPTION("MeeGoPad ANX7428 driver");
> +MODULE_LICENSE("GPL");

