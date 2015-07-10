From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Fri, 10 Jul 2015 09:52:29 +0800
Message-ID: <CAJ=jquYMukmDoGE0Y=e8MBGEGmBZ2NjZdkZ=G3YVdTUM7p=fQQ@mail.gmail.com>
References: <20150629122953.GF16230@pali>
	<CAJ=jquZr8tPOcL-vr3Q_pYaQZf73-BPvBAoaVjoMALj_sF4rfw@mail.gmail.com>
	<20150630085814.GE27720@pali>
	<CAJ=jquYNQ=R0K+OR538_Tm-E0sNbL6VcAvN_zc99-Z5X1WmCmA@mail.gmail.com>
	<20150701114849.GE17577@pali>
	<CAJ=jquaDCaGv8PXuib7CFZAWUCTCZhkju0RZn-6v4MRCJhfgkA@mail.gmail.com>
	<20150703072523.GB1841@pali>
	<CAJ=jquYo018MiO8V+jjkr778vuuXjoQ9AWrKW=z5dpRuw1DwtQ@mail.gmail.com>
	<20150706224328.GB111639@vmdeb7>
	<20150707142518.GI12087@pali>
	<20150709205203.GD111846@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:36669 "EHLO
	mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751639AbbGJBwa convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 9 Jul 2015 21:52:30 -0400
Received: by qkdv3 with SMTP id v3so3058752qkd.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2015 18:52:29 -0700 (PDT)
In-Reply-To: <20150709205203.GD111846@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user@lists.sourceforge.net, linux-kernel@vger.kernel.org

On Fri, Jul 10, 2015 at 4:52 AM, Darren Hart <dvhart@infradead.org> wro=
te:
> On Tue, Jul 07, 2015 at 04:25:18PM +0200, Pali Roh=C3=A1r wrote:
>> On Monday 06 July 2015 15:43:28 Darren Hart wrote:
>> > On Mon, Jul 06, 2015 at 09:35:40AM +0800, Alex Hung wrote:
>> > > ATK4001 is an ACPI device for wireless hotkey, similar to how De=
ll and
>> > > HP are doing it.  It is just ASUS who decides LED should be cont=
rolled
>> > > by software unlike HP whose LED is driven by hardware pins on mi=
ni
>> > > card.
>> >
>> > Alex, please refrain from top posting on Linux kernel mailing list=
s, it breaks
>> > the established practice the readers are setup for.
>> >
>> > Regarding the ATK4001 device, it did sound like it did more than c=
ontrol the
>> > radios and the associcated LED. If that is all it does, then asus-=
rbtn is fine.
>> > If it does something beyond that, we need understand what that is,=
 as a more
>> > platform-centric name would be more appropriate.
>> >
>> > Thanks,
>>
>> Yes, I understand too that ATK4001 device has more functions as one =
for
>> LED control. And in this case it is not good to use name from one
>> specific functionality.
>>
>> And about name:
>>
>> I chose name rbtn for dell driver because ACPI device in DSDT table =
is
>> named RBTN and acpi id is DELRBTN.
>>
>> I think that acpi-rbtn.c (radio button) is not ideal name for driver
>> which at SW level controls LED device associated with wireless devic=
es.
>>
>> I would rather follow acpi device name, but in this case ATK4001 is =
even
>> worse name which does not say anything...
>>
>> Maybe better name could be asus-wireless? Still I do not have any go=
od
>> name, so choose something...
>
> I suggested rbtn to try and start showing some kind of consistency in=
 the
> directory - however, it's no better than many of the other existing o=
ptions,
> including -rfkill -wireless -laptop, etc.
>
> Speaking of -laptop, the asus-laptop driver supports ATK0100 and ATK0=
101. This
> ATK4001 device appears to perform the same type of features. The ques=
tion is
> whether or not it can be reasonably incorporated into the existing as=
us-laptop
> driver or not.
>
> (I intended to do that review myself, but I haven't found the time in=
 48 hours,
> so I'm just going to send this out and ask that Alex have a look and =
provide his
> thoughts on asus-laptop)
>
> --
> Darren Hart
> Intel Open Source Technology Center

Certainly, I should have time to look into asus-laptop next week.


--=20
Cheers,
Alex Hung
