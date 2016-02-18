From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 0/5] dell fixes and Skylake updates
Date: Wed, 17 Feb 2016 21:03:45 -0800
Message-ID: <20160218050345.GA18421@dvhart-mobl5.amr.corp.intel.com>
References: <cover.1455553470.git.luto@kernel.org>
 <20160217070056.GD20116@dvhart-mobl5.amr.corp.intel.com>
 <CALCETrXue_6LRWdQuxJ0J0svtMJ06DH92-VFU6AKS_O6TyvzEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58947 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750830AbcBRFDu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 18 Feb 2016 00:03:50 -0500
Content-Disposition: inline
In-Reply-To: <CALCETrXue_6LRWdQuxJ0J0svtMJ06DH92-VFU6AKS_O6TyvzEQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Andy Lutomirski <luto@kernel.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Wed, Feb 17, 2016 at 12:33:01PM -0800, Andy Lutomirski wrote:
> On Tue, Feb 16, 2016 at 11:00 PM, Darren Hart <dvhart@infradead.org> wrote:
> > On Mon, Feb 15, 2016 at 08:32:32AM -0800, Andy Lutomirski wrote:
> >> This is the successor to v3 of the dmi walk fixes and v4 of the Skylake
> >> stuff.  The Skylake history is in that patch's notes.
> >
> > Only mostly minor comments from me and one from Pali. I've pushed this to a
> > dell-skylake topic branch to let 0-day beat on it for a day. Please have a look
> > at my review and Pali's and send any necessary updates.
> >
> 
> It looks like all necessary updates are comment changes.  Should I
> just send follow-up patches to address them?

That's fine with me. I'll add Pali's Acked-by and get these into next tonight.

-- 
Darren Hart
Intel Open Source Technology Center
