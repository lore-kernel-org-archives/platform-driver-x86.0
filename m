From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH] Add OLPC XO-1 rfkill driver
Date: Mon, 4 Oct 2010 18:28:07 +0100
Message-ID: <20101004172807.GA10189@srcf.ucam.org>
References: <20101004171520.4B0189D401B@zog.reactivated.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:45054 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751324Ab0JDR2M (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 4 Oct 2010 13:28:12 -0400
Content-Disposition: inline
In-Reply-To: <20101004171520.4B0189D401B@zog.reactivated.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Daniel Drake <dsd@laptop.org>
Cc: dilinger@queued.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Oct 04, 2010 at 06:15:20PM +0100, Daniel Drake wrote:
> +static int __devinit xo1_rfkill_probe(struct platform_device *pdev)
> +{
> +	struct rfkill *rfk;
> +	int r;
> +
> +	printk(KERN_INFO "%s: loading\n", pdev->name);

Probably don't need this. Otherwise, looks fine.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
