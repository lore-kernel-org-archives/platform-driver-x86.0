Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DBB38D007
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 21:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781557463; cv=none; b=t8ONIMuEyEbJUGGULw1BI1gUsZUF27pKnf8x6t2k7wkl5d69HqFBXZqvnqRar9DLb9+nt1unPVTR62eHhNupu57lt+/A6S1B+H7/KitohL1JQEG+6tNy2oEHS9ZM8yUz4rqDnu7hJFNMjVLt5lIpHSdMEwfE8x6dvUlKQ/aDez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781557463; c=relaxed/simple;
	bh=+UXzQdgtYpYv5CkfOnGZqdhOnLV0JWjb3EgyTAfOW/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KbeGwMPEBhKmEohMK2wH2cWa0pWHyinBPF/AvtfQ9o+XThT6CywHBZAFB1AlSZxcY6ClTJ/X4yDzk6TMf+J50umrCRSI4yVGc4Qzwo9RM8C0ECrqsjvLrwQnmX3fvhZNHQsVSnmSHaEwwGILxeCqgOR84uwxBDpmSZVn7VkCepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nqma8A5O; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nqma8A5O"
Message-ID: <2e18aa9f-baeb-4bab-b53b-18cf5e63536e@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781557460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+49Y4V2x3+3ye4TdQ0IoIJ8q/LYpXXSFU7fBfO/bWM=;
	b=nqma8A5OxkxAAB23vAkmeg+AF01RTNRv8+iKRe1JW7xYGATe2ftqtFX6p34UyzdWBuZBvY
	uG3YHf2lnY+fdHXmy7QhTThVQQPAvx6EiIYyc32rnK7gfyDvyHIhr5qHTUG12jQ+ADzPDw
	6Sq0hcMiuRBU3B8ZlOq3tOnUQHB3wys=
Date: Mon, 15 Jun 2026 23:04:14 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [Bug 221437] New: asus-wmi: gpu_fan RPM reads 0 on M6500XV when
 dGPU has no driver (fan physically spinning)
To: Borislav Petkov <bp@alien8.de>, bugzilla-daemon@kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <bug-221437-6385@https.bugzilla.kernel.org/>
 <20260612033739.GFait_A1Re69ddPzzJ@fat_crate.local>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260612033739.GFait_A1Re69ddPzzJ@fat_crate.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/12/26 05:37, Borislav Petkov wrote:
> Forwarding to mail...
>
> On Thu, Apr 30, 2026 at 01:39:35AM +0000, bugzilla-daemon@kernel.org wrote:
>> https://bugzilla.kernel.org/show_bug.cgi?id=221437
>>
>>             Bug ID: 221437
>>            Summary: asus-wmi: gpu_fan RPM reads 0 on M6500XV when dGPU has
>>                     no driver (fan physically spinning)
>>            Product: Platform Specific/Hardware
>>            Version: 2.5
>>           Hardware: All
>>                 OS: Linux
>>             Status: NEW
>>           Severity: normal
>>           Priority: P3
>>          Component: x86-64
>>           Assignee: platform_x86_64@kernel-bugs.osdl.org
>>           Reporter: nix.sasl@gmail.com
>>         Regression: No
>>
>> Summary of the issue:
>> On ASUS Vivobook M6500XV with dGPU (RTX 4060) running without a driver
>> (D3cold), the GPU fan physically spins under load but fan2_input always reads 0
>> RPM. Writing to pwm2_enable fails with EIO.
>>
>> Hardware:
>> Product: Vivobook_ASUSLaptop M6500XV_M6500XV
>> Board:   M6500XV
>> BIOS:    M6500XV.309
>> Kernel:  7.0.2-arch1-1
>> linux-firmware-git: 20260429.56a13f98-1
>> Relevant dmesg:
>> asus_wmi: BIOS WMI version: 9.4
>> asus_wmi: SFUN value: 0x21
>> asus_wmi: fan_curve_get_factory_default (0x00110024) failed: -19
>> asus_wmi: fan_curve_get_factory_default (0x00110025) failed: -19
>> asus_wmi: fan_curve_get_factory_default (0x00110032) failed: -19
>>
>> Findings:
>>
>> fan2_input always 0 even when fan is physically spinning
>> pwm2_enable node exists in sysfs but writes fail with EIO
>> asus-ec-sensors rejects hardware with ENODEV
>> ec_sys accessible but dump returns all zeros (interrupt-driven EC mode)
>> dev_id reads 0x00000000
>>
>> Expected behavior: fan2_input should report actual GPU fan RPM.
>>
>> -- 
>> You may reply to this email to add a comment.
>>
>> You are receiving this mail because:
>> You are watching the assignee of the bug.
Hi!

This is because new models use EC shared memory and this driver cannot
handle those models at all.

In the asus-linux Discord (now ogc) you will find someone writing a driver
for these devices in case you want to help, otherwise your best bet is to wait
for the new driver or try to decompile the official windows application
and get the correct EC memory offsets.

Best regards,
Denis
