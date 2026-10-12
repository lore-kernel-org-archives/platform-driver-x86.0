Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7883E7BAD
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810156; cv=none; b=ilL3BcF5688iCR8ZslnzJc8u35yxrqr9DhNnCWZTfLXINXQ1HuzGDVGd6frffdBj+G3v4Jq35oCVAahgJ8YxpC4dk6dA8U1I1YeFDBKZZme7jfNi0kP2pJShqSMDSGRGsiZqJHXSSce+lUM7iuUplXh/KJr3IyE1bCUpVtDw6A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810156; c=relaxed/simple;
	bh=uBji+RnrUH+XkvxbwDxPRknf38Wap+u/67leP/iEL5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=djUbS2WhfsbofnW4pU8eDx6PICMMsI6DWdjtq6CBkfw1K1qfOqkbZcam+nNHWDbqZSD9/b1WliynhAfvfC221+TUekWH1qqAPVsQPsap3D+SujcozcrZN2vFM0tFDXuWaN7EfiKKK9P0us6VvmT0q6jX0u7g6dV6gKfRXTfiZVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGS/IuSD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGS/IuSD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso757696a91.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791810152; x=1792414952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=grHk5YVT5OWVqlenu8Z0ByAqSuSoAErWYw3gBTzDaq0=;
        b=MGS/IuSDNKzILetaaZ9PLhqwEUk/DZfrHq9jXMhx54eS5vKxg0l+a89jim/5H8mixd
         NUPXPKK+s5MqX6qozDB/dNXs2aJznIsahj4N1eiY3+3KSMm5HDvASbYog1HZXUmLrg0x
         zREGwK7HFZl/Umur8SMHYuupSGbPPBd+h2gEaq14GAKejfSepmh1fvd000Ok3yCsAcIo
         OHRWKyo4tHv8Cyvi5o8HeLEafAHZInkVtI4o7BUIW6zqbMErrk/M9xbc2Zbc+fnVRsBc
         Arr7fC3XwcSCXiVFoHDGMcdLzfGSXJAO8whD642MPnKqTaGxVHOY3yqSptTPM93VBmuE
         OA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810152; x=1792414952;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grHk5YVT5OWVqlenu8Z0ByAqSuSoAErWYw3gBTzDaq0=;
        b=HWFt/VNhAl6OwaiCp9hyZzFI5xQVMoTuLM4xvoqjd0IAEfmrYaEs6aL5emy/S0YnKs
         3msMkH3l4R6pKZ8w5tYNRTAlVPnUfLbVdv8i3gzhi0ZBvxjeLiGVFDMq/Ja3u9NxX8SQ
         oW5X7yhSAhRbSfdrry8EVChX9V7MxRN7TjRrCwr7BXII5IyEzhZkiQ8nd0+fPKvztLjc
         5uYtUhEO3NZ6iNqbwDOo99ZitEAM2AUvkF9XLuxpap5bcc6rGAYpPk4WSkUeDniBrkGo
         FS8cDqUnmp+0yU1HzWJPHRkqNALpUkJ+qRXV3aWLSNcKO8ZgKyjbOJO5+yqRMHE37Pgv
         rYcw==
X-Forwarded-Encrypted: i=1; AKwUvBymEBNlp8F6H4ReXa+MUtAGGV6Z+Ayrvyh1l6RRuus493+vloODYvAlv+zFOqQhT9OPr1RZMMnCOkw2PZCsWFr8KS49@vger.kernel.org
X-Gm-Message-State: AFq9FYJBgu6T0thDRtsJQRvyErr4q/0dD8XNeS4ybrtv1ZEF9Zrff1f6
	ZN12mMsRwFNJER56IerB5z/4+TV97Puxvi/Knnth6j2vNQc/L2L20gqd
X-Gm-Gg: AYBFou2Qaz0kKDONkX+IP7QDRhMbWDLjR8Pbo6+Z0mkR2HoCavq5NEFKW51vqtrJhV1
	+M/5m5ZYtnUKa1rp42XicbIGenucuYzfAJ3o0xqLUJYwtedFzuf8tnztFQiLgkJ0jhSpY5XRedq
	dM+5IgQK1kknSARWUFe7zBiGLqmBL+7Ygl0K2H05xj+MraNWoe4qjeasWWlYhN+tqE5FQB4F8JM
	Mdls1Viqs9hKro5CQo6Jq1GMurv/inrTG+3njeiF/OrpETqBATUK/PcdHUwg907yarfWyh8z+0B
	xWDYHW8aATz4A/Q1vSSom+snhoVaTzGUqQnF24SrETJ6mZBas/poLn20m6iymhoPhRpbh3fHsVI
	uljyz0gS7NUWyMsdLvZhAZlmr1xHtzVmI91hA8SwVUzGWwg83Ed4xDvxXKqLfy8Zjqzu/RcdbMF
	VCGDrujjf8U8+DnPfVJqMw2LYdU/XRtiNLB/5Q/xQ0c53DaU4OzlsONuGm7UlL4dZK6H1Rx3GGi
	4dRsMwO1f9zZvCn+Z+vmyP9OUASSpq7zpp8WnBlqFJnEA2Y
