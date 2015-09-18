From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/4] platform:x86: Add Intel Telemetry Core Driver
Date: Fri, 18 Sep 2015 12:34:41 -0700
Message-ID: <20150918193441.GE66179@vmdeb7>
References: <1442551485-24799-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58605 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753625AbbIRTem (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 15:34:42 -0400
Content-Disposition: inline
In-Reply-To: <1442551485-24799-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com

On Fri, Sep 18, 2015 at 10:14:45AM +0530, Souvik Kumar Chakravarty wrote:
> Intel PM Telemetry is a software mechanism via which various SoC
> PM and performance related parameters like PM counters, firmware
> trace verbosity, the status of different devices inside the SoC, etc
> can be monitored and analyzed. The different samples that may be
> monitored can be configured at runtime via exported APIs.
> 
> This patch adds the telemetry core driver that implements basic
> exported APIs.
> 
> Signed-off-by: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>

Hi Souvik,

Each of these trigger some valid issues (mostly coding style) using checkpatch.pl. Please run
checkpatch.pl before sending patches so we don't have to spend time on things
like comparison ordering, block comment formatting, etc.

In my subsequent review, I will not be commenting on things caught be
checkpatch.pl, please run it and incorporate those fixes in your next revision.

Another note, official Intel guidance is to include "All rights reserved."
following the Intel copyright, typically on the following line. You'll find
numerous examples within the kernel.

-- 
Darren Hart
Intel Open Source Technology Center
