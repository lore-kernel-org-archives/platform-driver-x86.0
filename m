From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] RAPL (Running Average Power Limit) driver
Date: Fri, 5 Apr 2013 14:06:05 -0700
Message-ID: <20130405210605.GA18505@kroah.com>
References: <1365195724-8945-1-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:63784 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1162203Ab3DEVGJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Apr 2013 17:06:09 -0400
Received: by mail-pa0-f47.google.com with SMTP id bj3so2250113pad.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Apr 2013 14:06:08 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1365195724-8945-1-git-send-email-jacob.jun.pan@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Joe Perches <joe@perches.com>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>

On Fri, Apr 05, 2013 at 02:02:03PM -0700, Jacob Pan wrote:
> Changes since V2:
> 	- use 'struct device' instead of raw kobject to represent
> 	  RAPL domains
> 	- changed eventfd control interface to use event string
> 	  instead of passing file descriptors that cannot be
> 	  authenticated in sysfs directory
> 	- clean ups based on v1 reviews
> 		- use kcalloc for arrays
> 		- drop dependencies on X86
> 		- misc cleanups

Please no, split this up into at least 2 patches, the first being the
"standard" thermal driver, and the rest for the "custom" extensions you
are proposing.

That way the first can get accepted easily, and into 3.10 (hopefully),
so people can use it and not stall everything as we continue to iterate
over the "custom" things.

As is, this driver isn't acceptable, sorry.

greg k-h
