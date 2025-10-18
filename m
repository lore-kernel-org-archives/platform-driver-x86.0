Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AFA35975
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Oct 2025 01:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760750637; cv=none; b=p1yy4yTNx6IbzCvNJZayOhH8Z7xO0PeWQKdUhZWg6/5Ed9+EOsCEyBl+kfMuZdENrRROYpzypxvvIO0ljLmCoW6x6iaYaK0jMjWPSajqVqLzCqUR6dQ0kLV/6kPb6gZTY2c0KO5s/S8LOHH0yj1Qq99e5JU6A6SObajchtq5Pyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760750637; c=relaxed/simple;
	bh=1ZgIL5IWS4cuM0dXNiehJ4YRBiOLdALOsyBBVZPxUPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsdelRF9wF8sQ6uaokCmiXPmso3lgiNKOQMtEcnrrK+eR6sXHNOb5F+YhULg7mZSwPXuSpKvlnD94hnCaccfQYQH1vcmkzdAtq2cjSNzWVS7CFYCc9RFDQd6fF41dKAFTiTBGYXIArJpMnF9I7i0I2vG1+9H0jUTT557mv6LPCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSu8ehSY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSu8ehSY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471075c0a18so25548645e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Oct 2025 18:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760750634; x=1761355434; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sw0TCnJxRA4iKn4B/fZsg4cRPTWmVCB6WkTTNnaxvPg=;
        b=fSu8ehSYCgNLfOe1Q3YfdY5SlNsYuHTtyZqYiM7FNWZSwZ+UPTdRKmxgxfBrC+4fd/
         x7rg3Seh3QTJajGpMxF+RnTtTKckHhaEmEis0o5ZEZD373V7heDbTnbOzCeVvmBQRD10
         iQFdhquj2oeTjPsrIa46PnBcCVt8CgakrQCW9cYQXB2xUEK92skxPl//fbbHOE6SvJP8
         9kFPNLsQb0bPLbck44TKr/zTl++N1owkIiwMgKbPWXKpWvaemY/QNGEghhedAGz8FrlP
         /HSj2xpHjnY/vv/d5GmrC/JwJbWGd/6uyUL6t2/BAYey8ZqDlDaTl6Kat/NTtH8CqmOV
         uOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760750634; x=1761355434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sw0TCnJxRA4iKn4B/fZsg4cRPTWmVCB6WkTTNnaxvPg=;
        b=h++05HG7nt2TomVy2MSv0krcrP7W5lnqaoAfNChFYQ8eXQvnOBBdAZiW+HWHdiJNAd
         MmgtoKV8Lc9sP+xFlGyS0WvdxeuupgyFbY6vKVVaxZFGa1YgREzo7nz5kQPuPlXobCJ/
         /a9Poz9B8eZTXi2BDo2r3wWV5lvM+v+CjRQha5squeXIb710BwxgE3AeESE2HqQ1c2f4
         gwWPXDEHOGZ6caNrnR4epRhjaAtu5dU/npbuTmMT+mxU9Uza4M+1lp/TbOYKNjNUU09k
         fV2CDnC3zZMhxZZpq9dXJ36/FLhbWsuiSjuSuyiKpAjjF1bPeBDFBAdcZskRHAP6uGD/
         /peg==
X-Forwarded-Encrypted: i=1; AJvYcCXBP95+X9HsdsM1FNcbqqNgrYsQcr+tctIa9/Dism0KbatBSkAEEWpORYR2pBIysG0C82aVk9yHx3TNjZ0w6ApS+Niw@vger.kernel.org
X-Gm-Message-State: AOJu0YxfbcXsEye+sLPCTusscTUGXvaGk/+CMkoqRNOwV20j5Z3dzna6
	Lk5nnZWLBcMgXh9sWuAspkxHfLrVBkpNnENlu9rmV1aXENbQi285SjmE
