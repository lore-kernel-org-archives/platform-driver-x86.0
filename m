Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3702E9741
	for <platform-driver-x86@vger.kernel.org>; Sun, 19 Oct 2025 16:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760892790; cv=none; b=k7Ph/qTbNYryaykLOB4dr6CTFIWV/X8v6OwJ00YiKWIFx5bu5tbNVkVXUt8L5QKVYw1rrIJ57yJFHyV4tcDijqco6DpmNpgEuwFXhy8/GmftY1ftV1oBmkC1bT8yNOilxU5Uh92oYLTVuEdD+mAZ50UZOgHB5D5Nd2gmDgj5W9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760892790; c=relaxed/simple;
	bh=23EUBdHfMCYXpMwbyS2We3vtYQnfwSeqUa4lZN381hM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SV9aISWmJLsE+uQoo4qL3aBqz2AZqCYtwIdezVQfvh6k8mjSSUsrrl3ush2q/E71ZIDzz+91L52rgR5AK0JJ8dvuY5cKdd4Ccvac8Jmsvx45buO6YYppyVfonyB8rlLklkwesxoYlGT/Td+vYzr0DQHlfBVjNMMRQsSLRD1ToXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SU6ljADE; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SU6ljADE"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-46e6ba26c50so23877945e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 Oct 2025 09:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760892784; x=1761497584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbE6SCAQLzcg1gjx8GxCzgHZU4xUelZa5R3v9DxdFi0=;
        b=SU6ljADE8iQu+TJWQlf3PV2vazc0XasUs10Qzfvg+XCG3S2c0KzYfcFCbuI9qhFbQY
         JtngcR5k4if/2K/BgWMRuPwZIbJvBdrCGGzokG09ar1aiD4XUSLHO+aaqA4WrwAbL9go
         /zZpzhvdJCZ9btjhSJu9YYm/M4TxqspbRSjsRPcKPOOfUiUty2X1CfSu4sJjaYhP99PN
         nXDt2SXhDstaDYhkYKf8OCa4OLbI/3kO9Cc9HeE4cx9jGALLF5sUEwlsqb3lKtJk6dw/
         ExzFZMTvJz3tNry2aKTeg5XrIAppdhaxiyLffzxxl8uAKrR2F8A/KM5oJQ+SLbCImUuN
         CKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760892784; x=1761497584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbE6SCAQLzcg1gjx8GxCzgHZU4xUelZa5R3v9DxdFi0=;
        b=rQyvK4NBIhxGirMGJHzoKYjm3GgAVRYrcMwWXBcJpywaTNWWiZZZrv9+JbV/hpkXhN
         HISQjJWt6r3dTcVfNLyiHtxp0UXKLVVkwdJ14/5qdow1HnVA6PQbDXWUQYpMVSCBOgNL
         ZsZvspG1A9N9FD4EdAcU0KliViROzX/OOwxtfJclnCw0/VUhrNr0+dQNDEr6SFp40xvB
         XQWqeDWdTG+Zx6MlyyheANpEfQwHBm2gCjP8yLdZXQKxLcyE+LJxSIEGVO8EbVrNQCNj
         MadY49sb5PTpoaXjIPmSxfAP5kPMQdwd0sssf1hX3oi3ZeeEQvfNDWGEC7SFT2vlW/nV
         fj2w==
X-Forwarded-Encrypted: i=1; AJvYcCXAwS/fJ6eWPmHL1LWL2gmiC9rEK7AElYRNPesN1vLl2yiq45bpiB1Tqnv6ePBSDDrEMIllg4Aqvbxi0J6ZqDUw2V9j@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4zGH+mXBnf3p+AgYxqhAIggBfoKHWXxnlSMD404+3pDv+AP82
	v0nsKGyLzljEq1yt4pZvTKkMWLE1GgvFaxMcp/Uktdt6FncGvQPOzd8L
