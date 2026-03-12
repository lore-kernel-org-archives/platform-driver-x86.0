Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7E8332EC8;
	Thu, 12 Mar 2026 09:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773306801; cv=none; b=YkLbGyJwWn6jRzMbnPZFGut69Bq0N6AechK2r+uqSrREHGkwjgqDloQGA6l/arF5muYo/RuU+Nvb5422hRX95E8seaeZFinylppxlnjMMn4euzJWzQmcVi0uYgzj58DQ5GNTVlvHjrpUFWbxCzHISqjXTMk17b5gvnsLvoISfVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773306801; c=relaxed/simple;
	bh=gLzjGGxgxTykCeBBGOwWbUm0eXBUb7LfTV9FII8P1nE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fWUMYRFjotKiOefwJs1pYo1Jp1Di4vfDVyrGpRVrxrxz1fvsum95hj9kxtLUfHJ+4XZDJYyEpoUI619Mq8MbBx6AsSnbb0RSnYkjCL6UyDTFfEEpxp+w6TMcwqHFgeENgrk5ImHez30vbWJznt9BvIQdCXSG02RKHAwKXVwoIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=A4szZ9np; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="A4szZ9np"
Received: from [192.168.178.24] (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E1B732FC004D;
	Thu, 12 Mar 2026 10:13:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773306798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41DN6LFbv1fsjSFHq9kcUk2hqz6rUREuE+K4TuaQFbY=;
	b=A4szZ9np7ozWGcPTexk1K5zvzgD61c6URwpwaZXhFvfUhcNVXLuKBatPuMyiS2+DlFptUn
	aeiA1Eg3YDbge2NkooABnSiASxFrMxudSQh9LB+ZddNXvnZeQpHtGGcNeKWfMqHAv1jHnP
	BtN4ehASQ3jXUGFos7KGkgDFO50CEaI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <6459bdbf-87cd-4852-a3ce-94762ccaedbf@tuxedocomputers.com>
Date: Thu, 12 Mar 2026 10:13:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Armin Wolf <W_Armin@gmx.de>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20260310234022.2085232-1-wse@tuxedocomputers.com>
 <20260310234022.2085232-6-wse@tuxedocomputers.com>
 <6b944d0d-e0ef-4a48-99a5-7f9955d2066e@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <6b944d0d-e0ef-4a48-99a5-7f9955d2066e@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 11.03.26 um 20:35 schrieb Armin Wolf:
> Am 11.03.26 um 00:34 schrieb Werner Sembach:
>
>> Adds short description for two new sysfs entries, ctgp_offset and
>> usb_c_power_priority, to the documentation of uniwill laptops.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
>> ---
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop 
>> b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> index 2df70792968f3..cba4138604601 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -51,3 +51,28 @@ Description:
>>             Reading this file returns the current status of the breathing 
>> animation
>>           functionality.
>> +
>> +What:        /sys/bus/platform/devices/INOU0000:XX/ctgp_offset
>> +Date:        January 2026
>> +KernelVersion:    7.0
>> +Contact:    Werner Sembach <wse@tuxedocomputers.com>
>> +Description:
>> +        Allows userspace applications to set the configurable TGP offset on 
>> top of the base
>> +        TGP. Base TGP and max TGP and therefore the max cTGP offset are 
>> device specific.
>> +        Note that setting the maximal cTGP leaves no window open for Dynamic 
>> Boost,
>> +        effectively disabling that feature for the GPU to always be 
>> prioritized.
>> +
>> +        Reading this file returns the current configurable TGP offset.
>> +
>> +What: /sys/bus/platform/devices/INOU0000:XX/usb_c_power_priority
>> +Date:        February 2026
>> +KernelVersion:    7.1
>> +Contact:    Werner Sembach <wse@tuxedocomputers.com>
>> +Description:
>> +        Allows userspace applications to choose the USB-C power distribution 
>> profile between
>> +        one that offers a bigger share of the power to the battery and one 
>> that offers more
>> +        of it to the CPU. Writing "charging"/"performance" into this file 
>> selects the
>> +        respective profile.
>> +
>> +        Reading this file returns the profile names with the currently 
>> active one in
>> +        brackets.
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst 
>> b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> index aff5f57a6bd47..be4aeb9c023dd 100644
>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -50,6 +50,10 @@ between 1 and 100 percent are supported.
>>   Additionally the driver signals the presence of battery charging issues 
>> through the standard
>>   ``health`` power supply sysfs attribute.
>>   +It also lets you set whether a USB-C power source should prioritise 
>> charging the battery or
>> +delivering immediate power to the cpu. See 
>> Documentation/ABI/testing/sysfs-driver-uniwill-laptop for
>> +details.
>> +
>>   Lightbar
>>   --------
>>   @@ -58,3 +62,11 @@ LED class device. The default name of this LED class 
>> device is ``uniwill:multico
>>     See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on 
>> how to control the various
>>   animation modes of the lightbar.
>> +
>> +Configurable TGP
>> +--------
>> +
>
> Hi,
>
> i think you forgot to extend the underline a bit. Please do so for the next 
> revision.
ack
>
> Thanks,
> Armin Wolf
>
>> +The ``uniwill-laptop`` driver allows to set the configurable TGP for devices 
>> with NVIDIA GPUs that
>> +allow it.
>> +
>> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
