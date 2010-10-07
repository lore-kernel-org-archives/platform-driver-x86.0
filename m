From: Mario Limonciello <superm1@ubuntu.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 16:33:14 -0500
Message-ID: <AANLkTimuPK8+uV6tZ6GmFx0tp64pAUajrt2dpwOzx_n-@mail.gmail.com>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
	<20101007111510.GA19624@srcf.ucam.org>
	<AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
	<20101007133529.GA21782@srcf.ucam.org>
	<AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
	<20101007205049.GB32726@srcf.ucam.org>
	<AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com>
	<20101007213027.GA18628@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:56948 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751399Ab0JGVdP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 17:33:15 -0400
In-Reply-To: <20101007213027.GA18628@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Dmitry:

On Thu, Oct 7, 2010 at 16:30, Dmitry Torokhov <dmitry.torokhov@gmail.co=
m> wrote:
> On Thu, Oct 07, 2010 at 03:53:37PM -0500, Mario Limonciello wrote:
>> Hi Matthew:
>>
>> On Thu, Oct 7, 2010 at 15:50, Matthew Garrett <mjg@redhat.com> wrote=
:
>> > On Thu, Oct 07, 2010 at 03:49:05PM -0500, Mario Limonciello wrote:
>> >> Hi Matthew:
>> >> > Is the kernel able to unblock it under those circumstances?
>> >>
>> >> Manually running rfkill unblock will unblock it in this broken
>> >> firmware scenario in question.
>> >
>> > So the issue is in the firmware's response to the keystroke? Ok. I=
'd
>> > rather have a DMI list of the broken machines than a module parame=
ter.
>>
>> Yes the issue is the firmware's response to the keystroke. =A0The
>> intention here is to individual submit machines in future patches as
>> they're discovered. =A0The parameter's primary purpose is to assist =
in
>> building the list. =A0If someone reports a bug with these symptoms, =
they
>> can add the parameter to their kernel command line, and report if it
>> helps them. =A0If it helps, their machine can be added to the DMI ta=
ble.
>>
>
> Mario, Matthew,
>
> Since the fix is not essential for boot purposes can we keep module
> parameter only (without adding DMI entries) and push the task of
> properly setting the module parmeter to udev?
>
> We have this strategy for bunch of input stuff (force release, keymap=
)
> and I think it works better than dding more and more DMI quirks into
> kernel itself.
>
> Thanks.
>
> --
> Dmitry
>

I think this is a fair alternative.  A majority of the machines will
work properly as is - no parameter, and the few in between that don't
can have entries added to udev then.  It's even easier for users to
diagnose and submit feedback when they're modifying a udev conffile.

--=20
Mario Limonciello
superm1@gmail.com
