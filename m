Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BFD0C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon,  3 Jan 2022 11:34:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233042AbiACLeM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 3 Jan 2022 06:34:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38615 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233040AbiACLeL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jan 2022 06:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641209651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8g8NC1Msd3ybfyuER2I4zMuxj6us+Ld7oZk0znXtGwk=;
        b=b7HTMjt3vwYcFcAy+tQ1D6usPInB6Z+8NjhKGC9ZRzQigO+YU6ZqOD1ccvnbFTWTJpb1dx
        YbfPzFWtFg+ppkjb6H2uaxUG1H9vKkW11KQzph7qH6Nwta5GdjJpfxbfHshRT57WtRotMY
        Gv4vYNR9YXhi7LSWWxO+Hq0S6je75OI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-250-tSBMR40VNeGI-0RzjJmSFA-1; Mon, 03 Jan 2022 06:34:09 -0500
X-MC-Unique: tSBMR40VNeGI-0RzjJmSFA-1
Received: by mail-ed1-f70.google.com with SMTP id z3-20020a05640240c300b003f9154816ffso13509548edb.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jan 2022 03:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8g8NC1Msd3ybfyuER2I4zMuxj6us+Ld7oZk0znXtGwk=;
        b=4r0f91J3RfgqliseEskS+b9Okkqkav1LFRLaNTp+w6x1XweNwAPm1J8qDK5Tr8mx4B
         ersGq9/ybhS/QZCM3ixlPy5B7kWLdUHCJ03EJC5U/2DL62S5l+fYQCN184QOK84KYHgG
         aXnmAse4NnNSzaQ80CSZWla5gb66QFB51dl6AkofX4ShCGgm+gLaSKX3U4xD4XfZ1Den
         LLtWNG8B4TSBSy4zILzWhNcFYfphVbL+/W5mf+RQLfS3o7xkA9uDeIotczomsZ1P6KpE
         OIMzeVUpU7ZgtH2PpInd+ucOlrEnII7sL8BpmGTMZIFbruNvZ7qZ6SiZHqMjZ32fPj9+
         3HBg==
X-Gm-Message-State: AOAM530gnCUggr6VhqF7U8TMlJmxcDKRnszbnI9tAVuwAlZD6XgfZIol
        lMzlxC7BmlCTr1FjxkXySymY6J/YabJnEgRj+spe/xEPc+7INxCkiBOTj5858A2gwq3RO65SrKR
        gAng2yww2EIfX/oNbBvzhHt2cj+HbsHlwZQ==
X-Received: by 2002:a17:906:730a:: with SMTP id di10mr36250652ejc.562.1641209647941;
        Mon, 03 Jan 2022 03:34:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwO2b25GismUT9lCDljUYe28+3zdvCT9sQj/6ERVL/d5KwprAz66r22gsm/1C3j/XGCbgB+kw==
X-Received: by 2002:a17:906:730a:: with SMTP id di10mr36250638ejc.562.1641209647560;
        Mon, 03 Jan 2022 03:34:07 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id hd36sm10640803ejc.96.2022.01.03.03.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 03:34:07 -0800 (PST)
