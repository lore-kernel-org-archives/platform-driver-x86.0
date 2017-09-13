From: "Chakravarty, Souvik K" <souvik.k.chakravarty@intel.com>
Subject: RE: [PATCH] drivers:platform/x86:Use ARRAY_SIZE() for the size
 calculation of the array.
Date: Wed, 13 Sep 2017 08:42:47 +0000
Message-ID: <5F7315E704FA0841B5DFCE90329B2BB4661DAC5A@BGSMSX102.gar.corp.intel.com>
References: <1505289772-26045-1-git-send-email-allen.lkml@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:64659 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750931AbdIMImv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2017 04:42:51 -0400
In-Reply-To: <1505289772-26045-1-git-send-email-allen.lkml@gmail.com>
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Allen Pais <allen.lkml@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>

Hi Allen,

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org [mailto:platform-driver-
> x86-owner@vger.kernel.org] On Behalf Of Allen Pais
> Sent: Wednesday, September 13, 2017 1:33 PM
> To: linux-kernel@vger.kernel.org
> Cc: Chakravarty, Souvik K <souvik.k.chakravarty@intel.com>; platform-
> driver-x86@vger.kernel.org; Allen Pais <allen.lkml@gmail.com>
> Subject: [PATCH] drivers:platform/x86:Use ARRAY_SIZE() for the size
> calculation of the array.
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/platform/x86/intel_telemetry_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_telemetry_debugfs.c
> b/drivers/platform/x86/intel_telemetry_debugfs.c
> index d4fc42b..3ccc7ac 100644
> --- a/drivers/platform/x86/intel_telemetry_debugfs.c
> +++ b/drivers/platform/x86/intel_telemetry_debugfs.c
> @@ -76,7 +76,7 @@
>  #define TELEM_IOSS_DX_D0IX_EVTS		25
>  #define TELEM_IOSS_PG_EVTS		30
> 
> -#define TELEM_EVT_LEN(x) (sizeof(x)/sizeof((x)[0]))
> +#define TELEM_EVT_LEN(x) (ARRAY_SIZE(x))
The outer parenthesis seems redundant to me.

> 
>  #define TELEM_DEBUGFS_CPU(model, data) \
>  	{ X86_VENDOR_INTEL, 6, model, X86_FEATURE_ANY, (unsigned
> long)&data}
> --
> 2.7.4

BR,
Souvik