X-Gm-Gg: ASbGncv0Q9fv+j7NQDcsvn1+56qBR/nsqI+3svUsQhdcdH3Z+ZMwULgcJgsvRlsi27N
	j1s0RF6qy3SG50PdqGXaS6Xc480fT1Qjw8sJ0RiR6RugSC3vXy5WIHe2wwdnttUoThn1DIqy3Ls
	TWpZf8TfOhMIaFNxNcDTLm0pgndsX5aWRNa0uaWGuMmnKNLMaqqtwf2WZO6pI+c8KICA5GXPtxu
	MzAryz1ApCVeoJ6TOoPVavIzTzt4m3WhY9qhy6jDW/9FjcL5h6/sRHL3NYq0eJpw/Vr6sea83A3
	seqq6ZVgMIFcE+5hcS9soLXFX/JJPSuNQ36D3OREwRoGVCqdygpaNsfRy3+Jun+z6/kwv9GXxMt
	ZCEIjH4MqsKln6fKs16jW85VgasFxThmBxNVAkNpgFDFr9/MKg5MPxyltprOJTQM1Sjb0yk/STa
	GVl4zU8/q7IjXSoQ==
X-Google-Smtp-Source: AGHT+IHa+tYM7+bEYoZ/dHQ9a5gV6wMN8mOtIgaA0FkEaB0SKxokCb+se5AtNQGAf1lro1XNmBpTzQ==
X-Received: by 2002:a05:6000:26cc:b0:425:7c1b:9344 with SMTP id ffacd0b85a97d-42704da4f10mr7060131f8f.15.1760892783416;
        Sun, 19 Oct 2025 09:53:03 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f00ce08asm10971289f8f.44.2025.10.19.09.53.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 09:53:02 -0700 (PDT)
Message-ID: <78f9c831-0c0c-4497-9a77-0380e27cc616@gmail.com>
Date: Sun, 19 Oct 2025 18:53:01 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 5/9] platform/x86: asus-armoury: add core count
 control
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <superm1@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, "Luke D . Jones" <luke@ljones.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
 <20251015014736.1402045-6-benato.denis96@gmail.com>
 <25bd0c90-2de0-ef66-c18d-661180b71fd4@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <25bd0c90-2de0-ef66-c18d-661180b71fd4@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/17/25 14:48, Ilpo Järvinen wrote:
