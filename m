Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0ECC636CC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 31 Jan 2023 19:56:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjAaT4s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 31 Jan 2023 14:56:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjAaT4r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Jan 2023 14:56:47 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79063530CA
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Jan 2023 11:56:42 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id t12so17077386lji.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 31 Jan 2023 11:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8B7IwQZmx98jqRZyCaxyQ+lbiZ0aygxyAf6OL5lcfM=;
        b=QCK3Bs9aaiVZboXLuQmOUwLybTih8wzZnB5xMFN/MvAT7lJz6ln8A4Ieeh4EhLF5w1
         qcmoDlGZFBcIezAH3+9LBKLlSkbALmQcPWl31C8B8M+z62E5n+jDKrwo8T+KClWfktKl
         DdIphC28k8ss0iBlbjcC91Xat3sy16IbGIOT3kri10Z7JTlc+pnHA+TBb1iNUUPYJmvn
         DCYJsyoyQRhSR5fn3Eiptf3P4lnfAtnKmLMx7hg57Z3hBqOSknMFSlFufNvCQagaS7PH
         jIDXS3x36OOOGOy63vli/hTXOu77/+Zekzq+D3O3GCrhFHgaCY1hdvlNCyqBgbpIV2vw
         nxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D8B7IwQZmx98jqRZyCaxyQ+lbiZ0aygxyAf6OL5lcfM=;
        b=hiho+uSw3A628RL5oVs2cT5ObMVIDW4LI40PyxT229mnXYXaw7oZ63Vpr5ZZ08C0/1
         xrDL7Oik1LVf8pcm4p7B6ogixy9CA2KshdZhUO6PIkdEGFqQiswE+nup2OOfJIJJbUdX
         kzu4zuse/3l/xurUWdN0TF4MpS6afpozY5I722DBgEMLMS0b9nQxwL23M+PdrMQXxZOo
         1+gqYY61RpVS3jMCvG42JbQ+WSjMqBTFwI/j5rRFMe+s0fSWK25K0Gq46SaR572gLC3A
         Pek+obwlZiY1rIj2VvqGe3F8OoE/eoSTmpxiO0Kql0wKWJaIJZ5P3qht01+XPeeqJmGT
         092Q==
X-Gm-Message-State: AFqh2koAukfvYdNMOrHOQoh2Hc7LqrnGw8V2Uw5PMQMOhYexl0p09wjs
        8ZOrQNfAOXzu9y+znJlxG7Xxb2eEEW32ODrRN0w=
X-Google-Smtp-Source: AMrXdXtnqOLaB9vbzsUecdGIsCILSIy0+JMVZUwT7FV84226KDIsMvw53sCOqaHhjaf4cX7EvO2+H/iahZpqxmu3AVo=
X-Received: by 2002:a2e:8246:0:b0:28b:7bae:65de with SMTP id
 j6-20020a2e8246000000b0028b7bae65demr4494799ljh.124.1675195000482; Tue, 31
 Jan 2023 11:56:40 -0800 (PST)
MIME-Version: 1.0
References: <0fbfd32e-904d-1e04-8508-e863c357a2ff@nvidia.com>
 <20220316203325.2242536-1-ddadap@nvidia.com> <26e0d196-5b2d-6bdc-8cbf-19c5bb9736e4@nvidia.com>
 <CAJOTRr6J7-E_dt+zbh6S=rg62PodsQBXYUFhxJOAqbj4w=ns=w@mail.gmail.com> <Y9g96nNy5iJFBy0L@ddadap-lakeline.nvidia.com>
In-Reply-To: <Y9g96nNy5iJFBy0L@ddadap-lakeline.nvidia.com>
From:   Alexandru Dinu <alex.dinu07@gmail.com>
Date:   Tue, 31 Jan 2023 21:56:03 +0200
Message-ID: <CAJOTRr7Fek9PKSkJHbqZQUy8awXcVeVc=K1sXhqEUbjEXaSfQQ@mail.gmail.com>
Subject: Re: [PATCH v2] nvidia-wmi-ec-backlight: Add workarounds for confused firmware
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        "Limonciello, Mario" <Mario.Limonciello@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

