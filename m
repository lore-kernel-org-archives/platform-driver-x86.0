Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C083275AFD
	for <platform-driver-x86@vger.kernel.org>; Sat, 18 Jul 2026 03:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784344471; cv=none; b=ugOa+6N2EzduFiRIM2Vy1ESccL5NwKL+DGqJUXX9K0BgLIEIUSMad2/HGHAL5a6zG6WXSCMOMGRyGN23WkVik/Yz3sPL89x1LB+yegbug8A4/dEoBL420nJlXCX43aqYQidlrYwLqg28DG8VvEko2RvliysRyCrWeMauGhgCzXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784344471; c=relaxed/simple;
	bh=75OM78mDBv7m0To6+md2VJeNP93zZkpntH2fn/Xm0mk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ft4BxjrMmOtS7lq6eVA45bSAn47Gk9CdOFTaE63UYis9X19XufqncuWlEMBHXBugQ1MyPnkkwB9Y/MuRuXLpvgjQHEvYn1xLHMsDXA8Fe8P8NUvtHXAsgV9Q9HhmQfVOI8zEfjH/sIu9KvZJqwBwytoBKj6bANdlr0BOd2qLnBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjX+oiiL; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjX+oiiL"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ceae1ed204so61855875ad.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Jul 2026 20:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784344468; x=1784949268; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Bsb8pItnWyhU9Za19CXZcnsh1n2I7MhDPWvur0EhQA=;
        b=TjX+oiiLQl6GUiTULDN3gUzFxL0eAVI08RuwxeHRnKGSnmL4J4CdBGBI27FXKcmDl1
         W6P6hpDkQ6l5Y7b365i+PflYM9yYFvC55DPwIZL8IAXXAvqfgYZT71TKm7lKIQuCcdJp
         Vrog++Ahu5uq3oIb6mQGFFpHnJyazm+2sliBWD0d85doatXcLIZ2FwUtxRHGf7bPpxJx
         bct29DMYajyD2oiGbdMknH64u7l7EnZm6kA2OcjxzO3HKVl5baLQwdAn6lbej0143nZU
         lYeEAEKJ5q6tGASkUjnkWZipV57k6Twk9u6ptlWAjFawWM263FPwkaFic6gi5vCh9C6x
         fU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784344468; x=1784949268;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Bsb8pItnWyhU9Za19CXZcnsh1n2I7MhDPWvur0EhQA=;
        b=eIFLLhIJxXEmU8RANJnndBK3W6/9KxaCV1lWYMY+oKE+Kg1PGUMrQtCPBgazKKUOx/
         zjM2vX7YgiuaZ6NxauI5STAa8cplb/G7+LeegsgWZiZT/Qi81tfjJx0KRWGlvE4jnJ/a
         Js/eDK7jvWoFDbLTPwUc8qM+fzESXENutaAjXwAzLKPwOyTcpPv2SUUj/doEvvRQeyUd
         ywxtS9anbxgENmieq4d3CxL0YmnZJC/RKNZpQZOHPnETyzM72V0rnX8ntvsDc7vFa8Ru
         2L+IC2jeSwnV1Y18REmoV7E7zRsrLgvEBW7DfGWjlZeZHfhz93D8BLp1YXAaqA3D45j9
         93gg==
X-Forwarded-Encrypted: i=1; AHgh+RqUOmmj5hru/2JxEyMnhaXxs+fNPcnwxfGGAMhqpuE0S2QdBXmdsiKIqBK3RlgBY5rVB26hzqA/aDte7c+/QaHul7km@vger.kernel.org
X-Gm-Message-State: AOJu0YxNt0A6B+5bum+BzO8YcoARBuQZ1Ez3Zjfe88TrQN75KcuIVtzO
	aDNh/k3J/jIoQ0BtPSwR4uM+o6Yt0h9ziJaybdszAnJ1UyMD3EtosWpn
X-Gm-Gg: AfdE7cnbDpLHXcpFIgqVKgewoBjabO3RCPDeecRPYdZyZJJUjqmdcnAy8G4sRqXWfhu
	Bx+ZamyVcQsRhGSYmsSMe6WgQQXBPPsQb/SV2KlMUq34BU8ccfWO+mE588jV3NSMKTRqxjSj6CO
	CekbnyqxjfmgbCeqShdkatkAs8U/oiZpnMkN2C7IIeKHvyQrAu3gZddhyvEbtb+w3Axizgl/lUP
	CvduIizkes5C2sFAOMnmXRB8momK4IoHIMqKqy0nuUQ7j2J8tE8dELfVHLV/OdmUcBP2Z840yWC
	gkWku3qk69YllFRa1aTUnsot9l4GR7t/1BMCSGH2K07NC+lAEhHAqGO/NPhhxirM1npYuuoT6ga
	gzk30XGXL2OQ09q/E08oy0/uZK8oCTFCx+yIwV8D3y9rztIA84kEjsh2R/iTqWt6TdoV+ZZedKw
	4qJyM4HOYEw360bDQ/QIY=
X-Received: by 2002:a17:903:a90:b0:2ca:bf8e:35fe with SMTP id d9443c01a7336-2cf348917fcmr55314575ad.16.1784344467742;
        Fri, 17 Jul 2026 20:14:27 -0700 (PDT)
Received: from [192.168.86.23] ([136.25.189.61])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29c2dcdsm8895519c88.1.2026.07.17.20.14.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 20:14:27 -0700 (PDT)
Message-ID: <056b1312-f6f5-4c85-adae-d9b9ce6857b5@gmail.com>
Date: Fri, 17 Jul 2026 20:14:23 -0700
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] platform/x86: hsmp: Check ACPI_COMPANION() against
 NULL
To: Jiale Yao <yaojiale02@163.com>, platform-driver-x86@vger.kernel.org
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 Carlos Bilbao <carlos.bilbao@kernel.org>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-kernel@vger.kernel.org
References: <20260713151422.82947-1-yaojiale02@163.com>
 <20260713151422.82947-3-yaojiale02@163.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <20260713151422.82947-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/13/26 08:14, Jiale Yao wrote:

> Add a requisite ACPI_COMPANION() check against NULL to the
> AMD HSMP acpi probe, aligning with the fix applied to
> asus-wireless driver.


The commit message makes no sense.


>
> Assisted-by: claude:deepseek-v4-pro
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/platform/x86/amd/hsmp/acpi.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/platform/x86/amd/hsmp/acpi.c b/drivers/platform/x86/amd/hsmp/acpi.c
> index 97ed71593bdf..615b3ebe66e7 100644
> --- a/drivers/platform/x86/amd/hsmp/acpi.c
> +++ b/drivers/platform/x86/amd/hsmp/acpi.c
> @@ -71,6 +71,8 @@ static inline int hsmp_get_uid(struct device *dev, u16 *sock_ind)
>   {
>   	char *uid;
>   
> +	if (!ACPI_COMPANION(dev))
> +		return -ENODEV;


Check uid != NULL after the assignment below too, then?


>   	/*
>   	 * UID (ID00, ID01..IDXX) is used for differentiating sockets,
>   	 * read it and strip the "ID" part of it and convert the remaining


Thanks,

Carlos

