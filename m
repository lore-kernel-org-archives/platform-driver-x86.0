From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] fujitsu-laptop: remove unnecessary input_free_device
 calls
Date: Thu, 1 Jul 2010 23:20:00 -0700
Message-ID: <20100702061958.GA3691@core.coreip.homeip.net>
References: <1278034977.24246.6.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pv0-f174.google.com ([74.125.83.174]:35279 "EHLO
	mail-pv0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754852Ab0GBGUI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 2 Jul 2010 02:20:08 -0400
Content-Disposition: inline
In-Reply-To: <1278034977.24246.6.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Jonathan Woithe <jwoithe@physics.adelaide.edu.au>, Matthew Garrett <mjg@redhat.com>, Len Brown <len.brown@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, platform-driver-x86@vger.kernel.org

Hi Axel,

On Fri, Jul 02, 2010 at 09:42:57AM +0800, Axel Lin wrote:
> input_free_device should only be used if input_register_device()
> was not called yet or if it failed.
> This patch removes unnecessary input_free_device calls.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/fujitsu-laptop.c |   21 ++++++++-------------
>  1 files changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> index e325aeb..dab1a0e 100644
> --- a/drivers/platform/x86/fujitsu-laptop.c
> +++ b/drivers/platform/x86/fujitsu-laptop.c
> @@ -686,8 +686,10 @@ static int acpi_fujitsu_add(struct acpi_device *device)
>  	set_bit(KEY_UNKNOWN, input->keybit);
>  
>  	error = input_register_device(input);
> -	if (error)
> -		goto err_free_input_dev;
> +	if (error) {
> +		input_free_device(input);
> +		goto err_stop;
> +	}

Instead of using mixed in-line and goto style cleanup I prefer doig the
following:

 err_unregister_input_dev:
	input_unregister_device(input);
	input = NULL; <-- !!!
 err_free_input_dev:
	input_free_device(input);

input_free_device() happily accepts NULL pointers.

Otherwise the patch looks good.

Thanks.

-- 
Dmitry
