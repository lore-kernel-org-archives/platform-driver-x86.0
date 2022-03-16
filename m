Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5621AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 22:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353589AbiCPWLN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Mar 2022 18:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358220AbiCPWK5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Mar 2022 18:10:57 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42658240AF
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 15:09:40 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id j21so3069643qta.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Mar 2022 15:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FL8UQ7l4Gg8MKp1RhcdkJHlVVF8uG8Q5m0/mBuTiT+I=;
        b=H1777du3dMppB2hCWgNnsLSFz5CJW+M3ESdDh1bLQpCn1gL1ZSYylwY0gU0dhqUs/z
         tCFUbsoRPTI2FYBejCieDiBFmI+d761OfOITF/QHMEy8jL+mY2qc3hJTAuBOJHljbQJO
         gHf7huBhumjo2M67ob49yeLtrv4VfD4WpZ2OL84U5+odsx8tdHXGvSFVZB+LWRsb7bIE
         crO3e19ywh2SJm7XlVV7LaPBuIvESXbhDMzAUAkGZ3gqDLwcInhw9pxssWaQcBrpfPU9
         kT9MzxhUNXjmLSObdBumatVLsk6Z3P1B/HHom4+bMUyHe/ztrYKKhrU8uYFjuuciEbYu
         8MnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FL8UQ7l4Gg8MKp1RhcdkJHlVVF8uG8Q5m0/mBuTiT+I=;
        b=i8rRdzr7SlopLWL4KwgYQoqPk8ZsWBjoSyoh32HG4FfdKSaAU+eTobI/iYWPNJBtLN
         4ZdjLOflb+srlrr565/RA9EX7UEgSTBxVp2bttUu3GuaoN4cjWtD+wCR6WzZ7OhjVVgc
         4IJvr7XPAkYAk9lNN6PjVr4YrkSz+bTe5vV/t6+xwg9M9672peLPUNuY9Aveg5CY9q73
         HVaKGG3SZ3OZ0SxLVcBUR2zWtTqOt268OOIsNzYPsfoh77HiSVx/uf3NpDIz+PrEHUg9
         dzpD4pWmp862DCqTZ2HdBqIZCLFTKdxJ/q/xuCbCkn5+y5ktcihPHHAQMDlkHDX0cbu1
         edVA==
X-Gm-Message-State: AOAM531/SidrlIOVmY+3vWUxxsQ9SW4cHuHuVSZoJncFuzX5zaWcoANC
        EtfAjKWMbhH6QDz5Jsve/mOdPOky59C876AoUN92Qr3ErLs=
X-Google-Smtp-Source: ABdhPJxLNOItO/oesHGpCws4EY7105s6kuljjcbu8yA2K0nuA4gC1lTbIXRcyqmj7cfTXA7aXJTAEmvM1jXdpvkAPkM=
X-Received: by 2002:ac8:5b51:0:b0:2e1:e3e9:d98d with SMTP id
 n17-20020ac85b51000000b002e1e3e9d98dmr1557302qtw.55.1647468579175; Wed, 16
 Mar 2022 15:09:39 -0700 (PDT)
MIME-Version: 1.0
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com> <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
In-Reply-To: <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
From:   Alexandru Dinu <alex.dinu07@gmail.com>
Date:   Thu, 17 Mar 2022 00:09:03 +0200
Message-ID: <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com>
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused firmware
To:     platform-driver-x86@vger.kernel.org
Cc:     Daniel Dadap <ddadap@nvidia.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

> Note: the Tested-by: line above applies to the previous version of this
> patch; an explicit ACK from the tester is required for it to apply to
> the current version.

I compiled and tested v2 on 5.16.14.
Everything works as expected: brightness control & level restore work
both on first boot and on subsequent sleep/resume cycles.

Regards,
Alex