X-Gm-Gg: ASbGncvqQTuJ/RzJ95hZdpLLdJ78I4bTbw0OiIVBZkjB0UPlix8bWYxl7ThmTFb3evz
	Vc3tkmNV+aC/tv4VLQJepJUCTSmm0elwQhaNR+gYphOBgia+YzhQFanQGm5H/sXoP0PY0jOzv8m
	u17jI2W6Ertd0bdqhYjxDmgaUMnwySFHsAPXwEwDhFZOF7k6vrCWXSIo7ZlPF6dTtTqYR8sndvi
	lTijgy2Ry68ajkE/ScalF26lxD6sw6ltlcoD/dLeVv80tvOgwJMuv+fwi+URiFPvf0k0Min2AYD
	+37b92XyMrbcRmwlii3uOFvqj+wUbVWfrQ8ejEImtgTJIXXEtxQsph65TnQna3RPodpxqhBBs9P
	Ets8iLwfOt/X2AO8ycu38Mz7id++KMGB6Fu9QKFxQoALfZvyxNP9JPPSNyX7/tI1tg/bgdeQMqV
	Q0ESUwPcCq9ip+8eZV20SlY67x
X-Google-Smtp-Source: AGHT+IFLu67UnNCbkoYhLaAhR/OhiqMXdYYtDEMOXbZPb6yumHV4lCMxQVdGMbs2in2+JjEhe8e1dQ==
X-Received: by 2002:a05:600c:871a:b0:45d:d68c:2a36 with SMTP id 5b1f17b1804b1-471179168b9mr40496545e9.27.1760750634214;
        Fri, 17 Oct 2025 18:23:54 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427ea5b3f5esm2080487f8f.20.2025.10.17.18.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 18:23:53 -0700 (PDT)
Message-ID: <3691edd4-7d04-42c5-9f5f-8f57a4da2740@gmail.com>
Date: Sat, 18 Oct 2025 03:23:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 4/9] platform/x86: asus-armoury: add apu-mem control
 support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>, Alok Tiwari <alok.a.tiwari@oracle.com>,
 Derek John Clark <derekjohn.clark@gmail.com>,
 Mateusz Schyboll <dragonn@op.pl>, porfet828@gmail.com
References: <20251015014736.1402045-1-benato.denis96@gmail.com>
 <20251015014736.1402045-5-benato.denis96@gmail.com>
 <61c69499-fb69-0642-915d-e3072d2dbd21@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <61c69499-fb69-0642-915d-e3072d2dbd21@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/17/25 14:16, Ilpo Järvinen wrote:
