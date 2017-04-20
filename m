From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/9] platform/x86: hp-wmi: Add bios_args initializer
Date: Thu, 20 Apr 2017 10:37:45 +0300
Message-ID: <CAHp75VcMsmqsuZZmoRy7L7d5xzZzWyxjQFUBvwTmFhkXCtaLVg@mail.gmail.com>
References: <cover.1492654448.git.dvhart@infradead.org> <7a898f33a9032f7a65c14f4c131386e8a548ba2e.1492654448.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:35357 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S939742AbdDTHhr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Apr 2017 03:37:47 -0400
In-Reply-To: <7a898f33a9032f7a65c14f4c131386e8a548ba2e.1492654448.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Carlo Caione <carlo@caione.org>

On Thu, Apr 20, 2017 at 5:25 AM, Darren Hart <dvhart@infradead.org> wrote:
> From: "Darren Hart (VMware)" <dvhart@infradead.org>
>
> Cleanup the hp_wmi_perform_query function some by providing a bios_args
> initializer. No functional changes.

Is it going to be used only once?
If so, I would go with current code.

>
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/hp-wmi.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> index e772105..aa9d99c 100644
> --- a/drivers/platform/x86/hp-wmi.c
> +++ b/drivers/platform/x86/hp-wmi.c
> @@ -93,6 +93,13 @@ struct bios_args {
>         u32 data;
>  };
>
> +#define BIOS_ARGS_INIT(write, ctype, size)                             \
> +       (struct bios_args)      {       .signature = 0x55434553,        \
> +                                       .command = (write) ? 0x2 : 0x1, \
> +                                       .commandtype = (ctype),         \
> +                                       .datasize = (size),             \
> +                                       .data = 0 }
> +
>  struct bios_return {
>         u32 sigpass;
>         u32 return_code;
> @@ -190,18 +197,12 @@ static struct rfkill2_device rfkill2[HPWMI_MAX_RFKILL2_DEVICES];
>  static int hp_wmi_perform_query(int query, int write, void *buffer,
>                                 int insize, int outsize)
>  {
> -       struct bios_return *bios_return;
> -       int actual_outsize;
> -       union acpi_object *obj;
> -       struct bios_args args = {
> -               .signature = 0x55434553,
> -               .command = write ? 0x2 : 0x1,
> -               .commandtype = query,
> -               .datasize = insize,
> -               .data = 0,
> -       };
> +       struct bios_args args = BIOS_ARGS_INIT(write, query, insize);
>         struct acpi_buffer input = { sizeof(struct bios_args), &args };
>         struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
> +       struct bios_return *bios_return;
> +       union acpi_object *obj;
> +       int actual_outsize;
>         u32 rc;
>
>         if (WARN_ON(insize > sizeof(args.data)))
> --
> 2.9.3
>



-- 
With Best Regards,
Andy Shevchenko
