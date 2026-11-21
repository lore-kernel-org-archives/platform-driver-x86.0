Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795225026;
	b=oBprZTRkPNSVAKnF+O9//ukeHPfqT9PmhiDzp6jWr50QFxSMooB2i/UyY9Ka3ZU19+bf
	 ubFnGclQ3DnT4vsYu6MpntycvIC5VhMZQ+JSBgVJ2jy0Uc3b00R0xNLYR+UnEkOBuTl2C
	 t4umTaHnqjYv2aB2N9LnLPSziG901X2W8mn4Z4lhjaVrMSGwv9YQFm7vIMrLB3wJSqVe6
	 OPlxeCd5pE6asIFv++1RZl4PkxuSB99pK8MDpk1xYezknvI55LmiwcCpnUsgeEjOUK4BC
	 +lySAq2ZwOIzJdgUOEoN57JGcZdMcxVBxXcKsDheEfS6CDt9sDHNnnynCuSrMlFnJ9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795225026;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=R/EzP5K1sHGT/sJuMb4uv8R5egqLXwjDytqeMi8zbto=;
	b=5BxYhYZuju0jiOq6dkNKMd6Gn5VW0S75TssuN3cWggMfUt2TSgIe6m4I33cJSSryFS29
	 mW7uYZGIsm6grM29MeYv6DT3YtPIScQk6gY8eaS3K8X1U+QjzumlFvMqjE8VgRscwo0rw
	 1rY4AVgOZ3RzOD7I4DGgDy0xU2F9firBsrF+qXwPBcV4zMC3nlREtdB8PnbFG0ZJOMzAo
	 Lj3ilX60k9/DzRuDXNe8MTTfHhdZbrU0pLNpw7DmlzjInheMUOa1ODlkt3/jpsb6ThD0e
	 0AFgEen5IQg41/KXq43OwizVLzrSDJXKou8XHAYIASRl0N6lf67nX3Ki1IpyQhxdaVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wend1VLh;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921AC606A692;
	Sat, 21 Nov 2026 01:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 921AC606A692
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wend1VLh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=R/EzP5K1sHGT/sJuMb4uv8R5egqLXwjDytqeMi8zbto=; b=wend1VLhtdS9UirJ54ULXV4Elh
	eFrYdLfeYjPXIa4MuS4VrDbLzCdHIDe4kRXy8KYnJk5X0Xty38KW+GntNFbbwJq+HBsUuvTuWi9Dp
	3pjVLko86tdtM1xJRkBJP1TgHI60ac0ZqTPCN7rNvrrrzOFVbE6x3mio6rlwv2x8jyhD3apjWt9uu
	Y/sEhhoDAT4cnkn2fyzlaXwlpI/SXZShJESIys+zXlqGjJfvy0dLjUYFb9NqWuj11aGF/1MZuEWji
	JLOsCyZnMLQAvrFvNSatr+W9p2itui4zBb07Ux/GuSXKUQVbYCSs9kR7SkhfLMYGxeF5tCZMsGMZI
	iT8l5pqQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUa28-0000000GeQI-42Z1;
	Sat, 21 Nov 2026 01:36:53 +0000
Message-ID: <4614442f-85fe-4d90-a8c2-3f7affdbd4d9@infradead.org>
Date: Fri, 20 Nov 2026 17:36:52 -0800
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
Subject: Re: [PATCH 1/8] platform/x86: dell: Make uart-backlight x86 only
From: Randy Dunlap <rdunlap@infradead.org>
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>,
 Armin Wolf <W_Armin@gmx.de>, Prasanth Ksr <prasanth.ksr@dell.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-2-bmak@nvidia.com>
 <740cd96a-0815-48d1-9442-9816944ad078@infradead.org>
Content-Language: en-US
In-Reply-To: <740cd96a-0815-48d1-9442-9816944ad078@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/20/26 5:36 PM, Randy Dunlap wrote:
> 
> 
> On 11/20/26 4:05 PM, Brian Mak wrote:
>> Make dell-uart-backlight x86 only, as it uses some x86 helpers.
>>
>> Signed-off-by: Brian Mak <bmak@nvidia.com>
>> ---
>>  drivers/platform/x86/dell/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
>> index 9f0016056d7e..4c28d4c008fc 100644
>> --- a/drivers/platform/x86/dell/Kconfig
>> +++ b/drivers/platform/x86/dell/Kconfig
>> @@ -188,6 +188,7 @@ config DELL_UART_BACKLIGHT
>>  	depends on ACPI_VIDEO
>>  	depends on BACKLIGHT_CLASS_DEVICE
>>  	depends on SERIAL_DEV_BUS
>> +	depends on X86
> 
> DELL_UART_BACKLIGHT already depends on
> X86_PLATFORM_DEVICES && X86_PLATFORM_DRIVERS_DELL, and
> X86_PLATFORM_DEVICES depends on X86, so this should not
> be needed.
> Have you found a problem that you are trying to solve
> with this?

Aha, see patch 2!

> 
>>  	help
>>  	  Say Y here if you want to support Dell AIO UART backlight interface.
>>  	  The Dell AIO machines released after 2017 come with a UART interface
> 

-- 
~Randy

