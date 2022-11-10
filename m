Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1C68C4332F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 10 Nov 2022 20:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbiKJUDJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 10 Nov 2022 15:03:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiKJUDI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Nov 2022 15:03:08 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4097AA1B4
        for <platform-driver-x86@vger.kernel.org>; Thu, 10 Nov 2022 12:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1668110577; bh=yWLpYuJO90+xcTOt7cKVTiFJzXBOtkM5Lr7xoSWgXbQ=;
        h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
        b=CfLfHoIa9rXOagwE3jb1bPxT7HSVOLyJxjqophkwMGl2g+FyuDnye74Sm6zokg2Kl
         CENu96DltTiiTs4zauHzdlW2YU97I3MgW/FBLeejWNvMwPRL/g0layae64lolwcvHK
         m0lNrzaOom8n/uaZob0RjJH3ydBOHV6XynxQZ+bPS3OXYEmtp7rhA13+TRxBsv04bf
         866Iq0sF24lX7PF1nn4FXMkoS12AMYyr78a9zwEjGNaOPAR1vwD36dBsELexBDBXr/
         LNMkOZPtcbniSMhRDnGtNSSNyo3kytAqJ/OTaco4UHUnadpGf9vzJgq7xVw/drDAzs
         huvhbeP+N3/gg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.224.253] ([46.114.152.51]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgNcz-1pTucp1WPP-00hu7X; Thu, 10
 Nov 2022 21:02:57 +0100
Message-ID: <362cfa1aa490d226218b30d10d2b392fd7e96abb.camel@gmx.net>
Subject: Re: [PATCH] Add IdeaPad WMI Fn Keys driver
From:   Philipp Jungkamp <p.jungkamp@gmx.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Thu, 10 Nov 2022 21:02:50 +0100
In-Reply-To: <c251e107-2ad2-417d-c184-b67e778b905a@redhat.com>
References: <20220911160404.21692-1-p.jungkamp@gmx.net>
         <6c38ca87-d427-d34b-73d1-edb6df75af1b@redhat.com>
         <c251e107-2ad2-417d-c184-b67e778b905a@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1 
MIME-Version: 1.0
X-Provags-ID: V03:K1:hnxPnzcoHMo5+dy+nmWWVk5u/wDjl3wvI4BmKPFuj4/HMTgKuMR
 ewliktxSXgs8o4Wa26wlYS2mUWQt4apiWbqZwKjzzzLbuFHvyanKepFiSLWcp6KvGMHl2sP
 TV2NmOVDaSS65BDZNCxEba6bD9DRVe4qjhDMwix1vDw/xYxWOOKtCtmQ3Cj+dNy4mwqL/pB
 DayHQEhIYdu0sk93gE5lA==
UI-OutboundReport: notjunk:1;M01:P0:UXYbup8ZjbE=;eTXH5U7deDc4BmJPpPv6DOVxq3z
 EsU5/Sc6Qjs+ZE/YS/EzlnWMHljjrbcm5CuKBydmUrRQOCc9Zl09YmHhKAHofZWvlre9O42jx
 4ndoWkq23YbkjgbQrEE97RYqOW1uSnYnmmFm56AtQ5JbZ6DaP4bde/P0S6c0WDZrT1IbfKFPD
 3/07EOTFbPrjbD7lN3BWgNc0ZNqDP+BojvtVyGRnid1C886ZXoq6HaqapKNzDQrYKVmfNCJlI
 N0wqTUJWjEJzjOmoKBSnWGcdORmW8ynTeqERPu62egCI7cjueAdVUJepxSrwnOaAUGJpVc+G3
 x/+sWbU3vH6fCV9Fw+gfSlWKhrq27vH3rm5WrnRt1JhOHoT+PJ86OALUuh3Rkx9PB3Bq/3RJ9
 NwPUgg3bzFS0/QJnx2xA/+8lVuxGYs3+NocYAANS6f8lCWoF/GMwNcsRF+hdNlET4wf56/Kv9
 F/na/QepYHDrkeBkYabR6h8QM2g7aXSSbdb+req+MPI86lEgijmhwGhjz58y0pp6H0YmUdyDH
 tgE/HTR9TgRNEbMKMWfvK1kZSE6Ua3K2IFvMuOoYmeeovYoTedEmWiqFlHNuxmHccUOVSaC2n
 6Um/p8/Q5iCkOHlkUHUjTkMlA+HIjMKCruNHJGJSfoMIqjcrEeM8bBqUVCwnETLQknC3KfECK
 W/BBK4QRYrjGSTDtWX1mUHcKCZkINu5rmFxdOn3fScBBIw6PqIWRty6LLSf8zyDxuXbVNi7nc
 SNBpq3EzQDMv+GgpD2XPd7BurO2lmfJlBGB7wd34an6oeEz8srDytJ/eKq9JCsmQOdghr5MdS
 JEhqlrpfyT8ay3Z4Ae9nnMoeA+gBq+ZdBcm05cWmnQPyPB3hU3aqrzAWUCTv2Hfa8n8Riyu42
 tMgKtz/xvZiKaTLxkvx4ald3JnLbtJ01pvO3ACBl3VRSzsSo1qAz0yAS1Paf91TMYqUlNWuDB
 H7yeTHPsCcriG4+QsMPoTJd2gd0=
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2022-09-19 at 08:54 +0100, Hans de Goede wrote:
> Hi again,
>=20
> On 9/11/22 17:18, Hans de Goede wrote:
> > Hi Philipp,
> >=20
> > On 9/11/22 18:04, Philipp Jungkamp wrote:
> > > Create an input device for WMI events corresponding to some
> > > special
> > > keys on the 'Lenovo Yoga' line.
> > >=20
> > > This include the 3 keys to the right on the 'Lenovo Yoga9 14IAP7'
> > > and
> > > additionally the 'Lenovo Support' and 'Lenovo Favorites' (star
> > > with 'S'
> > > inside) in the fn key row as well as the event emitted on 'Fn+R'
> > > which
> > > toggles between 60Hz and 90Hz display refresh rate on windows.
> > >=20
> > > Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
> > > ---
> > > I found this patch by poking in the DSDT. I have not submitted
> > > any
> > > notable patches yet and hope you can help me improve in case I
> > > make
> > > unfortunate choices during submission.
> >=20
> > No worries at a first glance (I have not looked at this in any
> > detail yet) this looks pretty good for a first submission.
> >=20
> > And thank you for contributing to the Linux kernel!
> >=20
> >=20
> > > Philipp Jungkamp
> > >=20
> > >  drivers/platform/x86/Kconfig       |  13 +++
> > >  drivers/platform/x86/Makefile      |   1 +
> > >  drivers/platform/x86/ideapad-wmi.c | 153
> > > +++++++++++++++++++++++++++++
> > >  3 files changed, 167 insertions(+)
> > >  create mode 100644 drivers/platform/x86/ideapad-wmi.c
> > >=20
> > > diff --git a/drivers/platform/x86/Kconfig
> > > b/drivers/platform/x86/Kconfig
> > > index f2f98e942cf2..e7c5148e5cb4 100644
> > > --- a/drivers/platform/x86/Kconfig
> > > +++ b/drivers/platform/x86/Kconfig
> > > @@ -140,6 +140,19 @@ config YOGABOOK_WMI
> > >           To compile this driver as a module, choose M here: the
> > > module will
> > >           be called lenovo-yogabook-wmi.
> > >=20
> > > +config IDEAPAD_WMI
> > > +       tristate "Lenovo IdeaPad WMI Fn Keys"
> > > +       depends on ACPI_WMI
> > > +       depends on INPUT
> > > +       select INPUT_SPARSEKMAP
> > > +       help
> > > +         Say Y here if you want to receive key presses from some
> > > lenovo
> > > +         specific keys. (Star Key, Support Key, Virtual
> > > Background,
> > > +         Dark Mode Toggle, ...)
> > > +
> > > +         To compile this driver as a module, choose M here: the
> > > module will
> > > +         be called ideapad-wmi.
> > > +
> > >  config ACERHDF
> > >         tristate "Acer Aspire One temperature and fan driver"
> > >         depends on ACPI && THERMAL
> > > diff --git a/drivers/platform/x86/Makefile
> > > b/drivers/platform/x86/Makefile
> > > index 5a428caa654a..d8bec884d6bc 100644
> > > --- a/drivers/platform/x86/Makefile
> > > +++ b/drivers/platform/x86/Makefile
> > > @@ -16,6 +16,7 @@ obj-
> > > $(CONFIG_PEAQ_WMI)                        +=3D peaq-wmi.o
> > >  obj-$(CONFIG_XIAOMI_WMI)               +=3D xiaomi-wmi.o
> > >  obj-$(CONFIG_GIGABYTE_WMI)             +=3D gigabyte-wmi.o
> > >  obj-$(CONFIG_YOGABOOK_WMI)             +=3D lenovo-yogabook-wmi.o
> > > +obj-$(CONFIG_IDEAPAD_WMI)              +=3D ideapad-wmi.o
> > >=20
> > >  # Acer
> > >  obj-$(CONFIG_ACERHDF)          +=3D acerhdf.o
> > > diff --git a/drivers/platform/x86/ideapad-wmi.c
> > > b/drivers/platform/x86/ideapad-wmi.c
> > > new file mode 100644
> > > index 000000000000..38f7b3d0c171
> > > --- /dev/null
> > > +++ b/drivers/platform/x86/ideapad-wmi.c
> > > @@ -0,0 +1,153 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +/*
> > > + * ideapad-wmi.c - Ideapad WMI fn keys driver
> > > + *
> > > + * Copyright (C) 2022 Philipp Jungkamp <p.jungkamp@gmx.net>
> > > + */
> > > +
> > > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > > +
> > > +#include <linux/acpi.h>
> > > +#include <linux/input.h>
> > > +#include <linux/input/sparse-keymap.h>
> > > +#include <linux/list.h>
> > > +#include <linux/module.h>
> > > +#include <linux/wmi.h>
> > > +
> > > +#define IDEAPAD_FN_KEY_EVENT_GUID      "8FC0DE0C-B4E4-43FD-B0F3-
> > > 8871711C1294"
> >=20
> > At a first hunch (basically huh, don't we have a driver for that
> > already?) I grepped through the kernel sources and found:
> >=20
> > drivers/platform/x86/ideapad-laptop.c
> >=20
> > can you see if you can make things work with that driver?
>=20
> So I have taken a quick look at this and it seems to me that this
> really should be able to work with the existing ideapad-laptop.c code
> ?
>=20
> For starters you could add a debug printk / dev_info to this block,
>=20
> #if IS_ENABLED(CONFIG_ACPI_WMI)
>         for (i =3D 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
>                 status =3D
> wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
>                                                   =20
> ideapad_wmi_notify, priv);
>                 if (ACPI_SUCCESS(status)) {
>                         priv->fnesc_guid =3D
> ideapad_wmi_fnesc_events[i];
>                         break;
>                 }
>         }
>=20
>         if (ACPI_FAILURE(status) && status !=3D AE_NOT_EXIST) {
>                 err =3D -EIO;
>                 goto notification_failed_wmi;
>         }
> #endif
>=20
> checking which event GUID ideapad-laptop binds to on your laptop.
> Assuming that
> it does bind to the GUID this driver is binding to too, then it would
> be
> a matter of extending the existing ideapad_wmi_notify() to do the
> same
> as your notify function in this stand-alone driver. Note you can get
> the
> the equivalend of the union acpi_object *data argument in your wmi
> handler
> by calling wmi_get_event_data().
>=20
> Regards,
>=20
> Hans
>=20

