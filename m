Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1689AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  5 Oct 2022 15:39:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbiJEPjs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 5 Oct 2022 11:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230422AbiJEPjq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Oct 2022 11:39:46 -0400
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch [185.70.40.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3A210DD
        for <platform-driver-x86@vger.kernel.org>; Wed,  5 Oct 2022 08:39:44 -0700 (PDT)
Date:   Wed, 05 Oct 2022 15:39:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1664984382; x=1665243582;
        bh=0LlB1whlMunEi9zlS5/hup7hQn8PWdIbXoW9kXy+L94=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=epFGJZa7Sjo/5IrRYbPyYHaWvioWDHZKqsAWhwG0KbglbvM9w+SZ+rUGgDthO54gl
         O56Vo5WjR4UYwKj3KxIQ0jQGxLEPevcbB4gecy4/gIT1JwJzB2wOHqXm8U7BfDiZyH
         Cm+Gt9y9f/NCHEx/oCga+JyG0patmb6Imr3YbLLlpgXpPCIdKTIhU1dHhphzQFqnio
         d2c0ZucVTtggfNi6Muby/3TFDpV4o08HRmjDyGMXKTZmazxp0zUTiOBJq2uDhnCFSs
         ppUWlIJ6YGoPXciJbKo68VLTVU7lvE3Nw1Z0Muj6KzO3Z8eGSYZKFe4HyGOvyi4OUl
         9F26EIHbc91nw==
To:     Gergo Koteles <soyer@irl.hu>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, dwmw2@infradead.org
Subject: Re: [RFC PATCH] Add Lenovo Yoga Mode Control driver
Message-ID: <1cmaH4eIeGNNK-umUGMFGHUhYx5oh1icSugzF9f8lm0761WwLf4MPo8UOztwYmLgr1W8fp8eyQL3EeZLza_ruu2m-Ar0VjxLaCJAgchtyNM=@protonmail.com>
In-Reply-To: <20221004214332.35934-1-soyer@irl.hu>
References: <20221004214332.35934-1-soyer@irl.hu>
Feedback-ID: 20568564:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2022. okt=C3=B3ber 4., kedd 23:43 keltez=C3=A9ssel, Gergo Koteles <soyer@ir=
l.hu> =C3=ADrta:

> This is a WMI driver for the Mode Control switch for Lenovo Yoga
> notebooks.
> The mode is mapped to a SW_TABLET_MODE switch capable input device.
>=20
> It should work with  models like the Yoga C940, Ideapad flex 14API,
> Yoga 9 14IAP7, Yoga 7 14ARB7.
> The 14ARB7 model must trigger the EC to send mode change events.
> This might be a firmware bug.

Is it known how that works on Windows?


>=20
> Introduces a global variable in the ideapad-laptop driver.
> I would like some advice on how to do it without the variable,
> or how to do it better.
> ---
>  drivers/platform/x86/Kconfig          |  10 ++
>  drivers/platform/x86/Makefile         |   1 +
>  drivers/platform/x86/ideapad-laptop.c |  18 +++
>  drivers/platform/x86/lenovo-ymc.c     | 185 ++++++++++++++++++++++++++
>  4 files changed, 214 insertions(+)
>  create mode 100644 drivers/platform/x86/lenovo-ymc.c
> [...]
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/len=
ovo-ymc.c
> new file mode 100644
> index 000000000000..0b899b02e12f
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -0,0 +1,185 @@
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
> +
> +#define LENOVO_YMC_EVENT_GUID=09"06129D99-6083-4164-81AD-F092F9D773A6"
> +#define LENOVO_YMC_QUERY_GUID=09"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
> +
> +#define LENOVO_YMC_QUERY_INSTANCE 0
> +#define LENOVO_YMC_QUERY_METHOD 0xAB
> +
> +extern void ideapad_trigger_ymc_next_read(void);
> +
> +static bool ec_trigger __read_mostly;
> +module_param(ec_trigger, bool, 0644);
> +MODULE_PARM_DESC(ec_trigger, "Enable EC triggering to emit YMC events");
> +
> +static int enable_ec_trigger(const struct dmi_system_id *id)
> +{
> +       pr_debug("Lenovo YMC enable EC triggering.\n");
> +       ec_trigger =3D true;
> +       return 0;

You seem to be using spaces instead of tabs here. Please run scripts/checkp=
atch.pl.
The biggest problem currently is probably the missing Signed-off-by tag.

In any case, I think you don't actually need this function because you can =
do

  ec_trigger |=3D dmi_check_system(ec_trigger_quirk_dmi_table);

in the probe function.


> +}
> +
> +static const struct dmi_system_id ec_trigger_quirk_dmi_table[] =3D {
> +=09{
> +=09=09// Lenovo Yoga 7 14ARB7
> +=09=09.callback =3D enable_ec_trigger,
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
> +=09=09},
> +=09},
> +=09{ },
> +};
> +
> +static void lenovo_ymc_trigger_ec(void) {
> +=09if (ec_trigger) {
> +=09=09ideapad_trigger_ymc_next_read();
> +=09}
> +}
> +
> +
> +struct lenovo_ymc_private {
> +=09struct input_dev *input_dev;
> +};
> +
> +
> +static const struct key_entry lenovo_ymc_keymap[] =3D {
> +=09// Laptop
> +=09{ KE_SW, 0x01, { .sw =3D { SW_TABLET_MODE, 0 } } },
> +=09// Tablet
> +=09{ KE_SW, 0x02, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +=09// Drawing Board
> +=09{ KE_SW, 0x03, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +=09// Tent
> +=09{ KE_SW, 0x04, { .sw =3D { SW_TABLET_MODE, 1 } } },
> +=09{ KE_END },
> +};
> +
> +static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object=
 *data)
> +{
> +=09struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +=09u32 input_val =3D 0;
> +=09struct acpi_buffer input =3D {sizeof(input), &input_val};

Shouldn't it be `sizeof(input_val)`?


> +=09struct acpi_buffer output =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +=09acpi_status status;
> +=09union acpi_object *obj;
> +=09int code;
> +
> +=09status =3D wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
> +=09=09=09=09LENOVO_YMC_QUERY_INSTANCE,
> +=09=09=09=09LENOVO_YMC_QUERY_METHOD,
> +=09=09=09=09&input, &output);
> +
> +=09if (ACPI_FAILURE(status)) {
> +=09=09dev_warn(&wdev->dev,
> +=09=09=09"Failed to evaluate query method %ud\n", status);

I believe it should be "%u", or maybe even better:
"%s" and `acpi_format_exception(status)`.


> +=09=09return;
> +=09}
> +
> +=09obj =3D (union acpi_object *)output.pointer;

Small thing, but this cast is not strictly necessary.


> +
> +=09if (obj->type !=3D ACPI_TYPE_INTEGER) {
> +=09=09dev_warn(&wdev->dev,
> +=09=09=09"WMI event data is not an integer\n");
> +=09=09goto free_obj;
> +=09}
> +=09code =3D obj->integer.value;
> +
> +=09if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
> +=09=09dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
> +
> +free_obj:
> +=09kfree(obj);
> +=09lenovo_ymc_trigger_ec();
> +}
> +
> +static void lenovo_ymc_remove(struct wmi_device *wdev)
> +{
> +=09struct lenovo_ymc_private *priv =3D dev_get_drvdata(&wdev->dev);
> +
> +=09input_unregister_device(priv->input_dev);
> +}
> +
> +static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
> +{
> +=09struct input_dev *input_dev;
> +=09struct lenovo_ymc_private *priv;
> +=09int err;
> +
> +=09dmi_check_system(ec_trigger_quirk_dmi_table);
> +
> +=09priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +=09if (!priv)
> +=09=09return -ENOMEM;
> +
> +=09input_dev =3D input_allocate_device();

Is there any reason why you're not using `devm_input_allocate_device()` her=
e?
Then you could get rid of `lenovo_ymc_remove()` and the `err_free_dev` labe=
l.


> +=09if (!input_dev) {
> +=09=09return -ENOMEM;
> +=09}
> +
> +=09input_dev->name =3D "Lenovo Yoga Mode Control switch";
> +=09input_dev->phys =3D LENOVO_YMC_EVENT_GUID "/input0";
> +=09input_dev->id.bustype =3D BUS_HOST;
> +=09input_dev->dev.parent =3D &wdev->dev;
> +
> +=09input_set_capability(input_dev, EV_SW, SW_TABLET_MODE);
> +
> +=09err =3D sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
> +=09if (err) {
> +=09=09dev_err(&wdev->dev,
> +=09=09=09"Could not set up input device keymap: %d\n", err);
> +=09=09goto err_free_dev;
> +=09}
> +
> +=09err =3D input_register_device(input_dev);
> +=09if (err) {
> +=09=09dev_err(&wdev->dev,
> +=09=09=09"Could not register input device: %d\n", err);
> +=09=09goto err_free_dev;
> +=09}
> +
> +=09priv->input_dev =3D input_dev;
> +=09dev_set_drvdata(&wdev->dev, priv);
> +=09lenovo_ymc_trigger_ec();
> +=09return 0;
> +
> +err_free_dev:
> +=09input_free_device(input_dev);
> +=09return err;
> +}
> +
> +static const struct wmi_device_id lenovo_ymc_wmi_id_table[] =3D {
> +=09{ .guid_string =3D LENOVO_YMC_EVENT_GUID },
> +=09{ }
> +};
> +MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
> +
> +static struct wmi_driver lenovo_ymc_driver =3D {
> +=09.driver =3D {
> +=09=09.name =3D "lenovo-ymc",
> +=09},
> +=09.id_table =3D lenovo_ymc_wmi_id_table,
> +=09.probe =3D lenovo_ymc_probe,
> +=09.remove =3D lenovo_ymc_remove,
> +=09.notify =3D lenovo_ymc_notify,
> +};
> +
> +module_wmi_driver(lenovo_ymc_driver);
> +
> +MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
> +MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
> +MODULE_LICENSE("GPL");
> --
> 2.37.3


Regards,
Barnab=C3=A1s P=C5=91cze
