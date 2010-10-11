From: Chris Bagwell <chris@cnpbagwell.com>
Subject: Re: [PATCH 1/2] eeepc-wmi: add additional hotkeys
Date: Mon, 11 Oct 2010 08:25:08 -0500
Message-ID: <AANLkTim4gfXHk-JC_ODnyjdk8tLeK=RuqgsW-dhqkzwV@mail.gmail.com>
References: <1286761702-4304-1-git-send-email-chris@cnpbagwell.com>
	<AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:47277 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754312Ab0JKNZJ convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Oct 2010 09:25:09 -0400
Received: by ywi6 with SMTP id 6so601241ywi.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2010 06:25:09 -0700 (PDT)
In-Reply-To: <AANLkTin3J3oOaYD8G=YSrBr0AKzw7mY7v0BQssw5z2Z6@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, yong.y.wang@intel.com

On Mon, Oct 11, 2010 at 1:26 AM, Corentin Chary
<corentin.chary@gmail.com> wrote:
> On Mon, Oct 11, 2010 at 3:48 AM, =A0<chris@cnpbagwell.com> wrote:
>> From: Chris Bagwell <chris@cnpbagwell.com>
>>
>> Added 4 hotkeys using same keymap values as eeepc-latop.
>> These are mousepad toggle, resolution change, screen off,
>> and task manager. =A0These were tested on 1005PE and are the
>> Fn-F3, F4, F7, and F9, respectively.
>>
>> Also, added a new hot key for power toggles (Fn-Space on 1005PE)
>> and is meant to drive cpufv interface from userspace.
>>
>> Finally, added several keys to be ignored that are being emitted
>> but do not mapped to any useful or documented hotkeys. =A0This is
>> purely cosmetic to prevent uknown key reports on console/log files.
>> These keys are reported on 1005PE's.
>
> What are exactly these keys ? Since they are probably some obscure Fn=
+ combo,
> and they are probably used on another model, I'm not sure we should h=
ide them.

They are Fn-1, 2, s, d, f, and e.  I can't really guess what 1 and 2
are for but I assume sdfe are arrow keys or something similar on
larger models?

I debated on if to add ignores since surely some model uses them but I
settled on someone else can modify current file instead of adding new
lines once they are driven to add their laptop specific keys.

>
> I'm still not happy with F13 for "disable touchpad" but I did the sam=
e
> for other laptops,
> and we don't have a key for that ATM.

And user land doesn't seem very supported of this concept at the
moment as well.  I've tried some xinput stuff on touchpad tied to F13
but no luck so far.  It does have a property to disable touchpad but
I've not had time to fully debug yet.  I'm trying to stay away fo
synclient since thats end-of-lifed.

>
> Otherwise, looks good.

Thanks.  BTW, please let me know specifically if you'd like the ignore
keys removed and I'll re-send a patch.  I don't have enough info to be
able to map them though.

Chris
