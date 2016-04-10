From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel_menlow: set cdev after null device check to avoid
 null pointer dereference
Date: Sat, 9 Apr 2016 19:34:21 -0700
Message-ID: <20160410023421.GB27081@dvhart-mobl5.amr.corp.intel.com>
References: <1459181919-13825-1-git-send-email-colin.king@canonical.com>
 <20160328181805.GC26086@dvhart-mobl5.amr.corp.intel.com>
 <4083784.LDUSFcvSJY@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:45002 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750811AbcDJChi (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 9 Apr 2016 22:37:38 -0400
Content-Disposition: inline
In-Reply-To: <4083784.LDUSFcvSJY@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Colin King <colin.king@canonical.com>, Sujith Thomas <sujith.thomas@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Mar 29, 2016 at 03:13:43PM +0200, Rafael Wysocki wrote:
> On Monday, March 28, 2016 11:18:05 AM Darren Hart wrote:
> > On Mon, Mar 28, 2016 at 05:18:39PM +0100, Colin King wrote:
> > > From: Colin Ian King <colin.king@canonical.com>
> > > 
> > > intel_menlow_memory_remove sanity checks to see if device is null, however,
> > > this check is performed after we have already passed device into a call
> > > to acpi_driver_data.  If device is null, then acpi_driver_data will produce
> > > a null pointer dereference on device. The correct action is to sanity check
> > > device, then assign cdev, then check if cdev is null.
> > > 
> > 
> > Hrm, looking at this locally, that all makes sense.
> > 
> > Taking a step back however, I notice that intel_menlow_memory_remove is an ops
> > function pointer inside the acpi_driver structure itself, which is called from
> > acpi_device_remove() (and probe) (drivers/acpi/bus.c). This already verifies
> > acpi_driver is not NULL and can't get acpi_driver if acpi_device is NULL. So
> > unless there is some other use case for this callback I'm unaware of (certainly
> > possible) it appears to be totally redundant to do this checking here.
> > 
> > +Rafael - is there a best practices for these acpi callbacks with respect to
> > input validation?
> 
> No best practices I'm aware of, but if the core does this checks anyway before
> calling this, they are clearly not necessary here.

My position as well.

Colin, would you care to respin these 2?

-- 
Darren Hart
Intel Open Source Technology Center
