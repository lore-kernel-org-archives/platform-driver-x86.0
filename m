From: Mattia Dongili <malattia@linux.it>
Subject: Re: [patch 4/4 v2] sony-laptop: potential null dereference
Date: Mon, 28 Feb 2011 06:06:06 +0900
Message-ID: <20110227210606.GG29319@kamineko.org>
References: <20110226125611.GL18043@bicker>
 <20110227122027.GD29319@kamineko.org>
 <20110227141238.GU18043@bicker>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from static-220-247-10-204.b-man.svips.gol.ne.jp ([220.247.10.204]:51963
	"EHLO smtp.kamineko.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078Ab1B0VGI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 27 Feb 2011 16:06:08 -0500
Content-Disposition: inline
In-Reply-To: <20110227141238.GU18043@bicker>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dan Carpenter <error27@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Matthew,

could you pick this and the other 3 up for next?

Thanks!

On Sun, Feb 27, 2011 at 05:13:25PM +0300, Dan Carpenter wrote:
> In the original code, if "device_enum" was NULL then it would
> dereference it when it printed the error message.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Mattia Dongili <malattia@linux.it>

> ---
> v2:  Fixed the error message.
> 
> diff --git a/drivers/platform/x86/sony-laptop.c b/drivers/platform/x86/sony-laptop.c
> index 0db9049..c24aa4a 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -1311,7 +1311,11 @@ static void sony_nc_rfkill_setup(struct acpi_device *device)
>  	}
>  
>  	device_enum = (union acpi_object *) buffer.pointer;
> -	if (!device_enum || device_enum->type != ACPI_TYPE_BUFFER) {
> +	if (!device_enum) {
> +		pr_err(DRV_PFX "No SN06 return object.");
> +		goto out_no_enum;
> +	}
> +	if (device_enum->type != ACPI_TYPE_BUFFER) {
>  		pr_err(DRV_PFX "Invalid SN06 return object 0x%.2x\n",
>  				device_enum->type);
>  		goto out_no_enum;
> 
-- 
mattia
:wq!
