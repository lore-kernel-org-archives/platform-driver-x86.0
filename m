From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 3/3] toshiba_acpi: Fix the enabling of the Special
 Functions
Date: Fri, 6 Mar 2015 10:28:21 -0800
Message-ID: <20150306182821.GI19001@vmdeb7>
References: <1424973434-3032-1-git-send-email-coproscefalo@gmail.com>
 <1424973434-3032-4-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:41461 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751418AbbCFS2V (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 6 Mar 2015 13:28:21 -0500
Content-Disposition: inline
In-Reply-To: <1424973434-3032-4-git-send-email-coproscefalo@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Feb 26, 2015 at 10:57:14AM -0700, Azael Avalos wrote:
> Some Toshiba laptops with the "Special Functions" feature enabled
> fail to properly enable such feature unless a specific value is
> used to enable the hotkey events.

The specific value being... HCI_HOTKEY_ENABLE_SPECIAL? And we do this for ALL
systems that support special keys right (and have them enabled)? Not just the
ones that fail to properly enable them?

The above makes it sound like a work around, but nothing in the implementation
suggests that to me. Is this a workaround?

> This patch adds a new function called "*_enable_special_functions",
> that simply makes a call to the HCI_HOTKEY_EVENT call, but this time
> we are using a different parameter to make the "Special Functions"
> mode work as expected.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
>  drivers/platform/x86/toshiba_acpi.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index 10e0773..09c6a2f 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2336,6 +2336,20 @@ static int toshiba_acpi_enable_hotkeys(struct toshiba_acpi_dev *dev)
>  	return 0;
>  }
>  
> +static void toshiba_acpi_enable_special_functions(struct toshiba_acpi_dev *dev)
> +{
> +	u32 result;
> +
> +	/*
> +	 * Re-activate the hotkeys, but this time, we are using the
> +	 * "Special Functions" mode.
> +	 */
> +	result = hci_write1(dev, HCI_HOTKEY_EVENT,
> +		    HCI_HOTKEY_ENABLE_SPECIAL);

One line.


-- 
Darren Hart
Intel Open Source Technology Center
