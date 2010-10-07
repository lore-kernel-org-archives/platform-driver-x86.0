From: Mario Limonciello <superm1@ubuntu.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 16:41:12 -0500
Message-ID: <AANLkTinL9UckjiQGmMJ_NENPp9XxFHRdvTje_V46LPQ+@mail.gmail.com>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
	<20101007111510.GA19624@srcf.ucam.org>
	<AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
	<20101007133529.GA21782@srcf.ucam.org>
	<AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
	<20101007205049.GB32726@srcf.ucam.org>
	<AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com>
	<20101007213027.GA18628@core.coreip.homeip.net>
	<20101007213754.GA1896@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:50850 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264Ab0JGVlN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 17:41:13 -0400
In-Reply-To: <20101007213754.GA1896@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Matthew:

On Thu, Oct 7, 2010 at 16:37, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Thu, Oct 07, 2010 at 02:30:28PM -0700, Dmitry Torokhov wrote:
>
>> We have this strategy for bunch of input stuff (force release, keymap)
>> and I think it works better than dding more and more DMI quirks into
>> kernel itself.
>
> It's limited to Dell hardware, so I think keeping a static list in the
> Dell laptop driver is reasonable. All we need is a list of hardware, and
> I'd really hope that Dell know which BIOS versions contain this code!
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>

All Dell laptops are /supposed/ to adhere to the specification in
question.  Unfortunately, not all machines are tested with Linux
during their development and on the OS they ship with that
functionality isn't always used in that specific way for rfkill.


-- 
Mario Limonciello
superm1@gmail.com
