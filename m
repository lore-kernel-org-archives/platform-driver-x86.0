Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533D336C0B4
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 18:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763491922; cv=none; b=nz0tGMPGavv+UomMHaTJfyhski4eGWakz3rjYHeY+0BJGg2u3xcr84cWh4wxbroi98yi7DOue7eU4JAQuUO6TEx4nDaSprU11SujfrmdTAzWR3xuOpEY2HlqMAyKV4z5JBwElfar4Z6NPHFSUGzVkCo2GVE43yGM3jzcb/CBtfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763491922; c=relaxed/simple;
	bh=dHoj12xwHMw5EJFZOg49yJDlMw0mFXYqHhhuuxojcYg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQ6JF1Qh5et6O8x1ZeAGr/Xs8jIn7HmjIcsg5A4qcDqZdVItcKqJsxCIv9Nhzr0zb22vxXQC1Ob6S7Snh64y/PtgicVNgPq+4G/4vYdA/1CxSJWntmnEFMFJa1F/Dvrzqldr6UFrVEYaBasW2iOfECaeBN8WHhl3zF/zKnF0n6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LeCXPRQe; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeCXPRQe"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477a1c28778so33041145e9.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 10:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763491918; x=1764096718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QgAdswM1YJaAEj3qxOe4wKiz0IWrmS3Y6y3Bwqj7624=;
        b=LeCXPRQeb+TELBq8u7vCSBpz8XzMlKfWY+3qEFwfE62NRo9JIRF5WnRqFQtjvKdWpo
         eRweGDPAD/madwem+JS3ktcIdGIl7sonMGGSMdfII6ZEVQPqKM5o+xNFKepwhjfEqx5B
         VEoKOtJDLFGKUXvKzr9ppq8nLdVzxrpJsluNHj13q6x+O/21x3l7xSSqisLHIHyxikrk
         8ThpvUO5YTfjDZoQSv1Kn1CalL2ElGDJHXhPIiVTzT9cFLEnaeGNeppdGjH/3kQfYjhM
         N/RViNQTIMELpXaUxN79yzNOkey3lxRjY4dX5ouKaaqcDQNeHl6MWbuXklu85Qb7BrZ7
         cU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763491918; x=1764096718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgAdswM1YJaAEj3qxOe4wKiz0IWrmS3Y6y3Bwqj7624=;
        b=asVWjMNRInfVwzQLoi0zV661DmbNF0VjO14bg4dTnt4/BgL60vmZ78ZHFV+wwzJduM
         86TJPNuDMn2b+22XHKN1DdvlFFp6Rs4EspNL3QUf6bzfVLe+rjkXrNLNzr3wsE5dqZSA
         D9e505YMGpmvhX5FPoK5qv+s8toCCIKJAqpIaqusyDeUZ0Z93Qua4Fy5lEx10KwYxj0w
         /y8jPjzJgkDPel+3ZgtXcPdrfjSuP4F5CHHOMa2ZJ7wEU3XmfdXBxP7Bqe2AWxJO97to
         H2h4zpCgNGgXJnO0C0ucnGy/ffwILl7hp2DnSOnG717Ah7qzBF+pBxnTTIuLe1EVyLqL
         Q5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUMtbh1o9zoD8e5SNOt1zKiTlVX7pSYQGHECkrw+7F1J+yhHoTF5/S9YAns44HFPEL8wSasvHdaF+jgfFVDLi9QHjc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2tcXYJhX3KG6lDaqXXLZquvYJbwAufsnJWhgGueVz8y6J3QWj
	DE/FUhheWkZp+xOLjeISWSDaogbxdpcVTjGABadtZ9IynyuywOUUxE3j
X-Gm-Gg: ASbGnctJeY6io5Ok4KVwYX5bdWZJ0Jt5gxGq8xYdjm1NI8f/T0hYSxIJUB3oCAGdcQT
	Veb39JKuqsSz3JYHxvIEwV35FKqLSaj0z20MYe33o0l3sFkpAIciMbdgVHwT/msxVlqiIRzoLtc
	6QbaSDLYdkzQKThMMGr4U2riLlknMSo9CUmAXyDxII9/cQJxLscHZeOlPJfqOIiYaDhYFCxtlzF
	4oMINv8yeFGvrCclaNEBQuIFsYPoWYX448w+7U2NV4kfiVCCTZ79YmQgil7sprjWD6exG1QiBrJ
	iBynkPupdbJsdA/338/o+nUv1aRdxDomDyBN+/bjuSDHSerhzfsZqKxTvOrasKNfYDr67h4JE9s
	YzuaNowcE/vwG8wR9xH1zjLMGXLAl6XQ8YB/YR4ddZMDixhvDuYAGP8IF0z1luEkPP5YHt93Ux2
	M/hO4+zo/WS1wc/Ry7Ehgqi69A1Rlm6A6yK7Ce8udY1nyEYpFhQsnbAlMVHWM=
