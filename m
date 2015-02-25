From: Azael Avalos <coproscefalo@gmail.com>
Subject: Re: toshiba_acpi.c
Date: Wed, 25 Feb 2015 14:05:03 -0700
Message-ID: <CAGdLNWG3QpDXb+4piAb6+JRwzV2SOf+TGi7MNUOXV__+pgeqWA@mail.gmail.com>
References: <1424291222.2455.3.camel@gmail.com>
	<CAGdLNWFy-awfrKEDZJ2paG3-R+xbVUYJ+JfPxpMExSdG_WrLAw@mail.gmail.com>
	<002b01d0513b$94f66380$bee32a80$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-we0-f176.google.com ([74.125.82.176]:44321 "EHLO
	mail-we0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753284AbbBYVFF (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Feb 2015 16:05:05 -0500
Received: by wesk11 with SMTP id k11so6153587wes.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2015 13:05:03 -0800 (PST)
In-Reply-To: <002b01d0513b$94f66380$bee32a80$@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Tom Mannerhagen <tom.mannerhagen@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Tom,

2015-02-25 13:42 GMT-07:00 Tom Mannerhagen <tom.mannerhagen@gmail.com>:
> Thanks!
>
> I think I need to rephrase a bit.
>
> How is the driver distinguishing which mapping to apply depending on which model it is running on?

Currently we use the "toshiba_alt_keymap_dmi" list, but only 3 models
have been added to it,
Satellite M840, Qosmio X75-A and TECRA A50-A.

I know that there are a lot more out there, but these are the ones
that the driver currently know of...

>
> Why I am asking:
> I'm since 26 years involved in technical support of Toshiba notebooks, a happy Linux-user also trying to help other Toshiba owners using Linux on Toshiba's.
> In that scope I can see that some features (Hotkeys), probably provided by the toshiba_acpi-driver, does not work on every platform.
> More in detail - mappings are not always correct.
> It lies more in my personal interest than my profession to see this improved.

Without propper documentation from Toshiba, we are left in the blind
and only rely on what we
(or other people, bug reports, etc.) know of, however, I made some
progress on identifying the
HCI call for the hotkey event type (patch comming soon), needed for
some laptops supporting
the "Special Functions", which happens to be those affected by the new
keymap layout.

If you are a Toshiba laptop owner and/or have access to more hardware
than I do (currently
2 laptops, Qosmio X505 and Qosmio X75), I could use some testing ;-)

>
> BR Tom
>

Cheers
Azael


-- 
-- El mundo apesta y vosotros apestais tambien --
