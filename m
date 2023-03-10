Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DB4EC64EC4
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Mar 2023 10:29:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjCJK27 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Mar 2023 05:28:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjCJK26 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Mar 2023 05:28:58 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96907E1FE5
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Mar 2023 02:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
        t=1678444100; i=w_armin@gmx.de;
        bh=/xUWtiaV9uFj8Z1NF19gzHaLD0l7if+WcuXQHsRzfy8=;
        h=X-UI-Sender-Class:Subject:To:References:From:Date:In-Reply-To;
        b=AUFL6NZE0vQNlKa+Zxh/tRjS5GGwewh5KABgo2hucm2JqNbCSwqjgmI8h6AVgD9j0
         iNPCJmenar1+t6clFaQKnibzlV2We203Qgjz1ZFoEJbgHiJI/IPULCoYuig0phyS+9
         k38BjaKe4QSKapIxEBmCx+qvg+QVM5YnbWdgRnl+f+vLsLsn8hJnE/H5YRcypYkkyO
         NIg2s1H/r+9rEZ629+bYkf366VBMMwNeRKuWaWNJcgiiZ3stHwWEY7u4X93odbq2sC
         TozOyVZOodSFd3uv3iLjH6ql576LMKfTO7Nfmgs1wmYNEYz9BqdlcVi3IJpUSnt2YU
         XCGPJghEeQe9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwfWU-1qTFwU32ew-00yBeV; Fri, 10
 Mar 2023 11:28:20 +0100
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>,
        platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        soyer@irl.hu
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
From:   Armin Wolf <W_Armin@gmx.de>
Message-ID: <91a25bfc-080d-b0e4-46cd-159bbf1346e8@gmx.de>
Date:   Fri, 10 Mar 2023 11:28:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20230310041726.217447-3-kallmeyeras@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-Provags-ID: V03:K1:dQz2mqUnsoI/rZv0ccMlMff9GMLOSnyy9kQ9se6b+HIjjvckz68
 /aPtdFSrnbms+a/yH743BcHomsFmlgVVNWuLCIw6Z11jSFRUfefkN2UdhfVPn9AJpFnOVAY
 sKLanFTib7mEeC375BYJFsmks9EEkmGUS2YepQE85R1cKzxf5ESo+5ZLXtZWjpIQivWGRg1
 3FVcogqJIAnfbsowqD86g==
UI-OutboundReport: notjunk:1;M01:P0:6loJR85DFPk=;UuPX8sQIC812AwEtMvKjYrLk5vH
 EloVf7MZj1Z28ZtytCFI52OChhbd2cuYkkG5WEle0pBYSY+GZxUR6cTRQryoqM8+oNmH1INjN
 sy6EAmIAngnsY28k1FlKAsDs9BXMKRiHDqPTno3VvQ2CMclh7UMCMM9R0BJr42YrCUBDOjFto
 GdQUirHZhUHwDTOS/biOSsXknvhK60Fgrdb+kwEO9XybE0W+RT3uUhJowJ5mkYSp1siguip3a
 T4UoQhR/YDmw31l2MENy3XIaKcTUHCqtObJ0LeGx2Hydybu7zCn2qfGoxFDjgdUzYFRoiVHd1
 iRruzTGSp/qQ7/+kIpB2AyjMA4vF70Kn9qz9gZDyPy9DlPmMFXQXFWBK1oqPopuoxJk/PtfIc
 ENRE06ST9kU+Sv+7Jd/x2srHmdxTG9zZNf7vue0dtkcMO3H//5CGuBqLJW58P4ChqvPfzOl40
 IudTUbzba3Yh4k412y2oBLLvBVvDlPGBwnBr5QHISZ6PStWgWdzqTv6a36s9JXkulHyb26Frk
 GmLCZy4sezpr/pxIqAs8ywPH+QVY4iuURHDbyn4tFv3njYZRNNmYU69t5NWXxgE2bH96o595R
 dH7PTBjxLjfLO+d5uKTIQUzs+nW87dq67i5cmHKcimfL3xL7jD7tJO4XkM2yDHu34U6fgA9cf
 QGCw0dTLE0iGLhifIWc5o3CuptupF49ChSz16cucBNNojMrTplo115efemNUqtceXzR7P3MNE
 FKhDcymBowNINFKyRy66+IY3J3grzQYKF8TVnsaIF7RXwfbwn7yaAZrIx8gs04Pl88Bl7mM+4
 KqV/+FRQQYfUY3WS9TjhnGOiWhI8bEWcaL+eO8pxEJggsEwOXyEP9wdSrg6F5p+H7jM14Gnj2
 /8Wj+1Kpvkm/rk7lRnZAUug4TE2L1nymfuZgWeOhXqmbvzNdRbbJE7bYL/3R3sakAzXmEnXpN
 eepuvlZ+YgJY3aeDxzTJyKK1Vjc=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am 10.03.23 um 05:17 schrieb Andrew Kallmeyer:

