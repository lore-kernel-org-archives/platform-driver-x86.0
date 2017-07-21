From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-hid: reduce unnecessary messages for
 normal users
Date: Fri, 21 Jul 2017 16:17:03 -0700
Message-ID: <20170721231703.GC7888@fury>
References: <1500609488-30813-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:40272 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753111AbdGUXRF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jul 2017 19:17:05 -0400
Content-Disposition: inline
In-Reply-To: <1500609488-30813-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net

On Thu, Jul 20, 2017 at 08:58:08PM -0700, Alex Hung wrote:
> Unsupported events is only useful for developers and does not meaningful
> for users. Using dev_dbg makes more sense and reduces noise in kernel
> messages.

Similar thoughts here as to intel-vbtn. Let's discuss on that thread and apply
the same decision here.

> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/intel-hid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 8519e0f..4f70b82 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -219,7 +219,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	if (event != 0xc0) {
>  		if (!priv->array ||
>  		    !sparse_keymap_report_event(priv->array, event, 1, true))
> -			dev_info(&device->dev, "unknown event 0x%x\n", event);
> +			dev_dbg(&device->dev, "unknown event 0x%x\n", event);
>  		return;
>  	}
>  
> @@ -230,7 +230,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	}
>  
>  	if (!sparse_keymap_report_event(priv->input_dev, ev_index, 1, true))
> -		dev_info(&device->dev, "unknown event index 0x%llx\n",
> +		dev_dbg(&device->dev, "unknown event index 0x%llx\n",
>  			 ev_index);
>  }
>  
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
