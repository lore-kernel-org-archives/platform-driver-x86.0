Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A541957EA
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 09:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721123449; cv=none; b=CJ0nu1VFxLqCYszO7hGsp69yhKA7yx0hAn6T88XGFUjtXro1ZKmtKjRxC09aLE4pW3xtPBRc0zxHgb4Z8KLCcT1phmo0gC3uSKEA46Rq0E74/hR/uFzeAvM/9HyvO7KzY61+3qddoiziVBK+fIPUekD+2cYq7IqlQAIDYU8y8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721123449; c=relaxed/simple;
	bh=Qcgw1oG6GqZ+DX7h0GjwKedbviM6HftzX+3DO1sjRek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JovM3a3NFCT5keLUKsodzfmeoJainYqyoNXAX9ADn4UmFy8ahxfYxn5cs71hG6kiyqVm/E9xBRA+RTA7LSQHy0/9T9NH1sgUHdp/m/uRqG+RAxd/MmB/deihu96Wca/dSwHxylcXZRPFTpyIyF1Odn4epf3ByuTlK1Gc374prRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GPq8Er3c; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GPq8Er3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721123447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EyooQ7tbGs3I8/sxfZKSolu0QjG6tDcxBAoTwiUTCyU=;
	b=GPq8Er3ctJjy/fFy9cPzSP1X/OLrMqPKG3Nx2V50hbc5Ja20ilOFGLlF/bmx94k8TPeB9G
	09vrT9RBd4GPcVMB/XOjN1tHbWsn14gr+Jn2rrwN1rni0o/MGcE+SkrYjJZ90OxN+tWFOq
	WPbQE+N/lqOvtUBysbxWTFLo4va+DsI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-DogaNE6KPwyIUgC11-h7vA-1; Tue, 16 Jul 2024 05:50:45 -0400
X-MC-Unique: DogaNE6KPwyIUgC11-h7vA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a77c9c6bdadso396522266b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jul 2024 02:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721123444; x=1721728244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EyooQ7tbGs3I8/sxfZKSolu0QjG6tDcxBAoTwiUTCyU=;
        b=VVuGQFhjs08bc2G7P3HI0n+KQNMMSY4h1ANn+osP7iFZpkfZI/FP/NJ1FwC9ApJD+7
         4KWBu/nt437ewJ6f35J7NEIC7NVf+4Zw+xDTgEN7hihXC0r80sgA/rsN5LasDKNIvopH
         0lnXp6MW01ny5HWnWJOLhaYoCseR0TKgv3aQ4oqXzQ84J/RriBprrFj+OjdEc+WUmb64
         5HMHMPvLVbthAjwQLdddjDra2szz3CbB53QN7WFVG5g7BIxb0SoUhfHyT2nBDUY26B4E
         EpOFBTo28oo1yf+b4EmIzt0Rb6OWvS0vOBJwwHlM0DElbq/RrkCwskFzCx7svYqrlJ0t
         4Big==
X-Forwarded-Encrypted: i=1; AJvYcCV1N99yEl2h1gDEZ458Fu2Y/ydJB4OMO9rLD19DcMVCFuaO0p6NkzLrupPTpckOSViwUSnx+I3WqfpVftHZPDHxEkAUYDJZb+NPStz9AFWYBOcefA==
X-Gm-Message-State: AOJu0Yw0Ms5CXnvVD5kBx5IuNk6/+eVBcpvvtfR09JtSfC4wGnv4APmi
	oSzQ6hRYD8wDpNirOHx2+vvHKHgVj/joP0/wyCVmyg/LXcdtA7SI8+ZHxAt4Lo5Wxlymdu5FQlV
	GEUmhIThs8RVC8+uFjUTczif8HXouAKy0iuFvUHGsgJR0STdYaseveMReBzC9fkmzd26jOWk=
X-Received: by 2002:a17:906:b812:b0:a77:d85c:86f5 with SMTP id a640c23a62f3a-a79eaa3ed0cmr92441466b.53.1721123444360;
        Tue, 16 Jul 2024 02:50:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7KlLMxe0hFh0JMGq+2j9fkkzcxGTYPaYAchGDzkCLy54SxVZA8oNRIGkbFcGy3Yy5zdX0hw==
X-Received: by 2002:a17:906:b812:b0:a77:d85c:86f5 with SMTP id a640c23a62f3a-a79eaa3ed0cmr92440266b.53.1721123443972;
        Tue, 16 Jul 2024 02:50:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f24d6sm285898866b.125.2024.07.16.02.50.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 02:50:43 -0700 (PDT)
