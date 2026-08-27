Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F83F107D
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2026 21:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787867612; cv=none; b=QScwKStMjR6giFGecymMHtrbTOJyD6JI1BJrXbdqToFz8FuJdoB9OOU3L1d6ID/1PepyMXMTz1Jg9H/pIGHlt3RC0tesRlQ54hPMYVINmPwcz8ft5JayO/Ml6VPFcKw4dIwPaCO8w6VinmQGm/VBSolb1ZiZhOZN0lMIrOHduco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787867612; c=relaxed/simple;
	bh=nFsKv7iQXGxHPrE0hYUgTnvFL7l9p4D/0cvsOrs5a7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPT3svlYPSuIFLS2tIMN3IHGETWQRyr+qQwbkDiJcHn8LfawLYhOdOZlhAZ3CXevmlDspRCIoB9B5Xa2J8s10ZzqONPbyKHi+B6rCqCeGxZYYzTN76aGyoxfpEK+JsZe7Mj6JlXH7DeWLxbqOhHLw9OfGWVgJ+Bo+vNWiPrAx0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Hm3Z4/Fr; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Hm3Z4/Fr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1787867608; x=1788472408; i=w_armin@gmx.de;
	bh=nFsKv7iQXGxHPrE0hYUgTnvFL7l9p4D/0cvsOrs5a7U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Hm3Z4/Fry1oNH8+Sr6uJcjwKRXoL6rR+rGFpLhM2Y39xsGllwqfl1c3Rilp+IEfD
	 bN2OTmOsP64TZcMqa/lnKWAURoGOljXXJs/dhVHrUB2wKbmItaMpcNbDv8O6nRX0F
	 NTYWvFR/aABKYdzhtRUyisxEP1yVWv37QBS8Dhlp9CiMj7KURdcLLx6gp+qC/1miI
	 9r4snpZTg6ZbrAeEOllF5w37/3pE8nbm4B8idZy9LN56tOskxFPWkUyxaXmxUlJE5
	 ISfvOiFz4b9nR0XpjkNF4cimr8E6TyH1Nvaz9cTJVTqlzJoas5CGnjmAOTxv5YgSL
	 xQsEWU9ELFW6hBePow==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2E1G-1wufeY1c5e-00vJyR; Thu, 27
 Aug 2026 23:53:28 +0200
Message-ID: <3482cde4-97cb-44ca-8cfa-efaf07a4f743@gmx.de>
Date: Thu, 27 Aug 2026 23:53:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bitland-mifs-wmi: platform_profile write fails with "Operation
 not supported" on RedmiBook 15 Pro (i5-11300H)
To: Arjun Mandal <mm3885525@gmail.com>
Cc: "qby140326@gmail.com" <qby140326@gmail.com>,
 platform-driver-x86@vger.kernel.org
References: <CAD12wXtgzoEs81ROqzZ0krJKBg=f84_Eq89sKCp8w380zahzjg@mail.gmail.com>
 <f4ee6e17-6655-4683-8dc1-7af324053288@gmx.de>
 <CAD12wXvvzYwSrp-XU52_1Lqhp7+TU7GPRLNmAOMPhdQGZCipBw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAD12wXvvzYwSrp-XU52_1Lqhp7+TU7GPRLNmAOMPhdQGZCipBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:XTs8qA6ZCeQRm82J6vJ3sV1Y3YDmgeB0fgwwcThacJ8BAv5fV7F
 /qnTjCN8jdJ1JvsEhi+M+MLUU6iJACg2qgd6zAILWfdyziwqrfA74Hd2gBgZuDbWggTL1SD
 7LYmaUrNcjVR7n4zpBz2mBAbUSfR+iVD0cGp+3pSJIS7u5oq3pudhPpG5Mxhw9qIygwLCfW
 VIQSSR0tAl8C3FeyIJujw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GTQXz6rpTEw=;LLNvaDbeYqV/NyV5i3YTHHBPmj6
 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
 Xg=

Am 27.08.26 um 07:12 schrieb Arjun Mandal:

> Hi Armin,
> The acpidump is attached below.

Thank you.

It seems that the driver always tries to read the DC jack type, even when
this WMI operation is not supported on your device.

There are already other users having the exact same problem, i will notify you
when suitable patches become available.

Thanks,
Armin Wolf

> Regards,
> Arjun Mandal
>
> On Thu, 27 Aug 2026 at 03:10, Armin Wolf <W_Armin@gmx.de> wrote:
>> Am 26.08.26 um 13:45 schrieb Arjun Mandal:
>>
>>> Hi Mingyou, Armin,
>>>
>>> I'm using the bitland-mifs-wmi driver on a Xiaomi RedmiBook 15 Pro
>>> (India Market, 2021 model, Intel Core i5-11300H, Iris Xe, 8GB RAM),
>>> running CachyOS with kernel 7.1.8-1-cachyos.
>>>
>>> Reading platform profiles works fine, but writing any value fails with
>>> "Operation not supported":
>>>
>>> $ cat /sys/firmware/acpi/platform_profile_choices
>>> low-power balanced balanced-performance performance
>>>
>>> $ echo performance | sudo tee /sys/firmware/acpi/platform_profile
>>> tee: /sys/firmware/acpi/platform_profile: Operation not supported
>>>
>>> This happens for every profile value I've tried (performance,
>>> balanced-performance), even on barrel DC charger, so it doesn't appear
>>> to be the AC-type restriction mentioned for "Full Speed" mode. dmesg
>>> produces no output at all when the write fails - I ran `dmesg -C`
>>> immediately beforehand to confirm nothing was logged.
>>>
>>> As a result, power-profiles-daemon fails to switch profiles entirely:
>>>
>>> Failed to communicate with power-profiles-daemon: g-io-error-quark:
>>> GDBus.Error:org.gtk.GDBus.UnmappedGError.Quark._g_2dio_2derror_2dquark.Code15:
>>> Failed to activate platform driver 'platform_profile': Failed to write
>>> to acpi_platform_profile: Error writing
>>> '/sys/firmware/acpi/platform_profile': Operation not supported (15)
>>>
>>> For comparison: on the same hardware running kernel
>>> 6.18.42-1-cachyos-lts (which predates this driver),
>>> power-profiles-daemon works correctly, using only the intel_pstate CPU
>>> driver, since /sys/firmware/acpi/platform_profile doesn't exist on
>>> that kernel at all.
>>>
>>> System details:
>>> - uname -r: 7.1.8-1-cachyos
>>> - Model: Xiaomi RedmiBook 15 Pro (base 2021 model - not the later
>>> "RedmiBook Pro" 14/15/16 line)
>>> - WMI device path:
>>> /sys/devices/pci0000:00/PNP0C14:00/wmi_bus/wmi_bus-PNP0C14:00/B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B-4/
>>> - Distro: CachyOS
>>> - System product name: RedmiBook 15 Pro
>>> - Baseboard manufacturer: TIMI
>>> - Baseboard product name: TM2039
>>>
>>> I suspect this may be because my model predates the newer RedmiBook
>>> Pro hardware the driver seems to target, and may use a slightly
>>> different WMI method layout - but I don't know enough about the WMI
>>> internals to confirm that myself.
>>>
>>> Happy to provide anything else that would help - dynamic debug output,
>>> ACPI/WMI table dumps, dmidecode, etc. Just let me know what's useful.
>>>
>>> Thanks for the work on this driver.
>>>
>>> Best,
>>> Arjun Mandal
>> Sorry for the late reply. Can you share the output of "acpidump"?
>>
>> Thanks,
>> Armin Wolf
>>
