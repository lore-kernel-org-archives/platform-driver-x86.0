Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADF32DF156
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 01:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904874; cv=none; b=u57PZm+ptsxSNf8FIdY73fOrFkyNGnAkXDiDB9xOTiDQu5yL4pVFyt0N0Gx0yQf3mVi7/8i7x5ZXd5pfbKa2U6Z1MzJv0NB7Zv3qy78ZVpeEUrQIHAalSxvQ/Mxc8vBWpO90XzXZYhmm2WBYzV+9I4mR2wFkMf5ViNThiR1WKcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904874; c=relaxed/simple;
	bh=PembZoCdz+7bRnCQp2w/8rZ7ZuHcWjwUxhq5DImUPdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SPAgtgvOlmvHUNS8dH5ljeTfEOEFs6bVk6VdAO7W/3TDULqoGa11oIYwcuH1fpAEyfcGc/yGXvZMFzMn1CcXUfs4xghq/NykkhHjN1ZDXhL9wTEnCYPn5fxxiOCoagxDzJrZJ4UroXh8uOtVEW1HOVupUO7jZM88bTqLpSdrf4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K4KswkEQ; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K4KswkEQ"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so61117825ad.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 18:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790904873; x=1791509673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yMXLLBKJIbIBHwP8/q6QCePmdG0lQXlkBnomt+ctiw=;
        b=K4KswkEQYFup87yoeF9bWFnXiMnA45NQ70dO3ASXq2ShzRyGmqJ7iM5zOtERu7PFpU
         EP2LiK/9QNVD49I6fVCwMH95+nhNwJXIoGP+BQM4vJr15MZhGajxCAhCjHVVn5dG29/m
         BL7Ka9ATyA3znSR1GuJm39YczpW5eBZRsCAW98ZQrja6RoowcSKRCpHyghGbglnL02BU
         fHXN/tFWKqBg3Zp9PdQKb8txKCVXqfmdCuwf010ExoKVJr3e5UdKfHXZGbdKOW2jzQjo
         7oR2b5rhwGZkIA0Eo2pI/fbbfyzO+/JKgT5f1Povdc9iA87Y6Ctt7EyTEJ3MZtsowkoK
         9pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790904873; x=1791509673;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7yMXLLBKJIbIBHwP8/q6QCePmdG0lQXlkBnomt+ctiw=;
        b=XeEx2zcGcaWq7Bc5ugtG3SaY8woY/ASGqXXZi5t8jnbUA0Hwm805sep/DFODk9DpNV
         X4/kk+/ylp2MRUbQIq//r03srCZ09b3tsvUtOXMavxiDlQ4gHk0we2bDhJs16yGhECAw
         bQ5iifI6T39DHeCuBEqKN4PfAiUXiCSpVWd9GOStd1Jl2ghaRvObmOwAcap1bTponLxH
         GqM0mpVk7IkNaPFmCYmmZV/oTN0RMFPsXeozSmpVdNp49NiA6hQ2v/LhzGF+G6P3BWT+
         E0v/2dIK6SUFSc7BPQ+SnyU49gBVYN4i73xNBHgcDvIgC/5MQm5oAWYpUWQZJ4itfPv0
         o7Pw==
X-Forwarded-Encrypted: i=1; AKwUvBwxGbXdT29Oz0e+LluIQC/QiWJ7lTgryMm/DKacCAiPRoFS2iwxKSn/DdvJJlEm3I17guNnonVhl952p//xs+aQr+M4@vger.kernel.org
X-Gm-Message-State: AFq9FYJ48xQn+vmc0w/lLFcZD9DAdINjXQy2m/w4R8ppc9DCpDoCWevq
	QkJQAhJTVO+RW23jz5UNYyt0/iCUSB9gse9prOtLSbSznr4ybgmghoVs
X-Gm-Gg: AYBFou3M1m4iNL7g8eBEh71L5zP3T8OkwcPfnITn3T7Ohi5hVivQYgQvO+9ga1uxFF5
	tsN8+st7CyTwo6MdZvzFPLFap5A9DCCGfC+LVrBOg+NHQcgymsSEcst4sD2EwYXtmdk32BjdBbh
	NZHvzdEGk0nQAY3n6m0Tdyt8Kz92isPM5BOm9eLAeXOOPnUrbM0B8kIVqVHC19pKrpK/SVekz1Z
	JqjVtyOg4phoqvr1a6IEEdBYV9bv8G5a32CTXby+9M7i1eWTjfsJVmLB2lvPx+GiiuKmqL2Wi67
	wZhdLXpJ/o+z1DCES3qnF/euRyECiGCfxzRPUaoTZ4PUups/uoQlgEbKt2gwBdI/tqfdPe9HVAN
	QzJHhk07vIKuBYQG0BVvFOiS4e4J12Gy2/wY21dH3nxTYN+U8R24THaMUB5IhP/OsluM/iIC/78
	g07hyfFIVDw8/J+5g5igt/9efTUCjODr/8z81zvQPya/vpBhQj6YnfsD1plBajy0eu
