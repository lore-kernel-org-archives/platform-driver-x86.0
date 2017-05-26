From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_pmc_ipc: Mark ipc_data_readb() as __maybe_unused
Date: Fri, 26 May 2017 12:53:52 +0300
Message-ID: <CAHp75VdjrwYX72e87xKFzcdmhAd7=zZeKRU84zgBc3iNuKPXdQ@mail.gmail.com>
References: <20170525221510.41751-1-mka@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:34919 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1947312AbdEZJxy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 May 2017 05:53:54 -0400
In-Reply-To: <20170525221510.41751-1-mka@chromium.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Zha Qipeng <qipeng.zha@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Douglas Anderson <dianders@chromium.org>

On Fri, May 26, 2017 at 1:15 AM, Matthias Kaehlcke <mka@chromium.org> wrote:
> The function is currently not used, however it is part of the API and
> might be used in the future. Adding the attribute fixes the following
> warning when building with clang:
>
>     drivers/platform/x86/intel_pmc_ipc.c:189:18: error: unused function
>         'ipc_data_readb' [-Werror,-Wunused-function]
>

Pushed to testing, thanks!

> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index e4d4dfe3e1d1..bb792a52248b 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -186,7 +186,7 @@ static inline void ipc_data_writel(u32 data, u32 offset)
>         writel(data, ipcdev.ipc_base + IPC_WRITE_BUFFER + offset);
>  }
>
> -static inline u8 ipc_data_readb(u32 offset)
> +static inline u8 __maybe_unused ipc_data_readb(u32 offset)
>  {
>         return readb(ipcdev.ipc_base + IPC_READ_BUFFER + offset);
>  }
> --
> 2.13.0.219.gdb65acc882-goog
>



-- 
With Best Regards,
Andy Shevchenko
