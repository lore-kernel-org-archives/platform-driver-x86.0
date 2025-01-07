Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93A118C900;
	Tue,  7 Jan 2025 18:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736273421; cv=none; b=YvfgG1o0ty2ae8pZCkwfglyAWlD3pZpVGW9cf4PZLqAkBfl50do5gTU4EwZqeMqdxYEuGgo4WtOA/u0BW0zaMK+ahYgbia5mwulF9sIZ6gYMIFpcGTQOnM/vKwHZuW3xoS37gNTi7EZRsHXWfooGPyLapZ/h5HP5mLY1YZUrtUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736273421; c=relaxed/simple;
	bh=AB69tThgK716BknMHKgn2tM+8yEqZGSYS8GXKvTyvhw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Qlx95yAW8cmFxjoq1WNpraCnrebBig2CGKXmyUZiAnIC6ednuLuBn2lRxk7mmDMdvdUgTYKANgtLTeUvhb3G06ufer9DM6Nv3eHIK4TlK7X5FqULZgYDh6KttQllUWpwtYbieL3ZvTq3mwq04nyrPAK/KmVrRybMAWTsI9gLXU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XAhf1bOV; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XAhf1bOV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736273418; x=1767809418;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AB69tThgK716BknMHKgn2tM+8yEqZGSYS8GXKvTyvhw=;
  b=XAhf1bOVjimZTQE+1XCpmorJxS7/8/uQJaZCGZyYlEh2Vm5/Wz87OrHV
   yBpIQZnKkUQ4+odHDMkDbqWc+FTZ3pzeL/KcDs6iqcRydDZ3drVOXh6vc
   GfWUqU9QeQj3Iu+QCfvE3bow84a6YaX3pQuFkz8aT09FgceFfZnEFBVQ4
   kqX3x/qSF8+gjLJxRrfpicyf1nrY2RODILs/6ZX65wGKrgLmk9/3ptJqi
   4mNNtYJgt1RfcQsZwyw+aKawZ3Y1DMs+Pr7864Hah2zV5CUhr8SPwZ4tY
   H8aPLVUThtf9SXrwMXpvY29UAydWB/knTPnUA7nOhzTGtPs9SVWCrdu5/
   A==;
X-CSE-ConnectionGUID: duEMimFvS8yUVonAJp8h8w==
X-CSE-MsgGUID: q0OWSHKoSNmAu58ZIEK/dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="24076273"
X-IronPort-AV: E=Sophos;i="6.12,296,1728975600"; 
   d="scan'208";a="24076273"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:09:12 -0800
X-CSE-ConnectionGUID: koMtYlgGQsu8CPav4GcEOA==
X-CSE-MsgGUID: CQJGRkZcRmWBJ4KB6a4eNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102702359"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.206])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 10:09:09 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 7 Jan 2025 20:09:06 +0200 (EET)
To: Ai Chao <aichao@kylinos.cn>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5] platform/x86: lenovo-wmi-camera: Use SW_CAMERA_LENS_COVER
 instead of KEY_CAMERA_ACESS
In-Reply-To: <20250101102922.1784551-1-aichao@kylinos.cn>
Message-ID: <18ceac4e-f000-fe4c-4a81-25a6dc03a072@linux.intel.com>
References: <20250101102922.1784551-1-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 Jan 2025, Ai Chao wrote:

