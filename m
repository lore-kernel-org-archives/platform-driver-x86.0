From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] toshiba_haps: Some misc changes plus sysfs entries
 documentation
Date: Wed, 6 May 2015 15:08:39 -0700
Message-ID: <20150506220839.GB22096@fury.dvhart.com>
References: <1424973511-3090-1-git-send-email-coproscefalo@gmail.com>
 <20150306183246.GJ19001@vmdeb7>
 <CAGdLNWGUWzqnyZqFpPpzHYG4zv4pjKc8FcT2aGUcNsJRZyoOhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40719 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876AbbEFWIl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 18:08:41 -0400
Content-Disposition: inline
In-Reply-To: <CAGdLNWGUWzqnyZqFpPpzHYG4zv4pjKc8FcT2aGUcNsJRZyoOhg@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Mon, May 04, 2015 at 12:10:41PM -0600, Azael Avalos wrote:
> Hi Darren,
> 
> 
> 2015-03-06 11:32 GMT-07:00 Darren Hart <dvhart@infradead.org>:
> > On Thu, Feb 26, 2015 at 10:58:29AM -0700, Azael Avalos wrote:
> >> These patches make some misc chanes to the driver, replacing sscanf with
> >> kstrtoint, DEVICE_ATTR_{RW, WO} macros and adding documentation about
> >> the sysfs entries.
> >>
> >> Azael Avalos (3):
> >>   toshiba_haps: Replace sscanf with kstrtoint
> >>   toshiba_haps: Make use of DEVICE_ATTR_{RW, WO} macros
> >>   Documentation/ABI: Add file describing the sysfs entries for
> >>     toshiba_haps
> >>
> >>  .../ABI/testing/sysfs-driver-toshiba_haps          | 20 ++++++++++++++
> >>  drivers/platform/x86/toshiba_haps.c                | 32 ++++++++++++++--------
> >>  2 files changed, 40 insertions(+), 12 deletions(-)
> >>  create mode 100644 Documentation/ABI/testing/sysfs-driver-toshiba_haps
> >
> > Queued for 4.1, thanks Azael.
> 
> These patches were supposed to be included in 4.1,
> but somehow they didn't, can you re-queue for 4.2?

So sorry, I honestly have no idea what happened :/ I don't reply with queued
until I have them in a branch... apologies. You should see them in for-next by
tomorrow.

-- 
Darren Hart
Intel Open Source Technology Center