Hello Hans,

I did actually start by doing that.
The problem lies with the wmi_get_event_data() function not working
for my ACPI.

wmi_get_event_data() takes the event notify_id as input and is supposed
to give the data associated with the event back. This occures by
calling _WED on the first WMI block that contains said notify_id.

drivers/platform/x86/wmi.c:657:
	list_for_each_entry(wblock, &wmi_block_list, list) {
		struct guid_block *gblock =3D &wblock->gblock;

		if ((gblock->flags & ACPI_WMI_EVENT) && gblock-
>notify_id =3D=3D event)
			return get_event_data(wblock, out);
	}

The ACPI of the Lenovo Yoga 9 14IAP7 contains multiple WMI event
blocks hat contain the same notify_id 0xD0.

Here are two of the four WMI objects found in the DSDT:

in _WDG of block WMIY:
	06129D99-6083-4164-81AD-F092F9D773A6:
		notify_id: 0xD0
		instance_count: 1
		flags: 0x8 ACPI_WMI_EVENT

in _WDG of block WMIU:
	8FC0DE0C-B4E4-43FD-B0F3-8871711C1294:
		notify_id: 0xD0
		instance_count: 1
		flags: 0x8 ACPI_WMI_EVENT

These event block belong to different WMI devices and report
unrelated values from different _WED handlers. WMIY for example
triggers its event on "mode changes", e.g. laptop/tablet/tent based
on the accelometers/hinge.
WMIU is the WMI block with the event which reports the special keys
I'm interested in.