X-Google-Smtp-Source: AGHT+IE84j8Ra2mB5yr6R4k4oA+sYvPLFkajF8hDB+eVItU3w0dwpyGsz6CVFTZOnLnGmEjCUn+RrQ==
X-Received: by 2002:a05:600c:1c89:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-4778fe4f62amr170096775e9.6.1763491917375;
        Tue, 18 Nov 2025 10:51:57 -0800 (PST)
Received: from [192.168.157.149] (to-18-87-212.service.infuturo.it. [151.18.87.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deb126sm22115885e9.9.2025.11.18.10.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:51:56 -0800 (PST)
Message-ID: <6c9d04da-cd46-4f50-8f99-ae169bb9a877@gmail.com>
Date: Tue, 18 Nov 2025 19:51:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251118005748.538726-1-denis.benato@linux.dev>
 <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
 <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/18/25 10:16, Ilpo Järvinen wrote:
> On Tue, 18 Nov 2025, Denis Benato wrote:
>
>> On 11/18/25 01:57, Denis Benato wrote:
>>> The CPU cores interface is inconsistent between AMD and Intel systems,
>>> leading to probe failure: solve the problem taking following steps:
>>> - make the interface read-only (avoid the possibility of bricks)
>>> - do not fail if the interface returns unexpected data
>>> - show interface errors at either info or debug level
>> I felt like compile-time disabling the write endpoint after reading the comment
>> from Mario while still keeping the core of everything that was said in an attempt
>> to make everyone happy and preparing for the future.
>>
>> I can also evaluate the option to introduce a table for allowed models
>> where the min number of cores is hardcoded for model as it is for TDP
>> tunings: that way allowed values will be tested by someone...
>> Material for another day.
>>
>> On a side note checkpatch says:
>> ```
>> WARNING: Argument '_fsname' is not used in function-like macro
>> #293: FILE: drivers/platform/x86/asus-armoury.h:210:
>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)           \
>>         __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>>         __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>         static struct kobj_attribute attr_##_attrname##_current_value = \
>> +               __ASUS_ATTR_CPU_CORES(_attrname, current_value);        \
>>         static struct kobj_attribute attr_##_attrname##_default_value = \
>>                 __ASUS_ATTR_RO(_attrname, default_value);               \
>>         static struct kobj_attribute attr_##_attrname##_min_value =     \
>> ```
>>
>> but _fsname name is used just below in the same macro:
>> checkpatch.pl bug?
>>> Links:
>>> https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
>>> https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/
>>>
>>> Suggested-by: Luke D. Jones <luke@ljones.dev>
>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>> ---
>>>  drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
>>>  drivers/platform/x86/asus-armoury.h |  12 +++-
>>>  2 files changed, 99 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>> index 9f67218ecd14..abbbcd62d0eb 100644
>>> --- a/drivers/platform/x86/asus-armoury.c
>>> +++ b/drivers/platform/x86/asus-armoury.c
>>> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>>>  	 */
>>>  	struct mutex egpu_mutex;
>>>  
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>  	/*
>>>  	 * Mutex to prevent big/little core count changes writing to same
>>>  	 * endpoint at the same time. Must lock during attr store.
>>>  	 */
>>>  	struct mutex cpu_core_mutex;
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +
>>>  	struct cpu_cores *cpu_cores;
>>>  	bool cpu_cores_changeable;
>>>  
>>> @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>>>  static struct asus_armoury_priv asus_armoury = {
>>>  	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>>>  
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>  	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>  };
>>>  
>>>  struct fw_attrs_group {
>>> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>>>  			return -EINVAL;
>>>  		}
>>>  		break;
>>> +	case ASUS_WMI_DEVID_CORES_MAX:
>>> +		/*
>>> +		 * CPU cores max is a read-only property on supported devices.
>>> +		 */
>>> +		pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
>>> +		return -EINVAL;
>>>  	default:
>>>  		/* No known problems are known for this dev_id */
>>>  		break;
>>> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>  		return ERR_PTR(-ENODEV);
>>>  	}
>>>  
>>> +	pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
>>>  	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>  	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>  
>>> @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>  		return ERR_PTR(-EIO);
>>>  	}
>>>  
>>> +	pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
>>>  	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>  	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>  
>>>  	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>>>  	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>>>  
>>> +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>> +		pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
>>> +		       cores_p->min_perf_cores,
>>> +		       cores_p->max_perf_cores,
>>> +		       cores_p->cur_perf_cores
>>> +		);
>>> +		return ERR_PTR(-EINVAL);
>>> +	}
>>> +
>>>  	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>  	    (cores_p->min_power_cores > cores_p->max_power_cores)
>>>  	) {
>>> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>>> +		pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
>>> +		       cores_p->min_power_cores,
>>> +		       cores_p->max_power_cores,
>>> +		       cores_p->cur_power_cores
>>> +		);
>>>  		return ERR_PTR(-EINVAL);
>>>  	}
>>>  
>>> @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>  	return no_free_ptr(cores_p);
>>>  }
>>>  
>>> +/**
>>> + * cores_value_show() - Get the core count for the specified core type.
>>> + * @kobj: The kobject associated to caller.
>>> + * @attr: The kobj_attribute associated to caller.
>>> + * @buf: The buffer that will be used to sysfs_emit.
>>> + * @core_type: The core type (performance or efficiency).
>>> + * @core_value: min, max or current count for the specified cores type.
>>> + *
>>> + * Intended usage is from sysfs attribute reading a CPU core count.
>>> + *
>>> + * This function assumes asus_armoury.cpu_cores is already initialized,
>>> + * therefore the compatibility of the interface has already been checked.
>>> + *
>>> + * Returns:
>>> + * * %-EINVAL	- invalid core value type.
>>> + * * %0		- successful and buf is filled by sysfs_emit.
>>> + * * %other	- error from sysfs_emit.
>>> + */
>>>  static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>>  				enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>  {
>>> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>>>  	return sysfs_emit(buf, "%u\n", cpu_core_value);
>>>  }
>>>  
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>  static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>  					 const char *buf, enum cpu_core_type core_type)
>>>  {
>>> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>>>  
>>>  	return 0;
>>>  }
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>  
>>>  static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>>>  						struct kobj_attribute *attr, char *buf)
>>> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>>>  	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>>>  }
>>>  
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>  static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>  						     struct kobj_attribute *attr,
>>>  						     const char *buf, size_t count)
>>> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>  
>>>  	return count;
>>>  }
>>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>> -			 "Set the max available performance cores");
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
>>> +			 "Get available performance cores");
>>>  
>>>  /* Define helper to access the current power mode tunable values */
>>>  static inline struct rog_tunables *get_current_tunables(void)
>>> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>>>  	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>>>  }
>>>  
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>  static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>  						    struct kobj_attribute *attr, const char *buf,
>>>  						    size_t count)
>>> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>  
>>>  	return count;
>>>  }
>>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>> -		    "Set the max available efficiency cores");
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
>>> +		    "Get available efficiency cores");
>>>  
>>>  /* Simple attribute creation */
>>>  ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>>> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>  	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>  	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>  
>>>  	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>  	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>>> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>>>  		}
>>>  	}
>>>  
>>> +	if (asus_armoury.cpu_cores != NULL) {
>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>> +					&cores_efficiency_attr_group);
>>> +		if (err) {
>>> +			pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
>>> +			goto err_remove_cores_efficiency_group;
>>> +		}
>>> +
>>> +		err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>> +					&cores_performance_attr_group);
>>> +		if (err) {
>>> +			pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
>>> +			goto err_remove_cores_performance_group;
>>> +		}
>>> +	}
>>> +
>>>  	for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>>>  		if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>>>  			continue;
>>> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>>>  	}
>>>  	if (asus_armoury.gpu_mux_dev_id)
>>>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>> +err_remove_cores_performance_group:
>>> +	if (asus_armoury.cpu_cores != NULL)
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
>>> +err_remove_cores_efficiency_group:
>>> +	if (asus_armoury.cpu_cores != NULL)
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
>>>  err_remove_mini_led_group:
>>>  	if (asus_armoury.mini_led_dev_id)
>>>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>>> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>>>  {
>>>  	char *wmi_uid;
>>>  	struct cpu_cores *cpu_cores_ctrl;
>>> -	int err;
>>>  
>>>  	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>>>  	if (!wmi_uid)
>>> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>>>  		return -ENODEV;
>>>  
>>>  	asus_armoury.cpu_cores_changeable = false;
>>> +	asus_armoury.cpu_cores = NULL;
>>>  	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>  		cpu_cores_ctrl = init_cpu_cores_ctrl();
>>> -		if (IS_ERR(cpu_cores_ctrl)) {
>>> -			err = PTR_ERR(cpu_cores_ctrl);
>>> -			pr_err("Could not initialise CPU core control: %d\n", err);
>>> -			return err;
>>> +		if (!IS_ERR(cpu_cores_ctrl)) {
>>> +			pr_debug("CPU cores control available.\n");
>>> +			asus_armoury.cpu_cores = cpu_cores_ctrl;
>>> +			asus_armoury.cpu_cores_changeable = true;
>>>  		}
>>> -
>>> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
>>> -		asus_armoury.cpu_cores_changeable = true;
>>>  	}
>>>  
>>>  	init_rog_tunables();
>>> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>>>  					   armoury_attr_groups[i].attr_group);
>>>  	}
>>>  
>>> +	if (asus_armoury.cpu_cores != NULL) {
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>> +				   &cores_performance_attr_group);
>>> +		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>> +				   &cores_efficiency_attr_group);
>>> +	}
>>> +
>>>  	if (asus_armoury.gpu_mux_dev_id)
>>>  		sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>  
>>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>>> index 2f05a2e0cab3..6b2bfe763d23 100644
>>> --- a/drivers/platform/x86/asus-armoury.h
>>> +++ b/drivers/platform/x86/asus-armoury.h
>>> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>>>  		.name = _fsname, .attrs = _attrname##_attrs			\
>>>  	}
>>>  
>>> +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>> +		__ASUS_ATTR_RW(_attrname, __attrval)
>>> +#else
>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>> +		__ASUS_ATTR_RO(_attrname, __attrval)
>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>> +
>>>  /* CPU core attributes need a little different in setup */
>>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
>>>  	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>>>  	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>>>  	static struct kobj_attribute attr_##_attrname##_current_value =	\
>>> -		__ASUS_ATTR_RW(_attrname, current_value);		\
>>> +		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
>>>  	static struct kobj_attribute attr_##_attrname##_default_value = \
>>>  		__ASUS_ATTR_RO(_attrname, default_value);		\
>>>  	static struct kobj_attribute attr_##_attrname##_min_value =	\
> Hi Denis,
Hi!
> This cores thing has unfortunately turned into too much of a mess, a fixup 
> after fixup, disagreement of even what should be included and what not.
I'm sorry for the trouble.
> I'm really sorry for all the extra trouble these people are putting you 
> through as apparently even 17 versions of the main patch series weren't 
> enough to get them to stretch their fingers over the keyboard :-/.
I was aware of what I was running into when I accepted
Luke's request to maintain asus-related things :)

