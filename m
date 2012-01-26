From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/1] alix2: supplement driver to include GPIO button
 support
Date: Wed, 25 Jan 2012 17:08:59 -0800
Message-ID: <20120125170859.49cbf10b.akpm@linux-foundation.org>
References: <1327348589-9601-1-git-send-email-philipp@redfish-solutions.com>
	<20120125145742.338086b8.akpm@linux-foundation.org>
	<4F208A70.1050709@redfish-solutions.com>
	<20120125151622.6621f6ce.akpm@linux-foundation.org>
	<4F20949F.1000602@redfish-solutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:58250 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751451Ab2AZBJA (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 Jan 2012 20:09:00 -0500
In-Reply-To: <4F20949F.1000602@redfish-solutions.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Philip Prindeville <philipp@redfish-solutions.com>
Cc: platform-driver-x86@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Richard Purdie <rpurdie@rpsys.net>, Andres Salomon <dilinger@queued.net>, Ed Wildgoose <kernel@wildgooses.com>, David Woodhouse <dwmw2@infradead.org>

On Wed, 25 Jan 2012 16:47:43 -0700
Philip Prindeville <philipp@redfish-solutions.com> wrote:

> On 1/25/12 4:16 PM, Andrew Morton wrote:
> > On Wed, 25 Jan 2012 16:04:16 -0700
> > Philip Prindeville <philipp@redfish-solutions.com> wrote:
> > 
> >>> This is odd.  There are no references to this from outside this file
> >>> and it's hard to see how a wireless driver could use this - any such
> >>> driver would have to load this module on *all* machines (even non-x86)
> >>> simply to resolve this symbol.
> >>
> >> It's for an out-of-tree driver that's only ever built for Alix hardware.
> > 
> > This should have been changelogged!  And a code comment would be good,
> > too - if it confused me now, it will confused others later.  And such a
> > code comment will help prevent others from coming in and "cleaning up"
> > the code later on.
> 
> Ok.  There currently wasn't a ChangeLog in arch/x86/platform/geode so I can add one.

No, I'm referring to this patch's changelog - the metadata which gets
committed along with the code changes.  Adding change info to the .c
file is lame - don't do that ;)

> > Out-of-tree drivers are unpopular.  Where is this driver, what is its
> > license and what are the prospects of making it in-tree?
> 
> It's complicated. Generic GPIO supports polled-keys for input, and LEDs for outputs as you know.
> 
> There's no generic output mechanism for (say) an RFKILL line on the bus. If/when this materialized, I'll modify the alix driver to register that device in addition to the soft-reset button and the output LEDs (for the alix.6 device only).
> 
> There's also a certain amount of churn going on right now in coreboot about supporting the 'alix.6' as a variant of the 'alix.2' (the coreboot build machinery doesn't support this, and we need to hack kconfig to make this happen, i.e. have kconfig be queryable from shell scripts like coreboot's abuild)... so for now most people burn an alix.2 coreboot image onto their alix.6.
> 
> So there's a chain of dependencies that need to be resolved to get the ideal solution in place... but not wanting the perfect be the enemy of the good, I wanted to get what's available today out there with the caveat that something better is in the pipeline.

That didn't really answer my question about the whereabouts of the
mystery wireless driver.  Oh well, it doesn't matter much.

> 
> > I don't personally have problems with helping out-of-tree drivers but
> > making it EXPORT_SYMBOL_GPL() would set minds at rest.
> 
> Ok.  I'll make that patch and resubmit...

Add a comment there too, otherwise someone will come along and zap it.
