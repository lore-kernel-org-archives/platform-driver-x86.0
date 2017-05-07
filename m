From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: toshiba_acpi: use memdup_user_nul
Date: Sun, 7 May 2017 14:42:50 +0300
Message-ID: <CAHp75VfhU1GWskBAqo4dMThHTQ4Fiz5owx2A8fJaRZWqMMZopA@mail.gmail.com>
References: <6baf3aa45d0b5e0fd016b508bac905ebf8443aac.1493779294.git.geliangtang@gmail.com>
 <fac5b29b1e0ced6836e41c58f86da08ec523cc42.1493779654.git.geliangtang@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fac5b29b1e0ced6836e41c58f86da08ec523cc42.1493779654.git.geliangtang@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geliang Tang <geliangtang@gmail.com>
Cc: Azael Avalos <coproscefalo@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sat, May 6, 2017 at 6:40 PM, Geliang Tang <geliangtang@gmail.com> wrote:
> Use memdup_user_nul() helper instead of open-coding to simplify the
> code.
>

Pushed to testing, thanks.

> Signed-off-by: Geliang Tang <geliangtang@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index d0daf75..88f9f79 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -1502,14 +1502,9 @@ static ssize_t video_proc_write(struct file *file, const char __user *buf,
>         int ret;
>         u32 video_out;
>
> -       cmd = kmalloc(count + 1, GFP_KERNEL);
> -       if (!cmd)
> -               return -ENOMEM;
> -       if (copy_from_user(cmd, buf, count)) {
> -               kfree(cmd);
> -               return -EFAULT;
> -       }
> -       cmd[count] = '\0';
> +       cmd = memdup_user_nul(buf, count);
> +       if (IS_ERR(cmd))
> +               return PTR_ERR(cmd);
>
>         buffer = cmd;
>
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
