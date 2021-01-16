Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB81C433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:10:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 426E822BEF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbhAPUKc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:10:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUKa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:10:30 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86439C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:09:50 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 15so8359796pgx.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:09:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=hRmzOzLXVMHtOSlVojLgSR1Web60yDjm1ibauTkqMdY=;
        b=HoeXxtY6FcL6dpUqJtTrD3DYE3lpPrLWiqI8ARk1JAenjbDWykxHKMeFW6BXW0sy33
         KQpj0fhmncflr6cNAtvfpACsZt7iSPK59o7PHBdBXMubmP4whlutI8QppizUnh184D98
         MVkC4gmFoCmSWNFrhZg76aNJmYVmap3dzHFZ+mtiEIOYMHGA09+fyChfvgtU5+4jogX/
         Dr9voI5O1GKdcO9vHB4GFAvK5ayY/uSJITPrxmtrH6I7vE+q5hQspoITy3Mhlt0HU5zD
         V0UfTXMtWXKYyynO6+/0A6bbPIU5MOAJ2DPHNuU4hEH9u9JfY+UBPOPe7t3/+mUL0lMV
         nUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=hRmzOzLXVMHtOSlVojLgSR1Web60yDjm1ibauTkqMdY=;
        b=CtfsXOyV2bl6tsypaZ3OeAr4QE54CTf2GON73vGWUqyE+OVEuNdC7fYeoSycKMST14
         DyugPLMsAw8NAqTZXPZlTCImjBbepkMDMHe7wmX6u9MraKsaOtpCWziVbEJaiQvYyZY/
         9x/P/E2Z+UL8NXAZQe/m0tcEEJmGncnslNY6YvgqoJsPvGV26U20gqZAbdeXyrHq5Z5f
         hFgcX6MKRLeZrVxkhLhMFf5d6JcpUK2vB9MeQn5cmx2MCFBJIf70IppXIw9txTwufJLl
         lXsQI93/20TfSVG8W5JK0J42zHHxRo9z/g9LJBHGtlm6IJriSMc+8RA7fpFpCNOxdv0k
         vV1A==
X-Gm-Message-State: AOAM530xOKMwAxP2DFgypZiGC+WCuvHCbvbVmIgEnbjWT1VRtmmq8mtj
        zm1ODmjoYsEDXFIshqPa1yHAdFi6XqQHv6sCIHKoIFR1zbU9Lg==
X-Google-Smtp-Source: ABdhPJz7s3IYDXZjZpdFccCjz/2/wFUqe+vf+ef//x5zNdhGwujci4ARsHvzC5fhsB7igGHk6noNgSPTlBVfF0wi7t4=
X-Received: by 2002:a62:5a86:0:b029:1ae:6b45:b6a9 with SMTP id
 o128-20020a625a860000b02901ae6b45b6a9mr18792794pfb.7.1610827790057; Sat, 16
 Jan 2021 12:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-23-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-23-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:09:34 +0200
Message-ID: <CAHp75VdRsA5dUS10_njbnzicwPj8XmwWZrtLa9pZuUL4NpudzQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/24] platform/x86: ideapad-laptop: add "always on USB
 charging" control support
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 13, 2021 at 8:24 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Certain models have a so-called "always on USB charging" feature, which
> enables USB charging even when the computer is turned off or suspended,
> and which may be controlled/queried using the SALS/HALS ACPI methods.
> Expose this functionality via a new device attribute (usb_charging).
> Tested on: Lenovo YOGA 520-14IKB 80X8

...

>  enum {
> -       HALS_KBD_BL_SUPPORT_BIT  =3D 4,
> -       HALS_KBD_BL_STATE_BIT    =3D 5,
> -       HALS_FNLOCK_SUPPORT_BIT  =3D 9,
> -       HALS_FNLOCK_STATE_BIT    =3D 10,
> -       HALS_HOTKEYS_PRIMARY_BIT =3D 11,
> +       HALS_KBD_BL_SUPPORT_BIT       =3D 4,
> +       HALS_KBD_BL_STATE_BIT         =3D 5,
> +       HALS_USB_CHARGING_SUPPORT_BIT =3D 6,
> +       HALS_USB_CHARGING_STATE_BIT   =3D 7,
> +       HALS_FNLOCK_SUPPORT_BIT       =3D 9,
> +       HALS_FNLOCK_STATE_BIT         =3D 10,
> +       HALS_HOTKEYS_PRIMARY_BIT      =3D 11,
>  };
>
>  enum {
> -       SALS_KBD_BL_ON  =3D 0x8,
> -       SALS_KBD_BL_OFF =3D 0x9,
> -       SALS_FNLOCK_ON  =3D 0xe,
> -       SALS_FNLOCK_OFF =3D 0xf,
> +       SALS_KBD_BL_ON        =3D 0x8,
> +       SALS_KBD_BL_OFF       =3D 0x9,
> +       SALS_USB_CHARGING_ON  =3D 0xa,
> +       SALS_USB_CHARGING_OFF =3D 0xb,
> +       SALS_FNLOCK_ON        =3D 0xe,
> +       SALS_FNLOCK_OFF       =3D 0xf,
>  };

Twice in the same series you reindented these. Please, indent them
correctly in the first place.

--=20
With Best Regards,
Andy Shevchenko
