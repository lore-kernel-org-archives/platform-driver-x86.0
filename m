Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4684C379998
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768587033; cv=none; b=fhzBLiR3ZXeqPvepadFFnETwKLmpLdehHCv00DQAe+7Mv+zK/8MfTepAp7wGIuyC8RI0VcNXsprY1Vzr6TR6dCTVDjI4KButxDiLu4tfXgM973TmycnSVfoCu0Z4L+SYMvJDiw1SkDEaviuXrBzH+LVp0p7GZtbveH6eTYur7IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768587033; c=relaxed/simple;
	bh=6hskCYlFubyn15wgG2emHMYCY5r7YeiupgPne045cUk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5AqISzjDyGGLnW9oIMM+o+mxnMUz4dJ5fRe1NXJuuu8K9ttfiJl6Uz7wd0NtgpbDkC54FXtQDiezNrbR88OkW5jeDttV/4LY7L2FEF5ZyH+NE7UowRXvwVcp0Jh5I0u+1QfhucMWQn+8qEYkwvrbZFeAgwm5JiOq4OlHMGJXm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISg8OEnu; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISg8OEnu"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fbc305914so1846929f8f.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 16 Jan 2026 10:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768587023; x=1769191823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5RD9n0+7pfnaaKlaAgMUnASY55x/U5KRexVVkClUMI=;
        b=ISg8OEnuJn9jWKznPXVFGmI3+qm/A2RjEpxvzBn4soCXUhxJFXpcB6rO2TUzpOQSB0
         qINZ8VIOAnJuqX/KIsYslEnaxqru6B4dEUALpLmVP2FZYebxa4bYtp8skQCwpUvR3mh0
         av+MmLF3+OdmILtHPtdQ1AScB9HM3NFAg6SIOzEg+HTU5a5rKqDrfqgXBwJSX8MOvwVM
         NKfFrtRopenqiG11PmiqViWIvnxWaF4uNS0Wk1fIV7SObv3v56v+MKcwrySVGoRFiv+s
         YnJmgixeTmBs3o6FZBrXo9SsK8Uic0Qyl6mw2U4r2rGHloieD24WyPnf1hHYS0ZzNqgO
         GriA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768587023; x=1769191823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5RD9n0+7pfnaaKlaAgMUnASY55x/U5KRexVVkClUMI=;
        b=JPJ+qI1fpNqu4684/ZgG4YSiPQkHx/JUOrInQz/U17zZrQKS8Y8VQQl8qZKuycfqCm
         xYZXQAHYgMIQUCBh6vvufafYqVqXWWUe1Xv0En3RqXHsGj/t/iHW8Cg+QJYx1cIFno49
         JCwvVZPeE30oE/t6jj4YZyKZSV89iTV1DTt/NL/IgdhmmueumjrJCzySv+PEdtB3NyQ4
         zC3mMNS4ZsM76xOi19+6wUV4SimOJ/aji+sSlCryOh/HeWyccd+t0XinCQtlSo2CWmbP
         T6AnAW61/BXuHKuhg+zLcq2Sd91rJ1EwmzKqpsgYN3vxc2mvafYZFeJLszvH8RP74x8R
         8rFw==
X-Forwarded-Encrypted: i=1; AJvYcCXFjxQJih80g3FvwZTOue71mhg4MdJR9T8vgXfjVpFAAvW7xselgm2DKbC5eil31ybsZW0pixVuh4/4y28s7Xz64oWu@vger.kernel.org
X-Gm-Message-State: AOJu0YyIbG7vR8MrzoZiklDdx6MSEl+BF0DMlaxsih6zUC/7VNnfDUZ8
	5dCshT9Y4uYbV6MfdpcbP238ho1fsxErOGAGHRg4/lMDaJvezgCauh5C
X-Gm-Gg: AY/fxX6gW2wPorNtpg646zuj0ES8+ufvgeDQJLK0DPEfN8tl3cUJAFvqgQ3s7J9r9Et
	GgVQRrbWU5MSDtWUlL6RFpUjCn54j3/rDC+g4VtqaACfpDNkNY5Xp4XrGIO2e2ErPlIaOOcQHoS
	jlULxDTjXDat28h/Xhv4tOwbsRnXJh8xxYKeSCOXa5sgRqHfliBJWVd36KA6RUSAvafClFoPHBI
	Qp2dqUi613nxyy3fucDqPfRSnjFhSk2krHpCVFKaGdPYl08lySAcYs9G2MXabUbG7GPLX73hssc
	sTeav/OWJzEAAvP28gUxHV/OS2n0mFtSOQmMx5WqSaKEnshGQbg0Ul6rLU05//IGgHtRDniqaP9
	nU+0NnrAlgk0gl3B/GTAEGkqaPUHY2bSc0n8pGoQ/vjOi+P7JRcYhMb0yECL7KOHcVzLsBw+LEk
	dUoG/aNTrIOdDXrdLY7xE/oQ==
