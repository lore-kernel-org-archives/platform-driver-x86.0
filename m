Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E93C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 16:40:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BF7A61262
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 16:40:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241763AbhI1Ql7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 12:41:59 -0400
Received: from mail-4316.protonmail.ch ([185.70.43.16]:53901 "EHLO
        mail-4316.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbhI1Ql6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 12:41:58 -0400
Date:   Tue, 28 Sep 2021 16:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1632847217;
        bh=ZCe3aDZTIj0+l/gu6mt5LwtCVcQTHPXvQYVeMtOjlow=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=dw3M/Mr11+qiwAZ5fKNlZmEoYYOd0Tdx8nirlmMrVeJ75tX+vnVRu86RwKlfIxNL2
         VfmP0WoQKHp1H8xezSIGUBGXD8OoxRDrwBXFaVIsfzdToRhQAtPEz1Ul0mB0WM6+xv
         7ArtZC5K4uaZFoRB/p9Ze+iHgwd4Skt+8FbmrCN8=
To:     Tim Crawford <tcrawford@system76.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     platform-driver-x86@vger.kernel.org, productdev@system76.com,
        Jeremy Soller <jeremy@system76.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH 2/3] platform/x86: system76_acpi: Replace Fn+F2 function for OLED models
Message-ID: <5dpMsqVPUo479Nv87jp4gBXtqh0Vly3pG45goLCtejug8ussdkU-C-d4wQE3auzIJ8ORj50i9FkXOTB-OHgR34EnmjiC41B9BGLPzJ1bLDo=@protonmail.com>
In-Reply-To: <20210927210629.37966-3-tcrawford@system76.com>
References: <20210927210629.37966-1-tcrawford@system76.com> <20210927210629.37966-3-tcrawford@system76.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. szeptember 27., h=C3=A9tf=C5=91 23:06 keltez=C3=A9ssel, Tim Crawford =
=C3=ADrta:

> From: Jeremy Soller <jeremy@system76.com>
>
> System76 laptops models with OLED displays do not support the default
> Fn+F2 behavior of turning the embedded display on and off. Some models
> instead introduce a new notify event that is used to lock the screen so
> the OS will put the display in a low power state.
>
> Signed-off-by: Jeremy Soller <jeremy@system76.com>
> Signed-off-by: Tim Crawford <tcrawford@system76.com>
> ---
>  drivers/platform/x86/system76_acpi.c | 31 ++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
>
> diff --git a/drivers/platform/x86/system76_acpi.c b/drivers/platform/x86/=
system76_acpi.c
> index 11f0e42386ba..06f6509980e2 100644
> --- a/drivers/platform/x86/system76_acpi.c
> +++ b/drivers/platform/x86/system76_acpi.c
> [...]
> @@ -514,6 +528,23 @@ static int system76_add(struct acpi_device *acpi_dev=
)
>  =09if (IS_ERR(data->therm))
>  =09=09return PTR_ERR(data->therm);
>
> +=09data->input =3D devm_input_allocate_device(&acpi_dev->dev);
> +=09if (!data->input)
> +=09=09return -ENOMEM;
> +
> +=09data->input->name =3D "System76 ACPI Hotkeys";
> +=09data->input->phys =3D "system76_acpi/input0";
> +=09data->input->id.bustype =3D BUS_HOST;
> +=09data->input->dev.parent =3D &acpi_dev->dev;
> +=09set_bit(EV_KEY, data->input->evbit);
> +=09set_bit(KEY_SCREENLOCK, data->input->keybit);

You can use `input_set_capability()` instead of manually setting the bits.


> +
> +=09err =3D input_register_device(data->input);
> +=09if (err) {
> +=09=09input_free_device(data->input);
> +=09=09return err;
> +=09}
> +
>  =09return 0;
>  }
>
> --
> 2.31.1
>


Regards,
Barnab=C3=A1s P=C5=91cze
