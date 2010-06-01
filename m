From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Vibrator Driver for Intel MID Platforms
Date: Tue, 1 Jun 2010 14:06:43 +0100
Message-ID: <20100601130643.GA6849@srcf.ucam.org>
References: <20100601115558.23256.16674.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:37371 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756098Ab0FANGq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 1 Jun 2010 09:06:46 -0400
Content-Disposition: inline
In-Reply-To: <20100601115558.23256.16674.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Alan Cox <alan@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jun 01, 2010 at 12:56:46PM +0100, Alan Cox wrote:
> From: Kalhan Trisal <kalhan.trisal@intel.com>
> 
> This patch provides support for the MID vibrator can be switched
> on/off using sysfs interfaces.

Looking through the kernel, it seems that we've got there main 
approaches to vibrator control - sysfs with a "speed" attribute, an 
input device using the force feedback ioctls or something that's plumbed 
through the sound codec. While the absence of any consistency here is 
obviously a problem, I'd prefer not to add a fourth - can you at least 
make the sysfs attribute "speed" (with it accepting only 0 and 1 if you 
don't have any way to control the hardware beyond on and off) so it's 
compatible with one of the existing implementations?

> +/*
> + *	If the PMIC hasn't been discovered or one is not found then
> + *	the calls will error for us.

Can't you do this at probe time?

> +		if (intel_scu_ipc_iowrite8(0x49, 0xAD))
> +			return -EINVAL;
> +	} else  {
> +		if (intel_scu_ipc_iowrite8(0x49, 0x14))
> +			return -EINVAL;

Is there any significance to 0xAD and 0x14? Is this register specific to 
the vibrator?

Otherwise, looks good.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
