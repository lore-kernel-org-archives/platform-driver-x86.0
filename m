Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472DE3B27DF;
	Wed, 26 Aug 2026 08:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787732879; cv=none; b=cK/35pPI7dwaYpVvQerwMspi6X+WpnbfVFfwETAPWJbixZROxi5Fx+VFPHwWcPOUngkh8HSeoJcQheFRLNfzrQ/7TNWLJ3qi18sGNOFFJyxXB23eidj9ePk5cpiqy/Ooye8s+UfqQ9hGnB/t+aFZOg1yCEIrg1vdiJMXNgY1WRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787732879; c=relaxed/simple;
	bh=XWMTWQNCMqyjJzNIrjNSIkA85ovEjH/hITl4LcHUxe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Exp9BkbSYI0jpA7raMsGsXfThoqoK8sKMTv62x3POy+E1OvGsOWfTN4kd4OHmRJqe+9gKq7+GAc9ZZcIoZQByuUkXdILt7AMQ4PwDEno9mTajYHUU0AMEX193i6l8UGoGPb/U6p+G9g2GPmznkUlLq49j2hKmbuKMjdmVXi8ImY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=YFcNVs0z; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="YFcNVs0z"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B2BD62FC0052;
	Wed, 26 Aug 2026 10:27:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787732866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+JCFtA7NzlM7sg484Q3D6uROBQ4dtazlBUTjgXJNSLY=;
	b=YFcNVs0ziYYKZthF7V703SwJfUo75QbWMbNRQ3XDOrbtJcQ+6CDrMMoa70Lfs0G3ixiLJl
	5HO+I75u7ZnrmIxgaJ4Yd6JH1DToIG6YTrsVmJ07TyXyNEz7A8mNRafaJJUdHd2Ay2J0iH
	W8n/pbxohDkvrDo2vFaCjpZIQ9j1gxY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <34880df8-04d3-4749-b112-8aa7bb521722@tuxedocomputers.com>
Date: Wed, 26 Aug 2026 10:27:45 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] platform/x86/tuxedo: Don't use device driver data
To: Aaron Erhardt <aer@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260826081149.235487-1-aer@tuxedocomputers.com>
 <20260826081149.235487-2-aer@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260826081149.235487-2-aer@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 26.08.26 um 10:11 schrieb Aaron Erhardt:
> The WMI driver for TUXEDO Sirius devices used to rely on the device
> driver data through dev_set_drvdata even though it is only a virtual
> low level HID driver. For this purpose, it is better to use the
> driver_data of the hid_device struct to avoid interfering with high
> level device drivers.
>
> Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> index 32d7756022c2..72205de72256 100644
> --- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> +++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
> @@ -448,7 +448,7 @@ static int tux_ll_start(struct hid_device *hdev)
>   	}
>   	driver_data->next_lamp_id = 0;
>   
> -	dev_set_drvdata(&hdev->dev, driver_data);
> +	hdev->driver_data = driver_data;
>   
>   	return ret;
>   }
> @@ -485,7 +485,7 @@ struct __packed lamp_array_attributes_report_t {
>   static int handle_lamp_array_attributes_report(struct hid_device *hdev,
>   					       struct lamp_array_attributes_report_t *rep)
>   {
> -	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
>   
>   	rep->lamp_count = driver_data->lamp_count;
>   	rep->bounding_box_width_in_micrometers = 368000;
> @@ -510,7 +510,7 @@ struct __packed lamp_attributes_request_report_t {
>   static int handle_lamp_attributes_request_report(struct hid_device *hdev,
>   						 struct lamp_attributes_request_report_t *rep)
>   {
> -	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
>   
>   	if (rep->lamp_id < driver_data->lamp_count)
>   		driver_data->next_lamp_id = rep->lamp_id;
> @@ -539,7 +539,7 @@ struct __packed lamp_attributes_response_report_t {
>   static int handle_lamp_attributes_response_report(struct hid_device *hdev,
>   						  struct lamp_attributes_response_report_t *rep)
>   {
> -	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
>   	u16 lamp_id = driver_data->next_lamp_id;
>   
>   	rep->lamp_id = lamp_id;
> @@ -598,7 +598,7 @@ struct __packed lamp_multi_update_report_t {
>   static int handle_lamp_multi_update_report(struct hid_device *hdev,
>   					   struct lamp_multi_update_report_t *rep)
>   {
> -	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
>   	union tux_wmi_xx_496in_80out_in_t *next = &driver_data->next_kbl_set_multiple_keys_in;
>   	struct tux_kbl_set_multiple_keys_in_rgb_config_t *rgb_configs_j;
>   	struct wmi_device *wdev = to_wmi_device(hdev->dev.parent);
> @@ -683,7 +683,7 @@ struct __packed lamp_range_update_report_t {
>   static int handle_lamp_range_update_report(struct hid_device *hdev,
>   					   struct lamp_range_update_report_t *rep)
>   {
> -	struct tux_hdev_driver_data_t *driver_data = dev_get_drvdata(&hdev->dev);
> +	struct tux_hdev_driver_data_t *driver_data = hdev->driver_data;
>   	struct lamp_multi_update_report_t lamp_multi_update_report = {
>   		.report_id = LAMP_MULTI_UPDATE_REPORT_ID,
>   	};
