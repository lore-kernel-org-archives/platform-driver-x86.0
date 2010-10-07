From: Mario Limonciello <superm1@ubuntu.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 15:53:37 -0500
Message-ID: <AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
	<20101007111510.GA19624@srcf.ucam.org>
	<AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
	<20101007133529.GA21782@srcf.ucam.org>
	<AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
	<20101007205049.GB32726@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:35894 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924Ab0JGUxj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 16:53:39 -0400
In-Reply-To: <20101007205049.GB32726@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Matthew:

On Thu, Oct 7, 2010 at 15:50, Matthew Garrett <mjg@redhat.com> wrote:
> On Thu, Oct 07, 2010 at 03:49:05PM -0500, Mario Limonciello wrote:
>> Hi Matthew:
>> > Is the kernel able to unblock it under those circumstances?
>>
>> Manually running rfkill unblock will unblock it in this broken
>> firmware scenario in question.
>
> So the issue is in the firmware's response to the keystroke? Ok. I'd
> rather have a DMI list of the broken machines than a module parameter.

Yes the issue is the firmware's response to the keystroke.  The
intention here is to individual submit machines in future patches as
they're discovered.  The parameter's primary purpose is to assist in
building the list.  If someone reports a bug with these symptoms, they
can add the parameter to their kernel command line, and report if it
helps them.  If it helps, their machine can be added to the DMI table.

-- 
Mario Limonciello
superm1@gmail.com
