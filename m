Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAB430BF6D
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 20:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763499562; cv=none; b=XsEvOZkWd2AXWjflQqrdsb29SMC0ueIxyB/bMeaYPW26BrUOyPpgYiZ2G+QqWyKnMJ6St/xV7o0h8BFUsv4lAvien7fu86kI0UkexLlGiqVmsTaPnAM2PjzSNRn7QmKETX6vjuwDs+7su3IfXkJ4jdT6WnD5BTGjOYPhG4r5ahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763499562; c=relaxed/simple;
	bh=y+r4bwWD3I0TQGszY61OA0ZK355LWicPxilY8ZefD64=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qb1bBDjkWRSb9zoT5khnM41NA7Abi8eJqXRajX1ltQJFxvj3Ehi5eHErMNqkDPmmV4uCluaWaruxMRCMC292oPGwrbdSc8JYCe2WLxQWbk3us4/uWdpjK8ytjZC3s+lZpJelcOQWQ5K2QnsMmXNzfBIprmAOAFvQ+miIUhwMhD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8GAn/MR; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8GAn/MR"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-bc0e6d91222so4388185a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 12:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763499560; x=1764104360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ka6krMm5sFKSPPl2V4/cMd8dsxpb7i+7Vl8bv6duoRc=;
        b=c8GAn/MR/IHx03VzL1TRCZJ6huzoI3YUEAvfuIyJVm0evwut/O5njzk+7ekt9yNLTV
         sqFRx+gaiQu5p55FwY0GfCpZAcchRi3xw9DXQWf9iB6Km2GwtfDT42CIqkMqJou3w4Gk
         y/MP6RP4/KMPaVer9zrodzolz4yqQh5jJRs1m06d9hGe7KRSnKA4Yfk1gAOvzxpTbQ8w
         xDYXDPODmuDtGoC/nZ82cXy7226/AeKEsBVRLqRHVlRQjUUZZ3L0M6W42Lhk49dmVoxT
         jAgUdP7+QL/ykQtHvzP25QbsEm8z95fW08wZFNIe9pTVyOKrLpoa1iOXQPaOWegXGKkJ
         4X+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763499560; x=1764104360;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ka6krMm5sFKSPPl2V4/cMd8dsxpb7i+7Vl8bv6duoRc=;
        b=aVr7WxcOXFOcRh1Bjv4XSG7MBzELWcZ4r5jaSNxt66E2N878RDmsXL2wddWj2aOene
         99EVImNdXKI6MJ3oKahwljTsMHNixflEh7ohtUH6zwgm/VokNfBRuAyQgZmUAaiLw9x3
         RvbkWDe5Fv1ZPiAiVUbDyzV7aMmzehbQ4cEHa6VRmuJgwg4sY7Q19P4mm1fnMeJK60Jj
         ZYxrlSoDF0sz6wY0OAMd4ZCK8+JFzeAGHj3YB+Dm9wtiShm7WmPa2wxIukUDR5IYBCpG
         92DfPOLASS9bTPhboRTx30jPQJcOelpHUfUGLPmKKqaXFp9Y4cz4v73EIouUu5j87VWH
         I4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWo3cYYKMw7JfWNyOhxDp/Y3cYT+fyJ9qlZR1ENfmTFAd0dbK6BjxFdYIYT3JP2c9nKV19pY6P7U2D6DfWi6JKQS7b@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzAM0/aL9lQsFpG+PDcEgmMStW8/j36ZxjfDi++VZR507pxCv
	Y9qzW5VABETdriFXyCRp5Fn4UyOiqPq6SadCDcOUxoAt1N9mxXzuVdJm
