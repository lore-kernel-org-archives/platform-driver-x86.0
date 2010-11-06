From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Fri, 5 Nov 2010 22:02:10 -0500
Message-ID: <AANLkTikveAxYe-=hg61XRB3sWUpaKBzbqEGX9eACFpiD@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
	<201010111010.06057.dmitry.torokhov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:40871 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752620Ab0KFDCL convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Nov 2010 23:02:11 -0400
Received: by ywc21 with SMTP id 21so2568514ywc.19
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Nov 2010 20:02:11 -0700 (PDT)
In-Reply-To: <201010111010.06057.dmitry.torokhov@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 11, 2010 at 12:10 PM, Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Sunday, October 10, 2010 11:26:22 pm Corentin Chary wrote:
>> On Mon, Oct 11, 2010 at 3:48 AM, =A0<chris@cnpbagwell.com> wrote:
>> > From: Chris Bagwell <chris@cnpbagwell.com>
>> >
>> > Added 4 hotkeys using same keymap values as eeepc-latop.
>> > These are mousepad toggle, resolution change, screen off,
>> > and task manager. =A0These were tested on 1005PE and are the
>> > Fn-F3, F4, F7, and F9, respectively.
>> >
>> > Also, added a new hot key for power toggles (Fn-Space on 1005PE)
>> > and is meant to drive cpufv interface from userspace.
>> >
>> > Finally, added several keys to be ignored that are being emitted
>> > but do not mapped to any useful or documented hotkeys. =A0This is
>> > purely cosmetic to prevent uknown key reports on console/log files=
=2E
>> > These keys are reported on 1005PE's.
>>
>> What are exactly these keys ? Since they are probably some obscure F=
n+
>> combo, and they are probably used on another model, I'm not sure we =
should
>> hide them.
>>
>> I'm still not happy with F13 for "disable touchpad" but I did the sa=
me
>> for other laptops,
>> and we don't have a key for that ATM.
>
> The most sensible way would be to add one then. We just need to decid=
e if
> it should be a key or a switch.
>

Motivated by thread on linux-input "Touchpad toggle mess", I changed
=46n-F3(toggle touchpad) from KEY_F13 to KEY_F22  With Gnome 2.32
(Fedora 14), now magically my touchpad toggle works automagically.

So I'd like to submit a patch to change both eeepc-laptop and
eeepc-wmi to use KEY_F22 for toggle touchpad to get some immediate
benifit.  Any issues with this?  Is F13 doing anything useful by
default?

I know in this thread and in other thread Dmitry mentioned we should
make a KEY_TOUCHPAD_TOGGLE (or whatever name).  I'm probably just
smart enough to do that if preferred but don't think I'd be able to
take it to the next level and get it translated to
XF86XK_TouchpadToggle.  Help appreciate in that area.

Chris
