From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH v2] acer-wmi: No wifi rfkill on Lenovo machines
Date: Fri, 03 Feb 2012 16:55:51 +0800
Message-ID: <4F2BA117.3070601@canonical.com>
References: <1327546404.15260.18.camel@linux-s257.site> <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:57081 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754997Ab2BCI4A (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Feb 2012 03:56:00 -0500
In-Reply-To: <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: joeyli <jlee@suse.com>
Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>

Two modification.
 * Check quirks also.
 * for static variable, no need to set to 0 as initial value.


On 02/03/2012 04:46 PM, Ike Panhc wrote:
> We have several reports which says acer-wmi is loaded on ideapads
> and register rfkill for wifi which can not be unblocked.
> 
> Since ideapad-laptop also register rfkill for wifi and it works
> reliably, it will be fine acer-wmi is not going to register rfkill
> for wifi once VPC2004 is found.
> 
> Also put IBM0068/LEN0068 in the list. Though thinkpad_acpi has no
> wifi rfkill capability, there are reports which says acer-wmi also
> block wireless on Thinkpad E520/E420.
> 
> Signed-off-by: Ike Panhc <ike.pan@canonical.com>
> ---
>  drivers/platform/x86/acer-wmi.c |   30 +++++++++++++++++++++++++++++-
>  1 files changed, 29 insertions(+), 1 deletions(-)
> 
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
> index b848277..1e5290b 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -679,6 +679,32 @@ static acpi_status AMW0_find_mailled(void)
>  	return AE_OK;
>  }
>  
> +static int AMW0_set_cap_acpi_check_device_found;
> +
> +static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
> +	u32 level, void *context, void **retval)
> +{
> +	AMW0_set_cap_acpi_check_device_found = 1;
> +	return AE_OK;
> +}
> +
> +static const struct acpi_device_id norfkill_ids[] = {
> +	{ "VPC2004", 0},
> +	{ "IBM0068", 0},
> +	{ "LEN0068", 0},
> +	{ "", 0},
> +};
> +
> +static int AMW0_set_cap_acpi_check_device(void)
> +{
> +	const struct acpi_device_id *id;
> +
> +	for (id = norfkill_ids; id->id[0]; id++)
> +		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
> +				NULL, NULL);
> +	return AMW0_set_cap_acpi_check_device_found;
> +}
> +
>  static acpi_status AMW0_set_capabilities(void)
>  {
>  	struct wmab_args args;
> @@ -692,7 +718,9 @@ static acpi_status AMW0_set_capabilities(void)
>  	 * work.
>  	 */
>  	if (wmi_has_guid(AMW0_GUID2)) {
> -		interface->capability |= ACER_CAP_WIRELESS;
> +		if ((quirks != &quirk_unknown) ||
> +		    !AMW0_set_cap_acpi_check_device())
> +			interface->capability |= ACER_CAP_WIRELESS;
>  		return AE_OK;
>  	}
>  
