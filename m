From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Subject: Re: [PATCH] classmate-laptop: Add RFKILL support.
Date: Wed, 09 Jun 2010 11:28:47 +0100
Message-ID: <4C0F6CDF.9060608@tuffmail.co.uk>
References: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:42904 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757391Ab0FIK3H (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Jun 2010 06:29:07 -0400
Received: by wyf28 with SMTP id 28so796079wyf.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Jun 2010 03:29:01 -0700 (PDT)
In-Reply-To: <1272384900-3982-1-git-send-email-cascardo@holoscopio.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
Cc: platform-driver-x86@vger.kernel.org, mjg@redhat.com, don@syst.com.br, johannes@sipsolutions.net, rpurdie@rpsys.net

Thadeu Lima de Souza Cascardo wrote:
> The RFKILL device shares the same ACPI device used for backlight. So, it
> required a new struct sharing both a backlight_device and a rfkill
> device.
> 
> Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
> ---

Apologies for tardiness.  You did ask for review, so I've scanned it for some common rfkill pitfalls.


>  drivers/platform/x86/classmate-laptop.c |  170 +++++++++++++++++++++++++++----
>  1 files changed, 148 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index 7f9e5dd..3bf399f 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c

> +static const struct rfkill_ops cmpc_rfkill_ops = {
> +	.query = cmpc_rfkill_query,
> +	.set_block = cmpc_rfkill_block,
> +};

You said down-thread that firmware does not change the state.  In that case, I believe the query method is unnecessary


 * @query: query the rfkill block state(s) and call exactly one of the
 *	rfkill_set{,_hw,_sw}_state family of functions. Assign this
 *	method if input events can cause hardware state changes to make
 *	the rfkill core query your driver before setting a requested
 *	block.


Generally, the rfkill core caches the soft blocked state.  It doesn't call query() during registration either - it calls set_block() with a default value (usually "unblocked").  query() is only used to minimize a race with the firmware during set_block().


> +	ipml->rf = rfkill_alloc("cmpc_rfkill", &acpi->dev, RFKILL_TYPE_WLAN,
> +				&cmpc_rfkill_ops, acpi->handle);
> +	/* rfkill_alloc may fail if RFKILL is disabled. We should still work
> +	 * anyway. */
> +	if (!IS_ERR(ipml->rf)) {
> +		retval = rfkill_register(ipml->rf);
> +		if (retval) {
> +			rfkill_destroy(ipml->rf);
> +			ipml->rf = NULL;
> +		}
> +	} else {
> +		ipml->rf = NULL;
> +	}

I think the comment is wrong, and so is the code it references.

rfkill_alloc() is documented as returning NULL on failure, not an ERR_PTR.  So you're going to pass NULL into rfkill_register() on allocation failure, which will BUG out.

eeepc_laptop tests for NULL here, not ERR_PTR.

If you look at the implementation when RFKILL is disabled, rfkill_register() is designed to accept  ERR_PTR(-ENODEV) without complaint.  (And the other rfkill functions won't care either; they'll just be completely empty stubs).


Regards
Alan