WMIY comes before WMIU in the wmi_block_list.
Calling wmi_get_event_data() in ideapad_wmi_notify() calls the wrong
_WED (the one of WMIY) and thus returns the wrong event data.

I noticed that the wmi_driver interface does not incur the problem
with the event because it binds to a wmi_block and calls the _WED
directly without searching through other WMI devices.

I thought of changing the signature of wmi_get_event_data() to include
the GUID of the correct WMI block, but chose wmi_driver instead.
Would you consider adding a wmi_get_event_data_for_guid() function to
the wmi module and using that in the ideapad_wmi_notify function to be
a better solution than the one in the patch presented here?

Regards,
Philipp

>=20
>=20
> > > +
> > > +struct ideapad_wmi_private {
> > > +       struct wmi_device *wmi_device;
> > > +       struct input_dev *input_dev;
> > > +};
> > > +
> > > +static const struct key_entry ideapad_wmi_fn_key_keymap[] =3D {
> > > +       /* FnLock (handled by the firmware) */
> > > +       { KE_IGNORE,    0x02 },
> > > +       /* Customizable Lenovo Hotkey ("star" with 'S' inside) */
> > > +       { KE_KEY,       0x01, { KEY_FAVORITES } },
> > > +       /* Dark mode toggle */
> > > +       { KE_KEY,       0x13, { KEY_PROG1 } },
> > > +       /* Sound profile switch */
> > > +       { KE_KEY,       0x12, { KEY_PROG2 } },
> > > +       /* Lenovo Virtual Background application */
> > > +       { KE_KEY,       0x28, { KEY_PROG3 } },
> > > +       /* Lenovo Support */
> > > +       { KE_KEY,       0x27, { KEY_HELP } },
> > > +       /* Refresh Rate Toggle */
> > > +       { KE_KEY,       0x0a, { KEY_DISPLAYTOGGLE } },
> > > +       { KE_END },
> > > +};
> > > +
> > > +static int ideapad_wmi_input_init(struct ideapad_wmi_private
> > > *priv)
> > > +{
> > > +       struct input_dev *input_dev;
> > > +       int err;
> > > +
> > > +       input_dev =3D input_allocate_device();
> > > +       if (!input_dev) {
> > > +               return -ENOMEM;
> > > +       }
> > > +
> > > +       input_dev->name =3D "Ideapad WMI Fn Keys";
> > > +       input_dev->phys =3D IDEAPAD_FN_KEY_EVENT_GUID "/input0";
> > > +       input_dev->id.bustype =3D BUS_HOST;
> > > +       input_dev->dev.parent =3D &priv->wmi_device->dev;
> > > +
> > > +       err =3D sparse_keymap_setup(input_dev,
> > > ideapad_wmi_fn_key_keymap, NULL);
> > > +       if (err) {
> > > +               dev_err(&priv->wmi_device->dev,
> > > +                       "Could not set up input device keymap:
> > > %d\n", err);
> > > +               goto err_free_dev;
> > > +       }
> > > +
> > > +       err =3D input_register_device(input_dev);
> > > +       if (err) {
> > > +               dev_err(&priv->wmi_device->dev,
> > > +                       "Could not register input device: %d\n",
> > > err);
> > > +               goto err_free_dev;
> > > +       }
> > > +
> > > +       priv->input_dev =3D input_dev;
> > > +       return 0;
> > > +
> > > +err_free_dev:
> > > +       input_free_device(input_dev);
> > > +       return err;
> > > +}
> > > +
> > > +static void ideapad_wmi_input_exit(struct ideapad_wmi_private
> > > *priv)
> > > +{
> > > +       input_unregister_device(priv->input_dev);
> > > +       priv->input_dev =3D NULL;
> > > +}
> > > +
> > > +static void ideapad_wmi_input_report(struct ideapad_wmi_private
> > > *priv,
> > > +                                    unsigned int scancode)
> > > +{
> > > +       sparse_keymap_report_event(priv->input_dev, scancode, 1,
> > > true);
> > > +}
> > > +
> > > +static int ideapad_wmi_probe(struct wmi_device *wdev, const void
> > > *ctx)
> > > +{
> > > +       struct ideapad_wmi_private *priv;
> > > +       int err;
> > > +
> > > +       priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv),
> > > GFP_KERNEL);
> > > +       if (!priv)
> > > +               return -ENOMEM;
> > > +
> > > +       dev_set_drvdata(&wdev->dev, priv);
> > > +
> > > +       priv->wmi_device =3D wdev;
> > > +
> > > +       err =3D ideapad_wmi_input_init(priv);
> > > +       if (err)
> > > +               return err;
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static void ideapad_wmi_remove(struct wmi_device *wdev)
> > > +{
> > > +       struct ideapad_wmi_private *priv =3D dev_get_drvdata(&wdev-
> > > >dev);
> > > +
> > > +       ideapad_wmi_input_exit(priv);
> > > +}
> > > +
> > > +static void ideapad_wmi_notify(struct wmi_device *wdev, union
> > > acpi_object *data)
> > > +{
> > > +       struct ideapad_wmi_private *priv =3D dev_get_drvdata(&wdev-
> > > >dev);
> > > +
> > > +       if(data->type !=3D ACPI_TYPE_INTEGER) {
> > > +               dev_warn(&priv->wmi_device->dev,
> > > +                       "WMI event data is not an integer\n");
> > > +               return;
> > > +       }
> > > +
> > > +       ideapad_wmi_input_report(priv, data->integer.value);
> > > +}
> > > +
> > > +static const struct wmi_device_id ideapad_wmi_id_table[] =3D {
> > > +       {       /* Special Keys on the Yoga 9 14IAP7 */
> > > +               .guid_string =3D IDEAPAD_FN_KEY_EVENT_GUID
> > > +       },
> > > +       { }
> > > +};
> > > +
> > > +static struct wmi_driver ideapad_wmi_driver =3D {
> > > +       .driver =3D {
> > > +               .name =3D "ideapad-wmi",
> > > +       },
> > > +       .id_table =3D ideapad_wmi_id_table,
> > > +       .probe =3D ideapad_wmi_probe,
> > > +       .remove =3D ideapad_wmi_remove,
> > > +       .notify =3D ideapad_wmi_notify,
> > > +};
> > > +
> > > +module_wmi_driver(ideapad_wmi_driver);
> > > +
> > > +MODULE_DEVICE_TABLE(wmi, ideapad_wmi_id_table);
> > > +MODULE_AUTHOR("Philipp Jungkamp <p.jungkamp@gmx.net>");
> > > +MODULE_DESCRIPTION("Ideapad WMI fn keys driver");
> > > +MODULE_LICENSE("GPL");
> > > --
> > > 2.37.3
> > >=20
>=20

