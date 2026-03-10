Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23378391E5D;
	Tue, 10 Mar 2026 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182097; cv=none; b=WP5EVwlxYf4RvucoKeDDt7iRY7jRcrDxm3qmhIqXKEkH7LoUtQ42Nk0av1l1EsGRsyWlfq+VzBWGGi3qlZjpzfKarSHalYFOOZk3s8K9xgN+jqeDOYL1AIUddZaRiXEKxzwCaVntF12j/JwnzC4kgO9BZ24uaPVzmWgnfqxerx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182097; c=relaxed/simple;
	bh=PGGJghITaCrkPDmF3IYrZ0mGLnlfhC7CJWCisUgVkII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D0F8RqSRfQJtqtGDe9RhbsG1BDKGhoTi9Rhki0D9YzsQp624ThCmnLy473vdwiaZZUQyxo7jEu5VuPDvLr6iJHnHYCyC9KXWxgXdJM6tjvCcY3hYWqlMSftRsfJcBGEfPxqsZmahzEZ/074OECZxCNok1V04KQaA2rgqNi2+UsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=W63V/TbM; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="W63V/TbM"
Received: from [192.168.178.24] (i5C75F5CE.versanet.de [92.117.245.206])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id DA7D52FC004A;
	Tue, 10 Mar 2026 23:34:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1773182086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9cI7OIN41TrhTryhdqG6F+EE2KEXfGABbiXFhNqqt1c=;
	b=W63V/TbM+Y6v3MBBF/cRYjSe+PGlDkfQU84dBzSCIUiCiC+iY7OS7aXJuDvsdoUqOVrKv3
	Sb3uieZzkn3XepVwNYCN2hqfJvR5uknAVtfIPvdiZ63uRfU9pEuFDi2TCRYnjpyb1FbJWZ
	zro4vaRUR1I4hAbAm+gnKYYM52pPcYQ=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <ed284a9e-e712-46d4-bf82-212218c95200@tuxedocomputers.com>
Date: Tue, 10 Mar 2026 23:34:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] Documentation: laptops: Update documentation for
 uniwill laptops
To: Randy Dunlap <rdunlap@infradead.org>, W_Armin@gmx.de, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260303225440.504358-1-wse@tuxedocomputers.com>
 <20260303225440.504358-6-wse@tuxedocomputers.com>
 <40b5b8e2-bd45-4723-adc5-c0137c749fe3@infradead.org>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <40b5b8e2-bd45-4723-adc5-c0137c749fe3@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 04.03.26 um 00:05 schrieb Randy Dunlap:
>   
>
> On 3/3/26 2:54 PM, Werner Sembach wrote:
>> Adds short description for two new sysfs entries, ctgp_offset and
>> usb_c_power_priority, to the documentation of uniwill laptops.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   .../ABI/testing/sysfs-driver-uniwill-laptop   | 25 +++++++++++++++++++
>>   .../admin-guide/laptops/uniwill-laptop.rst    | 12 +++++++++
>>   2 files changed, 37 insertions(+)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> index 2df70792968f3..70b4bc97d91a8 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> +++ b/Documentation/ABI/testing/sysfs-driver-uniwill-laptop
>> @@ -51,3 +51,28 @@ Description:
>>   
>>   		Reading this file returns the current status of the breathing animation
>>   		functionality.
>> +
>> +What:		/sys/bus/platform/devices/INOU0000:XX/ctgp_offset
>> +Date:		January 2026
>> +KernelVersion:	7.0
>> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
>> +Description:
>> +		Allows userspace applications to set the configurable TGP offset on top of the base
>> +		TGP. Base TGP and max TGP and therefore the max cTGP offset are device specific.
>> +		Note that setting the maximal cTGP leaves no window open for Dynamic Boost,
>> +		effectifly disabling that feature for the GPU to always be
> 		effectively
thx
>
> prioritized.
>> +
>> +		Reading this file returns the current configurable TGP offset.
>> +
>> +What:		/sys/bus/platform/devices/INOU0000:XX/usb_c_power_priority
>> +Date:		February 2026
>> +KernelVersion:	7.1
>> +Contact:	Werner Sembach <wse@tuxedocomputers.com>
>> +Description:
>> +		Allows userspace applications to choose the USB-C power distribution profile between
>> +		one that offers a bigger share of the power to the battery and one that offers more
>> +		of it to the CPU. Writing "charging"/"performance" into this file selects the
>> +		respective profile.
>> +
>> +		Reading this file returns the profile names with the currently active one in
>> +		brackets.
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> index aff5f57a6bd47..c89b8b3756f84 100644
>> --- a/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -50,6 +50,10 @@ between 1 and 100 percent are supported.
>>   Additionally the driver signals the presence of battery charging issues through the standard
>>   ``health`` power supply sysfs attribute.
>>   
>> +It also let you set whether an USB-C power source should prioritise charging the
>            lets                 a USB-C

thx

fixed in next version

>
> battery or
>> +delivering immediate power to the cpu. See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for
>> +details.
>> +
>>   Lightbar
>>   --------
>>   
>> @@ -58,3 +62,11 @@ LED class device. The default name of this LED class device is ``uniwill:multico
>>   
>>   See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on how to control the various
>>   animation modes of the lightbar.
>> +
>> +Configurable TGP
>> +--------
>> +
>> +The ``uniwill-laptop`` driver allows to set the configurable TGP for devices with NVIDIA GPUs that
>> +allow it.
>> +
>> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
