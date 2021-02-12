Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCA9C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 08:57:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0714764D99
	for <platform-driver-x86@archiver.kernel.org>; Fri, 12 Feb 2021 08:57:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbhBLI5X (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 12 Feb 2021 03:57:23 -0500
Received: from mail-40136.protonmail.ch ([185.70.40.136]:61576 "EHLO
        mail-40136.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbhBLI5U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 12 Feb 2021 03:57:20 -0500
Date:   Fri, 12 Feb 2021 08:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1613120194;
        bh=Jd+pybXAI6jd36jKuZ5MoaHtdOro7g8TtKuum01B96M=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=VgbUzX7zvd3CP1zICmQ0jD9RFIivvcOyLkb6qrmyO+1FlPaKz5AN8CDTkwEj1gVR6
         WimlDmRQytj08Dwfk1/5EyOYMJ/fWyg7pAmtrX0U8Si3zUInuyRyL9h7mnql9HRC3H
         r0x/NST3aQ9qYMWf44VAguqsafvzKzzEaint838U=
To:     Nitin Joshi <nitjoshi@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Mark Pearson <markpearson@lenovo.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 1/2] platorm/x86: thinkpad_acpi: sysfs interface to reduce wlan tx power
Message-ID: <E3f2ByroNWD6igc0zIeWthnZ0NztA6QT_Uvg_wgS912Bq03401uE2ieeXM-WRLezCsBNgesU0myH-69IuKVkXbmtp5jkb30Vd6Rv6E3rld8=@protonmail.com>
In-Reply-To: <20210212055856.232702-1-njoshi1@lenovo.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. febru=C3=A1r 12., p=C3=A9ntek 6:58 keltez=C3=A9ssel, Nitin Joshi =
=C3=ADrta:

> Some newer Thinkpads have the WLAN antenna placed close to the WWAN
> antenna. In these cases FCC certification requires that when WWAN is
> active we reduce WLAN transmission power. A new Dynamic Power
> Reduction Control (DPRC) method is available from the BIOS on these
> platforms to reduce or restore WLAN Tx power.
>
> This patch provides a sysfs interface that userspace can use to adjust th=
e
> WLAN power appropriately.
>
> Reviewed-by: Mark Pearson <markpearson@lenovo.com>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  18 +++
>  drivers/platform/x86/thinkpad_acpi.c          | 136 ++++++++++++++++++
>  2 files changed, 154 insertions(+)
>
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Docume=
ntation/admin-guide/laptops/thinkpad-acpi.rst
> index 5fe1ade88c17..10410811b990 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -51,6 +51,7 @@ detailed description):
>  =09- UWB enable and disable
>  =09- LCD Shadow (PrivacyGuard) enable and disable
>  =09- Lap mode sensor
> +=09- WLAN transmission power control
>
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1447,6 +1448,23 @@ they differ between desk and lap mode.
>  The property is read-only. If the platform doesn't have support the sysf=
s
>  class is not created.
>
> +WLAN transmission power control
> +--------------------------------
> +
> +sysfs: wlan_tx_strength_reduce
> +
> +Some newer Thinkpads have the WLAN antenna placed close to the WWAN ante=
nna.
> +This interface will be used by userspace to reduce the WLAN Tx power str=
ength
> +when WWAN is active, as is required for FCC certification.
> +
> +The available commands are::
> +
> +        echo '0' > /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_=
reduce
> +        echo '1' > /sys/devices/platform/thinkpad_acpi/wlan_tx_strength_=
reduce
> +
> +The first command restores the wlan transmission power and the latter on=
e
> +reduces wlan transmission power.
> +
>  EXPERIMENTAL: UWB
>  -----------------
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/=
thinkpad_acpi.c
> index f3e8eca8d86d..6dbbd4a14264 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9983,6 +9983,138 @@ static struct ibm_struct proxsensor_driver_data =
=3D {
>  =09.exit =3D proxsensor_exit,
>  };
>
> +/***********************************************************************=
**
> + * DPRC(Dynamic Power Reduction Control) subdriver, for the Lenovo WWAN
> + * and WLAN feature.
> + */
> +#define DPRC_GET_WLAN_STATE             0x20000
> +#define DPRC_SET_WLAN_POWER_REDUCE      0x00030010
> +#define DPRC_SET_WLAN_POWER_FULL        0x00030100
> +static int has_wlantxreduce;

I think `bool` would be better.


