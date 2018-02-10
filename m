From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: Some buttons on the Fujitsu u7[25]7 laptops are not working
Date: Sat, 10 Feb 2018 22:22:34 +0100
Message-ID: <20180210212234.GC2070@larwa.localdomain>
References: <69f33335-962b-f3be-da8e-2eeff1ae2a49@fbihome.de>
 <20180119234547.GB24590@marvin.atrad.com.au>
 <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:40814 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752255AbeBJVWi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 10 Feb 2018 16:22:38 -0500
Received: by mail-lf0-f46.google.com with SMTP id i24so12605021lfc.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 10 Feb 2018 13:22:37 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <84b872ec-ba48-6423-cb7b-48f2c3ef30d2@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

> -event6   KEYBOARD_KEY      +6.84s      KEY_MICMUTE (248) pressed
>  event6   KEYBOARD_KEY      +6.84s      KEY_MICMUTE (248) released
> -event2   KEYBOARD_KEY      +8.05s      KEY_MUTE (113) pressed
>  event2   KEYBOARD_KEY      +8.22s      KEY_MUTE (113) released
>  event2   KEYBOARD_KEY      +8.94s      KEY_VOLUMEDOWN (114) pressed
>  event2   KEYBOARD_KEY      +9.09s      KEY_VOLUMEDOWN (114) released
>  event2   KEYBOARD_KEY      +9.91s      KEY_VOLUMEUP (115) pressed
>  event2   KEYBOARD_KEY     +10.06s      KEY_VOLUMEUP (115) released
> -event6   KEYBOARD_KEY     +10.91s      KEY_RFKILL (247) pressed
>  event6   KEYBOARD_KEY     +10.91s      KEY_RFKILL (247) released
>  event6   KEYBOARD_KEY     +12.97s      KEY_TOUCHPAD_TOGGLE (530) pressed
>  event6   KEYBOARD_KEY     +12.97s      KEY_TOUCHPAD_TOGGLE (530) released
> -event3   KEYBOARD_KEY     +14.04s      KEY_BRIGHTNESSDOWN (224) pressed
>  event3   KEYBOARD_KEY     +14.04s      KEY_BRIGHTNESSDOWN (224) released
>  event3   KEYBOARD_KEY     +17.41s      KEY_BRIGHTNESSUP (225) pressed
>  event3   KEYBOARD_KEY     +17.41s      KEY_BRIGHTNESSUP (225) released
> -event6   KEYBOARD_KEY     +18.31s      KEY_PROG4 (203) pressed
> -event2   KEYBOARD_KEY     +21.58s      KEY_LEFTMETA (125) pressed
>  event2   KEYBOARD_KEY     +21.61s      *** (-1) pressed
>  event2   KEYBOARD_KEY     +21.64s      *** (-1) released
>  event2   KEYBOARD_KEY     +21.68s      KEY_LEFTMETA (125) released
> 
> These are Fn+F1 - Fn+F10
> 
> The last event2 is the "Switch output" button.

These are usually "hardcoded" to emit Meta+P.

> The main remaining problem is the missing release event for the ECO / KEY_PROG4.
> Like all buttons the ACPI events are generated on release.
> When releasing the button it, this results in:
> 
> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x4, 0x0, 0x0) returned 0x320
> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: Flags state     0x00000320

These two log lines seem unrelated to ECO as the FUNC call above seems
to be performed by radio_led_get().  Did you include these lines on
purpose?  If so, I am missing it.

> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x40000413
> [Mo Jan 22 08:37:09 2018] input input21: Push scancode into ringbuffer [0x413]
> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1002 (args 0x1, 0x0, 0x0) returned 0x0
> [Mo Jan 22 08:37:09 2018] ACPI: \_SB_.FEXT: fujitsu_laptop: FUNC 0x1000 (args 0x1, 0x0, 0x0) returned 0x0

Sigh, so it looks like Fujitsu reused the keycode, but changed the way
it is supposed to be handled.  What a great idea!

> Then there is the "radios" attribute, which is currently inverted for me. It contains "killed", if the radio is on and "on", if it's killed.
 
Please post the output of acpidump collected on one of these new
laptops.  It may help fixing this.

-- 
Best regards,
Michał Kępień
