Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9375AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 08:15:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B1E9610C8
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Sep 2021 08:15:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348176AbhICIQ1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Sep 2021 04:16:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348170AbhICIQ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Sep 2021 04:16:26 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36400C061575
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Sep 2021 01:15:27 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id c17so4868874pgc.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Sep 2021 01:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r77UG77TEi9UoiLkAnUunEexq+MEIfmyd1q64/sfa0k=;
        b=VuoC9TW2zNK6z4QxaxGz2e+OdoBLJ6CB9D7EPcX+DHoiXRmGWWqWxF6RetK4A8M+iG
         anbYvALslK07q6S788FgPUg/an8yiNrC/lgaj+eSkK19tMSOAG7qr0VaIrVhvGq5r0kK
         G22ypSvi/aT2E9I8pk0RuVl2cCAJ4AX98G3xiCpSVwmdJShyaV81G8i0NPWX44usn0/T
         6UuoBGqa6MvVYPt5M5QM/iQHr+oIhDz4fABDPMOdkgzzC6ImXgPjO6HNxm70KBf+pEMd
         GbL5RtT7Ek4J92We+ubUS8oN53B0/9ZAe/wfkhw/4iW5bQVXTDA2bpu7et1XDJdYrs5g
         XDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r77UG77TEi9UoiLkAnUunEexq+MEIfmyd1q64/sfa0k=;
        b=ezHY5y4ZrbmVotVd7r5xPxCbROtfOJuVIYPKDmiSpUsEZZl0FQL60IYN2wTBVaczKs
         40zPUZeZyo20BorZjUXLu5Xhi2iDWOppBwYkFpew6q0Y8RBO7FAoGfY63MUoYnj8hJIZ
         LLKxEdDG7cjChoWjOm9IVTLJltLnwzlFig9vObjvQVWI8NZDEodNcMc8lDcf8z7wMOx9
         X4gr8YMaoV3IiE3yi1ossYrypS+lq39EAgHg/N2yoL4kuVHxYCuzKTuO3NnsQP3shJpm
         6dPmGVAVK9ChWZ3I2Q01DO8xt3+60L7pzVlWlAWVYYDROA/8zhRQKuLVMaTFpKQ7mIJO
         09Ig==
X-Gm-Message-State: AOAM530j60oH2BOufMPr4/3AGkBKx7jvJSl6DI9a5XrznP1zPENOuwCj
        uCbCAjREgchp27BQswb+C0OPgi08VykfjGZS7yzXpM37B8fv8Q==
X-Google-Smtp-Source: ABdhPJwSfxTpHaBjHraA1CSy4rRfnjrk7zi2A+kXdMCv9T8E6TKx4MLw3HZgKIQ06Q7UQx34sU4M5Qfz4Q2e03v2hYI=
X-Received: by 2002:aa7:875a:0:b0:3f1:c4c8:5f0d with SMTP id
 g26-20020aa7875a000000b003f1c4c85f0dmr2204306pfo.40.1630656926627; Fri, 03
 Sep 2021 01:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <f4802d28-3674-bbc3-0377-52d3d03af4fe@redhat.com>
 <20210902214718.13628-1-ddadap@nvidia.com> <e63904b7-105b-4401-bd40-82854b7d42d1@t-8ch.de>
 <43912a84-511d-18d9-7a3f-61716d9889ad@nvidia.com>
In-Reply-To: <43912a84-511d-18d9-7a3f-61716d9889ad@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 3 Sep 2021 11:14:50 +0300
Message-ID: <CAHp75VetBYgtE3ezS81K104PqkevvxSkO2mCa=GWLgEO2-UJxA@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        mario.limonciello@outlook.com,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Sep 3, 2021 at 3:22 AM Daniel Dadap <ddadap@nvidia.com> wrote:
> On 9/2/21 6:20 PM, Thomas Wei=C3=9Fschuh wrote:

...

> >> +#define WMAA_WMI_GUID "603E9613-EF25-4338-A3D0-C46177516DB7"
> >> +
> >> +static const struct wmi_device_id wmaa_backlight_wmi_id_table[] =3D {
> >> +    { .guid_string =3D WMAA_WMI_GUID },
> > This could also be inlined as:
> >       { "603E9613-EF25-4338-A3D0-C46177516DB7" },
> >
> > More a stylistic thing though.
>
> I considered that when switching to MODULE_DEVICE_TABLE, since the value
> is now only used in one place, but looking at other similar drivers, it
> does seem that the most common convention is to define the GUID as a
> macro even if it's only used once. I'll leave this as-is, I think.

I'm on Daniel's side here. But the problem I have noticed with the
proposal is different, i.e. it loses the C99 style of member
definitions.

--=20
With Best Regards,
Andy Shevchenko