> This WMI driver for the tablet mode control switch for Lenovo Yoga
> notebooks was originally written by Gergo Koteles. The mode is mapped to
> a SW_TABLET_MODE switch capable input device.
>
> I (Andrew) followed the suggestions that were posted in reply to Gergo's
> RFC patch to follow-up and get it merged. Additionally I merged the
> lenovo_ymc_trigger_ec function with the ideapad_trigger_ymc_next_read
> function since it was no longer external. I have also added the word
> "Tablet" to the driver description to hopefully make it more clear.
>
> As Gergo said: It should work with  models like the Yoga C940, Ideapad
> flex 14API, Yoga 9 14IAP7, Yoga 7 14ARB7.
> The 14ARB7 model must trigger the EC to send mode change events. This
> might be a firmware bug.
>
> I have additionally tested this on the Yoga 7 14IAL7.
>
> Link: https://lore.kernel.org/r/20221004214332.35934-1-soyer@irl.hu/
> Co-developed-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> Signed-off-by: Andrew Kallmeyer <kallmeyeras@gmail.com>
> ---
>   drivers/platform/x86/Kconfig          |  10 ++
>   drivers/platform/x86/Makefile         |   1 +
>   drivers/platform/x86/ideapad-laptop.h |   1 +
>   drivers/platform/x86/lenovo-ymc.c     | 177 ++++++++++++++++++++++++++
>   4 files changed, 189 insertions(+)
>   create mode 100644 drivers/platform/x86/lenovo-ymc.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 5692385e2..858be0c65 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -470,6 +470,16 @@ config IDEAPAD_LAPTOP
>   	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>   	  rfkill switch, hotkey, fan control and backlight control.
>
> +config LENOVO_YMC
> +	tristate "Lenovo Yoga Tablet Mode Control"
> +	depends on ACPI_WMI
> +	depends on INPUT
> +	depends on IDEAPAD_LAPTOP
> +	select INPUT_SPARSEKMAP
> +	help
> +	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE in=
put
> +	  events for Lenovo Yoga notebooks.
> +
>   config SENSORS_HDAPS
>   	tristate "Thinkpad Hard Drive Active Protection System (hdaps)"
>   	depends on INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index 1d3d1b025..10054cdea 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -63,6 +63,7 @@ obj-$(CONFIG_UV_SYSFS)       +=3D uv_sysfs.o
>   # IBM Thinkpad and Lenovo
>   obj-$(CONFIG_IBM_RTL)		+=3D ibm_rtl.o
>   obj-$(CONFIG_IDEAPAD_LAPTOP)	+=3D ideapad-laptop.o
> +obj-$(CONFIG_LENOVO_YMC)	+=3D lenovo-ymc.o
>   obj-$(CONFIG_SENSORS_HDAPS)	+=3D hdaps.o
>   obj-$(CONFIG_THINKPAD_ACPI)	+=3D thinkpad_acpi.o
>   obj-$(CONFIG_THINKPAD_LMI)	+=3D think-lmi.o
> diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x8=
6/ideapad-laptop.h
> index 7dd8ce027..2564cb1cd 100644
> --- a/drivers/platform/x86/ideapad-laptop.h
> +++ b/drivers/platform/x86/ideapad-laptop.h
> @@ -35,6 +35,7 @@ enum {
>   	VPCCMD_W_FAN,
>   	VPCCMD_R_RF,
>   	VPCCMD_W_RF,
> +	VPCCMD_W_YMC =3D 0x2A,
>   	VPCCMD_R_FAN =3D 0x2B,
>   	VPCCMD_R_SPECIAL_BUTTONS =3D 0x31,
>   	VPCCMD_W_BL_POWER =3D 0x33,
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/le=
novo-ymc.c
> new file mode 100644
> index 000000000..e29ada1b4
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * lenovo-ymc.c - Lenovo Yoga Mode Control driver
> + *
> + * Copyright =C2=A9 2022 Gergo Koteles <soyer@irl.hu>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/dmi.h>
> +#include <linux/input.h>
> +#include <linux/input/sparse-keymap.h>
> +#include <linux/wmi.h>
> +#include "ideapad-laptop.h"
> +
> +#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
> +#define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> +
> +#define LENOVO_YMC_QUERY_INSTANCE 0
> +#define LENOVO_YMC_QUERY_METHOD 0xAB

Hi,

according to the embedded MOF data, the method id for retrieving the mode =
data
is 0x1, not 0xAB.

> +
> +static bool ec_trigger __read_mostly;
> +module_param(ec_trigger, bool, 0644);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events")=
;
> +
> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] =3D {
> +	{
> +		// Lenovo Yoga 7 14ARB7
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +		},
> +	},
> +	{ },
> +};
> +
> +struct lenovo_ymc_private {
> +	struct input_dev *input_dev;
> +	struct acpi_device *ec_acpi_dev;
> +};
> +
> +static void lenovo_ymc_trigger_ec(struct wmi_device *wdev, struct lenov=
o_ymc_private *priv)
> +{
> +	int err;
> +
> +	if (!ec_trigger || !priv || !priv->ec_acpi_dev)
> +		return;
> +	err =3D write_ec_cmd(priv->ec_acpi_dev->handle, VPCCMD_W_YMC, 1);
> +	if (err)
> +		dev_warn(&wdev->dev, "Could not write YMC: %d\n", err);
> +}
> +
> +static const struct key_entry lenovo_ymc_keymap[] =3D {
> +	// Laptop
> +	{ KE_SW, 0x01, { .sw =3D { SW_TABLET_MODE, 0 } } },
> +	// Tablet
> +	{ KE_SW, 0x02, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +	// Drawing Board
> +	{ KE_SW, 0x03, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +	// Tent
> +	{ KE_SW, 0x04, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +	{ KE_END },
> +};
> +
> +static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_objec=
t *data)
> +{
> +	struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +	u32 input_val =3D 0;
> +	struct acpi_buffer input =3D {sizeof(input_val), &input_val};
> +	struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +	acpi_status status;
> +	union acpi_object *obj;
> +	int code;
> +
> +	status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> +				LENOVO_YMC_QUERY_INSTANCE,
> +				LENOVO_YMC_QUERY_METHOD,
> +				&input, &output);

Using wmi_evaluate_method() is deprecated as WMI GUIDs are not guaranteed =
to be
unique for a given machine. I think both WMI GUIDs should be handled by se=
parate
drivers, and the driver for the event GUID uses a notifier call chain to i=
nform
the driver for the data GUID that the usage mode changed, which then handl=
es the
input device stuff.

This way the driver does not rely on deprecated WMI APIs, and everything w=
ould
still work should Lenovo decide to duplicate some WMI GUIDs.

> +
> +	if (ACPI_FAILURE(status)) {
> +		dev_warn(&wdev->dev,
> +			"Failed to evaluate query method: %s\n",
> +			acpi_format_exception(status));
> +		return;
> +	}
> +
> +	obj =3D output.pointer;
> +
> +	if (obj->type !=3D ACPI_TYPE_INTEGER) {
> +		dev_warn(&wdev->dev,
> +			"WMI event data is not an integer\n");
> +		goto free_obj;
> +	}
> +	code =3D obj->integer.value;
> +
> +	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
> +		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
> +
> +free_obj:
> +	kfree(obj);
> +	lenovo_ymc_trigger_ec(wdev, priv);
> +}
> +
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +	struct input_dev *input_dev;
> +	struct lenovo_ymc_private *priv;
> +	int err;
> +
> +	ec_trigger |=3D dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	if (ec_trigger) {
> +		pr_debug("Lenovo YMC enable EC triggering.\n");
> +		priv->ec_acpi_dev =3D acpi_dev_get_first_match_dev("VCP2004", NULL, -=
1);

acpi_dev_put() is missing.

> +		if (!priv->ec_acpi_dev) {
> +			dev_err(&wdev->dev, "Could not find EC ACPI device.\n");
> +			return -ENODEV;
> +		}
> +	}
> +
> +	input_dev =3D devm_input_allocate_device(&wdev->dev);
> +	if (!input_dev)
> +		return -ENOMEM;
> +
> +	input_dev->name =3D "Lenovo Yoga Tablet Mode Control switch";
> +	input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
> +	input_dev->id.bustype =3D BUS_HOST;
> +	input_dev->dev.parent =3D &wdev->dev;
> +
> +	input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +	err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not set up input device keymap: %d\n", err);
> +		return err;
> +	}
> +
> +	err =3D input_register_device(input_dev);
> +	if (err) {
> +		dev_err(&wdev->dev,
> +			"Could not register input device: %d\n", err);
> +		return err;
> +	}