X-Received: by 2002:a05:6000:1843:b0:431:864:d492 with SMTP id ffacd0b85a97d-43569bbaf7dmr4756064f8f.36.1768587022464;
        Fri, 16 Jan 2026 10:10:22 -0800 (PST)
Received: from [192.168.1.121] ([151.61.25.138])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435699271dfsm6434012f8f.15.2026.01.16.10.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 10:10:22 -0800 (PST)
Message-ID: <e62a1ce6-a74b-4619-b57c-c05c5da8c332@gmail.com>
Date: Fri, 16 Jan 2026 19:10:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] platform/x86: asus-wmi: move keyboard control
 firmware attributes
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Denis Benato <denis.benato@linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hansg@kernel.org>, "Luke D . Jones" <luke@ljones.dev>,
 Mateusz Schyboll <dragonn@op.pl>
References: <20260102234344.366227-1-denis.benato@linux.dev>
 <88609e7c-3348-440e-adc0-eed9dc4d452c@linux.dev>
 <992b2843-4afa-ede1-d276-8ccaa61b1fee@linux.intel.com>
 <2e1f5ce5-3647-4dff-b67e-327b0c1cb12e@linux.dev>
 <cb403a32-f3a1-f92e-7974-08307641396d@linux.intel.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <cb403a32-f3a1-f92e-7974-08307641396d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 1/14/26 10:04, Ilpo Järvinen wrote:
> On Tue, 13 Jan 2026, Denis Benato wrote:
>
>> On 1/13/26 15:02, Ilpo Järvinen wrote:
>>> On Mon, 12 Jan 2026, Denis Benato wrote:
>>>> On 1/3/26 00:43, Denis Benato wrote:
>>>>> I was recently reading through the asusctl issue tracker and I found
>>>>> out that some users have been having troubles with the keyboard RGB control
>>>>> that was working before since the creation of asus-armoury and subequent
>>>>> deprecation of old sysfs attributes.
>>>>>
>>>>> This patch series aims to re-introduce those attributes in asus-armoury
>>>>> so that userspace tools can still control keyboard RGB lighting
>>>>> without having to rely on deprecated asus-wmi attributes.
>>>>>
>>>>> In addition to that, since disabling OOBE is essential for controlling
>>>>> LEDs on some models and it was incorrectly tied to deprecated attributes,
>>>>> this patch series also fixes sending OOBE at probe time.
>>>>>
>>>>> Link: https://gitlab.com/asus-linux/asusctl/-/issues/619
>>>>>
>>>>> Regards,
>>>>> Denis
>>>> Hi Ilpo,
>>>>
>>>> I see no comments on this revision, did I sent it at wrong time?
>>>> Should I resend some other time?
>>>>
>>>> Sorry for the question but I don't know if something went wrong,
>>>> and if so what exactly.
>>> Hi,
>>>
>>> Nothing is wrong, I've just had to spend time on finally processing 
>>> some larger next series which were even older than yours. And we're only 1 
>>> week past a holiday period which tend to add to delay.
>> Oh okay, thank you for letting me know! I feared I repeated the error
>> I made on the netdev list :)
>>> Patchwork keeps track of pdx86 patches:
>>>
>>> https://patchwork.kernel.org/project/platform-driver-x86/list/
>>>
>>> If your patch is listed there, there's no need to ping as I'll get it it 
>>> eventually (and it won't get forgotten).
>> Understood! Sorry for the inconvenient :D
>>> There's no "wrong time" to send a patch to pdx86, only that when the 
>>> merge window is open, I might do processing of any patches during that 
> In case it wasn't obvious, I meant: I might not do processing of any 
> patches during the merge window.
Sure! Don't worry I was just attempting to avoid ending in a place where
everyone forgot these patches as this feature in particular has been
forgotten already once XD
>>> time. But unlike some other subsystems, we don't disallow sending patches 
>>> during merge window or any other time.
>>>
>> That's very good to know. Thank you very much, always very informative!
>>
