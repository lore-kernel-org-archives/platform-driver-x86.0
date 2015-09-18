From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 1/1] toshiba_acpi: Remove unneeded u32 variables from
 *setup_keyboard
Date: Fri, 18 Sep 2015 14:48:32 -0700
Message-ID: <20150918214832.GK66179@vmdeb7>
References: <1441819810-11762-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50020 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753353AbbIRVse (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 18 Sep 2015 17:48:34 -0400
Content-Disposition: inline
In-Reply-To: <1441819810-11762-1-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 09, 2015 at 11:30:08AM -0600, Azael Avalos wrote:
> The function toshiba_acpi_setup_keyboard currently has two u32 variables
> used to store the Hotkey Event Type and the result of the HCI_SYSTEM_EVENT
> query.
> 
> This patch removes those two variables, as we already have a global
> variable named "hotkey_event_type" and the result of the HCI_SYSTEM_EVENT
> query can be checked directly from the function.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

...

>  		goto err_free_dev;
> @@ -2443,12 +2440,10 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>  	 * Determine hotkey query interface. Prefer using the INFO
>  	 * method when it is available.
>  	 */
> -	if (acpi_has_method(dev->acpi_dev->handle, "INFO"))
> +	if (acpi_has_method(dev->acpi_dev->handle, "INFO")) {
>  		dev->info_supported = 1;
> -	else {
> -		hci_result = hci_write(dev, HCI_SYSTEM_EVENT, 1);
> -		if (hci_result == TOS_SUCCESS)
> -			dev->system_event_supported = 1;
> +	} else if (hci_write(dev, HCI_SYSTEM_EVENT, 1) == TOS_SUCCESS)

Ahem.

Missing the brace at the end and wreaking havoc on the poor compiler!

-- 
Darren Hart
Intel Open Source Technology Center
