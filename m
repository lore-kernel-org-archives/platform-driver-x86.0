Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86BD44A725
	for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106812; cv=none; b=m23xCoG80YnLduPmHwu+x9afCbEbvykVPD8VnAgxbFZPmqP8QR5FwtyHoQiK07li2rRJRfP4b/EH9SS4ivi3c+5XlKozxrZq9hQ1f+Uq7qtnSP3IFeW/Uf5xjjtkZTVmBXUPBCXhHs07EB9PL6fwB42VZaxUpvSozXyEwSCTyUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106812; c=relaxed/simple;
	bh=+JsE6roGQKSnU43bgokxcTlC9+6VdH/IgzPipKqqvdg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/28c6Tdh+FqHa5Ei1B+Mgv2o6GioXW1OTWjrpKOYsN7XGpO0OEd3kbYznTdfApJQrZ6/pjDS6iz9im5CDXN1jC59cLUtD2n0EoUMb/zWdMVPQcZ4qkSy1STQN1yi58ojJADituVC8UAjv+kSITFSDyRCej0iUirRlqsGcSrgq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTWDlsm6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTWDlsm6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so43052035e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 10 Jun 2026 08:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781106809; x=1781711609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=85PXac0YENnm3BIDalSguQST62+fxUozwWY059Y0ZO4=;
        b=aTWDlsm65wRgj58pSladlCRa7hO8MVSxbZXfk9JK4OWAe/MYmZo1MZrRqRCGld1mZw
         KTD4jfL8oC8OCEP8YeA7WkPz0HzB4yheCAdZpOxoPoqU/Zn7hNpKtE7BLpEEP1P9AIRN
         uTfpbPTYaNcw5zYLD5W7aY/lUkAtWfiivQzVFReqVfpb6jxdaO7UZYhvgD6pCo5S+4O8
         wQlCJKyaWo6C8ddnRJQUXvNwljd6sSKVAerYbs7mI2pVzl/CxlPPxPW4DiWXaSCN1pwl
         0jUhhR6VfpenaTHL1RajQe4ALKk0BvszzL/4oRpVUqSATktRbj/Tx85M005LqMnii+Pa
         Eeew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781106809; x=1781711609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85PXac0YENnm3BIDalSguQST62+fxUozwWY059Y0ZO4=;
        b=Qx0uVcd+Z4jcQzMTw4Yak76yUX/zK9Pgsp+9Bc/5b1CYIX7N3iT2fZpIxIU4BPkGD4
         t9eJ908anqmcTPbbxSdpSPn5QJdFYEjXVFvOypFYAIG6O8jfB+hymukvHLnZfnnZFImS
         GlcoX65TQcJJ0O6FZkrqFMaK8er6fpk91MvGsIRD5nUsZR0Dieigbl0NBXFB4HVIVNu3
         hT8h/qwi781ojM53pP1WyhHqFlFHMsk10gzXgmjAVcK2/GNEgErF4EJkc9Q4seAkRKgR
         EvqDlfZRlrrxizkFT0ktEXN/B24EYcVlkvQVUTTFD2WXJTy3s1JZdJNgmBd4NQ3BIs3o
         sWRA==
X-Gm-Message-State: AOJu0YxdfLAPqjjGKH1gi+6eCwP5dMFzijrCGyc/mNAStKZUK6O3Or9w
	9jYRH7S8grbGoBG6ejAOU/XMc+5rEryI0c/c3JxrQdu6ZX9XsuBU0Nlo
