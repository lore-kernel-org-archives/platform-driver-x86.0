From: Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: [PATCH 1/3] ideapad: define cfg bits and create sysfs node for
 cfg
Date: Wed, 22 Jun 2011 20:35:23 +0100
Message-ID: <20110622193523.GA8861@srcf.ucam.org>
References: <1308729781-2590-1-git-send-email-ike.pan@canonical.com>
 <1308729943-2624-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from cavan.codon.org.uk ([93.93.128.6]:56594 "EHLO
	cavan.codon.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757971Ab1FVTf3 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2011 15:35:29 -0400
Content-Disposition: inline
In-Reply-To: <1308729943-2624-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ike Panhc <ike.pan@canonical.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wed, Jun 22, 2011 at 04:05:43PM +0800, Ike Panhc wrote:
>  static int __devinit ideapad_acpi_add(struct acpi_device *adevice)
>  {
> -	int ret, i, cfg;
> +	int ret, i;
> +	unsigned long cfg;

You change this to an unsigned long, but you cast it to an int in 
several places. Is that just to avoid casting to a long here?

> -		if (test_bit(ideapad_rfk_data[i].cfgbit, (unsigned long *)&cfg))
> +		if (test_bit(ideapad_rfk_data[i].cfgbit, &cfg))

I think it seems neater the other way around, but don't have terribly 
strong opinions.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
