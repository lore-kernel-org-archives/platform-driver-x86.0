Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD87726A0C6
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 12:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746621011; cv=none; b=AWTRTPis/R1UlAEwdSPySCK+fvBl7DUnAnqGie22HZGnjz1NJh1l5Y8fZ5R1QeRYlUB+0m4fyNk0KOiyvgcGPdwWao0F8Wdslyn0ClxP6R3o/NpRWg/I7tBWbYgFSJUXpkFa9CZR9B1zJ1I1EEQIjdzacoFrl3K5i2sZDDmdkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746621011; c=relaxed/simple;
	bh=JNdtvqwADj7Ac0TJOZ1e0E3jpldnNx9k/NPQ41s9kOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNY+tMnQfpZMfvfvbpTidEjTXFE+ptZoxhmkrnRZGVuyFqfbDwRkaEgCwPpA6N5uzkwxmoBpDVyx847r9vDWn0VEAxGb7AuVaclIw7U5ZRFIknYZ/TlLJN25rC9xbfm2LWTR6fRRkpgAB9jWJ+8KWXxAr4V0bYOnlnkcQ3J0rus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLGrdLNQ; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLGrdLNQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22c3407a87aso100410615ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 May 2025 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746621009; x=1747225809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ha0EaR7NAEk+5VRw9/VM+9A/KOYZ5JkE+pDGZufFvTE=;
        b=GLGrdLNQqPPuKQfgcPjLRF91iC2IRmnQcH1wQ9OWt1w8EbYerMV0WZ/w6ASbdhkzZW
         xB3S/yX7XxeC2RbELemQHR1l+d5gfPhdol6xGAvlCaKdha42CwVw8mmHbwKZkiBfohYY
         kPB+FjAy8GgLCbDO480bGXu/AP47vPTfl9spzxM8KMQ3OsPD1j9VNGTjdKQ1AAmnxeAy
         dGr/Tvvd835N3FsToyQYdsDuZD0M+bIsFHoiow2VGvAM+6lbtby09ok6MlEX348B8FVT
         1SzCWUMOGmVrYAuKY5N2apPufFSBE+/qs+R8DsL4Dd1vP27iwrsVbcMOcB0I8KYlf6Tb
         n+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746621009; x=1747225809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ha0EaR7NAEk+5VRw9/VM+9A/KOYZ5JkE+pDGZufFvTE=;
        b=GBdc9B6d7OpwNeb/5Zoj00SX+uJQAaU9DdGHmrLQfkqNiEFg36uN/nMqVtCWHwDPhO
         V5lm6WdFSN0EPY+llWukVW5LXs8U4mnSbQ1QUXQghQhfzwzQjVtHTVA4CeiqmGtaS1dl
         WHYWQASgJMQdTGmEbLQRee/06/w/35wPezQ/p+Jiv6YfkDmdangx5rQw42Y9RU7G26Jn
         FqqxxavX0ZUCsZOOUH36e5Spnd6EXypivmN42fSp0QN6Z3UkDaaiJlQgTLMP33Yw8WMJ
         eJjjQbU8+KpkcnFKUQ0cn0D7Kysu3c7iqrqPYUWZVWLz+2nME5JauanLHoA14kIWTlXz
         boxA==
X-Forwarded-Encrypted: i=1; AJvYcCVkj8soJnkttFIjXGbx9rD9YTrMHbjJg2uYBTpxTPXGTeb7eE7GfzsQoL1uW+bu+W3mg60PiAnYdD5lBZuiwH85JD9t@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx4MkcAAYFihvba7CKVv03IVbFk7DTXBW0qfHMgmsyM7Ts2EW/
	ViXRxiOzhbPKBspufpD3x2ggWqCMnghxrNVVes5+3nWI+tDZCqhGHWTijv1J594=
X-Gm-Gg: ASbGncv+Ra6hJvMCiab//VmbHFPDrtu6uqU4YHSkv8KjgV3kh/BUfZt9F/gT8axKuFV
	YBWwlintAPu/lhL0s2UC5SKJrGf07rgBEk3uhoLJZRsSD+N8qVGMY64wRiFOl136M3141w7NLXk
	EsL2KDSNzFjMy8na1q4Nz0PCgi70sQKaUeLCBQTTGRQxhguKUiYVLdtKUAED6ROlSnMIY2KJ94q
	SsMoWPZXxWKQGHSoXMW5peKOWy1KNRir8idHviN3pv+qaV8oXTr2L1fzJr0Iy7jGt9/adrjKsNX
	eBHUUfACmEU/g3U+qz9r5OgY6iv9hyVnWdTuqFAyeZN9M7fVIsnQ6s094Ic8pSyREW43Xq7emUC
	DI3DxZ12YAVeEpHKDgg==
X-Google-Smtp-Source: AGHT+IE4avYii5DVFA/VIOa0p7EVlSqvH9kH5kpvZzSyH/GTQUiTOVc+PJ5+u1Ns1mJBvMcNPsRV5g==
X-Received: by 2002:a17:903:1b47:b0:224:f12:3734 with SMTP id d9443c01a7336-22e5ecaed3dmr49481215ad.30.1746621008700;
        Wed, 07 May 2025 05:30:08 -0700 (PDT)
Received: from [192.168.0.5] (127.37.178.217.static.user.transix.jp. [217.178.37.127])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15229384sm92367725ad.206.2025.05.07.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 05:30:08 -0700 (PDT)
Message-ID: <7d77ad27-b05b-4de5-b391-6f7ec3e08dd5@gmail.com>
Date: Wed, 7 May 2025 21:27:49 +0900
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] platform/x86: thinkpad-acpi: Add support for new
 hotkey for camera shutter switch
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org,
 ibm-acpi-devel@lists.sourceforge.net, njoshi1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250505150152.27968-1-nitjoshi@gmail.com>
 <b2c85fc4-e288-c875-68a0-74b287609dd6@linux.intel.com>
Content-Language: en-US
From: Nitin Joshi <nitjoshi@gmail.com>
In-Reply-To: <b2c85fc4-e288-c875-68a0-74b287609dd6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Ilpo,

On 5/7/25 19:22, Ilpo Järvinen wrote:
> On Tue, 6 May 2025, Nitin Joshi wrote:
> 
>> New Lenovo Thinkpad models, e.g. the 'X9-14 Gen 1' and 'X9-15 Gen 1'
>> has new shortcut on F9 key i.e to switch camera shutter and it
>> send a new 0x131b hkey event when F9 key is pressed.
>>
>> This commit adds support for new hkey 0x131b.
>>
>> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Nitin Joshi <nitjoshi@gmail.com>
> 
> Hi,
> 
> I've now applied this into the review-ilpo-next branch. You forgot to
> include Hans' reviewed-by tag which he gave for v5. I've added that there
> for you while applying but please try to remember to include given tags
> yourself when submitting a new version (as long as there are no major
> changes that would warrant dropping reviewed-bys). My memory is finite
> and I'll not always remember those myself after looking a large number of
> patches and comments on every week :-).
> 
Understood, i will make sure that its not repeated.
Sorry for inconvenience and thank you for accepting patch .

Thanks & Regards,
Nitin Joshi
