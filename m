From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add a better description for
 "stealth mode"
Date: Sat, 27 May 2017 13:40:39 +0300
Message-ID: <CAHp75VeW5M5GJcgqjPK-n0oGeWi52nK+f+Q-MmEmA+CM7EV0xw@mail.gmail.com>
References: <a959f34a4a8586b9fd71550cf2920371daefacf0.1495862172.git.dvhart@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:36840 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755985AbdE0Kkk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 27 May 2017 06:40:40 -0400
In-Reply-To: <a959f34a4a8586b9fd71550cf2920371daefacf0.1495862172.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mario Limonciello <mario_limonciello@dell.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Andy Shevchenko <andy@infradead.org>

On Sat, May 27, 2017 at 8:16 AM, Darren Hart <dvhart@infradead.org> wrote:
> From: Andy Lutomirski <luto@kernel.org>
>
> This is based on Mario's explanation and observation of my laptop.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Suggested-by: "Pali Roh=C3=A1r" <pali.rohar@gmail.com>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> Cc: Mario Limonciello <mario_limonciello@dell.com>
> Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> Cc: Andy Shevchenko <andy@infradead.org>
> Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> ---
>  drivers/platform/x86/dell-wmi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-=
wmi.c
> index 24467b1..73aee0d 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -272,7 +272,12 @@ static const struct key_entry dell_wmi_keymap_type_0=
010[] __initconst =3D {
>         /* RGB keyboard backlight control */
>         { KE_IGNORE, 0x154, { KEY_RESERVED } },
>
> -       /* Stealth mode toggle */
> +       /*
> +        * Stealth mode toggle. This will "disable all lights and sounds"=
.
> +        * The action is performed by the BIOS and EC; the WMI event is j=
ust
> +        * a notification. On the XPS 13 9350, this is Fn+F7, and there's
> +        * a BIOS setting to enable and disable the hotkey.
> +        */
>         { KE_IGNORE, 0x155, { KEY_RESERVED } },
>
>         /* Rugged magnetic dock attach/detach events */
> --
> 2.9.4
>



--=20
With Best Regards,
Andy Shevchenko
