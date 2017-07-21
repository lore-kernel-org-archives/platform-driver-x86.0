From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: intel-vbtn: reduce unnecessary messages
 for normal users
Date: Fri, 21 Jul 2017 16:16:20 -0700
Message-ID: <20170721231620.GB7888@fury>
References: <1500609408-30745-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:42198 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753111AbdGUXQZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jul 2017 19:16:25 -0400
Content-Disposition: inline
In-Reply-To: <1500609408-30745-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, rjw@rjwysocki.net

On Thu, Jul 20, 2017 at 08:56:48PM -0700, Alex Hung wrote:
> Unsupported events is only useful for developers and does not meaningful
> for users. Using dev_dbg makes more sense and reduces noise in kernel
> messages.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/intel-vbtn.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 61f1063..10f92ac 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -83,7 +83,7 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>  	} else if (sparse_keymap_report_event(priv->input_dev, event, 1, true)) {
>  		return;
>  	}
> -	dev_info(&device->dev, "unknown event index 0x%x\n", event);
> +	dev_dbg(&device->dev, "unknown event index 0x%x\n", event);

info is the most common log level for these events in the platform
driver x86 subsystem per 'git grep -i "unknown event"'.

My take on this is that we want these to be reported by users, rather
than rely on developers to find them all - especially as the developers
only see a fraction of the affected hardware.

Are you finding these to be causing a problem / or producing really
excessive log messages?

Andy, what are your thoughts?

>  }
>  
>  static int intel_vbtn_probe(struct platform_device *device)
> -- 
> 2.7.4
> 
> 

-- 
Darren Hart
VMware Open Source Technology Center
