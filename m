Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CBCC43334
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Jun 2022 15:12:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243322AbiFTPMF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Jun 2022 11:12:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242127AbiFTPLj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 11:11:39 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2599D1F2E4
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 08:01:34 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id fd6so12757671edb.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MGhT9sBmAXD+E3qEISPGTHlR9iZUa32mlpWZBko6pZI=;
        b=O/1rkDk1+5mP9KjlpzgDDp4DfUAw9RjtIxzToVTIi9YN8oLIBYhdtzoFOEV0wRn2Gt
         95g+M+NihS5y4QghROsouvAcg1PgN2vJKN9hXd3gQrE0j5FVdZOlYFNxaouSLCTrRAML
         cSIslRHip8s7UbKjUMoMWhK3+O8NJsjdZL6dAGu3O7vBRdkMVeEGTW/0bSpUs8ZcknaE
         ZJoh6JM/U1F9gLFmEWaIfLJVOGAcISSNezDsKSjDdZmGImKYD9BZtEF2wdNFW/Dt6VF8
         sUjD3JJZY1IbGksczkAnvmz3Ikm9njKp/O+1EpCanB67Ftj+3K0Yr20SWoO5UIt2+0Hu
         5Tig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MGhT9sBmAXD+E3qEISPGTHlR9iZUa32mlpWZBko6pZI=;
        b=64iGMVU9XLn+aC53Pi6ZlTMDVAIdPhvDJ1ElBfwd6chh10NUuWRrhc7Sx6S+ZHf6xx
         pcfaikxd3XC8glvvL654j4wtaCUpPfoqGtivlrqtqMKm3AiV8k6w7Ip24KU39C/p6Pnz
         r9AuwEHXaoQBzlAyl3ZZn14grPWbZ7LUE9NWC6Cze/nsgA2Kb1ZPNfa6AbPE4jkkc73K
         AEPJ2tq6QFSMLyyjNyxPaC41nWf545RPm4SyVP1dJAP1nvnVmMio0PoLQcuVJ5QHvYDp
         +V4qQKM+rsBOkX7xSJlkjejOJ7+WBQMawEmimtQXN/FX49ppLwN03Nl99Nh8XKLUmTnP
         ZGcA==
X-Gm-Message-State: AJIora9xdsebcqCWJFMwZd7Zb1SGrKT2j4V7myeCOq1MMe4HQ7DmHfv9
        5Cql2UG+Z2agzzHMsPSw/eEO3bCVgjXTGu8wv24=
X-Google-Smtp-Source: AGRyM1u8kBByFePHyjsRvWhfUtnR3clFyY85sNse3y62TcUDA7qdE8QbuGPSGgNOBO9pYylKDWPttVAjn5CX/mFrYQ4=
X-Received: by 2002:a05:6402:f8d:b0:435:6df2:68a with SMTP id
 eh13-20020a0564020f8d00b004356df2068amr15633799edb.209.1655737292334; Mon, 20
 Jun 2022 08:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220620145628.5882-1-hdegoede@redhat.com> <20220620145628.5882-2-hdegoede@redhat.com>
In-Reply-To: <20220620145628.5882-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Jun 2022 17:00:55 +0200
Message-ID: <CAHp75VdgrUFTgzT6jYo4ff+JEbvBncZKbx0317FduZzGcida4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] platform/x86: Kconfig: Remove unnecessary "if X86"
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 20, 2022 at 4:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> drivers/platform/x86/Kconfig is wrapped in one big
> if X86_PLATFORM_DEVICES .. endif and X86_PLATFORM_DEVICES already
> has a "depends on X86" so the "if X86" in drivers/platform/Kconfig
> is not necessary and except for mips non of the other includes

MIPS
none ?

> there has such an if. So lets remove it.


let's

> While at it also move the x86/Kconfig include to the end of the file
> for alphabetical sorting.


Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - Drop "if X86" from drivers/platform/Kconfig instead of dropping the
>   "depends on X86" from X86_PLATFORM_DEVICES
> ---
>  drivers/platform/Kconfig | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
> index 18fc6a08569e..b437847b6237 100644
> --- a/drivers/platform/Kconfig
> +++ b/drivers/platform/Kconfig
> @@ -1,7 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -if X86
> -source "drivers/platform/x86/Kconfig"
> -endif
>  if MIPS
>  source "drivers/platform/mips/Kconfig"
>  endif
> @@ -15,3 +12,5 @@ source "drivers/platform/mellanox/Kconfig"
>  source "drivers/platform/olpc/Kconfig"
>
>  source "drivers/platform/surface/Kconfig"
> +
> +source "drivers/platform/x86/Kconfig"
> --
> 2.36.0
>


-- 
With Best Regards,
Andy Shevchenko
