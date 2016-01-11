From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 1/5] platform:x86: Add Intel Telemetry Core Driver
Date: Mon, 11 Jan 2016 10:22:34 -0800
Message-ID: <20160111182234.GB10643@malice.jf.intel.com>
References: <1452157529-10627-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54414 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758363AbcAKSWh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 11 Jan 2016 13:22:37 -0500
Content-Disposition: inline
In-Reply-To: <1452157529-10627-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com, david.ginat@intel.com

On Thu, Jan 07, 2016 at 02:35:29PM +0530, Souvik Kumar Chakravarty wrote:
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
> ---
>  arch/x86/include/asm/intel_telemetry.h      |  147 +++++++++
>  drivers/platform/x86/intel_telemetry_core.c |  464 +++++++++++++++++++++++++++
>  2 files changed, 611 insertions(+)
>  create mode 100644 arch/x86/include/asm/intel_telemetry.h
>  create mode 100644 drivers/platform/x86/intel_telemetry_core.c
> 
> diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
> new file mode 100644
> index 0000000..ed65fe7
> --- /dev/null
> +++ b/arch/x86/include/asm/intel_telemetry.h

This file doesn't exist yet, and the compile fails with just this patch applied.

Souvik, please test each patch individually. The idea is to add independent
functional blocks such that they are easier to understand and review, but they
must be complete and cannot break the build.

Typically this would be something more like:

1 core
2 platform
3 debugfs

The MAINTAINERS and Makefile should be changed within each patch for the files
they affect (checkpatch enforces MAINTAIENRS).

It still won't build after patch 2/5 when the Makefile target is introduced.

-- 
Darren Hart
Intel Open Source Technology Center
