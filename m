Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C353DDDB5
	for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 11:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779966063; cv=none; b=MtzzuaAabh6ItJVKcyjBJVTaJX3aA+l90Mau4YHSEkXiq8weNthbWVjCHEywo9AXAdJmNT9JQ67iO2CJOvW0Lww2NzcbD7XY9FFpGGXemlDIwbYvA443T1ly22o7+Ff0cUtig2J8Mhtwh4dPpT2h9yX7/KO28At6WeSOczWmqMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779966063; c=relaxed/simple;
	bh=axg3ur3jlPGKN9j/afJ30isp3QGjg7ElX9jWGVCDjnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FaHNwGdaQhc1gZHhIGJzmQlTKTdUd/XV14UvnRrgpPWsI92fCN+3sSl0McFGjgd5J83EudJ5WymCFYcAVCzH0ddedf+FPy45bQg0rnysrnK8HYo7iGRkwKy6YOb6qFpiwd8jycI55/oHEgTczcaVDmD9owpw8jFRqLwK5+gkq+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H/xgtp8C; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H/xgtp8C"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd56d108454so2260986266b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 May 2026 04:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779966060; x=1780570860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n8Yyu46RSl4wBB4R+YuuITnZ8asfzOZZvm75cjR8xFA=;
        b=H/xgtp8CJkXrgFI7hhA5Qpsbjf4+5FBWT/fqGu3WROOri5uaMpmO33MqtaOd2zXxSk
         Kn78CUH2hjPg71UvEon6N27lQAS/p+LQke7XIzcmpVVi6/VpvaXyfx6YuIj0ixhbym85
         /iNXPpPNNC2tNmJAdV6pc7DA7Kos5IX+DYsqXAYDCS5ycWW9T31BQXYivF4bKoBMPqtJ
         ty9YNEk0R706RRJosP6yhgZtdPZONtzq6f60mVkpsxzSWVUhJ0/g7EhumaT3QPzLgz6E
         G7CNsOWXLif1xgxM5EXJtz0EWEsC4iTBHvIsjSEPJdXnSTDbx7gzPHwqTAdqFhuHvGdV
         ePkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779966060; x=1780570860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n8Yyu46RSl4wBB4R+YuuITnZ8asfzOZZvm75cjR8xFA=;
        b=Dcv/IVAv0NBrUzf/ewzd8ig0gxg0F4kY2narWQUJV0COylxz3Lm7a+Q74k9VDnyFlm
         0kT0P51tkpRYKzR6xbl4L3v3ZZRgbgQ4iX0b/vzKIUmMMKz/HCYqOz9IVEQ9Rtp0+vRC
         UJjNXAn18Zq9RQxKpZxLhRbaZP0IFLUTlZWv15titVkdHk2EdsfCGNFFJKs25IT6hxcm
         OPSyBMNuRYefYMEYqubvguIveKpBvdopbvaAeMKt98O3IKKFtCcTSQQNZlL/DLlPuJza
         5PUzGr3BOA2wRJW8JrtL+g3S0K59KADDeSP2WCWA1ntjozz1FTmGfRrjbub7O+PvGaza
         zzYg==
X-Gm-Message-State: AOJu0YwYr+mlDClPnxIVmmaMtH/QwGqIoD4owzrRoQlLrdJfueh/2w5+
	moioQrcaEm/MwdNHNM70RLSiMUtq0I/8KXzTFmj+Rbrvgg+oWUNfiUuWpJX80Qaunrw=
X-Gm-Gg: Acq92OFt04ZbBMioQEkFLl9ytqVg6twW9SYBB2npJ9OK7ej8h4qgD4ZzKg49inakvIp
	v0lJnQAb3p58n/oapSlGiTpXPY31lYBDjymlf/wKcNDV3E6ce9kSR53032EXTcuVv2JEpFFXCUo
	mi3ww+PTKbxgvMEt5ET35SzkURqlLWO5zJzfuoetJ1oaFRCHx3S0+eNibjoXPJwfCecjtOkC+cm
	CKBONFxLXMGqLvD5dIYY7v/YlcqDR/YX2+J9bW+vPRvxfig8hq/I20ZoQ/9zGWNM4SBMdKExxe9
	uwV65Bcd16nd0w4m6Y4vTBzymU7BawvXUq888lvIDfnVpftLLgSpnSStnTtkOjCqhigtWJO9TdB
	Laj9/cFBoi23j586N/xb24Y/ZFe1rx878/gcEx/OBxJ6bPIwcnyWhpEnPH03J/nzc62E4LKTVib
	45evHjWAf+gjz3Jw8q58WcJguALHYrjVZaWbsaPYyfyXTfk+sLy37XViEDr2WiRSUGHSSkqfMT2
	adZfm4lZQ==
