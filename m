From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/5] Add support for deep sleep control.
Date: Tue, 2 Feb 2016 12:47:28 -0800
Message-ID: <20160202204728.GF1779@malice.jf.intel.com>
References: <1454380131-24662-1-git-send-email-mario_limonciello@dell.com>
 <1454380131-24662-5-git-send-email-mario_limonciello@dell.com>
 <20160202173208.GC1779@malice.jf.intel.com>
 <56B0F0D2.10606@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58061 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933907AbcBBUra (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Feb 2016 15:47:30 -0500
Content-Disposition: inline
In-Reply-To: <56B0F0D2.10606@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: LKML <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

On Tue, Feb 02, 2016 at 12:09:22PM -0600, Mario Limonciello wrote:
> 
> 
> On 02/02/2016 11:32 AM, Darren Hart wrote:
> > On Mon, Feb 01, 2016 at 08:28:50PM -0600, Mario Limonciello wrote:
> >> This allows configuration the system for wakeup with a controller.
> > Hrm, I'm happy to clean up English grammar in commit messages... but I'm
> > struggling with the intent of the above... Is this correct:
> >
> > Allow for user configuration, via sysfs, for wakeup with a controller.
> >
> > If so, great - but also, what do we mean by "with a controller" ?
> 
> I see how this is confusing to someone who isn't in the know what's
> going on.
> A better description is:
> 
> Allow for user configuration of BIOS settings that allow the system to
> turned on via HID devices.
> 
> If that's concise enough I'll update in next submission.

Yes, that's better. I think meant "... to be turned on ...". Otherwise, good.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
