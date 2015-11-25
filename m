From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Wed, 25 Nov 2015 10:31:49 +0100
Message-ID: <56558005.4090709@gmail.com>
References: <5650BE8E.2080506@gmail.com> <201511212008.46761@pali>
 <5650D693.6050808@gmail.com> <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali> <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com> <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com> <565530D4.3080809@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37049 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750954AbbKYJbw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Nov 2015 04:31:52 -0500
Received: by wmww144 with SMTP id w144so60979998wmw.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2015 01:31:50 -0800 (PST)
In-Reply-To: <565530D4.3080809@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Borzenkov <arvidjaar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

On 25/11/2015 04:53, Andrei Borzenkov wrote:
> 24.11.2015 01:33, Gabriele Mazzotta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>> I'll try to write a summary that should explain why dell-rbtn exists
>> and what are the current problems.
>>
>> There are several mechanisms to control radio devices, so let's
>> consider different categories/cases.
>>
>> A) The function keys of new Dell laptops do nothing on their own, bu=
t
>> when pressed, the BIOS sends a notification to an ACPI device
>> (DELLABCE/DELRBTN). One of the tasks of dell-rbtn is to catch those
>> notifications and send an input event to userspace. Without dell-rbt=
n,
>> the function keys of these laptops wouldn't work.
>>
>> B) There are then some other laptops which support two different
>> mechanisms to control radio devices: the one here above (A) and
>> "the old one", i.e. the BIOS does everything. (These are probably
>> laptops that were released during the transition Windows 7 -> 8). Th=
ese
>> laptops can switch between the two modes through an ACPI method call=
=2E
>> What we do with dell-rbtn is to make them behave like (A) since we
>> can't tell apart laptops of (A) and (B) and we need to know how each
>> laptop behaves. The function key of these laptops work perfectly
>> without dell-rbtn.
>>
>> C) There are then some other laptops for which it's required to use =
an
>> i8042 filter to detect keypresses and do some SMI calls to toggle
>> the state of radio devices. This filter is created by dell-laptop an=
d
>> has been there since a long time.
>>
>> D) This category is something in between (C) and (A) and exists only
>> because of dell-rbtn. Some of the laptops of category (C) also have =
a
>> DELLABCE/DELLRBTN device.
>
> I'm pretty confident that my Dell Latitude falls into this category.
> What happens here apparently is
>
> - user presses hotkey on keyboard
> - hotkey is handled by BIOS to toggle radio
> - BIOS sends notification to OS via ACPI that something changed and O=
S
> must query current radio state

So is the i8042 filter doing anything? What happens if you remove your
laptop from the whitelist of dell-laptop (see dell_setup_rfkill())?
Is dell-rbtn handling your function key presses correctly in this case?

> Adding debug print do dell-laptop and dell-rbtn
>
> [43345.599909] dell-laptop: got keyboard event
> [43345.704558] dell-rbtn DELLABCE:00: Received event (0x80)
>
> So ACPI event comes rather later after key press.

According to some Windows documentation, the ACPI event must come after
the function key is released.

> This makes those notifications at wake up not spurious at all - they =
are
> actually pretty logical, and serve to make OS ascertain current statu=
s
> of radio kill switch. But I am pretty much confident that those event=
s
> do NOT mean to be used as request to toggle kill switch state.

They are spurious in my case.

>
>> When dell-rbtn is loaded, the i8042 filter is
>> removed and dell-rbtn starts listening for ACPI notification. We do
>> this instead because the i8042 filter doesn't work properly on some
>> laptops.
>>
>>
>
> And here is the actual bug. dell-rbtn handles category D as if it wer=
e
> category A. For category D it should *not* send input event, but rath=
er
> hook and notify dell-laptop to query current kill switch state (becau=
se
> at least on my system there is no way to do it via ACPI RBTN).
>
> So the actual problem is to differentiate between categories A and D.=
 Is
> it possible to do based on ACPI name (DELRBTN vs DELLABCE) or may be =
on
> return value of CRBT? If not we really need black/white list here bas=
ed
> on DMI or something.
>
> And BTW these input events are consumed by kernel in filter installed=
 by
> net/rfkill/input.c, so they are not really user space.
>
>> The problem reported in [1] is that some laptops of (A) and (B) send=
 a
>> notification on resume and some others don't. [2] should fix this
>> problem, but we need to make sure that the extra notification is alw=
ays
>> caught before the resume of dell-rbtn.
>
> If dell-rbtn did the right thing for my laptop, those notifications w=
ere
> harmless.
>
>> This seems to be what happens
>> here on my laptop, but Andrei says otherwise. So we need to figure o=
ut
>> if [2] doesn't fix the problem because it's not guaranteed that ACPI
>> notifications sent while the system is resuming are received by devi=
ce
>> drivers before they are resumed (assumption that I made for the firs=
t
>> patch and that dropped with the updated one I sent in this thread) o=
r
>> because Andrei's problem is something different.
>>
>
> Are you sure the laptops in bugzilla are actually of type A and not o=
f
> type D? That would match what I observe here.

I have the same laptop, which is of type B. Without dell-rbtn the BIOS
handles radios, with dell-rbtn it simply sends ACPI notifications.

>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
>> [2]
>> http://lkml.kernel.org/r/1448115375-7315-1-git-send-email-gabriele.m=
zt@gmail.com
>>
>