X-Received: by 2002:a17:90b:3c4f:b0:3a4:ab9f:c15 with SMTP id 98e67ed59e1d1-3a6cec6dbabmr1027973a91.32.1790904870899;
        Thu, 01 Oct 2026 18:34:30 -0700 (PDT)
Received: from [28.0.0.1] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6e7401d04sm290543a91.14.2026.10.01.18.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:34:28 -0700 (PDT)
Message-ID: <3a035210-a620-465c-9f87-b5c5b45fdc17@gmail.com>
Date: Fri, 2 Oct 2026 09:34:23 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] platform/x86: bitland-mifs-wmi: Add per-machine
 ops table
To: =?UTF-8?Q?Milo=C5=A1_Vlku?= <vlku.milos.fun@gmail.com>,
 Anton Karasev <uselessfire@gmail.com>
Cc: ilpo.jarvinen@linux.intel.com, hansg@kernel.org,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 W_Armin@gmx.de, ilya.gladyshev@linux.dev, foxido@foxido.dev, kento@kekto.ru,
 ericted8810@gmail.com, chris@miget.com, matias.civadda2342001@gmail.com,
 btx342@gmail.com, wleizc7319@gmail.com, wolf109909@outlook.com,
 i@rsplwe.com, bozhenpeng93@gmail.com, martiya.ar@gmail.com,
 aleksejirlik@gmail.com
References: <20260929134503.17249-1-qby140326@gmail.com>
 <20260929134503.17249-6-qby140326@gmail.com>
 <20260930015058.3076905-1-uselessfire@gmail.com>
 <CAObHBTwnv+kEaFdCp+cr31HtdSo3CaRq84T8vr-Pm75yZMTHqQ@mail.gmail.com>
 <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Content-Language: en-US
From: Mingyou Chen <qby140326@gmail.com>
In-Reply-To: <CAObHBTxHQDfVH8Su1DLABtC5uUsAGBBk=KvcCOvtTs5gMGamnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/26 08:51, Miloš Vlku wrote:
> Follow-up to my own mail: I have now run those values rather than only
> reading them out of the tables.
>
> Built current pdx86 for-next with Chris's GET-only function-id change
> and balanced 1 / quiet 2 / performance 3 / full speed 4 on top. All four
> profiles apply and read back correctly, checked against the EC register
> each time:
>
>    low-power            -> QFAN 2
>    balanced             -> QFAN 1
>    balanced-performance -> QFAN 3
>    performance          -> QFAN 4
>
> All three power-profiles-daemon profiles work as well, so the desktop
> slider works end to end on TM2307.
>
> Two things fell out of that:
>
> - Without Chris's change every one of those writes fails with -ENOMSG
>    here, exactly as you described, and with it all of them succeed. So
>    that is a Tested-by from a second board if it is useful.
>
> - No machine-specific capability check is needed on this one.
>    WMI_FN_SYSTEM_AC_TYPE is unimplemented, Armin's work reports that as
>    -EOPNOTSUPP, and bitland_pp_check_capability() already treats that as
>    "skip the check". The stock one is fine as-is.
>
> So the TM2307 entry comes out as just a mode map plus a DMI match.
> Attached, against the v9 ops table and checkpatch-clean, in case it is
> useful to have in hand while you write the TM2309 one. I will resend it
> properly once that series settles -- posting it now mainly so the values
> sit somewhere concrete, and Mingyou can fold it straight into v10 if
> that is easier than carrying a separate patch.
>
> Thanks,
> Milos

Hello,

`git am` failed to apply it with a "corrupt patch" error.

Could you please regenerate it cleanly with `git format-patch` and send 
a v2 via `git send-email`? (don't edit the patch content manually)

Since the code logic itself doesn't need to change, feel free to include 
my Reviewed-by tag below in your v2 commit message:

Reviewed-by: Mingyou Chen <qby140326@gmail.com>

