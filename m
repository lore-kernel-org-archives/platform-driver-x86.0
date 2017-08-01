From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 2/3] platform/dell-wmi: Update
 dell_wmi_check_descriptor_buffer() to new model
Date: Tue, 1 Aug 2017 17:44:57 +0200
Message-ID: <20170801154457.GB25574@pali>
References: <cover.1501601667.git.luto@kernel.org>
 <e941330872d1a0811a390c80aa1fe817ec386d5f.1501601667.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:37695 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbdHAPpA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 11:45:00 -0400
Received: by mail-wr0-f196.google.com with SMTP id 12so1726017wrb.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 01 Aug 2017 08:44:59 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <e941330872d1a0811a390c80aa1fe817ec386d5f.1501601667.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org

On Tuesday 01 August 2017 08:37:27 Andy Lutomirski wrote:
> This converts dell_wmi_check_descriptor_buffer() to the new driver
> model interface and puts the interface version in dell_wmi_priv
> where it belongs.
> 
> Signed-off-by: Andy Lutomirski <luto@kernel.org>

Looks good,

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/dell-wmi.c | 69 +++++++++++++++++++++++------------------
>  1 file changed, 39 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index dad8f4afa17c..28d9f8696081 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -48,7 +48,6 @@ MODULE_LICENSE("GPL");
>  #define DELL_EVENT_GUID "9DBB5994-A997-11DA-B012-B622A1EF5492"
>  #define DELL_DESCRIPTOR_GUID "8D9DDCBC-A997-11DA-B012-B622A1EF5492"
>  
> -static u32 dell_wmi_interface_version;
>  static bool wmi_requires_smbios_request;
>  
>  MODULE_ALIAS("wmi:"DELL_EVENT_GUID);
> @@ -56,6 +55,7 @@ MODULE_ALIAS("wmi:"DELL_DESCRIPTOR_GUID);
>  
>  struct dell_wmi_priv {
>  	struct input_dev *input_dev;
> +	u32 interface_version;
>  };
>  
>  static int __init dmi_matched(const struct dmi_system_id *dmi)
> @@ -348,6 +348,7 @@ static void dell_wmi_process_key(struct wmi_device *wdev, int type, int code)
>  static void dell_wmi_notify(struct wmi_device *wdev,
>  			    union acpi_object *obj)
>  {
> +	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  	u16 *buffer_entry, *buffer_end;
>  	acpi_size buffer_size;
>  	int len, i;
> @@ -376,7 +377,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  	 * So to prevent reading garbage from buffer we will process only first
>  	 * one event on devices with WMI interface version 0.
>  	 */
> -	if (dell_wmi_interface_version == 0 && buffer_entry < buffer_end)
> +	if (priv->interface_version == 0 && buffer_entry < buffer_end)
>  		if (buffer_end > buffer_entry + buffer_entry[0] + 1)
>  			buffer_end = buffer_entry + buffer_entry[0] + 1;
>  
> @@ -626,61 +627,67 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
>   * WMI Interface Version     8       4    <version>
>   * WMI buffer length        12       4    4096
>   */
> -static int dell_wmi_check_descriptor_buffer(void)
> +static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
>  {
> -	struct acpi_buffer out = { ACPI_ALLOCATE_BUFFER, NULL };
> -	union acpi_object *obj;
> -	acpi_status status;
> +	struct dell_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> +	union acpi_object *obj = NULL;
> +	struct wmi_device *desc_dev;
>  	u32 *buffer;
> +	int ret;
>  
> -	status = wmi_query_block(DELL_DESCRIPTOR_GUID, 0, &out);
> -	if (ACPI_FAILURE(status)) {
> -		pr_err("Cannot read Dell descriptor buffer - %d\n", status);
> -		return status;
> +	desc_dev = wmidev_get_other_guid(wdev, DELL_DESCRIPTOR_GUID);
> +	if (!desc_dev) {
> +		dev_err(&wdev->dev, "Dell WMI descriptor does not exist\n");
> +		return -ENODEV;
>  	}
>  
> -	obj = (union acpi_object *)out.pointer;
> +	obj = wmidev_block_query(desc_dev, 0);
>  	if (!obj) {
> -		pr_err("Dell descriptor buffer is empty\n");
> -		return -EINVAL;
> +		dev_err(&wdev->dev, "failed to read Dell WMI descriptor\n");
> +		ret = -EIO;
> +		goto out;
>  	}
>  
>  	if (obj->type != ACPI_TYPE_BUFFER) {
> -		pr_err("Cannot read Dell descriptor buffer\n");
> -		kfree(obj);
> -		return -EINVAL;
> +		dev_err(&wdev->dev, "Dell descriptor has wrong type\n");
> +		ret = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (obj->buffer.length != 128) {
> -		pr_err("Dell descriptor buffer has invalid length (%d)\n",
> +		dev_err(&wdev->dev,
> +			"Dell descriptor buffer has invalid length (%d)\n",
>  			obj->buffer.length);
>  		if (obj->buffer.length < 16) {
> -			kfree(obj);
> -			return -EINVAL;
> +			ret = -EINVAL;
> +			goto out;
>  		}
>  	}
>  
>  	buffer = (u32 *)obj->buffer.pointer;
>  
>  	if (buffer[0] != 0x4C4C4544 && buffer[1] != 0x494D5720)
> -		pr_warn("Dell descriptor buffer has invalid signature (%*ph)\n",
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid signature (%*ph)\n",
>  			8, buffer);
>  
>  	if (buffer[2] != 0 && buffer[2] != 1)
> -		pr_warn("Dell descriptor buffer has unknown version (%d)\n",
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%d)\n",
>  			buffer[2]);
>  
>  	if (buffer[3] != 4096)
> -		pr_warn("Dell descriptor buffer has invalid buffer length (%d)\n",
> +		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
>  			buffer[3]);
>  
> -	dell_wmi_interface_version = buffer[2];
> +	priv->interface_version = buffer[2];
> +	ret = 0;
>  
> -	pr_info("Detected Dell WMI interface version %u\n",
> -		dell_wmi_interface_version);
> +	dev_info(&wdev->dev, "Detected Dell WMI interface version %u\n",
> +		priv->interface_version);
>  
> +out:
>  	kfree(obj);
> -	return 0;
> +	put_device(&desc_dev->dev);
> +	return ret;
>  }
>  
>  /*
> @@ -717,17 +724,19 @@ static int dell_wmi_events_set_enabled(bool enable)
>  
>  static int dell_wmi_probe(struct wmi_device *wdev)
>  {
> +	struct dell_wmi_priv *priv;
>  	int err;
>  
> -	struct dell_wmi_priv *priv = devm_kzalloc(
> +	priv = devm_kzalloc(
>  		&wdev->dev, sizeof(struct dell_wmi_priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +	dev_set_drvdata(&wdev->dev, priv);
>  
> -	err = dell_wmi_check_descriptor_buffer();
> +	err = dell_wmi_check_descriptor_buffer(wdev);
>  	if (err)
>  		return err;
>  
> -	dev_set_drvdata(&wdev->dev, priv);
> -
>  	return dell_wmi_input_setup(wdev);
>  }
>  

-- 
Pali Rohár
pali.rohar@gmail.com
