From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Tue, 24 Nov 2015 09:49:18 +0100
Message-ID: <5654248E.8030505@gmail.com>
References: <5650BE8E.2080506@gmail.com> <201511212008.46761@pali>
 <5650D693.6050808@gmail.com> <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali> <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com> <20151123192943.GY7413@malice.jf.intel.com>
 <56539427.5090304@gmail.com> <5653E243.9010707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f53.google.com ([74.125.82.53]:38229 "EHLO
	mail-wm0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752834AbbKXItV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 24 Nov 2015 03:49:21 -0500
Received: by wmec201 with SMTP id c201so16128620wme.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2015 00:49:20 -0800 (PST)
In-Reply-To: <5653E243.9010707@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andrei Borzenkov <arvidjaar@gmail.com>, Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

On 24/11/2015 05:06, Andrei Borzenkov wrote:
> 24.11.2015 01:33, Gabriele Mazzotta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> [...snip...]
>>
>> The problem reported in [1] is that some laptops of (A) and (B) send=
 a
>> notification on resume and some others don't. [2] should fix this
>> problem, but we need to make sure that the extra notification is alw=
ays
>> caught before the resume of dell-rbtn. This seems to be what happens
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
>>
>> I hope this was clear enough.
>>
>>
>> Andrei, as I wrote here above, dell-rbtn _should_ make dell-laptop
>> remove the i8042 filter.
>
> No. In dell_rbtn_notifier_register() it checks for RBTN of type SLIDE=
R
> using rbtn_inc_count(). If no SLIDER is found it returns ENODEV and
> dell-laptop proceeds with i8042 hook.
>
> [   16.685944] dell_laptop: Using i8042 filter function for receiving
> events
>
> But that does *not* stop dell-rbtn from actually running and sending
> input events:

I think I see the problem now. Your case (RBTN_TOGGLE +=20
Latitude/Precision) wasn't taken into account. I think my laptop and=20
yours behave in the same way, but since mine is an XPS, dell-laptop=20
doesn't create the rfkill + filter for it. dell-laptop does this only
for Latitude and Precision laptops.

> /*
>   * acpi driver functions
>   */
>
> static int rbtn_add(struct acpi_device *device)
> {
> ...
>          case RBTN_TOGGLE:
>                  ret =3D rbtn_input_init(rbtn_data);
>                  break;
>
> So as I said, we now have both of them handling the same key press.
>
> Also using dell-laptop (3.13 kernel) and dell-laptop + dell-rbtn (4.2
> kernel with your patch to ignore events during suspend) I see differe=
nt
> reaction to key press:
>
> 3.13
>
> 0: dell-wifi: Wireless LAN
>      Soft blocked: no
>      Hard blocked: no
> 1: dell-bluetooth: Bluetooth
>      Soft blocked: no
>      Hard blocked: no
> 2: phy0: Wireless LAN
>      Soft blocked: no
>      Hard blocked: no
> 6: hci0: Bluetooth
>      Soft blocked: no
>      Hard blocked: no
>
> Press rfkill button
>
> 0: dell-wifi: Wireless LAN
>      Soft blocked: no
>      Hard blocked: yes
> 1: dell-bluetooth: Bluetooth
>      Soft blocked: no
>      Hard blocked: yes
> 2: phy0: Wireless LAN
>      Soft blocked: no
>      Hard blocked: yes
>
> 4.2
>
> 0: dell-wifi: Wireless LAN
>      Soft blocked: no
>      Hard blocked: no
> 1: dell-bluetooth: Bluetooth
>      Soft blocked: no
>      Hard blocked: no
> 2: hci0: Bluetooth
>      Soft blocked: no
>      Hard blocked: no
> 3: phy0: Wireless LAN
>      Soft blocked: no
>      Hard blocked: no
>
> Press rfkill button
>
> 0: dell-wifi: Wireless LAN
>      Soft blocked: yes
>      Hard blocked: no
> 1: dell-bluetooth: Bluetooth
>      Soft blocked: yes
>      Hard blocked: no
> 2: hci0: Bluetooth
>      Soft blocked: yes
>      Hard blocked: no
> 3: phy0: Wireless LAN
>      Soft blocked: yes
>      Hard blocked: yes
>
> I am not sure whether keyboard key should be treated as hard or soft
> (i.e. I do not know how to verify that radio is switched off without =
OS
> running), but I still expect the same behavior in both cases.

Unfortunately this is expected. Looking at your DSDT it seems that the
function key of your laptop is not intended to hard block radio devices=
=2E

Also, I can see that a notification is sent on resume.

>> Could you also provide your acpidump so that
>> I can see it?
>>
>
> Attached (I thought about adding to bugzilla, but as we are not sure
> whether it is the same bug, I send it here).
>
> I have old Dell XPS M1303 with both slider and button type of rfkill,
> I'll try to see what happens there.

I think the BIOS is sending a notification on resume also on your
laptop, but I could be wrong. The followings should be the ACPI method
calls that happen on resume:
_WAK -> RWAK -> EV2 -> \_SB.RBTN.NRBT (this one notifies RBTN)

So you have two problems: the extra notification + i8042 filter.

> P.S. it seems that RBTN is exposed if _OSI claims sufficiently recent
> Windows is present; I tried booting with acpi_osi=3D! acpi_osi=3DLinu=
x and
> got no RBTN device at all. I wonder how Windows handles it.

Windows 8 has changed the way radio function keys work. They are now
stateless buttons that inform the OS when they are pressed. It's up to
the OS handle the state of radio devices.

This is the reason why you see a different output using the rfkill +
dell-rbtn. We are handling radio devices as Windows does, mostly
because it's the only way to handle the function key of some laptops.

Your laptop should actually be one of those, but since it's a Latitude,
dell-laptop gets in the way. I also have issues when I load dell-laptop
(RBTN_TOGGLE here) with the force_rfkill param (mine is an XPS).


Pali, what should we do for the case Latitude/Precision + RBTN_TOGGLE?

>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
>> [2]
>> http://lkml.kernel.org/r/1448115375-7315-1-git-send-email-gabriele.m=
zt@gmail.com
>>
>>
>
