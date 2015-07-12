From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH][v2] asus-rbtn: new driver for asus radio button for
 Windows 8
Date: Sun, 12 Jul 2015 15:02:30 +0200
Message-ID: <CAHR064iMUsLNqX=B-8R3GpWe3aNznSOQrZMyUTb2YG=Zhv2-8Q@mail.gmail.com>
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
	<CAJ=jquYMukmDoGE0Y=e8MBGEGmBZ2NjZdkZ=G3YVdTUM7p=fQQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:34883 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751352AbbGLNCc convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Jul 2015 09:02:32 -0400
In-Reply-To: <CAJ=jquYMukmDoGE0Y=e8MBGEGmBZ2NjZdkZ=G3YVdTUM7p=fQQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: Darren Hart <dvhart@infradead.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, acpi4asus-user <acpi4asus-user@lists.sourceforge.net>, LKML <linux-kernel@vger.kernel.org>

On Fri, Jul 10, 2015 at 3:52 AM, Alex Hung <alex.hung@canonical.com> wr=
ote:
> On Fri, Jul 10, 2015 at 4:52 AM, Darren Hart <dvhart@infradead.org> w=
rote:
>> On Tue, Jul 07, 2015 at 04:25:18PM +0200, Pali Roh=C3=A1r wrote:
>>> On Monday 06 July 2015 15:43:28 Darren Hart wrote:
>>> > On Mon, Jul 06, 2015 at 09:35:40AM +0800, Alex Hung wrote:
>>> > > ATK4001 is an ACPI device for wireless hotkey, similar to how D=
ell and
>>> > > HP are doing it.  It is just ASUS who decides LED should be con=
trolled
>>> > > by software unlike HP whose LED is driven by hardware pins on m=
ini
>>> > > card.
>>> >
>>> > Alex, please refrain from top posting on Linux kernel mailing lis=
ts, it breaks
>>> > the established practice the readers are setup for.
>>> >
>>> > Regarding the ATK4001 device, it did sound like it did more than =
control the
>>> > radios and the associcated LED. If that is all it does, then asus=
-rbtn is fine.
>>> > If it does something beyond that, we need understand what that is=
, as a more
>>> > platform-centric name would be more appropriate.
>>> >
>>> > Thanks,
>>>
>>> Yes, I understand too that ATK4001 device has more functions as one=
 for
>>> LED control. And in this case it is not good to use name from one
>>> specific functionality.
>>>
>>> And about name:
>>>
>>> I chose name rbtn for dell driver because ACPI device in DSDT table=
 is
>>> named RBTN and acpi id is DELRBTN.
>>>
>>> I think that acpi-rbtn.c (radio button) is not ideal name for drive=
r
>>> which at SW level controls LED device associated with wireless devi=
ces.
>>>
>>> I would rather follow acpi device name, but in this case ATK4001 is=
 even
>>> worse name which does not say anything...
>>>
>>> Maybe better name could be asus-wireless? Still I do not have any g=
ood
>>> name, so choose something...
>>
>> I suggested rbtn to try and start showing some kind of consistency i=
n the
>> directory - however, it's no better than many of the other existing =
options,
>> including -rfkill -wireless -laptop, etc.
>>
>> Speaking of -laptop, the asus-laptop driver supports ATK0100 and ATK=
0101. This
>> ATK4001 device appears to perform the same type of features. The que=
stion is
>> whether or not it can be reasonably incorporated into the existing a=
sus-laptop
>> driver or not.
>>
>> (I intended to do that review myself, but I haven't found the time i=
n 48 hours,
>> so I'm just going to send this out and ask that Alex have a look and=
 provide his
>> thoughts on asus-laptop)
>>
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>
> Certainly, I should have time to look into asus-laptop next week.
>
>
> --
> Cheers,
> Alex Hung

asus-laptop has some assumption regarding the methosd provided by the
ACPI device, but you may be able to integrate with it.
Hard to know if it make sense though, really depend how similar these
interfaces are.

--=20
Corentin Chary
http://xf.iksaif.net
