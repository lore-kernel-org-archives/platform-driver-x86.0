From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi-aio: Block comments use * on
 subsequent lines
Date: Thu, 14 Dec 2017 19:58:35 +0200
Message-ID: <CAHp75Vd0-GDGTfpWhzOQOQcW=eTs1TFOMzSsNVYjZ=koaSkFdA@mail.gmail.com>
References: <20171213081855.22952-1-dhaval.shah@softnautics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35420 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753432AbdLNR6g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Dec 2017 12:58:36 -0500
In-Reply-To: <20171213081855.22952-1-dhaval.shah@softnautics.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dhaval Shah <dhaval.shah@softnautics.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 13, 2017 at 10:18 AM, Dhaval Shah
<dhaval.shah@softnautics.com> wrote:
> Resolved Block comments use * on subsequent lines checkpatch warnings.
> Issue found by checkpatch.

// indeed will look better in these cases.

Please, get blessing from author(s) / maintainer(s) of the module
first before sending any patches like this.

>
> Signed-off-by: Dhaval Shah <dhaval.shah@softnautics.com>
> ---
>  drivers/platform/x86/dell-wmi-aio.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-wmi-aio.c b/drivers/platform/x86/dell-wmi-aio.c
> index 50c2078715d6..3842b32a729c 100644
> --- a/drivers/platform/x86/dell-wmi-aio.c
> +++ b/drivers/platform/x86/dell-wmi-aio.c
> @@ -36,7 +36,8 @@ MODULE_LICENSE("GPL");
>  struct dell_wmi_event {
>         u16     length;
>         /* 0x000: A hot key pressed or an event occurred
> -        * 0x00F: A sequence of hot keys are pressed */
> +        * 0x00F: A sequence of hot keys are pressed
> +        */
>         u16     type;
>         u16     event[];
>  };
> @@ -115,7 +116,8 @@ static void dell_wmi_aio_notify(u32 value, void *context)
>                                 scancode = event->event[0];
>                         } else {
>                                 /* Broken machines return the scancode in a
> -                                  buffer */
> +                                * buffer
> +                                */
>                                 if (obj->buffer.pointer &&
>                                                 obj->buffer.length > 0)
>                                         scancode = obj->buffer.pointer[0];
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
