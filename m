From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86 alienware-wmi: lightbar LED support for Dell
 Inspiron 5675.
Date: Fri, 17 Nov 2017 15:37:50 +0200
Message-ID: <CAHp75VebvMotwQkWOfMd6nUgcfENF8_28LLBWGQEk7_9v1+YRw@mail.gmail.com>
References: <1510799707-3532-1-git-send-email-chang_liu4@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:41360 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757070AbdKQNhv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2017 08:37:51 -0500
In-Reply-To: <1510799707-3532-1-git-send-email-chang_liu4@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chang Liu <foggy.liu@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Chang Liu <chang_liu4@dell.com>

On Thu, Nov 16, 2017 at 4:35 AM, Chang Liu <foggy.liu@gmail.com> wrote:
> Inspiron 5675 lightbar compatible with wmi interface on alienware,
> the difference lies in the zone number and color control.
> Add Inspiron 5675 DMI quirks to detect by dmi_check_system.

Mario, do you have any comment on this?

>
> Signed-off-by: Chang Liu <chang_liu4@dell.com>
> ---
>  drivers/platform/x86/alienware-wmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> index 4eb8e1a..9d7dbd9 100644
> --- a/drivers/platform/x86/alienware-wmi.c
> +++ b/drivers/platform/x86/alienware-wmi.c
> @@ -68,6 +68,14 @@ struct quirk_entry {
>
>  static struct quirk_entry *quirks;
>
> +
> +static struct quirk_entry quirk_inspiron5675 = {
> +       .num_zones = 2,
> +       .hdmi_mux = 0,
> +       .amplifier = 0,
> +       .deepslp = 0,
> +};
> +
>  static struct quirk_entry quirk_unknown = {
>         .num_zones = 2,
>         .hdmi_mux = 0,
> @@ -171,6 +179,15 @@ static const struct dmi_system_id alienware_quirks[] __initconst = {
>                      },
>          .driver_data = &quirk_asm201,
>          },
> +        {
> +        .callback = dmi_matched,
> +        .ident = "Dell Inc. Inspiron 5675",
> +        .matches = {
> +                    DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +                    DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 5675"),
> +                    },
> +        .driver_data = &quirk_inspiron5675,
> +        },
>         {}
>  };
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
