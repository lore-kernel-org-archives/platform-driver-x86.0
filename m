Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26ACFC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:11:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E79D222CAE
	for <platform-driver-x86@archiver.kernel.org>; Sat, 16 Jan 2021 20:11:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbhAPULY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 16 Jan 2021 15:11:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPULX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:11:23 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3CDBC061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:10:42 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id y12so6982706pji.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Jan 2021 12:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1BTQK8w5wGXhDZxIj9EEGwjAI0oynQwMdW7RhlB/xiI=;
        b=N2LUr/K/dzko745Yv8XARprn8HkWQq1l9j2Q5hWOM/DSKeRQSj6BCyv6CU5AASoiIQ
         4t1gZvBSu0rcKBhYGNJcdajrGAU6GK0d4VEcgnqrUX+Uv0bhPW7VPcd4HFhVbmnIQueK
         pvvzej+Wzfjq1D+JC52dD/fTx/TnLoGXRSea8IENlrBrDS/W37LJBRNh4r3cYzitEdFI
         onbpgc+dTjSwhcqTtQWcYGSb9IZzgU0eQlD0dPHozdU4J7FnQg65xrQq5LKC0pJ9J+WA
         KWyNfJlGxHQV9b9HIIHmbQFRO2PyRr9B+wOg2DrjbutbuR7cMLM0QTZ0u3D9iA70R2bG
         rbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1BTQK8w5wGXhDZxIj9EEGwjAI0oynQwMdW7RhlB/xiI=;
        b=XtgtQENGJX6kZL6lbuY9t3LY/nrwUzMcHfbWegt0IzJfwWkNsPE1IB2zDQj8rcjTp/
         m9EbUXiVjpYJ41wGh7pSQ/gc76oF1ugwSCplMD30gXxILuEzXXqSOGHmK27onnERjk0r
         IRZTfyxNwT+meWVlChVB8JdKoHejzi6fSv1ZKq717BBWfQrcvGyB4xz1Sz7xTqR9metG
         TBE0cyP4EcClZjf9maB7eMpzsPnN4BkOhRO594bKgR2/ATebip5eEVftaHQpylqmRqIb
         kbHUwDwwGmhDZMFrpxF2ZzRyK0rbF4HA57uY/JMWSpcqnBZcZLxfFKl1yofo70Z5I6wU
         8fmQ==
X-Gm-Message-State: AOAM533FnbBQLCmH2SEh3Wk4xlgWi8GqscYKa6OHNi05JUtrfk3A91AE
        VCUHNWbFT5rRNrExJik+J0nJzm0uOebjckyBu2BaOcRbvMtQPA==
X-Google-Smtp-Source: ABdhPJzrOZk7ZInjuPPvVlo/hS/4rxHjn/+l/DA+7Cl4BQmheKu9DIQCFNxiyKht5QmZqt4jtSie50P3yR4hms8NKiM=
X-Received: by 2002:a17:90a:1050:: with SMTP id y16mr17710817pjd.181.1610827842406;
 Sat, 16 Jan 2021 12:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20210113182016.166049-24-pobrn@protonmail.com>
In-Reply-To: <20210113182016.166049-24-pobrn@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:10:26 +0200
Message-ID: <CAHp75Ve8DO+DufJ=ApDonLjqdrOaRa4L-Tpeg8YWGNKvCBY_Eg@mail.gmail.com>
Subject: Re: [PATCH v2 23/24] Documentation/ABI: sysfs-platform-ideapad-laptop:
 update device attribute paths
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

On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> The documentation referred to non-existent device attributes under a non-=
existent
> platform device. Update it with the current location of the attributes.

Fixes tag, please?

--=20
With Best Regards,
Andy Shevchenko
