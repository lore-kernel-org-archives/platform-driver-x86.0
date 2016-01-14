From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 0/4] Add Intel Telemetry Support
Date: Thu, 14 Jan 2016 14:38:59 -0800
Message-ID: <20160114223859.GD1989@malice.jf.intel.com>
References: <1452594613-20409-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:37341 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755361AbcANWjE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 14 Jan 2016 17:39:04 -0500
Content-Disposition: inline
In-Reply-To: <1452594613-20409-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com, david.ginat@intel.com

On Tue, Jan 12, 2016 at 04:00:13PM +0530, Souvik Kumar Chakravarty wrote:
> This set of 4 patches enables PM Telemetry Support for Intel
> Platforms. Intel PM Telemetry is a software mechanism via which
> various SoC PM and performance related parameters like PM counters,
> firmware trace verbosity, the status of different devices inside
> the SoC, etc can be monitored and analyzed.
> The statictics are fetched via IPC from the Punit & PMC firmware
> and hence it depends on the PMC & PUNIT IPC driver. The different
> samples that may be monitored can be configured at runtime via
> exported APIs.
> 
> Currently it supports Intel ApolloLake platform and is intended to
> be extended to future platforms as well.

Thank you for sticking with this and seeing it through Souvik, this was an
unusually long merge process with the dependency on the punit driver and the
changes in underwent.

I have queued this to testing. Pending any issues from the CI robots, it'll hit
next by tomorrow, and still make this merge window.


-- 
Darren Hart
Intel Open Source Technology Center