On Wed, 16 Mar 2022 at 23:28, Daniel Dadap <ddadap@nvidia.com> wrote:
>
> Sorry, just noticed a typo in a comment:
>
> /* This quirk is preset as of firmware revision HACN31WW */
>
> Obviously that is meant to read "present". I'll fix that with the next
> round of changes, assuming there will be additional review feedback.
>
> On 3/16/22 15:33, Daniel Dadap wrote:
> > Some notebook systems with EC-driven backlight control appear to have a
> > firmware bug which causes the system to use GPU-driven backlight contro=
l
> > upon a fresh boot, but then switches to EC-driven backlight control
> > after completing a suspend/resume cycle. All the while, the firmware
> > reports that the backlight is under EC control, regardless of what is
> > actually controlling the backlight brightness.
> >
> > This leads to the following behavior:
> >
> > * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
> >    WMI-wrapped ACPI method erroneously reporting EC control.
> > * nvidia-wmi-ec-backlight does not work until after a suspend/resume
> >    cycle, due to the backlight control actually being GPU-driven.
> > * GPU drivers also register their own backlight handlers: in the case
> >    of the notebook system where this behavior has been observed, both
> >    amdgpu and the NVIDIA proprietary driver register backlight handlers=
.
> > * The GPU which has backlight control upon a fresh boot (amdgpu in the
> >    case observed so far) can successfully control the backlight through
> >    its backlight driver's sysfs interface, but stops working after the
> >    first suspend/resume cycle.
> > * nvidia-wmi-ec-backlight is unable to control the backlight upon a
> >    fresh boot, but begins to work after the first suspend/resume cycle.
> > * The GPU which does not have backlight control (NVIDIA in this case)
> >    is not able to control the backlight at any point while the system
> >    is in operation. On similar hybrid systems with an EC-controlled
> >    backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
> >    does not register its backlight handler. It has not been determined
> >    whether the non-functional handler registered by the NVIDIA driver
> >    is due to another firmware bug, or a bug in the NVIDIA driver.
> >
> > Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
> > device, it takes precedence over the BACKLIGHT_RAW devices registered
> > by the GPU drivers. This in turn leads to backlight control appearing
> > to be non-functional until after completing a suspend/resume cycle.
> > However, it is still possible to control the backlight through direct
> > interaction with the working GPU driver's backlight sysfs interface.
> >
> > These systems also appear to have a second firmware bug which resets
> > the EC's brightness level to 100% on resume, but leaves the state in
> > the kernel at the pre-suspend level. This causes attempts to save
> > and restore the backlight level across the suspend/resume cycle to
> > fail, due to the level appearing not to change even though it did.
> >
> > In order to work around these issues, add a quirk table to detect
> > systems that are known to show these behaviors. So far, there is
> > only one known system that requires these workarounds, and both
> > issues are present on that system, but the quirks are tracked
> > separately to make it easier to add them to other systems which
> > may exhibit one of the bugs, but not the other. The original systems
> > that this driver was tested on during development do not exhibit
> > either of these quirks.
> >
> > If a system with the "GPU driver has backlight control" quirk is
> > detected, nvidia-wmi-ec-backlight will grab a reference to the working
> > (when freshly booted) GPU backlight handler and relays any backlight
> > brightness level change requests directed at the EC to also be applied
> > to the GPU backlight interface. This leads to redundant updates
> > directed at the GPU backlight driver after a suspend/resume cycle, but
> > it does allow the EC backlight control to work when the system is
> > freshly booted.
> >
> > If a system with the "backlight level reset to full on resume" quirk
> > is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> > reset the backlight to the previous level upon resume.
> >
> > These workarounds are also plumbed through to kernel module parameters,
> > to make it easier for users who suspect they may be affected by one or
> > both of these bugs to test whether these workarounds are effective on
> > their systems as well.
> >
> > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> > ---
> > Note: the Tested-by: line above applies to the previous version of this
> > patch; an explicit ACK from the tester is required for it to apply to
> > the current version.
> >
> > v2:
> >   * Add readable sysfs files for module params, use linear interpolatio=
n
> >     from fixp-arith.h, fix return value of notifier callback, use devm_=
*()
> >     for kzalloc and put_device. (Barnab=C3=A1s P=C5=91cze <pobrn@proton=
mail.com>)
> >   * Add comment to denote known firmware versions that exhibit the bugs=
.
> >     (Mario Limonciello <Mario.Limonciello@amd.com>)
> >   * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redhat.co=
m>)
> >
> >   .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++++++=
-
> >   1 file changed, 194 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/p=
latform/x86/nvidia-wmi-ec-backlight.c
> > index 61e37194df70..95e1ddf780fc 100644
> > --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > @@ -3,8 +3,12 @@
> >    * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> >    */
> >
> > +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
> > +
> >   #include <linux/acpi.h>
> >   #include <linux/backlight.h>
> > +#include <linux/dmi.h>
> > +#include <linux/fixp-arith.h>
> >   #include <linux/mod_devicetable.h>
> >   #include <linux/module.h>
> >   #include <linux/types.h>
> > @@ -75,6 +79,73 @@ struct wmi_brightness_args {
> >       u32 ignored[3];
> >   };
> >
> > +/**
> > + * struct nvidia_wmi_ec_backlight_priv - driver private data
> > + * @bl_dev:       the associated backlight device
> > + * @proxy_target: backlight device which receives relayed brightness c=
hanges
> > + * @notifier:     notifier block for resume callback
> > + */
> > +struct nvidia_wmi_ec_backlight_priv {
> > +     struct backlight_device *bl_dev;
> > +     struct backlight_device *proxy_target;
> > +     struct notifier_block nb;
> > +};
> > +
> > +static char *backlight_proxy_target;
> > +module_param(backlight_proxy_target, charp, 0444);
> > +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change requ=
ests to the named backlight driver, on systems which erroneously report EC =
backlight control.");
> > +
> > +static int max_reprobe_attempts =3D 128;
> > +module_param(max_reprobe_attempts, int, 0444);
> > +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when=
 relaying brightness change requests.");
