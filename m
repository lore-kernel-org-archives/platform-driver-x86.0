From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Remove unused iTCO_version variable
Date: Tue, 3 Jan 2017 22:46:37 +0200
Message-ID: <CAHp75VfTcHxY9dZvwD_jZ-i1gJ8_7naeWRvcFAfcGUKF-KS_iw@mail.gmail.com>
References: <1483454774-906-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:33540 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933948AbdACUqn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 3 Jan 2017 15:46:43 -0500
In-Reply-To: <1483454774-906-1-git-send-email-linux@roeck-us.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jan 3, 2017 at 4:46 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> iTCO_version was there since the driver was introduced but never used.
> Drop it.

Pushed to testing.
Thanks!

>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 0bf51d574fa9..59a86121105b 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -97,8 +97,6 @@
>  #define TCO_PMC_OFFSET                 0x8
>  #define TCO_PMC_SIZE                   0x4
>
> -static const int iTCO_version = 3;
> -
>  static struct intel_pmc_ipc_dev {
>         struct device *dev;
>         void __iomem *ipc_base;
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
