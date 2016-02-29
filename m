From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 1/1] ideapad-laptop: Add ideapad Y700 (15) to the
 no_hw_rfkill DMI list
Date: Mon, 29 Feb 2016 14:13:21 -0800
Message-ID: <20160229221321.GC7499@dvhart-mobl5.amr.corp.intel.com>
References: <Pine.NEB.4.64.1602191918380.15324@faeroes.freeshell.org>
 <20160222221416.GD14101@dvhart-mobl5.amr.corp.intel.com>
 <Pine.NEB.4.64.1602221810140.9397@norge.freeshell.org>
 <20160226185622.GA21870@dvhart-mobl5.amr.corp.intel.com>
 <Pine.NEB.4.64.1602261748330.4769@norge.freeshell.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46781 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750775AbcB2WNZ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 29 Feb 2016 17:13:25 -0500
Content-Disposition: inline
In-Reply-To: <Pine.NEB.4.64.1602261748330.4769@norge.freeshell.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: John Dahlstrom <jodarom@SDF.ORG>
Cc: Ike Panhc <ike.pan@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 27, 2016 at 12:49:03AM -0600, John Dahlstrom wrote:
> On Fri, 26 Feb 2016, Darren Hart wrote:
> >On Mon, Feb 22, 2016 at 10:29:48PM -0600, John Dahlstrom wrote:
> [...]
> >>Thank you for that information. One commit is sufficient to apply the patch
> >>to all kernel versions without fuzz:
> >>
> >>4fa9dab ideapad_laptop: Lenovo G50-30 fix rfkill reports wireless blocked
> >
> >This does not yield correct results for me on 3.17 (or 3.17.8). Do you get
> >different results from the following?
> >
> [...]
> >Note that the DMI match blocks were stuffed in the middle of the
> >ideapad_acpi_add() function instead of the no_hw_rfkill.
> 
> The v3, v4, and v5 patch submissions had been corrupted by spurious
> whitespace inserted by my email client. I have sent a corrected version,
> [PATCH v6 1/1] ideapad-laptop: Add ideapad Y700 (15) to the no_hw_rfkill DMI list
> 
> After submission, I verified the successful application of the patch
> as received by the mailing list.
> 
> I also ran git clone, "git checkout -b 3.17 v3.17", and
> "git cherry-pick 4fa9dab", followed by patch with success.

OK, I've replaced the one in for-next with this one.

I'm not keen on backporting only certain dmi match patches back to stable, but I
don't want to discourage people from working to get the hardware they care about
supported in stable either.

Thanks for sticking with it and seeing this through to completion.

-- 
Darren Hart
Intel Open Source Technology Center