> > +
> > +static bool restore_level_on_resume;
> > +module_param(restore_level_on_resume, bool, 0444);
> > +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level=
 when resuming from suspend, on systems which reset the EC's backlight leve=
l on resume.");
> > +
> > +/* Bit field values for quirks table */
> > +
> > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BIT(0)
> > +
> > +/* bits 1-7: reserved for future quirks; bits 8+: proxy target device =
names */
> > +
> > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BIT(8)
> > +
> > +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
> > +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
> > +
> > +static int assign_quirks(const struct dmi_system_id *id)
> > +{
> > +     if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
> > +             restore_level_on_resume =3D 1;
> > +
> > +     /* If the module parameter is set, override the quirks table */
> > +     if (!backlight_proxy_target) {
> > +             if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
> > +                     backlight_proxy_target =3D "amdgpu_bl1";
> > +     }
> > +
> > +     return true;
> > +}
> > +
> > +#define QUIRK_ENTRY(vendor, product, quirks) {          \
> > +     .callback =3D assign_quirks,                      \
> > +     .matches =3D {                                    \
> > +             DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
> > +             DMI_MATCH(DMI_PRODUCT_VERSION, product) \
> > +     },                                              \
> > +     .driver_data =3D (void *)(quirks)                 \
> > +}
> > +
> > +static const struct dmi_system_id quirks_table[] =3D {
> > +     QUIRK_ENTRY(
> > +             /* This quirk is preset as of firmware revision HACN31WW =
*/
> > +             "LENOVO", "Legion S7 15ACH6",
> > +             QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGPU_BL=
1)
> > +     ),
> > +     { }
> > +};
> > +
> >   /**
> >    * wmi_brightness_notify() - helper function for calling WMI-wrapped =
ACPI method
> >    * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTN=
ESS_GUID
> > @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_device=
 *w, enum wmi_brightness_metho
> >       return 0;
> >   }
> >
> > +/* Scale the current brightness level of 'from' to the range of 'to'. =
*/
> > +static int scale_backlight_level(const struct backlight_device *from,
> > +                              const struct backlight_device *to)
> > +{
> > +     int from_max =3D from->props.max_brightness;
> > +     int from_level =3D from->props.brightness;
> > +     int to_max =3D to->props.max_brightness;
> > +
> > +     return fixp_linear_interpolate(0, 0, from_max, to_max, from_level=
);
> > +}
> > +
> >   static int nvidia_wmi_ec_backlight_update_status(struct backlight_dev=
ice *bd)
> >   {
> >       struct wmi_device *wdev =3D bl_get_data(bd);
> > +     struct nvidia_wmi_ec_backlight_priv *priv =3D dev_get_drvdata(&wd=
ev->dev);
> > +     struct backlight_device *proxy_target =3D priv->proxy_target;
> > +
> > +     if (proxy_target) {
> > +             int level =3D scale_backlight_level(bd, proxy_target);
> > +
> > +             if (backlight_device_set_brightness(proxy_target, level))
> > +                     pr_warn("Failed to relay backlight update to \"%s=
\"",
> > +                             backlight_proxy_target);
> > +     }
> >
> >       return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
> >                                    WMI_BRIGHTNESS_MODE_SET,
> > @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_ec_b=
acklight_ops =3D {
> >       .get_brightness =3D nvidia_wmi_ec_backlight_get_brightness,
> >   };
> >
> > +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *=
nb, unsigned long event, void *d)
> > +{
> > +
> > +     /*
> > +      * On some systems, the EC backlight level gets reset to 100% whe=
n
> > +      * resuming from suspend, but the backlight device state still re=
flects
> > +      * the pre-suspend value. Refresh the existing state to sync the =
EC's
> > +      * state back up with the kernel's.
> > +      */
> > +     if (event =3D=3D PM_POST_SUSPEND) {
> > +             struct nvidia_wmi_ec_backlight_priv *p;
> > +             int ret;
> > +
> > +             p =3D container_of(nb, struct nvidia_wmi_ec_backlight_pri=
v, nb);
> > +             ret =3D backlight_update_status(p->bl_dev);
> > +
> > +             if (ret)
> > +                     pr_warn("failed to refresh backlight level: %d", =
ret);
> > +
> > +             return NOTIFY_OK;
> > +     }
> > +
> > +     return NOTIFY_DONE;
> > +}
> > +
> > +static void putdev(void *data)
> > +{
> > +     struct device *dev =3D data;
> > +
> > +     put_device(dev);
> > +}
> > +
> >   static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, con=
st void *ctx)
> >   {
> > +     struct backlight_device *bdev, *target =3D NULL;
> > +     struct nvidia_wmi_ec_backlight_priv *priv;
> >       struct backlight_properties props =3D {};
> > -     struct backlight_device *bdev;
> >       u32 source;
> >       int ret;
> >
> > +     /*
> > +      * Check quirks tables to see if this system needs any of the fir=
mware
> > +      * bug workarounds.
> > +      */
> > +     dmi_check_system(quirks_table);
> > +
> > +     if (backlight_proxy_target && backlight_proxy_target[0]) {
> > +             static int num_reprobe_attempts;
> > +
> > +             target =3D backlight_device_get_by_name(backlight_proxy_t=
arget);
> > +
> > +             if (target) {
> > +                     ret =3D devm_add_action_or_reset(&wdev->dev, putd=
ev,
> > +                                                    &target->dev);
> > +                     if (ret)
> > +                             return ret;
> > +             } else {
> > +                     /*
> > +                      * The target backlight device might not be ready=
;
> > +                      * try again and disable backlight proxying if it
> > +                      * fails too many times.
> > +                      */
> > +                     if (num_reprobe_attempts < max_reprobe_attempts) =
{
> > +                             num_reprobe_attempts++;
> > +                             return -EPROBE_DEFER;
> > +                     }
> > +
> > +                     pr_warn("Unable to acquire %s after %d attempts. =
Disabling backlight proxy.",
> > +                             backlight_proxy_target, max_reprobe_attem=
pts);
> > +             }
> > +     }
> > +
> >       ret =3D wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
> >                                  WMI_BRIGHTNESS_MODE_GET, &source);
> >       if (ret)
> > @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struct wm=
i_device *wdev, const void *ct
> >                                             &wdev->dev, wdev,
> >                                             &nvidia_wmi_ec_backlight_op=
s,
> >                                             &props);
> > -     return PTR_ERR_OR_ZERO(bdev);
> > +
> > +     if (IS_ERR(bdev))
> > +             return PTR_ERR(bdev);
> > +
> > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +
> > +     priv->bl_dev =3D bdev;
> > +
> > +     dev_set_drvdata(&wdev->dev, priv);
> > +
> > +     if (target) {
> > +             int level =3D scale_backlight_level(target, bdev);
> > +
> > +             if (backlight_device_set_brightness(bdev, level))
> > +                     pr_warn("Unable to import initial brightness leve=
l from %s.",
> > +                             backlight_proxy_target);
> > +             priv->proxy_target =3D target;
> > +     }
> > +
> > +     if (restore_level_on_resume) {
> > +             priv->nb.notifier_call =3D nvidia_wmi_ec_backlight_pm_not=
ifier;
> > +             register_pm_notifier(&priv->nb);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
> > +{
> > +     struct nvidia_wmi_ec_backlight_priv *priv =3D dev_get_drvdata(&wd=
ev->dev);
> > +
> > +     if (priv->nb.notifier_call)
> > +             unregister_pm_notifier(&priv->nb);
> >   }
> >
> >   #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> > @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_dr=
iver =3D {
> >               .name =3D "nvidia-wmi-ec-backlight",
> >       },
> >       .probe =3D nvidia_wmi_ec_backlight_probe,
> > +     .remove =3D nvidia_wmi_ec_backlight_remove,
> >       .id_table =3D nvidia_wmi_ec_backlight_id_table,
> >   };
> >   module_wmi_driver(nvidia_wmi_ec_backlight_driver);
