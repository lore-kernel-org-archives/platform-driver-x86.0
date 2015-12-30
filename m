From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 5/5] platform:x86: Makefile/Kconfig/MAINTAINERS
 changes for Intel Telemetry
Date: Tue, 29 Dec 2015 23:32:10 -0800
Message-ID: <20151230073210.GG29978@malice.jf.intel.com>
References: <1450867481-11404-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005910.GD29978@malice.jf.intel.com>
 <3324542.b0Ltp5HvhD@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49758 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751238AbbL3HcN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Dec 2015 02:32:13 -0500
Content-Disposition: inline
In-Reply-To: <3324542.b0Ltp5HvhD@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Wed, Dec 30, 2015 at 02:59:09AM +0100, Rafael Wysocki wrote:
> On Tuesday, December 29, 2015 04:59:10 PM Darren Hart wrote:
> > On Wed, Dec 23, 2015 at 04:14:41PM +0530, Souvik Kumar Chakravarty wrote:
> > > Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
> > > It depends on PUNIT and PMC IPC drivers.
> > 
> > ...
> > 
> > > +config INTEL_TELEMETRY
> > > +	tristate "Intel SoC Telemetry Driver"
> > > +	default n
> > > +	depends on INTEL_PMC_IPC && INTEL_PUNIT_IPC && X86_64
> > > +	---help---
> > > +	  This driver provides interfaces to configure and use
> > > +	  telemetry for INTEL SoC from APL onwards. It is also
> > > +	  used to get various SoC events and parameters
> > > +	  directly via debugfs files. Various tools may use
> > 
> > If tools are going to be relying on it, debugfs doesn't seem like the right
> > place for it to me. Would /sys/power be more apt?
> > 
> > Rafael?
> 
> Using debugfs for things like these is not unheard of.
> 
> It all depends on whether or not the tools in question are intended to work
> on systems where debugfs is not enabled.

It was my understanding that debugfs was intended to make it clear that it may
change at any time and shouldn't be relied upon. Strictly for debug.

But, I'll defer to Rafael on this point.

-- 
Darren Hart
Intel Open Source Technology Center