I updated from HACN31WW to the latest HACN39WW and tested on a fresh
6.1.7 kernel.
The brightness issue is not fixed -- same old behaviour: controls only
work after an initial resume from suspend.

So far, I've been using your patched version of the
nvidia-wmi-ec-backlight module which worked great -- manually patching
the module after each kernel update.

> somebody else reported a similar issue recently which appears to be resol=
ved by updating to the latest firmware version.

Can you please point me to this reference?

Thank you!


On Tue, 31 Jan 2023 at 00:00, Daniel Dadap <ddadap@nvidia.com> wrote:
>
> Hi Alex,
>
> On Thu, Mar 17, 2022 at 12:09:03AM +0200, Alexandru Dinu wrote:
> > > Note: the Tested-by: line above applies to the previous version of th=
is
> > > patch; an explicit ACK from the tester is required for it to apply to
> > > the current version.
> >
> > I compiled and tested v2 on 5.16.14.
> > Everything works as expected: brightness control & level restore work
> > both on first boot and on subsequent sleep/resume cycles.
>
> I ended up abandoning this workaround patch because it was incompatible
> with Hans's plan to clean up the backlight subsystem. In the meantime,
> somebody else reported a similar issue recently which appears to be
> resolved by updating to the latest firmware version. Have you updated to
> the most recent firmware, and if so, are you still seeing this issue?
>
> > Regards,
> > Alex
> >
> >
> >
> > On Wed, 16 Mar 2022 at 23:28, Daniel Dadap <ddadap@nvidia.com> wrote:
> > >
> > > Sorry, just noticed a typo in a comment:
> > >
> > > /* This quirk is preset as of firmware revision HACN31WW */
> > >
> > > Obviously that is meant to read "present". I'll fix that with the nex=
t
> > > round of changes, assuming there will be additional review feedback.
> > >
> > > On 3/16/22 15:33, Daniel Dadap wrote:
> > > > Some notebook systems with EC-driven backlight control appear to ha=
ve a
> > > > firmware bug which causes the system to use GPU-driven backlight co=
ntrol
> > > > upon a fresh boot, but then switches to EC-driven backlight control
> > > > after completing a suspend/resume cycle. All the while, the firmwar=
e
> > > > reports that the backlight is under EC control, regardless of what =
is
> > > > actually controlling the backlight brightness.
> > > >
> > > > This leads to the following behavior:
> > > >
> > > > * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
> > > >    WMI-wrapped ACPI method erroneously reporting EC control.
> > > > * nvidia-wmi-ec-backlight does not work until after a suspend/resum=
e
> > > >    cycle, due to the backlight control actually being GPU-driven.
> > > > * GPU drivers also register their own backlight handlers: in the ca=
se
> > > >    of the notebook system where this behavior has been observed, bo=
th
> > > >    amdgpu and the NVIDIA proprietary driver register backlight hand=
lers.
> > > > * The GPU which has backlight control upon a fresh boot (amdgpu in =
the
> > > >    case observed so far) can successfully control the backlight thr=
ough
> > > >    its backlight driver's sysfs interface, but stops working after =
the
> > > >    first suspend/resume cycle.
> > > > * nvidia-wmi-ec-backlight is unable to control the backlight upon a
> > > >    fresh boot, but begins to work after the first suspend/resume cy=
cle.
> > > > * The GPU which does not have backlight control (NVIDIA in this cas=
e)
> > > >    is not able to control the backlight at any point while the syst=
em
> > > >    is in operation. On similar hybrid systems with an EC-controlled
> > > >    backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driv=
er
> > > >    does not register its backlight handler. It has not been determi=
ned
> > > >    whether the non-functional handler registered by the NVIDIA driv=
er
> > > >    is due to another firmware bug, or a bug in the NVIDIA driver.
> > > >
> > > > Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE typ=
e
> > > > device, it takes precedence over the BACKLIGHT_RAW devices register=
ed
> > > > by the GPU drivers. This in turn leads to backlight control appeari=
ng
> > > > to be non-functional until after completing a suspend/resume cycle.
> > > > However, it is still possible to control the backlight through dire=
ct
> > > > interaction with the working GPU driver's backlight sysfs interface=
.
> > > >
> > > > These systems also appear to have a second firmware bug which reset=
s
> > > > the EC's brightness level to 100% on resume, but leaves the state i=
n
> > > > the kernel at the pre-suspend level. This causes attempts to save
> > > > and restore the backlight level across the suspend/resume cycle to
> > > > fail, due to the level appearing not to change even though it did.
> > > >
> > > > In order to work around these issues, add a quirk table to detect
> > > > systems that are known to show these behaviors. So far, there is
> > > > only one known system that requires these workarounds, and both
> > > > issues are present on that system, but the quirks are tracked
> > > > separately to make it easier to add them to other systems which
> > > > may exhibit one of the bugs, but not the other. The original system=
s
> > > > that this driver was tested on during development do not exhibit
> > > > either of these quirks.
> > > >
> > > > If a system with the "GPU driver has backlight control" quirk is
> > > > detected, nvidia-wmi-ec-backlight will grab a reference to the work=
ing
> > > > (when freshly booted) GPU backlight handler and relays any backligh=
t
> > > > brightness level change requests directed at the EC to also be appl=
ied
> > > > to the GPU backlight interface. This leads to redundant updates
> > > > directed at the GPU backlight driver after a suspend/resume cycle, =
but
> > > > it does allow the EC backlight control to work when the system is
> > > > freshly booted.
> > > >
> > > > If a system with the "backlight level reset to full on resume" quir=
k
> > > > is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> > > > reset the backlight to the previous level upon resume.
> > > >
> > > > These workarounds are also plumbed through to kernel module paramet=
ers,
> > > > to make it easier for users who suspect they may be affected by one=
 or
