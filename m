From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7] platform:x86: Add PMC Driver for Intel Core SoC
Date: Thu, 26 May 2016 10:09:11 -0700
Message-ID: <20160526170911.GA98596@f23x64.localdomain>
References: <1464253879-18504-1-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57759 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497AbcEZRJJ (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 26 May 2016 13:09:09 -0400
Content-Disposition: inline
In-Reply-To: <1464253879-18504-1-git-send-email-rajneesh.bhardwaj@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Cc: platform-driver-x86@vger.kernel.org, andriy.shevchenko@linux.intel.com, linux-kernel@vger.kernel.org, olof@lixom.net, tglx@linutronix.de, hpa@zytor.com, dbasehore@google.com, vishwanath.somayaji@intel.com

On Thu, May 26, 2016 at 02:41:19PM +0530, Rajneesh Bhardwaj wrote:
> This patch adds the Power Management Controller driver as a PCI driver
> for Intel Core SoC architecture.
> 
> This driver can utilize debugging capabilities and supported features
> as exposed by the Power Management Controller.
> 
> Please refer to the below specification for more details on PMC features.
> http://www.intel.in/content/www/in/en/chipsets/100-series-chipset-datasheet-vol-2.html
> 
> The current version of this driver exposes SLP_S0_RESIDENCY counter.
> This counter can be used for detecting fragile SLP_S0 signal related
> failures and take corrective actions when PCH SLP_S0 signal is not
> asserted after kernel freeze as part of suspend to idle flow
> (echo freeze > /sys/power/state).
> 
> Intel Platform Controller Hub (PCH) asserts SLP_S0 signal when it
> detects favorable conditions to enter its low power mode. As a
> pre-requisite the SoC should be in deepest possible Package C-State
> and devices should be in low power mode. For example, on Skylake SoC
> the deepest Package C-State is Package C10 or PC10. Suspend to idle
> flow generally leads to PC10 state but PC10 state may not be sufficient
> for realizing the platform wide power potential which SLP_S0 signal
> assertion can provide.
> 
> SLP_S0 signal is often connected to the Embedded Controller (EC) and the
> Power Management IC (PMIC) for other platform power management related
> optimizations.
> 
> In general, SLP_S0 assertion == PC10 + PCH low power mode + ModPhy Lanes
> power gated + PLL Idle.
> 
> As part of this driver, a mechanism to read the SLP_S0_RESIDENCY is exposed
> as an API and also debugfs features are added to indicate SLP_S0 signal
> assertion residency in microseconds.
> 
> echo freeze > /sys/power/state
> wake the system
> cat /sys/kernel/debug/pmc_core/slp_s0_residency_usec
> 
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> Signed-off-by: Vishwanath Somayaji <vishwanath.somayaji@intel.com>

Queued for 4.7. Thank you.

-- 
Darren Hart
Intel Open Source Technology Center
