From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 15:43:46 +0200
Message-ID: <5628E812.2070708@gmail.com>
References: <20151021110059.GF15219@pali> <20151021111243.GB87951@vmdeb7>
 <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
 <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali> <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali> <5628C069.8040902@gmail.com>
 <20151022130211.GA110029@vmdeb7>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:35305 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753351AbbJVNnt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 09:43:49 -0400
Received: by wicll6 with SMTP id ll6so136108697wic.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 06:43:47 -0700 (PDT)
In-Reply-To: <20151022130211.GA110029@vmdeb7>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On 22/10/2015 15:02, Darren Hart wrote:
> On Thu, Oct 22, 2015 at 12:54:33PM +0200, Gabriele Mazzotta wrote:
>> On 22/10/2015 12:50, Pali Roh=E1r wrote:
>>> On Thursday 22 October 2015 12:44:08 Gabriele Mazzotta wrote:
>>>> On 22/10/2015 10:51, Pali Roh=E1r wrote:
>>>>> On Thursday 22 October 2015 10:26:47 Gabriele Mazzotta wrote:
>>>>>> I'll see if I can find a batter way to deal with this problem,
>>>>>> dell-laptop can detect the presence of an hardware switch.
>>>>>
>>>>> dell-rbtn.ko has acpi method CRBT which returns if notebook has h=
w switch or
>>>>> toggle key.
>>>>>
>>>>> And rfkill implementation in dell-laptop.ko does not work correct=
ly on
>>>>> XPS machines. And because userspace implementation of smbios work=
s fine,
>>>>> I think that problem is in kernel driver rather in BIOS/firmware.=
=2E.
>>>>
>>>> I was thinking about something such as the following, which should=
 favor
>>>> the hardware slider when available. This should work if my assumpt=
ion is
>>>> correct, that is the laptops with a working RBTN method are the on=
es
>>>> having problems.
>>>>
>>>
>>> Hm... wait! There are machines with HW slider and type is RBTN_TOGG=
LE?
>>>
>>> I thought that all machines with HW slider has type RBTN_SLIDER and
>>> others have RBTN_TOGGLE.
>>
>> Yes, this is the problem I've been talking about ever since the work
>> on this driver started. AFAIK we don't know how to detect these lapt=
ops
>> (my XPS13 is one of them).
>
> Where is the radio hw slider on this machine?

It's the F2 key. Depending on the value passed to the RBTN, it acts as
hw slider or sw toggle. Currently dell-rbtn makes all the laptops with
both the hw slider and sw toggle use the sw toggle. In this way we are
sure that whenever CRBT returns either 1 or 0, we are using the sw
mechanism to disable the radios.

The problem is that the CRBT method of these laptops supporting both
the methods return 1 or 0 as the laptops that only have the sw toggle.
That's why we are calling RBTN to force the sw toggle.

> This patch would effectively ignore Fn-F2 (radio toggle) key on this =
machine
> then - correct? I don't think that is desirable either.

No, this patch would force the hw slider when it's available instead
of blindly forcing the sw toggle. When the hw slider is in use,
everything is handled by the BIOS, so userspace/kernel don't have to
do anything.

> Seems to me the desired behavior would be to restore the radio state =
on resume.
> Consider the following table:
>
> SW: Switch state
> SS: State at suspend
> SR: State after resume
>   0: WiFi Enabled
>   1: WiFi Disabled
>
> State SW SS SR
> --------------
> a      0  0  0
> b      0  1  1   (switch is enabled, but toggle key disabled wifi)
> c      1  0  N/A (invalid state)
> d      1  1  1
>
> State "a" is where we are failing currently I believe?

dell-rbtn is simply listening to the ACPI notifications sent to
DELLABCE. These notifications are sent by the BIOS, both when users
press the function key and when it wants. In my case, the BIOS sends a
notification on resume (dell-rbtn sees this notification and sends an
input event to userspace), but the BIOS of some other laptops don't do
this.

Basically, dell-rbtn makes some laptop toggles the state of WiFi on
resume, but not all of them.

In my case:
if WiFi is ON on suspend, it's turned OFF on resume.
if WiFi is OFF on suspend, it's turned ON on resume.

Reading what Alex wrote some time ago [1], I guessed that the laptops=20
that are misbehaving are those that can choose between sw toggle and hw
toggle.

> Do we know if DELRBTN and DELLABCE are always a TOGGLE or a SLIDER re=
spectively?
> I'm wondering if these should be separate drivers.

I'm reading the acpidumps Alex provided some time ago [2] (and mine):
* XPS13 9333: DELLABCE, by default (without calling RBTN) SLIDER.
* Latitude E5440: DELLABCE, SLIDER
* Inspiron 7447: DELLABCE, TOGGLE
* Pali's laptop: DELLRBTN, SLIDER (correct?).

[1] https://marc.info/?l=3Dlinux-kernel&m=3D141941243829713
[2] http://people.canonical.com/~alexhung/dell-acpidump/