> > > > both of these bugs to test whether these workarounds are effective =
on
> > > > their systems as well.
> > > >
> > > > Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> > > > Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> > > > ---
> > > > Note: the Tested-by: line above applies to the previous version of =
this
> > > > patch; an explicit ACK from the tester is required for it to apply =
to
> > > > the current version.
> > > >
> > > > v2:
> > > >   * Add readable sysfs files for module params, use linear interpol=
ation
> > > >     from fixp-arith.h, fix return value of notifier callback, use d=
evm_*()
> > > >     for kzalloc and put_device. (Barnab=C3=A1s P=C5=91cze <pobrn@pr=
otonmail.com>)
> > > >   * Add comment to denote known firmware versions that exhibit the =
bugs.
> > > >     (Mario Limonciello <Mario.Limonciello@amd.com>)
> > > >   * Unify separate per-quirk tables. (Hans de Goede <hdegoede@redha=
t.com>)
> > > >
> > > >   .../platform/x86/nvidia-wmi-ec-backlight.c    | 196 +++++++++++++=
++++-
> > > >   1 file changed, 194 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drive=
rs/platform/x86/nvidia-wmi-ec-backlight.c
> > > > index 61e37194df70..95e1ddf780fc 100644
> > > > --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > > +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> > > > @@ -3,8 +3,12 @@
> > > >    * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
> > > >    */
> > > >
> > > > +#define pr_fmt(f) KBUILD_MODNAME ": " f "\n"
> > > > +
> > > >   #include <linux/acpi.h>
> > > >   #include <linux/backlight.h>
> > > > +#include <linux/dmi.h>
> > > > +#include <linux/fixp-arith.h>
> > > >   #include <linux/mod_devicetable.h>
> > > >   #include <linux/module.h>
> > > >   #include <linux/types.h>
> > > > @@ -75,6 +79,73 @@ struct wmi_brightness_args {
> > > >       u32 ignored[3];
> > > >   };
> > > >
> > > > +/**
> > > > + * struct nvidia_wmi_ec_backlight_priv - driver private data
> > > > + * @bl_dev:       the associated backlight device
> > > > + * @proxy_target: backlight device which receives relayed brightne=
ss changes
> > > > + * @notifier:     notifier block for resume callback
> > > > + */
> > > > +struct nvidia_wmi_ec_backlight_priv {
> > > > +     struct backlight_device *bl_dev;
> > > > +     struct backlight_device *proxy_target;
> > > > +     struct notifier_block nb;
> > > > +};
> > > > +
> > > > +static char *backlight_proxy_target;
> > > > +module_param(backlight_proxy_target, charp, 0444);
> > > > +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change =
requests to the named backlight driver, on systems which erroneously report=
 EC backlight control.");
