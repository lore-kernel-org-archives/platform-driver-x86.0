Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2525920E6FB
	for <platform-driver-x86@vger.kernel.org>; Mon,  7 Apr 2025 11:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744025002; cv=none; b=F7grIhjEl8JFB9q4CYm9bZ26JIpa+QHGCkKFmfwvxofqsWbCoTwPMMQ3CgivSaLz4WdRSjjSrsAcVG8ucLEnHmazcVB59qRqGZuShXmt9ddkppmSUEwHZVEusglZoK7W9Excgqm0OiLdQiYtUOO18YF/IzQveJu3L6ZovubCZa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744025002; c=relaxed/simple;
	bh=g6nI7ZH6m4WYxccDMBToIF0vlNJf1/Er9YV0oGNI85Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY1HqVlpEoUDzP4YBM95IbMoiHcljdm6eElDBcBManUVMFDCiNi2Dn01wgVATdB5dKd7bjzdDKtTGv25PQapD8fF5ucuVzqqENiL+JgcgZu8+7HzTaDatfV6zbqEvqdbf63vsrFw90ij0fMS3KYBG8l0Dh4Z/tGPVYD+b2hIGC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J7wKl1eC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J7wKl1eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744025000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uF3DSja9iElE9nYwgux8EJ0Spqze6OUuU+c5MHhKRbU=;
	b=J7wKl1eCn6EtqetOLwoEygnZdvUMN8HeAbWr7v2SD195bFm6AWUVwlUYcQN0tA+W77bMWC
	H0xk3HFnIIf/QvBRhFM9BrAu6BiLUMXuVnYnAW9iMks6ha1krAlm5G2wGq8nK/0u8f2hyZ
	jE96XVW7+RHy6ZliE1uIac1Q+jgFPu4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-CliBTItBMc2baCoq1gFojg-1; Mon, 07 Apr 2025 07:22:34 -0400
X-MC-Unique: CliBTItBMc2baCoq1gFojg-1
X-Mimecast-MFC-AGG-ID: CliBTItBMc2baCoq1gFojg_1744024953
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d0830c3f7so35635515e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Apr 2025 04:22:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744024953; x=1744629753;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uF3DSja9iElE9nYwgux8EJ0Spqze6OUuU+c5MHhKRbU=;
        b=gsplI/hCDbIZxpTDGE1D5ZXVgySPj1cWKqmKgirm/VgVPGHdLnbPSDMlA+DFVX1mdL
         duhRAcs2hdXU0Ids9ii0L9VONeIHkLyVz5QXehWrB2R06AwuEQItYf0/NEHbmzDT7/o2
         L2uT79AZBFkNPF08gOdd33zoMPiX2Zht29fkk15SOsdO/xYdOJ4PW021/dG9Yjxc4n9H
         s19M05d+znWtd4PfLyrPjfUsZdJr1VwaO3xk11fcz8VMAVzxNvuHuXzuGFR9Q81Kuz9a
         6/WrflTV9/0OYXCy6HqeoH0gEwwwppuCeNIR23U19qDP9g9EVLCdArAVCJAbh/pKMeZR
         Wn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiJOFmBtslWbCE527kYWitvSpq6dK2DXY+3Euyeqo8T9aTTy7syUvfDVHN6rYaUK5rEmuN1jdnpr67D1h/yR317vof@vger.kernel.org
X-Gm-Message-State: AOJu0YyfHgQWHKkmw60FQrcfVHNR9ozT0wYMwRz/kiVIv6cWNTP1qRXf
	Utqal/KdciaW/LTaGjSzId1FyUf2UOnn3ofUT1S1DbVzkcOTzxDwDGb+e4A9zkwppgUDAQ70HbZ
	mLU9dNbm+zl32aSQOGpnRi2nv0oWe+8Rw/73bIKFRheY6DAM3eWGHp/VLpWzMR3iFMKuRvyA=
X-Gm-Gg: ASbGncs5fzHUjFj7kTTq14S7JRWlBRHjOmut/uzdOuHKPa2YugQhXApvDfj6jU3HiP/
	x4pT34wpJD5Pb1c0dKMdijYNhEy6pcFJyqINJML6MLV6df7u2ZhAhaFNQ4LPMgycXITlrU04Ux8
	3bGeeviJ/YO0zJJAVhp+cFLKsb7v+QhMSMU03MlB32vxUW5UCzMQ2kDLq/69zSBglB2XM/+fPtT
	ghWQkhDYH/ZDxpchIZkanRexhJaYDIDDsEFGOUiRImOVkbM8hBBjI2Q8eS/7Ig6sKMqs/3Yr+wO
	VxpvTYLayVQ7C1EQPck=
X-Received: by 2002:a05:600c:198d:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43ed0bf6378mr93921345e9.9.1744024952705;
        Mon, 07 Apr 2025 04:22:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvbKEQjNgnR/sdPmZ3eo0ruy4okYbwKFLU7atKvq8NcMP+qCjnRVN9nEDGOP5na+e/tYwZrg==
X-Received: by 2002:a05:600c:198d:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43ed0bf6378mr93921145e9.9.1744024952256;
        Mon, 07 Apr 2025 04:22:32 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30096cc1sm11727920f8f.5.2025.04.07.04.22.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 04:22:31 -0700 (PDT)
Message-ID: <9de12c2a-f64a-4804-8347-4462ec663a3e@redhat.com>
Date: Mon, 7 Apr 2025 13:22:31 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Add Vexia Edu Atla
 10 tablet 5V data
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20250407092017.273124-1-hdegoede@redhat.com>
 <20250407092017.273124-2-hdegoede@redhat.com>
 <Z_Op2fnes11oZCRo@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z_Op2fnes11oZCRo@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 7-Apr-25 12:32, Andy Shevchenko wrote:
> On Mon, Apr 07, 2025 at 11:20:16AM +0200, Hans de Goede wrote:
>> The Vexia EDU ATLA 10 tablet comes in 2 different versions with
>> significantly different mainboards. The only outward difference is that
>> the charging barrel on one is marked 5V and the other is marked 9V.
>>
>> Both are x86 ACPI tablets which ships with Android x86 as factory OS.
>> with a DSDT which contains a bunch of I2C devices which are not actually
>> there, causing various resource conflicts. Enumeration of these is skipped
>> through the acpi_quirk_skip_i2c_client_enumeration().
>>
>> Extend the existing support for the 9V version by adding support for
>> manually instantiating the I2C devices which are actually present on
>> the 5V version by adding the necessary device info to
>> the x86-android-tablets module.
> 
> ...
> 
>> +	{
>> +		/* Vexia Edu Atla 10 tablet 5V version */
>> +		.matches = {
>> +			/* Having all 3 of these not set is somewhat unique */
>> +			DMI_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),
>> +			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
>> +			DMI_MATCH(DMI_BOARD_NAME, "To be filled by O.E.M."),
>> +			/* Above strings are too generic, also match on BIOS date */
>> +			DMI_MATCH(DMI_BIOS_DATE, "05/14/2015"),
>> +		},
> 
> Oh, this is unfortunate matching and quite fragile. Do we have other matching
> mechanisms in place in addition to this?

Having both PRODUCT_NAME and BOARD_NAME set to "To be filled by O.E.M." is
actually pretty rare. Of all the DMI decode's which I've collected only
2 other devices have this. Usually at least on of the 2 is set to something
less generic even if that something is still sometimes not super useful itself
like "BayTrail".

So IMHO combined with the BIOS date this should be plenty unique IMHO.

Regards,

Hans


