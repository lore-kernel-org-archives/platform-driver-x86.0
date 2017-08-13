From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: hp-wmi: Remove unused macro helper
Date: Sun, 13 Aug 2017 15:23:15 +0300
Message-ID: <CAHp75Vc1pX+aOZMLy3a87oAUYVOCmW4YntOh2oFqPJQOgna-8g@mail.gmail.com>
References: <20170730154050.21545-1-pcacjr@zytor.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35386 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751420AbdHMMXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Aug 2017 08:23:16 -0400
Received: by mail-qk0-f194.google.com with SMTP id a77so7258518qkb.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 13 Aug 2017 05:23:16 -0700 (PDT)
In-Reply-To: <20170730154050.21545-1-pcacjr@zytor.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Paulo Alcantara <pcacjr@zytor.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

On Sun, Jul 30, 2017 at 6:40 PM, Paulo Alcantara <pcacjr@zytor.com> wrote:

Pushed for testing with correct commit message.
Please, fill it in the future, thanks!

> Signed-off-by: Paulo Alcantara <pcacjr@zytor.com>
> ---
>  drivers/platform/x86/hp-wmi.c | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index 0df4209648d1..5a88553e31e9 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -107,13 +107,6 @@ enum hp_wmi_hardware_mask {
>         HPWMI_TABLET_MASK       = 0x04,
>  };
>
> -#define BIOS_ARGS_INIT(write, ctype, size)                             \
> -       (struct bios_args)      {       .signature = 0x55434553,        \
> -                                       .command = (write) ? 0x2 : 0x1, \
> -                                       .commandtype = (ctype),         \
> -                                       .datasize = (size),             \
> -                                       .data = 0 }
> -
>  struct bios_return {
>         u32 sigpass;
>         u32 return_code;
> --
> 2.11.0
>



-- 
With Best Regards,
Andy Shevchenko
