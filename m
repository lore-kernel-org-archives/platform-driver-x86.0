From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Sat, 6 Nov 2010 08:42:52 +0100
Message-ID: <AANLkTikptRG4oTiS71Pe0LbAYxUTbisDq3XrzeDRO2=a@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
	<201010111010.06057.dmitry.torokhov@gmail.com>
	<AANLkTikveAxYe-=hg61XRB3sWUpaKBzbqEGX9eACFpiD@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:41948 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753490Ab0KFHmx convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 6 Nov 2010 03:42:53 -0400
Received: by ewy7 with SMTP id 7so2187603ewy.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Nov 2010 00:42:52 -0700 (PDT)
In-Reply-To: <AANLkTikveAxYe-=hg61XRB3sWUpaKBzbqEGX9eACFpiD@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Sat, Nov 6, 2010 at 4:02 AM, Chris Bagwell <chris@cnpbagwell.com> wr=
ote:
> On Mon, Oct 11, 2010 at 12:10 PM, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
>> On Sunday, October 10, 2010 11:26:22 pm Corentin Chary wrote:
>>> On Mon, Oct 11, 2010 at 3:48 AM, =C2=A0<chris@cnpbagwell.com> wrote=
:
>>> > From: Chris Bagwell <chris@cnpbagwell.com>
>>> >
>>> > Added 4 hotkeys using same keymap values as eeepc-latop.
>>> > These are mousepad toggle, resolution change, screen off,
>>> > and task manager. =C2=A0These were tested on 1005PE and are the
>>> > Fn-F3, F4, F7, and F9, respectively.
>>> >
>>> > Also, added a new hot key for power toggles (Fn-Space on 1005PE)
>>> > and is meant to drive cpufv interface from userspace.
>>> >
>>> > Finally, added several keys to be ignored that are being emitted
>>> > but do not mapped to any useful or documented hotkeys. =C2=A0This=
 is
>>> > purely cosmetic to prevent uknown key reports on console/log file=
s.
>>> > These keys are reported on 1005PE's.
>>>
>>> What are exactly these keys ? Since they are probably some obscure =
=46n+
>>> combo, and they are probably used on another model, I'm not sure we=
 should
>>> hide them.
>>>
>>> I'm still not happy with F13 for "disable touchpad" but I did the s=
ame
>>> for other laptops,
>>> and we don't have a key for that ATM.
>>
>> The most sensible way would be to add one then. We just need to deci=
de if
>> it should be a key or a switch.
>>
>
> Motivated by thread on linux-input "Touchpad toggle mess", I changed
> Fn-F3(toggle touchpad) from KEY_F13 to KEY_F22 =C2=A0With Gnome 2.32
> (Fedora 14), now magically my touchpad toggle works automagically.
>
> So I'd like to submit a patch to change both eeepc-laptop and
> eeepc-wmi to use KEY_F22 for toggle touchpad to get some immediate
> benifit. =C2=A0Any issues with this? =C2=A0Is F13 doing anything usef=
ul by
> default?
>
> I know in this thread and in other thread Dmitry mentioned we should
> make a KEY_TOUCHPAD_TOGGLE (or whatever name). =C2=A0I'm probably jus=
t
> smart enough to do that if preferred but don't think I'd be able to
> take it to the next level and get it translated to
> XF86XK_TouchpadToggle. =C2=A0Help appreciate in that area.
>
> Chris
>

Hi Chris,
Since 2.6.38 merge window should be in a long time, I think we have
the time to ad new keys.

Dimitry, what do you think of :

KEY_TOUCHPAD_TOGGLE 248
KEY_TOUCHPAD_ON            249
KEY_TOUCHPAD_OFF           250

Maybe we should keep these lower keycodes for other stuff, and use
some higher ones ?

Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
