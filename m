From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 1/5] platform/x86: intel_pmc_ipc: Fix register names
Date: Fri, 17 Nov 2017 14:49:25 +0200
Message-ID: <CAHp75VcU+e+ZEdczY-WhXWfat16LUGzZbhRS6YEtPizRkaMMgA@mail.gmail.com>
References: <1510827497-25188-1-git-send-email-souvik.k.chakravarty@intel.com> <1510827497-25188-2-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:36674 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750869AbdKQMt0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 07:49:26 -0500
In-Reply-To: <1510827497-25188-2-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>

On Thu, Nov 16, 2017 at 12:18 PM, Souvik Kumar Chakravarty
<souvik.k.chakravarty@intel.com> wrote:
> GCR TELEM register names have been fixed as per the External Design
> Sepcification (EDS) of Apollolake and GeminiLake. This makes it
> possible to fetch the complete 64-bit S0ix counter using exported APIs.
>
> This patch also fixes some alignment issues in the macro definition
> section.

>  /* Commands */
>  #define PMC_IPC_PMIC_ACCESS            0xFF
> -#define                PMC_IPC_PMIC_ACCESS_READ        0x0
> -#define                PMC_IPC_PMIC_ACCESS_WRITE       0x1
> +#define        PMC_IPC_PMIC_ACCESS_READ        0x0
> +#define        PMC_IPC_PMIC_ACCESS_WRITE       0x1

I don't see any usefulness of this hunk, honestly.


>  /* GCR reg offsets from gcr base*/
>  #define PMC_GCR_PMC_CFG_REG            0x08
> -#define PMC_GCR_TELEM_DEEP_S0IX_REG    0x78
> -#define PMC_GCR_TELEM_SHLW_S0IX_REG    0x80
> +#define PMC_GCR_TELEM_DEEP_S0IX_LO_REG 0x78
> +#define PMC_GCR_TELEM_DEEP_S0IX_HI_REG 0x7C
> +#define PMC_GCR_TELEM_SHLW_S0IX_LO_REG 0x80
> +#define PMC_GCR_TELEM_SHLW_S0IX_HI_REG 0x84

> -       deep = gcr_data_readq(PMC_GCR_TELEM_DEEP_S0IX_REG);
> -       shlw = gcr_data_readq(PMC_GCR_TELEM_SHLW_S0IX_REG);
> +       deep = gcr_data_readq(PMC_GCR_TELEM_DEEP_S0IX_LO_REG);
> +       shlw = gcr_data_readq(PMC_GCR_TELEM_SHLW_S0IX_LO_REG);

I didn't get how this helps to what commit message states.
Moreover, it's a common practice to name 64-bit registers without
LO/HI split (in case we access them using readq() / writeq() or alike
functions).

-- 
With Best Regards,
Andy Shevchenko
