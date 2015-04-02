From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 59/86] x86/thinkpad_acpi: use uapi/linux/pci_ids.h
 directly
Date: Wed, 1 Apr 2015 22:14:49 -0700
Message-ID: <20150402051449.GE37152@fury.dvhart.com>
References: <1427635734-24786-1-git-send-email-mst@redhat.com>
 <1427635734-24786-60-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:42404 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbbDBFOv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Apr 2015 01:14:51 -0400
Content-Disposition: inline
In-Reply-To: <1427635734-24786-60-git-send-email-mst@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sun, Mar 29, 2015 at 03:41:54PM +0200, Michael S. Tsirkin wrote:
> Header moved from linux/pci_ids.h to uapi/linux/pci_ids.h,
> use the new header directly so we can drop
> the wrapper in include/linux/pci_ids.h.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

This isn't in mainline yet, so I presume whoever is pushing the move to next
will pick this up as well and keep it all together.

Acked-by: Darren Hart <dvhart@linux.intel.com>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 3b8ceee..f1ac982 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -77,7 +77,7 @@
>  #include <linux/jiffies.h>
>  #include <linux/workqueue.h>
>  #include <linux/acpi.h>
> -#include <linux/pci_ids.h>
> +#include <uapi/linux/pci_ids.h>
>  #include <linux/thinkpad_acpi.h>
>  #include <sound/core.h>
>  #include <sound/control.h>
> -- 
> MST
> 
> 

-- 
Darren Hart
Intel Open Source Technology Center
