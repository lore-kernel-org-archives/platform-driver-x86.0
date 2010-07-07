From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH v2] panasonic-laptop: fix acpi_pcc_write_sset return value
Date: Tue, 6 Jul 2010 17:29:52 -0700
Message-ID: <20100707002952.GA7035@core.coreip.homeip.net>
References: <1278462108.12801.23.camel@mola>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:47150 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755953Ab0GGAaD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 6 Jul 2010 20:30:03 -0400
Content-Disposition: inline
In-Reply-To: <1278462108.12801.23.camel@mola>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Harald Welte <laforge@gnumonks.org>, Matthew Garrett <mjg@redhat.com>, Richard Purdie <rpurdie@linux.intel.com>, =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>, Jiri Kosina <jkosina@suse.cz>, platform-driver-x86@vger.kernel.org

On Wed, Jul 07, 2010 at 08:21:48AM +0800, Axel Lin wrote:
> In current implementation, acpi_pcc_write_sset return 1
> if write is successful, 0 if write is failed.
> But all the callers consider acpi_pcc_write_sset return 0
> if write is successful and return negtive if write is failed.
> 
> This patch changes the implementation of acpi_pcc_write_sset to
> return 0 if write is successful, -EIO if write is failed.
> 
> Signed-off-by: Axel Lin <axel.lin@gmail.com>
> ---
>  drivers/platform/x86/panasonic-laptop.c |    7 ++-----
>  1 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
> index 2fb9a32..ec01c3d 100644
> --- a/drivers/platform/x86/panasonic-laptop.c
> +++ b/drivers/platform/x86/panasonic-laptop.c
> @@ -248,7 +248,7 @@ static int acpi_pcc_write_sset(struct pcc_acpi *pcc, int func, int val)
>  	status = acpi_evaluate_object(pcc->handle, METHOD_HKEY_SSET,
>  				      &params, NULL);
>  
> -	return status == AE_OK;
> +	return (status == AE_OK) ? 0 : -EIO;
>  }
>  
>  static inline int acpi_pcc_get_sqty(struct acpi_device *device)
> @@ -586,7 +586,6 @@ static int acpi_pcc_init_input(struct pcc_acpi *pcc)
>  static int acpi_pcc_hotkey_resume(struct acpi_device *device)
>  {
>  	struct pcc_acpi *pcc = acpi_driver_data(device);
> -	acpi_status status = AE_OK;
>  
>  	if (device == NULL || pcc == NULL)
>  		return -EINVAL;

Looks good, but why don't you also kill these useless checks while you
are at it?  Otherwise:

Acked-by: Dmitry Torokhov <dtor@mail.ru>

Thanks.

-- 
Dmitry
