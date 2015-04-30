From: Alex Hung <alex.hung@canonical.com>
Subject: Re: [PATCH v2 1/3] platform: x86: dell-rbtn: Dell Airplane Mode
 Switch driver
Date: Thu, 30 Apr 2015 14:06:27 +0800
Message-ID: <CAJ=jquYEEZ928A=eL158p38s4EEX32BZB5mOv5-841bRkKr_UQ@mail.gmail.com>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
	<20150429181606.GR24346@pali>
	<1662732.6WCXK4FVmN@xps13>
	<201504292059.26585@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:35949 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750863AbbD3GG2 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 30 Apr 2015 02:06:28 -0400
Received: by qku63 with SMTP id 63so27822204qku.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2015 23:06:27 -0700 (PDT)
In-Reply-To: <201504292059.26585@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Gabriele Mazzotta <gabriele.mzt@gmail.com>, Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, linux-kernel@vger.kernel.org

Method ABRT is to be used by driver to disable BIOS handling of radio
button. So the changes in behaviours observed by Gabriele is expected.
I have seen other systems behave the same way.

I do also see firmware only sends Notify(RBTN, 0x80) and no hard block
whether ABRT(1) is called or not.  Thus keycode are the only option on
those machines.

The idea to have an option (kernel parameter) for calling ABRT is
great. I can help verify on more machines. Is Gabriele's patch above a
final version that I should test?



On Thu, Apr 30, 2015 at 2:59 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> On Wednesday 29 April 2015 20:41:38 Gabriele Mazzotta wrote:
>> On Wednesday 29 April 2015 20:16:06 Pali Roh=C3=A1r wrote:
>> > On Wednesday 29 April 2015 20:11:38 Gabriele Mazzotta wrote:
>> > > On Wednesday 29 April 2015 20:00:18 Pali Roh=C3=A1r wrote:
>> > > > On Wednesday 29 April 2015 19:54:43 Gabriele Mazzotta
>> > > > wrote:
>> > > > > On Wednesday 29 April 2015 18:28:40 Pali Roh=C3=A1r wrote:
>> > > > > > On Wednesday 29 April 2015 15:57:58 Gabriele Mazzotta
>> > > > > > wrote:
>> > > > > > > On Wednesday 29 April 2015 15:08:40 Pali Roh=C3=A1r
>> > > > > > > wrote:
>> > > > > > > > On Wednesday 29 April 2015 12:30:32 Gabriele
>> > > > > > > > Mazzotta wrote:
>> > > > > > > > > On Wednesday 29 April 2015 11:51:04 Pali Roh=C3=A1r
>> > > > > > > > > wrote:
>> > > > > > > > > > This is an ACPI driver for Dell laptops
>> > > > > > > > > > which receive HW switch events. It exports
>> > > > > > > > > > rfkill device dell-rbtn which provide
>> > > > > > > > > > correct hard rfkill state.
>> > > > > > > > > >
>> > > > > > > > > > Alex Hung added code for supporting Dell
>> > > > > > > > > > laptops which have toggle button instead HW
>> > > > > > > > > > slider switch. On these laptops toggle
>> > > > > > > > > > button event is reported by new input
>> > > > > > > > > > device (instead rfkill) as they do not have
>> > > > > > > > > > hw radio switch.
>> > > > > > > > > >
>> > > > > > > > > > It looks like those are two different
>> > > > > > > > > > functions (rfkill, input device), but Dell
>> > > > > > > > > > BIOS exports them via same ACPI device and
>> > > > > > > > > > uses same ACPI functions. So code is in one
>> > > > > > > > > > kernel driver.
>> > > > > > > > >
>> > > > > > > > > I made a patch some time ago that I've just
>> > > > > > > > > adapted. It allows to prefer RBTN_SLIDER over
>> > > > > > > > > RBTN_TOGGLE. The main reason why I'd like to
>> > > > > > > > > have the hardware switch is that the BIOS
>> > > > > > > > > doesn't alter the soft state of the devices.
>> > > > > > > > > This comes in handy when the function key
>> > > > > > > > > controls multiple radio devices.
>> > > > > > > >
>> > > > > > > > Now I'm thinking... is't this bug in wifi kernel
>> > > > > > > > driver (which exports phy rfkill)? Or problem
>> > > > > > > > somewhere else (userspace or kernel)?
>> > > > > > >
>> > > > > > > What is the presumed bug you are referring to? The
>> > > > > > > fact that the soft state doesn't change?
>> > > > > >
>> > > > > > Can you remind me whats the problem on your laptop?
>> > > > >
>> > > > > CRBT returns 0 (so RBTN_TOGGLE), but by default my
>> > > > > laptop acts as if it returned 2 or 3, so we have to
>> > > > > call ARBT.
>> > > > >
>> > > > > As said before, there's no way to know when a platform
>> > > > > whose CRBT method returns 0 or 1 also has the
>> > > > > hardware switch, so to be sure that all the platforms
>> > > > > have working function keys, some of them (such as
>> > > > > mine) have to give up on the hardware switch.
>> > > >
>> > > > Ok, and what happens when you load this v2 version? What
>> > > > stopped working on your laptop?
>> > > >
>> > > > Alex, can you help? Code for toggle laptop version is
>> > > > originally yours.
>> > >
>> > > When I press the Fn key, a _Qxx EC method is executed. The
>> > > code path of this method depends on a variable set by
>> > > ARBT.
>> > >
>> > > When you call ARBT with 1 as argument, the variable is set
>> > > to 1 and the _Qxx method does nothing but sending a
>> > > notification (0x80) to RBTN whenever the function key is
>> > > pressed.
>> > >
>> > > When you call ARBT with 0 as argument, the variable is set
>> > > to 0 and the _Qxx method both sends 0x80 to RBTN _and_
>> > > toggle the state of the radio devices whenever the
>> > > function key is pressed.
>> > >
>> > > So in the end nothing _really_ breaks.
>> >
>> > So in linux kernel is missing code for toggling state of
>> > radio devices? And you can do that only by ACPI when ARBT
>> > is called with 0, right?
>>
>> Yes.
>>
>> With Alex's code the kernel sends keypresses to userspace and
>> userspace takes care of toggling the state of radio devices.
>
> Alex, can you ask Dell for documentation how to enable/disable
> radio devices? Because when ARBT is set to 1, then system must
> take care of it but, linux does not support it yet...
>
> --
> Pali Roh=C3=A1r
> pali.rohar@gmail.com



--=20
Cheers,
Alex Hung
