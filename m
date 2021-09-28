Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB1DC433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 16:38:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94F3060F5B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 16:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241841AbhI1QkD (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 12:40:03 -0400
Received: from mail-40134.protonmail.ch ([185.70.40.134]:15043 "EHLO
        mail-40134.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241783AbhI1QkD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 12:40:03 -0400
Date:   Tue, 28 Sep 2021 16:38:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1632847098;
        bh=DtHkbZgOVwzzNme71TX4qL33zIrxYvDOuu9w+dTGJAE=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=QMGtmLAhK+gRIqRmx+tG/OryhTfxztvsdqucZEpDXYn1+R0RuAUkL/MklkzSCj8yh
         HrppSRaFKOXu9gN4TOkhq8NDpPEGHJSZ/96YNbEDQoGKuY9io3lqJGfwdcDaeMrpfn
         MraHQLpebzsVtYziFAYyHv4Wo9ZduDNswWnn/Kq8=
To:     Tim Crawford <tcrawford@system76.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, productdev@system76.com
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 3/3] platform/x86: system76_acpi: Add battery charging thresholds
Message-ID: <MIX7msIf0I4ipJYWBFlZQfkhFTMA3IuickwClAu_4gUmCkWb2ll8ftFf1f470aYcteA76LLWeIdy70jbCu6XNHN1MgWZtJbvEow19L24IPI=@protonmail.com>
In-Reply-To: <20210927210629.37966-4-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com> <20210927210629.37966-4-tcrawford@system76.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. szeptember 27., h=C3=A9tf=C5=91 23:06 keltez=C3=A9ssel, Tim Crawford =
=C3=ADrta:

> System76 laptops running open source EC firmware support configuring
> charging thresholds through ACPI methods. Expose this functionality
> through the standard sysfs entries charge_control_{start,end}_threshold.
>
> Signed-off-by: Tim Crawford <tcrawford@system76.com>
> ---
>  drivers/platform/x86/system76_acpi.c | 153 +++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/=
system76_acpi.c
> index 06f6509980e2..b42c4a384ba9 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> [...]
> +enum {
> +=09THRESHOLD_START,
> +=09THRESHOLD_END,
> +};
> +
> +static ssize_t battery_get_threshold(int which, char *buf)
> +{
> +=09struct acpi_object_list input;
> +=09union acpi_object param;
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09unsigned long long ret =3D BATTERY_THRESHOLD_INVALID;
> +
> +=09handle =3D ec_get_handle();
> +=09if (!handle)
> +=09=09return -ENODEV;
> +
> +=09input.count =3D 1;
> +=09input.pointer =3D &param;
> +=09// Start/stop selection
> +=09param.type =3D ACPI_TYPE_INTEGER;
> +=09param.integer.value =3D which;
> +
> +=09status =3D acpi_evaluate_integer(handle, "GBCT", &input, &ret);
> +=09if (ACPI_FAILURE(status))
> +=09=09return -EIO;
> +=09if (ret =3D=3D BATTERY_THRESHOLD_INVALID)
> +=09=09return -EINVAL;
> +
> +=09return sprintf(buf, "%d\n", (int)ret);

Please use `sysfs_emit()` for writing into sysfs buffers.


> +}
> [...]
> +static int system76_battery_add(struct power_supply *battery)
> +{
> +=09// System76 EC only supports 1 battery
> +=09if (strcmp(battery->desc->name, "BAT0") !=3D 0)
> +=09=09return -ENODEV;
> +
> +=09device_create_file(&battery->dev, &dev_attr_charge_control_start_thre=
shold);
> +=09device_create_file(&battery->dev, &dev_attr_charge_control_end_thresh=
old);

You can use `device_{add,remove}_groups()` instead of manually adding them =
one by one.


> +=09return 0;
> +}
> [...]


Regards,
Barnab=C3=A1s P=C5=91cze
