From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Accept flat mode for type 4
 multi mode status
Date: Mon, 18 Dec 2017 14:19:15 +0200
Message-ID: <CAHp75VexXUL0=fLQwN11NUVKYtRw4J88yBn_CH+UiUGzOL=e+Q@mail.gmail.com>
References: <20171114161414.14297-1-bberg@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46429 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758264AbdLRMTQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Dec 2017 07:19:16 -0500
Received: by mail-qt0-f194.google.com with SMTP id r39so19632494qtr.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2017 04:19:16 -0800 (PST)
In-Reply-To: <20171114161414.14297-1-bberg@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Benjamin Berg <bberg@redhat.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Peter FP1 Zhang <zhangfp1@lenovo.com>, Lyude <lyude@redhat.com>

On Tue, Nov 14, 2017 at 6:14 PM, Benjamin Berg <bberg@redhat.com> wrote:
> On the X1 Yoga 2nd Generation and most likely other notebooks the FLAT
> mode is reported. Decode it correctly rather than warning about an
> unexpected multi mode status to be reported.
>
> Signed-off-by: Benjamin Berg <bberg@redhat.com>
> Cc: Peter FP1 Zhang <zhangfp1@lenovo.com
> Cc: Lyude <lyude@redhat.com>

Applied to my review and testing queue, thanks!

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 91fab1a13a6d..d23c84222e9f 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -2106,26 +2106,24 @@ static int hotkey_gmms_get_tablet_mode(int s, int *has_tablet_mode)
>                               TP_ACPI_MULTI_MODE_FLAT |
>                               TP_ACPI_MULTI_MODE_TABLET |
>                               TP_ACPI_MULTI_MODE_STAND |
>                               TP_ACPI_MULTI_MODE_TENT;
>                 break;
>         case 3:
>                 valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
>                               TP_ACPI_MULTI_MODE_FLAT;
>                 break;
>         case 4:
> -               valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
> -                             TP_ACPI_MULTI_MODE_TABLET |
> -                             TP_ACPI_MULTI_MODE_STAND |
> -                             TP_ACPI_MULTI_MODE_TENT;
> -               break;
>         case 5:
> +               /* In mode 4, FLAT is not specified as a valid mode. However,
> +                * it can be seen at least on the X1 Yoga 2nd Generation.
> +                */
>                 valid_modes = TP_ACPI_MULTI_MODE_LAPTOP |
>                               TP_ACPI_MULTI_MODE_FLAT |
>                               TP_ACPI_MULTI_MODE_TABLET |
>                               TP_ACPI_MULTI_MODE_STAND |
>                               TP_ACPI_MULTI_MODE_TENT;
>                 break;
>         default:
>                 pr_err("Unknown multi mode status type %d with value 0x%04X, please report this to %s\n",
>                        type, value, TPACPI_MAIL);
>                 return 0;
> --
> 2.13.6
>



-- 
With Best Regards,
Andy Shevchenko