X-Gm-Gg: Acq92OGwy5i9zVch+JE1X3TwKkRr8+CZtsF4U6NHr1xK4uNyQEeqHI/tD8eGGzgqdaZ
	4W1divhkuaELyzX/C90OcmMj8pOJYWALM+PakbF/SMO+LXkhy8IEJdSsk33ll4dcXHm1JgTT5pP
	/DlKBpqfO9Jv777S8yJfPIavBvqBYSPUsdkwv7oSz2HhslIwhzRWd5Fxvvk9m10uc+pOGLBmlyJ
	R5xlsimfJJ4d2L0DTRmNy28///Ce6v64guzLnNp/VG5LRUg4puSSL2LorSQd9vZdBL2gJdI8O8E
	K/DSUFKg0+FEtQrdDbZatx1V1DybmrWIAnn70lJXsc5dTR1mLU8SVAqhdnDY0CVSxnRitVWFpI+
	0Y3eX+1buEmUoFR1t+qUSFS2u6+m6y2KVAPoAXhzo/8ZLGnnuwV2teVOlFlbgGk3zxvfhhbUz3N
	ko93ym/Q4UAO1nhpRVlLemmpVBd8dIYUafKbEv/f2RQBDpOYFCeFrfNi5wrwMMVnmRMk8brwAyK
	gZu
X-Received: by 2002:a05:600c:35cc:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-490c263fd13mr486435955e9.28.1781106808918;
        Wed, 10 Jun 2026 08:53:28 -0700 (PDT)
Received: from [192.168.1.37] (83.6.47.15.ipv4.supernova.orange.pl. [83.6.47.15])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm56997652f8f.14.2026.06.10.08.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 08:53:28 -0700 (PDT)
Message-ID: <e872496f-acd3-43fc-831d-eb4dc5dcc26e@gmail.com>
Date: Wed, 10 Jun 2026 17:53:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: asus-wmi: add keystone dongle support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com,
 luke@ljones.dev, denis.benato@linux.dev, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20260528185752.81563-1-dariuszfigzal@gmail.com>
 <df1a778f-5b43-9ec7-2c38-99b44d7eab61@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Dariusz_Figza=C5=82?= <dariuszfigzal@gmail.com>
In-Reply-To: <df1a778f-5b43-9ec7-2c38-99b44d7eab61@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/10/26 2:25 PM, Ilpo Järvinen wrote:
> On Thu, 28 May 2026, Dariusz Figzał wrote:
> 
>> The ASUS Keystone is a physical NFC-like dongle that slots into supported
>> ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.
>>
>> Expose the current insert state via a sysfs attribute by querying WMI
>> device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
>> convention: PRESENCE_BIT (0x00010000) encodes the insert state rather than
>> feature presence, and STATUS_BIT is never set. Presence of a keystone slot
>> is detected by a successful DSTS call.
>>
>> Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
>> ---
>>
>> Changes in v2:
>> - Use .is_visible and platform_attributes[] instead of
>>    device_create_file/device_remove_file (Ilpo Järvinen)
>>
>>   drivers/platform/x86/asus-wmi.c            | 65 ++++++++++++++++++++++
>>   include/linux/platform_data/x86/asus-wmi.h |  7 +++
> 
> Please document the interface in
> Documentation/ABI/testing/sysfs-platform-asus-wmi
> 
> --
>   i.

I'll add the documentation in v3. Thanks for the review.

