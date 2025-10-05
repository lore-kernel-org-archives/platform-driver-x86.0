Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3B2877D8
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 Oct 2025 12:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759666972; cv=none; b=sF+XlP7GXDjIqJYsiwtBeeOKQ4uDhUIHscSFwaiXvxKH7eTEPClR/DPjZ+xFeNwzKoMn5vTLtdgXb60RnXTWB1QHMw3bnTIwy1SqPzxMnmnAD8CXL+S+hAecJMJMUZz730hMQ17P2VpmKwHwWGaGF4MDYCYPs940TxffZM+581g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759666972; c=relaxed/simple;
	bh=xCCjpTo0Xm1Q6VB/DT5XzgQNr1xoL4KQI3MIBUtOwKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cJifaQcHJHEWxC+RB+KKPkpS/mfBf3Xysu6PRfskAKG0VSY5uKg5pld9h+DToHd+5/KMfAz5KvVTji8hRXStMMkgTUOxmEmixyuOUUEHevJ1DJi6obER/0FERNoBfWvjuCNEws9bP793wRlq6UWPNdngcHhN45jywp0jk8HEwkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HCGfqsdE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HCGfqsdE"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso22845205e9.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Oct 2025 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759666969; x=1760271769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCCjpTo0Xm1Q6VB/DT5XzgQNr1xoL4KQI3MIBUtOwKg=;
        b=HCGfqsdEJ/LCuaffupzO+CcDo2KGtRFVizTbjDObMH7DVR4QnedTMWbyck0aXBoJgF
         dIFUzENFFwtE5Zce4nCAvsWuWjco9YtZDKwXf9+yOUQ/cYlUadu5k53QzwfizapydOZz
         +fQCWzRH2zxEFKOPFYYxBk0D1vbuG1sx5bQdG9ylgs8X34clpd8DspROafLwUt3s7R/5
         L6BKidS4lJopSF6OIUvTi29LazN6YPWgg8TcpR4/R4oW1M0kcZnuYpHtTxSIVs6oOUAD
         1Uy1Mn6daeo/tiaLfiyLw1XMK6+aOH0v41hfARjhQno9aBCGdb1wlJWp+uRf0gzxdaEw
         Pzcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759666969; x=1760271769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCCjpTo0Xm1Q6VB/DT5XzgQNr1xoL4KQI3MIBUtOwKg=;
        b=ZgjoHDUgmgYy9XM8twa5+O8gaa1IO4gRZ3VeQnSvdHMDbpHS8uSBYPtORX3BZReGDF
         QJ52oNxYzLD8JXOUIzf9aomIZwmHfBGMocY8Honn5/i76nBFN+DCVq35GgFMSWC+cwum
         3G0CQurgtofY8aakyWrDCdlLhl0YxjNnZek17yvWlifj3HEdvhuap8UDQXhoHKxlcsFz
         UF62TwDSZPVFVY2bJLec8de1lDKuxyDSk+DT5tJpHYMRygTZzyWdAKS99XvlpPwpOkWg
         9iw3+n5FzUdvukqM0Z8U9ladhAiJQ2hgxtsVUCm6PBy0qjUyCbsd3mGWeK2iATFGhqCM
         x22Q==
X-Gm-Message-State: AOJu0YylsVa6G1U4ZF4sDzbzDfYQ4BmWnO2VedMpoLOrmXD0i2yalngG
	OGZDrpkvvpT/FUE4uoNpoceD4lqEceyEGmnreupK2hyuPpmpBpRj+kKv
X-Gm-Gg: ASbGnctksGvk66ZoZgTyJyE7bLDHiDdhcMFlYhaFA04YqyXf6JxoWUuKuAJ9CdBcq5m
	6/UTJUidnRY5+YlkOaldbfdkwWxq/gKpD+dR6xoPUXtl/AzFTvr0tJXz2j+89YPGfz3CeplhwVD
	ZHBTU0VLkxsZANXRMsjFS5jTLlYeo3Zj32hmUZcqjpnbrEqIRveqWupgIzCgg1oQhA8DDkqaUru
	t4d/YwySTyeExciYwJjK0UeTsIEk47xwcc2tCOJJSA7fverAvRFRmmtnxOSVPC+qQiFDYvp0mk3
	ShJrqdqMyAoDtsX93NVOR43/+7lFI8sGh/H/25wKUZYzJVG7B3axXMfPi1TtPw7jMsBEJNVyzNH
	Wb3l6OCqugqfwNV7/MwPSXkmup/rWc1knUR2h4B+cNuRmSzSj62wUZvz8nNjv
X-Google-Smtp-Source: AGHT+IFauZYrcWKdkKAjjqjKwWod79ljqaANmBQBFKDSTbXLK/2mmthdIJvXaFH9DzC9ZGpdamDCBQ==
X-Received: by 2002:a05:600c:c4a3:b0:46e:3dcb:35b0 with SMTP id 5b1f17b1804b1-46e7110401cmr46951695e9.2.1759666969244;
        Sun, 05 Oct 2025 05:22:49 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b86e1sm204632165e9.5.2025.10.05.05.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Oct 2025 05:22:48 -0700 (PDT)
Message-ID: <34852b92-a859-4e18-ba2a-c3cab814c2b8@gmail.com>
Date: Sun, 5 Oct 2025 14:22:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v12 8/8] platform/x86: asus-armoury: add
 ppt_* and nv_* tuning knobs
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Limonciello, Mario" <mario.limonciello@amd.com>,
 "Luke D . Jones" <luke@ljones.dev>,
 Derek John Clark <derekjohn.clark@gmail.com>
References: <20251003185520.1083875-1-benato.denis96@gmail.com>
 <20251003185520.1083875-9-benato.denis96@gmail.com>
 <86282444-f489-49e8-892f-46ce655030b5@oracle.com>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <86282444-f489-49e8-892f-46ce655030b5@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 10/4/25 13:42, ALOK TIWARI wrote:
>
>
> On 10/4/2025 12:25 AM, Denis Benato wrote:
>> +struct power_data {
>> +        const struct power_limits *ac_data;
>> +        const struct power_limits *dc_data;
>> +        bool requires_fan_curve;
>> +};
>> +
>> +/*
>> + * For each avilable attribute there must be a min and a max.
>
> typo  avilable > + * _def is not required and will be assumed to be default == max if missing. 
Hello and thanks for your suggestions!
I am not understanding if you are suggesting of just fixing the typo or changing the phrasing.

Thanks,
Denis
>> + */
>
> Thanks,
> Alok
