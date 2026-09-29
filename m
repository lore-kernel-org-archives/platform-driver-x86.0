Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE8B340A7F;
	Tue, 29 Sep 2026 23:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790724161; cv=none; b=XKs8lqpxjBdk0vXZ3+AYSCFW9+e0KI3uCHQ4R/H43/n2eTeLaCgq8//N5y2Y+rTwxVsoy3cZxr8iTi7qk13sF2cCnyauSU8NnKS5RpO/HBy/hDrMmIoJc34o26H6SjjrqqZFwKsm2nj8wGcwJ/0Oj4VakkMo+YitN/WHWev/WEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790724161; c=relaxed/simple;
	bh=dzcz7kSJi/jFCsPi0aCSmu5TPNlC0d8C5LfEZw9bVD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BjVZD1cUzVlXrAHDyPyD/WHJ3SHioCcWXPFiTRjMhdGBOV6axuAxA9X/k7HQXOmywMn/Ll3eYDUHizWA+7gbm9sA2D8u6ff7SdOjUjYh5XHqvIcvWvsItbsqIq0zBcJU2W28hXBfiWujmsGMtJGMCRD76KY96A54+gM0vyWfRbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=nKMqzuSf; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="nKMqzuSf"
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id D06DA2FC0052;
	Wed, 30 Sep 2026 01:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790724149;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=liSkBlby/wKhwXT/EDYcF5nu8bIQei1s2zHMezERPeI=;
	b=nKMqzuSf9IaOt8ID71yUmvosOF7A6lrd0fePocZj23XGd9fa7R/ZdwlxA+MSnAeydvr2aZ
	59VcQdjvFDBq2a1pBSX3L77AbwUYpfMIrvM833Gb5av0c8t19OViAYLn0fAbwPAJGx5zPF
	ivnSLe8XpK7o0pSms3mGhRVjCGyaX8I=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <263ec1ec-181a-4f96-92f4-25674559e961@tuxedocomputers.com>
Date: Wed, 30 Sep 2026 01:22:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] platform/x86: uniwill-laptop: Map the screen rotation
 key
To: Armin Wolf <W_Armin@gmx.de>, Mohamed Jouini <amad3v@gmail.com>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Christoffer Sandberg <cs@tuxedo.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925211635.1422516-1-amad3v@gmail.com>
 <20260925211635.1422516-4-amad3v@gmail.com>
 <94e5619d-02eb-4b55-bfcb-67964ee1def3@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <94e5619d-02eb-4b55-bfcb-67964ee1def3@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 26.09.26 um 01:52 schrieb Armin Wolf:
> Am 25.09.26 um 23:16 schrieb Mohamed Jouini:
>
>> The PCSpecialist Recoil 16 AMD / TUXEDO Stellaris 16 Gen7 chassis has an
>> "Sc" key next to F12, meant to rotate the lay-flat screen by 180 degrees.
>> It reports WMI event 0xD0, which is currently reported as KEY_UNKNOWN.
>> Map it to KEY_ROTATE_DISPLAY.
>
> Unless Tuxedo know more about this event code:
don't have the device at hand so pulled christoffer in the loop
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>
>> Signed-off-by: Mohamed Jouini <amad3v@gmail.com>
>> ---
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 3 +++
>>   drivers/platform/x86/uniwill/uniwill-wmi.h  | 3 +++
>>   2 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c 
>> b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index 0932e5937..f99c5e9ac 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -519,6 +519,9 @@ static const struct key_entry uniwill_keymap[] = {
>>       /* Reported when the user wants to toggle the webcam */
>>       { KE_IGNORE,    UNIWILL_OSD_WEBCAM_TOGGLE,              { KEY_UNKNOWN }},
>>   +    /* Reported when the user wants to rotate the (lay-flat) screen by 180 
>> degrees */
>> +    { KE_KEY,       UNIWILL_OSD_ROTATE_SCREEN,              { 
>> KEY_ROTATE_DISPLAY }},
>> +
>>       { KE_END }
>>   };
>>   diff --git a/drivers/platform/x86/uniwill/uniwill-wmi.h 
>> b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> index b25b2f312..1b6f650c4 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-wmi.h
>> +++ b/drivers/platform/x86/uniwill/uniwill-wmi.h
>> @@ -117,6 +117,9 @@
>>     #define UNIWILL_OSD_WEBCAM_TOGGLE        0xCF
>>   +/* "Sc" key next to F12 on the PCSpecialist Recoil 16 / Stellaris 16 Gen7 */
>> +#define UNIWILL_OSD_ROTATE_SCREEN        0xD0
>> +
>>   #define UNIWILL_OSD_KBD_BACKLIGHT_CHANGED    0xF0
>>     struct device;