X-Received: by 2002:a17:907:c081:b0:bd4:6c96:f87b with SMTP id a640c23a62f3a-bdd25ce8c1fmr1832052366b.28.1779966059575;
        Thu, 28 May 2026 04:00:59 -0700 (PDT)
Received: from [192.168.1.37] (79.191.45.28.ipv4.supernova.orange.pl. [79.191.45.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dea6sm714055166b.7.2026.05.28.04.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 May 2026 04:00:59 -0700 (PDT)
Message-ID: <d886ce08-fec2-4f9a-8c96-3e0a206a7362@gmail.com>
Date: Thu, 28 May 2026 13:00:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: add keystone dongle support
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org, corentin.chary@gmail.com,
 luke@ljones.dev, Hans de Goede <hansg@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20260526214439.70142-1-dariuszfigzal@gmail.com>
 <c4256b75-6791-4ae8-a254-4a767e2a7af8@linux.dev>
 <ccd7ef85-c3a8-aefe-3071-d3ea61b58ca6@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Dariusz_Figza=C5=82?= <dariuszfigzal@gmail.com>
In-Reply-To: <ccd7ef85-c3a8-aefe-3071-d3ea61b58ca6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 5/28/26 11:06 AM, Ilpo Järvinen wrote:
> On Thu, 28 May 2026, Denis Benato wrote:
> 
>>
>> On 5/26/26 23:44, Dariusz Figzał wrote:
>>> The ASUS Keystone is a physical NFC-like dongle that slots into supported
>>> ASUS laptops. The EC fires WMI notify code 0xB4 on insert/remove events.
>>>
>>> Expose the current insert state via a sysfs attribute by querying WMI
>>> device ID 0x00120091 (DSTS). This devid does not follow the standard DSTS
>>> convention: PRESENCE_BIT (0x00010000) encodes the insert state rather than
>>> feature presence, and STATUS_BIT is never set. Presence of a keystone slot
>>> is detected by a successful DSTS call (any result other than -ENODEV).
>> Thanks for this!
>>
>> Ilpo might have some suggestions on how to make the code better,
>> As we discussed a fair bit about this I say LGTM.
>>
>> Reviewed-by: Denis Benato <denis.benato@linux.dev>
>>> Signed-off-by: Dariusz Figzał <dariuszfigzal@gmail.com>
>>> ---
>>>   drivers/platform/x86/asus-wmi.c            | 75 ++++++++++++++++++++++
>>>   include/linux/platform_data/x86/asus-wmi.h |  7 ++
>>>   2 files changed, 82 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>>> index 80144c412b90..a3fa3921aef3 100644
>>> --- a/drivers/platform/x86/asus-wmi.c
>>> +++ b/drivers/platform/x86/asus-wmi.c
>>> @@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
>>>   #define NOTIFY_KBD_TTP			0xae
>>>   #define NOTIFY_LID_FLIP			0xfa
>>>   #define NOTIFY_LID_FLIP_ROG		0xbd
>>> +#define NOTIFY_KEYSTONE			0xb4
>>>   
>>>   #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
>>>   
>>> @@ -279,6 +280,8 @@ struct asus_wmi {
>>>   	u32 tablet_switch_dev_id;
>>>   	bool tablet_switch_inverted;
>>>   
>>> +	bool keystone_detected;
>>> +
>>>   	enum fan_type fan_type;
>>>   	enum fan_type gpu_fan_type;
>>>   	enum fan_type mid_fan_type;
>>> @@ -646,6 +649,66 @@ static bool asus_wmi_dev_is_present(struct asus_wmi *asus, u32 dev_id)
>>>   	return status == 0 && (retval & ASUS_WMI_DSTS_PRESENCE_BIT);
>>>   }
>>>   
>>> +/* Keystone *******************************************************************/
>>> +
>>> +static ssize_t keystone_show(struct device *dev,
>>> +			     struct device_attribute *attr, char *buf)
>>> +{
>>> +	struct asus_wmi *asus = dev_get_drvdata(dev);
>>> +	u32 retval;
>>> +	int err;
>>> +
>>> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	return sysfs_emit(buf, "%d\n", !!(retval & ASUS_WMI_DSTS_PRESENCE_BIT));
>>> +}
>>> +
>>> +static DEVICE_ATTR_RO(keystone);
>>> +
>>> +static void asus_wmi_keystone_notify(struct asus_wmi *asus)
>>> +{
>>> +	sysfs_notify(&asus->platform_device->dev.kobj, NULL, "keystone");
>>> +}
>>> +
>>> +static int asus_wmi_keystone_init(struct asus_wmi *asus)
>>> +{
>>> +	u32 retval;
>>> +	int err;
>>> +
>>> +	/*
>>> +	 * Use a raw devstate call rather than asus_wmi_dev_is_present().
>>> +	 * For this devid, PRESENCE_BIT encodes current insert state, not
>>> +	 * feature presence, so asus_wmi_dev_is_present() would return false
>>> +	 * whenever the dongle is absent at boot, even on machines that have
>>> +	 * a keystone slot.
>>> +	 * -ENODEV means the firmware doesn't know this devid at all.
>>> +	 * retval is not examined here, only the return code matters.
>>> +	 */
>>> +	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_KEYSTONE, &retval);
>>> +	if (err == -ENODEV)
>>> +		return 0;
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	err = device_create_file(&asus->platform_device->dev, &dev_attr_keystone);
>>> +	if (err)
>>> +		return err;
>>> +
>>> +	asus->keystone_detected = true;
>>> +	return 0;
>>> +}
> 
> The visibility of this should be controlled using .is_visible and the
> attribute should be placed into the normal attribute array.
>

Thanks for the review. I'll fix this in v2.

>>> +static void asus_wmi_keystone_exit(struct asus_wmi *asus)
>>> +{
>>> +	if (!asus->keystone_detected)
>>> +		return;
>>> +
>>> +	device_remove_file(&asus->platform_device->dev, &dev_attr_keystone);
>>> +	asus->keystone_detected = false;
>>> +}
>>> +
>>>   /* Input **********************************************************************/
>>>   static void asus_wmi_tablet_sw_report(struct asus_wmi *asus, bool value)
>>>   {
>>> @@ -4575,6 +4638,12 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>>   		return;
>>>   	}
>>>   
>>> +	if (code == NOTIFY_KEYSTONE) {
>>> +		if (asus->keystone_detected)
>>> +			asus_wmi_keystone_notify(asus);
>>> +		return;
>>> +	}
>>> +
>>>   	if (code == NOTIFY_KBD_FBM || code == NOTIFY_KBD_TTP) {
>>>   		if (asus->fan_boost_mode_available)
>>>   			fan_boost_mode_switch_next(asus);
>>> @@ -5085,6 +5154,10 @@ static int asus_wmi_add(struct platform_device *pdev)
>>>   	if (err)
>>>   		goto fail_sysfs;
>>>   
>>> +	err = asus_wmi_keystone_init(asus);
>>> +	if (err)
>>> +		dev_warn(&pdev->dev, "Keystone initialization failed: %d\n", err);
>>> +
>>>   	err = asus_wmi_input_init(asus);
>>>   	if (err)
>>>   		goto fail_input;
>>> @@ -5170,6 +5243,7 @@ static int asus_wmi_add(struct platform_device *pdev)
>>>   fail_hwmon:
>>>   	asus_wmi_input_exit(asus);
>>>   fail_input:
>>> +	asus_wmi_keystone_exit(asus);
>>>   	asus_wmi_sysfs_exit(asus->platform_device);
>>>   fail_sysfs:
>>>   fail_custom_fan_curve:
>>> @@ -5191,6 +5265,7 @@ static void asus_wmi_remove(struct platform_device *device)
>>>   	asus_wmi_backlight_exit(asus);
>>>   	asus_screenpad_exit(asus);
>>>   	asus_wmi_input_exit(asus);
>>> +	asus_wmi_keystone_exit(asus);
>>>   	asus_wmi_led_exit(asus);
>>>   	asus_wmi_rfkill_exit(asus);
>>>   	asus_wmi_debugfs_exit(asus);
>>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>>> index 554f41b827e1..c29962d5baac 100644
>>> --- a/include/linux/platform_data/x86/asus-wmi.h
>>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>>> @@ -147,6 +147,13 @@
>>>   #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
>>>   #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
>>>   
>>> +/* Keystone dongle insert/remove state.
>>> + * PRESENCE_BIT (0x00010000) encodes insert state:
>>> + * 0x00010000 = inserted, 0x00000000 = absent. STATUS_BIT is never set.
>>> + * 0xFFFFFFFE means no keystone slot on this machine.
>>> + */
>>> +#define ASUS_WMI_DEVID_KEYSTONE		0x00120091
>>> +
>>>   /* TUF laptop RGB modes/colours */
>>>   #define ASUS_WMI_DEVID_TUF_RGB_MODE	0x00100056
>>>   #define ASUS_WMI_DEVID_TUF_RGB_MODE2	0x0010005A
>>
> 

