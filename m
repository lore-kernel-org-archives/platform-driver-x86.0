Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DB518BBAB
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 10:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732269659; cv=none; b=uoPSp3TBXcxf/POkm1Q7fOOM3PevpgZK7/MqfTV1hAXRcICTWe8F1im/7A40hQNXLwticbkJplE4odfRy5gZvLAhvs0kU8s42XhCDUmNVmPPwGJNrCKZx+xjkmBQJWp7TBxcKBTAmYfHmiWREr2tcY1e8XHj58IHOXHBKXNkr5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732269659; c=relaxed/simple;
	bh=GNWK+SJsSq/QZDqPaI5cxF0WqjP6SccAypFwjqs7YOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZafJy79RlWQflenMQD6abc8gflo+lbOCjWQ1V5OQqPYX3u1gt1rqXntqvJ24CZlv6/ESXh4G4lmeReiL9n9WDBullk5G4v9KiNg6sHXzN2+kuVyFl+nYVrjW4/Asa9wY+Nyhf7fsIXxb5IL6n9WDVdiDaH0r6ZVcGx0qql9Itws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Ufx1+Cbs; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Ufx1+Cbs"
Received: from [192.168.42.115] (pd9e59944.dip0.t-ipconnect.de [217.229.153.68])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id ED83B2FC004A;
	Fri, 22 Nov 2024 11:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1732269647;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FxW1TAfGh04JQU7eN9T5YAtAx7Rs/GbXQxQqmTcyit8=;
	b=Ufx1+CbsYbxVnIW6+0yLoIiC68jjBIRnxh9aJwtTp9/WkYyt85Wn/LJLBWmqu/nReNgzPZ
	yiyIc6UjK3Id/M+3IGuRTYkXqlwfAGEEvHkI3VngIo2yeEc/swyG07HrEXjCrbh0SmauRJ
	ECVm2veIotvQ6LbRvmYYzEHWbcEChHs=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c942263d-5cdf-4765-9cf4-9c7010c7085b@tuxedocomputers.com>
Date: Fri, 22 Nov 2024 11:00:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acpi_device->driver_data vs acpi_device->dev.driver_data
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <64d96f64-4512-44f6-be3a-ba07043485b6@tuxedocomputers.com>
 <04db3001-55ca-4d9c-aa78-f9286b1d9ccc@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <04db3001-55ca-4d9c-aa78-f9286b1d9ccc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


Am 21.11.24 um 22:53 schrieb Armin Wolf:
> Am 19.11.24 um 17:43 schrieb Werner Sembach:
>
>> Hi,
>>
>> another quick learning question: Why does the acpi_device struct have
>> a driver_data member in addition to the driver_data member of the
>> nested dev?
>>
>> What should each driver_data member be used for?
>>
>> In contrast platform_device and wmi_device only have the
>> dev.driver_data and not the top level driver data.
>>
>> Kind regards,
>>
>> Werner Sembach
>>
> Hi,
>
> from my point of view the driver_data member inside the acpi_device struct is 
> deprecated. You should use dev_set/get_drvdata()
> instead. Other than that the semantics are the same (i think).

Thanks, will do

Kind regards,

Werner

>
> Thanks,
> Armin Wolf
>
