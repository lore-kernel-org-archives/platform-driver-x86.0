From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH] asus-wmi: Ambient sensor toggle key
Date: Sun, 19 Jun 2016 15:52:34 +0200
Message-ID: <CAHR064iF0EpD08cjQ6LoKZE0i5B3Mfed-66k7qE-v0OfxQ74oQ@mail.gmail.com>
References: <9711814.jjoeah4X4e@nl-ubook>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:34344 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750861AbcFSNwg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 19 Jun 2016 09:52:36 -0400
Received: by mail-wm0-f68.google.com with SMTP id 187so8170110wmz.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Jun 2016 06:52:36 -0700 (PDT)
In-Reply-To: <9711814.jjoeah4X4e@nl-ubook>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: nickleiten@gmail.com
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Sun, Jun 19, 2016 at 1:59 PM, Nick Leiten <nickleiten@gmail.com> wrote:
> Hi,
> here is little patch for Fn+A key assignment in asus-nb-wmi.c file so userspace can control ALS (ambient light sensor) on/off state.
>
> As I can see mentions in Internet Asus makes 0x7a code in all their laptops to be assigned to Toggle ALS.
> Tested on Asus U38N.
>
>
> Signed-off-by: Nick Leiten <nickleiten@gmail.com>
>
> diff -Npru a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> --- linux-4.6-orig/drivers/platform/x86/asus-nb-wmi.c   2016-05-16 01:43:13.000000000 +0300
> +++ linux-4.6-diff/drivers/platform/x86/asus-nb-wmi.c   2016-06-06 07:00:27.000000000 +0300
> @@ -356,6 +356,7 @@ static const struct key_entry asus_nb_wm
>         { KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
>         { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>         { KE_IGNORE, 0x6E, },  /* Low Battery notification */
> +       { KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle, Fn+A*/
>         { KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
>         { KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
>         { KE_KEY, 0x82, { KEY_CAMERA } },
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-driver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

Reviewed-By: Corentin Chary <corentin.chary@gmail.com>

-- 
Corentin Chary
http://xf.iksaif.net
