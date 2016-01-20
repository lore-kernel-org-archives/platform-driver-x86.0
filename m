From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Wed, 20 Jan 2016 06:41:36 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB42C0FA30F@BGSMSX102.gar.corp.intel.com>
References: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20160120060848.GA1979@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:60590 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750861AbcATGli convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 01:41:38 -0500
In-Reply-To: <20160120060848.GA1979@malice.jf.intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>



> -----Original Message-----
> From: Darren Hart [mailto:dvhart@infradead.org]
> Sent: Wednesday, January 20, 2016 11:39 AM
> To: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>
> Cc: platform-driver-x86@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
> interfaces
> 
> On Wed, Jan 20, 2016 at 11:34:57AM +0530, Souvik Kumar Chakravarty wrote:
> > This implements debugfs interfaces for reading the telemetry samples
> > from SSRAM and configuring firmware trace verbosity.
> > Interface created under /sys/kernel/debug/telemetry
> > soc_states: SoC Device and Low Power States
> > pss_info: Info from the Primary SubSystem
> > ioss_info: Info from IO SubSusytem
> > pss_trace_verbosity: Read/Modify PSS F/W trace verbosity
> > ioss_trace_verbosity: Read/Modify IOSS F/W trace verbosity.
> >
> > Signed-off-by: Souvik Kumar Chakravarty
> > <souvik.k.chakravarty@intel.com>
> >
> > ---
> > Change in v5: Fix warning when compiling with CONFIG_PM_SLEEP
> > underfined
> 
> I've just sent the last version to Linus unfortunately. Please send this fix as a
> separate patch on top of the latest series and I'll include in a follow-up "fixes"
> series prior to 4.5 release.
OK I will send a fix.
> 
> --
> Darren Hart
> Intel Open Source Technology Center