X-Gm-Gg: ASbGncsNm8h9CbhSZM+HqHkXooWmNpiJjpXOmrDf3qfjAVRzcDPDRfqsbwzLGh5BEgp
	6OvugAGR8f1WrVnblLjx8e40EGp5npNIiXV3IMxJ/u4N5kmMkbXJOYICkqwhMBG0KBO9Re9/ZBl
	pYFATX9mO7/Zsv5LoFEAsedGj8ldU0x3ftX0UZe37/WqAHfDrItsTbjxkHYARZFeU3wiJrmumPe
	mKXpsKKtiyHB2C/DbqzD0jpR+HEj0m0voY5ZgtuHhRyXiBQjkx8I/8eIKJlzilZkmlFkdlxAFHM
	GkQrwt2ZVW1vQTB2nlyurEfgDQ25ivMAiPETy1o02NHBvZy6X3WC4CYLtnvABS+gfDLK/cFeNMy
	FDgvIfaZqEqaBOLP+z0lpoRyE3OBaZgZM1G8T3tLNtzYpIngFORNSfcGcytHZlTuKNsHKQKZKRE
	Q0YLE/A3mSOLeoSnYWZL2l8xXwD2ViYnyQmki5J71st8f3QmD3CyW4wOxELEvvQlRJtnYGRaAqu
	uWmY1CWza9ABDtTQrUr
X-Google-Smtp-Source: AGHT+IH+36h1Y3Ctm1J84IocHYqdbB3YE/3ZAR1GfqKYV69tWM4kWVhGji0oY+xArOuiXcNuaELkBw==
X-Received: by 2002:a05:7301:f8b:b0:2a4:3593:6471 with SMTP id 5a478bee46e88-2a4abb377bdmr5188423eec.33.1763499559575;
        Tue, 18 Nov 2025 12:59:19 -0800 (PST)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49db4a36asm47667521eec.5.2025.11.18.12.59.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 12:59:19 -0800 (PST)
Date: Tue, 18 Nov 2025 12:59:18 -0800
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
 Denis Benato <benato.denis96@gmail.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Denis Benato <denis.benato@linux.dev>, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_platform/x86=3A_asus-armou?=
 =?US-ASCII?Q?ry=3A_make_CPU_cores_interface_readonly?=
