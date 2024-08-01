Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E10A61FF2
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 Aug 2024 14:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722521160; cv=none; b=ifGLUiQJrQg2F/jeQ2q2Q03mynB6m/u0k1xKbFztkpaMqtZtGzmrs414Neg1gvsA7Um/qXKWfTwfMA180CTsee2NXKGqDPTKYCIKCtAUmQvz9FZBHhRXRTQT1WAL/g4F3732JDArQ2SpsQdO6oqiQs7iHQg+rIiv0pmHFxKtGto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722521160; c=relaxed/simple;
	bh=AC4qosUmLP0yqgTxqxcENxQdbDwsYQ4Yn8cPaTimoSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDucU/Vc0lTZ0I5gR36uSB92pHpc1HqarkISxv4+vQ4gT2Aj+lUKRsowaAPCflJxh6/dgFc1FWydloqQtD8+X/zYMgu6kUdGGwTQO5b6GH0KFm/fdcwyU/sEzUjd0x/JQo0PbsSA/ZM4Bi41AWJWFEsJqglG8Y7wVhwAYi+S8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A73oILG/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A73oILG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722521157;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2FuWlnM8vIi+5UFh8SY0TxoIZSUfLf3OYQ6RIApQ3M=;
	b=A73oILG/rvoUTQ5vlyap1Uib0mADwTEA4NzsLr32c8DmTDCVEy3rV+JFJ46QhxtyVE5Cuy
	PplryslAkVZnzelSseLPj4Bmt71K18TwvauzLtVV07S7U75Iy4rEswF86PFneaVsLjk2Ab
	Rh8fHPVgJnc5s8P3fXa52B0Q9Fcabu0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-Vbr16CI8Mtm6I78zV9oG0Q-1; Thu, 01 Aug 2024 10:05:55 -0400
X-MC-Unique: Vbr16CI8Mtm6I78zV9oG0Q-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a7a97665b8bso625996066b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Aug 2024 07:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722521154; x=1723125954;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2FuWlnM8vIi+5UFh8SY0TxoIZSUfLf3OYQ6RIApQ3M=;
        b=RioRENTL9ZogbvtGAf5DYU6X587hUgC6pty/eXob5NKDz/9MZoPQcZZxt7VYwxxcwM
         uhyv9rTND42jGgdaNeVKBzgQ/qBtdoE1ox8DH62qKirY0bzWYJupjVLDBR6nysszsIYK
         mHn0KmMt4JMoAuxuMumN0JT45T90FrCalazaBj9ex38xkrEUdEhioJUcQ0C0yrJN0exu
         hjMHl2ZwOFFsTTW3fenjXwjGSGBaekNU1udZtiHPYL1wUKvzm8uuJt1g8Iqi0xigZ7fv
         1Wo2WnPU24Deon3FGcxTymUTNnzaLGUSbAA7DkUwoAO8nymYBAi5v4o5m2vvUOQlMyo/
         iQ+Q==
X-Gm-Message-State: AOJu0YxCRrQ+IKcfR//TVt6hS0WsbbYq+IKJVWvnp9OpRBUU86baQgVP
	fLw5JoAgqCYggOc4wA7DmZsaWV+lZOzujNlkPPu2m2fMK2ZUQrJTPUnTFQMV+A3LKjSxfK4VuIq
	sk/f64vx6pEkyULwHdGA1HgB32lVCTy+WA9bAcWKRGin61ODZMEqj5E1b/pXxHdSd3L7Fq+dDMx
	fWBew=
X-Received: by 2002:a17:907:3f87:b0:a7a:a46e:dc37 with SMTP id a640c23a62f3a-a7dc509fc74mr20929166b.57.1722521154022;
        Thu, 01 Aug 2024 07:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc4Vdl768I6F3i08V5qjTpCa1gdg2umZOSjZV3LHr9KrTrdLU/yxv31EbtIXK6RUcQ+zArqg==
X-Received: by 2002:a17:907:3f87:b0:a7a:a46e:dc37 with SMTP id a640c23a62f3a-a7dc509fc74mr20925266b.57.1722521153449;
        Thu, 01 Aug 2024 07:05:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad91010sm910293666b.172.2024.08.01.07.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 07:05:52 -0700 (PDT)
Message-ID: <21d3fef2-650b-4744-ad3b-8689759f5b96@redhat.com>
Date: Thu, 1 Aug 2024 16:05:52 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: asus-wmi: Add lite thermal policy
 support
