From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Tue, 29 Dec 2015 23:13:23 -0800
Message-ID: <20151230071323.GE29978@malice.jf.intel.com>
References: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com>
 <20151230005005.GA29978@malice.jf.intel.com>
 <4325247.Z0uDHDCMpF@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:47103 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093AbbL3HN1 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Dec 2015 02:13:27 -0500
Content-Disposition: inline
In-Reply-To: <4325247.Z0uDHDCMpF@vostro.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Wed, Dec 30, 2015 at 03:12:09AM +0100, Rafael Wysocki wrote:
> On Tuesday, December 29, 2015 04:50:05 PM Darren Hart wrote:
> > On Wed, Dec 23, 2015 at 04:14:16PM +0530, Souvik Kumar Chakravarty wrote:
> > > This implements debugfs interfaces for reading the telemetry
> > > samples from SSRAM and configuring firmware trace verbosity.
> > > Interface created under /sys/kernel/debug/telemetry
> > 
> > What was the rationale for placing this under /sys/kernel/debug/telemetry,
> > instead of /sys/power/telemetry ?
> > 
> > Rafael, would you like to weigh in on this series? This builds on top of
> > Qipeng's punit driver queued in my tree for 4.5.
> 
> Well, may I see the whole series?

Eeek. I see LKML was not Cc'd. Souvik, in the future, please include LKML on Cc
for any patches to the Linux kernel, in addition to the subsystem specific lists
and the maintainers. Also, please include a 0/N cover letter to give the series
a starting point.

Rafael:

1/5: http://www.spinics.net/lists/platform-driver-x86/msg07952.html
2/5: http://www.spinics.net/lists/platform-driver-x86/msg07953.html
3/5: http://www.spinics.net/lists/platform-driver-x86/msg07956.html
4/5: http://www.spinics.net/lists/platform-driver-x86/msg07954.html
5/5: http://www.spinics.net/lists/platform-driver-x86/msg07955.html



-- 
Darren Hart
Intel Open Source Technology Center