User-Agent: Thunderbird for Android
In-Reply-To: <2a478609-f59d-4b8a-8e74-db0b30b94dfd@amd.com>
References: <20251118005748.538726-1-denis.benato@linux.dev> <6cc986bc-2f0d-43e5-99d7-0cbfd9150005@gmail.com> <e1ce4d86-d741-e5fa-9ff3-ddbe3abc4f48@linux.intel.com> <6c9d04da-cd46-4f50-8f99-ae169bb9a877@gmail.com> <2a478609-f59d-4b8a-8e74-db0b30b94dfd@amd.com>
Message-ID: <24CA03AA-8C8F-47DA-B03D-5ACDCA8C648D@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On November 18, 2025 12:52:40 PM PST, Mario Limonciello <mario=2Elimonciell=
o@amd=2Ecom> wrote:
>
>
>On 11/18/2025 12:51 PM, Denis Benato wrote:
>>=20
>> On 11/18/25 10:16, Ilpo J=C3=A4rvinen wrote:
>>> On Tue, 18 Nov 2025, Denis Benato wrote:
>>>=20
>>>> On 11/18/25 01:57, Denis Benato wrote:
>>>>> The CPU cores interface is inconsistent between AMD and Intel system=
s,
>>>>> leading to probe failure: solve the problem taking following steps:
>>>>> - make the interface read-only (avoid the possibility of bricks)
>>>>> - do not fail if the interface returns unexpected data
>>>>> - show interface errors at either info or debug level
>>>> I felt like compile-time disabling the write endpoint after reading t=
he comment
>>>> from Mario while still keeping the core of everything that was said i=
n an attempt
>>>> to make everyone happy and preparing for the future=2E
>>>>=20
>>>> I can also evaluate the option to introduce a table for allowed model=
s
>>>> where the min number of cores is hardcoded for model as it is for TDP
>>>> tunings: that way allowed values will be tested by someone=2E=2E=2E
>>>> Material for another day=2E
>>>>=20
>>>> On a side note checkpatch says:
>>>> ```
>>>> WARNING: Argument '_fsname' is not used in function-like macro
>>>> #293: FILE: drivers/platform/x86/asus-armoury=2Eh:210:
>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>>>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ATTR_SHOW_FMT(scalar_increment, _attrn=
ame, "%d\n", 1);=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ATTR_SHOW_FMT(display_name, _attrname,=
 "%s\n", _dispname);=C2=A0 =C2=A0 \
>>>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct kobj_attribute attr_##_att=
rname##_current_value =3D \
>>>> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__ASUS_ATTR_C=
PU_CORES(_attrname, current_value);=C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>>>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct kobj_attribute attr_##_att=
rname##_default_value =3D \
>>>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __ASUS_ATTR_=
RO(_attrname, default_value);=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
>>>>  =C2=A0 =C2=A0 =C2=A0 =C2=A0 static struct kobj_attribute attr_##_att=
rname##_min_value =3D=C2=A0 =C2=A0 =C2=A0\
>>>> ```
>>>>=20
>>>> but _fsname name is used just below in the same macro:
>>>> checkpatch=2Epl bug?
>>>>> Links:
>>>>> https://lore=2Ekernel=2Eorg/all/20251114185337=2E578959-1-denis=2Ebe=
nato@linux=2Edev/
>>>>> https://lore=2Ekernel=2Eorg/all/20251115145158=2E1172210-1-denis=2Eb=
enato@linux=2Edev/
>>>>>=20
>>>>> Suggested-by: Luke D=2E Jones <luke@ljones=2Edev>
>>>>> Signed-off-by: Denis Benato <denis=2Ebenato@linux=2Edev>
>>>>> ---
>>>>>   drivers/platform/x86/asus-armoury=2Ec | 104 ++++++++++++++++++++++=
++----
>>>>>   drivers/platform/x86/asus-armoury=2Eh |  12 +++-
>>>>>   2 files changed, 99 insertions(+), 17 deletions(-)
>>>>>=20
>>>>> diff --git a/drivers/platform/x86/asus-armoury=2Ec b/drivers/platfor=
m/x86/asus-armoury=2Ec
>>>>> index 9f67218ecd14=2E=2Eabbbcd62d0eb 100644
>>>>> --- a/drivers/platform/x86/asus-armoury=2Ec
>>>>> +++ b/drivers/platform/x86/asus-armoury=2Ec
>>>>> @@ -118,11 +118,14 @@ struct asus_armoury_priv {
>>>>>   	 */
>>>>>   	struct mutex egpu_mutex;
>>>>>   +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>   	/*
>>>>>   	 * Mutex to prevent big/little core count changes writing to same
>>>>>   	 * endpoint at the same time=2E Must lock during attr store=2E
>>>>>   	 */
>>>>>   	struct mutex cpu_core_mutex;
>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>> +
>>>>>   	struct cpu_cores *cpu_cores;
>>>>>   	bool cpu_cores_changeable;
>>>>>   @@ -136,7 +139,9 @@ struct asus_armoury_priv {
>>>>>   static struct asus_armoury_priv asus_armoury =3D {
>>>>>   	=2Eegpu_mutex =3D __MUTEX_INITIALIZER(asus_armoury=2Eegpu_mutex),
>>>>>   +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>   	=2Ecpu_core_mutex =3D __MUTEX_INITIALIZER(asus_armoury=2Ecpu_core=
_mutex),
>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>   };
>>>>>     struct fw_attrs_group {
>>>>> @@ -285,6 +290,12 @@ static int armoury_set_devstate(struct kobj_att=
ribute *attr,
>>>>>   			return -EINVAL;
>>>>>   		}
>>>>>   		break;
>>>>> +	case ASUS_WMI_DEVID_CORES_MAX:
>>>>> +		/*
>>>>> +		 * CPU cores max is a read-only property on supported devices=2E
>>>>> +		 */
>>>>> +		pr_err("Refusing to write to readonly devstate of CPU cores inter=
face\n");
>>>>> +		return -EINVAL;
>>>>>   	default:
>>>>>   		/* No known problems are known for this dev_id */
>>>>>   		break;
>>>>> @@ -803,6 +814,7 @@ static struct cpu_cores *init_cpu_cores_ctrl(voi=
d)
>>>>>   		return ERR_PTR(-ENODEV);
>>>>>   	}
>>>>>   +	pr_debug("CPU cores control interface max cores read 0%x=2E\n", =
cores);
>>>>>   	cores_p->max_power_cores =3D FIELD_GET(ASUS_POWER_CORE_MASK, core=
s);
>>>>>   	cores_p->max_perf_cores =3D FIELD_GET(ASUS_PERF_CORE_MASK, cores)=
;
>>>>>   @@ -812,16 +824,30 @@ static struct cpu_cores *init_cpu_cores_ctrl=
(void)
>>>>>   		return ERR_PTR(-EIO);
>>>>>   	}
>>>>>   +	pr_debug("CPU cores control interface active cores read 0%x=2E\n=
", cores);
>>>>>   	cores_p->cur_power_cores =3D FIELD_GET(ASUS_POWER_CORE_MASK, core=
s);
>>>>>   	cores_p->cur_perf_cores =3D FIELD_GET(ASUS_PERF_CORE_MASK, cores)=
;
>>>>>     	cores_p->min_power_cores =3D CPU_POWR_CORE_COUNT_MIN;
>>>>>   	cores_p->min_perf_cores =3D CPU_PERF_CORE_COUNT_MIN;
>>>>>   +	if (cores_p->min_perf_cores > cores_p->max_perf_cores) {
>>>>> +		pr_info("Invalid CPU performance cores count detected: min: %u, m=
ax: %u, current: %u\n",
>>>>> +		       cores_p->min_perf_cores,
>>>>> +		       cores_p->max_perf_cores,
>>>>> +		       cores_p->cur_perf_cores
>>>>> +		);
>>>>> +		return ERR_PTR(-EINVAL);
>>>>> +	}
>>>>> +
>>>>>   	if ((cores_p->min_perf_cores > cores_p->max_perf_cores) ||
>>>>>   	    (cores_p->min_power_cores > cores_p->max_power_cores)
>>>>>   	) {
>>>>> -		pr_err("Invalid CPU cores count detected: interface is not safe t=
o be used=2E\n");
>>>>> +		pr_info("Invalid CPU efficiency cores count detected: min: %u, ma=
x: %u, current: %u\n",
>>>>> +		       cores_p->min_power_cores,
>>>>> +		       cores_p->max_power_cores,
>>>>> +		       cores_p->cur_power_cores
>>>>> +		);
>>>>>   		return ERR_PTR(-EINVAL);
>>>>>   	}
>>>>>   @@ -836,6 +862,24 @@ static struct cpu_cores *init_cpu_cores_ctrl(=
void)
>>>>>   	return no_free_ptr(cores_p);
>>>>>   }
>>>>>   +/**
>>>>> + * cores_value_show() - Get the core count for the specified core t=
ype=2E
>>>>> + * @kobj: The kobject associated to caller=2E
>>>>> + * @attr: The kobj_attribute associated to caller=2E
>>>>> + * @buf: The buffer that will be used to sysfs_emit=2E
>>>>> + * @core_type: The core type (performance or efficiency)=2E
>>>>> + * @core_value: min, max or current count for the specified cores t=
ype=2E
>>>>> + *
>>>>> + * Intended usage is from sysfs attribute reading a CPU core count=
=2E
>>>>> + *
>>>>> + * This function assumes asus_armoury=2Ecpu_cores is already initia=
lized,
>>>>> + * therefore the compatibility of the interface has already been ch=
ecked=2E
>>>>> + *
>>>>> + * Returns:
>>>>> + * * %-EINVAL	- invalid core value type=2E
>>>>> + * * %0		- successful and buf is filled by sysfs_emit=2E
>>>>> + * * %other	- error from sysfs_emit=2E
>>>>> + */
>>>>>   static ssize_t cores_value_show(struct kobject *kobj, struct kobj_=
attribute *attr, char *buf,
>>>>>   				enum cpu_core_type core_type, enum cpu_core_value core_value)
>>>>>   {
>>>>> @@ -865,6 +909,7 @@ static ssize_t cores_value_show(struct kobject *=
kobj, struct kobj_attribute *att
>>>>>   	return sysfs_emit(buf, "%u\n", cpu_core_value);
>>>>>   }
>>>>>   +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>   static ssize_t cores_current_value_store(struct kobject *kobj, str=
uct kobj_attribute *attr,
>>>>>   					 const char *buf, enum cpu_core_type core_type)
>>>>>   {
>>>>> @@ -919,6 +964,7 @@ static ssize_t cores_current_value_store(struct =
kobject *kobj, struct kobj_attri
>>>>>     	return 0;
>>>>>   }
>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>>     static ssize_t cores_performance_min_value_show(struct kobject *=
kobj,
>>>>>   						struct kobj_attribute *attr, char *buf)
>>>>> @@ -944,6 +990,7 @@ static ssize_t cores_performance_current_value_s=
how(struct kobject *kobj,
>>>>>   	return cores_value_show(kobj, attr, buf, CPU_CORE_PERF, CPU_CORE_=
CURRENT);
>>>>>   }
>>>>>   +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>   static ssize_t cores_performance_current_value_store(struct kobjec=
t *kobj,
>>>>>   						     struct kobj_attribute *attr,
>>>>>   						     const char *buf, size_t count)
>>>>> @@ -956,8 +1003,9 @@ static ssize_t cores_performance_current_value_=
store(struct kobject *kobj,
>>>>>     	return count;
>>>>>   }
>>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_performance, "cores_performance",
>>>>> -			 "Set the max available performance cores");
>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>> +ASUS_ATTR_GROUP_CORES(cores_performance, "cores_performance",
>>>>> +			 "Get available performance cores");
>>>>>     /* Define helper to access the current power mode tunable values=
 */
>>>>>   static inline struct rog_tunables *get_current_tunables(void)
>>>>> @@ -992,6 +1040,7 @@ static ssize_t cores_efficiency_current_value_s=
how(struct kobject *kobj,
>>>>>   	return cores_value_show(kobj, attr, buf, CPU_CORE_POWER, CPU_CORE=
_CURRENT);
>>>>>   }
>>>>>   +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>>   static ssize_t cores_efficiency_current_value_store(struct kobject=
 *kobj,
>>>>>   						    struct kobj_attribute *attr, const char *buf,
>>>>>   						    size_t count)
>>>>> @@ -1004,8 +1053,9 @@ static ssize_t cores_efficiency_current_value_=
store(struct kobject *kobj,
>>>>>     	return count;
>>>>>   }
>>>>> -ASUS_ATTR_GROUP_CORES_RW(cores_efficiency, "cores_efficiency",
>>>>> -		    "Set the max available efficiency cores");
>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>> +ASUS_ATTR_GROUP_CORES(cores_efficiency, "cores_efficiency",
>>>>> +		    "Get available efficiency cores");
>>>>>     /* Simple attribute creation */
>>>>>   ASUS_ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_D=
EVID_CHARGE_MODE, "0;1;2\n",
>>>>> @@ -1048,8 +1098,6 @@ static const struct asus_attr_group armoury_at=
tr_groups[] =3D {
>>>>>   	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>>>>   	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>>>>>   	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>>>> -	{ &cores_efficiency_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>> -	{ &cores_performance_attr_group, ASUS_WMI_DEVID_CORES_MAX },
>>>>>     	{ &ppt_pl1_spl_attr_group, ASUS_WMI_DEVID_PPT_PL1_SPL },
>>>>>   	{ &ppt_pl2_sppt_attr_group, ASUS_WMI_DEVID_PPT_PL2_SPPT },
>>>>> @@ -1191,6 +1239,22 @@ static int asus_fw_attr_add(void)
>>>>>   		}
>>>>>   	}
>>>>>   +	if (asus_armoury=2Ecpu_cores !=3D NULL) {
>>>>> +		err =3D sysfs_create_group(&asus_armoury=2Efw_attr_kset->kobj,
>>>>> +					&cores_efficiency_attr_group);
>>>>> +		if (err) {
>>>>> +			pr_err("Failed to create sysfs-group for cpu efficiency cores: %=
d\n", err);
>>>>> +			goto err_remove_cores_efficiency_group;
>>>>> +		}
>>>>> +
>>>>> +		err =3D sysfs_create_group(&asus_armoury=2Efw_attr_kset->kobj,
>>>>> +					&cores_performance_attr_group);
>>>>> +		if (err) {
>>>>> +			pr_err("Failed to create sysfs-group for cpu performance cores: =
%d\n", err);
>>>>> +			goto err_remove_cores_performance_group;
>>>>> +		}
>>>>> +	}
>>>>> +
>>>>>   	for (i =3D 0; i < ARRAY_SIZE(armoury_attr_groups); i++) {
>>>>>   		if (!armoury_has_devstate(armoury_attr_groups[i]=2Ewmi_devid))
>>>>>   			continue;
>>>>> @@ -1230,6 +1294,12 @@ static int asus_fw_attr_add(void)
>>>>>   	}
>>>>>   	if (asus_armoury=2Egpu_mux_dev_id)
>>>>>   		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj, &gpu_mux_=
mode_attr_group);
>>>>> +err_remove_cores_performance_group:
>>>>> +	if (asus_armoury=2Ecpu_cores !=3D NULL)
>>>>> +		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj, &cores_per=
formance_attr_group);
>>>>> +err_remove_cores_efficiency_group:
>>>>> +	if (asus_armoury=2Ecpu_cores !=3D NULL)
>>>>> +		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj, &cores_eff=
iciency_attr_group);
>>>>>   err_remove_mini_led_group:
>>>>>   	if (asus_armoury=2Emini_led_dev_id)
>>>>>   		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj, &mini_led=
_mode_attr_group);
>>>>> @@ -1375,7 +1445,6 @@ static int __init asus_fw_init(void)
>>>>>   {
>>>>>   	char *wmi_uid;
>>>>>   	struct cpu_cores *cpu_cores_ctrl;
>>>>> -	int err;
>>>>>     	wmi_uid =3D wmi_get_acpi_device_uid(ASUS_WMI_MGMT_GUID);
>>>>>   	if (!wmi_uid)
>>>>> @@ -1389,16 +1458,14 @@ static int __init asus_fw_init(void)
>>>>>   		return -ENODEV;
>>>>>     	asus_armoury=2Ecpu_cores_changeable =3D false;
>>>>> +	asus_armoury=2Ecpu_cores =3D NULL;
>>>>>   	if (armoury_has_devstate(ASUS_WMI_DEVID_CORES_MAX)) {
>>>>>   		cpu_cores_ctrl =3D init_cpu_cores_ctrl();
>>>>> -		if (IS_ERR(cpu_cores_ctrl)) {
>>>>> -			err =3D PTR_ERR(cpu_cores_ctrl);
>>>>> -			pr_err("Could not initialise CPU core control: %d\n", err);
>>>>> -			return err;
>>>>> +		if (!IS_ERR(cpu_cores_ctrl)) {
>>>>> +			pr_debug("CPU cores control available=2E\n");
>>>>> +			asus_armoury=2Ecpu_cores =3D cpu_cores_ctrl;
>>>>> +			asus_armoury=2Ecpu_cores_changeable =3D true;
>>>>>   		}
>>>>> -
>>>>> -		asus_armoury=2Ecpu_cores =3D cpu_cores_ctrl;
>>>>> -		asus_armoury=2Ecpu_cores_changeable =3D true;
>>>>>   	}
>>>>>     	init_rog_tunables();
>>>>> @@ -1417,6 +1484,13 @@ static void __exit asus_fw_exit(void)
>>>>>   					   armoury_attr_groups[i]=2Eattr_group);
>>>>>   	}
>>>>>   +	if (asus_armoury=2Ecpu_cores !=3D NULL) {
>>>>> +		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj,
>>>>> +				   &cores_performance_attr_group);
>>>>> +		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj,
>>>>> +				   &cores_efficiency_attr_group);
>>>>> +	}
>>>>> +
>>>>>   	if (asus_armoury=2Egpu_mux_dev_id)
>>>>>   		sysfs_remove_group(&asus_armoury=2Efw_attr_kset->kobj, &gpu_mux_=
mode_attr_group);
>>>>>   diff --git a/drivers/platform/x86/asus-armoury=2Eh b/drivers/platf=
orm/x86/asus-armoury=2Eh
>>>>> index 2f05a2e0cab3=2E=2E6b2bfe763d23 100644
>>>>> --- a/drivers/platform/x86/asus-armoury=2Eh
>>>>> +++ b/drivers/platform/x86/asus-armoury=2Eh
>>>>> @@ -198,12 +198,20 @@ ssize_t armoury_attr_uint_show(struct kobject =
*kobj, struct kobj_attribute *attr
>>>>>   		=2Ename =3D _fsname, =2Eattrs =3D _attrname##_attrs			\
>>>>>   	}
>>>>>   +#if IS_REACHABLE(CONFIG_ASUS_ARMOURY_CPU_CORES_RW)
>>>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>>> +		__ASUS_ATTR_RW(_attrname, __attrval)
>>>>> +#else
>>>>> +	#define __ASUS_ATTR_CPU_CORES(_attrname, __attrval) \
>>>>> +		__ASUS_ATTR_RO(_attrname, __attrval)
>>>>> +#endif /* CONFIG_ASUS_ARMOURY_CPU_CORES_RW */
>>>>> +
>>>>>   /* CPU core attributes need a little different in setup */
>>>>> -#define ASUS_ATTR_GROUP_CORES_RW(_attrname, _fsname, _dispname)		\
>>>>> +#define ASUS_ATTR_GROUP_CORES(_attrname, _fsname, _dispname)		\
>>>>>   	__ATTR_SHOW_FMT(scalar_increment, _attrname, "%d\n", 1);	\
>>>>>   	__ATTR_SHOW_FMT(display_name, _attrname, "%s\n", _dispname);	\
>>>>>   	static struct kobj_attribute attr_##_attrname##_current_value =3D=
	\
