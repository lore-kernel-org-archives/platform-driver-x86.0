From: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Subject: Re: Regression with dell-rbtn: radio killed on resume after suspend
 to RAM
Date: Mon, 23 Nov 2015 23:33:11 +0100
Message-ID: <56539427.5090304@gmail.com>
References: <5650BE8E.2080506@gmail.com> <201511212008.46761@pali>
 <5650D693.6050808@gmail.com> <56515F57.8060801@gmail.com>
 <20151123145026.GF24147@pali> <56532D6B.8040407@gmail.com>
 <56533D81.7070406@gmail.com> <20151123192943.GY7413@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:34806 "EHLO
	mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755316AbbKWWdP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 23 Nov 2015 17:33:15 -0500
Received: by wmvv187 with SMTP id v187so183210016wmv.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Nov 2015 14:33:13 -0800 (PST)
In-Reply-To: <20151123192943.GY7413@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andrei Borzenkov <arvidjaar@gmail.com>
Cc: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

On 23/11/2015 20:29, Darren Hart wrote:

[cut]

>> I looked at what dell-rbtn does. My system (Latitude E5450) has RBTN of type
>> TOGGLE. In this case both del-laptop hooks itself into i8042 and dell-rbtn
>> delivers KEY_RFKILL event to input susbsystem. IOW dell-rbtn looks
>> completely redundant in this configuration.
>>
>> Can we detect that rfkill toggle is already avaiable via normal keyboard and
>> not activate dell-rbtn in this case?
>
> Also dropping this one until we can arrive at a complete solution.
>
> Pali, Gabriele, this one is in your hands. I will review and provide feedback
> where I can - I confess I'm finding it difficult to keep all the pieces straight
> in my head, and without any hardware, I have to rely entirely on what I can
> piece together (a situation we are all in as this differs across many systems,
> nobody has all the necessary bits).
>
> It may be helpful for someone to put together a current status, known issues,
> plan of attack to get this moving forward again.
>

I'll try to write a summary that should explain why dell-rbtn exists
and what are the current problems.

There are several mechanisms to control radio devices, so let's
consider different categories/cases.

A) The function keys of new Dell laptops do nothing on their own, but
when pressed, the BIOS sends a notification to an ACPI device
(DELLABCE/DELRBTN). One of the tasks of dell-rbtn is to catch those
notifications and send an input event to userspace. Without dell-rbtn,
the function keys of these laptops wouldn't work.

B) There are then some other laptops which support two different
mechanisms to control radio devices: the one here above (A) and
"the old one", i.e. the BIOS does everything. (These are probably
laptops that were released during the transition Windows 7 -> 8). These
laptops can switch between the two modes through an ACPI method call.
What we do with dell-rbtn is to make them behave like (A) since we
can't tell apart laptops of (A) and (B) and we need to know how each
laptop behaves. The function key of these laptops work perfectly
without dell-rbtn.

C) There are then some other laptops for which it's required to use an
i8042 filter to detect keypresses and do some SMI calls to toggle
the state of radio devices. This filter is created by dell-laptop and
has been there since a long time.

D) This category is something in between (C) and (A) and exists only
because of dell-rbtn. Some of the laptops of category (C) also have a
DELLABCE/DELLRBTN device. When dell-rbtn is loaded, the i8042 filter is
removed and dell-rbtn starts listening for ACPI notification. We do
this instead because the i8042 filter doesn't work properly on some
laptops.


The problem reported in [1] is that some laptops of (A) and (B) send a
notification on resume and some others don't. [2] should fix this
problem, but we need to make sure that the extra notification is always
caught before the resume of dell-rbtn. This seems to be what happens
here on my laptop, but Andrei says otherwise. So we need to figure out
if [2] doesn't fix the problem because it's not guaranteed that ACPI
notifications sent while the system is resuming are received by device
drivers before they are resumed (assumption that I made for the first
patch and that dropped with the updated one I sent in this thread) or
because Andrei's problem is something different.


I hope this was clear enough.


Andrei, as I wrote here above, dell-rbtn _should_ make dell-laptop
remove the i8042 filter. Could you also provide your acpidump so that
I can see it?


[1] https://bugzilla.kernel.org/show_bug.cgi?id=106031
[2] 
http://lkml.kernel.org/r/1448115375-7315-1-git-send-email-gabriele.mzt@gmail.com
