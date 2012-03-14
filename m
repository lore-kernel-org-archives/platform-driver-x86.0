From: Jonathan Nieder <jrnieder@gmail.com>
Subject: [PATCH 3.0.y] acer-wmi: No wifi rfkill on Lenovo machines
Date: Wed, 14 Mar 2012 16:53:27 -0500
Message-ID: <20120314215327.GA1510@burratino>
References: <1327546404.15260.18.camel@linux-s257.site>
 <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:38066 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031069Ab2CNVxe (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 14 Mar 2012 17:53:34 -0400
Content-Disposition: inline
In-Reply-To: <1328258799-19665-1-git-send-email-ike.pan@canonical.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: stable@vger.kernel.org
Cc: Ike Panhc <ike.pan@canonical.com>, joeyli <jlee@suse.com>, Carlos Corbacho <carlos@strangeworlds.co.uk>, mjg@redhat.com, platform-driver-x86@vger.kernel.org, Dmitry Torokhov <dtor@mail.ru>, Corentin Chary <corentincj@iksaif.net>, Thomas Renninger <trenn@suse.de>, Andrey <andrey.k.p@gmail.com>

Hi Greg,

Please consider applying 461e74377cfc (acer-wmi: No wifi rfkill on
Lenovo machines, 2012-02-03) to the 3.2.y and 3.0.y trees.

Ike Panhc wrote:

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

The symptom was that that wifi just doesn't work on these machines
until the acer-wmi driver is unloaded.  Bug was present in
3.1.8 and Ubuntu's 3.0.0-12, possibly on some older kernels, too.

Andrey (cc-ed) confirmed that applying the patch against 3.2.y gets
wifi working again on his Ideapad Z570, so

  Tested-by: Andrey <andrey.k.p@gmail.com> # Ideapad Z570

References:
  http://bugs.debian.org/655941
  http://launchpad.net/bugs/875659
  https://bugzilla.redhat.com/show_bug.cgi?id=674353

Patch left unsnipped for reference.

Thanks,
Jonathan

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
> -- 
> 1.7.5.4
>