> On Wed, 15 Oct 2025, Denis Benato wrote:
>
>> From: "Luke D. Jones" <luke@ljones.dev>
>>
>> Implement the APU memory size control under the asus-armoury module using
>> the fw_attributes class.
>>
>> This allows the APU allocated memory size to be adjusted depending on
>> the users priority. A reboot is required after change.
>>
>> Signed-off-by: Luke D. Jones <luke@ljones.dev>
>> Signed-off-by: Denis Benato <benato.denis96@gmail.com>
>> ---
>>  drivers/platform/x86/asus-armoury.c        | 81 ++++++++++++++++++++++
>>  include/linux/platform_data/x86/asus-wmi.h |  2 +
>>  2 files changed, 83 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
>> index 68ce2c159ae1..3b49a27e397d 100644
>> --- a/drivers/platform/x86/asus-armoury.c
>> +++ b/drivers/platform/x86/asus-armoury.c
>> @@ -394,6 +394,86 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
>>  WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
>>  ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
>>  
>> +/* Device memory available to APU */
>> +
>> +/* Values map for APU memory: some looks out of order but are actually correct */
>> +static u32 apu_mem_map[] = {
>> +	[0] = 0x000, /* called "AUTO" on the BIOS, is the minimum available */
>> +	[1] = 0x102,
>> +	[2] = 0x103,
>> +	[3] = 0x104,
>> +	[4] = 0x105,
>> +	[5] = 0x107,
>> +	[6] = 0x108,
>> +	[7] = 0x109,
>> +	[8] = 0x106,
> Is BIT(8) actually telling non-AUTO here? I mean, it's not set for the 
> AUTO case. If it has this special meaning, maybe that should be left out 
> of this array and handled by the show/store functions as it seems 
> different for the auto depending on which way the information is being 
> passed.
When 0x000 is set the interface will answer with value 0x100,
so it seems a bit confusing associating BIT(8) to "non-auto".

Honestly I don't see any particular pattern around these values.


I have tried to see if I could set 0x100 or 0x101 and my hardware
stopped booting until a hard reset was performed.

I am not seeing any particular reason to further modify code here.

>> +};
>> +
>> +static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +					  char *buf)
>> +{
>> +	int err;
>> +	u32 mem;
>> +
>> +	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
>> +	if (err)
>> +		return err;
>> +
>> +	if ((mem & ASUS_WMI_DSTS_PRESENCE_BIT) == 0)
>> +		return -ENODEV;
>> +
>> +	mem &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
>> +
>> +	/* After 0x000 is set, a read will return 0x100 */
>> +	if (mem == 0x100)
>> +		return sysfs_emit(buf, "0\n");
>> +
>> +	for (unsigned int i = 0; i < ARRAY_SIZE(apu_mem_map); i++) {
>> +		if (apu_mem_map[i] == mem)
>> +			return sysfs_emit(buf, "%u\n", i);
>> +	}
>> +
>> +	pr_warn("Unrecognised value for APU mem 0x%08x\n", mem);
>> +	return sysfs_emit(buf, "%u\n", mem);
> ??
>
> Should this return -EIO or something like that instead. It definitely 
> looks wrong to first log it as %x and then output to sysfs as %u.
>
>> +}
>> +
>> +static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
>> +					   const char *buf, size_t count)
>> +{
>> +	int result, err;
>> +	u32 requested, mem;
>> +
>> +	result = kstrtou32(buf, 10, &requested);
>> +	if (result)
>> +		return result;
>> +
>> +	if (requested >= ARRAY_SIZE(apu_mem_map))
>> +		return -EINVAL;
>> +
>> +	mem = apu_mem_map[requested];
>> +
>> +	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
>> +	if (err) {
>> +		pr_warn("Failed to set apu_mem: %d\n", err);
>> +		return err;
>> +	}
>> +
>> +	pr_info("APU memory changed to %uGB, reboot required\n", requested+1);
> requested + 1
>
> Please mention GB up where the array is.
>
>> +	sysfs_notify(kobj, NULL, attr->attr.name);
>> +
>> +	asus_set_reboot_and_signal_event();
>> +
>> +	return count;
>> +}
>> +
>> +static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +					    char *buf)
>> +{
>> +	BUILD_BUG_ON(ARRAY_SIZE(apu_mem_map) != 9);
>> +	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
> You could make this future proof with a for loop and sysfs_emit_at() and 
> drop the BUILD_BUG_ON(). Maybe all these multi-valued show functions could 
> share a helper which does that.
Thanks, due to changes to egpu interface I will introduce such helper in 0/2.
>> +}
>> +ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
>> +
>>  /* Simple attribute creation */
>>  ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
>>  		       "Show the current mode of charging");
>> @@ -414,6 +494,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
>>  	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
>>  	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
>>  	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
>> +	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
>>  
>>  	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
>>  	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 10acd5d52e38..a4f6bab93a6f 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -137,6 +137,8 @@
>>  /* dgpu on/off */
>>  #define ASUS_WMI_DEVID_DGPU		0x00090020
>>  
>> +#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
>> +
>>  /* gpu mux switch, 0 = dGPU, 1 = Optimus */
>>  #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
>>  #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
>>
