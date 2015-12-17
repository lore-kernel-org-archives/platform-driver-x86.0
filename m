From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] intel-hid: new hid event driver for hotkeys
Date: Thu, 17 Dec 2015 14:15:53 -0800
Message-ID: <20151217221553.GA23048@malice.jf.intel.com>
References: <1450337402-4178-1-git-send-email-alex.hung@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:32832 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752431AbbLQWP4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 17 Dec 2015 17:15:56 -0500
Content-Disposition: inline
In-Reply-To: <1450337402-4178-1-git-send-email-alex.hung@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alex Hung <alex.hung@canonical.com>
Cc: platform-driver-x86@vger.kernel.org, luto@amacapital.net

On Thu, Dec 17, 2015 at 03:30:02PM +0800, Alex Hung wrote:
> This driver supports various hid events including hotkeys.
> Dell XPS 13 9350 requires it for wireless hotkey.
> 
> Andy Lutomirski contributed greatly to this driver.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

Queued for testing.

Andy, please provide your Reviewed-by if you're happy with it.

Alex, just one question maybe you can answer quickly and save me some time
below:


> +static int intel_hid_pl_suspend_handler(struct device *device)
> +{
> +	intel_hid_set_enable(device, 0);
> +	return 0;
> +}
> +
> +static int intel_hid_pl_resume_handler(struct device *device)
> +{
> +	intel_hid_set_enable(device, 1);
> +	return 0;
> +}

Why not propagate the intel_hid_set_enable() return code? Is it because it just
doesn't really impact suspend/resume, even if we do get an error?

-- 
Darren Hart
Intel Open Source Technology Center
