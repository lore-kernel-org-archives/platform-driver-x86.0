Received: from mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513D63CC7FF
	for <platform-driver-x86@vger.kernel.org>; Tue, 15 Sep 2026 17:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492587; cv=none; b=TUSYXKHIlKjq8HWmP1oZrPe3/nlVWUBGMjHlVRUCLj3DLjShNDfohlb8M1FwXbJdre7X+jiBxUmKuPEjA9ivAwTWdT0O2XxTNVwEP+9LVr3zewdPtEihLgFeX5uCuZ5DSZDzlXrkXtIcqiTqm0AfFvAGGsN+BwCIAs4VOFUdLf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492587; c=relaxed/simple;
	bh=6Pm9jdGnYUGyowSehXt+6SI1qvhAwyeIm8A5zcFUH8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MofAwEl1SJjTC11AkHjSvIyIPn5BSqxriWs5aMVpPQ91kxx16SCQtlFV0/QUxJZEeOY93fwB902nYjKyShahHgjSrAFlV1KfLeU838+jtYSju8z4STovpZhXy0hRgQNFuEaKnB3KU2nzo+AQsunl95zcptgzztfxDXCk3USKV8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TFGXeBga; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TFGXeBga"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=6Pm9jdGnYUGyowSehXt+6SI1qvhAwyeIm8A5zcFUH8c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789492583; v=1; x=1790097383;
 b=TFGXeBga9H6w7vGz44XplJlZYsnKaiTSZQcoZm+HAAwm+0delUaLd4gOoQ3Sf5k42cy36ZfB
 kSVQu62VvavMzsPUjYUeyLHJhFDF4Edz5N6tqYdvD75yIXY0IBEZj8JRD2+I7PuIZIRLtugRBzN
 cO003TXOF21LqG4DpZ+J+xoY=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 50f40237a627b6b6;
	Tue, 15 Sep 2026 17:16:13 +0000
X-Mizu-Trace-ID: 50f40237a627b6b6
X-Migadu-Flow: FLOW_OUT
Message-ID: <92b1c03a-1693-4160-a8fc-ba725da68fd5@linux.dev>
Date: Tue, 15 Sep 2026 19:16:12 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
To: Mario Limonciello <superm1@kernel.org>, Asai Neko <sugar@sne.moe>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
 <75ddef3a-c32d-473b-bebc-1bc6b41a0862@kernel.org>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <75ddef3a-c32d-473b-bebc-1bc6b41a0862@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/15/26 19:15, Mario Limonciello wrote:
>
>
> On 9/15/26 11:32, Asai Neko wrote:
>> asus-wmi attempts to register its LPS0 suspend-to-idle callback during
>> probe. acpi_register_lps0_dev() returns -ENODEV when the LPS0 interface
>> is unavailable or explicitly disabled, but the driver treats this
>> expected condition as a registration failure and prints:
>>
>>    failed to register LPS0 sleep handler in asus-wmi
>>
>> This occurs on the ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
>> The system exposes no PNP0D80 ACPI device and uses deep suspend. The
>> warning therefore misleadingly suggests a sleep-related malfunction
>> on a platform where the LPS0 callback is not applicable.
>>
>> Suppress the warning for -ENODEV while retaining it for other errors.
>> Leave callback registration and suspend/resume behavior unchanged.
>>
>> Signed-off-by: Asai Neko <sugar@sne.moe>
>> ---
>> Avoid the misleading ASUS WMI warning when LPS0 is unavailable.
>> The diagnosis and rationale are included in the patch commit
>> message.
>> ---
>>   drivers/platform/x86/asus-wmi.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index a65090429ca7..f7d009b742b3 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -5421,8 +5421,11 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle_dev_ops = {
>>     static void asus_s2idle_check_register(void)
>>   {
>> -    if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
>> -        pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
>> +    int ret;
>> +
>> +    ret = acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
>> +    if (ret && ret != -ENODEV)
>> +        pr_warn("failed to register LPS0 sleep handler in asus-wmi\n", ret);
>>   }
>>     static void asus_s2idle_check_unregister(void)
>>
>> ---
>> base-commit: 587858367581b9c55c3690f4e63382ad622719d4
>> change-id: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed
>>
>> Best regards,
>> -- 
>> Asai Neko <sugar@sne.moe>
>>
>>
> Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org> 
Reviewed-by: Denis Benato <denis.benato@linux.dev>
