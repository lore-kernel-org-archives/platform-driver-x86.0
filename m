From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86: add Intel Punit mailbox IPC driver
Date: Fri, 28 Aug 2015 11:57:22 -0700
Message-ID: <20150828185722.GA88873@vmdeb7>
References: <1438358336-79179-1-git-send-email-qipeng.zha@intel.com>
 <20150805212512.GD38348@vmdeb7>
 <1439219049.29746.222.camel@intel.com>
 <1439913056.3505.95.camel@intel.com>
 <20150825203307.GA50910@vmdeb7>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01949DAE@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:57827 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752171AbbH1S5Y (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Aug 2015 14:57:24 -0400
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD01949DAE@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "Fleming, Matt" <matt.fleming@intel.com>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>

On Wed, Aug 26, 2015 at 08:22:33AM +0000, Zha, Qipeng wrote:
> On Tue, Aug 18, 2015 at 04:50:56PM +0100, Matt Fleming wrote:
> > On Mon, 2015-08-10 at 16:04 +0100, Shevchenko, Andriy wrote:
> > > 
> > > Matt, by the way intel_pmc_ipc.c module creates iTCO device (LPC bus).
> > > Does it look correct?
> > 
> > Yeah, it looks OK to me. Note there are changes queued up in Lee Jones'
> > tree for changing the lpc_ich_info into itco_wdt_platform_data.
> > 
> > Btw, is there a reason that intel_pmc_ipc doesn't use the mfd_* API 
> > since it's concerned with multiple functions?
> 
> > Qipeng?
> 
> > I saw the v2 come in, but didn't see this question addressed in the changelog.
> 
> When design P-unit driver, we got feedback from BIOS that there will allocate a dedicate
> ACPI id for P-unit controller, and finally BIOS decide not do that, just put some necessary 
> Resource in PMC acpi table.
> After that, we got request to do same thing for iTco.
> 
> I agree it's better to update pmc driver to use mfd_add_devices to create punit and iTco device.

Does this mean there sill be a v4 I should be waiting for?

-- 
Darren Hart
Intel Open Source Technology Center
