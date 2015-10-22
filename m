From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v7] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Thu, 22 Oct 2015 17:43:07 +0200
Message-ID: <20151022154307.GB4289@malice.jf.intel.com>
References: <1444380548-17366-1-git-send-email-qipeng.zha@intel.com>
 <1444397622.8361.544.camel@intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD01981358@SHSMSX104.ccr.corp.intel.com>
 <20151015051606.GD2592@malice.jf.intel.com>
 <20151021125143.GA29166@vmdeb7>
 <C6287702A945AC47BE5DB5DFD4B5C6DD02CE122D@SHSMSX104.ccr.corp.intel.com>
 <20151022080430.GB2581@malice.jf.intel.com>
 <C6287702A945AC47BE5DB5DFD4B5C6DD03813AD0@SHSMSX104.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:46847 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755990AbbJVPnN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 11:43:13 -0400
Content-Disposition: inline
In-Reply-To: <C6287702A945AC47BE5DB5DFD4B5C6DD03813AD0@SHSMSX104.ccr.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Xue, Gavin" <gavin.xue@intel.com>

On Thu, Oct 22, 2015 at 03:18:16PM +0000, Zha, Qipeng wrote:
> >Is the ASL fragment you provided collected from a running Linux system using
> >acpidump? If so, then the resources ACPI advertises to the OS are not
> >actually available... and that can't be acceptable.
> This is real ASL code I got from BIOS team and validated on bxt platform.
> Confirmed BIOS runtime code will update "acpi table" in memory before switch
> to os,  for those resource which need to get/read from hardware dynamically,
> in this case, MINF and MDAT is set in runtime when boot BIOS and size of res0
> is set as 4B.

So the ASL you provided was not what the Linux kernel is seeing, correct?

Can you please provide a DSDT disassembly from the running Linux system please,
such as:

# cp /sys/firmware/acpi/tables/DSDT DSDT.dat
# iasl -d DSDT.dat

Then find this device in DSDT.dsl and paste it here please.

-- 
Darren Hart
Intel Open Source Technology Center