>>>>> -		__ASUS_ATTR_RW(_attrname, current_value);		\
>>>>> +		__ASUS_ATTR_CPU_CORES(_attrname, current_value);	\
>>>>>   	static struct kobj_attribute attr_##_attrname##_default_value =3D=
 \
>>>>>   		__ASUS_ATTR_RO(_attrname, default_value);		\
>>>>>   	static struct kobj_attribute attr_##_attrname##_min_value =3D	\
>>> Hi Denis,
>> Hi!
>>> This cores thing has unfortunately turned into too much of a mess, a f=
ixup
>>> after fixup, disagreement of even what should be included and what not=
=2E
>> I'm sorry for the trouble=2E
>>> I'm really sorry for all the extra trouble these people are putting yo=
u
>>> through as apparently even 17 versions of the main patch series weren'=
t
>>> enough to get them to stretch their fingers over the keyboard :-/=2E
>> I was aware of what I was running into when I accepted
>> Luke's request to maintain asus-related things :)
>>=20
>> The interface is being evolving since it's what asus keeps
>> integrating and changing on new hardware,
>> so unexpected things are to be expected=2E=2E=2E hah!
>>> I've now dropped the cores patch from the review-ilpo-next branch but
>>> tried to keep the rest=2E Please check I didn't make any stupid mistak=
es
>>> while resolving the resulting conflicts with the ppt/nv change, at lea=
st
>>> the diff against the removal patch looked promising=2E If there's an i=
ssue,
>>> please just provide a clean v18 of the main series without the cores p=
atch
>>> so I can replace=2E
>> Thanks! Looks good to me too, I have asked asus-linux kernel-man
>> to distribute this patchset taken from pdx86 repo: if you don't hear fo=
r
>> me in 2-3 hours the world isn't burning :D
>>> If you want to send a clean version of the cores patch (separately), I=
 can
