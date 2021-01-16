Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F01CC433E0
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:48:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECBDC22DA7
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 19:48:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726619AbhAPTsc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 14:48:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbhAPTsb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 14:48:31 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F007C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:47:51 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g15so8323586pgu.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 11:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=I3+DlwkO4Si6d315wP3BzcEZG+9AIYY8Jj+P6C0a3nI=;
        b=A1G5YqTtyJhTgpQMIb1kMjpvBcn5gQTdJIlFxbnlp0IsHKRzXGgAK8rE7IMdrzrfb2
         lhtRL2PSVKKQ8SY6BMAJ3/ysZ3IhZ+9m9Mmvsw5lr1FVDo4PWp7tpKsDg+MvVyDZUIsj
         KFzgw8uJBhTz1OBGqkLsXvrmykKhRqhrYaGkWzcWFWIgEnANG+OyeVNqQHTngMP8NncZ
         JxdJZzJuKrvgrcgPa2nf9VcDb9BCpzydOVCpnEd7qLd1nh+8EtHUhGNrmhSpWMohyvQW
         Frve5RwmQXlYrxBvRihF9MkUnNQjC+riNRDaDDpGiDz2HEuqVsv1SLIE2/lhOmaIC9SB
         T5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=I3+DlwkO4Si6d315wP3BzcEZG+9AIYY8Jj+P6C0a3nI=;
        b=uGMNjY1dWEvZfD+iVb7yLubnybRF7aUu/uOpA1EC+TL789io7qXe679XoPhHNY/dty
         FHKAArPgFR9W9fbwQLR/2QU6bQXx0sRjtHSthx8simd7/5RGjTnYowtYOVsqknIuTm1d
         IEkTHrIeTQWmSsdjXRGa3ZJ1piGVAc58aPXNtZlO1aXPWTUeDXWWlcLhp0kjRxEXskqv
         m8S2CckUU614FLNwi6jMXtCSKGUJQPznYjc1XWEfv6bmxF+V3Wc7gCS4XPq48JhZLaD/
         PBHwBZVNqfMbWsCYDAca2r/uy4r6o3xs6YaX2r6ntUIiEkNuydRbfro/cucSRej/zkXP
         8oZw==
X-Gm-Message-State: AOAM532ri9ns8dWnnjAr0NFvFFRJXt0nl6OlBocKj8Kpuh1PoR5N9WcY
        rOZzEUSj6MxqmQzAyt8DjdJm5kokNO6pve76I2R67n5o08cL2g==
X-Google-Smtp-Source: ABdhPJz6yK9K0a9vL9QOV9mgbm0OubPeTK/Og9Bdyl6G1ZD3PDfkHwYJhIWUlJmoOhXu5czuV600VG3w2nRUi5cMgb0=
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id
 66-20020a6204450000b029019c162bbbefmr19191147pfe.40.1610826471097; Sat, 16
 Jan 2021 11:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-9-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-9-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 21:47:35 +0200
Message-ID: <CAHp75Vf-a4D0u6dmJso6jkHCXyCYGm-MFTgM08y2E_OiMr3qFg@mail.gmail.com>
Subject: Re: [PATCH v2 08/24] platform/x86: ideapad-laptop: convert ACPI
 helpers to return -EIO in case of failure
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

On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> ACPI helpers returned -1 in case of failure. Convert these functions to
> return appropriate error codes, and convert their users to propagate
> these error codes accordingly.

...

> -       int val;
> +       int val, err;
>         unsigned long int end_jiffies;

Perhaps in this and other similar cases switch to reversed xmas tree
order at the same time?

--=20
With Best Regards,
Andy Shevchenko