> 
>>   2 files changed, 72 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 80144c412b90..3c9ef826551d 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>>   #define NOTIFY_KBD_TTP			0xae
>>   #define NOTIFY_LID_FLIP			0xfa
>>   #define NOTIFY_LID_FLIP_ROG		0xbd
>> +#define NOTIFY_KEYSTONE			0xb4
>>   
>>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>>   
>> @@ -279,6 +280,8 @@ struct asus_wmi {
>>   	u32 tablet_switch_dev_id;
>>   	bool tablet_switch_inverted;
>>   
>> +	bool keystone_available;
>> +
>>   	enum fan_type fan_type;
>>   	enum fan_type gpu_fan_type;
>>   	enum fan_type mid_fan_type;
>> @@ -646,6 +649,55 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>>   	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>>   }
>>   
>> +/* Keystone *******************************************************************/
>> +
>> +static int keystone_check_present(struct asus_wmi *asus)
>> +{
>> +	u32 retval;
>> +	int err;
>> +
>> +	asus->keystone_available = false;
>> +
>> +	/*
>> +	 * Use a raw devstate call rather than asus_wmi_dev_is_present().
>> +	 * For this devid, PRESENCE_BIT encodes current insert state, not
>> +	 * feature presence, so asus_wmi_dev_is_present() would return false
>> +	 * whenever the dongle is absent at boot, even on machines that have
>> +	 * a keystone slot.
>> +	 * -ENODEV means the firmware doesn't know this devid at all.
>> +	 * retval is not examined here, only the return code matters.
>> +	 */
>> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
>> +	if (err == -ENODEV)
>> +		return 0;
>> +	if (err)
>> +		return err;
>> +
>> +	asus->keystone_available = true;
>> +	return 0;
>> +}
>> +
>> +static ssize_t keystone_show(struct device *dev,
>> +			     struct device_attribute *attr, char *buf)
>> +{
>> +	struct asus_wmi *asus = dev_get_drvdata(dev);
>> +	u32 retval;
>> +	int err;
>> +
>> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
>> +	if (err)
>> +		return err;
>> +
>> +	return sysfs_emit(buf, "%d\n", !!(retval & ASUS_WMI_DSTS_PRESENCE_BIT));
>> +}
>> +
>> +static DEVICE_ATTR_RO(keystone);
>> +
>> +static void asus_wmi_keystone_notify(struct asus_wmi *asus)
>> +{
>> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "keystone");
>> +}
>> +
>>   /* Input **********************************************************************/
>>   static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>>   {
>> @@ -4575,6 +4627,12 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>   		return;
>>   	}
>>   
>> +	if (code == NOTIFY_KEYSTONE) {
>> +		if (asus->keystone_available)
>> +			asus_wmi_keystone_notify(asus);
>> +		return;
>> +	}
>> +
>>   	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
>>   		if (asus->fan_boost_mode_available)
>>   			fan_boost_mode_switch_next(asus);
>> @@ -4698,6 +4756,7 @@ static struct attribute *platform_attributes[] = {
>>   	&dev_attr_lid_resume.attr,
>>   	&dev_attr_als_enable.attr,
>>   	&dev_attr_fan_boost_mode.attr,
>> +	&dev_attr_keystone.attr,
>>   #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>>   		&dev_attr_charge_mode.attr,
>>   		&dev_attr_egpu_enable.attr,
>> @@ -4741,6 +4800,8 @@ static umode_t asus_sysfs_is_visible(struct kobject *kobj,
>>   		devid = ASUS_WMI_DEVID_ALS_ENABLE;
>>   	else if (attr == &dev_attr_fan_boost_mode.attr)
>>   		ok = asus->fan_boost_mode_available;
>> +	else if (attr == &dev_attr_keystone.attr)
>> +		ok = asus->keystone_available;
>>   
>>   #if IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS)
>>   	if (attr == &dev_attr_charge_mode.attr)
>> @@ -5081,6 +5142,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>>   	if (err)
>>   		goto fail_platform_profile_setup;
>>   
>> +	err = keystone_check_present(asus);
>> +	if (err)
>> +		dev_warn(&pdev->dev, "Failed to check Keystone presence: %d\n", err);
>> +
>>   	err = asus_wmi_sysfs_init(asus->platform_device);
>>   	if (err)
>>   		goto fail_sysfs;
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 554f41b827e1..c29962d5baac 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -147,6 +147,13 @@
>>   #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
>>   #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
>>   
>> +/* Keystone dongle insert/remove state.
>> + * PRESENCE_BIT (0x00010000) encodes insert state:
>> + * 0x00010000 = inserted, 0x00000000 = absent. STATUS_BIT is never set.
>> + * 0xFFFFFFFE means no keystone slot on this machine.
>> + */
>> +#define ASUS_WMI_DEVID_KEYSTONE		0x00120091
>> +
>>   /* TUF laptop RGB modes/colours */
>>   #define ASUS_WMI_DEVID_TUF_RGB_MODE	0x00100056
>>   #define ASUS_WMI_DEVID_TUF_RGB_MODE2	0x0010005A