>>> consider it after giving enough time for people to comment=2E
>>>=20
>> Going forward I think the best approach is to make the interface
>> compatible with new hardware and useful for who needs it:
>> - RO by default and disregarded by the driver in case of funny business
>> - RW for hardware that was requested and tested, similar to the TDP
>>  =C2=A0 so that I can also be confident on what minimum cores count are=
 per-model
>>  =C2=A0 instead of relying on a macro and hoping for the best
>> - Integrating your suggestions
>>=20
>> And that should satisfy everybody and make the interface safe=2E
>>=20
>> Please everybody, let me know if this is an acceptable solution
>> that would make everyone involved happy: from developers
>> to final users (especially those who use this feature in Windows)=2E
>>=20
>> Thank you all,
>> Denis
>
>
>It's up to you at the end of the day if you want some machines to be opt =
in to RW, but I don't think this fair to treat this the same as TDP=2E
>
>We only have one way to change TDP on these machines - the BIOS interface=
=2E
>
>For parking of cores there is the BIOS method or Linux native support for=
 offlining cores=2E

There is one caveat which I think is relevant, if a core was disabled in w=
indows, BIOS, or a previous version of this patch set using this interface,=
 you would need to use BIOS or windows to re-enable it=2E=20

I'm on the fence if that justifies having an optional table of verified wo=
rking hardware though, considering the risk I think would just recommend fo=
lks use the BIOS interface for it=2E

- Derek
