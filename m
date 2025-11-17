Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21A258EDE
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Nov 2025 18:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763405262; cv=none; b=MJOYvBqzczS6+GHpJ529V7t/DRHevLjT2pGW47Aw2UK4Tsz5NyU5jK+OTeoCdFQnDrIVz1ftuZZ3k+BS6r5R1TvX05j5uQxz1uY8/TYYfvl/cmWIvd++mlXmYCPydjGDZSl+4So0LwXs4Pi5tzyfMpcAf653JY8J0pCwhq53DE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763405262; c=relaxed/simple;
	bh=zon5AfyKjx3+oKjpKEKKGiR1LnxXVTHSS5cDdUMP9fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCJzF+I08dd9lGKgkmMWtOtZrbxvMyY0cYiFwSr1cnDC8DcALTu04eQqvGEQZroFm2Acjmj0hIna2jfYdmDxXSA9469mnIkWYal7GpjEWLFyX2hF4b2M3kZYTUKfuvXDMqznwmuOssEUN7xgPz38g6sTeq9jBmROd+R5hvFhRRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=U0LkRqkI; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="U0LkRqkI"
Message-ID: <957ff0c9-8f97-48fc-9425-895fd55da42e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763405256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H2TXk0tyOkrgongTgt1uvbnhmwlEL8N7PnVqvsmgWB0=;
	b=U0LkRqkI+i0NijH+fzxJReD1h4++E7IlBp9IpR3lIKshsJW79GwLz4L6+pyTWk6Bw2cRiz
	UWAjzWQ2R25/5UCtb5v+/Bpjc3oVOMfA58qk/dFpvGV9geOch58sIsX8zlfzBHl020nVPy
	jvCRkF+qluqE+3eLYX6zCvwn1YQ4s80=
Date: Mon, 17 Nov 2025 19:47:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: remove unsafe CPU cores
 unsafe interface
To: luke@ljones.dev
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com,
 Denis Benato <benato.denis96@gmail.com>
References: <20251115145158.1172210-1-denis.benato@linux.dev>
 <A7906040-D491-4D34-969E-64E172FA9126@ljones.dev>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <A7906040-D491-4D34-969E-64E172FA9126@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/17/25 05:27, luke@ljones.dev wrote:
>> On 16 Nov 2025, at 03:51, Denis Benato <denis.benato@linux.dev> wrote:
>>
>> CPU cores unsafe interface is known to be problematic and recently new
>> hardware that is using it in an incompatible way was released, therefore
>> remove this interface to avoid any present and future risks.
>>
>> Link: https://lore.kernel.org/all/018ce202-420c-40c9-a089-b3509c7ee4bd@gmail.com
> I’ll copy/paste my response to other thread here:
>
> I spent a long time debating this myself. Never liked it tbh (the implementation or the actual setting).
> It seems that at least making it RO so that if a user changes the settings using the BIOS controls for it, it can at least be tracked in userspace and not lead to confusion might be the best option. It only needs to show the values then - no min/max or other parts required.
I haven't considered the mixed usage of windows/linux,
perhaps we can rely on the BIOS to change the core count, but
thinking more about this considering:
- the user-facing interface is correct
- this interface is unsafe only when writing
- it must not prevent the rest of the attributes to function

> This setting is independent to the AMD version and if BIOS changes it, it may lead to a lot of confusion between this plus the official AMD setting.
> If users dual boot at all and use the armoury crate to control this, then that app will use the WMI methods. Again leading to confusion in Linux environment. This is actually the main reason I implemented it first time around and it was initially a read-only attribute.
>
> Do what is best for users and maintenance and safety. At least make it RO at a minimum.
I think I will propose to make the _store compile-time disabled behind a config that can't be enabled.

This way the code is kept and I can work on it and users will get the RO version
until we are very happy with the attribute write.

This also has the benefit of not removing the code that was just merged
hopefully making things easier for everybody.

To proceed I will fuse [1] after integrating Mario's suggestions to the
making it RO, unless someone isn't opposed for some reason.

Please let me know what you this.

Regards,
Denis

