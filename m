From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/2] dell-wmi: Add events created by Dell Rugged 2-in-1s
Date: Sat, 19 Nov 2016 18:33:30 +0200
Message-ID: <CAHp75Vd3bJOv7Cpp9xYXDV3s1pFpdS0-yvKPasY85g0TNK8X7A@mail.gmail.com>
References: <1469728428-24881-1-git-send-email-mario_limonciello@dell.com> <1469728428-24881-2-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:35089 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750958AbcKSQdb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 19 Nov 2016 11:33:31 -0500
In-Reply-To: <1469728428-24881-2-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Thu, Jul 28, 2016 at 8:53 PM, Mario Limonciello
<mario_limonciello@dell.com> wrote:
> The Dell Rugged 7202 has 3 programmable buttons (labeled P1, P2, P3)
> and a detachable keyboard/mouse dock.
>
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>

There was a long discussion in the past. Just to get it clear. Are we
all okay with version 2 of this series?

> ---
>  drivers/platform/x86/dell-wmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 866bf73..28ec17a 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -274,6 +274,16 @@ static const struct key_entry dell_wmi_keymap_type_0010[] __initconst = {
>
>         /* Stealth mode toggle */
>         { KE_IGNORE, 0x155, { KEY_RESERVED } },
> +
> +       /* Rugged magnetic dock attach/detach events */
> +       { KE_IGNORE, 0x156, { KEY_RESERVED } },
> +       { KE_IGNORE, 0x157, { KEY_RESERVED } },
> +
> +       /* Rugged programmable (P1/P2/P3 keys) */
> +       { KE_KEY,    0x850, { KEY_PROG1 } },
> +       { KE_KEY,    0x851, { KEY_PROG2 } },
> +       { KE_KEY,    0x852, { KEY_PROG3 } },
> +
>  };
>
>  /*
> --
> 2.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
With Best Regards,
Andy Shevchenko
