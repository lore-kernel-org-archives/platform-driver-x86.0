From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v3 4/5] toshiba_acpi: Remove unnecessary checks and
 returns in HCI/SCI functions
Date: Wed, 5 Aug 2015 13:21:34 -0700
Message-ID: <20150805202134.GB12131@vmdeb7>
References: <1438401496-27744-1-git-send-email-coproscefalo@gmail.com>
 <1438401496-27744-5-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58104 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753433AbbHEUU4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 5 Aug 2015 16:20:56 -0400
Content-Disposition: inline
In-Reply-To: <1438401496-27744-5-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> @@ -1131,14 +1055,10 @@ static int toshiba_usb_three_set(struct toshiba_acpi_dev *dev, u32 state)
>  
>  	result = sci_write(dev, SCI_USB_THREE, state);
>  	sci_close(dev);
> -	if (result == TOS_FAILURE) {
> +	if (result == TOS_FAILURE)
>  		pr_err("ACPI call to set USB 3 failed\n");
> -		return -EIO;
> -	} else if (result == TOS_NOT_SUPPORTED) {
> +	else if (result == TOS_NOT_SUPPORTED)
>  		return -ENODEV;
> -	} else if (result == TOS_INPUT_DATA_ERROR) {
> -		return -EIO;
> -	}
>  
>  	return (result == TOS_SUCCESS || result == TOS_SUCCESS2) 0 : -EIO;

Hrm... the above line cause patch application failure via git (note the
missing ? before the '0 : -EIO;'). This never existed upstream so far as
I can determine.

It applied with some fuzz manually, but I'm concerned about how this
happened.  Did you have a dirty tree when you prepared these patches
perhaps?

-- 
Darren Hart
Intel Open Source Technology Center
