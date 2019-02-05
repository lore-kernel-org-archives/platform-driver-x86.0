From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] wmi: avoid a double-fetch issue in wmi_ioctl
Date: Tue, 5 Feb 2019 19:33:37 +0200
Message-ID: <CAHp75Vd9fg0BsWj+VUj3-QRvCNZXRjtXuTiH8tpAyjz4ZEgReA@mail.gmail.com>
References: <20181225193611.69216-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181225193611.69216-1-kjlu@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: Aditya Pakki <pakki001@umn.edu>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 25, 2018 at 9:37 PM Kangjie Lu <kjlu@umn.edu> wrote:
>
> buf->length is first copied in from user space and security-checked. The
> second copy issued by copy_from_user copies it again. The data in user
> space may have been modified by malicious users.

So, we already did a check and copied not more than we would expect.

> filter_callback()
> further uses the potentially modified data.

How?

> The fix avoids the
> double-fetch that overwrites buf->length.

NAK.

> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>  drivers/platform/x86/wmi.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index bea35be68706..93cab9a70ad7 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -850,7 +850,8 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>                         buf->length, wblock->req_buf_size);
>
>         /* copy the structure from userspace */
> -       if (copy_from_user(buf, input, wblock->req_buf_size)) {
> +       if (copy_from_user(buf->data, input->data,
> +                               wblock->req_buf_size - sizeof(buf->length))) {
>                 dev_dbg(&wblock->dev.dev, "Copy %llu from user failed\n",
>                         wblock->req_buf_size);
>                 ret = -EFAULT;
> --
> 2.17.2 (Apple Git-113)
>


-- 
With Best Regards,
Andy Shevchenko