To: Mohamed Ghanmi <mohamed.ghanmi@supcom.tn>,
 Joshua Leivenzon <hacker1024@users.sourceforge.net>
Cc: platform-driver-x86@vger.kernel.org,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones" <luke@ljones.dev>
References: <20240731113507.178929-1-hacker1024@users.sourceforge.net>
 <ME3P282MB300372C60091A735770D94B1A4B12@ME3P282MB3003.AUSP282.PROD.OUTLOOK.COM>
 <Zqoln_jQlfP5yzS6@meddabeast>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Zqoln_jQlfP5yzS6@meddabeast>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7/31/24 1:54 PM, Mohamed Ghanmi wrote:
> Hi, 
> 
> On Wed, Jul 31, 2024 at 09:35:07PM +1000, Joshua Leivenzon wrote:
>> Some ASUS laptops, such as the Zenbook Duo 2024 (UX8406), use a different WMI
>> device ID to set the thermal policy.
>>
>> These devices tend to lack support for custom fan curve management, hence the
>> "lite" designation.
>>
>> Signed-off-by: Joshua Leivenzon <hacker1024@users.sourceforge.net>
>> ---
>>  drivers/platform/x86/asus-wmi.c            | 102 +++++++++++++++------
>>  include/linux/platform_data/x86/asus-wmi.h |   1 +
>>  2 files changed, 76 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index cc735931f97b..a89cbc063a3f 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -93,9 +93,13 @@ module_param(fnlock_default, bool, 0444);
>>  #define ASUS_FAN_BOOST_MODE_SILENT_MASK		0x02
>>  #define ASUS_FAN_BOOST_MODES_MASK		0x03
>>  
>> +#define ASUS_THROTTLE_THERMAL_POLICY_COUNT 3
>>  #define ASUS_THROTTLE_THERMAL_POLICY_DEFAULT	0
>>  #define ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST	1
>>  #define ASUS_THROTTLE_THERMAL_POLICY_SILENT	2
>> +#define ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT 0
>> +#define ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST 2
>> +#define ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT 1
>>  
>>  #define USB_INTEL_XUSB2PR		0xD0
>>  #define PCI_DEVICE_ID_INTEL_LYNXPOINT_LP_XHCI	0x9c31
>> @@ -287,6 +291,7 @@ struct asus_wmi {
>>  	bool kbd_rgb_state_available;
>>  
>>  	bool throttle_thermal_policy_available;
>> +	bool throttle_thermal_policy_lite;
>>  	u8 throttle_thermal_policy_mode;
>>  
>>  	bool cpu_fan_curve_available;
>> @@ -3639,6 +3644,14 @@ static int throttle_thermal_policy_check_present(struct asus_wmi *asus)
>>  	err = asus_wmi_get_devstate(asus,
>>  				    ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>>  				    &result);
>> +	if (err == -ENODEV) {
>> +		err = asus_wmi_get_devstate(asus,
>> +						ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE,
>> +						&result);
>> +		asus->throttle_thermal_policy_lite = true;
>> +	} else {
>> +		asus->throttle_thermal_policy_lite = false;
>> +	}
>>  	if (err) {
>>  		if (err == -ENODEV)
>>  			return 0;
>> @@ -3659,7 +3672,10 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
>>  
>>  	value = asus->throttle_thermal_policy_mode;
>>  
>> -	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>> +	err = asus_wmi_set_devstate(
>> +					asus->throttle_thermal_policy_lite
>> +						? ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE
>> +						: ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
>>  				    value, &retval);
>>  
>>  	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
>> @@ -3701,7 +3717,7 @@ static int throttle_thermal_policy_switch_next(struct asus_wmi *asus)
>>  	u8 new_mode = asus->throttle_thermal_policy_mode + 1;
>>  	int err;
>>  
>> -	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
>> +	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_COUNT - 1)
>>  		new_mode = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>>  
>>  	asus->throttle_thermal_policy_mode = new_mode;
>> @@ -3740,7 +3756,7 @@ static ssize_t throttle_thermal_policy_store(struct device *dev,
>>  	if (result < 0)
>>  		return result;
>>  
>> -	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_SILENT)
>> +	if (new_mode > ASUS_THROTTLE_THERMAL_POLICY_COUNT - 1)
>>  		return -EINVAL;
>>  
>>  	asus->throttle_thermal_policy_mode = new_mode;
>> @@ -3771,18 +3787,34 @@ static int asus_wmi_platform_profile_get(struct platform_profile_handler *pprof,
>>  
>>  	tp = asus->throttle_thermal_policy_mode;
>>  
>> -	switch (tp) {
>> -	case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
>> -		*profile = PLATFORM_PROFILE_BALANCED;
>> -		break;
>> -	case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
>> -		*profile = PLATFORM_PROFILE_PERFORMANCE;
>> -		break;
>> -	case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
>> -		*profile = PLATFORM_PROFILE_QUIET;
>> -		break;
>> -	default:
>> -		return -EINVAL;
>> +	if (!asus->throttle_thermal_policy_lite) {
>> +		switch (tp) {
>> +		case ASUS_THROTTLE_THERMAL_POLICY_DEFAULT:
>> +			*profile = PLATFORM_PROFILE_BALANCED;
>> +			break;
>> +		case ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST:
>> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
>> +			break;
>> +		case ASUS_THROTTLE_THERMAL_POLICY_SILENT:
>> +			*profile = PLATFORM_PROFILE_QUIET;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>> +	} else {
>> +		switch (tp) {
>> +		case ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT:
>> +			*profile = PLATFORM_PROFILE_BALANCED;
>> +			break;
>> +		case ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST:
>> +			*profile = PLATFORM_PROFILE_PERFORMANCE;
>> +			break;
>> +		case ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT:
>> +			*profile = PLATFORM_PROFILE_QUIET;
>> +			break;
>> +		default:
>> +			return -EINVAL;
>> +		}
>>  	}
>>  
>>  	return 0;
>> @@ -3796,18 +3828,34 @@ static int asus_wmi_platform_profile_set(struct platform_profile_handler *pprof,
>>  
>>  	asus = container_of(pprof, struct asus_wmi, platform_profile_handler);
>>  
>> -	switch (profile) {
>> -	case PLATFORM_PROFILE_PERFORMANCE:
>> -		tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
>> -		break;
>> -	case PLATFORM_PROFILE_BALANCED:
>> -		tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>> -		break;
>> -	case PLATFORM_PROFILE_QUIET:
>> -		tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
>> -		break;
>> -	default:
>> -		return -EOPNOTSUPP;
>> +	if (!asus->throttle_thermal_policy_lite) {
>> +		switch (profile) {
>> +		case PLATFORM_PROFILE_PERFORMANCE:
>> +			tp = ASUS_THROTTLE_THERMAL_POLICY_OVERBOOST;
>> +			break;
>> +		case PLATFORM_PROFILE_BALANCED:
>> +			tp = ASUS_THROTTLE_THERMAL_POLICY_DEFAULT;
>> +			break;
>> +		case PLATFORM_PROFILE_QUIET:
>> +			tp = ASUS_THROTTLE_THERMAL_POLICY_SILENT;
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>> +	} else {
>> +		switch (profile) {
>> +		case PLATFORM_PROFILE_PERFORMANCE:
>> +			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_OVERBOOST;
>> +			break;
>> +		case PLATFORM_PROFILE_BALANCED:
>> +			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_DEFAULT;
>> +			break;
>> +		case PLATFORM_PROFILE_QUIET:
>> +			tp = ASUS_THROTTLE_THERMAL_POLICY_LITE_SILENT;
>> +			break;
>> +		default:
>> +			return -EOPNOTSUPP;
>> +		}
>>  	}
>>  
>>  	asus->throttle_thermal_policy_mode = tp;
>> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
>> index 0aeeae1c1943..f37e34ea36a5 100644
>> --- a/include/linux/platform_data/x86/asus-wmi.h
>> +++ b/include/linux/platform_data/x86/asus-wmi.h
>> @@ -68,6 +68,7 @@
>>  #define ASUS_WMI_DEVID_SCREENPAD_LIGHT	0x00050032
>>  #define ASUS_WMI_DEVID_FAN_BOOST_MODE	0x00110018
>>  #define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY 0x00120075
>> +#define ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY_LITE 0x00110019
> 
> A patch already exists that fixes this issue but still not upstream
> It adds support for modern vivobook laptops and some newer zenbooks
> and uses platform profiles
> 
> https://lore.kernel.org/platform-driver-x86/20240609144849.2532-2-mohamed.ghanmi@supcom.tn/

And I have just merged that patch and pushed it to my review-hans
(soon to be pdx86/for-next) branch:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

So I'm dropping this patch from the queue since this functionality is already
implemented now.

Regards,

Hans


