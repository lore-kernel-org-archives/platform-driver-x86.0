From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 5/5] platform:x86: Makefile/Kconfig/MAINTAINERS
 changes for Intel Telemetry
Date: Tue, 29 Dec 2015 16:59:10 -0800
Message-ID: <20151230005910.GD29978@malice.jf.intel.com>
References: <1450867481-11404-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:40729 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753903AbbL3A7M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 19:59:12 -0500
Content-Disposition: inline
In-Reply-To: <1450867481-11404-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, Rafael Wysocki <rjw@rjwysocki.net>
Cc: platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Wed, Dec 23, 2015 at 04:14:41PM +0530, Souvik Kumar Chakravarty wrote:
> Makefile, Kconfig & MAINTAINERS changes for compiling Telemetry.
> It depends on PUNIT and PMC IPC drivers.

...

> +config INTEL_TELEMETRY
> +	tristate "Intel SoC Telemetry Driver"
> +	default n
> +	depends on INTEL_PMC_IPC && INTEL_PUNIT_IPC && X86_64
> +	---help---
> +	  This driver provides interfaces to configure and use
> +	  telemetry for INTEL SoC from APL onwards. It is also
> +	  used to get various SoC events and parameters
> +	  directly via debugfs files. Various tools may use

If tools are going to be relying on it, debugfs doesn't seem like the right
place for it to me. Would /sys/power be more apt?

Rafael?

-- 
Darren Hart
Intel Open Source Technology Center
