From: Dmitry Tunin <hanipouspilot@gmail.com>
Subject: Re: [RESEND] asus-nb-wmi: Add wapf4 quirk for X200MA
Date: Mon, 29 Jun 2015 18:37:04 +0300
Message-ID: <CANoib0EjQE5YyDeby=P1_C+DpbvMFQh4A_Bhj0Z9uJZ4OTYv-w@mail.gmail.com>
References: <1435591785-14133-1-git-send-email-hanipouspilot@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-la0-f46.google.com ([209.85.215.46]:36589 "EHLO
	mail-la0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752732AbbF2PhG (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Jun 2015 11:37:06 -0400
In-Reply-To: <1435591785-14133-1-git-send-email-hanipouspilot@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@linux.intel.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, platform-driver-x86 <platform-driver-x86@vger.kernel.org>, Dmitry Tunin <hanipouspilot@gmail.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>

This patch was sent by a mistake. I rebased it and there was an error. Sent v2.

2015-06-29 18:29 GMT+03:00 Dmitry Tunin <hanipouspilot@gmail.com>:
> Wireless is not blocked without this quirk, but
> wireless LED does not follow wireless status.
> With this quirk it accurately reflects if wireless is on or off.
>
> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> Acked-by: Corentin Chary <corentin.chary@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/platform/x86/asus-nb-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 3a4951f..4b1c13d 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -104,6 +104,15 @@ static const struct dmi_system_id asus_quirks[] = {
>                 .ident = "ASUSTeK COMPUTER INC. X401U",
>                 .matches = {
>                         DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "X200MA"),
> +               },
> +               .driver_data = &quirk_asus_wapf4,
> +       },
> +       {
> +               .callback = dmi_matched,
> +               .ident = "ASUSTeK COMPUTER INC. X401U",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>                         DMI_MATCH(DMI_PRODUCT_NAME, "X401U"),
>                 },
>                 .driver_data = &quirk_asus_x55u,
> --
> 1.9.1
>