1. https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev

> Cheers,
> Luke.
>
>> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
>> Suggested-by: Derek John Clark <derekjohn.clark@gmail.com>
>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>> ---
>> drivers/platform/x86/asus-armoury.c        | 286 +--------------------
>> drivers/platform/x86/asus-armoury.h        |  28 --
>> include/linux/platform_data/x86/asus-wmi.h |   2 +-
>> 3 files changed, 8 insertions(+), 308 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>> index 9f67218ecd14..31a3046b7d63 100644
>> --- a/drivers/platform/x86/asus-armoury.c
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -60,39 +60,9 @@
>> #define ATTR_NV_BASE_TGP        "nv_base_tgp"
>> #define ATTR_NV_TGP             "nv_tgp"
>>
>> -#define ASUS_POWER_CORE_MASK	GENMASK(15, 8)
>> -#define ASUS_PERF_CORE_MASK	GENMASK(7, 0)
>> -
>> #define ASUS_ROG_TUNABLE_DC 0
>> #define ASUS_ROG_TUNABLE_AC 1
>>
>> -enum cpu_core_type {
>> -	CPU_CORE_PERF = 0,
>> -	CPU_CORE_POWER,
>> -};
>> -
>> -enum cpu_core_value {
>> -	CPU_CORE_DEFAULT = 0,
>> -	CPU_CORE_MIN,
>> -	CPU_CORE_MAX,
>> -	CPU_CORE_CURRENT,
>> -};
>> -
>> -/* Minimum number of performance cores (P-cores) */
>> -#define CPU_PERF_CORE_COUNT_MIN 4
>> -/* Minimum number of efficiency cores (E-cores) */
>> -#define CPU_POWR_CORE_COUNT_MIN 0
>> -
>> -/* Tunables provided by ASUS for gaming laptops */
>> -struct cpu_cores {
>> -	u32 cur_perf_cores;
>> -	u32 min_perf_cores;
>> -	u32 max_perf_cores;
>> -	u32 cur_power_cores;
>> -	u32 min_power_cores;
>> -	u32 max_power_cores;
>> -};
>> -
>> struct rog_tunables {
>> 	const struct power_limits *power_limits;
>> 	u32 ppt_pl1_spl;			// cpu
>> @@ -118,14 +88,6 @@ struct asus_armoury_priv {
>> 	 */
>> 	struct mutex egpu_mutex;
>>
>> -	/*
>> -	 * Mutex to prevent big/little core count changes writing to same
>> -	 * endpoint at the same time. Must lock during attr store.
>> -	 */
>> -	struct mutex cpu_core_mutex;
>> -	struct cpu_cores *cpu_cores;
>> -	bool cpu_cores_changeable;
>> -
>> 	/* Index 0 for DC, 1 for AC */
>> 	struct rog_tunables *rog_tunables[2];
>>
>> @@ -135,8 +97,6 @@ struct asus_armoury_priv {
>>
>> static struct asus_armoury_priv asus_armoury = {
>> 	.egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>> -
>> -	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
>> };
>>
>> struct fw_attrs_group {
>> @@ -168,8 +128,6 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>> static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>> {
>> 	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
>> -	       !strcmp(attr->attr.name, "cores_performance") ||
>> -	       !strcmp(attr->attr.name, "cores_efficiency") ||
>> 	       !strcmp(attr->attr.name, "panel_hd_mode");
>> }
>>
>> @@ -275,16 +233,14 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>> 		break;
>> 	case ASUS_WMI_DEVID_CORES:
>> 		/*
>> -		 * Prevent risk disabling cores essential for booting the system
>> -		 * up to a point where system settings can be reset:
>> -		 * this has already caused unrecoverable bricks in the past.
>> +		 * Due to out-of-specification usage, this WMI interface
>> +		 * has already caused unrecoverable bricks in the past.
>> 		 */
>> -		if ((FIELD_GET(ASUS_POWER_CORE_MASK, value) < CPU_POWR_CORE_COUNT_MIN) ||
>> -		    (FIELD_GET(ASUS_PERF_CORE_MASK, value) < CPU_PERF_CORE_COUNT_MIN)) {
>> -			pr_err("Refusing to set CPU cores to unsafe value: 0x%x\n", value);
>> -			return -EINVAL;
>> -		}
>> -		break;
>> +		pr_err("Refusing to use CPU cores count unsafe interface\n");
>> +		return -EINVAL;
>> +	case ASUS_WMI_DEVID_CORES_MAX:
>> +		pr_err("Refusing to write to readonly devstate part of unsafe interface\n");
>> +		return -EINVAL;
>> 	default:
>> 		/* No known problems are known for this dev_id */
>> 		break;
>> @@ -787,178 +743,6 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>> }
>> ASUS_ATTR_GROUP_ENUM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>>
>> -static struct cpu_cores *init_cpu_cores_ctrl(void)
>> -{
>> -	u32 cores;
>> -	int err;
>> -	struct cpu_cores *cores_p __free(kfree) = NULL;
>> -
>> -	cores_p = kzalloc(sizeof(struct cpu_cores), GFP_KERNEL);
>> -	if (!cores_p)
>> -		return ERR_PTR(-ENOMEM);
>> -
>> -	err = armoury_get_devstate(NULL, &cores, ASUS_WMI_DEVID_CORES_MAX);
>> -	if (err) {
>> -		pr_err("ACPI does not support CPU core count control\n");
>> -		return ERR_PTR(-ENODEV);
>> -	}
>> -
>> -	cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>> -	cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>> -
>> -	err = armoury_get_devstate(NULL, &cores, ASUS_WMI_DEVID_CORES);
>> -	if (err) {
>> -		pr_err("Could not get CPU core count: error %d\n", err);
>> -		return ERR_PTR(-EIO);
>> -	}
>> -
>> -	cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>> -	cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>> -
>> -	cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>> -	cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>> -
>> -	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>> -	    (cores_p->min_power_cores > cores_p->max_power_cores)
>> -	) {
>> -		pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>> -		return ERR_PTR(-EINVAL);
>> -	}
>> -
>> -	if ((cores_p->cur_perf_cores > cores_p->max_perf_cores) ||
>> -		(cores_p->cur_power_cores > cores_p->max_power_cores) ||
>> -		(cores_p->cur_perf_cores < cores_p->min_perf_cores) ||
>> -		(cores_p->cur_power_cores < cores_p->min_power_cores)
>> -	) {
>> -		pr_warn("Current CPU cores count are outside safe limits.\n");
>> -	}
>> -
>> -	return no_free_ptr(cores_p);
>> -}
>> -
>> -static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>> -				enum cpu_core_type core_type, enum cpu_core_value core_value)
>> -{
>> -	u32 cpu_core_value;
>> -
>> -	switch (core_value) {
>> -	case CPU_CORE_DEFAULT:
>> -	case CPU_CORE_MAX:
>> -		cpu_core_value = (core_type == CPU_CORE_PERF) ?
>> -			asus_armoury.cpu_cores->max_perf_cores :
>> -			asus_armoury.cpu_cores->max_power_cores;
>> -		break;
>> -	case CPU_CORE_MIN:
>> -		cpu_core_value = (core_type == CPU_CORE_PERF) ?
>> -			asus_armoury.cpu_cores->min_perf_cores :
>> -			asus_armoury.cpu_cores->min_power_cores;
>> -		break;
>> -	case CPU_CORE_CURRENT:
>> -		cpu_core_value = (core_type == CPU_CORE_PERF) ?
>> -			asus_armoury.cpu_cores->cur_perf_cores :
>> -			asus_armoury.cpu_cores->cur_power_cores;
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> -	}
>> -
>> -	return sysfs_emit(buf, "%u\n", cpu_core_value);
>> -}
>> -
>> -static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>> -					 const char *buf, enum cpu_core_type core_type)
>> -{
>> -	u32 new_cores, perf_cores, power_cores, out_val, min, max, result;
>> -	int err;
>> -
>> -	result = kstrtou32(buf, 10, &new_cores);
>> -	if (result)
>> -		return result;
>> -
>> -	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
>> -		if (!asus_armoury.cpu_cores_changeable) {
>> -			pr_warn("CPU core count change not allowed until reboot\n");
>> -			return -EBUSY;
>> -		}
>> -
>> -		if (core_type == CPU_CORE_PERF) {
>> -			perf_cores = new_cores;
>> -			power_cores = asus_armoury.cpu_cores->cur_power_cores;
>> -			min = asus_armoury.cpu_cores->min_perf_cores;
>> -			max = asus_armoury.cpu_cores->max_perf_cores;
>> -		} else {
>> -			perf_cores = asus_armoury.cpu_cores->cur_perf_cores;
>> -			power_cores = new_cores;
>> -			min = asus_armoury.cpu_cores->min_power_cores;
>> -			max = asus_armoury.cpu_cores->max_power_cores;
>> -		}
>> -
>> -		if (new_cores < min || new_cores > max)
>> -			return -EINVAL;
>> -
>> -		out_val = FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores) |
>> -			FIELD_PREP(ASUS_POWER_CORE_MASK, power_cores);
>> -
>> -		asus_armoury.cpu_cores_changeable = false;
>> -		err = armoury_set_devstate(attr, out_val, &result, ASUS_WMI_DEVID_CORES);
>> -		if (err) {
>> -			pr_warn("Failed to set CPU core count: %d\n", err);
>> -			return err;
>> -		}
>> -
>> -		if (result > 1) {
>> -			pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
>> -			return -EIO;
>> -		}
>> -	}
>> -
>> -	pr_info("CPU core count changed, reboot required\n");
>> -
>> -	sysfs_notify(kobj, NULL, attr->attr.name);
>> -	asus_set_reboot_and_signal_event();
>> -
>> -	return 0;
>> -}
>> -
>> -static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>> -						struct kobj_attribute *attr, char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MIN);
>> -}
>> -
>> -static ssize_t cores_performance_max_value_show(struct kobject *kobj,
>> -						struct kobj_attribute *attr, char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_MAX);
>> -}
>> -
>> -static ssize_t cores_performance_default_value_show(struct kobject *kobj,
>> -						    struct kobj_attribute *attr, char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_DEFAULT);
>> -}
>> -
>> -static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>> -						    struct kobj_attribute *attr, char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>> -}
>> -
>> -static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>> -						     struct kobj_attribute *attr,
>> -						     const char *buf, size_t count)
>> -{
>> -	int err;
>> -
>> -	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_PERF);
>> -	if (err)
>> -		return err;
>> -
>> -	return count;
>> -}
>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>> -			 "Set the max available performance cores");
>> -
>> /* Define helper to access the current power mode tunable values */
>> static inline struct rog_tunables *get_current_tunables(void)
>> {
>> @@ -968,45 +752,6 @@ static inline struct rog_tunables *get_current_tunables(void)
>> 	return asus_armoury.rog_tunables[ASUS_ROG_TUNABLE_DC];
>> }
>>
>> -static ssize_t cores_efficiency_min_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>> -					       char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MIN);
>> -}
>> -
>> -static ssize_t cores_efficiency_max_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>> -					       char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_MAX);
>> -}
>> -
>> -static ssize_t cores_efficiency_default_value_show(struct kobject *kobj,
>> -						   struct kobj_attribute *attr, char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_DEFAULT);
>> -}
>> -
>> -static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>> -						   struct kobj_attribute *attr, char *buf)
>> -{
>> -	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>> -}
>> -
>> -static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>> -						    struct kobj_attribute *attr, const char *buf,
>> -						    size_t count)
>> -{
>> -	int err;
>> -
>> -	err = cores_current_value_store(kobj, attr, buf, CPU_CORE_POWER);
>> -	if (err)
>> -		return err;
>> -
>> -	return count;
>> -}
>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>> -		    "Set the max available efficiency cores");
>> -
>> /* Simple attribute creation */
>> ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>> 			    "Show the current mode of charging");
>> @@ -1048,8 +793,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>> 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>> 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>> 	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>
>> 	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>> 	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>> @@ -1374,8 +1117,6 @@ static void init_rog_tunables(void)
>> static int __init asus_fw_init(void)
>> {
>> 	char *wmi_uid;
>> -	struct cpu_cores *cpu_cores_ctrl;
>> -	int err;
>>
>> 	wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>> 	if (!wmi_uid)
>> @@ -1388,19 +1129,6 @@ static int __init asus_fw_init(void)
>> 	if (!strcmp(wmi_uid, ASUS_ACPI_UID_ASUSWMI))
>> 		return -ENODEV;
>>
>> -	asus_armoury.cpu_cores_changeable = false;
>> -	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>> -		cpu_cores_ctrl = init_cpu_cores_ctrl();
>> -		if (IS_ERR(cpu_cores_ctrl)) {
>> -			err = PTR_ERR(cpu_cores_ctrl);
>> -			pr_err("Could not initialise CPU core control: %d\n", err);
>> -			return err;
>> -		}
>> -
>> -		asus_armoury.cpu_cores = cpu_cores_ctrl;
>> -		asus_armoury.cpu_cores_changeable = true;
>> -	}
>> -
>> 	init_rog_tunables();
>>
>> 	/* Must always be last step to ensure data is available */
>> diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>> index 2f05a2e0cab3..548c66c590a6 100644
>> --- a/drivers/platform/x86/asus-armoury.h
>> +++ b/drivers/platform/x86/asus-armoury.h
>> @@ -198,34 +198,6 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>> 		.name = _fsname, .attrs = _attrname##_attrs			\
>> 	}
>>
>> -/* CPU core attributes need a little different in setup */
>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
>> -	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>> -	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>> -	static struct kobj_attribute attr_##_attrname##_current_value =	\
>> -		__ASUS_ATTR_RW(_attrname, current_value);		\
>> -	static struct kobj_attribute attr_##_attrname##_default_value = \
>> -		__ASUS_ATTR_RO(_attrname, default_value);		\
>> -	static struct kobj_attribute attr_##_attrname##_min_value =	\
>> -		__ASUS_ATTR_RO(_attrname, min_value);			\
>> -	static struct kobj_attribute attr_##_attrname##_max_value =	\
>> -		__ASUS_ATTR_RO(_attrname, max_value);			\
>> -	static struct kobj_attribute attr_##_attrname##_type =		\
>> -		__ASUS_ATTR_RO_AS(type, int_type_show);			\
>> -	static struct attribute *_attrname##_attrs[] = {		\
>> -		&attr_##_attrname##_current_value.attr,			\
>> -		&attr_##_attrname##_default_value.attr,			\
>> -		&attr_##_attrname##_min_value.attr,			\
>> -		&attr_##_attrname##_max_value.attr,			\
>> -		&attr_##_attrname##_scalar_increment.attr,		\
>> -		&attr_##_attrname##_display_name.attr,			\
>> -		&attr_##_attrname##_type.attr,				\
>> -		NULL							\
>> -	};								\
>> -	static const struct attribute_group _attrname##_attr_group = {	\
>> -		.name = _fsname, .attrs = _attrname##_attrs		\
>> -	}
>> -
>> #define ASUS_ATTR_GROUP_INT_VALUE_ONLY_RO(_attrname, _fsname, _wmi, _dispname)	\
>> 	ASUS_WMI_SHOW_INT(_attrname##_current_value, _wmi);		\
>> 	static struct kobj_attribute attr_##_attrname##_current_value =		\
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 51b7ccddbdaf..076b709f980e 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -139,7 +139,7 @@
>>
>> /* Intel E-core and P-core configuration in a format 0x0[E]0[P] */
>> #define ASUS_WMI_DEVID_CORES		0x001200D2
>> - /* Maximum Intel E-core and P-core availability */
>> +/* Maximum Intel E-core and P-core availability */
>> #define ASUS_WMI_DEVID_CORES_MAX	0x001200D3
>>
>> #define ASUS_WMI_DEVID_APU_MEM		0x000600C1
>> -- 
>> 2.51.2
>>