X-Received: by 2002:a17:90b:58ec:b0:3ac:17c:6e85 with SMTP id 98e67ed59e1d1-3ac017c7034mr1773017a91.47.1791810152014;
        Mon, 12 Oct 2026 06:02:32 -0700 (PDT)
Received: from ?IPV6:2408:8210:2436:950:9cd6:11aa:387c:a1aa? ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ca0033sm16302097a91.2.2026.10.12.06.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:02:30 -0700 (PDT)
Message-ID: <0a4cd921-d233-4e5e-b98a-7130690c37f3@gmail.com>
Date: Mon, 12 Oct 2026 21:02:22 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] platform/x86: bitland-mifs-wmi: Add quirks table
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
 Ilya Gladyshev <ilya.gladyshev@linux.dev>, KentoNion <kento@kekto.ru>,
 platform-driver-x86@vger.kernel.org, ted eric <ericted8810@gmail.com>,
 Armin Wolf <W_Armin@gmx.de>, LKML <linux-kernel@vger.kernel.org>,
 Chris Taraszka <chris@miget.com>,
 Matias Civadda <matias.civadda2342001@gmail.com>, =?UTF-8?B?6auYIOS/ig==?=
 =?UTF-8?B?5paH?= <btx342@gmail.com>, powerfullz <wleizc7319@gmail.com>,
 =?UTF-8?B?5a2ZIOiqiemTrQ==?= <wolf109909@outlook.com>,
 =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>, Rsplwe
 <i@rsplwe.com>, Bozhen Peng <bozhenpeng93@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>, Jame Jao <jaojame6@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
 <20261012100532.19612-6-qby140326@gmail.com>
 <686c6dc8-965b-331f-a3de-6452ee5e2a53@linux.intel.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <686c6dc8-965b-331f-a3de-6452ee5e2a53@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/26 20:31, Ilpo Järvinen wrote:
> On Mon, 12 Oct 2026, Mingyou Chen wrote:
>
>> The MIFS WMI interface is shared by several Bitland ODM laptops which
>> differ in the layout of the performance mode values of
>> WMI_FN_SYSTEM_PER_MODE and in the capability checks.
>>
>> Introduce a quirks table to support multiple machine families without
>> sprinkling model checks over the driver.
>>
>> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
>> ---
>>   drivers/platform/x86/bitland-mifs-wmi.c | 178 ++++++++++++++++--------
>>   1 file changed, 121 insertions(+), 57 deletions(-)
>>
>> diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
>> index 93a519b96189..d61382ad4a0b 100644
>> --- a/drivers/platform/x86/bitland-mifs-wmi.c
>> +++ b/drivers/platform/x86/bitland-mifs-wmi.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/bits.h>
>>   #include <linux/container_of.h>
>>   #include <linux/dev_printk.h>
>> +#include <linux/dmi.h>
>>   #include <linux/device.h>
>>   #include <linux/device/devres.h>
>>   #include <linux/err.h>
>> @@ -84,6 +85,41 @@ enum bitland_mifs_power_profile {
>>   	WMI_PP_FULL_SPEED	= 3,
>>   };
>>   
>> +struct bitland_mifs_wmi_data;
>> +
>> +struct bitland_profile_entry {
>> +	enum platform_profile_option profile;
>> +	u8 wmi_val;
>> +	bool no_set;
> What is this for? I don't see you using it.
>
> If it's to disable a mode, I don't like the approach.
>
> --
>   i.

It's intent to mark a mode is only available for GET (no SET methods 
allowed).

Like the WMI_PP_XIAOMI_QUIET_ALT mentioned in Chris' patch. The profile 
is only available for read.

enum bitland_mifs_xiaomi_power_profile {
	WMI_PP_XIAOMI_QUIET		= 0x02,	/* 18 W */
	WMI_PP_XIAOMI_BALANCED		= 0x03,	/* 37 W */
	WMI_PP_XIAOMI_PERFORMANCE	= 0x04,	/* 58 W */
	WMI_PP_XIAOMI_SMART		= 0x09,	/* 45 W */
	WMI_PP_XIAOMI_QUIET_ALT		= 0x0a,	/* 18 W */
};

https://lore.kernel.org/platform-driver-x86/20260928153902.139956-1-chris@miget.com/