The interface is being evolving since it's what asus keeps
integrating and changing on new hardware,
so unexpected things are to be expected... hah!
> I've now dropped the cores patch from the review-ilpo-next branch but 
> tried to keep the rest. Please check I didn't make any stupid mistakes 
> while resolving the resulting conflicts with the ppt/nv change, at least 
> the diff against the removal patch looked promising. If there's an issue, 
> please just provide a clean v18 of the main series without the cores patch 
> so I can replace.
Thanks! Looks good to me too, I have asked asus-linux kernel-man
to distribute this patchset taken from pdx86 repo: if you don't hear for
me in 2-3 hours the world isn't burning :D
> If you want to send a clean version of the cores patch (separately), I can 
> consider it after giving enough time for people to comment.
>
Going forward I think the best approach is to make the interface
compatible with new hardware and useful for who needs it:
- RO by default and disregarded by the driver in case of funny business
- RW for hardware that was requested and tested, similar to the TDP
  so that I can also be confident on what minimum cores count are per-model
  instead of relying on a macro and hoping for the best
- Integrating your suggestions

And that should satisfy everybody and make the interface safe.

Please everybody, let me know if this is an acceptable solution
that would make everyone involved happy: from developers
to final users (especially those who use this feature in Windows).

Thank you all,
Denis
