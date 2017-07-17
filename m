From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH 3/3] platform/x86: Add Audio domain PG status events
Date: Mon, 17 Jul 2017 05:18:30 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB462E90061@BGSMSX102.gar.corp.intel.com>
References: <1500033228-634-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <1500033228-634-3-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:42243 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751093AbdGQFSe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 17 Jul 2017 01:18:34 -0400
In-Reply-To: <1500033228-634-3-git-send-email-rajneesh.bhardwaj@intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Murthy, Shanth" <shanth.murthy@intel.com>



> -----Original Message-----
> From: Bhardwaj, Rajneesh
> Sent: Friday, July 14, 2017 5:24 PM
> To: platform-driver-x86@vger.kernel.org
> Cc: dvhart@infradead.org; andy@infradead.org; linux-
> kernel@vger.kernel.org; Murthy, Shanth <shanth.murthy@intel.com>;
> Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Bhardwaj,
> Rajneesh <rajneesh.bhardwaj@intel.com>
> Subject: [PATCH 3/3] platform/x86: Add Audio domain PG status events
> 
> From: "Murthy, Shanth" <shanth.murthy@intel.com>
> 
> This patch adds events to ioss telemetry to read the power gating status for
> the audio domain.
> 
> Signed-off-by: Shanth Murthy <shanth.murthy@intel.com>
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  arch/x86/include/asm/intel_telemetry.h        | 2 +-
>  drivers/platform/x86/intel_telemetry_pltdrv.c | 6 ++++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/intel_telemetry.h
> b/arch/x86/include/asm/intel_telemetry.h
> index 85029b58d0cd..4eeae0a4f9a2 100644
> --- a/arch/x86/include/asm/intel_telemetry.h
> +++ b/arch/x86/include/asm/intel_telemetry.h
> @@ -17,7 +17,7 @@
>  #define INTEL_TELEMETRY_H
> 
>  #define TELEM_MAX_EVENTS_SRAM		28
> -#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
> +#define TELEM_MAX_OS_ALLOCATED_EVENTS	25

This is something that should not be done without testing. There was an understanding to not use more than 20 counters in OS, so that tools like SoCWatch could use the rest 8 without total reconfiguration of the events. With this change we are not leaving much for tools and it may break SoCwatch/IMON or other tools dependent on using just 8. 
The better way for this would be for the userspace tool to configure the extra 5 events via add_config() call and not increase the OS usage ceiling.

Or you could add some more sysfs apis for get/set events and do it via a daemon/script.

<snip>....
