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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4938C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 16:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FEB664DEC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 16 Feb 2021 16:32:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbhBPQcx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 16 Feb 2021 11:32:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230149AbhBPQcw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Feb 2021 11:32:52 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8948FC061574
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Feb 2021 08:32:12 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id kr16so1335624pjb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Feb 2021 08:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Er88WuUlOuM5v9boHLAqxCkFJxq2khSVH6hCvW0lNBc=;
        b=srTnYgGJ6MaRHG0BQlQhvjNV/M87RULZ/hjCxNgqkQGlsxNmMhgT94sKq0na/qdAZp
         /FWSyto2ZZ5APrP+avNDCZy6IpN3nHByeLBqVNMgRweLXCeA/cbInC7KuFSa98AKKntT
         7ixGlFBYaeJwrEgrO55vZeLq30olerYuSCknIiUMpRkxFlcZw3mOxQGihmYJIVURBO+M
         MnSrZlwBzKGh9Mt4S7LFHxI+kjUaUPu09Z21le3DtZrkKBWrbuNi3yrNRlFuuJps9XMl
         D6AuWuNsRST84o5JnjP6HOLJQERw+DsPoyUm+FfXYMY5kV4byD9dSYE5tYnn7FqvKinQ
         cceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Er88WuUlOuM5v9boHLAqxCkFJxq2khSVH6hCvW0lNBc=;
        b=DZzEvdU4b9SrorFefzquhnLy3rkrmkAGw61tkgj8TN/9emL1xCVi39czHtVZidHdBd
         RF5JuhCkzfhNse+OeX3Kce1K3orfFne3JoIhGzsGv32c9B87Hftw+B30gzgrcoCaNwjk
         ryBIgsP/Xj2TKncO7v/f/IaxIDxusEE+OrfRjSIjpp+d50shn+m5pNQQqa2vHdRsSzhQ
         PyPi27djTxdbFYE0mHB7fmIMYH8GfmscruqIXAjUpRJSvI8WftWxHuIVPZ8IeLBi11W7
         sodUv4UqV8X7jMiVMtdxm426mAEuD01NX4cB3ZxY8cM3208m7xiOnhIa1J7/MlS/6bPr
         Kopg==
X-Gm-Message-State: AOAM533iinN72auhP45ZUQfSdfS4cVXNhbHDUjlH8IUlxsukcS4QhAKN
        NJlXJFFrtZWhl44R03e03LZHGKUFy9ZE9vEFshvKbw+P44Ya+w==
X-Google-Smtp-Source: ABdhPJyx33YluK+5iBQedfoS82fr62ALUdVJvJo8hdU8D4TpJjjOHzHynT0/xP2I7HvZai5GV/M3w39gzgRsVtPz1SY=
X-Received: by 2002:a17:90b:3d8:: with SMTP id go24mr5088375pjb.181.1613493132062;
 Tue, 16 Feb 2021 08:32:12 -0800 (PST)
MIME-Version: 1.0
References: <20210216152454.11878-1-hdegoede@redhat.com>
In-Reply-To: <20210216152454.11878-1-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 16 Feb 2021 18:31:55 +0200
Message-ID: <CAHp75Ve9yJSakfinLsmeOOaYCYjB6TikxdH1NgkJ8nSMgnAtfw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: update MELLANOX HARDWARE PLATFORM SUPPORT maintainers
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 16, 2021 at 5:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The "MELLANOX HARDWARE PLATFORM SUPPORT" is maintained as part of the
> pdx86 tree. But when Mark and I took over as new pdx86 maintainers the
> "MELLANOX HARDWARE PLATFORM SUPPORT" MAINTAINERS entry was not updated.
>
> Update the entry now.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 452f0f7b7c21..aa800d6829ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11367,8 +11367,8 @@ Q:      https://patchwork.kernel.org/project/netdevbpf/list/
>  F:     drivers/net/ethernet/mellanox/mlxfw/
>
>  MELLANOX HARDWARE PLATFORM SUPPORT
> -M:     Andy Shevchenko <andy@infradead.org>
> -M:     Darren Hart <dvhart@infradead.org>
> +M:     Hans de Goede <hdegoede@redhat.com>
> +M:     Mark Gross <mgross@linux.intel.com>
>  M:     Vadim Pasternak <vadimp@nvidia.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Supported
> --
> 2.30.1
>


-- 
With Best Regards,
Andy Shevchenko
