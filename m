From: Mihai =?UTF-8?Q?Don=C8=9Bu?= <mihai.dontu@gmail.com>
Subject: Re: wmi: usercopy: Kernel memory overwrite attempt detected to
 spans multiple pages (offset 0, size 4104)
Date: Sun, 17 Jun 2018 22:30:27 +0300
Message-ID: <1529263827.6069.4.camel@gmail.com>
References: <1529182886.3450.3.camel@gmail.com>
         <1529186697.2784.2.camel@gmail.com>
         <CAGXu5jLwA37YJWi50i7bQZ6N7MtctvbXjsVg337zgD11AQ=9SA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jLwA37YJWi50i7bQZ6N7MtctvbXjsVg337zgD11AQ=9SA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 2018-06-17 at 10:36 -0700, Kees Cook wrote:
> On Sat, Jun 16, 2018 at 3:04 PM, Mihai Donțu wrote:
> > On Sun, 2018-06-17 at 00:01 +0300, Mihai Donțu wrote:
> > > While trying to adjust the keyboard backlight mode, I hit this BUG:
> > > 
> > > Jun 16 22:16:07 mdontu-l kernel: usercopy: Kernel memory overwrite attempt detected to spans multiple pages (offset 0, size 4104)!
> 
> CONFIG_HARDENED_USERCOPY_PAGESPAN=y is really only useful for
> debugging special cases. For now, I recommend leaving it disabled,
> since there are a lot of cases it still trips over.
> 
> > I eventually sprinkled some printk-s and got this:
> > 
> >  855         if (copy_from_user(buf, input, wblock->req_buf_size)) {
> >  856                 dev_dbg(&wblock->dev.dev, "Copy %llu from user failed\n",
> >  857                         wblock->req_buf_size);
> >  858                 ret = -EFAULT;
> >  859                 goto out_ioctl;
> >  860         }
> 
> However, since you tracked this one down, I think this would be fixed
> by adjusting the handler_data allocation:
> 
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 8e3d0146ff8c..ea6bf98f197a 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -918,8 +918,8 @@ static int wmi_dev_probe(struct device *dev)
>                 }
> 
>                 count = get_order(wblock->req_buf_size);
> -               wblock->handler_data = (void *)__get_free_pages(GFP_KERNEL,
> -                                                               count);
> +               wblock->handler_data = (void *)
> +                       __get_free_pages(GFP_KERNEL | __GFP_COMP, count);
>                 if (!wblock->handler_data) {
>                         ret = -ENOMEM;
>                         goto probe_failure;
> 

Your patch works OK for me, thank you. The libsmbios tool, however, not
so much. It appears to be behind latest developments.

# echo "+keyboard" >/sys/class/leds/dell\:\:kbd_backlight/start_triggers

is all that is needed today.

Regards,

> But in looking further, I don't know why this is using
> __get_free_pages() instead of kmalloc? In fact, there is a kfree() in
> the error path, which looks wrong:
> 
>         kfree(wblock->handler_data);
> 
> I think this should just be converted to using kmalloc/kfree everywhere.

-- 
Mihai Donțu
