From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH v2] dell-wmi: Improve unknown hotkey handling
Date: Fri, 20 Nov 2015 17:30:13 -0800
Message-ID: <CALCETrW0A3rH-BAqTWUAOGhsERR+R5M4d9uCEcjNtJQZLW7zKA@mail.gmail.com>
References: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ob0-f173.google.com ([209.85.214.173]:34790 "EHLO
	mail-ob0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706AbbKUBad (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Nov 2015 20:30:33 -0500
Received: by obbbj7 with SMTP id bj7so99858753obb.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Nov 2015 17:30:32 -0800 (PST)
In-Reply-To: <a19a018252f8352a5d22934c98fba2954e9b1c6c.1448069061.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Fri, Nov 20, 2015 at 5:27 PM, Andy Lutomirski <luto@kernel.org> wrote:
> If DMI lists a hotkey that we don't recognize, log and ignore it
> instead of trying to map it to keycode 0.  I haven't seen this happen,
> but it will help maintain the key map in the future and it will help
> avoid sending bogus events.
>
> This also improves the message that we log when we get an unknown key
> event.
>
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>
> Changes from v1:
>  - Use KEY_RESERVED instead of zero and document why that's okay
>  - Fix scancode vs keycode confusion in the log message (whoops!)
>  - Switch from hardcoded 256 to ARRAY_SIZE
>
>  drivers/platform/x86/dell-wmi.c | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index d2daf5417cd7..cb96ef03fa79 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c


> +               /* Uninitialized entries are 0 aka KEY_RESERVED. */
> +               BUILD_BUG_ON(KEY_RESERVED != 0);
> +               u16 keycode = (bios_entry->keycode <
> +                              ARRAY_SIZE(bios_to_linux_keycode)) ?
> +                       bios_to_linux_keycode[bios_entry->keycode] :
> +                       KEY_RESERVED;

Oops.  BUILD_BUG_ON should be below u16 keycode = ... to avoid a
warning.  Feel free to fix it up.  I can also send a v3.

--Andy