Maybe it would be beneficial to allow userspace to get the current usage m=
ode without having
to wait for an WMI event. This way, userspace could still react to situati=
ons like the device
already being in tablet mode when this driver is loaded.

> +
> +	priv->input_dev =3D input_dev;
> +	dev_set_drvdata(&wdev->dev, priv);
> +	lenovo_ymc_trigger_ec(wdev, priv);
> +	return 0;
> +}
> +
> +static const struct wmi_device_id lenovo_ymc_wmi_id_table[] =3D {
> +	{ .guid_string =3D LENOVO_YMC_EVENT_GUID },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);

If the drivers handling the event and data GUIDs are fine with being insta=
ntiated multiple
times, then adding the WMI GUIDs to the allow_duplicates[] list in drivers=
/platform/x86/wmi.c
will allow the WMI driver core to handle duplicated event and data GUIDs.

Armin Wolf

> +
> +static struct wmi_driver lenovo_ymc_driver =3D {
> +	.driver =3D {
> +		.name =3D "lenovo-ymc",
> +	},
> +	.id_table =3D lenovo_ymc_wmi_id_table,
> +	.probe =3D lenovo_ymc_probe,
> +	.notify =3D lenovo_ymc_notify,
> +};
> +
> +module_wmi_driver(lenovo_ymc_driver);
> +
> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> +MODULE_LICENSE("GPL");
