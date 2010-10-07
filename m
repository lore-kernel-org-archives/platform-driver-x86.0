From: Mario Limonciello <superm1@ubuntu.com>
Subject: Re: [PATCH] dell-laptop: Add hwswitch_only module parameter
Date: Thu, 7 Oct 2010 16:57:18 -0500
Message-ID: <AANLkTinj4JXy+vAosHjhq5BFUefBvHyP2NiJhEb3cEuP@mail.gmail.com>
References: <1286422207-14248-1-git-send-email-keng-yu.lin@canonical.com>
	<20101007111510.GA19624@srcf.ucam.org>
	<AANLkTinus8SxbXt14qabXgpbFXF4U+uNoKA-=eDuOjmp@mail.gmail.com>
	<20101007133529.GA21782@srcf.ucam.org>
	<AANLkTi=kTQpTkCF6-DE+LdNLH_aki9bD9NPF0L2qRr=Q@mail.gmail.com>
	<20101007205049.GB32726@srcf.ucam.org>
	<AANLkTi=bj3T5hcX9r3j5kyEQkNb7PAZK948kcrx4R8tC@mail.gmail.com>
	<20101007213027.GA18628@core.coreip.homeip.net>
	<20101007213754.GA1896@srcf.ucam.org>
	<20101007214628.GB18628@core.coreip.homeip.net>
	<20101007215028.GB2292@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:53900 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750764Ab0JGV5T (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 7 Oct 2010 17:57:19 -0400
In-Reply-To: <20101007215028.GB2292@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Keng-Yu Lin <keng-yu.lin@canonical.com>, len.brown@intel.com, alan-jenkins@tuffmail.co.uk, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Oct 7, 2010 at 16:50, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> On Thu, Oct 07, 2010 at 02:46:28PM -0700, Dmitry Torokhov wrote:
>> On Thu, Oct 07, 2010 at 10:37:54PM +0100, Matthew Garrett wrote:
>> > Dell laptop driver is reasonable. All we need is a list of hardware, and
>> > I'd really hope that Dell know which BIOS versions contain this code!
>> >
>>
>> Unfortunately this kind of crap tends to flow from one BIOS version to
>> another.. How many DMI entries do we know about so far? Did Dell issue
>> firmware updates correcting the issue so new boxes will not exhibit the
>> problem?
>
> Pushing this out to userspace doesn't help. If it's sufficiently
> prevelant that it's impossible to have a comprehensive list, then a
> module option makes it too easy for people to just post the fix on a
> forum somewhere and never actually get it upstream.
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>

Making it more difficult to enable the alternative functionality
wouldn't necessarily make the list any more comprehensive, it just
raises the bar for users who want to try to help.  If users report the
bugs to their distros, distros will help to forward them upstream.
You can't expect to fix a social problem here just by making it more
difficult to fix the original problem at hand for individuals.


-- 
Mario Limonciello
superm1@gmail.com