Message-ID: <9123108d-cb50-43bb-b7ff-0327fb760a89@redhat.com>
Date: Tue, 16 Jul 2024 11:50:42 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] platform/x86 asus-bioscfg: move existing tunings to
 asus-bioscfg module
To: "Luke D. Jones" <luke@ljones.dev>, platform-driver-x86@vger.kernel.org
Cc: corentin.chary@gmail.com, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, linux-kernel@vger.kernel.org
References: <20240716051612.64842-1-luke@ljones.dev>
 <20240716051612.64842-2-luke@ljones.dev>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240716051612.64842-2-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Luke,

On 7/16/24 7:16 AM, Luke D. Jones wrote:
> The fw_attributes_class provides a much cleaner interface to all of the
> attributes introduced to asus-wmi. This patch moves all of these extra
> attributes over to fw_attributes_class, and shifts the bulk of these
> definitions to a new kernel module to reduce the clutter of asus-wmi
> with the intention of deprecating the asus-wmi attributes in future.
> 
> The work applies only to WMI methods which don't have a clearly defined
> place within the sysfs and as a result ended up lumped together in
> /sys/devices/platform/asus-nb-wmi/ with no standard API.
> 
> Where possible the fw attrs now implement defaults, min, max, scalar,
> choices, etc. As en example dgpu_disable becomes:
> 
> /sys/class/firmware-attributes/asus-bioscfg/attributes/dgpu_disable/
> ├── current_value
> ├── display_name
> ├── possible_values
> └── type
> 
> as do other attributes.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Interesting (also see my reply to the cover-letter).

Note this is not a full review, just a few small remarks
with things which I noticed while taking a quick look.

<snip>

> +static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
> +{
> +	return !strcmp(attr->attr.name, "gpu_mux_mode");
> +		!strcmp(attr->attr.name, "panel_hd_mode");
> +}

The second statement here is never reached, I believe you want
a || between the 2 strcmp() calls:

static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
{
	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
	       !strcmp(attr->attr.name, "panel_hd_mode");
}

<snip>

> +/* Simple attribute creation */

I think it would be good to do the following for registering
these "simple" attributes ... continued below.

> +ATTR_GROUP_ENUM_INT_RW(thermal_policy, "thermal_policy", ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
> +		0, 3, "0;1;2", "Set the thermal profile: 0=normal, 1=performance, 2=quiet");
> +ATTR_GROUP_PPT_RW(ppt_pl2_sppt, "ppt_pl2_sppt", ASUS_WMI_DEVID_PPT_PL2_SPPT,
> +		cpu_default, 5, cpu_max, 1, "Set the CPU fast package limit");
> +ATTR_GROUP_PPT_RW(ppt_apu_sppt, "ppt_apu_sppt", ASUS_WMI_DEVID_PPT_APU_SPPT,
> +		platform_default, 5, platform_max, 1, "Set the CPU slow package limit");
> +ATTR_GROUP_PPT_RW(ppt_platform_sppt, "ppt_platform_sppt", ASUS_WMI_DEVID_PPT_PLAT_SPPT,
> +		platform_default, 5, platform_max, 1, "Set the CPU slow package limit");
> +ATTR_GROUP_PPT_RW(ppt_fppt, "ppt_fppt", ASUS_WMI_DEVID_PPT_FPPT,
> +		cpu_default, 5, cpu_max, 1, "Set the CPU slow package limit");
> +
> +ATTR_GROUP_PPT_RW(nv_dynamic_boost, "nv_dynamic_boost", ASUS_WMI_DEVID_NV_DYN_BOOST,
> +		nv_boost_default, 5, nv_boost_max, 1, "Set the Nvidia dynamic boost limit");
> +ATTR_GROUP_PPT_RW(nv_temp_target, "nv_temp_target", ASUS_WMI_DEVID_NV_THERM_TARGET,
> +		nv_temp_default, 75, nv_temp_max, 1, "Set the Nvidia max thermal limit");
> +
> +ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE,
> +		"0;1;2", "Show the current mode of charging");
> +ATTR_GROUP_BOOL_RW(boot_sound, "boot_sound", ASUS_WMI_DEVID_BOOT_SOUND,
> +		"Set the boot POST sound");
> +ATTR_GROUP_BOOL_RW(mcu_powersave, "mcu_powersave", ASUS_WMI_DEVID_MCU_POWERSAVE,
> +		"Set MCU powersaving mode");
> +ATTR_GROUP_BOOL_RW(panel_od, "panel_overdrive", ASUS_WMI_DEVID_PANEL_OD,
> +		"Set the panel refresh overdrive");
> +ATTR_GROUP_BOOL_RW(panel_hd_mode, "panel_hd_mode", ASUS_WMI_DEVID_PANEL_HD,
> +		"Set the panel HD mode to UHD<0> or FHD<1>");
> +ATTR_GROUP_BOOL_RO(egpu_connected, "egpu_connected", ASUS_WMI_DEVID_EGPU_CONNECTED,
> +	"Show the eGPU connection status");

