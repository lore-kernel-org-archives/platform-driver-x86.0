From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v3 5/5] platform:x86: Makefile/Kconfig/MAINTAINERS changes for Intel Telemetry
Date: Wed, 30 Dec 2015 02:59:09 +0100
Message-ID: <3324542.b0Ltp5HvhD@vostro.rjw.lan>
References: <1450867481-11404-1-git-send-email-souvik.k.chakravarty@intel.com> <20151230005910.GD29978@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:44776 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753903AbbL3B2j (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 20:28:39 -0500
In-Reply-To: <20151230005910.GD29978@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Tuesday, December 29, 2015 04:59:10 PM Darren Hart wrote:
> On Wed, Dec 23, 2015 at 04:14:41PM +0530, Souvik Kumar Chakravarty wrote:
> > Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
> > It depends on PUNIT and PMC IPC drivers.
> 
> ...
> 
> > +config INTEL_TELEMETRY
> > +	tristate "Intel SoC Telemetry Driver"
> > +	default n
> > +	depends on INTEL_PMC_IPC && INTEL_PUNIT_IPC && X86_64
> > +	---help---
> > +	  This driver provides interfaces to configure and use
> > +	  telemetry for INTEL SoC from APL onwards. It is also
> > +	  used to get various SoC events and parameters
> > +	  directly via debugfs files. Various tools may use
> 
> If tools are going to be relying on it, debugfs doesn't seem like the right
> place for it to me. Would /sys/power be more apt?
> 
> Rafael?

Using debugfs for things like these is not unheard of.

It all depends on whether or not the tools in question are intended to work
on systems where debugfs is not enabled.

Thanks,
Rafael
