From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-hid: add a workaround to ignore an event after
 waking up from S4.
Date: Mon, 28 Mar 2016 10:01:48 -0700
Message-ID: <20160328170148.GB3668@dvhart-mobl5.amr.corp.intel.com>
References: <1458547722-32663-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from [198.137.202.9] ([198.137.202.9]:42572 "EHLO
	bombadil.infradead.org" rhost-flags-FAIL-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1752852AbcC1REO (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2016 13:04:14 -0400
Content-Disposition: inline
In-Reply-To: <1458547722-32663-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org

On Mon, Mar 21, 2016 at 04:08:42PM +0800, Alex Hung wrote:
> This is the same as the original workaround from S3 but for S4.  Without
> this workaround, a rfkill event will be received and it will toggle
> wireless devices when radio hotkey is not pressed.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>
> ---
>  drivers/platform/x86/intel-hid.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index e20f23e..4ad57b9 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -91,6 +91,8 @@ static int intel_hid_pl_resume_handler(struct device *device)
>  }
>  
>  static const struct dev_pm_ops intel_hid_pl_pm_ops = {
> +	.freeze  = intel_hid_pl_suspend_handler,
> +	.restore  = intel_hid_pl_resume_handler,
>  	.suspend  = intel_hid_pl_suspend_handler,
>  	.resume  = intel_hid_pl_resume_handler,
>  };

Thanks Alex, queued to "fixes" for the 4.6-rc cycle.

-- 
Darren Hart
Intel Open Source Technology Center