Create an array of simple attribute groups for this
entire set of simple attributes:

struct asus_attr_group {
	const struct attribute_group *attr_group;
	u32 wmi_devid;
};

static const struct asus_attr_group simple_attribute_groups[] = {
	{ &thermal_policy_attr_group, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY },
	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY },
	...
	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
};

And then in asus_fw_attr_add() .. continued below:

> +static int asus_fw_attr_add(void)
> +{
> +	int ret;
> +
> +	ret = fw_attributes_class_get(&fw_attr_class);
> +	if (ret)
> +		goto fail_class_created;
> +	else
> +		asus_bioscfg.fw_attr_dev = device_create(fw_attr_class, NULL,
> +			MKDEV(0, 0), NULL, "%s", DRIVER_NAME);
> +
> +	if (IS_ERR(asus_bioscfg.fw_attr_dev)) {
> +		ret = PTR_ERR(asus_bioscfg.fw_attr_dev);
> +		goto fail_class_created;
> +	}
> +
> +	asus_bioscfg.fw_attr_kset = kset_create_and_add("attributes", NULL,
> +				&asus_bioscfg.fw_attr_dev->kobj);
> +	if (!asus_bioscfg.fw_attr_dev) {
> +		ret = -ENOMEM;
> +		pr_debug("Failed to create and add attributes\n");
> +		goto err_destroy_classdev;
> +	}
> +
> +	/* Add any firmware_attributes required */
> +	ret = sysfs_create_file(&asus_bioscfg.fw_attr_kset->kobj, &pending_reboot.attr);
> +	if (ret) {
> +		pr_warn("Failed to create sysfs level attributes\n");
> +		goto fail_class_created;
> +	}
> +
> +	// TODO: logging
> +	asus_bioscfg.mini_led_dev_id = 0;
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE)) {
> +		asus_bioscfg.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE;
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_MINI_LED_MODE2)) {
> +		asus_bioscfg.mini_led_dev_id = ASUS_WMI_DEVID_MINI_LED_MODE2;
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> +	}
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX)) {
> +		asus_bioscfg.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX;
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +	} else if (asus_wmi_is_present(ASUS_WMI_DEVID_GPU_MUX_VIVO)) {
> +		asus_bioscfg.gpu_mux_dev_id = ASUS_WMI_DEVID_GPU_MUX_VIVO;
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +	}
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_DGPU)) {
> +		asus_bioscfg.dgpu_disable_available = true;
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &dgpu_disable_attr_group);
> +	}
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU)) {
> +		asus_bioscfg.egpu_enable_available = true;
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &egpu_enable_attr_group);
> +	}

Replace the block starting here and ending ...

> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_EGPU_CONNECTED))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &egpu_connected_attr_group);
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &thermal_policy_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PPT_PL1_SPL))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &ppt_pl1_spl_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PPT_PL2_SPPT))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &ppt_pl2_sppt_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PPT_APU_SPPT))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &ppt_apu_sppt_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PPT_PLAT_SPPT))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &ppt_platform_sppt_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PPT_FPPT))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &ppt_fppt_attr_group);
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_NV_DYN_BOOST))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &nv_dynamic_boost_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_NV_THERM_TARGET))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &nv_temp_target_attr_group);
> +
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_CHARGE_MODE))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &charge_mode_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_BOOT_SOUND))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &boot_sound_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_MCU_POWERSAVE))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &mcu_powersave_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PANEL_OD))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &panel_od_attr_group);
> +	if (asus_wmi_is_present(ASUS_WMI_DEVID_PANEL_HD))
> +		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, &panel_hd_mode_attr_group);

here, with:

	for (i = 0; i < ARRAY_SIZE(simple_attribute_groups); i++) {
		if (!asus_wmi_is_present(simple_attribute_groups[i].wmi_devid))
			continue;

		sysfs_create_group(&asus_bioscfg.fw_attr_kset->kobj, simple_attribute_groups[i].attr_group);
		pr_dbg("Created sysfs-group for %s\n", simple_attribute_groups[i].attr_group->name);
	}

This will make adding new simple attributes a matter of just:

1. Declaring the new attr using one of the macros
2. Adding it to simple_attribute_groups[]

And this also takes care of you logging TODO for simple attributes
without needing to add a ton of pr_debug() calls.

Regards,

Hans


