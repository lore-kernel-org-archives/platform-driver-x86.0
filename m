From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Mon, 6 Jul 2015 09:35:40 +0800
Message-ID: <CAJ=jquYo018MiO8V+jjkr778vuuXjoQ9AWrKW=z5dpRuw1DwtQ@mail.gmail.com>
References: <1435114671-24380-1-git-send-email-alex.hung@canonical.com>
	<20150626145621.GU2890@pali>
	<CAJ=jqub8adCQBWPsmg+Wov0G4WqZbhsjxttWq6CA8Uddqmj4Cw@mail.gmail.com>
	<20150629122953.GF16230@pali>
	<CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
	<20150630085814.GE27720@pali>
	<CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
	<20150701114849.GE17577@pali>
	<CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
	<20150703072523.GB1841@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:35943 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753115AbbGFBfl convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jul 2015 21:35:41 -0400
Received: by qgeg89 with SMTP id g89so63223043qge.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jul 2015 18:35:41 -0700 (PDT)
In-Reply-To: <20150703072523.GB1841@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

ATK4001 is an ACPI device for wireless hotkey, similar to how Dell and
HP are doing it.  It is just ASUS who decides LED should be controlled
by software unlike HP whose LED is driven by hardware pins on mini
card.

On Fri, Jul 3, 2015 at 3:25 PM, Pali Roh=C3=A1r <pali.rohar@gmail.com> =
wrote:
> On Thursday 02 July 2015 15:10:39 Alex Hung wrote:
>> Thanks for the support.  I will create v3 based with LED triggers.
>>
>> Just for information.  ASUS's wording is as below:
>>
>> Fn+F2 can be used to turn on or off all radio capabilities in the
>> device (as known as airplane mode switch).  I don't have any
>> preferences on the name.  We may use the term airplane-mode do if
>> asus-rbtn is not preferred.  Let me know if there are any suggestion=
s.
>>
>
> This is OK, but I though that ACPI ATK4001 device is some
> multifunctional device, which is doing more then LED control... (At
> least I understand it from your comments). So in this case I would no=
t
> call driver led/radio related. Right?
>
>>
>> On Wed, Jul 1, 2015 at 7:48 PM, Pali Roh=C3=A1r <pali.rohar@gmail.co=
m> wrote:
>> > On Wednesday 01 July 2015 00:09:41 Alex Hung wrote:
>> >> ATK4001 is an independent ACPI device, and Method(HSWC) is its me=
thod
>> >> to control LED (actually it has other functions but only LED is n=
eeded
>> >> so far).
>> >
>> > If this driver is for supporting ACPI ATK4001 device (which has co=
uple
>> > of methods, not only LED) it is really good idea to name it asus-r=
btn?
>> >
>> > Darren, you as maintainer of platform drivers, what do you think? =
I
>> > believe in future this driver will be extended to support more fun=
ctions
>> > and so name asus-rbtn will be confusing.
>> >
>> > --
>> > Pali Roh=C3=A1r
>> > pali.rohar@gmail.com
>>
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
