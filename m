Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686E7C433EF
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 21:48:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D81B61A08
	for <platform-driver-x86@archiver.kernel.org>; Fri,  1 Oct 2021 21:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354739AbhJAVt4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 1 Oct 2021 17:49:56 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:47356 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbhJAVtz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 17:49:55 -0400
Date:   Fri, 01 Oct 2021 21:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1633124888;
        bh=qA7bBeWMO0h2thjuzvWEc37L47eUBUZJjg0juLIHSzw=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=gdU4913Ckevdb/5QLJn5bCR8y5hiEnWbQKHRniu/R9r/g/05TDRnMmAdClfKwAkZ5
         jg1eXeMOQJyZVlTU71eDdRTR8DZ8ziBaD7h7IfEvTuft2v64pca8V0AEhd4LL6Ozr1
         ARdMtiU8iUnVATp+pDK1ZVgNplLXW8pzvv4QuHmU=
To:     Tim Crawford <tcrawford@system76.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, productdev@system76.com
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 4/4] platform/x86: system76_acpi: Use DEV_ATTR macro for kb_led_color
Message-ID: <uQcwLg-hios4UuqJwLCjTmjF93N2Dq16wuhUglnkBzzC3_8J-H_5sEtcObhUVankeJN5FZGqB4UOFUIWKvn3p-RkvxKTAC716S5blzdMd6E=@protonmail.com>
In-Reply-To: <20211001160812.22535-5-tcrawford@system76.com>
References: <20211001160812.22535-1-tcrawford@system76.com> <20211001160812.22535-5-tcrawford@system76.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. okt=C3=B3ber 1., p=C3=A9ntek 18:08 keltez=C3=A9ssel, Tim Crawford =
=C3=ADrta:

> Update kb_led_color to use the attr macro instead of manually making the
> struct. While touching it, also change its show method to use
> sysfs_emit() instead of sprintf().
>

If you're already touching this part of the code, you should probably creat=
e
an attribute group and set the `groups` field of the led_classdev struct
instead of manually adding the attribute.


Regards,
Barnab=C3=A1s P=C5=91cze


> Signed-off-by: Tim Crawford <tcrawford@system76.com>
> ---
>  drivers/platform/x86/system76_acpi.c | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/=
system76_acpi.c
> index 5c525c242211..dd00eb2663d6 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> @@ -354,7 +354,7 @@ static ssize_t kb_led_color_show(
>
>  =09led =3D (struct led_classdev *)dev->driver_data;
>  =09data =3D container_of(led, struct system76_data, kb_led);
> -=09return sprintf(buf, "%06X\n", data->kb_color);
> +=09return sysfs_emit(buf, "%06X\n", data->kb_color);
>  }
>
>  // Set the keyboard LED color
> @@ -382,14 +382,7 @@ static ssize_t kb_led_color_store(
>  =09return size;
>  }
>
> -static const struct device_attribute kb_led_color_dev_attr =3D {
> -=09.attr =3D {
> -=09=09.name =3D "color",
> -=09=09.mode =3D 0644,
> -=09},
> -=09.show =3D kb_led_color_show,
> -=09.store =3D kb_led_color_store,
> -};
> +static DEVICE_ATTR_RW(kb_led_color);
>
>  // Notify that the keyboard LED was changed by hardware
>  static void kb_led_notify(struct system76_data *data)
> @@ -669,10 +662,7 @@ static int system76_add(struct acpi_device *acpi_dev=
)
>  =09=09return err;
>
>  =09if (data->kb_color >=3D 0) {
> -=09=09err =3D device_create_file(
> -=09=09=09data->kb_led.dev,
> -=09=09=09&kb_led_color_dev_attr
> -=09=09);
> +=09=09err =3D device_create_file(data->kb_led.dev, &dev_attr_kb_led_colo=
r);
>  =09=09if (err)
>  =09=09=09return err;
>  =09}
> @@ -716,7 +706,7 @@ static int system76_remove(struct acpi_device *acpi_d=
ev)
>  =09system76_battery_exit();
>
>  =09if (data->kb_color >=3D 0)
> -=09=09device_remove_file(data->kb_led.dev, &kb_led_color_dev_attr);
> +=09=09device_remove_file(data->kb_led.dev, &dev_attr_kb_led_color);
>
>  =09devm_led_classdev_unregister(&acpi_dev->dev, &data->ap_led);
>  =09devm_led_classdev_unregister(&acpi_dev->dev, &data->kb_led);
> --
> 2.31.1
