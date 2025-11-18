Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959F82E645
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 01:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763428180; cv=none; b=O+rJvy5aIRqpcgx+i2Zo/4P8LgDsCilrRiMNgorZRIkKcrriDLP+xcbUuxxgo5ozWUPJmh0JCCjw2lIeXONRXzUEyehHoMG9QCWgMClOFqx++IXHj9+i2JMbWvXk6eI2FHAkuMi2oU8pc+IJmVsreCvVNyw1zUxDIG4fhL5j9L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763428180; c=relaxed/simple;
	bh=A7qFzGsf/mvKe5L5/bfikuMCFvf3/lfbQ98sMPrztS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBlCDkTHlmAncsBx8xyaP06N7gxpWfMGrM7jPnBA+hVeC4NkXCgLdV3fzPH1Ee9uDFrjhJgVxP4m0geVjhH6QLlAj5jwYO9Zb9Z8JrSsShMc388eYTTR5fLHB3k7U8B9drNAxCZczyjYTuKnrO6F5IbdXfrbjiNXWkUnAa+kOvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XR16n0+j; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XR16n0+j"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-47790b080e4so18717955e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 17:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763428177; x=1764032977; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+eVyWKIdUhzI4PFnHNnLtOm4epcZJUTgpHc5v3lqF8=;
        b=XR16n0+jpREb/hAr6bUABlFeB1/daKbCSRatEhLCJEZQZ5VOvKpF3I9Hma5fJJK+cy
         P+mcDM77Z7gtp/ziIA2JtdnpypKyQ3u1sarZBNT9Su+51TU1iCpCWr3fcT22bN01BxEh
         9ItVW7W75Sv4gh99FdqOcTELCe1rYm//t5c27ieNKdsbP/bpy6csqzrmK1jLSVyneE/h
         Ku4vXv/E/lLMRSZMVmzDF9GXexnmAnR2rmd8T59PF0riOe83qR705H3Jh7pNVmTqjigx
         am/dA0QEeBF6aP2HtMBVsAoK64KV2erH/14MVbf15juft8Qw+xdAH1WaxI7Cpxi/AQBg
         ChpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763428177; x=1764032977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+eVyWKIdUhzI4PFnHNnLtOm4epcZJUTgpHc5v3lqF8=;
        b=KU5RNgq9bhu1vMBT+boRsFWRlEQreLKObIr1qcbp13xDYOVFSETVPqurRQz5PS5i39
         4m2CZ9Wk/kUMhwYLGph2nPpKthP25RBNNnlzVnbbYATxPhSTU/Q8KoZlFUBKT+AG/z/v
         Rk0KJ99BCc4OcqgK4fcuS5xQ4sFGJLUUYbegtsK6VThJGQxlJ4pEaGq6QlirJ1rNQ46g
         7kcEsIrkQGyqRgoM0UORS/cgdS3s/BjqcTD5jfGpZemV8YG6pN+6tQzfnTogU6EslxdD
         gypePeVnAf9S/YBQYDOCL97VrbqIU69C/nxP6SFn70u0ZWIyCFxOXpp08smzVMfJd4wC
         LqRA==
X-Gm-Message-State: AOJu0YysN5Mj4DxHyEtW48C9vxN83URgL1kGUacrF/vNSDqSdaOWgvFR
	BsmIb2huQ7UwpvcKR2JWyPyPVwLgr+G2CvLfF6HudbdJcKrhPDBWNi2j
X-Gm-Gg: ASbGncvi0X9+2m3r0YOzJGgp7nzhH++ZZXO15kd6rUCjLbSabvmVgaJd8WWrHTTBBtN
	PvEqH3uzBVEET38Yy12LftoN0A40JVcQpqbY2kFvk0gcG23VDsFOzZbICPMN3hDvVadvbhq4SQa
	vb0z6MEshsreGnH2P1/KCLvJUjExNVfKjHi0060WMiodc7pS8WkX+wXUvCm9awKBRS0qjRqvH4l
	NexXLBVeJbTJ+796xcWTLoIgYmwoLM3cKPtzrBu4vPhzP4dNJfjgZuGT79i/LuspRBCPVkcOnm2
	PM9VkVLT60we0lg4nkITxeoY+lyDTX3GRu6q7hsFf0hKXOh0iy0fxFLDBJY1d4Fk2STrARrHycu
	mTOmAY6tcHZxPiTib1hYJHroBwIRVp5Qt190nYqwI/fEvxVrZC1qdWMqFE9tQxP5R+atJ7Gq3IK
	9XYrV2ZkGJ3fXQ