> +static int wlan_txreduce;
> +
> +static int dprc_command(int command, int *output)
> +{
> +=09acpi_handle dprc_handle;
> +
> +=09if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DPRC", &dprc_handle)))=
 {
> +=09=09/* Platform doesn't support DPRC */
> +=09=09return -ENODEV;
> +=09}
> +
> +=09if (!acpi_evalf(dprc_handle, output, NULL, "dd", command))
> +=09=09return -EIO;
> +
> +=09/*
> +=09 * METHOD_ERR gets returned on devices where few commands are not sup=
ported
> +=09 * for example WLAN power reduce command is not supported on some dev=
ices.
> +=09 */
> +=09if (*output & METHOD_ERR)
> +=09=09return -ENODEV;
> +
> +=09return 0;
> +}
> +
> +static int get_wlan_state(int *has_wlantxreduce, int *wlan_txreduce)
> +{
> +=09int output, err;
> +
> +=09/* Get current WLAN Power Transmission state */
> +=09err =3D dprc_command(DPRC_GET_WLAN_STATE, &output);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (output & BIT(4))

I believe it'd be preferable to name `BIT(4)` and `BIT(8)`. E.g.:

  #define DPRC_GET_WLAN_STATE_RES_REDUCED BIT(4)
  #define DPRC_GET_WLAN_STATE_RES_FULL    BIT(8)

(or any name you like).


> +=09=09*wlan_txreduce =3D 1;
> +=09else if (output & BIT(8))
> +=09=09*wlan_txreduce =3D 0;
> +=09else
> +=09=09*wlan_txreduce =3D -1;

Can you elaborate what -1 means here? Unknown/not available/invalid/error?


> +
> +=09*has_wlantxreduce =3D 1;

Is it necessary for the getter to set this? Couldn't it be set in
`tpacpi_dprc_init()` once during initialization?


> +=09return 0;
> +}
> +
> +/* sysfs wlan entry */
> +static ssize_t wlan_tx_strength_reduce_show(struct device *dev,
> +=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09char *buf)

Please align the arguments:

  ..._show(struct device *dev,
           struct device_attribute ...
           ...);


> +{
> +=09int err;
> +
> +=09err =3D get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> +=09if (err)
> +=09=09return err;
> +

Wouldn't it be better to return -ENODATA or something
similar when `wlan_txreduce` =3D=3D -1?


> +=09return sysfs_emit(buf, "%d\n", wlan_txreduce);
> +}
> +
> +static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
> +=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09const char *buf, size_t count)

Same here.


> +{
> +=09int output, err;
> +=09unsigned long t;
> +
> +=09if (parse_strtoul(buf, 1, &t))

Maybe `kstrtobool`?


> +=09=09return -EINVAL;
> +
> +=09tpacpi_disclose_usertask(attr->attr.name,
> +=09=09=09=09"WLAN tx strength reduced %lu\n", t);
> +
> +=09switch (t) {
> +=09case 0:
> +=09=09err =3D dprc_command(DPRC_SET_WLAN_POWER_FULL, &output);
> +=09=09break;
> +=09case 1:
> +=09=09err =3D dprc_command(DPRC_SET_WLAN_POWER_REDUCE, &output);
> +=09=09break;
> +=09default:
> +=09=09err =3D -EINVAL;
> +=09=09dev_err(&tpacpi_pdev->dev, "Unknown operating mode. Ignoring\n");
> +=09=09break;
> +=09}
> +

If I'm not mistaken, `err` is never returned, so the write() will always se=
em
to succeed.


> +=09sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "wlan_tx_strength_reduce")=
;
> +=09return count;
> +}
> +static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
> +
> +static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
> +{
> +=09int wlantx_err, err;
> +
> +=09wlantx_err =3D get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> +=09/*
> +=09 * If support isn't available (ENODEV) for both devices then quit, bu=
t
> +=09 * don't return an error.
> +=09 */
> +=09if (wlantx_err =3D=3D -ENODEV)
> +=09=09return 0;
> +=09/* Otherwise, if there was an error return it */
> +=09if (wlantx_err && (wlantx_err !=3D -ENODEV))
> +=09=09return wlantx_err;
> +
> +=09if (has_wlantxreduce) {
> +=09=09err =3D sysfs_create_file(&tpacpi_pdev->dev.kobj,
> +=09=09=09=09&dev_attr_wlan_tx_strength_reduce.attr);

I believe `device_create_file()` would be better.


> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> +=09return 0;
> +}
> +
> +static void dprc_exit(void)
> +{
> +=09if (has_wlantxreduce)
> +=09=09sysfs_remove_file(&tpacpi_pdev->dev.kobj, &dev_attr_wlan_tx_streng=
th_reduce.attr);

And similarly, `device_remove_file()`.


> +}
> +
> +static struct ibm_struct dprc_driver_data =3D {
> +=09.name =3D "dprc",
> +=09.exit =3D dprc_exit,
> +};
> +
>  /***********************************************************************=
*****
>   ***********************************************************************=
*****
>   *
> @@ -10475,6 +10607,10 @@ static struct ibm_init_struct ibms_init[] __init=
data =3D {
>  =09=09.init =3D tpacpi_proxsensor_init,
>  =09=09.data =3D &proxsensor_driver_data,
>  =09},
> +=09{
> +=09=09.init =3D tpacpi_dprc_init,
> +=09=09.data =3D &dprc_driver_data,
> +=09},
>  };
>
>  static int __init set_ibm_param(const char *val, const struct kernel_par=
am *kp)
> --
> 2.25.1


Regards,
Barnab=C3=A1s P=C5=91cze
