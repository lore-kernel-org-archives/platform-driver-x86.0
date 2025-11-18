Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC5A29E0E5
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 21:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763501387; cv=none; b=AJVXhL28goytxI+r7SH5Dm6AuP4+/VT6r4yd3YCjF6N3sBmZM/TpXRTAb95MNql+rvBqfeS1ilfH34g4Kd8vYuzb5tIDCGNf8C+rQgmeZ4SU5OAljqwlweW4EbPy0EIJDMQx5JPyJPicyivvKRygOOXYDBVtI8Ev3MvYXu8UGok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763501387; c=relaxed/simple;
	bh=oV1MTY/FcH8icSjy681axhjk34Jv4NEuAL7OcgAz54M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A0P1P0Oqm/qdrEIO06ewdXr6G8qeMJgyebe36PWD/XVdDMGkhKWgewl6CiV1yBSzsZfWda/oNcDZiz1tFmBYqijxFyqqHqb3OXivqAFanEyvHJJL6T8KapwZQWy9pH8YBZPlkjMWMXZDvyn4Xq3EQYVM14ywbfX2JfWyFVXdMS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rJYUuL1z; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rJYUuL1z"
Message-ID: <69ab8365-703d-4197-91a8-fbdec7577f46@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763501381;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oV1MTY/FcH8icSjy681axhjk34Jv4NEuAL7OcgAz54M=;
	b=rJYUuL1zsvtVk3YAY31MBpPcTh6RmeRftVrScw7/5TGMW0vhLuyBxNxy1K/+2G5iwPHxN2
	D/6tNCEgrTXVhkjDiFCeVny0ePVPK3pe+x+y47jkygXh8R7aDc+S97FhYkZlp1mdRe1zmT
	qdCVLK8LXqXegiom1AGArh891OLKrNE=
Date: Tue, 18 Nov 2025 22:29:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] platform/x86: asus-armoury: make CPU cores interface
 readonly
To: Mario Limonciello <mario.limonciello@amd.com>,
 "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Denis Benato <benato.denis96@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Alok Tiwari <alok.a.tiwari@oracle.com>, Mateusz Schyboll <dragonn@op.pl>,
 porfet828@gmail.com
References: <20251118005748.538726-1-denis.benato@linux.dev>
 <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com>
 <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com>
 <6c9d04da-cd46-4f50-8f99-ae169bb9a877@gmail.com>
 <2a478609-f59d-4b8a-8e74-db0b30b94dfd@amd.com>
 <24CA03AA-8C8F-47DA-B03D-5ACDCA8C648D@gmail.com>
 <dd5d79c5-0300-4e33-9918-6199fad0b9aa@amd.com>
