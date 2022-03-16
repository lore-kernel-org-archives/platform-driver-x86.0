Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB45FC433EF
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Mar 2022 02:50:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351467AbiCPCvr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Mar 2022 22:51:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350328AbiCPCvr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 22:51:47 -0400
Received: from mail-0201.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B62151E61
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 19:50:33 -0700 (PDT)
Date:   Wed, 16 Mar 2022 02:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1647399028;
        bh=aykGHiPQSIVEl7TuKdYjVE2CcCGD90Zu9TPs2FwQvTo=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=Wa2Ge2Fh6eCZ6N5wrsswVcLtyk0N/llTvsi9vghJGfb+kweE40mXSw7CcwnBk9ZWa
         WiENxOarp60tl6Q5QWejmgdpYHxbaM7QadO0oXFc2OzbVCEqHzcxRUJ0s1Agm0EYeq
         cm8LcyjKkmaZ7xgo3RxbkYiJNGVRKYQkzL6RDaGXn8FP+eAE9S5cbcdeOKs6OnD366
         AS31POwgHg7llaJKWX+LOlE8ZL1bGihOGCS8hBUYk4cVceQL7QCpA2TZZ0sWITgnjI
         uD9rHKDqTJc97dZX8JaQb1gymwW6IVbS0WHk+cxBcZk5Uord60DuvXtfq41jsJLKHX
         qc11+gVBevgsg==
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Alexandru Dinu <alex.dinu07@gmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] nvidia-wmi-ec-backlight: Add workarounds for confused firmware
Message-ID: <v_ODhOndx3g1l-BhfKGCB6_nLY83LTc5vz1YDrVEVVF5CmgKUs1x9bmROyWXhmYkeQRVVnvfBnyrFyHaEKqtoZE5P7lKJJ1j_vE0J1Piq2Y=@protonmail.com>
In-Reply-To: <20220316012516.2233984-1-ddadap@nvidia.com>
References: <20220316012516.2233984-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


The platform-driver-x86 maintainers should've probably been
CCd. You may or may not know, but the `scripts/get_maintainers.pl`
script can be used to determine the appropriate recipients.

2022. m=C3=A1rcius 16., szerda 2:25 keltez=C3=A9ssel, Daniel Dadap =C3=
=ADrta:
> Some notebook systems with EC-driven backlight control appear to have a
> firmware bug which causes the system to use GPU-driven backlight control
> upon a fresh boot, but then switches to EC-driven backlight control
> after completing a suspend/resume cycle. All the while, the firmware
> reports that the backlight is under EC control, regardless of what is
> actually controlling the backlight brightness.
>
> This leads to the following behavior:
>
> * nvidia-wmi-ec-backlight gets probed on a fresh boot, due to the
>   WMI-wrapped ACPI method erroneously reporting EC control.
> * nvidia-wmi-ec-backlight does not work until after a suspend/resume
>   cycle, due to the backlight control actually being GPU-driven.
> * GPU drivers also register their own backlight handlers: in the case
>   of the notebook system where this behavior has been observed, both
>   amdgpu and the NVIDIA proprietary driver register backlight handlers.
> * The GPU which has backlight control upon a fresh boot (amdgpu in the
>   case observed so far) can successfully control the backlight through
>   its backlight driver's sysfs interface, but stops working after the
>   first suspend/resume cycle.
> * nvidia-wmi-ec-backlight is unable to control the backlight upon a
>   fresh boot, but begins to work after the first suspend/resume cycle.
> * The GPU which does not have backlight control (NVIDIA in this case)
>   is not able to control the backlight at any point while the system
>   is in operation. On similar hybrid systems with an EC-controlled
>   backlight, and AMD/NVIDIA iGPU/dGPU, the NVIDIA proprietary driver
>   does not register its backlight handler. It has not been determined
>   whether the non-functional handler registered by the NVIDIA driver
>   is due to another firmware bug, or a bug in the NVIDIA driver.
>
> Since nvidia-wmi-ec-backlight registers as a BACKLIGHT_FIRMWARE type
> device, it takes precedence over the BACKLIGHT_RAW devices registered
> by the GPU drivers. This in turn leads to backlight control appearing
> to be non-functional until after completing a suspend/resume cycle.
> However, it is still possible to control the backlight through direct
> interaction with the working GPU driver's backlight sysfs interface.
>
> These systems also appear to have a second firmware bug which resets
> the EC's brightness level to 100% on resume, but leaves the state in
> the kernel at the pre-suspend level. This causes attempts to save
> and restore the backlight level across the suspend/resume cycle to
> fail, due to the level appearing not to change even though it did.
>
> In order to work around these issue, add quirk tables to detect
> systems that are known to show these behaviors. So far, there is
> only one known system that requires these workarounds, and both
> issues are present on that system, but the quirks are tracked in
> separate tables to make it easier to add them to other systems which
> may exhibit one of the bugs, but not the other. The original systems
> that this driver was tested on during development do not exhibit
> either of these quirks.
>
> If a system with the "GPU driver has backlight control" quirk is
> detected, nvidia-wmi-ec-backlight will grab a reference to the working
> (when freshly booted) GPU backlight handler and relays any backlight
> brightness level change requests directed at the EC to also be applied
> to the GPU backlight interface. This leads to redundant updates
> directed at the GPU backlight driver after a suspend/resume cycle, but
> it does allow the EC backlight control to work when the system is
> freshly booted.
>
> If a system with the "backlight level reset to full on resume" quirk
> is detected, nvidia-wmi-ec-backlight will register a PM notifier to
> reset the backlight to the previous level upon resume.
>
> These workarounds are also plumbed through to kernel module parameters,
> to make it easier for users who suspect they may be affected by one or
> both of these bugs to test whether these workarounds are effective on
> their systems as well.
>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> Tested-by: Alexandru Dinu <alex.dinu07@gmail.com>
> ---
>  .../platform/x86/nvidia-wmi-ec-backlight.c    | 181 +++++++++++++++++-
>  1 file changed, 179 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/pla=
tform/x86/nvidia-wmi-ec-backlight.c
> index 61e37194df70..ccb3b506c12c 100644
> --- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> +++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
> @@ -3,8 +3,11 @@
>   * Copyright (c) 2020, NVIDIA CORPORATION.  All rights reserved.
>   */
>
> +#define pr_fmt(f) "%s: " f "\n", KBUILD_MODNAME

