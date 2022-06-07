Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C73DDC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue,  7 Jun 2022 09:55:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240288AbiFGJzt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 7 Jun 2022 05:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240188AbiFGJzg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 05:55:36 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DC7BE7313
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 02:55:36 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id m20so34021954ejj.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 02:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kLeADl+bGocWVSl8yomUziuv+0ymwn1ixOTdNVPq5hw=;
        b=cN6nSG7jPrwHSfzDTNCONJtLB3q6BiVGeZkFdObDsM3gUu9SboXiJ9iQhobMmscywp
         ZFuNBV1Mlwa9cUHalQ438Iu30ihJizmX4cLKhxWmSVyGEZBgdbqUr87K+wXEBB4kDlOQ
         pmKIQXT3a/loR3cyXnz1poxcp4gMRJVF3VQzMiaWRRnwXXpk5M8NWdyN/WkxGcojJJWf
         UkIiIP1u0WhIMz6uay3fSXQCf16EPca5i14XfnCpz6fHwm728OVMTHC2LnX+pf+oRT2P
         +Xh7HQIk8YW2YOaYZoUfbTGncuvE5jrObEcF2nF7klBIqkv87uXiVzRp45B171TmkBm8
         xP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kLeADl+bGocWVSl8yomUziuv+0ymwn1ixOTdNVPq5hw=;
        b=nyI516rRnzrJT10rimgIaMQYy9L3XZhBYrxG/haJETsBJGF9UTQZip3S21bJ8chhQH
         /ftpD9HLCvh4DRcxBHZTDSNrfDykkbCTxITYaCKQDBL3/NFmvjRa2sL0iiSQRGu026Gu
         nc1mK3aRZ8rs+eOi1rVH0HJC8aqK7CLWA8594I4ULkhWZYiFW6D70GlU8kgPemH5E6aY
         DSG9n5A5RjlHJsTxCz64RYFmbYmYmCDoD5WyUgbq7KpQrDKNMvqhsY3BQ3wOAWs+gfmA
         YEbRhtZRjfZv5yffW2a70ymYUy1QwKIJYctV8uAFNhPPTejMUO/3sT1XlM6UMQIU24M2
         DMpA==
X-Gm-Message-State: AOAM532/51ofAZQPOXVYaKrYDO2S3zTfZn4/JjqQspfkgtv+qAMpBSDw
        cLkJEWdNvKg9BD9VYqshDBXTdRG2dhpjmJFaW01bdIx1o+y++Q==
X-Google-Smtp-Source: ABdhPJxAYe3ZiCo0uhAR/WRQZa/wGmEGi29AfeIppomfbQdzJyztlh6mjO3V30o/J4bcuGB/nbxa5X9vLG3r/d50BR8=
X-Received: by 2002:a17:906:d9d9:b0:710:f2ae:b455 with SMTP id
 qk25-20020a170906d9d900b00710f2aeb455mr14520675ejb.77.1654595734496; Tue, 07
 Jun 2022 02:55:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220606205451.21067-1-jorge.lopez2@hp.com>
In-Reply-To: <20220606205451.21067-1-jorge.lopez2@hp.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 7 Jun 2022 11:54:58 +0200
Message-ID: <CAHp75Vck8=TUeq6gQQyjS00i9Zn4G+vXK0Lev+AFMWdVpe1GGw@mail.gmail.com>
Subject: Re: [PATCH] Revert "platform/x86: hp-wmi: Changing bios_args.data to
 be dynamically allocated"
To:     Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 7, 2022 at 7:59 AM Jorge Lopez <jorgealtxwork@gmail.com> wrote:
>
> This reverts commit 4b4967cbd2685f313411e6facf915fb2ae01d796.
>
> Changes to bios_args.data to be allocated dynamically causes
> several WMI calls for OMEN laptops to fail.  The problem
> is resolved by reverting commit 4b4967cbd26.

As a quick fix it's good, but have you had a chance to understand why
this failure happened in the first place?

Can you check my theory that is expressed in the code below?

...

> -       bios_args_size = struct_size(args, data, insize);

Try to replace insize here with

max(insize, 128)

> -       args = kmalloc(bios_args_size, GFP_KERNEL);
> -       if (!args)
> -               return -ENOMEM;
> -
> -       input.length = bios_args_size;
> -       input.pointer = args;

-- 
With Best Regards,
Andy Shevchenko
