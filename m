From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Wed, 03 Apr 2013 12:24:48 +0200
Message-ID: <1364984688.1830.4.camel@x61.thuisdomein>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com>
	 <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cpsmtpb-ews03.kpnxchange.com ([213.75.39.6]:53024 "EHLO
	cpsmtpb-ews03.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1762371Ab3DCKYu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 3 Apr 2013 06:24:50 -0400
In-Reply-To: <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tue, 2013-04-02 at 15:15 -0700, Jacob Pan wrote:
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -781,4 +781,12 @@ config APPLE_GMUX
>  	  graphics as well as the backlight. Currently only backlight
>  	  control is supported by the driver.
>  
> +config INTEL_RAPL
> +	tristate "Intel RAPL Support"
> +	depends on X86 && THERMAL

drivers/platform/x86/Kconfig is sourced from drivers/platform/Kconfig.
The relevant line is wrapped in an "if X86" and "endif" pair. So X86 is
superfluous here.
"
> +	default y
> +	---help---
> +	  RAPL, AKA, Running Average Power Limit provides mechanisms to enforce
> +	  and monitor per domain power consumption limits of supported Intel CPUs.
> +
>  endif # X86_PLATFORM_DEVICES


Paul Bolle