`KBUILD_MODNAME` is a string literal, so you can do e.g.

  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt


> +
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
> +#include <linux/dmi.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/types.h>
> @@ -75,6 +78,69 @@ struct wmi_brightness_args {
>  =09u32 ignored[3];
>  };
>
> +/**
> + * struct nvidia_wmi_ec_backlight_priv - driver private data
> + * @bl_dev:       the associated backlight device
> + * @proxy_target: backlight device which receives relayed brightness cha=
nges
> + * @notifier:     notifier block for resume callback
> + */
> +struct nvidia_wmi_ec_backlight_priv {
> +=09struct backlight_device *bl_dev;
> +=09struct backlight_device *proxy_target;
> +=09struct notifier_block nb;
> +};
> +
> +static char *backlight_proxy_target;
> +module_param(backlight_proxy_target, charp, 0);

It seems these module parameters are neither readable nor writable,
is that intentional?


> +MODULE_PARM_DESC(backlight_proxy_target, "Relay brightness change reques=
ts to the named backlight driver, on systems which erroneously report EC ba=
cklight control.");
> +
> +static int max_reprobe_attempts =3D 128;

Can you elaborate how this number was arrived at?


> +module_param(max_reprobe_attempts, int, 0);
> +MODULE_PARM_DESC(max_reprobe_attempts, "Limit of reprobe attempts when r=
elaying brightness change requests.");
> +
> +static bool restore_level_on_resume;
> +module_param(restore_level_on_resume, bool, 0);
> +MODULE_PARM_DESC(restore_level_on_resume, "Restore the backlight level w=
hen resuming from suspend, on systems which reset the EC's backlight level =
on resume.");
> +
> +static int assign_relay_quirk(const struct dmi_system_id *id)
> +{
> +=09backlight_proxy_target =3D id->driver_data;
> +=09return true;
> +}
> +
> +#define PROXY_QUIRK_ENTRY(vendor, product, quirk_data) { \
> +=09.callback =3D assign_relay_quirk,                  \
> +=09.matches =3D {                                     \
> +=09=09DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
> +=09=09DMI_MATCH(DMI_PRODUCT_VERSION, product)  \
> +=09},                                               \
> +=09.driver_data =3D quirk_data                        \
> +}
> +
> +static const struct dmi_system_id proxy_quirk_table[] =3D {
> +=09PROXY_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6", "amdgpu_bl1"),
> +=09{ }
> +};
> +
> +static int assign_restore_quirk(const struct dmi_system_id *id)
> +{
> +=09restore_level_on_resume =3D true;
> +=09return true;
> +}
> +
> +#define RESTORE_QUIRK_ENTRY(vendor, product) {           \
> +=09.callback =3D assign_restore_quirk,                \
> +=09.matches =3D {                                     \
> +=09=09DMI_MATCH(DMI_SYS_VENDOR, vendor),       \
> +=09=09DMI_MATCH(DMI_PRODUCT_VERSION, product), \
> +=09}                                                \
> +}
> +
> +static const struct dmi_system_id restore_quirk_table[] =3D {
> +=09RESTORE_QUIRK_ENTRY("LENOVO", "Legion S7 15ACH6"),
> +=09{ }
> +};
> +
>  /**
>   * wmi_brightness_notify() - helper function for calling WMI-wrapped ACP=
I method
>   * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS=
_GUID
> @@ -119,9 +185,30 @@ static int wmi_brightness_notify(struct wmi_device *=
w, enum wmi_brightness_metho
>  =09return 0;
>  }
>
> +static int scale_backlight_level(struct backlight_device *a,
> +=09=09=09=09 struct backlight_device *b)
> +{
> +=09/* because floating point math in the kernel is annoying */
> +=09const int scaling_factor =3D 65536;
> +=09int level =3D a->props.brightness;
> +=09int relative_level =3D level * scaling_factor / a->props.max_brightne=
ss;
> +
> +=09return relative_level * b->props.max_brightness / scaling_factor;
> +}

