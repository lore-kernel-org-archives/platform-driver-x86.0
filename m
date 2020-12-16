Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAF5C2BBCA
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 13:49:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D164233A0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 16 Dec 2020 13:49:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726423AbgLPNth (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 16 Dec 2020 08:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbgLPNth (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Dec 2020 08:49:37 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 683EBC061794;
        Wed, 16 Dec 2020 05:48:57 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id hk16so1634736pjb.4;
        Wed, 16 Dec 2020 05:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jVpMaa65XdUi0ZF2chjG5GMbEJ9ODIn4ft7XMeRkbY0=;
        b=unncvyMdNNks6o+nJ8eLUqBGOOiVyMLMlDWHVN9FF/wwwdj6WLzh+ax0l35ig/b7YC
         JRd0QjdO5cB+K31pRBA23nUxIaFUJAhmlgLmy1YevjsN7DJ1RiLy5lyOaexZNZ7ZxdSD
         DbrIUbFfoAjgBP/f8jJKcoycJ/rTDOaLWYdqHRFiXXGDa9vXDPIwDsEPp6w6Wrvj8cSr
         /IvvR+uvMXUC/hHK6WmUidtx+ZPfqUQm6YXVw04R1TXY/NrLNqzgXrV3Cu2c8bmubZYc
         Zge4KpHA7uKc1QVtM/PDTLvGuB4wKMP/ry/1Di304RaPC6gx5UP8MOrMqfWjdo6b7yXN
         0BYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jVpMaa65XdUi0ZF2chjG5GMbEJ9ODIn4ft7XMeRkbY0=;
        b=CzRxnYt8ZEQNQ6+rZrK8N/EiHuBYW0l0+xZUAMA7eny4yAJFLf1k5dDHu+r1oY3yTk
         2wWaM1mKgvWcrSFv6ldRFcpmWGJAhux85RhdQtlhSZs5wRseQigkVP3UkJZTLopHzMHq
         7m5xouxfIwbZiQ06lhMpqHNTK7m6qq/KRHmhbEF1RVdo2T4odfEm8nGRSipap1WrXywI
         XORn3cVV4L6Fh/dYtcUSIVrzBcFDlo5uTmyDHScJ+YvopoM+Ee8Qu3a0rgb6dTPF6QuQ
         Vm7Pmsgi9Ja5ufq9c6l3YqGjou4AJQ9P9j0BURFOtzkokysvwZKuLqifCHK6WwYZ0udS
         f3BA==
X-Gm-Message-State: AOAM532+gAFqzIBMdfgavHDl7d5VvjRkF30OxeCGVJA2YX+qBmsjeSo1
        dySm7i6wU2+tmEyBmvzqC917HHvf/Ez56n6LKQw=
X-Google-Smtp-Source: ABdhPJyAABLpvk+ZRkJGYvaZMZCswconILHy3E5pbCnpNvDl+ZAEXJJMK5TjY/ccnYShkp+jTG7/BKQwg4KGvCfQvy0=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr31419433plb.17.1608126536383; Wed, 16
 Dec 2020 05:48:56 -0800 (PST)
MIME-Version: 1.0
References: <20201216131107.14339-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201216131107.14339-1-zhengyongjun3@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 16 Dec 2020 15:49:44 +0200
Message-ID: <CAHp75VdzQJrzgUOpxseNvv9ZhSrh1Gnu7W-5CQM-kXh4o5fsGg@mail.gmail.com>
Subject: Re: [PATCH -next] platform: intel-mid: device_libs: convert comma to semicolon
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Dec 16, 2020 at 3:11 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Replace a comma between expression statements by a semicolon.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  arch/x86/platform/intel-mid/device_libs/platform_bt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/x86/platform/intel-mid/device_libs/platform_bt.c b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> index 31dda18bb370..2930b6e9473e 100644
> --- a/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> +++ b/arch/x86/platform/intel-mid/device_libs/platform_bt.c
> @@ -88,8 +88,8 @@ static int __init bt_sfi_init(void)
>         memset(&info, 0, sizeof(info));
>         info.fwnode     = ddata->dev->fwnode;
>         info.parent     = ddata->dev;
> -       info.name       = ddata->name,
> -       info.id         = PLATFORM_DEVID_NONE,
> +       info.name       = ddata->name;
> +       info.id         = PLATFORM_DEVID_NONE;
>
>         pdev = platform_device_register_full(&info);
>         if (IS_ERR(pdev))
> --
> 2.22.0
>


-- 
With Best Regards,
Andy Shevchenko
