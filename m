Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3662EACEF
	for <platform-driver-x86@vger.kernel.org>; Fri,  2 Oct 2026 01:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903744; cv=none; b=uvoPsasWmB7cJ9woJ25kvvB7ExPf/d6jAxkN66QLZg+HABlvhOPcl0fKn1NE2Qpxxm0aoKtK3VB+3F/X6Zyqj7t89Bnxw6nKOiZ761yxywDq/mTKPf3nds2/ibdhfVN2QNKN/nlmYO482eVxpg/qEI10/eAxmfViyBg0nZM+aT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903744; c=relaxed/simple;
	bh=aunFeame4wKVmGvgJHnu/qouCptqjCmPxKAfP9jLT+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yuh4TCdyI3rS00vcBpTJUDyzfs6+t7tJSmVKSZJmjUdoYZhvuYqCXxw3mwcl9fDmzviJyKnj+y++e7eVGJrTTSJsxDkIi0YNGUe9UfZL4Rezy+xbUqfPRtnDGAFUDaSqZJnTotzQYS7C8Z4FGSoIPvZ+RKvKHsrJudWfhXedNxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqS+VnZ/; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqS+VnZ/"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393b0so3257897a12.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Oct 2026 18:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790903742; x=1791508542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMFl2aGGE1aANzs8ZGBHMFNFJgtTXbv0xuIXVOrR51Q=;
        b=lqS+VnZ//RHMj9K/cPuZDOQAW6iJm/1VGtgr17ixmD64BIutCBP10q2yMuJChqvt00
         o/4nLucsRucUJJ2yy0bbtZ9JL0gjgC2juzAnwAtj9m8Eg8GYTp71bsGSEIb4RRETnNeh
         a8zMPuk/stS9htcir5aSYp3MnvgUfvlVcNKUAZ9WflwYc4jMpkj7bty5V7+Ggm4f0P0C
         xKyl9tBGR0e2DRCnupaTov919lgFwb82HBWNHP600w4JcrAkhrhZUnJRKVcqzMrz/NcO
         WnxlANW+c7tCvLkyGZGFZWcejT0Md3itDJtJb3ue+d2wFzaTsyd6HCFKVnR8CxyHbv8Z
         94MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790903742; x=1791508542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AMFl2aGGE1aANzs8ZGBHMFNFJgtTXbv0xuIXVOrR51Q=;
        b=XTWxe4woGrdyChhlsf0iPQQtiQSgYfm9AeOfTleUHfjJHsxdcWqsisCVaBbb7R8+BF
         IBynhA/CaRvIVxm8ikvNDMIrW75GpQB54XMA6CfRKsb4xXETzMQNAeiHeMEV9yvcvoLQ
         XZQghy92jkW00DMj6Kr6nWUJ3mBtb+Yu+OxUGsAYIPXjPHJffNZ2zE3Sh3nlheBG5Chc
         7L/4usD2HZGt6BI+yHmOWufABTEPTEMjWjJo9r61+nZ7dtTxewWFrYUgTEkgX/eZRoif
         qiJWq7GvIhtOny/Lz9n+Du6aD/fpycnpIGNX9tgAodnQHX3pG38QbXXRL7hJj86rhl7v
         wvAA==
X-Forwarded-Encrypted: i=1; AKwUvBxeUEbXPNN68nuu7YhWczoN+kMQXe+qrXmD0u37Utwp8kqaSEW2WuAM9PXtCPAzawdg4ctKbsOSkjK7WUoMYcE/j9/p@vger.kernel.org
X-Gm-Message-State: AFq9FYKMXvHP+tlW1j1K8XAGGJW1r8xAUgTHr4CDAWUxP21uJSlQR8VX
	NqhlTWuTtftl3apXIaLhXJo/K3G2ndfNZL3elkj209B+0JPiBUEWatEO
X-Gm-Gg: AYBFou0ugiLaEuNT/ZgGCtEbCF/4gK7iJrd9R0BVz/fYew2Bh2TGv/qWblWKKVtRdpO
	eSRllBd0EfpPsGPb8UKesi+tgvCCJZh5UCwtSBkH8IgNpRfYeklMZQcKSkgOXHya9kv6jHFgNWm
	20jvoKObalNmHs55YGcEL9tpKUPWgLAjWHpHlYtwVZb24NhrGrxOf1JK6HpJA0Zq6Gihn+Qv1jd
	fzuwuWekr6E2jAoiviiFzVcuopy4wCf8wVv8KpKByl19AvOSxHrk8myATnLEAJWav/2CZU7JeeG
	bBjhvCHbscaCWM/m9GR3JtQLTXg3H+QML4z7puDXABBctlypwVfkz8uahwKjgiuDn8JYdITB7v5
	KA51rgrweaKTXFR5OIQXn3Zy/GffsX7jDdI2kHI0g7EqXvtywQZ4DSrJ2z8pFkBl76c4bDUtf5I
	vGv3WnoBufRD2uIFpJJ7bGvUKLdleYPWuu5A/J92S5a4pI0Q8VOHJMysJchRYtOlP2hTugKftzn
	oA=
X-Received: by 2002:a17:90b:570e:b0:3a2:b4bb:91ca with SMTP id 98e67ed59e1d1-3a6ce34d7d2mr1167955a91.1.1790903742526;
        Thu, 01 Oct 2026 18:15:42 -0700 (PDT)
Received: from [28.0.0.1] ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd2fc1f6sm432027a91.4.2026.10.01.18.15.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 18:15:41 -0700 (PDT)
Message-ID: <91392a33-7450-49a2-acf9-0756dd9b7aeb@gmail.com>
Date: Fri, 2 Oct 2026 09:15:37 +0800
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

Hi Miloš,


Just a minor note: you replied to the older v6 thread instead of 
v9, though I see you noted the dependency on v9 correctly.


The patch looks good to me.

I will include this in my patch series if v10 is necessary.


Reviewed-by: Mingyou Chen <qby140326@gmail.com>

