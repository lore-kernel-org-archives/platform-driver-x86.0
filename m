From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform:x86 Remove Monitor MWAIT feature dependency
Date: Tue, 28 Jun 2016 22:23:40 -0700
Message-ID: <20160629052340.GN3837@f23x64.localdomain>
References: <1466665198-14446-1-git-send-email-ong.hock.yu@intel.com>
 <1466665198-14446-2-git-send-email-ong.hock.yu@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:45351 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751266AbcF2FXl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jun 2016 01:23:41 -0400
Content-Disposition: inline
In-Reply-To: <1466665198-14446-2-git-send-email-ong.hock.yu@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ong.hock.yu@intel.com
Cc: souvik.k.chakravarty@intel.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 23, 2016 at 02:59:58PM +0800, ong.hock.yu@intel.com wrote:
> From: "Yu, Ong Hock" <ong.hock.yu@intel.com>
> 
> Telemetry capability does not depend on Monitor MWAIT feature.

Thank you Ong Hock, queued to testing for 4.8.
> 
> Signed-off-by: Yu, Ong Hock <ong.hock.yu@intel.com>
> ---
>  drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
>  drivers/platform/x86/intel_telemetry_pltdrv.c  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c b/drivers/platform/x86/intel_telemetry_debugfs.c
> index f5134ac..d76ee59 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -78,7 +78,7 @@
>  #define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
>  
>  #define TELEM_DEBUGFS_CPU(model, data) \
> -	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (unsigned long)&data}
> +	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data}
>  
>  #define TELEM_CHECK_AND_PARSE_EVTS(EVTID, EVTNUM, BUF, EVTLOG, EVTDAT, MASK) { \
>  	if (evtlog[index].telem_evtid == (EVTID)) { \
> diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c b/drivers/platform/x86/intel_telemetry_pltdrv.c
> index 09c84a2..e62cee9 100644
> --- a/drivers/platform/x86/intel_telemetry_pltdrv.c
> +++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
> @@ -82,7 +82,7 @@
>  #define TELEM_SET_VERBOSITY_BITS(x, y)	((x) |= ((y) << 27))
>  
>  #define TELEM_CPU(model, data) \
> -	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_MWAIT, (unsigned long)&data }
> +	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned long)&data }
>  
>  enum telemetry_action {
>  	TELEM_UPDATE = 0,
> -- 
> 1.9.1
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
