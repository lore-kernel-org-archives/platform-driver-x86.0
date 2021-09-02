Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDACC432BE
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F18B7610C8
	for <platform-driver-x86@archiver.kernel.org>; Thu,  2 Sep 2021 09:29:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245609AbhIBJa1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 2 Sep 2021 05:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343550AbhIBJaY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Sep 2021 05:30:24 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2469EC061757
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Sep 2021 02:29:26 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id r2so1284782pgl.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Sep 2021 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IYqWQWxmmmgzVglkjTrOcWE2sxTAYxJjP1kuqglTTns=;
        b=UKYoAbE/f9POWfvCH6x0yGiinLcwTw//+lz+pApVGv+JpzgrjzlVcPCv1AJ2HyXgdz
         NZJpd+LnRoebbGn3KWb529lMMXls1mmxQk6GGs3YvluS1gxDzbfpWKtWLTPYLxuZACz7
         +Rjs/YEuAeMrW9/OS7nj+FGu0C7bpIbwg7TbyUi26rLb80EpqA0tBE1TE5fgF03U/nGb
         ay0mhfj474cbkWTCZyzII4GAQVU+FEZ/6cOPli8mVUlOXmhfeV1tsCQp2aXj36ZC02JS
         aywUy/+ZwGIIWQ2JVD8Vye19Oqn3Nrq/XF/agScma05tf+gN4V8TZ6YXfzTPJpBHZU25
         8Ifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IYqWQWxmmmgzVglkjTrOcWE2sxTAYxJjP1kuqglTTns=;
        b=OLzrc3sfYYEqcmLJ3lSvne9eq3SPS6TnfUd6WZjSEazs3Zu97V+JezPrjUDZxboadX
         d77r4q6SDg022pdGQ1t9K0oCDWrHf5Da1x2va+kHRpTqcNPZI2CBuBYZp2fzWaWok02I
         QJBXeg4y3/nIs2jKMCkbc8xXtZqRq+X9i0CV30kKBmQvYgdt6AqazZqFLxoJB1yM0Kpn
         biNoeX/SonwLqUtUG30hYc2E7PxEy5ssg6mJwSQzy0990NflbwZ0Z3bRhqBdV48q3YuC
         ighQqrbzGl8DAc1kphPb6s04kR1+VSxNl8Hi2a1VQPnZGVtLK5RqhPZoTL4Xn1TrsPJA
         Zrjg==
X-Gm-Message-State: AOAM531S67ZFa7fXbtltYA2XyIT98Km0QC+l3RKg0aWn6UnIheR19+I+
        aYUBb4p8gF/Ypexgj2glW49Hc13THGPOpNW4GlA=
X-Google-Smtp-Source: ABdhPJwI/LVArejymvNoQhSs/W2BazTGwRo5YP/L6498yH+kBQbUuWm2MReg3rfpnptbaxQ2GyWRANOhh2lnhq15LwI=
X-Received: by 2002:a65:45c3:: with SMTP id m3mr2319329pgr.203.1630574965461;
 Thu, 02 Sep 2021 02:29:25 -0700 (PDT)
MIME-Version: 1.0
References: <70b81e33-c769-4cb8-0bae-5ee10a209389@nvidia.com>
 <20210831224906.1072-1-ddadap@nvidia.com> <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
In-Reply-To: <eb7d46e2-64a8-4eb7-a940-e130ddae8626@t-8ch.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Sep 2021 12:28:49 +0300
Message-ID: <CAHp75Vf76-qf=9_tnYYnXw8C15GNcf0Up-kt3GKoe_hd=i3UcA@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: Add driver for ACPI WMAA EC-based
 backlight control
To:     =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Daniel Dadap <ddadap@nvidia.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        mario.limonciello@outlook.com,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Aaron Plattner <aplattner@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 1, 2021 at 12:25 PM Thomas Wei=C3=9Fschuh <linux@weissschuh.net=
> wrote:

> > v4: Use MODULE_DEVICE_TABLE() (Thomas Wei??schuh <thomas@t-8ch.de>)
> >     Fix scope of internal driver state; various style fixes (Barnab??s
> >     P??cze, Andy Shevchenko)
> >     Use devm_backlight_device_register() (Barnab??s P??cze)
> >     Add kerneldoc comments for enums and structs (Andy Shevchenko)
>
> It seems your Mailsetup breaks Unicode.

I see it properly, so, the problem is on your branch of email delivery.

--=20
With Best Regards,
Andy Shevchenko
