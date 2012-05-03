From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] toshiba_acpi: Add SCI operations and adapt Illumination
 code
Date: Thu, 3 May 2012 16:50:33 -0500
Message-ID: <20120503215033.GF23573@thinkpad-t410>
References: <CAGdLNWGawHgHRCk0h9bVSZkf+v-M44WcqzhT6XaQORSKdu0QVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57016 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754455Ab2ECVug (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 3 May 2012 17:50:36 -0400
Content-Disposition: inline
In-Reply-To: <CAGdLNWGawHgHRCk0h9bVSZkf+v-M44WcqzhT6XaQORSKdu0QVw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thu, May 03, 2012 at 02:46:56PM -0600, Azael Avalos wrote:
> SCI stands for Software Configuration Interface and
> it is supposed to be present on all Toshiba models.
> 
> Illumination code is now adapted to use SCI calls and
> is not registered unless the SCI is present.
> 
> Signed-off-by: Azael <coproscefalo@gmail.com>

One tiny little style problem, otherwise this looks okay to me.

Also worth noting is that I tested an earlier but nearly identical
version of this patch on an NB505 (no illumination support) and saw no
adverse effects.

> @@ -1099,6 +1127,14 @@ static int __devinit toshiba_acpi_add(struct
> acpi_device *acpi_dev)
>  	dev->method_hci = hci_method;
>  	acpi_dev->driver_data = dev;
> 
> +	/* Open Toshiba SCI, if present */
> +	ret = sci_open(dev);
> +	if (ret == 0) {
> +		pr_info("Toshiba SCI could not be opened.\n");
> +		dev->sci_opened = 0;
> +	} else
> +		dev->sci_opened = 1;
> +

Kernel style dictates that when one branch of a conditional has braces,
all other branches should also have braces.
