From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v5 4/4] platform:x86: Add Intel Telemetry Debugfs
 interfaces
Date: Tue, 19 Jan 2016 22:08:48 -0800
Message-ID: <20160120060848.GA1979@malice.jf.intel.com>
References: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:55332 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758112AbcATGIv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 20 Jan 2016 01:08:51 -0500
Content-Disposition: inline
In-Reply-To: <1453269897-14601-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jan 20, 2016 at 11:34:57AM +0530, Souvik Kumar Chakravarty wrote:
> This implements debugfs interfaces for reading the telemetry
> samples from SSRAM and configuring firmware trace verbosity.
> Interface created under /sys/kernel/debug/telemetry
> soc_states: SoC Device and Low Power States
> pss_info: Info from the Primary SubSystem
> ioss_info: Info from IO SubSusytem
> pss_trace_verbosity: Read/Modify PSS F/W trace verbosity
> ioss_trace_verbosity: Read/Modify IOSS F/W trace verbosity.
> 
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
> 
> ---
> Change in v5: Fix warning when compiling with CONFIG_PM_SLEEP underfined

I've just sent the last version to Linus unfortunately. Please send this fix as
a separate patch on top of the latest series and I'll include in a follow-up
"fixes" series prior to 4.5 release.

-- 
Darren Hart
Intel Open Source Technology Center
