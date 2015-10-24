From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v7] platform:x86: add Intel P-Unit mailbox IPC driver
Date: Sat, 24 Oct 2015 15:35:54 +0200
Message-ID: <1708740.AuEbmq20Do@vostro.rjw.lan>
References: <1444380548-17366-1-git-send-email-qipeng.zha@intel.com> <C6287702A945AC47BE5DB5DFD4B5C6DD03813AD0@SHSMSX104.ccr.corp.intel.com> <20151022154307.GB4289@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:41604 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751461AbbJXNHB (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 24 Oct 2015 09:07:01 -0400
In-Reply-To: <20151022154307.GB4289@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, "Zha, Qipeng" <qipeng.zha@intel.com>
Cc: "Shevchenko, Andriy" <andriy.shevchenko@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "Westerberg, Mika" <mika.westerberg@intel.com>, "Xue, Gavin" <gavin.xue@intel.com>

On Thursday, October 22, 2015 05:43:07 PM Darren Hart wrote:
> On Thu, Oct 22, 2015 at 03:18:16PM +0000, Zha, Qipeng wrote:
> > >Is the ASL fragment you provided collected from a running Linux system using
> > >acpidump? If so, then the resources ACPI advertises to the OS are not
> > >actually available... and that can't be acceptable.
> > This is real ASL code I got from BIOS team and validated on bxt platform.
> > Confirmed BIOS runtime code will update "acpi table" in memory before switch
> > to os,  for those resource which need to get/read from hardware dynamically,
> > in this case, MINF and MDAT is set in runtime when boot BIOS and size of res0
> > is set as 4B.
> 
> So the ASL you provided was not what the Linux kernel is seeing, correct?
> 
> Can you please provide a DSDT disassembly from the running Linux system please,
> such as:
> 
> # cp /sys/firmware/acpi/tables/DSDT DSDT.dat
> # iasl -d DSDT.dat
> 
> Then find this device in DSDT.dsl and paste it here please.

Or even better send the full output of acpidump from that system (when running).

Thanks,
Rafael