Maybe

  fixp_linear_interpolate(0, 0, a->props.max_brightness, b->props.max_brigh=
tness, a->props.brightness);

? (from `linux/fixp-arith.h`)


> +
>  static int nvidia_wmi_ec_backlight_update_status(struct backlight_device=
 *bd)
>  {
>  =09struct wmi_device *wdev =3D bl_get_data(bd);
> +=09struct nvidia_wmi_ec_backlight_priv *priv =3D dev_get_drvdata(&wdev->=
dev);
> +=09struct backlight_device *proxy_target =3D priv->proxy_target;
> +
> +=09if (proxy_target) {
> +=09=09int level =3D scale_backlight_level(bd, proxy_target);
> +
> +=09=09if (backlight_device_set_brightness(proxy_target, level))
> +=09=09=09pr_warn("Failed to relay backlight update to \"%s\"",
> +=09=09=09=09backlight_proxy_target);
> +=09}
>
>  =09return wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_LEVEL,
>  =09                             WMI_BRIGHTNESS_MODE_SET,
> @@ -147,13 +234,65 @@ static const struct backlight_ops nvidia_wmi_ec_bac=
klight_ops =3D {
>  =09.get_brightness =3D nvidia_wmi_ec_backlight_get_brightness,
>  };
>
> +static int nvidia_wmi_ec_backlight_pm_notifier(struct notifier_block *nb=
, unsigned long event, void *d)
> +{
> +
> +=09/*
> +=09 * On some systems, the EC backlight level gets reset to 100% when
> +=09 * resuming from suspend, but the backlight device state still reflec=
ts
> +=09 * the pre-suspend value. Refresh the existing state to sync the EC's
> +=09 * state back up with the kernel's.
> +=09 */
> +=09if (event =3D=3D PM_POST_SUSPEND) {
> +=09=09struct nvidia_wmi_ec_backlight_priv *p;
> +
> +=09=09p =3D container_of(nb, struct nvidia_wmi_ec_backlight_priv, nb);
> +=09=09return backlight_update_status(p->bl_dev);

`backlight_update_status()` returns a negative errno while the notifier cha=
in
expects something else. It would probably be better to return `NOTIFY_DONE`
in all cases. Currently a suitable error from `backlight_update_status()` w=
ill
stop the notifier chain.


> +=09}
> +
> +=09return 0;
> +}
> +
>  static int nvidia_wmi_ec_backlight_probe(struct wmi_device *wdev, const =
void *ctx)
>  {
> +=09struct backlight_device *bdev, *target =3D NULL;
> +=09struct nvidia_wmi_ec_backlight_priv *priv;
>  =09struct backlight_properties props =3D {};
> -=09struct backlight_device *bdev;
>  =09u32 source;
>  =09int ret;
>
> +=09/*
> +=09 * Check quirks tables to see if this system needs any of the firmwar=
e
> +=09 * bug workarounds.
> +=09 */
> +
> +=09/* User-set quirks from the module parameters take precedence */
> +=09if (!backlight_proxy_target)
> +=09=09dmi_check_system(proxy_quirk_table);
> +
> +=09dmi_check_system(restore_quirk_table);
> +
> +=09if (backlight_proxy_target && backlight_proxy_target[0]) {
> +=09=09static int num_reprobe_attempts;
> +
> +=09=09target =3D backlight_device_get_by_name(backlight_proxy_target);
> +
> +=09=09if (!target) {
> +=09=09=09/*
> +=09=09=09 * The target backlight device might not be ready;
> +=09=09=09 * try again and disable backlight proxying if it
> +=09=09=09 * fails too many times.
> +=09=09=09 */
> +=09=09=09if (num_reprobe_attempts < max_reprobe_attempts) {
> +=09=09=09=09num_reprobe_attempts++;
> +=09=09=09=09return -EPROBE_DEFER;
> +=09=09=09}
> +
> +=09=09=09pr_warn("Unable to acquire %s after %d attempts. Disabling back=
light proxy.",
> +=09=09=09=09backlight_proxy_target, max_reprobe_attempts);
> +=09=09}
> +=09}

I think `target` is not put in case of error. You probably need to add some=
thing like:

  if (target) {
    ret =3D devm_add_action_or_reset(&wdev->dev, put_device_wrapper, target=
);
    if (ret < 0)
      return ret;
  }


> +
>  =09ret =3D wmi_brightness_notify(wdev, WMI_BRIGHTNESS_METHOD_SOURCE,
>  =09                           WMI_BRIGHTNESS_MODE_GET, &source);
>  =09if (ret)
> @@ -188,7 +327,44 @@ static int nvidia_wmi_ec_backlight_probe(struct wmi_=
device *wdev, const void *ct
>  =09=09=09=09=09      &wdev->dev, wdev,
>  =09=09=09=09=09      &nvidia_wmi_ec_backlight_ops,
>  =09=09=09=09=09      &props);
> -=09return PTR_ERR_OR_ZERO(bdev);
> +
> +=09if (IS_ERR(bdev))
> +=09=09return PTR_ERR(bdev);
> +
> +=09priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);

`devm_kzalloc()` would probably be better and you should check if `!priv`.


> +=09priv->bl_dev =3D bdev;
> +
> +=09dev_set_drvdata(&wdev->dev, priv);
> +
> +=09if (target) {
> +=09=09int level =3D scale_backlight_level(target, bdev);
> +
> +=09=09if (backlight_device_set_brightness(bdev, level))
> +=09=09=09pr_warn("Unable to import initial brightness level from %s.",
> +=09=09=09=09backlight_proxy_target);
> +=09=09priv->proxy_target =3D target;
> +=09}
> +
> +=09if (restore_level_on_resume) {
> +=09=09priv->nb.notifier_call =3D nvidia_wmi_ec_backlight_pm_notifier;
> +=09=09register_pm_notifier(&priv->nb);
> +=09}
> +
> +=09return 0;
> +}
> +
> +static void nvidia_wmi_ec_backlight_remove(struct wmi_device *wdev)
> +{
> +=09struct nvidia_wmi_ec_backlight_priv *priv =3D dev_get_drvdata(&wdev->=
dev);
> +=09struct backlight_device *proxy_target =3D priv->proxy_target;
> +
> +=09if (proxy_target)
> +=09=09put_device(&proxy_target->dev);

If you switch to `devm_add_action_or_reset()`, this will not be needed.


> +
> +=09if (priv->nb.notifier_call)
> +=09=09unregister_pm_notifier(&priv->nb);
> +
> +=09kfree(priv);

If you switch to `devm_kzalloc()`, this won't be needed.


>  }
>
>  #define WMI_BRIGHTNESS_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> @@ -204,6 +380,7 @@ static struct wmi_driver nvidia_wmi_ec_backlight_driv=
er =3D {
>  =09=09.name =3D "nvidia-wmi-ec-backlight",
>  =09},
>  =09.probe =3D nvidia_wmi_ec_backlight_probe,
> +=09.remove =3D nvidia_wmi_ec_backlight_remove,
>  =09.id_table =3D nvidia_wmi_ec_backlight_id_table,
>  };
>  module_wmi_driver(nvidia_wmi_ec_backlight_driver);
> --
> 2.27.0
>

Lastly, is it expected that these bugs will be properly fixed?


Regards,
Barnab=C3=A1s P=C5=91cze
