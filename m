From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_scu_ipc: make intel_scu_ipc_pdata_t const
Date: Sun, 13 Aug 2017 15:30:47 +0300
Message-ID: <CAHp75VeOV8dNmWARwcq=0DL2g4LE3sJEoObMwBt7fbEuTa3Juw@mail.gmail.com>
References: <1502457551-29177-1-git-send-email-bhumirks@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:37987 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751611AbdHMMas (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 08:30:48 -0400
In-Reply-To: <1502457551-29177-1-git-send-email-bhumirks@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bhumika Goyal <bhumirks@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Aug 11, 2017 at 4:19 PM, Bhumika Goyal <bhumirks@gmail.com> wrote:
> Make these const as they are only used during a copy operation.
>
> Done using Coccinelle.
>

Both patches pushed to testing, thanks!

> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>  drivers/platform/x86/intel_scu_ipc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index f7cf981..2c85f75 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -72,20 +72,20 @@ struct intel_scu_ipc_pdata_t {
>         u8 irq_mode;
>  };
>
> -static struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
> +static const struct intel_scu_ipc_pdata_t intel_scu_ipc_lincroft_pdata = {
>         .i2c_base = 0xff12b000,
>         .i2c_len = 0x10,
>         .irq_mode = 0,
>  };
>
>  /* Penwell and Cloverview */
> -static struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
> +static const struct intel_scu_ipc_pdata_t intel_scu_ipc_penwell_pdata = {
>         .i2c_base = 0xff12b000,
>         .i2c_len = 0x10,
>         .irq_mode = 1,
>  };
>
> -static struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
> +static const struct intel_scu_ipc_pdata_t intel_scu_ipc_tangier_pdata = {
>         .i2c_base  = 0xff00d000,
>         .i2c_len = 0x10,
>         .irq_mode = 0,
> --
> 1.9.1
>



-- 
With Best Regards,
Andy Shevchenko
