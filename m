Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D46E4436E;
	Sun,  5 Jan 2025 04:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736049706; cv=none; b=MseBTSlwEvDVVj37NC61MCh+fAFdANnsPNi4MMTzpcoyqzwI9cZrbTNY7f7YCynxwke3BwWzSfsqk7CtQiTxsEHIE+CNwlHQYX5DQxrctEaumh0zJR/MCpYZhG14b6e/b0I9voiY984DlpuR85Z68cF/dKkAjbRTPyVkf6faALI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736049706; c=relaxed/simple;
	bh=pxxMp2AgCbCFlUnc8Nzsyqv8O9bwh7kG2h3CVvURW2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPkdFmjppTr7KRcYDAM0OWEHdB4viP/Ty1m1jg1GLyyHfvnKDxpFEzvZ7y/GQGH4SlZtCZ2jiHiiVbWiPEowQKSgBu1qPSr4ip6R/zPhVXVJa6lIfjMWQLWd011J7dpvdnFZY7oywNc0CnNJTy8b4F2J+YCOHHX1ltEJYTLOuaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WlBJAr2K; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WlBJAr2K"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so19164655a91.2;
        Sat, 04 Jan 2025 20:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736049704; x=1736654504; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RVSa5ZmT/PKQcgPr0+scEdIZ0QcxbCdj0koXwoyr+7E=;
        b=WlBJAr2K1J3xitPh6UxvWfkZ43bjnNOG+lv6gMmEmjAdjOKjAxSL4Q5bDYprvtwlxJ
         1sBU3OduvHfIyf+gSo2nifxxUcyXvDAhR/dCY7vrYwGcmik5OYImfveY5IBOzQMVIw0n
         o+o2LsUiqkRJjUnMqhusa6H2degBHKTUBIKP3SciqEsvOwB4kcL0/UQvkPBplzwbSbiq
         OcLP1B5DgcnwyvsE0Ptd5+CZVe8fHw8FbgoRtaiDWj+UAW3+eNgC3Xmwfx2WUR0tyDPG
         xlnPEZ1AwNzFzIN97ENKL53QqXX1OvTj6/iZZBH/lQd7LgUJXKL529M4Wcz6zSlAK0oN
         vx/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736049704; x=1736654504;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RVSa5ZmT/PKQcgPr0+scEdIZ0QcxbCdj0koXwoyr+7E=;
        b=gbURik/f18P9huPzjbhaQfI/15bDkTJ3KrrhSoSu8nVVIk8UiO9Reuwimw48J/CVn5
         WwGychykgVBdcvzzs0N6Yv7uumDA9T5stnjoj8QW9liBcb74U5ZweC/op1oUeajiVdnr
         AMSMXntgta+KKAHsBpvBaQiocYS4ncKe3pz1P9vNsOMNBcsZnNC861H6WvnAM3Bfgh7W
         QConA8fhaGRxfxxHBsdGq6T1YUL10PtzAI9UidaUoi69IsiiDQgM/bpo1wNBCnb7yYxN
         TSju1e0dN99z3ziyKDz7Ni+ApqH8AFRgvXEDqlDT3H4wzAtrPtWTG1b2GCAWf9+ZRSJ9
         MvKw==
X-Forwarded-Encrypted: i=1; AJvYcCV551We2hF3kB9GjH3K6DBoM98L1Lco0c71nlBV/1I81CeXRxmLQ3VdmAWXU/MWf4v/X6wnrLLroVbzoG4UuWPVzr9Xkg==@vger.kernel.org, AJvYcCVWfNGl9aUYxxOUYp/1levpvEKcwtyFbLZF/dIKTPHL4ET37WkGPUvQQ0xfcFBn/doTxJTWxA75uZCY8FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/O597n7TgW6tp2MNfQ4xupPq8BSzu3P+pTQnElyCEYWuZp3DM
	I71M8QwTChaDSl0cV+G+li4DrAPfVS+q1MGRpWSs71QA2xyDlGFi
X-Gm-Gg: ASbGncsejkb1YlzTW/rMo1JlvIKobbJ3zVL5oFLmDiKIcB5vtz2pAJbIHVOGGJMIfjM
	XsfvZqxE36t7rlEGGk3PIDDdt7wewp4iq0eTteGY5BfXwRyETedWplr1P5Fn/yVQe/TSkwfji7+
	QHoJ8Owukhjav79xk0X3lOhGjLVPhbo5rWU5gJvqg+RI/toCcNPXolGOG9SP9QFistQ7HOqBQzi
	h7mDUgKFKW/+kgeXGOTx3jzekyfI5kg4DzbFGPdLLFwyu6FvJ2IKWpbyA==
X-Google-Smtp-Source: AGHT+IF9mKNjYX8FkVW0agLMXfbciZ3XC8pbEAjqKIO1kFiVO4PJkRKhFztPgK7j8G0HNCgDSRX3Vg==
X-Received: by 2002:a05:6a00:b51:b0:726:f7c9:7b28 with SMTP id d2e1a72fcca58-72abdd7c2aemr80528687b3a.8.1736049704357;
        Sat, 04 Jan 2025 20:01:44 -0800 (PST)
Received: from [192.168.2.16] ([110.46.146.116])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb88asm28774873b3a.135.2025.01.04.20.01.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 20:01:44 -0800 (PST)
Message-ID: <c5609ea8-5af2-4f36-aa2f-6c2ddde9a401@gmail.com>
Date: Sun, 5 Jan 2025 13:01:40 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] platform/x86: acer-wmi: simplify platform profile
 cycling
To: Hridesh MG <hridesh699@gmail.com>, Kurt Borja <kuurtb@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250104-platform_profile-v2-0-b58164718903@gmail.com>
 <20250104-platform_profile-v2-3-b58164718903@gmail.com>
 <3bqedlhubucaniyrjkig3cbegfxec5pzrv7vpbpnbphuu6h6od@dymxlla3itdl>
 <CALiyAokph3JiReKsod3CZuxyVMqqmXqQ1t2rsH2wUx=hKaZm0Q@mail.gmail.com>
Content-Language: en-US
From: SungHwan Jung <onenowy@gmail.com>
In-Reply-To: <CALiyAokph3JiReKsod3CZuxyVMqqmXqQ1t2rsH2wUx=hKaZm0Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/5/25 03:19, Hridesh MG wrote:
>> I think this should be kept. If the user changes profile manually this
>> may not reflect the actual last_non_turbo_profile.
> I thought that the purpose of last_non_turbo_profile was for
> acer_thermal_profile_change() to store the profile just before
> toggling turbo so that the system can return to it later on (as
> mentioned in the comments). I don't see a valid use case for this
> variable outside of that specific context, which is why I decided to
> remove its update during manual profile changes.
> 
I think last_non_turbo_profile is still needed in
acer_predator_v4_platform_profile_set for returning from turbo mode set
by user space application in toggle mode.

Without this, when users change profiles and set turbo mode using
applications or scripts (like predator sense GUI on windows) then use
the mode button to return from turbo mode, it returns to default or the
last value by the button, not the actual last profile.

Thanks,
SungHwan Jung

> Thanks,
> Hridesh MG

