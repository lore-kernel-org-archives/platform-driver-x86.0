From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] hp_accel: Add support for HP ZBook 17
Date: Tue, 27 Dec 2016 13:57:18 +0200
Message-ID: <CAHp75Vd8ahFTzxV=2iVJvG-MH04MyRyyVqyYQJNZUG7wukJ26A@mail.gmail.com>
References: <20161221095553.rbrw7qyulrdsyunl@lenoch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35742 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754025AbcL0L5T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Dec 2016 06:57:19 -0500
In-Reply-To: <20161221095553.rbrw7qyulrdsyunl@lenoch>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ladislav Michl <ladis@linux-mips.org>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, Darren Hart <dvhart@infradead.org>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Wed, Dec 21, 2016 at 11:55 AM, Ladislav Michl <ladis@linux-mips.org> wrote:
> HP ZBook 17 laptop needs a non-standard mapping (xy_swap_yz_inverted).
>

Pushed to testing with fixed Subject (should be "platform/x86: ...").
Thanks.

> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Test done on patched driver; reading /sys/devices/platform/lis3lv02d/position
>  - laptop is horizontal: (-36,0,1188)
>  - the left side is elevated: (522,18,1062)
>  - the front side (where the touchpad is) is elevated: (0,-612,990)
>  - the laptop is put upside-down: (-36,18,-1188)
>
>  drivers/platform/x86/hp_accel.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 09356684c32f..493d8910a74e 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -251,6 +251,7 @@ static const struct dmi_system_id lis3lv02d_dmi_ids[] = {
>         AXIS_DMI_MATCH("HPB64xx", "HP EliteBook 84", xy_swap),
>         AXIS_DMI_MATCH("HPB65xx", "HP ProBook 65", x_inverted),
>         AXIS_DMI_MATCH("HPZBook15", "HP ZBook 15", x_inverted),
> +       AXIS_DMI_MATCH("HPZBook17", "HP ZBook 17", xy_swap_yz_inverted),
>         { NULL, }
>  /* Laptop models without axis info (yet):
>   * "NC6910" "HP Compaq 6910"
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With Best Regards,
Andy Shevchenko
