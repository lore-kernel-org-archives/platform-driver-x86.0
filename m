From: "Tom Mannerhagen" <tom.mannerhagen@gmail.com>
Subject: RE: toshiba_acpi.c
Date: Thu, 26 Feb 2015 08:42:33 +0100
Message-ID: <002f01d05197$c95b4da0$5c11e8e0$@gmail.com>
References: <1424291222.2455.3.camel@gmail.com>	<CAGdLNWFy-awfrKEDZJ2paG3-R+xbVUYJ+JfPxpMExSdG_WrLAw@mail.gmail.com>	<002b01d0513b$94f66380$bee32a80$@gmail.com> <CAGdLNWG3QpDXb+4piAb6+JRwzV2SOf+TGi7MNUOXV__+pgeqWA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:64984 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751640AbbBZHmh convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 Feb 2015 02:42:37 -0500
Received: by mail-wi0-f172.google.com with SMTP id l15so38758935wiw.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Feb 2015 23:42:36 -0800 (PST)
In-Reply-To: <CAGdLNWG3QpDXb+4piAb6+JRwzV2SOf+TGi7MNUOXV__+pgeqWA@mail.gmail.com>
Content-Language: sv
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: 'Azael Avalos' <coproscefalo@gmail.com>
Cc: 'Darren Hart' <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

Hi Azael

I see, but that concerns the alternative map, correct?
How does the driver tell if it should use the "standard" or alternative mapping?

I think I can see some checks are made in the beginning of the driver, it checks for certain ACPI ID's (TOS6200, TOS6207, TOS6028, TOS1900).
Are they used to identify the system as a Toshiba or are they used to distinguish which Toshiba-platform it runs on?
Perhaps both?

If used to tell which Toshiba it runs on, is this somehow used to select mapping of the function-keys?

BTW - I have access to a bunch of units and will happily test as time allow.
You may need to hand-hold me through the building of the driver and using it in a distro.

BR Tom

-----Original Message-----
From: Azael Avalos [mailto:coproscefalo@gmail.com] 
Sent: den 25 februari 2015 22:05
To: Tom Mannerhagen
Cc: Darren Hart; platform-driver-x86@vger.kernel.org
Subject: Re: toshiba_acpi.c

Hi Tom,

2015-02-25 13:42 GMT-07:00 Tom Mannerhagen <tom.mannerhagen@gmail.com>:
> Thanks!
>
> I think I need to rephrase a bit.
>
> How is the driver distinguishing which mapping to apply depending on which model it is running on?

Currently we use the "toshiba_alt_keymap_dmi" list, but only 3 models have been added to it, Satellite M840, Qosmio X75-A and TECRA A50-A.

I know that there are a lot more out there, but these are the ones that the driver currently know of...

>
> Why I am asking:
> I'm since 26 years involved in technical support of Toshiba notebooks, a happy Linux-user also trying to help other Toshiba owners using Linux on Toshiba's.
> In that scope I can see that some features (Hotkeys), probably provided by the toshiba_acpi-driver, does not work on every platform.
> More in detail - mappings are not always correct.
> It lies more in my personal interest than my profession to see this improved.

Without propper documentation from Toshiba, we are left in the blind and only rely on what we (or other people, bug reports, etc.) know of, however, I made some progress on identifying the HCI call for the hotkey event type (patch comming soon), needed for some laptops supporting the "Special Functions", which happens to be those affected by the new keymap layout.

If you are a Toshiba laptop owner and/or have access to more hardware than I do (currently
2 laptops, Qosmio X505 and Qosmio X75), I could use some testing ;-)

>
> BR Tom
>

Cheers
Azael


--
-- El mundo apesta y vosotros apestais tambien --
