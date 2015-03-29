From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH 59/86] x86/thinkpad_acpi: use uapi/linux/pci_ids.h directly
Date: Sun, 29 Mar 2015 18:02:57 -0300
Message-ID: <1427662977.3836652.246751525.05FC0E4D@webmail.messagingengine.com>
References: <1427635734-24786-1-git-send-email-mst@redhat.com>
 <1427635734-24786-60-git-send-email-mst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:36832 "EHLO
	out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752455AbbC2VC6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 29 Mar 2015 17:02:58 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 8F8AE20CF3
	for <platform-driver-x86@vger.kernel.org>; Sun, 29 Mar 2015 17:02:54 -0400 (EDT)
In-Reply-To: <1427635734-24786-60-git-send-email-mst@redhat.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Sun, Mar 29, 2015, at 10:41, Michael S. Tsirkin wrote:
> Header moved from linux/pci_ids.h to uapi/linux/pci_ids.h,
> use the new header directly so we can drop
> the wrapper in include/linux/pci_ids.h.
> 
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
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

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
