From: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
Subject: Re: [PATCH v2] fujitsu-laptop: remove unnecessary input_free_device
Date: Fri, 2 Jul 2010 17:05:02 +0930 (CST)
Message-ID: <201007020735.o627Z2E1025678@mercury.physics.adelaide.edu.au>
References: <1278055248.12339.5.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelphi.physics.adelaide.edu.au ([129.127.102.1]:35689 "EHLO
	adelphi.physics.adelaide.edu.au" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751805Ab0GBHgD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Jul 2010 03:36:03 -0400
In-Reply-To: <1278055248.12339.5.camel@mola> from "Axel Lin" at Jul 02, 2010 03:20:48 PM
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, platform-driver-x86@vger.kernel.org

Acked-by: Jonathan Woithe <jwoithe@physics.adelaide.edu.au>
 
> input_free_device should only be used if input_register_device()
> was not called yet or if it failed.
> This patch removes unnecessary input_free_device calls.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/fujitsu-laptop.c |    6 ++----
>  1 files changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index e325aeb..4346d26 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -725,6 +725,7 @@ static int acpi_fujitsu_add(struct acpi_device *device)
>  
>  err_unregister_input_dev:
>  	input_unregister_device(input);
> +	input = NULL;
>  err_free_input_dev:
>  	input_free_device(input);
>  err_stop:
> @@ -738,8 +739,6 @@ static int acpi_fujitsu_remove(struct acpi_device *device, int type)
>  
>  	input_unregister_device(input);
>  
> -	input_free_device(input);
> -
>  	fujitsu->acpi_handle = NULL;
>  
>  	return 0;
> @@ -930,6 +929,7 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
>  
>  err_unregister_input_dev:
>  	input_unregister_device(input);
> +	input = NULL;
>  err_free_input_dev:
>  	input_free_device(input);
>  err_free_fifo:
> @@ -953,8 +953,6 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_device *device, int type)
>  
>  	input_unregister_device(input);
>  
> -	input_free_device(input);
> -
>  	kfifo_free(&fujitsu_hotkey->fifo);
>  
>  	fujitsu_hotkey->acpi_handle = NULL;
> -- 
> 1.5.4.3
> 
> 
> 


-- 
* Jonathan Woithe    jwoithe@physics.adelaide.edu.au                        *
*                    http://www.physics.adelaide.edu.au/~jwoithe            *
***-----------------------------------------------------------------------***
** "Time is an illusion; lunchtime doubly so"                              **
*  "...you wouldn't recognize a subtle plan if it painted itself purple and *
*   danced naked on a harpsichord singing 'subtle plans are here again'"    *
