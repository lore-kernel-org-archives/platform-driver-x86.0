From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Mon, 11 Oct 2010 15:57:19 +0200
Message-ID: <AANLkTikW+-JAmF1LsCCbKb4c+ZE6uJAZ9ngfq8fLsSvv@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
	<AANLkTim4gfXHk-JC_ODnyjdk8tLeK=RuqgsW-dhqkzwV@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:64216 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754335Ab0JKN5V convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 09:57:21 -0400
Received: by ewy20 with SMTP id 20so582379ewy.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2010 06:57:20 -0700 (PDT)
In-Reply-To: <AANLkTim4gfXHk-JC_ODnyjdk8tLeK=RuqgsW-dhqkzwV@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Chris Bagwell <chris@cnpbagwell.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 11, 2010 at 3:25 PM, Chris Bagwell <chris@cnpbagwell.com> w=
rote:
> On Mon, Oct 11, 2010 at 1:26 AM, Corentin Chary
> <corentin.chary@gmail.com> wrote:
>> On Mon, Oct 11, 2010 at 3:48 AM, =C2=A0<chris@cnpbagwell.com> wrote:
>>> From: Chris Bagwell <chris@cnpbagwell.com>
>>>
>>> Added 4 hotkeys using same keymap values as eeepc-latop.
>>> These are mousepad toggle, resolution change, screen off,
>>> and task manager. =C2=A0These were tested on 1005PE and are the
>>> Fn-F3, F4, F7, and F9, respectively.
>>>
>>> Also, added a new hot key for power toggles (Fn-Space on 1005PE)
>>> and is meant to drive cpufv interface from userspace.
>>>
>>> Finally, added several keys to be ignored that are being emitted
>>> but do not mapped to any useful or documented hotkeys. =C2=A0This i=
s
>>> purely cosmetic to prevent uknown key reports on console/log files.
>>> These keys are reported on 1005PE's.
>>
>> What are exactly these keys ? Since they are probably some obscure F=
n+ combo,
>> and they are probably used on another model, I'm not sure we should =
hide them.
>
> They are Fn-1, 2, s, d, f, and e. =C2=A0I can't really guess what 1 a=
nd 2
> are for but I assume sdfe are arrow keys or something similar on
> larger models?
>
> I debated on if to add ignores since surely some model uses them but =
I
> settled on someone else can modify current file instead of adding new
> lines once they are driven to add their laptop specific keys.
>
>>
>> I'm still not happy with F13 for "disable touchpad" but I did the sa=
me
>> for other laptops,
>> and we don't have a key for that ATM.
>
> And user land doesn't seem very supported of this concept at the
> moment as well. =C2=A0I've tried some xinput stuff on touchpad tied t=
o F13
> but no luck so far. =C2=A0It does have a property to disable touchpad=
 but
> I've not had time to fully debug yet. =C2=A0I'm trying to stay away f=
o
> synclient since thats end-of-lifed.
>
>>
>> Otherwise, looks good.
>
> Thanks. =C2=A0BTW, please let me know specifically if you'd like the =
ignore
> keys removed and I'll re-send a patch. =C2=A0I don't have enough info=
 to be
> able to map them though.

I'd remove them, and wait for someone to complain that he has garbage
in dmesg or unmapped keys.

--=20
Corentin Chary
http://xf.iksaif.net
