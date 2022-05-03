Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F19AC433FE
	for <platform-driver-x86@archiver.kernel.org>; Tue,  3 May 2022 14:10:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236744AbiECONu (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 3 May 2022 10:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236729AbiECONt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 May 2022 10:13:49 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC2F1116E;
        Tue,  3 May 2022 07:10:15 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id p4so20069042edx.0;
        Tue, 03 May 2022 07:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pO45YY01U+bTVAIkmaJLaCl/9u7nmB7mYqprioeZIOs=;
        b=paEMqmka6f8mpNISqQLJ8v7VG7J8jKIiP1xE5jvdbMI5mY1pliwFiL60KvH4jNp/X3
         GNz4Zp4COzVNiFH/GBOrCbh+1S8h63HwjMJKbLxjGIEChL8P1ClGsNY5aDr5szlHIbmk
         4QdC/Fh4nCYytadZnD8sv422L2ubS7f71Nq2NS8yeEiLkEN/uEYXI1U3BeoxjoWJ160K
         d6WvGkSXYBB97+wLDeUN057i69mqr+DBLESvkONDgfhuXJvoYALmCaoV4DWq+1ovQgVi
         2dIEFJMyi8ogkdxK8V+Kg5sqTAcNtkkc/phTnVvESIOiZsYKE904pvNutHCMeKW0i59F
         vlqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pO45YY01U+bTVAIkmaJLaCl/9u7nmB7mYqprioeZIOs=;
        b=eeXw5GVEVFGmxyX43fLzXQCmNLWNtuOEh7vx/EigaUI5S0fNX/vOn3FwNTgJ0f421n
         bYxsnNCR4zbI09gIRloCDo/7iz6FXVoyd0uImZFqAwptMbs0DycnUIIcGDeZXGD0mpTS
         QcQg4Jek6lZnhudVNcMoR7dujMQHrHOzBISaZgLluihO0XA1oZm5RfAFVKnCmast/UNA
         F0UPcVhkkzAzdVTeiMlcxH+esU3X2rCzckt4X+T/3ablaea2T8pMamP2MeA6B+C98OZD
         W6IYlquff3sdYUh+Wj52WzgihrNWsPYe2dKlnYKCLcAiXZExGndF9tmYZGK99sclPnf4
         xFhQ==
X-Gm-Message-State: AOAM530BP2D6oYElxgvMhq6bJER3M9DbSuBuPY2aCehGFy0I5KsNk3td
        xLEHNH/W3RwxE5u48YTpB+G5R7gdGx7SkawZUp0=
X-Google-Smtp-Source: ABdhPJxkVGfXaZ/v6fSjDooQZ1W57yEXVK0RIV9gv8fHvROmzWqPFVr7ED3oJPoVyR7bSohgI/XLERZt/bhx5aoGCA4=
X-Received: by 2002:a50:e696:0:b0:419:998d:5feb with SMTP id
 z22-20020a50e696000000b00419998d5febmr18511146edm.122.1651587014313; Tue, 03
 May 2022 07:10:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220503140207.101218-1-hdegoede@redhat.com> <20220503140207.101218-2-hdegoede@redhat.com>
In-Reply-To: <20220503140207.101218-2-hdegoede@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 3 May 2022 16:09:38 +0200
Message-ID: <CAHp75Vc5CqEowHS3-NUYKuUexQTZD+D2_cf_L=zGPTxo26TS1A@mail.gmail.com>
Subject: Re: [PATCH 1/1] platform/x86: Drop the PMC_ATOM Kconfig option
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 3, 2022 at 4:03 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> The def_bool y PMC_ATOM Kconfig option provides a couple of symbols used
> by the code enabled by the X86_INTEL_LPSS option and it registers some
> clocks. These clocks are only registered on Bay Trail, Cherry Trail and
> Brasswell Intel SoCs and kernels targeting these SoCs must always have
> the X86_INTEL_LPSS option enabled otherwise many things will not work.
>
> Building the PMC_ATOM code on kernels which are not targeting the
> mentioned SoCs and which do not have the X86_INTEL_LPSS enabled is
> not useful.
>
> This means that we can simplify things by replacing the PMC_ATOM Kconfig
> option in Makefiles with X86_INTEL_LPSS and then drop the option.

Looks good to me,
Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/clk/x86/Makefile      | 4 +---
>  drivers/platform/x86/Kconfig  | 5 -----
>  drivers/platform/x86/Makefile | 2 +-
>  3 files changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/x86/Makefile b/drivers/clk/x86/Makefile
> index 1244c4e568ff..c2088b3c4081 100644
> --- a/drivers/clk/x86/Makefile
> +++ b/drivers/clk/x86/Makefile
> @@ -1,6 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_PMC_ATOM)         += clk-pmc-atom.o
>  obj-$(CONFIG_X86_AMD_PLATFORM_DEVICE)  += clk-fch.o
> -clk-x86-lpss-y                 := clk-lpss-atom.o
> -obj-$(CONFIG_X86_INTEL_LPSS)   += clk-x86-lpss.o
> +obj-$(CONFIG_X86_INTEL_LPSS)   += clk-lpss-atom.o clk-pmc-atom.o
>  obj-$(CONFIG_CLK_LGM_CGU)      += clk-cgu.o clk-cgu-pll.o clk-lgm.o
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index f08ad85683cb..85c396a43048 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1161,8 +1161,3 @@ config WINMATE_FM07_KEYS
>           that delivers key events when these buttons are pressed.
>
>  endif # X86_PLATFORM_DEVICES
> -
> -config PMC_ATOM
> -       def_bool y
> -       depends on PCI
> -       select COMMON_CLK
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 4a59f47a46e2..cc2a74713313 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -126,7 +126,7 @@ obj-$(CONFIG_INTEL_SCU_PCI)         += intel_scu_pcidrv.o
>  obj-$(CONFIG_INTEL_SCU_PLATFORM)       += intel_scu_pltdrv.o
>  obj-$(CONFIG_INTEL_SCU_WDT)            += intel_scu_wdt.o
>  obj-$(CONFIG_INTEL_SCU_IPC_UTIL)       += intel_scu_ipcutil.o
> -obj-$(CONFIG_PMC_ATOM)                 += pmc_atom.o
> +obj-$(CONFIG_X86_INTEL_LPSS)           += pmc_atom.o
>
>  # Siemens Simatic Industrial PCs
>  obj-$(CONFIG_SIEMENS_SIMATIC_IPC)      += simatic-ipc.o
> --
> 2.36.0
>


-- 
With Best Regards,
Andy Shevchenko