Content-Language: en-US, it-IT, en-US-large
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <dd5d79c5-0300-4e33-9918-6199fad0b9aa@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 11/18/25 22:06, Mario Limonciello wrote:
>
>
> On 11/18/2025 2:59 PM, Derek J. Clark wrote:
>> On November 18, 2025 12:52:40 PM PST, Mario Limonciello <mario.limonciello@amd.com> wrote:
>>>
>>>
>>> On 11/18/2025 12:51 PM, Denis Benato wrote:
>>>>
>>>> On 11/18/25 10:16, Ilpo Järvinen wrote:
>>>>> On Tue, 18 Nov 2025, Denis Benato wrote:
>>>>>
>>>>>> On 11/18/25 01:57, Denis Benato wrote:
>>>>>>> The CPU cores interface is inconsistent between AMD and Intel systems,
>>>>>>> leading to probe failure: solve the problem taking following steps:
>>>>>>> - make the interface read-only (avoid the possibility of bricks)
>>>>>>> - do not fail if the interface returns unexpected data
>>>>>>> - show interface errors at either info or debug level
>>>>>> I felt like compile-time disabling the write endpoint after reading the comment
>>>>>> from Mario while still keeping the core of everything that was said in an attempt
>>>>>> to make everyone happy and preparing for the future.
>>>>>>
>>>>>> I can also evaluate the option to introduce a table for allowed models
>>>>>> where the min number of cores is hardcoded for model as it is for TDP
>>>>>> tunings: that way allowed values will be tested by someone...
>>>>>> Material for another day.
>>>>>>
>>>>>> On a side note checkpatch says:
>>>>>> ```
>>>>>> WARNING: Argument '_fsname' is not used in function-like macro
>>>>>> #293: FILE: drivers/platform/x86/asus-armoury.h:210:
>>>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)           \
>>>>>>           __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);        \
>>>>>>           __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>>>>>           static struct kobj_attribute attr_##_attrname##_current_value = \
>>>>>> +               __ASUS_ATTR_CPU_CORES(_attrname, current_value);        \
>>>>>>           static struct kobj_attribute attr_##_attrname##_default_value = \
>>>>>>                   __ASUS_ATTR_RO(_attrname, default_value);               \
>>>>>>           static struct kobj_attribute attr_##_attrname##_min_value =     \
>>>>>> ```
>>>>>>
>>>>>> but _fsname name is used just below in the same macro:
>>>>>> checkpatch.pl bug?
>>>>>>> Links:
>>>>>>> https://lore.kernel.org/all/20251114185337.578959-1-denis.benato@linux.dev/
>>>>>>> https://lore.kernel.org/all/20251115145158.1172210-1-denis.benato@linux.dev/
>>>>>>>
>>>>>>> Suggested-by: Luke D. Jones <luke@ljones.dev>
>>>>>>> Signed-off-by: Denis Benato <denis.benato@linux.dev>
>>>>>>> ---
>>>>>>>    drivers/platform/x86/asus-armoury.c | 104 ++++++++++++++++++++++++----
>>>>>>>    drivers/platform/x86/asus-armoury.h |  12 +++-
>>>>>>>    2 files changed, 99 insertions(+), 17 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>>>>>>> index 9f67218ecd14..abbbcd62d0eb 100644
>>>>>>> --- a/drivers/platform/x86/asus-armoury.c
>>>>>>> +++ b/drivers/platform/x86/asus-armoury.c
>>>>>>> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>>>>>>>         */
>>>>>>>        struct mutex egpu_mutex;
>>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>>        /*
>>>>>>>         * Mutex to prevent big/little core count changes writing to same
>>>>>>>         * endpoint at the same time. Must lock during attr store.
>>>>>>>         */
>>>>>>>        struct mutex cpu_core_mutex;
>>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>> +
>>>>>>>        struct cpu_cores *cpu_cores;
>>>>>>>        bool cpu_cores_changeable;
>>>>>>>    @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>>>>>>>    static struct asus_armoury_priv asus_armoury = {
>>>>>>>        .egpu_mutex = __MUTEX_INITIALIZER(asus_armoury.egpu_mutex),
>>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>>        .cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex),
>>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>>    };
>>>>>>>      struct fw_attrs_group {
>>>>>>> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_attribute *attr,
>>>>>>>                return -EINVAL;
>>>>>>>            }
>>>>>>>            break;
>>>>>>> +    case ASUS_WMI_DEVID_CORES_MAX:
>>>>>>> +        /*
>>>>>>> +         * CPU cores max is a read-only property on supported devices.
>>>>>>> +         */
>>>>>>> +        pr_err("Refusing to write to readonly devstate of CPU cores interface\n");
>>>>>>> +        return -EINVAL;
>>>>>>>        default:
>>>>>>>            /* No known problems are known for this dev_id */
>>>>>>>            break;
>>>>>>> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>>>>            return ERR_PTR(-ENODEV);
>>>>>>>        }
>>>>>>>    +    pr_debug("CPU cores control interface max cores read 0%x.\n", cores);
>>>>>>>        cores_p->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>>>>>        cores_p->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>>>>>    @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>>>>            return ERR_PTR(-EIO);
>>>>>>>        }
>>>>>>>    +    pr_debug("CPU cores control interface active cores read 0%x.\n", cores);
>>>>>>>        cores_p->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>>>>>>>        cores_p->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>>>>>>>          cores_p->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
>>>>>>>        cores_p->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>>>>>>>    +    if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>>>>>> +        pr_info("Invalid CPU performance cores count detected: min: %u, max: %u, current: %u\n",
>>>>>>> +               cores_p->min_perf_cores,
>>>>>>> +               cores_p->max_perf_cores,
>>>>>>> +               cores_p->cur_perf_cores
>>>>>>> +        );
>>>>>>> +        return ERR_PTR(-EINVAL);
>>>>>>> +    }
>>>>>>> +
>>>>>>>        if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>>>>>            (cores_p->min_power_cores > cores_p->max_power_cores)
>>>>>>>        ) {
>>>>>>> -        pr_err("Invalid CPU cores count detected: interface is not safe to be used.\n");
>>>>>>> +        pr_info("Invalid CPU efficiency cores count detected: min: %u, max: %u, current: %u\n",
>>>>>>> +               cores_p->min_power_cores,
>>>>>>> +               cores_p->max_power_cores,
>>>>>>> +               cores_p->cur_power_cores
>>>>>>> +        );
>>>>>>>            return ERR_PTR(-EINVAL);
>>>>>>>        }
>>>>>>>    @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(void)
>>>>>>>        return no_free_ptr(cores_p);
>>>>>>>    }
>>>>>>>    +/**
>>>>>>> + * cores_value_show() - Get the core count for the specified core type.
>>>>>>> + * @kobj: The kobject associated to caller.
>>>>>>> + * @attr: The kobj_attribute associated to caller.
>>>>>>> + * @buf: The buffer that will be used to sysfs_emit.
>>>>>>> + * @core_type: The core type (performance or efficiency).
>>>>>>> + * @core_value: min, max or current count for the specified cores type.
>>>>>>> + *
>>>>>>> + * Intended usage is from sysfs attribute reading a CPU core count.
>>>>>>> + *
>>>>>>> + * This function assumes asus_armoury.cpu_cores is already initialized,
>>>>>>> + * therefore the compatibility of the interface has already been checked.
>>>>>>> + *
>>>>>>> + * Returns:
>>>>>>> + * * %-EINVAL    - invalid core value type.
>>>>>>> + * * %0        - successful and buf is filled by sysfs_emit.
>>>>>>> + * * %other    - error from sysfs_emit.
>>>>>>> + */
>>>>>>>    static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>>>>>>>                    enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>>>>>    {
>>>>>>> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *att
>>>>>>>        return sysfs_emit(buf, "%u\n", cpu_core_value);
>>>>>>>    }
>>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>>    static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>>>>>                         const char *buf, enum cpu_core_type core_type)
>>>>>>>    {
>>>>>>> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attri
>>>>>>>          return 0;
>>>>>>>    }
>>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>>      static ssize_t cores_performance_min_value_show(struct kobject *kobj,
>>>>>>>                            struct kobj_attribute *attr, char *buf)
>>>>>>> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_show(struct kobject *kobj,
>>>>>>>        return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_CURRENT);
>>>>>>>    }
>>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>>    static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>>>>>                                 struct kobj_attribute *attr,
>>>>>>>                                 const char *buf, size_t count)
>>>>>>> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_store(struct kobject *kobj,
>>>>>>>          return count;
>>>>>>>    }
>>>>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>>>>>> -             "Set the max available performance cores");
>>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
>>>>>>> +             "Get available performance cores");
>>>>>>>      /* Define helper to access the current power mode tunable values */
>>>>>>>    static inline struct rog_tunables *get_current_tunables(void)
>>>>>>> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_show(struct kobject *kobj,
>>>>>>>        return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE_CURRENT);
>>>>>>>    }
>>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>>    static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>>>>>                                struct kobj_attribute *attr, const char *buf,
>>>>>>>                                size_t count)
>>>>>>> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_store(struct kobject *kobj,
>>>>>>>          return count;
>>>>>>>    }
>>>>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>>>>>> -            "Set the max available efficiency cores");
>>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
>>>>>>> +            "Get available efficiency cores");
>>>>>>>      /* Simple attribute creation */
>>>>>>>    ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2\n",
>>>>>>> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>>>>>>        { &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>>>>>        { &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>>>>>        { &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>>>>>> -    { &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>>>> -    { &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>>>>          { &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>>>>>        { &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>>>>>>> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>>>>>>>            }
>>>>>>>        }
>>>>>>>    +    if (asus_armoury.cpu_cores != NULL) {
>>>>>>> +        err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>>> +                    &cores_efficiency_attr_group);
>>>>>>> +        if (err) {
>>>>>>> +            pr_err("Failed to create sysfs-group for cpu efficiency cores: %d\n", err);
>>>>>>> +            goto err_remove_cores_efficiency_group;
>>>>>>> +        }
>>>>>>> +
>>>>>>> +        err = sysfs_create_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>>> +                    &cores_performance_attr_group);
>>>>>>> +        if (err) {
>>>>>>> +            pr_err("Failed to create sysfs-group for cpu performance cores: %d\n", err);
>>>>>>> +            goto err_remove_cores_performance_group;
>>>>>>> +        }
>>>>>>> +    }
>>>>>>> +
>>>>>>>        for (i = 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>>>>>>>            if (!armoury_has_devstate(armoury_attr_groups[i].wmi_devid))
>>>>>>>                continue;
>>>>>>> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>>>>>>>        }
>>>>>>>        if (asus_armoury.gpu_mux_dev_id)
>>>>>>>            sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>>>>> +err_remove_cores_performance_group:
>>>>>>> +    if (asus_armoury.cpu_cores != NULL)
>>>>>>> +        sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_performance_attr_group);
>>>>>>> +err_remove_cores_efficiency_group:
>>>>>>> +    if (asus_armoury.cpu_cores != NULL)
>>>>>>> +        sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &cores_efficiency_attr_group);
>>>>>>>    err_remove_mini_led_group:
>>>>>>>        if (asus_armoury.mini_led_dev_id)
>>>>>>>            sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &mini_led_mode_attr_group);
>>>>>>> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>>>>>>>    {
>>>>>>>        char *wmi_uid;
>>>>>>>        struct cpu_cores *cpu_cores_ctrl;
>>>>>>> -    int err;
>>>>>>>          wmi_uid = wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>>>>>>>        if (!wmi_uid)
>>>>>>> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>>>>>>>            return -ENODEV;
>>>>>>>          asus_armoury.cpu_cores_changeable = false;
>>>>>>> +    asus_armoury.cpu_cores = NULL;
>>>>>>>        if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>>>>>            cpu_cores_ctrl = init_cpu_cores_ctrl();
>>>>>>> -        if (IS_ERR(cpu_cores_ctrl)) {
>>>>>>> -            err = PTR_ERR(cpu_cores_ctrl);
>>>>>>> -            pr_err("Could not initialise CPU core control: %d\n", err);
>>>>>>> -            return err;
>>>>>>> +        if (!IS_ERR(cpu_cores_ctrl)) {
>>>>>>> +            pr_debug("CPU cores control available.\n");
>>>>>>> +            asus_armoury.cpu_cores = cpu_cores_ctrl;
>>>>>>> +            asus_armoury.cpu_cores_changeable = true;
>>>>>>>            }
>>>>>>> -
>>>>>>> -        asus_armoury.cpu_cores = cpu_cores_ctrl;
>>>>>>> -        asus_armoury.cpu_cores_changeable = true;
>>>>>>>        }
>>>>>>>          init_rog_tunables();
>>>>>>> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>>>>>>>                           armoury_attr_groups[i].attr_group);
>>>>>>>        }
>>>>>>>    +    if (asus_armoury.cpu_cores != NULL) {
>>>>>>> +        sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>>> +                   &cores_performance_attr_group);
>>>>>>> +        sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj,
>>>>>>> +                   &cores_efficiency_attr_group);
>>>>>>> +    }
>>>>>>> +
>>>>>>>        if (asus_armoury.gpu_mux_dev_id)
>>>>>>>            sysfs_remove_group(&asus_armoury.fw_attr_kset->kobj, &gpu_mux_mode_attr_group);
>>>>>>>    diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
>>>>>>> index 2f05a2e0cab3..6b2bfe763d23 100644
>>>>>>> --- a/drivers/platform/x86/asus-armoury.h
>>>>>>> +++ b/drivers/platform/x86/asus-armoury.h
>>>>>>> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject *kobj, struct kobj_attribute *attr
>>>>>>>            .name = _fsname, .attrs = _attrname##_attrs            \
>>>>>>>        }
>>>>>>>    +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>>> +    #define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>>>>> +        __ASUS_ATTR_RW(_attrname, __attrval)
>>>>>>> +#else
>>>>>>> +    #define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>>>>> +        __ASUS_ATTR_RO(_attrname, __attrval)
>>>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>>> +
>>>>>>>    /* CPU core attributes need a little different in setup */
>>>>>>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)        \
>>>>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)        \
>>>>>>>        __ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);    \
>>>>>>>        __ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);    \
>>>>>>>        static struct kobj_attribute attr_##_attrname##_current_value =    \
>>>>>>> -        __ASUS_ATTR_RW(_attrname, current_value);        \
>>>>>>> +        __ASUS_ATTR_CPU_CORES(_attrname, current_value);    \
>>>>>>>        static struct kobj_attribute attr_##_attrname##_default_value = \
>>>>>>>            __ASUS_ATTR_RO(_attrname, default_value);        \
>>>>>>>        static struct kobj_attribute attr_##_attrname##_min_value =    \
>>>>> Hi Denis,
>>>> Hi!
>>>>> This cores thing has unfortunately turned into too much of a mess, a fixup
>>>>> after fixup, disagreement of even what should be included and what not.
>>>> I'm sorry for the trouble.
>>>>> I'm really sorry for all the extra trouble these people are putting you
>>>>> through as apparently even 17 versions of the main patch series weren't
>>>>> enough to get them to stretch their fingers over the keyboard :-/.
>>>> I was aware of what I was running into when I accepted
>>>> Luke's request to maintain asus-related things :)
>>>>
>>>> The interface is being evolving since it's what asus keeps
>>>> integrating and changing on new hardware,
>>>> so unexpected things are to be expected... hah!
>>>>> I've now dropped the cores patch from the review-ilpo-next branch but
>>>>> tried to keep the rest. Please check I didn't make any stupid mistakes
>>>>> while resolving the resulting conflicts with the ppt/nv change, at least
>>>>> the diff against the removal patch looked promising. If there's an issue,
>>>>> please just provide a clean v18 of the main series without the cores patch
>>>>> so I can replace.
>>>> Thanks! Looks good to me too, I have asked asus-linux kernel-man
>>>> to distribute this patchset taken from pdx86 repo: if you don't hear for
>>>> me in 2-3 hours the world isn't burning :D
>>>>> If you want to send a clean version of the cores patch (separately), I can
>>>>> consider it after giving enough time for people to comment.
>>>>>
>>>> Going forward I think the best approach is to make the interface
>>>> compatible with new hardware and useful for who needs it:
>>>> - RO by default and disregarded by the driver in case of funny business
>>>> - RW for hardware that was requested and tested, similar to the TDP
>>>>     so that I can also be confident on what minimum cores count are per-model
>>>>     instead of relying on a macro and hoping for the best
>>>> - Integrating your suggestions
>>>>
>>>> And that should satisfy everybody and make the interface safe.
>>>>
>>>> Please everybody, let me know if this is an acceptable solution
>>>> that would make everyone involved happy: from developers
>>>> to final users (especially those who use this feature in Windows).
>>>>
>>>> Thank you all,
>>>> Denis
>>>
>>>
>>> It's up to you at the end of the day if you want some machines to be opt in to RW, but I don't think this fair to treat this the same as TDP.
>>>
>>> We only have one way to change TDP on these machines - the BIOS interface.
>>>
>>> For parking of cores there is the BIOS method or Linux native support for offlining cores.
>>
>> There is one caveat which I think is relevant, if a core was disabled in windows, BIOS, or a previous version of this patch set using this interface, you would need to use BIOS or windows to re-enable it.
>>
>> I'm on the fence if that justifies having an optional table of verified working hardware though, considering the risk I think would just recommend folks use the BIOS interface for it.
>>
>> - Derek
>
> I feel that someone that was technical enough to set up a dual boot in the first place and change this option is PROBABLY also technical enough to go into the BIOS and poke around to turn it off if they no longer have Windows on the system. 
>
For me what really makes a difference is having or not having the interface.

If we don't need it I don't need to do anything,
if we need it I will need to understand the data format on AMD systems
and adding the write endpoint doesn't take that much more time
and neither adding a table with model -> min therefore I think the
debate here is if we should have the interface.

Once the format is known it's just a matter of a few hours making it
RW: this increases fragmentation on how to disable cores, but
I can't do anything about that except ignoring the interface...