X-Google-Smtp-Source: AGHT+IGpXVfE/Bzsk3cWdGlhJ+hC1jsGPVLcjSz7fWrPrwRqtnF2IzQnjKTUJcKPtLWTF+4dF/ipNA==
X-Received: by 2002:a05:600c:a43:b0:477:3543:3a3b with SMTP id 5b1f17b1804b1-4778fe59f2amr121961675e9.6.1763428176701;
        Mon, 17 Nov 2025 17:09:36 -0800 (PST)
Received: from [192.168.1.121] ([176.206.83.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787daab3fsm361630075e9.0.2025.11.17.17.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 17:09:36 -0800 (PST)
Message-ID: <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
Date: Tue, 18 Nov 2025 02:09:35 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
To: Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251118005748.538726-1-denis.benato@linux.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251118005748.538726-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/25 01:57, Denis Benato wrote:
> The CPU cores interface is inconsistent between AMD and Intel systems,
> leading to probe failure: solve the problem taking following steps:
> - make the interface read-only (avoid the possibility of bricks)
> - do not fail if the interface returns unexpected data
> - show interface errors at either info or debug level
I felt like compile-time disabling the write endpoint after reading the comment
from Mario while still keeping the core of everything that was said in an attempt
to make everyone happy and preparing for the future.

I can also evaluate the option to introduce a table for allowed models
where the min number of cores is hardcoded for model as it is for TDP
tunings: that way allowed values will be tested by someone...
Material for another day.

On a side note checkpatch says:
```
WARNING: Argument '_fsname' is not used in function-like macro
#293: FILE: drivers/platform/x86/asus-armoury.h:210:
+#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)           \
        __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
        __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
        static struct kobj_attribute attr_##_attrname##_current_value = \
+               __ASUS_ATTR_CPU_CORES(_attrname, current_value);        \
        static struct kobj_attribute attr_##_attrname##_default_value = \
                __ASUS_ATTR_RO(_attrname, default_value);               \
        static struct kobj_attribute attr_##_attrname##_min_value =     \
```

but _fsname name is used just below in the same macro:
checkpatch.pl bug?
> Links:
> https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
> https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/
>
> Suggested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
>  drivers/platform/x86/asus-armoury.h |  12 +++-
>  2 files changed, 99 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
> index 9f67218ecd14..abbbcd62d0eb 100644
> --- a/drivers/platform/x86/asus-armoury.c
> +++ b/drivers/platform/x86/asus-armoury.c
> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>  	 */
>  	struct mutex egpu_mutex;
>  
> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>  	/*
>  	 * Mutex to prevent big/little core count changes writing to same
>  	 * endpoint at the same time. Must lock during attr store.
>  	 */
>  	struct mutex cpu_core_mutex;
> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> +
>  	struct cpu_cores *cpu_cores;
>  	bool cpu_cores_changeable;
>  
> @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>  static struct asus_armoury_priv asus_armoury = {
>  	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>  
> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>  	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>  };
>  
>  struct fw_attrs_group {
> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>  			return -EINVAL;
>  		}
>  		break;
> +	case ASUS_WMI_DEVID_CORES_MAX:
> +		/*
> +		 * CPU cores max is a read-only property on supported devices.
> +		 */
> +		pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
> +		return -EINVAL;
>  	default:
>  		/* No known problems are known for this dev_id */
>  		break;
> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> +	pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
>  	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>  	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>  
> @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>  		return ERR_PTR(-EIO);
>  	}
>  
> +	pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
>  	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>  	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>  
>  	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>  	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>  
> +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
> +		pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
> +		       cores_p->min_perf_cores,
> +		       cores_p->max_perf_cores,
> +		       cores_p->cur_perf_cores
> +		);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
>  	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>  	    (cores_p->min_power_cores > cores_p->max_power_cores)
>  	) {
> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
> +		pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
> +		       cores_p->min_power_cores,
> +		       cores_p->max_power_cores,
> +		       cores_p->cur_power_cores
> +		);
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>  	return no_free_ptr(cores_p);
>  }
>  
> +/**
> + * cores_value_show() - Get the core count for the specified core type.
> + * @kobj: The kobject associated to caller.
> + * @attr: The kobj_attribute associated to caller.
> + * @buf: The buffer that will be used to sysfs_emit.
> + * @core_type: The core type (performance or efficiency).
> + * @core_value: min, max or current count for the specified cores type.
> + *
> + * Intended usage is from sysfs attribute reading a CPU core count.
> + *
> + * This function assumes asus_armoury.cpu_cores is already initialized,
> + * therefore the compatibility of the interface has already been checked.
> + *
> + * Returns:
> + * * %-EINVAL	- invalid core value type.
> + * * %0		- successful and buf is filled by sysfs_emit.
> + * * %other	- error from sysfs_emit.
> + */
>  static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>  				enum cpu_core_type core_type, enum cpu_core_value core_value)
>  {
> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>  	return sysfs_emit(buf, "%u\n", cpu_core_value);
>  }
>  
> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>  static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>  					 const char *buf, enum cpu_core_type core_type)
>  {
> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>  
>  	return 0;
>  }
> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>  
>  static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>  						struct kobj_attribute *attr, char *buf)
> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>  	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>  }
>  
> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>  static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>  						     struct kobj_attribute *attr,
>  						     const char *buf, size_t count)
> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>  
>  	return count;
>  }
> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
> -			 "Set the max available performance cores");
> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
> +			 "Get available performance cores");
>  
>  /* Define helper to access the current power mode tunable values */
>  static inline struct rog_tunables *get_current_tunables(void)
> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>  	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>  }
>  
> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>  static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>  						    struct kobj_attribute *attr, const char *buf,
>  						    size_t count)
> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>  
>  	return count;
>  }
> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
> -		    "Set the max available efficiency cores");
> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
> +		    "Get available efficiency cores");
>  
>  /* Simple attribute creation */
>  ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>  	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>  
>  	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>  	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>  		}
>  	}
>  
> +	if (asus_armoury.cpu_cores != NULL) {
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +					&cores_efficiency_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
> +			goto err_remove_cores_efficiency_group;
> +		}
> +
> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
> +					&cores_performance_attr_group);
> +		if (err) {
> +			pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
> +			goto err_remove_cores_performance_group;
> +		}
> +	}
> +
>  	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>  		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>  			continue;
> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>  	}
>  	if (asus_armoury.gpu_mux_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
> +err_remove_cores_performance_group:
> +	if (asus_armoury.cpu_cores != NULL)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
> +err_remove_cores_efficiency_group:
> +	if (asus_armoury.cpu_cores != NULL)
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
>  err_remove_mini_led_group:
>  	if (asus_armoury.mini_led_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>  {
>  	char *wmi_uid;
>  	struct cpu_cores *cpu_cores_ctrl;
> -	int err;
>  
>  	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>  	if (!wmi_uid)
> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>  		return -ENODEV;
>  
>  	asus_armoury.cpu_cores_changeable = false;
> +	asus_armoury.cpu_cores = NULL;
>  	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>  		cpu_cores_ctrl = init_cpu_cores_ctrl();
> -		if (IS_ERR(cpu_cores_ctrl)) {
> -			err = PTR_ERR(cpu_cores_ctrl);
> -			pr_err("Could not initialise CPU core control: %d\n", err);
> -			return err;
> +		if (!IS_ERR(cpu_cores_ctrl)) {
> +			pr_debug("CPU cores control available.\n");
> +			asus_armoury.cpu_cores = cpu_cores_ctrl;
> +			asus_armoury.cpu_cores_changeable = true;
>  		}
> -
> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
> -		asus_armoury.cpu_cores_changeable = true;
>  	}
>  
>  	init_rog_tunables();
> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>  					   armoury_attr_groups[i].attr_group);
>  	}
>  
> +	if (asus_armoury.cpu_cores != NULL) {
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> +				   &cores_performance_attr_group);
> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
> +				   &cores_efficiency_attr_group);
> +	}
> +
>  	if (asus_armoury.gpu_mux_dev_id)
>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>  
> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
> index 2f05a2e0cab3..6b2bfe763d23 100644
> --- a/drivers/platform/x86/asus-armoury.h
> +++ b/drivers/platform/x86/asus-armoury.h
> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>  		.name = _fsname, .attrs = _attrname##_attrs			\
>  	}
>  
> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
> +		__ASUS_ATTR_RW(_attrname, __attrval)
> +#else
> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
> +		__ASUS_ATTR_RO(_attrname, __attrval)
> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
> +
>  /* CPU core attributes need a little different in setup */
> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
>  	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>  	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>  	static struct kobj_attribute attr_##_attrname##_current_value =	\
> -		__ASUS_ATTR_RW(_attrname, current_value);		\
> +		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
>  	static struct kobj_attribute attr_##_attrname##_default_value = \
>  		__ASUS_ATTR_RO(_attrname, default_value);		\
>  	static struct kobj_attribute attr_##_attrname##_min_value =	\