> Use SW_CAMERA_LENS_COVER instead of KEY_CAMERA_ACESS_ENABLE and
> KEY_CAMERA_ACESS_DISABLE. When the camera toggle switch was hit,
> the lenovo-wmi-camera driver would report an event code.
> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
> change for v5
> -Add input_report_switch before input_register_device.
> change for v4
> -Add mutex_unlock and report a switch state of 0 if SW_CAMERA_ON.
> change for v3
> -Used input_register_device and input_allocate_device.
> change for v2
> -Only delays the input-device registration and switches to reporting SW_CAMERA_LENS_COVER.
> 
>  drivers/platform/x86/lenovo-wmi-camera.c | 67 ++++++++++++++++--------
>  1 file changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/lenovo-wmi-camera.c b/drivers/platform/x86/lenovo-wmi-camera.c
> index 0c0bedaf7407..ceed441a0161 100644
> --- a/drivers/platform/x86/lenovo-wmi-camera.c
> +++ b/drivers/platform/x86/lenovo-wmi-camera.c
> @@ -26,10 +26,38 @@ enum {
>  	SW_CAMERA_ON	= 1,
>  };
>  
> +static int camera_shutter_input_setup(struct wmi_device *wdev, u8 camera_mode)
> +{
> +	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> +	int err;
> +
> +	priv->idev = input_allocate_device();
> +	if (!priv->idev)
> +		return -ENOMEM;
> +
> +	priv->idev->name = "Lenovo WMI Camera Button";
> +	priv->idev->phys = "wmi/input0";
> +	priv->idev->id.bustype = BUS_HOST;
> +	priv->idev->dev.parent = &wdev->dev;
> +
> +	input_set_capability(priv->idev, EV_SW, SW_CAMERA_LENS_COVER);
> +
> +	input_report_switch(priv->idev, SW_CAMERA_LENS_COVER,
> +			    camera_mode == SW_CAMERA_ON ? 0 : 1);
> +	input_sync(priv->idev);
> +
> +	err = input_register_device(priv->idev);
> +	if (err) {
> +		input_free_device(priv->idev);
> +		priv->idev = NULL;
> +	}
> +
> +	return err;
> +}
> +
>  static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  {
>  	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
> -	unsigned int keycode;
>  	u8 camera_mode;
>  
>  	if (obj->type != ACPI_TYPE_BUFFER) {
> @@ -55,11 +83,18 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  
>  	mutex_lock(&priv->notify_lock);
>  
> -	keycode = camera_mode == SW_CAMERA_ON ?
> -		   KEY_CAMERA_ACCESS_ENABLE : KEY_CAMERA_ACCESS_DISABLE;
> -	input_report_key(priv->idev, keycode, 1);
> -	input_sync(priv->idev);
> -	input_report_key(priv->idev, keycode, 0);
> +	if (!priv->idev) {
> +		if (camera_shutter_input_setup(wdev, camera_mode))
> +			dev_warn(&wdev->dev, "Failed to register input device\n");
> +
> +		mutex_unlock(&priv->notify_lock);
> +		return;
> +	}
> +
> +	if (camera_mode == SW_CAMERA_ON)
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 0);
> +	else
> +		input_report_switch(priv->idev, SW_CAMERA_LENS_COVER, 1);
>  	input_sync(priv->idev);
>  
>  	mutex_unlock(&priv->notify_lock);

Please just convert the mutex_lock() to use guard() and remove both 
mutex_unlock()s as cleanup.h will then handle that automatically for you.

-- 
 i.

> @@ -68,29 +103,12 @@ static void lenovo_wmi_notify(struct wmi_device *wdev, union acpi_object *obj)
>  static int lenovo_wmi_probe(struct wmi_device *wdev, const void *context)
>  {
>  	struct lenovo_wmi_priv *priv;
> -	int ret;
>  
>  	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>  	if (!priv)
>  		return -ENOMEM;
>  
>  	dev_set_drvdata(&wdev->dev, priv);
> -
> -	priv->idev = devm_input_allocate_device(&wdev->dev);
> -	if (!priv->idev)
> -		return -ENOMEM;
> -
> -	priv->idev->name = "Lenovo WMI Camera Button";
> -	priv->idev->phys = "wmi/input0";
> -	priv->idev->id.bustype = BUS_HOST;
> -	priv->idev->dev.parent = &wdev->dev;
> -	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_ENABLE);
> -	input_set_capability(priv->idev, EV_KEY, KEY_CAMERA_ACCESS_DISABLE);
> -
> -	ret = input_register_device(priv->idev);
> -	if (ret)
> -		return ret;
> -
>  	mutex_init(&priv->notify_lock);
>  
>  	return 0;
> @@ -100,6 +118,9 @@ static void lenovo_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct lenovo_wmi_priv *priv = dev_get_drvdata(&wdev->dev);
>  
> +	if (priv->idev)
> +		input_unregister_device(priv->idev);
> +
>  	mutex_destroy(&priv->notify_lock);
>  }
>  
> 
