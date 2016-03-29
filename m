From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH] intel_menlow: set cdev after null device check to avoid null pointer dereference
Date: Tue, 29 Mar 2016 15:13:43 +0200
Message-ID: <4083784.LDUSFcvSJY@vostro.rjw.lan>
References: <1459181919-13825-1-git-send-email-colin.king@canonical.com> <20160328181805.GC26086@dvhart-mobl5.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:61448 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1751539AbcC2NLY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Mar 2016 09:11:24 -0400
In-Reply-To: <20160328181805.GC26086@dvhart-mobl5.amr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Colin King <colin.king@canonical.com>, Sujith Thomas <sujith.thomas@intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Monday, March 28, 2016 11:18:05 AM Darren Hart wrote:
> On Mon, Mar 28, 2016 at 05:18:39PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > intel_menlow_memory_remove sanity checks to see if device is null, however,
> > this check is performed after we have already passed device into a call
> > to acpi_driver_data.  If device is null, then acpi_driver_data will produce
> > a null pointer dereference on device. The correct action is to sanity check
> > device, then assign cdev, then check if cdev is null.
> > 
> 
> Hrm, looking at this locally, that all makes sense.
> 
> Taking a step back however, I notice that intel_menlow_memory_remove is an ops
> function pointer inside the acpi_driver structure itself, which is called from
> acpi_device_remove() (and probe) (drivers/acpi/bus.c). This already verifies
> acpi_driver is not NULL and can't get acpi_driver if acpi_device is NULL. So
> unless there is some other use case for this callback I'm unaware of (certainly
> possible) it appears to be totally redundant to do this checking here.
> 
> +Rafael - is there a best practices for these acpi callbacks with respect to
> input validation?

No best practices I'm aware of, but if the core does this checks anyway before
calling this, they are clearly not necessary here.

Thanks,
Rafael
