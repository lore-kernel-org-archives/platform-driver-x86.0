From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 1/5] platform:x86: Add Intel Telemetry Core Driver
Date: Tue, 29 Dec 2015 16:50:31 -0800
Message-ID: <20151230005031.GB29978@malice.jf.intel.com>
References: <1450867350-11253-1-git-send-email-souvik.k.chakravarty@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35621 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753863AbbL3Auc (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 29 Dec 2015 19:50:32 -0500
Content-Disposition: inline
In-Reply-To: <1450867350-11253-1-git-send-email-souvik.k.chakravarty@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: platform-driver-x86@vger.kernel.org, srinidhi.kasagar@intel.com, qipeng.zha@intel.com, rajeev.d.muralidhar@intel.com, sukumar.ghorai@intel.com, ong.hock.yu@intel.com, aubrey.li@intel.com

On Wed, Dec 23, 2015 at 04:12:30PM +0530, Souvik Kumar Chakravarty wrote:
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

Qipeng, would you please review this series and confirm that you and Souvik have
aligned on this implementation?


> 
> ---
> Changes in v3:
> * Clean code using checkpatch.pl from Kernel v4.3-rc4
> ---
> Changes in v2:
> * Fix issues in code style, indentation & comments
> * Follow kernel-doc sytle comments
> * Changed Banner to include "All Rights Reserved"
> * Change telemetry_plt_config.telem_in_use type to bool
> * Introduce Default empty platform specific callbacks to remove NULL checks
> * Use pr_fmt in init
> * Change to MODULE_LICENSE to GPL
> ---

...

> +static inline int telemetry_get_pssevtname(enum telemetry_unit telem_unit,
> +					   const char **name, int len)
> +{
> +	struct telemetry_unit_config psscfg;
> +	int i = 0;

It's a minor nit, but i doesn't need to be initialized here or in the function
below as its initial value is set in the for loop.


-- 
Darren Hart
Intel Open Source Technology Center
