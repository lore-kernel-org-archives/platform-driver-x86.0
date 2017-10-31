From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] Sony-laptop: Use common error handling code in sony_nc_setup_rfkill()
Date: Tue, 31 Oct 2017 15:33:18 +0200
Message-ID: <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
Sender: linux-kernel-owner@vger.kernel.org
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Mattia Dongili <malattia@linux.it>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 30, 2017 at 10:15 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 30 Oct 2017 21:10:49 +0100
>
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.

Apparently this patch done without reading the actual code.

NAK.

-1 is EPERM which sounds wrong here. If you would like to fix it,
propagate a real error codes from sony_call_snc_handle().

>         if (!rfk)
>                 return -ENOMEM;

Okay error code.

>
> -       if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0) {
> -               rfkill_destroy(rfk);
> -               return -1;

Not okay.

> -       }
> +       if (sony_call_snc_handle(sony_rfkill_handle, 0x200, &result) < 0)
> +               goto destroy_rfk;
> +
>         hwblock = !(result & 0x1);
>
>         if (sony_call_snc_handle(sony_rfkill_handle,
> -                               sony_rfkill_address[nc_type],
> -                               &result) < 0) {
> -               rfkill_destroy(rfk);
> -               return -1;

Not okay and it might be different from previous case.

> -       }
> +                                sony_rfkill_address[nc_type],
> +                                &result) < 0)
> +               goto destroy_rfk;
> +
>         swblock = !(result & 0x2);
>
>         rfkill_init_sw_state(rfk, swblock);
> @@ -1684,6 +1682,10 @@ static int sony_nc_setup_rfkill(struct acpi_device *device,
>         }
>         sony_rfkill_devices[nc_type] = rfk;
>         return err;
> +
> +destroy_rfk:
> +       rfkill_destroy(rfk);
> +       return -1;

P.S. Don't bother us with patches on which you didn't do your home work.
Thanks for understanding.

-- 
With Best Regards,
Andy Shevchenko
