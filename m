From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 1/1] Introduce Intel RAPL cooling device driver
Date: Tue, 02 Apr 2013 14:47:35 -0700
Message-ID: <515B51F7.6070901@infradead.org>
References: <1364940936-20846-1-git-send-email-jacob.jun.pan@linux.intel.com> <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1364940936-20846-2-git-send-email-jacob.jun.pan@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacob Pan <jacob.jun.pan@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Zhang Rui <rui.zhang@intel.com>, Rafael Wysocki <rafael.j.wysocki@intel.com>, Len Brown <len.brown@intel.com>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, Arjan van de Ven <arjan@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On 04/02/13 15:15, Jacob Pan wrote:
> diff --git a/drivers/platform/x86/intel_rapl.c b/drivers/platform/x86/intel_rapl.c
> new file mode 100644
> index 0000000..56ee928
> --- /dev/null
> +++ b/drivers/platform/x86/intel_rapl.c
> @@ -0,0 +1,1323 @@
> +/*
> + *  intel_rapl.c - Intel Running Average Power Limit Driver for MSR based
> + *                 RAPL interface
> + *
> + *  Copyright (c) 2013, Intel Corporation.
> + * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +#include <linux/sysfs.h>
> +

> +#include "../../../fs/sysfs/sysfs.h"


What does this driver need from ^^^^^^ that file, which says:

 * fs/sysfs/sysfs.h - sysfs internal header file

and should that be moved to include/linux/sysfs.h ?


-- 
~Randy