Message-ID: <120f9f08-6cd8-81c0-c256-4690ffdee854@redhat.com>
Date:   Mon, 3 Jan 2022 12:34:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: Add Asus TF103C dock driver
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
References: <20211226141849.156407-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211226141849.156407-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 12/26/21 15:18, Hans de Goede wrote:
> Add a driver for the keyboard, touchpad and USB port of
> the keyboard dock for the Asus TF103C 2-in-1 tablet.
> 
> This keyboard dock has its own I2C attached embedded controller
> and the keyboard and touchpad are also connected over I2C,
> instead of using the usual USB connection. This means that the
> keyboard dock requires this special driver to function.
> 
> Cc: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> Cc: Ion Agorria <ion@agorria.com>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
> Note there also is an out of tree driver for similar docks found on ARM based
> Asus Transformers here (I've Cc-ed the authors of this):
>  https://github.com/grate-driver/linux/commit/4b1bdacce8768aec31af900c8d073ee02aea055b
>  https://github.com/grate-driver/linux/commit/3f40c8a4561adde514313c9906edad6aaf498b9c
>  https://github.com/grate-driver/linux/commit/3b6bd46a63b849826c39a1255d6f3a6618235de6
>  https://github.com/grate-driver/linux/commit/57a93478d1bde8e0f84452a7b3bfa3937aaed616
>  https://github.com/grate-driver/linux/commit/45bc791b748855880d0730e2c387357c4a61be46
> 
> The TF103C dock is significantly different though, different enough that IMHO
> it warrants its own driver:
> 
> 1. It is instantiated through ACPI rather then through devicetree, ACPI only
> instantiates an i2c-dev for the EC dockram at address 0x1b and that i2c-client
> is always present. So we cannot (without hacks) use the devicetree "trick" with
> the "i2c: Add GPIO-based hotplug gate" patch where we let the driver-core
> instantiate the clients based on the dock-present GPIO by adding a proxy nested
> i2c-adapter which gets registered / unregistered based on the GPIO state.
> 
> 2. The GPIOs it uses are not described in the fwnode instead they need to be
> hardcoded.
> 
> 3. Although I have only tested 1 revision there seem to multiple revisions and
> they need different treatment for the pwr-pin (based on the Android kernel code)
> 
> 4. It does not send encapsulated ps2 packets through the EC-interrupt client
> at address 0x19, like the ARM Transformer docks do. Instead it uses something
> close to I2C-HID over a separate I2C address (0x16) for the keyboard and uses
> the elan_i2c I2C protocol for the touchpad over another I2C address (0x15).
> 
> 5. It uses different SMI values and the commands which need to be send to
> enable the dock during init are different too.
> 
> 6. The top row keys (where a normal keyboard has F1-F12 + Print-Screen) are
> a mess, using a mix of different (encapsulated) HID input report IDs as well
> as SCI events for some.
> 
> 7. The dock does not have a battery / charger pass-through support; leaving
> just: i. The keyboard, for which the driver sets up HID passthrough + some
> special handling for the toprow keys; and ii. the touchpad for which the
> driver instantiates an i2c-client for the elan_i2c driver and signals IRQs
> to that driver. IMHO this makes it unnecessary to model this as a MFD.
> Esp. since the non passed through parts are tightly interwoven, e.g. both
> the kbd i2c-client and SCI events are needed to make sense of the top-row.
> 
> Like the ARM Transformer docks this one too unfortunately does not send
> events for the "Fn" key, so I've borrowed the idea from the Arm Transformer
> dock code to use AltGr as Fn for the top-row to allow sending F1-F12 and
> also to toggle the default meaning of the top-row to F1-F12 (aka Fnlock)
> using AltGR + Esc.
> ---
>  MAINTAINERS                             |   7 +
>  drivers/platform/x86/Kconfig            |  19 +
>  drivers/platform/x86/Makefile           |   1 +
>  drivers/platform/x86/asus-tf103c-dock.c | 946 ++++++++++++++++++++++++
>  4 files changed, 973 insertions(+)
>  create mode 100644 drivers/platform/x86/asus-tf103c-dock.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7c22d50e9082..4863a2aec837 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2999,6 +2999,13 @@ W:	http://acpi4asus.sf.net
>  F:	drivers/platform/x86/asus*.c
>  F:	drivers/platform/x86/eeepc*.c
>  
> +ASUS TF103C DOCK DRIVER
> +M:	Hans de Goede <hdegoede@redhat.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> +F:	drivers/platform/x86/asus-tf103c-dock.c
> +
>  ASUS WIRELESS RADIO CONTROL DRIVER
>  M:	João Paulo Rechi Vita <jprvita@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 944cc893328e..56efe336a690 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -309,6 +309,25 @@ config ASUS_NB_WMI
>  	  If you have an ACPI-WMI compatible Asus Notebook, say Y or M
>  	  here.
>  
> +config ASUS_TF103C_DOCK
> +	tristate "Asus TF103C 2-in-1 keyboard dock"
> +	depends on ACPI
> +	depends on I2C
> +	depends on INPUT
> +	depends on HID
> +	depends on GPIOLIB
> +	help
> +	  This is a driver for the keyboard, touchpad and USB port of the
> +	  keyboard dock for the Asus TF103C 2-in-1 tablet.
> +
> +	  This keyboard dock has its own I2C attached embedded controller
> +	  and the keyboard and touchpad are also connected over I2C,
> +	  instead of using the usual USB connection. This means that the
> +	  keyboard dock requires this special driver to function.
> +
> +	  If you have an Asus TF103C tablet say Y or M here, for a generic x86
> +	  distro config say M here.
> +
>  config MERAKI_MX100
>  	tristate "Cisco Meraki MX100 Platform Driver"
>  	depends on GPIOLIB
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index f656e16689c7..cce124e3acab 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_ASUS_LAPTOP)	+= asus-laptop.o
>  obj-$(CONFIG_ASUS_WIRELESS)	+= asus-wireless.o
>  obj-$(CONFIG_ASUS_WMI)		+= asus-wmi.o
>  obj-$(CONFIG_ASUS_NB_WMI)	+= asus-nb-wmi.o
> +obj-$(CONFIG_ASUS_TF103C_DOCK)	+= asus-tf103c-dock.o
>  obj-$(CONFIG_EEEPC_LAPTOP)	+= eeepc-laptop.o
>  obj-$(CONFIG_EEEPC_WMI)		+= eeepc-wmi.o
>  
> diff --git a/drivers/platform/x86/asus-tf103c-dock.c b/drivers/platform/x86/asus-tf103c-dock.c
> new file mode 100644
> index 000000000000..9d392865934b
> --- /dev/null
> +++ b/drivers/platform/x86/asus-tf103c-dock.c
> @@ -0,0 +1,946 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * This is a driver for the keyboard, touchpad and USB port of the
> + * keyboard dock for the Asus TF103C 2-in-1 tablet.
> + *
> + * This keyboard dock has its own I2C attached embedded controller
> + * and the keyboard and touchpad are also connected over I2C,
> + * instead of using the usual USB connection. This means that the
> + * keyboard dock requires this special driver to function.
> + *
> + * Copyright (C) 2021 Hans de Goede <hdegoede@redhat.com>
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/dmi.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/hid.h>
> +#include <linux/i2c.h>
> +#include <linux/input.h>
> +#include <linux/irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/moduleparam.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/workqueue.h>
> +
> +static bool fnlock;
> +module_param(fnlock, bool, 0644);
> +MODULE_PARM_DESC(fnlock,
> +		 "By default the kbd toprow sends multimedia key presses. AltGr "
> +		 "can be pressed to change this to F1-F12. Set this to 1 to "
> +		 "change the default. Press AltGr + Esc to toggle at runtime.");
> +
> +#define TF103C_DOCK_DEV_NAME				"NPCE69A:00"
> +
> +#define TF103C_DOCK_HPD_DEBOUNCE			msecs_to_jiffies(20)
> +
> +/*** Touchpad I2C device defines ***/
> +#define TF103C_DOCK_TP_ADDR				0x15
> +
> +/*** Keyboard I2C device defines **A*/
> +#define TF103C_DOCK_KBD_ADDR				0x16
> +
> +#define TF103C_DOCK_KBD_DATA_REG			0x73
> +#define TF103C_DOCK_KBD_DATA_MIN_LENGTH			4
> +#define TF103C_DOCK_KBD_DATA_MAX_LENGTH			11
> +#define TF103C_DOCK_KBD_DATA_MODIFIERS			3
> +#define TF103C_DOCK_KBD_DATA_KEYS			5
> +#define TF103C_DOCK_KBD_CMD_REG				0x75
> +
> +#define TF103C_DOCK_KBD_CMD_ENABLE			0x0800
> +
> +/*** EC innterrupt data I2C device defines ***/
> +#define TF103C_DOCK_INTR_ADDR				0x19
> +#define TF103C_DOCK_INTR_DATA_REG			0x6a
> +
> +#define TF103C_DOCK_INTR_DATA1_OBF_MASK			0x01
> +#define TF103C_DOCK_INTR_DATA1_KEY_MASK			0x04
> +#define TF103C_DOCK_INTR_DATA1_KBC_MASK			0x08
> +#define TF103C_DOCK_INTR_DATA1_AUX_MASK			0x20
> +#define TF103C_DOCK_INTR_DATA1_SCI_MASK			0x40
> +#define TF103C_DOCK_INTR_DATA1_SMI_MASK			0x80
> +/* Special values for the OOB data on kbd_client / tp_client */
> +#define TF103C_DOCK_INTR_DATA1_OOB_VALUE		0xc1
> +#define TF103C_DOCK_INTR_DATA2_OOB_VALUE		0x04
> +
> +#define TF103C_DOCK_SMI_AC_EVENT			0x31
> +#define TF103C_DOCK_SMI_HANDSHAKING			0x50
> +#define TF103C_DOCK_SMI_EC_WAKEUP			0x53
> +#define TF103C_DOCK_SMI_BOOTBLOCK_RESET			0x5e
> +#define TF103C_DOCK_SMI_WATCHDOG_RESET			0x5f
> +#define TF103C_DOCK_SMI_ADAPTER_CHANGE			0x60
> +#define TF103C_DOCK_SMI_DOCK_INSERT			0x61
> +#define TF103C_DOCK_SMI_DOCK_REMOVE			0x62
> +#define TF103C_DOCK_SMI_PAD_BL_CHANGE			0x63
> +#define TF103C_DOCK_SMI_HID_STATUS_CHANGED		0x64
> +#define TF103C_DOCK_SMI_HID_WAKEUP			0x65
> +#define TF103C_DOCK_SMI_S3				0x83
> +#define TF103C_DOCK_SMI_S5				0x85
> +#define TF103C_DOCK_SMI_NOTIFY_SHUTDOWN			0x90
> +#define TF103C_DOCK_SMI_RESUME				0x91
> +
> +/*** EC (dockram) I2C device defines ***/
> +#define TF103C_DOCK_EC_ADDR				0x1b
> +
> +#define TF103C_DOCK_EC_CMD_REG				0x0a
> +#define TF103C_DOCK_EC_CMD_LEN				9
> +
> +enum {
> +	TF103C_DOCK_FLAG_HID_OPEN,
> +};
> +
> +struct tf103c_dock_data {
> +	struct delayed_work hpd_work;
> +	struct irq_chip tp_irqchip;
> +	struct irq_domain *tp_irq_domain;
> +	struct i2c_client *ec_client;
> +	struct i2c_client *intr_client;
> +	struct i2c_client *kbd_client;
> +	struct i2c_client *tp_client;
> +	struct gpio_desc *pwr_en;
> +	struct gpio_desc *irq_gpio;
> +	struct gpio_desc *hpd_gpio;
> +	struct input_dev *input;
> +	struct hid_device *hid;
> +	unsigned long flags;
> +	int board_rev;
> +	int irq;
> +	int hpd_irq;
> +	int tp_irq;
> +	int last_press_0x13;
> +	int last_press_0x14;
> +	bool enabled;
> +	bool tp_enabled;
> +	bool altgr_pressed;
> +	bool esc_pressed;
> +	bool filter_esc;
> +	u8 kbd_buf[TF103C_DOCK_KBD_DATA_MAX_LENGTH];
> +};
> +
> +static struct gpiod_lookup_table tf103c_dock_gpios = {
> +	.dev_id = "i2c-" TF103C_DOCK_DEV_NAME,
> +	.table = {
> +		GPIO_LOOKUP("INT33FC:00",      55, "dock_pwr_en", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("INT33FC:02",       1, "dock_irq", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("INT33FC:02",      29, "dock_hpd", GPIO_ACTIVE_HIGH),
> +		GPIO_LOOKUP("gpio_crystalcove", 2, "board_rev", GPIO_ACTIVE_HIGH),
> +		{}
> +	},
> +};
> +
> +/* Byte 0 is the length of the rest of the packet */
> +static const u8 tf103c_dock_enable_cmd[9] = { 8, 0x20, 0, 0, 0, 0, 0x20, 0, 0 };
> +static const u8 tf103c_dock_usb_enable_cmd[9] = { 8, 0, 0, 0, 0, 0, 0, 0x40, 0 };
> +static const u8 tf103c_dock_suspend_cmd[9] = { 8, 0, 0x20, 0, 0, 0x22, 0, 0, 0 };
> +
> +/*** keyboard related code ***/
> +
> +static u8 tf103c_dock_kbd_hid_desc[] = {
> +	0x05, 0x01,         /*  Usage Page (Desktop),               */
> +	0x09, 0x06,         /*  Usage (Keyboard),                   */
> +	0xA1, 0x01,         /*  Collection (Application),           */
> +	0x85, 0x11,         /*      Report ID (17),                 */
> +	0x95, 0x08,         /*      Report Count (8),               */
> +	0x75, 0x01,         /*      Report Size (1),                */
> +	0x15, 0x00,         /*      Logical Minimum (0),            */
> +	0x25, 0x01,         /*      Logical Maximum (1),            */
> +	0x05, 0x07,         /*      Usage Page (Keyboard),          */
> +	0x19, 0xE0,         /*      Usage Minimum (KB Leftcontrol), */
> +	0x29, 0xE7,         /*      Usage Maximum (KB Right GUI),   */
> +	0x81, 0x02,         /*      Input (Variable),               */
> +	0x95, 0x01,         /*      Report Count (1),               */
> +	0x75, 0x08,         /*      Report Size (8),                */
> +	0x81, 0x01,         /*      Input (Constant),               */
> +	0x95, 0x06,         /*      Report Count (6),               */
> +	0x75, 0x08,         /*      Report Size (8),                */
> +	0x15, 0x00,         /*      Logical Minimum (0),            */
> +	0x26, 0xFF, 0x00,   /*      Logical Maximum (255),          */
> +	0x05, 0x07,         /*      Usage Page (Keyboard),          */
> +	0x19, 0x00,         /*      Usage Minimum (None),           */
> +	0x2A, 0xFF, 0x00,   /*      Usage Maximum (FFh),            */
> +	0x81, 0x00,         /*      Input,                          */
> +	0xC0                /*  End Collection                      */
> +};
> +
> +static int tf103c_dock_kbd_read(struct tf103c_dock_data *dock)
> +{
> +	struct i2c_client *client = dock->kbd_client;
> +	struct device *dev = &dock->ec_client->dev;
> +	struct i2c_msg msgs[2];
> +	u8 reg[2];
> +	int ret;
> +
> +	reg[0] = TF103C_DOCK_KBD_DATA_REG & 0xff;
> +	reg[1] = TF103C_DOCK_KBD_DATA_REG >> 8;
> +
> +	msgs[0].addr = client->addr;
> +	msgs[0].flags = 0;
> +	msgs[0].len = sizeof(reg);
> +	msgs[0].buf = reg;
> +
> +	msgs[1].addr = client->addr;
> +	msgs[1].flags = I2C_M_RD;
> +	msgs[1].len = TF103C_DOCK_KBD_DATA_MAX_LENGTH;
> +	msgs[1].buf = dock->kbd_buf;
> +
> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +	if (ret != 2) {
> +		dev_err(dev, "error %d reading kbd data\n", ret);
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void tf103c_dock_kbd_write(struct tf103c_dock_data *dock, u16 cmd)
> +{
> +	struct device *dev = &dock->ec_client->dev;
> +	u8 buf[4];
> +	int ret;
> +
> +	buf[0] = TF103C_DOCK_KBD_CMD_REG & 0xff;
> +	buf[1] = TF103C_DOCK_KBD_CMD_REG >> 8;
> +	buf[2] = cmd & 0xff;
> +	buf[3] = cmd >> 8;
> +
> +	ret = i2c_master_send(dock->kbd_client, buf, 4);
> +	if (ret != 4)
> +		dev_err(dev, "error %d writing kbd cmd\n", ret);
> +}
> +
> +/* HID ll_driver functions for forwarding input-reports from the kbd_client */
> +static int tf103c_dock_hid_parse(struct hid_device *hid)
> +{
> +	return hid_parse_report(hid, tf103c_dock_kbd_hid_desc,
> +				sizeof(tf103c_dock_kbd_hid_desc));
> +}
> +
> +static int tf103c_dock_hid_start(struct hid_device *hid)
> +{
> +	return 0;
> +}
> +
> +static void tf103c_dock_hid_stop(struct hid_device *hid)
> +{
> +	hid->claimed = 0;
> +}
> +
> +static int tf103c_dock_hid_open(struct hid_device *hid)
> +{
> +	struct tf103c_dock_data *dock = hid->driver_data;
> +
> +	set_bit(TF103C_DOCK_FLAG_HID_OPEN, &dock->flags);
> +	return 0;
> +}
> +
> +static void tf103c_dock_hid_close(struct hid_device *hid)
> +{
> +	struct tf103c_dock_data *dock = hid->driver_data;
> +
> +	clear_bit(TF103C_DOCK_FLAG_HID_OPEN, &dock->flags);
> +}
> +
> +/* Mandatory, but not used */
> +static int tf103c_dock_hid_raw_request(struct hid_device *hid, u8 reportnum,
> +				       u8 *buf, size_t len, u8 rtype, int reqtype)
> +{
> +	return 0;
> +}
> +
> +struct hid_ll_driver tf103c_dock_hid_ll_driver = {
> +	.parse = tf103c_dock_hid_parse,
> +	.start = tf103c_dock_hid_start,
> +	.stop = tf103c_dock_hid_stop,
> +	.open = tf103c_dock_hid_open,
> +	.close = tf103c_dock_hid_close,
> +	.raw_request = tf103c_dock_hid_raw_request,
> +};
> +
> +static int tf103c_dock_toprow_codes[13][2] = {
> +	/* Normal,            AltGr pressed */
> +	{ KEY_POWER,          KEY_F1 },
> +	{ KEY_RFKILL,         KEY_F2 },
> +	{ KEY_F21,            KEY_F3 }, /* Touchpad toggle, userspace expects F21 */
> +	{ KEY_BRIGHTNESSDOWN, KEY_F4 },
> +	{ KEY_BRIGHTNESSUP,   KEY_F5 },
> +	{ KEY_CAMERA,         KEY_F6 },
> +	{ KEY_CONFIG,         KEY_F7 },
> +	{ KEY_PREVIOUSSONG,   KEY_F8 },
> +	{ KEY_PLAYPAUSE,      KEY_F9 },
> +	{ KEY_NEXTSONG,       KEY_F10 },
> +	{ KEY_MUTE,           KEY_F11 },
> +	{ KEY_VOLUMEDOWN,     KEY_F12 },
> +	{ KEY_VOLUMEUP,       KEY_SYSRQ },
> +};
> +
> +static void tf103c_dock_report_toprow_kbd_hook(struct tf103c_dock_data *dock)
> +{
> +	u8 *esc, *buf = dock->kbd_buf;
> +	int size;
> +
> +	/*
> +	 * Stop AltGr reports from getting reported on the "Asus TF103C Dock
> +	 * Keyboard" input_dev, since this gets used as "Fn" key for the toprow
> +	 * keys. Instead we report this on the "Asus TF103C Dock Top Row Keys"
> +	 * input_dev, when not used to modify the toprow keys.
> +	 */
> +	dock->altgr_pressed = buf[TF103C_DOCK_KBD_DATA_MODIFIERS] & 0x40;
> +	buf[TF103C_DOCK_KBD_DATA_MODIFIERS] &= ~0x40;
> +
> +	input_report_key(dock->input, KEY_RIGHTALT, dock->altgr_pressed);
> +	input_sync(dock->input);
> +
> +	/* Toggle fnlock on AltGr + Esc press */
> +	buf = buf + TF103C_DOCK_KBD_DATA_KEYS;
> +	size = TF103C_DOCK_KBD_DATA_MAX_LENGTH - TF103C_DOCK_KBD_DATA_KEYS;
> +	esc = memchr(buf, 0x29, size);
> +	if (!dock->esc_pressed && esc) {
> +		if (dock->altgr_pressed) {
> +			fnlock = !fnlock;
> +			dock->filter_esc = true;
> +		}
> +	}
> +	if (esc && dock->filter_esc)
> +		*esc = 0;
> +	else
> +		dock->filter_esc = false;
> +
> +	dock->esc_pressed = esc != NULL;
> +}
> +
> +static void tf103c_dock_toprow_press(struct tf103c_dock_data *dock, int key_code)
> +{
> +	/*
> +	 * Release AltGr before reporting the toprow key, so that userspace
> +	 * sees e.g. just KEY_SUSPEND and not AltGr + KEY_SUSPEND.
> +	 */
> +	if (dock->altgr_pressed) {
> +		input_report_key(dock->input, KEY_RIGHTALT, false);
> +		input_sync(dock->input);
> +	}
> +
> +	input_report_key(dock->input, key_code, true);
> +	input_sync(dock->input);
> +}
> +
> +static void tf103c_dock_toprow_release(struct tf103c_dock_data *dock, int key_code)
> +{
> +	input_report_key(dock->input, key_code, false);
> +	input_sync(dock->input);
> +
> +	if (dock->altgr_pressed) {
> +		input_report_key(dock->input, KEY_RIGHTALT, true);
> +		input_sync(dock->input);
> +	}
> +}
> +
> +static void tf103c_dock_toprow_event(struct tf103c_dock_data *dock,
> +					    int toprow_index, int *last_press)
> +{
> +	int key_code, fn = dock->altgr_pressed ^ fnlock;
> +
> +	if (last_press && *last_press) {
> +		tf103c_dock_toprow_release(dock, *last_press);
> +		*last_press = 0;
> +	}
> +
> +	if (toprow_index < 0)
> +		return;
> +
> +	key_code = tf103c_dock_toprow_codes[toprow_index][fn];
> +	tf103c_dock_toprow_press(dock, key_code);
> +
> +	if (last_press)
> +		*last_press = key_code;
> +	else
> +		tf103c_dock_toprow_release(dock, key_code);
> +}
> +
> +/*
> + * The keyboard sends what appears to be standard I2C-HID input-reports,
> + * except that a 16 bit register address of where the I2C-HID format
> + * input-reports are stored must be send before reading it in a single
> + * (I2C repeated-start) I2C transaction.
> + *
> + * Its unknown how to get the HID descriptors but they are easy to reconstruct:
> + *
> + * Input report id 0x11 is 8 bytes long and contain standard USB HID intf-class,
> + * Boot Interface Subclass reports.
> + * Input report id 0x13 is 2 bytes long and sends Consumer Control events
> + * Input report id 0x14 is 1 byte long and sends System Control events
> + *
> + * However the top row keys (where a normal keyboard has F1-F12 + Print-Screen)
> + * are a mess, using a mix of the 0x13 and 0x14 input reports as well as EC SCI
> + * events; and these need special handling to allow actually sending F1-F12,
> + * since the Fn key on the keyboard only works on the cursor keys and the top
> + * row keys always send their special "Multimedia hotkey" codes.
> + *
> + * So only forward the 0x11 reports to HID and handle the top-row keys here.
> + */
> +static void tf103c_dock_kbd_interrupt(struct tf103c_dock_data *dock)
> +{
> +	struct device *dev = &dock->ec_client->dev;
> +	u8 *buf = dock->kbd_buf;
> +	int size;
> +
> +	if (tf103c_dock_kbd_read(dock))
> +		return;
> +
> +	size = buf[0] | buf[1] << 8;
> +	if (size < TF103C_DOCK_KBD_DATA_MIN_LENGTH ||
> +	    size > TF103C_DOCK_KBD_DATA_MAX_LENGTH) {
> +		dev_err(dev, "error reported kbd pkt size %d is out of range %d-%d\n", size,
> +			TF103C_DOCK_KBD_DATA_MIN_LENGTH,
> +			TF103C_DOCK_KBD_DATA_MAX_LENGTH);
> +		return;
> +	}
> +
> +	switch (buf[2]) {
> +	case 0x11:
> +		if (size != 11)
> +			break;
> +
> +		tf103c_dock_report_toprow_kbd_hook(dock);
> +
> +		if (test_bit(TF103C_DOCK_FLAG_HID_OPEN, &dock->flags))
> +			hid_input_report(dock->hid, HID_INPUT_REPORT, buf + 2, size - 2, 1);
> +		return;
> +	case 0x13:
> +		if (size != 5)
> +			break;
> +
> +		switch (buf[3] | buf[4] << 8) {
> +		case 0:
> +			tf103c_dock_toprow_event(dock, -1, &dock->last_press_0x13);
> +			return;
> +		case 0x70:
> +			tf103c_dock_toprow_event(dock, 3, &dock->last_press_0x13);
> +			return;
> +		case 0x6f:
> +			tf103c_dock_toprow_event(dock, 4, &dock->last_press_0x13);
> +			return;
> +		case 0xb6:
> +			tf103c_dock_toprow_event(dock, 7, &dock->last_press_0x13);
> +			return;
> +		case 0xcd:
> +			tf103c_dock_toprow_event(dock, 8, &dock->last_press_0x13);
> +			return;
> +		case 0xb5:
> +			tf103c_dock_toprow_event(dock, 9, &dock->last_press_0x13);
> +			return;
> +		case 0xe2:
> +			tf103c_dock_toprow_event(dock, 10, &dock->last_press_0x13);
> +			return;
> +		case 0xea:
> +			tf103c_dock_toprow_event(dock, 11, &dock->last_press_0x13);
> +			return;
> +		case 0xe9:
> +			tf103c_dock_toprow_event(dock, 12, &dock->last_press_0x13);
> +			return;
> +		}
> +		break;
> +	case 0x14:
> +		if (size != 4)
> +			break;
> +
> +		switch (buf[3]) {
> +		case 0:
> +			tf103c_dock_toprow_event(dock, -1, &dock->last_press_0x14);
> +			return;
> +		case 1:
> +			tf103c_dock_toprow_event(dock, 0, &dock->last_press_0x14);
> +			return;
> +		}
> +		break;
> +	}
> +
> +	dev_warn(dev, "warning unknown kbd data: %*ph\n", size, buf);
> +}
> +
> +/*** touchpad related code ***/
> +
> +static const struct property_entry tf103c_dock_touchpad_props[] = {
> +	PROPERTY_ENTRY_BOOL("elan,clickpad"),
> +	{ }
> +};
> +
> +static const struct software_node tf103c_dock_touchpad_sw_node = {
> +	.properties = tf103c_dock_touchpad_props,
> +};
> +
> +/*
> + * tf103c_enable_touchpad() is only called from the threaded interrupt handler
> + * and tf103c_disable_touchpad() is only called after the irq is disabled,
> + * so no locking is necessary.
> + */
> +static void tf103c_dock_enable_touchpad(struct tf103c_dock_data *dock)
> +{
> +	struct i2c_board_info board_info = { };
> +	struct device *dev = &dock->ec_client->dev;
> +	int ret;
> +
> +	if (dock->tp_enabled) {
> +		/* Happens after resume, the tp needs to be reinitialized */
> +		ret = device_reprobe(&dock->tp_client->dev);
> +		if (ret)
> +			dev_err_probe(dev, ret, "reprobing tp-client\n");
> +		return;
> +	}
> +
> +	strscpy(board_info.type, "elan_i2c", I2C_NAME_SIZE);
> +	board_info.addr = TF103C_DOCK_TP_ADDR;
> +	board_info.dev_name = TF103C_DOCK_DEV_NAME "-tp";
> +	board_info.irq = dock->tp_irq;
> +	board_info.swnode = &tf103c_dock_touchpad_sw_node;
> +
> +	dock->tp_client = i2c_new_client_device(dock->ec_client->adapter, &board_info);
> +	if (IS_ERR(dock->tp_client)) {
> +		dev_err(dev, "error %ld creating tp client\n", PTR_ERR(dock->tp_client));
> +		return;
> +	}
> +
> +	dock->tp_enabled = true;
> +}
> +
> +static void tf103c_dock_disable_touchpad(struct tf103c_dock_data *dock)
> +{
> +	if (!dock->tp_enabled)
> +		return;
> +
> +	i2c_unregister_device(dock->tp_client);
> +
> +	dock->tp_enabled = false;
> +}
> +
> +/*** interrupt handling code ***/
> +static void tf103c_dock_ec_cmd(struct tf103c_dock_data *dock, const u8 *cmd)
> +{
> +	struct device *dev = &dock->ec_client->dev;
> +	int ret;
> +
> +	ret = i2c_smbus_write_i2c_block_data(dock->ec_client, TF103C_DOCK_EC_CMD_REG,
> +					     TF103C_DOCK_EC_CMD_LEN, cmd);
> +	if (ret)
> +		dev_err(dev, "error %d sending %*ph cmd\n", ret,
> +			TF103C_DOCK_EC_CMD_LEN, cmd);
> +}
> +
> +static void tf103c_dock_sci(struct tf103c_dock_data *dock, u8 val)
> +{
> +	struct device *dev = &dock->ec_client->dev;
> +
> +	switch (val) {
> +	case 2:
> +		tf103c_dock_toprow_event(dock, 1, NULL);
> +		return;
> +	case 4:
> +		tf103c_dock_toprow_event(dock, 2, NULL);
> +		return;
> +	case 8:
> +		tf103c_dock_toprow_event(dock, 5, NULL);
> +		return;
> +	case 17:
> +		tf103c_dock_toprow_event(dock, 6, NULL);
> +		return;
> +	}
> +
> +	dev_warn(dev, "warning unknown SCI value: 0x%02x\n", val);
> +}
> +
> +static void tf103c_dock_smi(struct tf103c_dock_data *dock, u8 val)
> +{
> +	struct device *dev = &dock->ec_client->dev;
> +
> +	switch (val) {
> +	case TF103C_DOCK_SMI_EC_WAKEUP:
> +		tf103c_dock_ec_cmd(dock, tf103c_dock_enable_cmd);
> +		tf103c_dock_ec_cmd(dock, tf103c_dock_usb_enable_cmd);
> +		tf103c_dock_kbd_write(dock, TF103C_DOCK_KBD_CMD_ENABLE);
> +		break;
> +	case TF103C_DOCK_SMI_PAD_BL_CHANGE:
> +		/* There is no backlight, but the EC still sends this */
> +		break;
> +	case TF103C_DOCK_SMI_HID_STATUS_CHANGED:
> +		tf103c_dock_enable_touchpad(dock);
> +		break;
> +	default:
> +		dev_warn(dev, "warning unknown SMI value: 0x%02x\n", val);
> +		break;
> +	}
> +}
> +
> +static irqreturn_t tf103c_dock_irq(int irq, void *data)
> +{
> +	struct tf103c_dock_data *dock = data;
> +	struct device *dev = &dock->ec_client->dev;
> +	u8 intr_data[8];
> +	int ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(dock->intr_client, TF103C_DOCK_INTR_DATA_REG,
> +					    sizeof(intr_data), intr_data);
> +	if (ret != sizeof(intr_data)) {
> +		dev_err(dev, "error %d reading intr data\n", ret);
> +		return IRQ_NONE;
> +	}
> +
> +	if (!(intr_data[1] & TF103C_DOCK_INTR_DATA1_OBF_MASK))
> +		return IRQ_NONE;
> +
> +	/* intr_data[0] is the length of the rest of the packet */
> +	if (intr_data[0] == 3 && intr_data[1] == TF103C_DOCK_INTR_DATA1_OOB_VALUE &&
> +				 intr_data[2] == TF103C_DOCK_INTR_DATA2_OOB_VALUE) {
> +		/* intr_data[3] seems to contain a HID input report id */
> +		switch (intr_data[3]) {
> +		case 0x01:
> +			handle_nested_irq(dock->tp_irq);
> +			break;
> +		case 0x11:
> +		case 0x13:
> +		case 0x14:
> +			tf103c_dock_kbd_interrupt(dock);
> +			break;
> +		default:
> +			dev_warn(dev, "warning unknown intr_data[3]: 0x%02x\n", intr_data[3]);
> +			break;
> +		}
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (intr_data[1] & TF103C_DOCK_INTR_DATA1_SCI_MASK) {
> +		tf103c_dock_sci(dock, intr_data[2]);
> +		return IRQ_HANDLED;
> +	}
> +
> +	if (intr_data[1] & TF103C_DOCK_INTR_DATA1_SMI_MASK) {
> +		tf103c_dock_smi(dock, intr_data[2]);
> +		return IRQ_HANDLED;
> +	}
> +
> +	dev_warn(dev, "warning unknown intr data: %*ph\n", 8, intr_data);
> +	return IRQ_NONE;
> +}
> +
> +/*
> + * tf103c_dock_[dis|en]able only run from hpd_work or at times when
> + * hpd_work cannot run (hpd_irq disabled), so no locking is necessary.
> + */
> +static void tf103c_dock_enable(struct tf103c_dock_data *dock)
> +{
> +	if (dock->enabled)
> +		return;
> +
> +	if (dock->board_rev != 2)
> +		gpiod_set_value(dock->pwr_en, 1);
> +
> +	msleep(500);
> +	enable_irq(dock->irq);
> +
> +	dock->enabled = true;
> +}
> +
> +static void tf103c_dock_disable(struct tf103c_dock_data *dock)
> +{
> +	if (!dock->enabled)
> +		return;
> +
> +	disable_irq(dock->irq);
> +	tf103c_dock_disable_touchpad(dock);
> +	if (dock->board_rev != 2)
> +		gpiod_set_value(dock->pwr_en, 0);
> +
> +	dock->enabled = false;
> +}
> +
> +static void tf103c_dock_hpd_work(struct work_struct *work)
> +{
> +	struct tf103c_dock_data *dock =
> +		container_of(work, struct tf103c_dock_data, hpd_work.work);
> +
> +	if (gpiod_get_value(dock->hpd_gpio))
> +		tf103c_dock_enable(dock);
> +	else
> +		tf103c_dock_disable(dock);
> +}
> +
> +static irqreturn_t tf103c_dock_hpd_irq(int irq, void *data)
> +{
> +	struct tf103c_dock_data *dock = data;
> +
> +	mod_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_DEBOUNCE);
> +	return IRQ_HANDLED;
> +}
> +
> +static void tf103c_dock_start_hpd(struct tf103c_dock_data *dock)
> +{
> +	enable_irq(dock->hpd_irq);
> +	/* Sync current HPD status */
> +	queue_delayed_work(system_long_wq, &dock->hpd_work, TF103C_DOCK_HPD_DEBOUNCE);
> +}
> +
> +static void tf103c_dock_stop_hpd(struct tf103c_dock_data *dock)
> +{
> +	disable_irq(dock->hpd_irq);
> +	cancel_delayed_work_sync(&dock->hpd_work);
> +}
> +
> +/*** probe ***/
> +
> +static const struct dmi_system_id tf103c_dock_dmi_ids[] = {
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "TF103C"),
> +		},
> +	},
> +	{ }
> +};
> +
> +static void tf103c_dock_non_devm_cleanup(void *data)
> +{
> +	struct tf103c_dock_data *dock = data;
> +
> +	if (dock->tp_irq_domain)
> +		irq_domain_remove(dock->tp_irq_domain);
> +
> +	if (!IS_ERR_OR_NULL(dock->hid))
> +		hid_destroy_device(dock->hid);
> +
> +	i2c_unregister_device(dock->kbd_client);
> +	i2c_unregister_device(dock->intr_client);
> +	gpiod_remove_lookup_table(&tf103c_dock_gpios);
> +}
> +
> +static int tf103c_dock_probe(struct i2c_client *client)
> +{
> +	struct i2c_board_info board_info = { };
> +	struct device *dev = &client->dev;
> +	struct gpio_desc *board_rev_gpio;
> +	struct tf103c_dock_data *dock;
> +	enum gpiod_flags flags;
> +	int i, ret;
> +
> +	/* GPIOs are hardcoded for the Asus TF103C, don't bind on other devs */
> +	if (!dmi_check_system(tf103c_dock_dmi_ids))
> +		return -ENODEV;
> +
> +	dock = devm_kzalloc(dev, sizeof(*dock), GFP_KERNEL);
> +	if (!dock)
> +		return -ENOMEM;
> +
> +	INIT_DELAYED_WORK(&dock->hpd_work, tf103c_dock_hpd_work);
> +
> +	/* 1. Get GPIOs and their IRQs */
> +	gpiod_add_lookup_table(&tf103c_dock_gpios);
> +
> +	ret = devm_add_action_or_reset(dev, tf103c_dock_non_devm_cleanup, dock);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The pin is configured as input by default, use ASIS because otherwise
> +	 * the gpio-crystalcove.c switches off the internal pull-down replacing
> +	 * it with a pull-up.
> +	 */
> +	board_rev_gpio = gpiod_get(dev, "board_rev", GPIOD_ASIS);
> +	if (IS_ERR(board_rev_gpio))
> +		return dev_err_probe(dev, PTR_ERR(board_rev_gpio), "requesting board_rev GPIO\n");
> +	dock->board_rev = gpiod_get_value_cansleep(board_rev_gpio) + 1;
> +	gpiod_put(board_rev_gpio);
> +
> +	/*
> +	 * The Android driver drives the dock-pwr-en pin high at probe for
> +	 * revision 2 boards and then never touches it again?
> +	 * This code has only been tested on a revision 1 board, so for now
> +	 * just mimick what Android does on revision 2 boards.
> +	 */
> +	flags = (dock->board_rev == 2) ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW;
> +	dock->pwr_en = devm_gpiod_get(dev, "dock_pwr_en", flags);
> +	if (IS_ERR(dock->pwr_en))
> +		return dev_err_probe(dev, PTR_ERR(dock->pwr_en), "requesting pwr_en GPIO\n");
> +
> +	dock->irq_gpio = devm_gpiod_get(dev, "dock_irq", GPIOD_IN);
> +	if (IS_ERR(dock->irq_gpio))
> +		return dev_err_probe(dev, PTR_ERR(dock->irq_gpio), "requesting IRQ GPIO\n");
> +
> +	dock->irq = gpiod_to_irq(dock->irq_gpio);
> +	if (dock->irq < 0)
> +		return dev_err_probe(dev, dock->irq, "getting dock IRQ");
> +
> +	ret = devm_request_threaded_irq(dev, dock->irq, NULL, tf103c_dock_irq,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT | IRQF_NO_AUTOEN,
> +					"dock_irq", dock);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "requesting dock IRQ");
> +
> +	dock->hpd_gpio = devm_gpiod_get(dev, "dock_hpd", GPIOD_IN);
> +	if (IS_ERR(dock->hpd_gpio))
> +		return dev_err_probe(dev, PTR_ERR(dock->hpd_gpio), "requesting HPD GPIO\n");
> +
> +	dock->hpd_irq = gpiod_to_irq(dock->hpd_gpio);
> +	if (dock->hpd_irq < 0)
> +		return dev_err_probe(dev, dock->hpd_irq, "getting HPD IRQ");
> +
> +	ret = devm_request_irq(dev, dock->hpd_irq, tf103c_dock_hpd_irq,
> +			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_NO_AUTOEN,
> +			       "dock_hpd", dock);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * 2. Create I2C clients. The dock uses 4 different i2c addresses,
> +	 * the ACPI NPCE69A node being probed points to the EC address.
> +	 */
> +	dock->ec_client = client;
> +
> +	strscpy(board_info.type, "tf103c-dock-intr", I2C_NAME_SIZE);
> +	board_info.addr = TF103C_DOCK_INTR_ADDR;
> +	board_info.dev_name = TF103C_DOCK_DEV_NAME "-intr";
> +
> +	dock->intr_client = i2c_new_client_device(client->adapter, &board_info);
> +	if (IS_ERR(dock->intr_client))
> +		return dev_err_probe(dev, PTR_ERR(dock->intr_client), "creating intr client\n");
> +
> +	strscpy(board_info.type, "tf103c-dock-kbd", I2C_NAME_SIZE);
> +	board_info.addr = TF103C_DOCK_KBD_ADDR;
> +	board_info.dev_name = TF103C_DOCK_DEV_NAME "-kbd";
> +
> +	dock->kbd_client = i2c_new_client_device(client->adapter, &board_info);
> +	if (IS_ERR(dock->kbd_client))
> +		return dev_err_probe(dev, PTR_ERR(dock->kbd_client), "creating kbd client\n");
> +
> +	/* 3. Create input_dev for the top row of the keyboard */
> +	dock->input = devm_input_allocate_device(dev);
> +	if (!dock->input)
> +		return -ENOMEM;
> +
> +	dock->input->name = "Asus TF103C Dock Top Row Keys";
> +	dock->input->phys = dev_name(dev);
> +	dock->input->dev.parent = dev;
> +	dock->input->id.bustype = BUS_I2C;
> +	dock->input->id.vendor = /* USB_VENDOR_ID_ASUSTEK */
> +	dock->input->id.product = /* From TF-103-C */
> +	dock->input->id.version = 0x0100;  /* 1.0 */
> +
> +	for (i = 0; i < ARRAY_SIZE(tf103c_dock_toprow_codes); i++) {
> +		input_set_capability(dock->input, EV_KEY, tf103c_dock_toprow_codes[i][0]);
> +		input_set_capability(dock->input, EV_KEY, tf103c_dock_toprow_codes[i][1]);
> +	}
> +	input_set_capability(dock->input, EV_KEY, KEY_RIGHTALT);
> +
> +	ret = input_register_device(dock->input);
> +	if (ret)
> +		return ret;
> +
> +	/* 4. Create HID device for the keyboard */
> +	dock->hid = hid_allocate_device();
> +	if (IS_ERR(dock->hid))
> +		return dev_err_probe(dev, PTR_ERR(dock->hid), "allocating hid dev\n");
> +
> +	dock->hid->driver_data = dock;
> +	dock->hid->ll_driver = &tf103c_dock_hid_ll_driver;
> +	dock->hid->dev.parent = &client->dev;
> +	dock->hid->bus = BUS_I2C;
> +	dock->hid->vendor = 0x0b05;  /* USB_VENDOR_ID_ASUSTEK */
> +	dock->hid->product = 0x0103; /* From TF-103-C */
> +	dock->hid->version = 0x0100; /* 1.0 */
> +	strscpy(dock->hid->name, "Asus TF103C Dock Keyboard", sizeof(dock->hid->name));
> +	strscpy(dock->hid->phys, dev_name(dev), sizeof(dock->hid->phys));
> +
> +	ret = hid_add_device(dock->hid);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "adding hid dev\n");
> +
> +	/* 5. Setup irqchip for touchpad IRQ pass-through */
> +	dock->tp_irqchip.name = KBUILD_MODNAME;
> +
> +	dock->tp_irq_domain = irq_domain_add_linear(NULL, 1, &irq_domain_simple_ops, NULL);
> +	if (!dock->tp_irq_domain)
> +		return -ENOMEM;
> +
> +	dock->tp_irq = irq_create_mapping(dock->tp_irq_domain, 0);
> +	if (!dock->tp_irq)
> +		return -ENOMEM;
> +
> +	irq_set_chip_data(dock->tp_irq, dock);
> +	irq_set_chip_and_handler(dock->tp_irq, &dock->tp_irqchip, handle_simple_irq);
> +	irq_set_nested_thread(dock->tp_irq, true);
> +	irq_set_noprobe(dock->tp_irq);
> +
> +	dev_info(dev, "Asus TF103C board-revision: %d\n", dock->board_rev);
> +
> +	tf103c_dock_start_hpd(dock);
> +
> +	device_init_wakeup(dev, true);
> +	i2c_set_clientdata(client, dock);
> +	return 0;
> +}
> +
> +static int tf103c_dock_remove(struct i2c_client *client)
> +{
> +	struct tf103c_dock_data *dock = i2c_get_clientdata(client);
> +
> +	tf103c_dock_stop_hpd(dock);
> +	tf103c_dock_disable(dock);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused tf103c_dock_suspend(struct device *dev)
> +{
> +	struct tf103c_dock_data *dock = dev_get_drvdata(dev);
> +
> +	tf103c_dock_stop_hpd(dock);
> +
> +	if (dock->enabled) {
> +		tf103c_dock_ec_cmd(dock, tf103c_dock_suspend_cmd);
> +
> +		if (device_may_wakeup(dev))
> +			enable_irq_wake(dock->irq);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused tf103c_dock_resume(struct device *dev)
> +{
> +	struct tf103c_dock_data *dock = dev_get_drvdata(dev);
> +
> +	if (dock->enabled) {
> +		if (device_may_wakeup(dev))
> +			disable_irq_wake(dock->irq);
> +
> +		/* Don't try to resume if the dock was unplugged during suspend */
> +		if (gpiod_get_value(dock->hpd_gpio))
> +			tf103c_dock_ec_cmd(dock, tf103c_dock_enable_cmd);
> +	}
> +
> +	tf103c_dock_start_hpd(dock);
> +	return 0;
> +}
> +
> +SIMPLE_DEV_PM_OPS(tf103c_dock_pm_ops, tf103c_dock_suspend, tf103c_dock_resume);
> +
> +static const struct acpi_device_id tf103c_dock_acpi_match[] = {
> +	{"NPCE69A"},
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(acpi, tf103c_dock_acpi_match);
> +
> +static struct i2c_driver tf103c_dock_driver = {
> +	.driver = {
> +		.name = "asus-tf103c-dock",
> +		.pm = &tf103c_dock_pm_ops,
> +		.acpi_match_table = tf103c_dock_acpi_match,
> +	},
> +	.probe_new = tf103c_dock_probe,
> +	.remove	= tf103c_dock_remove,
> +};
> +module_i2c_driver(tf103c_dock_driver);
> +
> +MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com");
> +MODULE_DESCRIPTION("X86 Android tablets DSDT fixups driver");
> +MODULE_LICENSE("GPL");
> 

