From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/2] platform/x86: dell-*wmi*: Relay failed initial probe
 to dependent drivers
Date: Thu, 9 Nov 2017 17:02:49 +0100
Message-ID: <20171109160249.jjiros7c4z6f76wr@pali>
References: <cover.1509725778.git.mario.limonciello@dell.com>
 <6312b76d08d3b6b5562c773fce8e13d85036ddd5.1509725778.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:47565 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752861AbdKIQCw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Nov 2017 11:02:52 -0500
Content-Disposition: inline
In-Reply-To: <6312b76d08d3b6b5562c773fce8e13d85036ddd5.1509725778.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

On Friday 03 November 2017 11:27:22 Mario Limonciello wrote:
> dell-wmi and dell-smbios-wmi are dependent upon dell-wmi-descriptor
> finishing probe successfully to probe themselves.
> 
> Currently if dell-wmi-descriptor fails probing in a non-recoverable way
> (such as invalid header) dell-wmi and dell-smbios-wmi will continue to
> try to redo probing due to deferred probing.
> 
> To solve this have the dependent drivers query the dell-wmi-descriptor
> driver whether the descriptor has been determined valid. The possible
> results are:
> -EPROBE_DEFER: Descriptor not yet probed, dependent driver should wait
>  and use deferred probing
> < 0: Descriptor probed, invalid.  Dependent driver should return an
>  error.
> 0: Successful descriptor probe, dependent driver can continue
> 
> Successful descriptor probe still doesn't mean that the descriptor driver
> is necessarily bound at the time of initialization of dependent driver.
> Userspace can unbind the driver, so all methods used from driver
> should still be verified to return success values otherwise deferred
> probing be used.

Darren, Andy, any comments on this patch?

I think now it should work also those corner, but legit cases.

> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios-wmi.c     |  4 ++++
>  drivers/platform/x86/dell-wmi-descriptor.c | 11 +++++++++++
>  drivers/platform/x86/dell-wmi-descriptor.h |  7 +++++++
>  drivers/platform/x86/dell-wmi.c            |  5 +++++
>  4 files changed, 27 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
> index 35c13815b24c..3fa53fa174b2 100644
> --- a/drivers/platform/x86/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell-smbios-wmi.c
> @@ -151,6 +151,10 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev)
>  	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
>  		return -ENODEV;
>  
> +	ret = dell_wmi_get_descriptor_valid();
> +	if (ret)
> +		return ret;
> +
>  	priv = devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv),
>  			    GFP_KERNEL);
>  	if (!priv)
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.c b/drivers/platform/x86/dell-wmi-descriptor.c
> index 28ef5f37cfbf..e7f4c3a7bfc4 100644
> --- a/drivers/platform/x86/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell-wmi-descriptor.c
> @@ -26,9 +26,16 @@ struct descriptor_priv {
>  	u32 interface_version;
>  	u32 size;
>  };
> +static int descriptor_valid = -EPROBE_DEFER;
>  static LIST_HEAD(wmi_list);
>  static DEFINE_MUTEX(list_mutex);
>  
> +int dell_wmi_get_descriptor_valid(void)
> +{
> +	return descriptor_valid;
> +}
> +EXPORT_SYMBOL_GPL(dell_wmi_get_descriptor_valid);
> +
>  bool dell_wmi_get_interface_version(u32 *version)
>  {
>  	struct descriptor_priv *priv;
> @@ -91,6 +98,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
>  	if (obj->type != ACPI_TYPE_BUFFER) {
>  		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
>  		ret = -EINVAL;
> +		descriptor_valid = ret;
>  		goto out;
>  	}
>  
> @@ -102,6 +110,7 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
>  			"Dell descriptor buffer has unexpected length (%d)\n",
>  			obj->buffer.length);
>  		ret = -EINVAL;
> +		descriptor_valid = ret;
>  		goto out;
>  	}
>  
> @@ -111,8 +120,10 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev)
>  		dev_err(&wdev->dev, "Dell descriptor buffer has invalid signature (%8ph)\n",
>  			buffer);
>  		ret = -EINVAL;
> +		descriptor_valid = ret;
>  		goto out;
>  	}
> +	descriptor_valid = 0;
>  
>  	if (buffer[2] != 0 && buffer[2] != 1)
>  		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
> diff --git a/drivers/platform/x86/dell-wmi-descriptor.h b/drivers/platform/x86/dell-wmi-descriptor.h
> index 5f7b69c2c83a..776cddd5e135 100644
> --- a/drivers/platform/x86/dell-wmi-descriptor.h
> +++ b/drivers/platform/x86/dell-wmi-descriptor.h
> @@ -15,6 +15,13 @@
>  
>  #define DELL_WMI_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>  
> +/* possible return values:
> + *  -EPROBE_DEFER: probing for dell-wmi-descriptor not yet run
> + *  0: valid descriptor, successfully probed
> + *  < 0: invalid descriptor, don't probe dependent devices
> + */
> +int dell_wmi_get_descriptor_valid(void);
> +
>  bool dell_wmi_get_interface_version(u32 *version);
>  bool dell_wmi_get_size(u32 *size);
>  
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index 54321080a30d..bb7c1e681792 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -655,10 +655,15 @@ static int dell_wmi_events_set_enabled(bool enable)
>  static int dell_wmi_probe(struct wmi_device *wdev)
>  {
>  	struct dell_wmi_priv *priv;
> +	int ret;
>  
>  	if (!wmi_has_guid(DELL_WMI_DESCRIPTOR_GUID))
>  		return -ENODEV;

Just one suggestion, is above check still needed in dell-wmi.c code?
I think that now it should be job of dell_wmi_get_descriptor_valid()
function to fully validate if dell wmi descriptor driver is able to
provide all needed information for dell-wmi driver.

> +	ret = dell_wmi_get_descriptor_valid();
> +	if (ret)
> +		return ret;
> +
>  	priv = devm_kzalloc(
>  		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
>  	if (!priv)

-- 
Pali Rohár
pali.rohar@gmail.com
