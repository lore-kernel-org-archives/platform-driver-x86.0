From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-wmi: Add an event created by Dell
 Latitude 5495
Date: Tue, 19 Dec 2017 10:06:59 +0100
Message-ID: <20171219090659.oosacrjr5igcvgiz@pali>
References: <1513654714-32175-1-git-send-email-sylee@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:45394 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938776AbdLSJHB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Dec 2017 04:07:01 -0500
Received: by mail-wm0-f65.google.com with SMTP id 9so2086877wme.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Dec 2017 01:07:01 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1513654714-32175-1-git-send-email-sylee@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Shih-Yuan Lee (FourDollars)" <sylee@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tuesday 19 December 2017 11:38:34 Shih-Yuan Lee (FourDollars) wrote:
> The Dell Latitude 5495 has the mic mute key.
> 
> Signed-off-by: Shih-Yuan Lee (FourDollars) <sylee@canonical.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index fb25b20..d40f803 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -261,6 +261,9 @@ static const u16 bios_to_linux_keycode[256] = {
>   * override them.
>   */
>  static const struct key_entry dell_wmi_keymap_type_0010[] = {
> +	/* Mic mute */
> +	{ KE_KEY, 0x150, { KEY_F20 } },

Why F20 for mic mute? We have KEY_MICMUTE.

> +
>  	/* Fn-lock */
>  	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
>  

-- 
Pali Rohár
pali.rohar@gmail.com
