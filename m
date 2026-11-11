Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402832;
	b=o4Tpwxr6p2F+Z59sN/2CAEQe9aTqLIR39MTytzv6zkJjeXIqB3mcfFDgyd6iTaULv/kJ
	 IelHZAeD5kIrQv1WKzgtduEwoRLtJj3e9pBQiPcvBgaEetreJIM0GPPBC46ZquXWFhH6P
	 EXULZgBoafcO48JdmolkFa8qNyaIbU+Ob8TqfwOn8vxANofPM7pFNa9av8SEj/p1GmS/n
	 w4eCUzClebkLz3HfI+NsGbCnDbMQBHPlj5QzYEXccmFTo506iaaNE9Vg/D7RlLeocywji
	 kB+NfXicneI9TYxDDJhLIM7tk4kp0p6PomeSl2N6FbeGU9XjUp4YlnxWkThpELVpjJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402832;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=b0MCM1jOborKxkBd6m6q6bEfoCklGwk0MGB2Cn5N0mA=;
	b=FD9j3Gf2NAf/mC7AciX8oo9lGE+YX6wRltL37vrqOh1eLgEMAR8dkZ/MCRCMZlaa60tB
	 sTNDCG98SKQyA+N6IC8khljW48Ng9FrODyjWkHjRBv8ea5Qtz4uIWgJZ3mXUmQ2479D3j
	 enVCBjRYo/UdWa/lfA8QQXNdDQcHmQEDQfXuv+He60EFsEniavMIQiBbnxKF8jwdYbLH6
	 gTjHCM9zbQTI/cet1piFLx0XyH9TsCLHSs+WIgdfHQu4/99dwplv3OcaZlX94jd8IsMuP
	 uJDRIaHc9wbXNyNnJHIkKZmO/sh9UEqV7liJDUtwo/WM1en8kjJY3R7wmpUK1eAcdQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=UoIG9QWP;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA7D606A327;
	Wed, 11 Nov 2026 13:13:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DA7D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=UoIG9QWP
Received: from [10.10.12.8] (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 584C22FC0080;
	Wed, 11 Nov 2026 14:13:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1794402830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b0MCM1jOborKxkBd6m6q6bEfoCklGwk0MGB2Cn5N0mA=;
	b=UoIG9QWPZ1fvdeRknQVgCzAb/EFhXMs13lzK9Pd31OMf0pLA1s9MRKP2NzuvEb8JtuSZ1j
	be04ilmPvoI3+AGCUmTN0oz2gJFqN6HteyVUImhssG3/m/+JZt+zEwsRpMTrwZKq/84yGq
	/WyTgTUPz2sHIwLKRScr2JBUYp1OOwg=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <fe88757e-bbdd-4b53-a432-998905139735@tuxedocomputers.com>
Date: Wed, 11 Nov 2026 14:13:49 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: uniwill-laptop: Add TUXEDO Stellaris 16 -
 Gen8 - Intel
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20261111115811.498955-1-wse@tuxedocomputers.com>
 <18e8c77c-f605-8eb6-158c-69f3b49ed458@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <18e8c77c-f605-8eb6-158c-69f3b49ed458@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 11.11.26 um 13:26 schrieb Ilpo Järvinen:
> On Wed, 11 Nov 2026, Werner Sembach wrote:
>
>> Same features as the Gen7. Just 2 new entries for the new boardnames.
> The changelog should be readable as standalone, which this clearly isn't.
>
>> I wrote the ident the same way the system product dmi string is written,
> Don't use personalized terms like "I wrote".
>
>> which itself now follows how the device is listed in your online shop. The
>> only actual change was adding the '-' with spaces around.
> What online shop have is irrelevant detail when it comes to kernel changes.
ok, sent a v2 with a hopefully better commit message
>
> --
>   i.
>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>> This commit was built on top of Armins latest series:
>> https://lore.kernel.org/all/20261110165318.631010-1-W_Armin@gmx.de/
>>
>>   drivers/platform/x86/uniwill/uniwill-acpi.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> index dc99bf8a8568c..e2a6a704e942e 100644
>> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
>> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
>> @@ -3629,6 +3629,22 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
>>   		},
>>   		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>>   	},
>> +	{
>> +		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx"),
>> +		},
>> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>> +	},
>> +	{
>> +		.ident = "TUXEDO Stellaris 16 - Gen8 - Intel",
>> +		.matches = {
>> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAF5xxx_mLED"),
>> +		},
>> +		.driver_data = &gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descriptor,
>> +	},
>>   	{
>>   		.ident = "TUXEDO Book BA15 Gen10 AMD",
>>   		.matches = {
>>
