From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/2] eeepc-wmi: Add support for T101MT Home/Express Gate key
Date: Mon, 28 Mar 2011 14:14:33 +0000
Message-ID: <AANLkTi=U2Qkqv7FKfe18f0a=8Xg0QwRX_cxFj-j7ZPC=__49490.0809404955$1301321723$gmane$org@mail.gmail.com>
References: <AANLkTimF2UR8BVQW-3YJaGFEz39q8ydESAiMOjmdM1X7@mail.gmail.com>
	<20110325135311.GA14328@thinkpad-t410>
	<AANLkTin3MDYdL6x1Qs8Q9oMMgDMfsoO2GjWMJO_65GAR@mail.gmail.com>
	<20110325161405.GC5099@core.coreip.homeip.net>
	<20110325162850.GD14328@thinkpad-t410>
	<20110325170333.GD5099@core.coreip.homeip.net>
	<20110325185824.GE14328@thinkpad-t410>
	<20110327171304.GD30244@core.coreip.homeip.net>
	<AANLkTikBnAdXHR4iqzq9Zd6D-OYe4yp-zELPh6iLr6sj@mail.gmail.com>
	<20110327191116.GB31692@core.coreip.homeip.net>
	<20110328134606.GA16374@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:34936 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753981Ab1C1OOe convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2011 10:14:34 -0400
In-Reply-To: <20110328134606.GA16374@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Chris Bagwell <chris@cnpbagwell.com>, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.s
Cc: Seth Forshee <seth.forshee@canonical.com>

On Mon, Mar 28, 2011 at 1:46 PM, Seth Forshee
<seth.forshee@canonical.com> wrote:
> On Sun, Mar 27, 2011 at 12:11:16PM -0700, Dmitry Torokhov wrote:
>> > If we do set up auto-repeat and increase REP_DELAY, I'm guessing t=
his
>> > would enable auto-repeat for all other keys defined in driver? =C2=
=A0That
>> > needs to have some thought on if could have negative impact (any o=
ther
>> > keys not using auto-release?).
>>
>> Right. Right now there are 4 autoreprat options (in general):
>>
>> - hardware autorepeat (if hardware supports it);
>> - input core software autorepeat (one delay and rate per input devic=
e);
>> - driver-implemented software autorepeat - in cases when different
>> =C2=A0 repeat rate is needed;
>> - userspace autorepeat (like X does nowadays);
>>
>> Well, 4th option is not mutually exclusive with the other 3...
>
> Currently all the other keys are using autorelease, so the autorepeat
> setting shouldn't be affecting them at all. So the concern is whether
> enabling autorepeat could become a problem the next time some oddball
> key shows up on a machine.

As far as I know, the only key that could be like that (not yet
mapped, but I've seen it somewhere) is a "Camera Autofocus Key". For
this key we don't really care about "repeating", we just need to send
"press" and "release" events correctly, and userspace will keep
adjusting the autofocus while the key is pressed.

> Corentin, you were concerned about the loss of information to userspa=
ce,
> but it seems the only way to maintain the hardware events is to drop =
the
> use of sparse-keymap altogether. Do you have an opinion on how to
> proceed?

I really don't think dropping sparse-keymap for a single key on a
single model is a good idea.

On my side I'd have used another keycode for 0xea events, and reported
press and release events as they come, since it's more a "two-in-one"
key than a key with hardware autorepeat.

But since Dmitry and Chris seems to prefer the autorepeat approach
with a single key code, if it works then it's ok, we just need to set
REP_DELAY, report press and release events, and drop 0xea events.

> I'm leaning towards using the input core autorepeat, since it seems t=
o
> get the closest to typical key behavior.

--=20
Corentin Chary
http://xf.iksaif.net
