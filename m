Return-Path: <SRS0=uF4I=EO=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D2E3C388F9
	for <platform-driver-x86@archiver.kernel.org>; Sun,  8 Nov 2020 09:02:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C08F3206E3
	for <platform-driver-x86@archiver.kernel.org>; Sun,  8 Nov 2020 09:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GDHgyjdU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgKHJCf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 8 Nov 2020 04:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgKHJCf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 8 Nov 2020 04:02:35 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87E2C0613CF
        for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2020 01:02:34 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id g12so4366020pgm.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Nov 2020 01:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PWtnylFX0q/w+cDB8JfKaNEr/g9LAE5i9sce9MU6VD0=;
        b=GDHgyjdUdklFdDfng7KXoHlEv99CBlfHdDc+Wtv/7vwJDANHGSaHemOfF4sMFgZMOL
         eMhBIyz8L3X0E/Nfa/iUtSIUs40kdsZimXlGJSpvfZwe98ByKRZvHxv6+wTd8r0lZ5T0
         7atL6UGTANYsa1ArLsURyPlIblUNcYzIEUfNEa4hsVSskl8aGpfLG4+0nZDfKdUaM7HK
         e3VhBxRyTJ/3JdkuoWPkyjMNzAoRzAeke+I9s/hCZVhTIaLqMjbWqPqk9bzygzNWbbLF
         Kmo/ox3lVF8Vi0yFEkW82/BV+P7Id88KUKRimb3MMZgmnXSl5LDa5YaVjVpFCo3GK4rq
         I+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PWtnylFX0q/w+cDB8JfKaNEr/g9LAE5i9sce9MU6VD0=;
        b=ilLmbuVqudN8P+pwHYF2zZLtHLiavjm35rpB75p8yepUbCzaNvxqxjBGquoYl6s6N2
         Lqf9YGL6yZdKCyrUGB7lQG8O02q7HkDA4Q4qjNj47R4EZxU7K/hwJBkaWg4tQjtHPEz2
         7dtHOtqSBITh8Tcg1hw6tiVd2UZL6prt+Z7KdRr8A5BuxiR/HPdwMAd2dSycBCMMDH5g
         5gNC1To2V+ycw88ls0UzYmge6iRIU/22cGiyAxad7QL3mBtlq/Mtz8fzmYv6vktaGfZg
         shg1aofqE6TF4p1w1ScYklP3uBq9HpT+Kt3BtfTFjnGTmnIv5K93wmeG9tH5UQEtDmV2
         FGIw==
X-Gm-Message-State: AOAM530VDEdhsFUrRqJPAaHvtGh5AMN16HR47yBQEEsXZkLWlzRq0deh
        hank2MijfnWDtm9/8KSUzJPa5mqHBrNlup5uKIA=
X-Google-Smtp-Source: ABdhPJwmOmrQ9nPoa9j105kqubpEQ8ZVY0IfmGQOEZwTK74c06yDCgjIjzUK70GL32o2WWDUOJGjr1IwK+F/FwCjgLA=
X-Received: by 2002:a63:d54e:: with SMTP id v14mr8857947pgi.203.1604826154148;
 Sun, 08 Nov 2020 01:02:34 -0800 (PST)
MIME-Version: 1.0
References: <1604753621-7387-1-git-send-email-kaixuxia@tencent.com>
In-Reply-To: <1604753621-7387-1-git-send-email-kaixuxia@tencent.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 8 Nov 2020 11:02:17 +0200
Message-ID: <CAHp75VfuuoqZvV22JPJghUVFtixM=HD2L9S=2WFfEo1tVKRF_w@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Assign boolean values to a
 bool variable
To:     xiakaixu1987@gmail.com, Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     irenic.rajneesh@gmail.com, "Box, David E" <david.e.box@intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Kaixu Xia <kaixuxia@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Nov 7, 2020 at 2:57 PM <xiakaixu1987@gmail.com> wrote:
>
> From: Kaixu Xia <kaixuxia@tencent.com>
>
> Fix the following coccinelle warnings:
>
> ./drivers/platform/x86/intel_pmc_core.c:932:1-16: WARNING: Assignment of 0/1 to bool variable

Thanks for the patch! Looks good to me.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. Don't forget to include subsystem maintainers.

>
> Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 3e5fe66333f1..ee2f757515b0 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -929,7 +929,7 @@ static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
>                 fd |= CNP_PMC_LATCH_SLPS0_EVENTS;
>         pmc_core_reg_write(pmcdev, map->slps0_dbg_offset, fd);
>
> -       slps0_dbg_latch = 0;
> +       slps0_dbg_latch = false;
>
>  out_unlock:
>         mutex_unlock(&pmcdev->lock);
> --
> 2.20.0
>


-- 
With Best Regards,
Andy Shevchenko
