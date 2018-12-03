From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: intel_ips: NULL check before some freeing
 functions is not needed.
Date: Mon, 3 Dec 2018 21:10:53 +0200
Message-ID: <CAHp75VcTMORW52cuY+CYmu-g+VMiMYD-59qoh3i__0r7u5dOHw@mail.gmail.com>
References: <1543760930050-1499171309-0-diffsplit-thomas@m3y3r.de> <1543760930051-726829870-3-diffsplit-thomas@m3y3r.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1543760930051-726829870-3-diffsplit-thomas@m3y3r.de>
Sender: linux-kernel-owner@vger.kernel.org
To: thomas@m3y3r.de
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, Dec 2, 2018 at 10:55 PM Thomas Meyer <thomas@m3y3r.de> wrote:
>
> NULL check before some freeing functions is not needed.

Pushed to my review and testing queue, thanks!

>
> Signed-off-by: Thomas Meyer <thomas@m3y3r.de>
> ---
>
> diff -u -p a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
> --- a/drivers/platform/x86/intel_ips.c
> +++ b/drivers/platform/x86/intel_ips.c
> @@ -1300,8 +1300,7 @@ static const struct file_operations ips_
>
>  static void ips_debugfs_cleanup(struct ips_driver *ips)
>  {
> -       if (ips->debug_root)
> -               debugfs_remove_recursive(ips->debug_root);
> +       debugfs_remove_recursive(ips->debug_root);
>         return;
>  }
>


-- 
With Best Regards,
Andy Shevchenko
