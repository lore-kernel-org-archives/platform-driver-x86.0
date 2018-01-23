From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v1 1/4] seq_file: Introduce DEFINE_SHOW_ATTRIBUTE()
 helper macro
Date: Tue, 23 Jan 2018 09:15:08 +0000
Message-ID: <20180123091508.6vpygg6ahrnynpks@dell>
References: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37673 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751116AbeAWJPL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Jan 2018 04:15:11 -0500
Received: by mail-wm0-f67.google.com with SMTP id v71so387228wmv.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Jan 2018 01:15:11 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20180122160546.51611-1-andriy.shevchenko@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org

On Mon, 22 Jan 2018, Andy Shevchenko wrote:

> The DEFINE_SHOW_ATTRIBUTE() helper macro would be useful for current
> users, which are many of them, and for new comers to decrease code
> duplication.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/ab8500-debugfs.c    | 14 --------------

Acked-by: Lee Jones <lee.jones@linaro.org>

>  drivers/platform/x86/pmc_atom.c | 14 --------------
>  include/linux/seq_file.h        | 14 ++++++++++++++
>  net/bluetooth/hci_debugfs.c     | 13 -------------
>  4 files changed, 14 insertions(+), 41 deletions(-)

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
