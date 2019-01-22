From: Mattias Jacobsson <2pi@mok.nu>
Subject: Re: [PATCH 1/3] platform/x86: wmi: move struct wmi_device_id to
 mod_devicetable.h
Date: Tue, 22 Jan 2019 21:28:59 +0100
Message-ID: <20190122202859.vpmtekxrklrskaus@mok.nu>
References: <cover.1547827336.git.2pi@mok.nu>
 <271b1e903fa359c1100caba5bfc889183af02bae.1547827336.git.2pi@mok.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <271b1e903fa359c1100caba5bfc889183af02bae.1547827336.git.2pi@mok.nu>
Sender: linux-kernel-owner@vger.kernel.org
To: dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 2pi@mok.nu
List-Id: platform-driver-x86.vger.kernel.org

On 2019-01-19, Mattias Jacobsson wrote:
> In preparation for adding WMI support to MODULE_DEVICE_TABLE() move the
> definition of struct wmi_device_id to mod_devicetable.h and inline
> guid_string in the struct.
> 
> Changing guid_string to an inline char array changes the loop conditions
> when looping over an array of struct wmi_device_id. Therefore update
> wmi_dev_match()'s loop to check for an empty guid_string instead of a
> NULL pointer.
> 
> Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
> ---
>  drivers/platform/x86/wmi.c      |  2 +-
>  include/linux/mod_devicetable.h | 13 +++++++++++++
>  include/linux/wmi.h             |  5 +----
>  3 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index bea35be68706..d7a2f5c8b959 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -768,7 +768,7 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  	const struct wmi_device_id *id = wmi_driver->id_table;
>  
> -	while (id->guid_string) {
> +	while (id->guid_string[0] != '\0') {

While looking through my patchset again I realized that I've inherited a potential
null pointer dereference situation. This is relevant regardless of this patchset
and I've therefore submitted a separate patch for that [1]. Further versions of
this patchset will explicitly depend on [1], as this doesn't require any actual
changes to this patchset, I'll wait for more comments before sending it.

[1]: https://lkml.kernel.org/r/20190122200302.19861-1-2pi@mok.nu

>  		uuid_le driver_guid;
>  
>  		if (WARN_ON(uuid_le_to_bin(id->guid_string, &driver_guid)))
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index f9bd2f34b99f..ccc9bd4f32d2 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -779,4 +779,17 @@ struct typec_device_id {
>  	kernel_ulong_t driver_data;
>  };
>  
> +/* WMI */
> +
> +#define WMI_MODULE_PREFIX	"wmi:"
> +#define WMI_GUID_STRING_LEN	36
> +
> +/**
> + * struct wmi_device_id - WMI device identifier
> + * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> + */
> +struct wmi_device_id {
> +	const char guid_string[WMI_GUID_STRING_LEN+1];
> +};
> +
>  #endif /* LINUX_MOD_DEVICETABLE_H */
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index 4757cb5077e5..592f81afecbb 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -18,6 +18,7 @@
>  
>  #include <linux/device.h>
>  #include <linux/acpi.h>
> +#include <linux/mod_devicetable.h>
>  #include <uapi/linux/wmi.h>
>  
>  struct wmi_device {
> @@ -39,10 +40,6 @@ extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
>  
>  extern int set_required_buffer_size(struct wmi_device *wdev, u64 length);
>  
> -struct wmi_device_id {
> -	const char *guid_string;
> -};
> -
>  struct wmi_driver {
>  	struct device_driver driver;
>  	const struct wmi_device_id *id_table;
> -- 
> 2.20.1
> 

Thanks,
Mattias
