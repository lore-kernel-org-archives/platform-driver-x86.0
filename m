Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE9929827E;
	Sat, 16 May 2026 21:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778966236; cv=none; b=qkhjLeW2yZc3HFwJxxYlLhaUqf+xOogyMiHh0C0HGWy7NAM9tJQTu9NXcFaAWsv5iyiJCbAzY1sGmWeoXx5I0pwk26wicv0Qv2kU81ad7Tsgaxrqq6DkhLraP55KrhMGzPwY59nDQ5uuNkry/sn6QQtvXqAkBHj9lYQeSUCV7JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778966236; c=relaxed/simple;
	bh=cKdJXrRdEthruexr76euAsgSOx8d0TO0kZkQQjy+uyU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bK3GxXhFdFPCTwd1JLdS0QO/DO3c8fihY0TcUUU5y6WIoX8nI5B6vPdlBXMjo4exii/b8vd4swZLuWuzntHLESTJ2WdfP5jsWJoGnxzyJ2bR7HjLzrMstzZVRbcXU/vHkcwseCIEzn6tknliN6sAskowIQ9Z5v9KNQCiq6gGPWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lgk8qPcl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lgk8qPcl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED22C19425;
	Sat, 16 May 2026 21:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778966235;
	bh=cKdJXrRdEthruexr76euAsgSOx8d0TO0kZkQQjy+uyU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lgk8qPclY0D4zmYpy7w4AFDI47AY+Kg9qF8Xyeswc7Kx29Olmo97GUNvSLZnPHJxZ
	 57xaRKoOcYVD3ekwd9ZGG76MsDczdCGDGYpVtLPOpi8kg8/wF0jgkJWVockAFDzOT8
	 8WgL8gZhR1poIAP8IQank0wQaiWp4dSyCCvHyee7vR6tnLffkhMOJfyz8pgYMIEtPu
	 1xHdHbuOrAGbb37TOqMz732CI58H1x8Ou6kVJxQoxuOOTfZSyL7tKSCvMBbm2zDMWa
	 3s023OGfPRMqhGA0tEZ5+ZAA4cEHcEdIe/AK+7/kvFjHhNjH6Ync4oDwN7rmnG/voR
	 lj2uo7ioEHENg==
Message-ID: <e7731725-0460-463f-9092-7fb30c6e46c3@kernel.org>
Date: Sat, 16 May 2026 16:17:12 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86: asus-armoury: expose
 requires_fan_curve via sysfs
To: Ahmed Yaseen <yaseen@ghoul.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, luke@ljones.dev, denis.benato@linux.dev,
 derekjohn.clark@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 prasanth.ksr@dell.com, mpearson-lenovo@squebb.ca,
 Dell.Client.Kernel@dell.com, linux-kernel@vger.kernel.org
References: <20260511061901.907540-1-yaseen@ghoul.dev>
 <20260513154714.25160-3-yaseen@ghoul.dev>
Content-Language: en-US
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <20260513154714.25160-3-yaseen@ghoul.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/13/26 10:47 AM, Ahmed Yaseen wrote:
> Expose the per-model requires_fan_curve flag as a read-only sysfs
> attribute so userspace tools (asusctl, rogcc) can discover whether
> the system requires an active custom fan curve for PPT changes to
> take effect, and warn the user before issuing such writes.
> 
> The attribute appears at:
>    /sys/class/firmware-attributes/asus-armoury/attributes/requires_fan_curve
> 
> Document the attribute in
> Documentation/ABI/testing/sysfs-class-firmware-attributes.
> 
> Signed-off-by: Ahmed Yaseen <yaseen@ghoul.dev>
> ---
>   .../testing/sysfs-class-firmware-attributes   | 25 +++++++++++++++++++
>   drivers/platform/x86/asus-armoury.c           | 15 +++++++++++
>   2 files changed, 40 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> index 2713efa509b4..12700a077f43 100644
> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
> @@ -492,3 +492,28 @@ Description:
>   		log entry size identifies audit log size for the current BIOS version.
>   		The current size is 16 bytes but it can be up to 128 bytes long in future BIOS
>   		versions.
> +
> +What:		/sys/class/firmware-attributes/asus-armoury/attributes/requires_fan_curve
> +Date:		May 2026
> +KernelVersion:	7.1

Right now we're submitting content for 7.2 or later, so this should be 
updated.

> +Contact:	platform-driver-x86@vger.kernel.org
> +Description:
> +		A read-only attribute that reads 1 on ASUS ROG models where the
> +		BIOS requires a custom fan curve to be active before Package
> +		Power Tracking (PPT) writes take effect. On affected models, the
> +		BIOS silently ignores writes to ppt_pl1_spl, ppt_pl2_sppt,
> +		ppt_pl3_fppt, ppt_apu_sppt and ppt_platform_sppt unless a custom
> +		fan curve has been written via the asus_custom_fan_curve hwmon
> +		device.
> +
> +		The kernel rejects PPT writes with -EBUSY on these models when
> +		no fan curve is active. Userspace tools can read this attribute
> +		to surface a clear prerequisite to the user instead of letting
> +		the write appear to succeed at the firmware-attribute layer
> +		while the BIOS discards it.
> +
> +			==	==============================================
> +			0	No fan curve prerequisite for PPT writes.
> +			1	A custom fan curve must be active; PPT writes
> +				return -EBUSY otherwise.
> +			==	==============================================
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 9b1c41a25b38..9b483d7e9855 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -127,6 +127,13 @@ static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *
>   
>   static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>   
> +static ssize_t requires_fan_curve_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
> +{
> +	return sysfs_emit(buf, "%d\n", asus_armoury.requires_fan_curve);
> +}
> +
> +static struct kobj_attribute requires_fan_curve = __ATTR_RO(requires_fan_curve);
> +
>   static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>   {
>   	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
> @@ -914,6 +921,12 @@ static int asus_fw_attr_add(void)
>   		goto err_destroy_kset;
>   	}
>   
> +	err = sysfs_create_file(&asus_armoury.fw_attr_kset->kobj, &requires_fan_curve.attr);
> +	if (err) {
> +		pr_err("Failed to create requires_fan_curve attribute\n");
> +		goto err_destroy_kset;
> +	}
> +
>   	asus_armoury.mini_led_dev_id = 0;
>   	if (armoury_has_devstate(ASUS_WMI_DEVID_MINI_LED_MODE))
>   		asus_armoury.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> @@ -987,6 +1000,7 @@ static int asus_fw_attr_add(void)
>   	if (asus_armoury.mini_led_dev_id)
>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>   err_remove_file:
> +	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &requires_fan_curve.attr);
>   	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
>   err_destroy_kset:
>   	kset_unregister(asus_armoury.fw_attr_kset);
> @@ -1161,6 +1175,7 @@ static void __exit asus_fw_exit(void)
>   	if (asus_armoury.mini_led_dev_id)
>   		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>   
> +	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &requires_fan_curve.attr);
>   	sysfs_remove_file(&asus_armoury.fw_attr_kset->kobj, &pending_reboot.attr);
>   	kset_unregister(asus_armoury.fw_attr_kset);
>   	device_destroy(&firmware_attributes_class, MKDEV(0, 0));

