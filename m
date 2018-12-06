From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_ips: Remove unnecessary NULL check
 before debugfs_remove_recursive
Date: Thu, 6 Dec 2018 04:37:18 +0200
Message-ID: <CAHp75Ve-nZsyvHJcVJxb7wfk=0NDw7mwGdoZwh+VD6nnJpuNJg@mail.gmail.com>
References: <20181206010914.21964-1-wen.yang99@zte.com.cn>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181206010914.21964-1-wen.yang99@zte.com.cn>
Sender: linux-kernel-owner@vger.kernel.org
To: wen.yang99@zte.com.cn
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, zhong.weidong@zte.com.cn
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Dec 6, 2018 at 3:09 AM Wen Yang <wen.yang99@zte.com.cn> wrote:
>
> debugfs_remove_recursive() accepts a NULL parameter and returns
> immediately, there's no need for a NULL check in the caller.
>
> This issue was detected with the help of Coccinelle.
>

Thank you, similar patch is already in my queue.

> Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
> CC: Darren Hart <dvhart@infradead.org>
> CC: Andy Shevchenko <andy@infradead.org>
> CC: platform-driver-x86@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  drivers/platform/x86/intel_ips.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> index 225638a1b09e..f8175b972537 100644
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -1300,9 +1300,7 @@ static const struct file_operations ips_debugfs_ops = {
>
>  static void ips_debugfs_cleanup(struct ips_driver *ips)
>  {
> -       if (ips->debug_root)
> -               debugfs_remove_recursive(ips->debug_root);
> -       return;
> +       debugfs_remove_recursive(ips->debug_root);
>  }
>
>  static void ips_debugfs_init(struct ips_driver *ips)
> --
> 2.19.1
>


-- 
With Best Regards,
Andy Shevchenko
