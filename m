From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 16:42:57 +0200
Message-ID: <CAHp75Vd+mnXVniQO5uNAuGOZY2P6sc0LAb+KVXud_hmcdRhdnw@mail.gmail.com>
References: <1513676389-29624-1-git-send-email-sylee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:37063 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752307AbdLSOm7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 09:42:59 -0500
Received: by mail-qk0-f193.google.com with SMTP id p13so6699248qke.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 06:42:58 -0800 (PST)
In-Reply-To: <1513676389-29624-1-git-send-email-sylee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Dec 19, 2017 at 11:39 AM, Shih-Yuan Lee (FourDollars)
<sylee@canonical.com> wrote:
> The Dell Latitude 5495 has the mic mute key.
>

Pali, I assumed this one is settled and I go ahead to apply it to my
review and testing queue, thanks!

Feel free to comment / object / ACK (it will be not published for a
while anyway)

> Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index fb25b20..2c99274 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
>   * override them.
>   */
>  static const struct key_entry dell_wmi_keymap_type_0010[] = {
> +       /* Mic mute */
> +       { KE_KEY, 0x150, { KEY_MICMUTE } },
> +
>         /* Fn-lock */
>         { KE_IGNORE, 0x151, { KEY_RESERVED } },
>
> --
> 2.7.4
>



-- 
With Best Regards,
Andy Shevchenko
