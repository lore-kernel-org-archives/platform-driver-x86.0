Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED98C433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Feb 2021 20:44:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3234164DCF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 13 Feb 2021 20:44:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229647AbhBMUoO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 13 Feb 2021 15:44:14 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:21075 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhBMUoN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 13 Feb 2021 15:44:13 -0500
Date:   Sat, 13 Feb 2021 20:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1613249009;
        bh=zzk+h6KF7rRy0OJ2BDF/o7A6Ch7mUbs1SYENJIKpS7Y=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=g4apXxbVWRVVPlxATXoeGl2vdrpM8fmzsAVl/QIjYHUNzACExQ4Kkg8+Pafb4Q5vr
         w9oUoN7yS4eUfEAT9Rxn0aHIwe6DDxy8NAFTyDhREsMQqJ7P6Tlz3bd2uVq3uRxVmX
         D9afOxw01cPR59RZt10jBqcNA4jV+d/+2j9dXjOk=
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
Subject: Re: [PATCH 2/2] platorm/x86: thinkpad_acpi: sysfs interface to interface to get wwan antenna type
Message-ID: <Z37uykc5gmsuJ0GzzVV8r1w2247m33IZ49gGcW-wSZI8Xu43M2C8jgpSizSvKm2-iVDy0BVY3mGcRAybwkz-OOnZi6VQYmpHe3miOc0dQF8=@protonmail.com>
In-Reply-To: <20210212055856.232702-2-njoshi1@lenovo.com>
References: <20210212055856.232702-1-njoshi1@lenovo.com> <20210212055856.232702-2-njoshi1@lenovo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. febru=C3=A1r 12., p=C3=A9ntek 6:58 keltez=C3=A9ssel, Nitin Joshi =
=C3=ADrta:

> [...]
> +/* sysfs wwan antenna type entry */
> +static ssize_t wwan_antenna_type_show(struct device *dev,
> +=09=09=09=09struct device_attribute *attr,
> +=09=09=09=09char *buf)
> +{
> +=09switch (wwan_antennatype) {
> +=09case 1:
> +=09=09return sysfs_emit(buf, "type a\n");
> +=09case 2:
> +=09=09return sysfs_emit(buf, "type b\n");
> +=09default:
> +=09=09return sysfs_emit(buf, "unknown type\n");

I feel like returning -ENODATA would be more appropriate here. Or maybe you=
 could choose
not to create the attribute if the antenna type is unknown. And I'm not sur=
e if
the "type" prefix is necessary. I believe the name of the attribute 'wwan_a=
ntenna_type'
already implies that the content will describe a type. Furthermore, I think=
 you could
omit the `has_antennatype` variable altogether, storing only `wwan_antennat=
ype` is enough.


> +=09}
> +}
> +
>  static ssize_t wlan_tx_strength_reduce_store(struct device *dev,
>  =09=09=09=09struct device_attribute *attr,
>  =09=09=09=09const char *buf, size_t count)
> @@ -10076,24 +10114,29 @@ static ssize_t wlan_tx_strength_reduce_store(st=
ruct device *dev,
>  =09}
>
>  =09sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "wlan_tx_strength_reduce")=
;
> +

If you want the empty line here, I think you should place it in the previou=
s patch.


>  =09return count;
>  }
>  static DEVICE_ATTR_RW(wlan_tx_strength_reduce);
> +static DEVICE_ATTR_RO(wwan_antenna_type);
>
>  static int tpacpi_dprc_init(struct ibm_init_struct *iibm)
>  {
> -=09int wlantx_err, err;
> +=09int wlantx_err, wwanantenna_err, err;
>
>  =09wlantx_err =3D get_wlan_state(&has_wlantxreduce, &wlan_txreduce);
> +=09wwanantenna_err =3D get_wwan_antenna(&has_antennatype, &wwan_antennat=
ype);
>  =09/*
>  =09 * If support isn't available (ENODEV) for both devices then quit, bu=
t
>  =09 * don't return an error.
>  =09 */
> -=09if (wlantx_err =3D=3D -ENODEV)
> +=09if ((wlantx_err =3D=3D -ENODEV) && (wwanantenna_err =3D=3D -ENODEV))
>  =09=09return 0;
>  =09/* Otherwise, if there was an error return it */
>  =09if (wlantx_err && (wlantx_err !=3D -ENODEV))
>  =09=09return wlantx_err;
> +=09if (wwanantenna_err && (wwanantenna_err !=3D -ENODEV))
> +=09=09return wwanantenna_err;
>
>  =09if (has_wlantxreduce) {
>  =09=09err =3D sysfs_create_file(&tpacpi_pdev->dev.kobj,
> @@ -10101,6 +10144,12 @@ static int tpacpi_dprc_init(struct ibm_init_stru=
ct *iibm)
>  =09=09if (err)
>  =09=09=09return err;
>  =09}
> +
> +=09if (has_antennatype) {
> +=09=09err =3D sysfs_create_file(&tpacpi_pdev->dev.kobj, &dev_attr_wwan_a=
ntenna_type.attr);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
>  =09return 0;
>  }
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
