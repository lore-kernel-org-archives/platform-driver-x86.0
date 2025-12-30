Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C032221F26
	for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 13:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767102811; cv=none; b=XEb9rcLQr3bQ0rlIKn0RparJRJ3l/9pzlQHKNn5o0G5ObZG4mYYLcF5dGOkgSnElvK+pJarjHil0bJibbqsScQ34FmkS7vhOatyw1FP7l8Z7B+51xkdUVdWZpeafrCGXCPtZyVTxtGx5PtmVEuUMI/Phi41rjR3whRtMH+cUnVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767102811; c=relaxed/simple;
	bh=xPfS9uEzLSD/mtv5oATPYDlSphRp/Rq9VCGtX5HIytA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O4GiIivPEwxS4/3ibpW1cOVvVn++a61M5Yr/T3WVw3dVVmhkji1oZAC9GvczehEMWaLNl39PVPoWhpcBLk253RyVj6cCtZuH5JOjjn9ORJmsB2r04A1jCc/u4LhH6r3zsx+JK1WxMvRRlwWIeCJqfyiu/gNzUTQid4qhY6etzTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eh05CogE; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eh05CogE"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42fbc3056afso5387972f8f.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 30 Dec 2025 05:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767102809; x=1767707609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fo8YsSR2acA7AZXD620JQ39rcIw2BpkEhIXbexp4DAo=;
        b=Eh05CogEa0qByXsI5/AeNIUzBk0WGkd0UYQj0teI30lDkEDo+JI4ZJ7vjehgF+1Jcr
         N983usxicppPH6fC0QZ2tM3ilLqsh+WF3LoZHtPyMn8T5roQqSjkf00LAq222Ga4iunE
         1umSFE1nocs7wLQVv3TMFh4Iyn7rdPFtgkCNrDBzHu1JBtRQ7XNR0DFA70wzBtpo6aHi
         pMY6T3AoWTvH18GIOskL4M9lv8Xu7yT/IjyO6+N/ZPAxjvtf2MEGo+7rpAEBxw/+x5Rz
         uimstFrZzWKK1AjhHoqr+ag+A+mqS6JaVMIYheX4CwDJw9IxBbxGIdI0gD4k6mRQjyhF
         xiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102809; x=1767707609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fo8YsSR2acA7AZXD620JQ39rcIw2BpkEhIXbexp4DAo=;
        b=WoIAxeI/31hSAoCmYCiM699Ri2pByqFxHaARrHxZVaknZ1h40QGVPye5WgOjt4yhW+
         dM5odEnKC7zfeTNzpFVZpSvdq5MN6FddJGnKGYB3Hv8W+GdEuxxx6UYyoRfrSoO9wGTX
         htWzY7b0Pmqkcxblw9fflbLu57tAKxtY/PYKbgJtNAN8ZaoWEZiTNE6/ix+3zJ5QwX8o
         3mUaRbQTK6cSLibDEJG65YtbEVYzObomQ2a5VHUhAq3ZPX2FptnaOeyYRVUy2HogvmgD
         1uzGVQPqTVVb34+grraQEcWGfVyw1OSCrKHfH68WStMKAc7ptnZaduzkpaz09AIgd7G/
         mqIA==
X-Forwarded-Encrypted: i=1; AJvYcCWtYF2c2gHxoU/uin3gdqbLN39nTc6teAjT59VTGwBBn3o3pYGAfILKOrMWQA3Ue6a1ShKTpKJ18VVa3cOP2/rW8BEW@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc+phQJYgBMJJlCmW7UPq6K6f72gN8omKFG9txHBDlJjV2cqFr
	isd2pGsxH/NYq1B7U0IgNxaYEozsys7J1UbY0Q6+4RbBsYqJFTuu8hT3
X-Gm-Gg: AY/fxX544cOweBVFUiqrRDAytwj0GAxRgwGGXz12sIYwcuFZrqCI9XPrH1nIUYfLOEO
	YNe66awyM2BtKBMseFo8cemRne7qIsxwGgABVKFhqphRoaoTzrEIbpbgu/Zr9t3Q0LVB+jLjcbC
	M4DiLlERqgt2UAmHtpgknEsFtpJpG0F54CV7vQYLBn4iVrlSEzxcWuPOw0a3R7BK040YExGb6ow
	FoUlHcsZM7F+SZknT1XCkuaSYcv7fd1Fukq2WrIwpY6q9DYCMmPzqloOIfiCyq33D8Gr7uVqyfo
	lQwPMBsmvVWYtD23tcSEV1xEZ0u4E/JYb6v5SKfObMj3xl8YwRX1MT45dg40WfGZsoxJ1Us3mpb
	X05pOCmsB5yGZ606JfFtUHR+x72yllW6GudPsJFMWmt1vd+rpjP0BnAp5zfdBoqIlQ0hjqMeqap
	AkK5VKUx5oFhqc4W+4W4SOlm4n8gW9N1XYkQ==
X-Google-Smtp-Source: AGHT+IGYnNj/cKfvnasLAKMOMw+DEPW5XlDq88uCuUDLyNooiQAmHbfudOuBJIYoJ2ohxqq8V3LcAw==
X-Received: by 2002:a5d:4705:0:b0:432:5c34:fb32 with SMTP id ffacd0b85a97d-4325c34ff28mr32698515f8f.23.1767102808510;
        Tue, 30 Dec 2025 05:53:28 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eaa4749sm69344229f8f.37.2025.12.30.05.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 05:53:28 -0800 (PST)
Message-ID: <eb0f4db5-a169-4e28-882b-346e595c81b5@gmail.com>
Date: Tue, 30 Dec 2025 14:53:26 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86: asus-wmi: explicitly mark more code
 with CONFIG_ASUS_WMI_DEPRECATED_ATTRS
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Denis Benato <denis.benato@linux.dev>, LKML
 <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>
References: <20251225143007.2684239-1-denis.benato@linux.dev>
 <20251225143007.2684239-2-denis.benato@linux.dev>
 <54cc6828-9191-403c-18d5-76f768d70381@linux.intel.com>
 <1579d5ed-8233-44a5-8e0d-5462fd8b41d4@gmail.com>
 <9f5085e9-454f-f003-27cd-0eb86dfd9e11@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <9f5085e9-454f-f003-27cd-0eb86dfd9e11@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 12/30/25 14:41, Ilpo Järvinen wrote:
> On Tue, 30 Dec 2025, Denis Benato wrote:
>> On 12/29/25 11:06, Ilpo Järvinen wrote:
>>> On Thu, 25 Dec 2025, Denis Benato wrote:
>>>
>>>> Be more explicit in code that will be excluded when compiling
>>>> with CONFIG_ASUS_WMI_DEPRECATED_ATTRS disabled.
>>> Does this result in build fails or warnings? If that's the case, it should 
>>> be mentioned in the changelog + Fixes tag added.
>> Hi,
>>
>> Sadly no, despite a property in a struct instantiated only once
>> being forcefully set to false no warning is emitted by neither
>> clang nor gcc :(
> Ah, I was mainly expecting unused function warning but apparently since it 
> was still being "used" it obviously won't trigger that warning.
>
Plus if gcc/clang could have catched it build bots would have done so
when posting the asus-armoury series as they catched other things.
