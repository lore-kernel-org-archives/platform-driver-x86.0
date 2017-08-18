From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v1 4/6] platform: x86: Add generic Intel IPC driver
Date: Fri, 18 Aug 2017 15:38:56 +0300
Message-ID: <CAHp75VftGZRoT6aFMD8Mi1GQ=846gwSWTsE-HU00+ijuTtgo4g@mail.gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com> <ed86bc43a959eb1aacbbca4eeb03547e25571aa8.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:34593 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750709AbdHRMi5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 08:38:57 -0400
In-Reply-To: <ed86bc43a959eb1aacbbca4eeb03547e25571aa8.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

On Tue, Aug 1, 2017 at 9:13 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> Currently intel_scu_ipc.c, intel_pmc_ipc.c and intel_punit_ipc.c
> redundantly implements the same IPC features and has lot of code
> duplication between them. This driver addresses this issue by grouping
> the common IPC functionalities under the same driver.
>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_ipc_dev.h | 148 ++++++++++++

No, it should go under include/linux/platform_data/x86/

> +/*
> + * intel_ipc_dev.h: IPC class device header file

No file names in the top of files.

> + *
> + * (C) Copyright 2017 Intel Corporation
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; version 2
> + * of the License.
> + *
> + */

> +struct intel_ipc_dev_cfg {
> +       void __iomem *base;
> +       void __iomem *wrbuf_reg;
> +       void __iomem *rbuf_reg;
> +       void __iomem *sptr_reg;
> +       void __iomem *dptr_reg;
> +       void __iomem *status_reg;
> +       void __iomem *cmd_reg;

No, you have to switch to regmap instead.

> +       int mode;
> +       int irq;
> +       int irqflags;
> +       int chan_type;
> +       bool use_msi;
> +};


-- 
With Best Regards,
Andy Shevchenko
