From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH v2 2/2] Telemetry: remove redundant macro definition
Date: Fri, 21 Jul 2017 03:15:22 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB462E90E3F@BGSMSX102.gar.corp.intel.com>
References: <1500560474-24268-1-git-send-email-rajneesh.bhardwaj@intel.com>
 <1500560474-24268-2-git-send-email-rajneesh.bhardwaj@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:24118 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750860AbdGUDP1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2017 23:15:27 -0400
In-Reply-To: <1500560474-24268-2-git-send-email-rajneesh.bhardwaj@intel.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Cc: "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Murthy, Shanth" <shanth.murthy@intel.com>, "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@intel.com>

Both set of two looks good. +1.

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> x86-owner@vger.kernel.org] On Behalf Of Rajneesh Bhardwaj
> Sent: Thursday, July 20, 2017 7:51 PM
> To: platform-driver-x86@vger.kernel.org
> Cc: dvhart@infradead.org; andy@infradead.org; linux-
> kernel@vger.kernel.org; Murthy, Shanth <shanth.murthy@intel.com>;
> Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; Bhardwaj,
> Rajneesh <rajneesh.bhardwaj@intel.com>
> Subject: [PATCH v2 2/2] Telemetry: remove redundant macro definition
> 
> Telemetry driver includes intel_telemetry.h which defines
> TELEM_MAX_OS_ALLOCATED_EVENTS already.
> 
> Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
> ---
>  drivers/platform/x86/intel_telemetry_pltdrv.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_telemetry_pltdrv.c
> b/drivers/platform/x86/intel_telemetry_pltdrv.c
> index 6393b3b1d5a6..e0424d5a795a 100644
> --- a/drivers/platform/x86/intel_telemetry_pltdrv.c
> +++ b/drivers/platform/x86/intel_telemetry_pltdrv.c
> @@ -46,7 +46,6 @@
>  #define TELEM_SAMPLING_DEFAULT_PERIOD	0xD
> 
>  #define TELEM_MAX_EVENTS_SRAM		28
> -#define TELEM_MAX_OS_ALLOCATED_EVENTS	20
>  #define TELEM_SSRAM_STARTTIME_OFFSET	8
>  #define TELEM_SSRAM_EVTLOG_OFFSET	16
> 
> --
> 2.7.4