> > > > +
> > > > +static int max_reprobe_attempts =3D 128;
> > > > +module_param(max_reprobe_attempts, int, 0444);
> > > > +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts =
when relaying brightness change requests.");
> > > > +
> > > > +static bool restore_level_on_resume;
> > > > +module_param(restore_level_on_resume, bool, 0444);
> > > > +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight l=
evel when resuming from suspend, on systems which reset the EC's backlight =
level on resume.");
> > > > +
> > > > +/* Bit field values for quirks table */
> > > > +
> > > > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_RESTORE_LEVEL_ON_RESUME   BI=
T(0)
> > > > +
> > > > +/* bits 1-7: reserved for future quirks; bits 8+: proxy target dev=
ice names */
> > > > +
> > > > +#define NVIDIA_WMI_EC_BACKLIGHT_QUIRK_PROXY_TO_AMDGPU_BL1       BI=
T(8)
> > > > +
> > > > +#define QUIRK(name) NVIDIA_WMI_EC_BACKLIGHT_QUIRK_##name
> > > > +#define HAS_QUIRK(data, name) (((long) data) & QUIRK(name))
> > > > +
> > > > +static int assign_quirks(const struct dmi_system_id *id)
> > > > +{
> > > > +     if (HAS_QUIRK(id->driver_data, RESTORE_LEVEL_ON_RESUME))
> > > > +             restore_level_on_resume =3D 1;
> > > > +
> > > > +     /* If the module parameter is set, override the quirks table =
*/
> > > > +     if (!backlight_proxy_target) {
> > > > +             if (HAS_QUIRK(id->driver_data, PROXY_TO_AMDGPU_BL1))
> > > > +                     backlight_proxy_target =3D "amdgpu_bl1";
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > > +#define QUIRK_ENTRY(vendor, product, quirks) {          \
> > > > +     .callback =3D assign_quirks,                      \
> > > > +     .matches =3D {                                    \
> > > > +             DMI_MATCH(DMI_SYS_VENDOR, vendor),      \
> > > > +             DMI_MATCH(DMI_PRODUCT_VERSION, product) \
> > > > +     },                                              \
> > > > +     .driver_data =3D (void *)(quirks)                 \
> > > > +}
> > > > +
> > > > +static const struct dmi_system_id quirks_table[] =3D {
> > > > +     QUIRK_ENTRY(
> > > > +             /* This quirk is preset as of firmware revision HACN3=
1WW */
> > > > +             "LENOVO", "Legion S7 15ACH6",
> > > > +             QUIRK(RESTORE_LEVEL_ON_RESUME) | QUIRK(PROXY_TO_AMDGP=
U_BL1)
> > > > +     ),
> > > > +     { }
> > > > +};
> > > > +
> > > >   /**
> > > >    * wmi_brightness_notify() - helper function for calling WMI-wrap=
ped ACPI method
> > > >    * @w:    Pointer to the struct wmi_device identified by %WMI_BRI=
GHTNESS_GUID
> > > > @@ -119,9 +190,30 @@ static int wmi_brightness_notify(struct wmi_de=
vice *w, enum wmi_brightness_metho
> > > >       return 0;
> > > >   }
> > > >
> > > > +/* Scale the current brightness level of 'from' to the range of 't=
o'. */
> > > > +static int scale_backlight_level(const struct backlight_device *fr=
om,
> > > > +                              const struct backlight_device *to)
> > > > +{
> > > > +     int from_max =3D from->props.max_brightness;
> > > > +     int from_level =3D from->props.brightness;
> > > > +     int to_max =3D to->props.max_brightness;
> > > > +
> > > > +     return fixp_linear_interpolate(0, 0, from_max, to_max, from_l=
evel);
> > > > +}
> > > > +
> > > >   static int nvidia_wmi_ec_backlight_update_status(struct backlight=
_device *bd)
> > > >   {
> > > >       struct wmi_device *wdev =3D bl_get_data(bd);
> > > > +     struct nvidia_wmi_ec_backlight_priv *priv =3D dev_get_drvdata=
(&wdev->dev);
> > > > +     struct backlight_device *proxy_target =3D priv->proxy_target;
> > > > +
> > > > +     if (proxy_target) {
> > > > +             int level =3D scale_backlight_level(bd, proxy_target)=
;
> > > > +
> > > > +             if (backlight_device_set_brightness(proxy_target, lev=
el))
> > > > +                     pr_warn("Failed to relay backlight update to =
\"%s\"",
> > > > +                             backlight_proxy_target);
> > > > +     }
> > > >
> > > >       return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVE=
L,
> > > >                                    WMI_BRIGHTNESS_MODE_SET,
> > > > @@ -147,13 +239,78 @@ static const struct backlight_ops nvidia_wmi_=
ec_backlight_ops =3D {
> > > >       .get_brightness =3D nvidia_wmi_ec_backlight_get_brightness,
> > > >   };
> > > >
> > > > +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_blo=
ck *nb, unsigned long event, void *d)
> > > > +{
> > > > +
> > > > +     /*
> > > > +      * On some systems, the EC backlight level gets reset to 100%=
 when
> > > > +      * resuming from suspend, but the backlight device state stil=
l reflects
> > > > +      * the pre-suspend value. Refresh the existing state to sync =
the EC's
> > > > +      * state back up with the kernel's.
> > > > +      */
> > > > +     if (event =3D=3D PM_POST_SUSPEND) {
> > > > +             struct nvidia_wmi_ec_backlight_priv *p;
> > > > +             int ret;
> > > > +
> > > > +             p =3D container_of(nb, struct nvidia_wmi_ec_backlight=
_priv, nb);
> > > > +             ret =3D backlight_update_status(p->bl_dev);
> > > > +
> > > > +             if (ret)
> > > > +                     pr_warn("failed to refresh backlight level: %=
d", ret);
> > > > +
> > > > +             return NOTIFY_OK;
> > > > +     }
> > > > +
> > > > +     return NOTIFY_DONE;
> > > > +}
> > > > +
> > > > +static void putdev(void *data)
> > > > +{
> > > > +     struct device *dev =3D data;
> > > > +
> > > > +     put_device(dev);
> > > > +}
> > > > +
> > > >   static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev,=
 const void *ctx)
> > > >   {
> > > > +     struct backlight_device *bdev, *target =3D NULL;
> > > > +     struct nvidia_wmi_ec_backlight_priv *priv;
> > > >       struct backlight_properties props =3D {};
> > > > -     struct backlight_device *bdev;
> > > >       u32 source;
> > > >       int ret;
> > > >
> > > > +     /*
> > > > +      * Check quirks tables to see if this system needs any of the=
 firmware
> > > > +      * bug workarounds.
> > > > +      */
> > > > +     dmi_check_system(quirks_table);
> > > > +
> > > > +     if (backlight_proxy_target && backlight_proxy_target[0]) {
> > > > +             static int num_reprobe_attempts;
> > > > +
> > > > +             target =3D backlight_device_get_by_name(backlight_pro=
xy_target);
> > > > +
> > > > +             if (target) {
> > > > +                     ret =3D devm_add_action_or_reset(&wdev->dev, =
putdev,
> > > > +                                                    &target->dev);
> > > > +                     if (ret)
> > > > +                             return ret;
> > > > +             } else {
> > > > +                     /*
> > > > +                      * The target backlight device might not be r=
eady;
> > > > +                      * try again and disable backlight proxying i=
f it
> > > > +                      * fails too many times.
> > > > +                      */
> > > > +                     if (num_reprobe_attempts < max_reprobe_attemp=
ts) {
> > > > +                             num_reprobe_attempts++;
> > > > +                             return -EPROBE_DEFER;
> > > > +                     }
> > > > +
> > > > +                     pr_warn("Unable to acquire %s after %d attemp=
ts. Disabling backlight proxy.",
> > > > +                             backlight_proxy_target, max_reprobe_a=
ttempts);
> > > > +             }
> > > > +     }
> > > > +
> > > >       ret =3D wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOU=
RCE,
> > > >                                  WMI_BRIGHTNESS_MODE_GET, &source);
> > > >       if (ret)
> > > > @@ -188,7 +345,41 @@ static int nvidia_wmi_ec_backlight_probe(struc=
t wmi_device *wdev, const void *ct
> > > >                                             &wdev->dev, wdev,
> > > >                                             &nvidia_wmi_ec_backligh=
t_ops,
> > > >                                             &props);
> > > > -     return PTR_ERR_OR_ZERO(bdev);
> > > > +
> > > > +     if (IS_ERR(bdev))
> > > > +             return PTR_ERR(bdev);
> > > > +
> > > > +     priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> > > > +     if (!priv)
> > > > +             return -ENOMEM;
> > > > +
> > > > +     priv->bl_dev =3D bdev;
> > > > +
> > > > +     dev_set_drvdata(&wdev->dev, priv);
> > > > +
> > > > +     if (target) {
> > > > +             int level =3D scale_backlight_level(target, bdev);
> > > > +
> > > > +             if (backlight_device_set_brightness(bdev, level))
> > > > +                     pr_warn("Unable to import initial brightness =
level from %s.",
> > > > +                             backlight_proxy_target);
> > > > +             priv->proxy_target =3D target;
> > > > +     }
> > > > +
> > > > +     if (restore_level_on_resume) {
> > > > +             priv->nb.notifier_call =3D nvidia_wmi_ec_backlight_pm=
_notifier;
> > > > +             register_pm_notifier(&priv->nb);
> > > > +     }
> > > > +
> > > > +     return 0;
> > > > +}
> > > > +
> > > > +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev=
)
> > > > +{
> > > > +     struct nvidia_wmi_ec_backlight_priv *priv =3D dev_get_drvdata=
(&wdev->dev);
> > > > +
> > > > +     if (priv->nb.notifier_call)
> > > > +             unregister_pm_notifier(&priv->nb);
> > > >   }
> > > >
> > > >   #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7=
"
> > > > @@ -204,6 +395,7 @@ static struct wmi_driver nvidia_wmi_ec_backligh=
t_driver =3D {
> > > >               .name =3D "nvidia-wmi-ec-backlight",
> > > >       },
> > > >       .probe =3D nvidia_wmi_ec_backlight_probe,
> > > > +     .remove =3D nvidia_wmi_ec_backlight_remove,
> > > >       .id_table =3D nvidia_wmi_ec_backlight_id_table,
> > > >   };
> > > >   module_wmi_driver(nvidia_wmi_ec_backlight_driver);
