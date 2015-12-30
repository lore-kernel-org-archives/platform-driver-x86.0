From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v2 4/5] platform:x86: Add Intel Telemetry Debugfs interfaces
Date: Wed, 30 Dec 2015 03:12:09 +0100
Message-ID: <4325247.Z0uDHDCMpF@vostro.rjw.lan>
References: <1450867456-11366-1-git-send-email-souvik.k.chakravarty@intel.com> <20151230005005.GA29978@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:51280 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753903AbbL3Blj (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 20:41:39 -0500
In-Reply-To: <20151230005005.GA29978@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Tuesday, December 29, 2015 04:50:05 PM Darren Hart wrote:
> On Wed, Dec 23, 2015 at 04:14:16PM +0530, Souvik Kumar Chakravarty wrote:
> > This implements debugfs interfaces for reading the telemetry
> > samples from SSRAM and configuring firmware trace verbosity.
> > Interface created under /sys/kernel/debug/telemetry
> 
> What was the rationale for placing this under /sys/kernel/debug/telemetry,
> instead of /sys/power/telemetry ?
> 
> Rafael, would you like to weigh in on this series? This builds on top of
> Qipeng's punit driver queued in my tree for 4.5.

Well, may I see the whole series?

Thanks,
Rafael
