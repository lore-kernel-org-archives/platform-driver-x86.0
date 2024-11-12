Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE8D1CD1F1
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 12:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731415390; cv=none; b=L+T6uV3QplrBKZDbZm7p74NhLgL0gBV6t62Zb7CYzmJpTPxwPVFezBSTBqMHgfIJpNOT8PwoIrzE9cai9TePRviPQKwma5Lr7VkoyZm2yPDBEbYY/v/crgylSUc5IJ/D69uLGbwSUifv0sJuZlDv1OUip4VRoMM67T2qk4qtxHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731415390; c=relaxed/simple;
	bh=fKlTA8djIcIbmuvj9ueHqHErNYwfKsce1G9c7pcnAxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UYaC6xnKy2yheYorfq8AvtYbopH1tQS3Yace/VghtUEch+XI8FqUsN32cJrw1hTKNvjp7F8e8eyJJ1/Be9baWYGyudNXS0jMbb5znDHR4bJOMwx04jlwI6fW2vgwhF6xA5oZr873zOVtFpYvfpGp1TmkY9QkRkfK1XvxGpOYR5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=CGHvGz5T; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="CGHvGz5T"
Received: from [192.168.42.27] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 2B7AC2FC0048;
	Tue, 12 Nov 2024 13:43:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1731415384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cSe/jh5ECAxigPGPSC9YLo142FFNriKmsY47CZGQCWs=;
	b=CGHvGz5TinKLmoBoxTSdxyocVC5mLttUWsZXggP9ijugXCO47mNm+SYvAZPbJPg/ZZIH2i
	8P3sUuH5f0Dy/aOFpnSX8BL7fy1m0BMwAOXSH0aq0sUfjTJgln5yY9XxuTCX1bsVccSw8F
	GaZt16fdJrgGmU7mGpBtSsvSBEVvY3c=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <bf3dae8b-7f1f-4438-9cbe-525825d70752@tuxedocomputers.com>
Date: Tue, 12 Nov 2024 13:42:53 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Why is wmi_bus_type not exported?
To: Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org
References: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
 <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
Content-Language: de-DE, en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <c4315d31-7bc6-4bd9-a7eb-3e53356d55e9@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Am 12.11.24 um 13:01 schrieb Armin Wolf:
> Am 12.11.24 um 12:52 schrieb Werner Sembach:
>
>> Hi,
>>
>> quick learning question: Why is wmi_bus_type not exported unlike, for
>> example, acpi_bus_type, and platform_bus_type?
>>
>> Wanted to use bus_find_device_by_name in an acpi driver that might
>> need additional infos from a wmi interface that might or might not be
>> present.
>>
>> Kind regards,
>>
>> Werner Sembach
>>
>>
> What kind of information do you have in mind? wmi_bus_type is not 
> being exported for historic reasons, i can change that if necessary.

It's for the tuxedo-drivers part for the Sirius 16 Gen 1 & 2 which has a 
slow wmi and a quick acpi interface, however the quick acpi interface 
can not get the max rpm of the cooling fans, but the wmi interface can.

Thing is for the acpi driver we might plan an earlier upstream date and 
it might get multi-odm support, while the wmi interface is and stays odm 
specific. So my idea was to only couple both drivers in a dynamic way 
using bus_find_device_by_name.

>
> Thanks,
> Armin Wolf
>
Kind regards,

Werner