> On Wed, 15 Oct 2025, Denis Benato wrote:
>
>> From: "Luke D. Jones" <luke@ljones.dev>
>>
>> Implement Intel core enablement under the asus-armoury module using the
>> fw_attributes class.
>>
>> This allows users to enable or disable preformance or efficiency cores
>> depending on their requirements. After change a reboot is required.
>>
>> Signed-off-by: Denis Benato <benato.denis96@gmail.com>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> ---
>>  drivers/platform/x86/asus-armoury.c        | 258 ++++++++++++++++++++-
>>  drivers/platform/x86/asus-armoury.h        |  28 +++
>>  include/linux/platform_data/x86/asus-wmi.h |   5 +
>>  3 files changed, 290 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>> index 3b49a27e397d..3d963025d84e 100644
>> --- a/drivers/platform/x86/asus-armoury.c
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -45,13 +45,49 @@
>>  #define ASUS_MINI_LED_2024_STRONG 0x01
>>  #define ASUS_MINI_LED_2024_OFF    0x02
>>  
>> +#define ASUS_POWER_CORE_MASK	GENMASK(15, 8)
>> +#define ASUS_PERF_CORE_MASK		GENMASK(7, 0)
>> +
>> +enum cpu_core_type {
>> +	CPU_CORE_PERF = 0,
>> +	CPU_CORE_POWER,
>> +};
>> +
>> +enum cpu_core_value {
>> +	CPU_CORE_DEFAULT = 0,
> This could be mapped in the sysfs _show function as there's no real 
> backing value for it.

It is also used in a store function called by both _stores and
I wouldn't like the idea of transforming it in a u32 given
the importance of data to be correct in this specific interface.

The last thing I want is making device unbootable because
I missed a CPU_CORE_PERF vs CPU_CORE_POWER or because
I misremember while changing the code that CORE_PERF means
performance and CORE_POWER means efficiency
(and it took me a minute to get this spelled right in this email).

>> +	CPU_CORE_MIN,
>> +	CPU_CORE_MAX,
>> +	CPU_CORE_CURRENT,
>> +};
>> +
>> +#define CPU_PERF_CORE_COUNT_MIN 4
>> +#define CPU_POWR_CORE_COUNT_MIN 0
>> +
>> +/* Tunables provided by ASUS for gaming laptops */
>> +struct cpu_cores {
>> +	u32 cur_perf_cores;
>> +	u32 min_perf_cores;
>> +	u32 max_perf_cores;
>> +	u32 cur_power_cores;
>> +	u32 min_power_cores;
>> +	u32 max_power_cores;
>> +};
>> +
>>  static struct asus_armoury_priv {
>>  	struct device *fw_attr_dev;
>>  	struct kset *fw_attr_kset;
>>  
>> +	struct cpu_cores *cpu_cores;
>>  	u32 mini_led_dev_id;
>>  	u32 gpu_mux_dev_id;
>> -} asus_armoury;
>> +	/*
>> +	 * Mutex to prevent big/little core count changes writing to same
>> +	 * endpoint at the same time. Must lock during attr store.
>> +	 */
>> +	struct mutex cpu_core_mutex;
>> +} asus_armoury = {
>> +	.cpu_core_mutex = __MUTEX_INITIALIZER(asus_armoury.cpu_core_mutex)
>> +};
>>  
>>  struct fw_attrs_group {
>>  	bool pending_reboot;
>> @@ -93,6 +129,8 @@ static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
>>  static bool asus_bios_requires_reboot(struct kobj_attribute *attr)
>>  {
>>  	return !strcmp(attr->attr.name, "gpu_mux_mode") ||
>> +	       !strcmp(attr->attr.name, "cores_performance") ||
>> +	       !strcmp(attr->attr.name, "cores_efficiency") ||
>>  	       !strcmp(attr->attr.name, "panel_hd_mode");
>>  }
>>  
>> @@ -171,6 +209,12 @@ static ssize_t enum_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>>  	return sysfs_emit(buf, "enumeration\n");
>>  }
>>  
>> +static ssize_t int_type_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			     char *buf)
>> +{
>> +	return sysfs_emit(buf, "integer\n");
>> +}
>> +
>>  /* Mini-LED mode **************************************************************/
>>  static ssize_t mini_led_mode_current_value_show(struct kobject *kobj,
>>  						struct kobj_attribute *attr, char *buf)
>> @@ -474,6 +518,207 @@ static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_at
>>  }
>>  ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>>  
>> +static int init_max_cpu_cores(void)
>> +{
>> +	u32 cores;
>> +	int err;
>> +
>> +	asus_armoury.cpu_cores = kzalloc(sizeof(struct cpu_cores), GFP_KERNEL);
>> +	if (!asus_armoury.cpu_cores)
>> +		return -ENOMEM;
>> +
>> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES_MAX, &cores);
>> +	if (err)
>> +		return err;
>> +
>> +	if ((cores & ASUS_WMI_DSTS_PRESENCE_BIT) == 0) {
>> +		pr_err("ACPI does not support CPU core count control\n");
>> +		err = -ENODEV;
>> +		goto init_max_cpu_cores_err;
> Please use __free() and return immediately.
>
> Only assign from local variable to asus_armoury.cpu_cores with 
> no_free_ptr() at the end.
>
>> +	}
>> +
>> +	asus_armoury.cpu_cores->max_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>> +	asus_armoury.cpu_cores->max_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>> +
>> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_CORES, &cores);
>> +	if (err) {
>> +		pr_err("Could not get CPU core count: error %d\n", err);
>> +		goto init_max_cpu_cores_err;
>> +	}
>> +
>> +	asus_armoury.cpu_cores->cur_perf_cores = FIELD_GET(ASUS_PERF_CORE_MASK, cores);
>> +	asus_armoury.cpu_cores->cur_power_cores = FIELD_GET(ASUS_POWER_CORE_MASK, cores);
>> +
>> +	asus_armoury.cpu_cores->min_perf_cores = CPU_PERF_CORE_COUNT_MIN;
>> +	asus_armoury.cpu_cores->min_power_cores = CPU_POWR_CORE_COUNT_MIN;
> Should these be bounds checked with max?
>
>> +	return 0;
>> +
>> +init_max_cpu_cores_err:
>> +	kfree(asus_armoury.cpu_cores);
>> +	return err;
>> +}
>> +
>> +static ssize_t cores_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf,
>> +				enum cpu_core_type core_type, enum cpu_core_value core_value)
>> +{
>> +	u32 cores;
>> +
>> +	switch (core_value) {
>> +	case CPU_CORE_DEFAULT:
>> +	case CPU_CORE_MAX:
>> +		if (core_type == CPU_CORE_PERF)
>> +			return sysfs_emit(buf, "%u\n",
>> +					  asus_armoury.cpu_cores->max_perf_cores);
>> +		else
>> +			return sysfs_emit(buf, "%u\n",
>> +					  asus_armoury.cpu_cores->max_power_cores);
>> +	case CPU_CORE_MIN:
>> +		if (core_type == CPU_CORE_PERF)
>> +			return sysfs_emit(buf, "%u\n",
>> +					  asus_armoury.cpu_cores->min_perf_cores);
>> +		else
>> +			return sysfs_emit(buf, "%u\n",
>> +					  asus_armoury.cpu_cores->min_power_cores);
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (core_type == CPU_CORE_PERF)
>> +		cores = asus_armoury.cpu_cores->cur_perf_cores;
>> +	else
>> +		cores = asus_armoury.cpu_cores->cur_power_cores;
> Why isn't this inside the switch?? The logic in this function looks very 
> mixed up.
>
> If I'd be you, I'd consider converting the asus_armoury.cpu_cores to a 
> multi-dimensional array. It would make this just bounds checks and one 
> line to get the data.
>
>> +	return sysfs_emit(buf, "%u\n", cores);
>> +}
>> +
>> +static ssize_t cores_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>> +					 const char *buf, enum cpu_core_type core_type)
>> +{
>> +	u32 new_cores, perf_cores, power_cores, out_val, min, max;
>> +	int result, err;
>> +
>> +	result = kstrtou32(buf, 10, &new_cores);
>> +	if (result)
>> +		return result;
>> +
>> +	scoped_guard(mutex, &asus_armoury.cpu_core_mutex) {
>> +		if (core_type == CPU_CORE_PERF) {
>> +			perf_cores = new_cores;
>> +			power_cores = asus_armoury.cpu_cores->cur_power_cores;
>> +			min = asus_armoury.cpu_cores->min_perf_cores;
>> +			max = asus_armoury.cpu_cores->max_perf_cores;
>> +		} else {
>> +			perf_cores = asus_armoury.cpu_cores->cur_perf_cores;
>> +			power_cores = new_cores;
>> +			min = asus_armoury.cpu_cores->min_power_cores;
>> +			max = asus_armoury.cpu_cores->max_power_cores;
>> +		}
>> +
>> +		if (new_cores < min || new_cores > max)
>> +			return -EINVAL;
>> +
>> +		out_val = FIELD_PREP(ASUS_PERF_CORE_MASK, perf_cores) |
>> +			FIELD_PREP(ASUS_POWER_CORE_MASK, power_cores);
>> +
>> +		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_CORES, out_val, &result);
>> +		if (err) {
>> +			pr_warn("Failed to set CPU core count: %d\n", err);
>> +			return err;
>> +		}
>> +
>> +		if (result > 1) {
>> +			pr_warn("Failed to set CPU core count (result): 0x%x\n", result);
>> +			return -EIO;
>> +		}
>> +	}
>> +
>> +	pr_info("CPU core count changed, reboot required\n");
> This interface has a problematic behavior. If user wants to adjust both 
> core counts one after another (without reboot in between), the new value 
> of the first core count will be overwritten on the second store.
>
> You might have to store also the value that will be used after the next 
> boot to solve it but how the divergence should be presented to user is 
> another question to which I don't have a good answer.
>
> This seems a more general problem, that is, how to represent values which 
> are only enacted after booting (current vs to-be-current) as it doesn't 
> fit to the current, min, max, possible_values, type model.
>
>
I will propose a possible solution in v15 very soon that will hopefully
satisfy both kernel requirements and safety requirements.

Thank you,
Denis
