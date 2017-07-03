From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Add IdeaPad V310-14ISK
 to no_hw_rfkill
Date: Mon, 3 Jul 2017 14:56:06 +0300
Message-ID: <CAHp75Vd7d+84UCQRVasd-X7H_RD0ov0__8S_L-hiYMs38bGF3Q@mail.gmail.com>
References: <CAFwVRQH5fQJOPUaM42P78pSHs9Vu_T-QSHT+1a-6x1HQaeKowA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:34240 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752795AbdGCL4I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Jul 2017 07:56:08 -0400
Received: by mail-qk0-f194.google.com with SMTP id 91so23586521qkq.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Jul 2017 04:56:07 -0700 (PDT)
In-Reply-To: <CAFwVRQH5fQJOPUaM42P78pSHs9Vu_T-QSHT+1a-6x1HQaeKowA@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bin Li <bin.li@canonical.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, "dvhart@infradead.org" <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Fri, Jun 30, 2017 at 6:05 AM, Bin Li <bin.li@canonical.com> wrote:
> Like other Lenovo models the IdeaPad V310-14ISK does not have an hw
> rfkill switch. This results in hard-blocked radios after boot, resulting
> in always blocked radios rendering them unusable.
>
> Add the IdeaPad V310-14ISK to the no_hw_rfkill DMI list and allows using
> the built-in radios.
>

Hmm... I didn't get yet what's wrong with this email, patchwork didn't
catch it from the stream.
For now I'm going to apply it manually.

> Signed-off-by: Bin Li <bin.li@canonical.com>
> ---
>  drivers/platform/x86/ideapad-laptop.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/ideapad-laptop.c
> b/drivers/platform/x86/ideapad-laptop.c
> index 24ca9fb..8336af4 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -869,6 +869,13 @@ static const struct dmi_system_id no_hw_rfkill_list[] =
> {
>   },
>   },
>   {
> + .ident = "Lenovo V310-14ISK",
> + .matches = {
> + DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> + DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo V310-14ISK"),
> + },
> + },
> + {
>   .ident = "Lenovo V310-15ISK",
>   .matches = {
>          DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
