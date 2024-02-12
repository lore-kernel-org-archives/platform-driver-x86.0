Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0B417C60
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707730681; cv=none; b=eU+yII3OcTmyRyILCkMVTkQiucmASIUtv9Dg/7cyQfbZ86UKbNOqMRErdRbl2uzGtUlAzxY/FvSsFZzOtUcM3+lFzeOz5cpBZLU7S/H80WALLCg6RTRjas6fBH9bLeaIAvLSedNDMA3aah68qAwhHv98uHWrpbOKfayJViibfaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707730681; c=relaxed/simple;
	bh=IGhLgtyUPYOadTEmbnNnEjXmaICpUS9IS605jwUflog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BTj0J33yh3RJ2kTDZuVN33xeqvVBjGmTBxyhQHoely2HoCVscDivnYMMGH1NFHIK0J9X9k9yvzl32XWsjZSaylRsDeOYud3U8HnFcfEOUZhTANvTr8Vj2Dpxe9v6yRQNH5V0o7zuD4isVrGo5KpGLrh4tnVUB/iDRNYztFxWqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OVSOSj2v; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OVSOSj2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707730678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q8m8BS/4kcQ9ZcgSdaYKNty5yQ0E446lmFhtSE5Ncyc=;
	b=OVSOSj2v23Wt2yp5v41G82Dj5nMcZaZQuQlTfRvnvxKdV4q4F9bzf9kFqWGMDQvvY/KX8y
	oz3RQbKtvSX6+DYPgxWvx9tEGg+VLwTQiGEKIjlxnRPjMVjghrrQ9iTig6VxB6afwmZ3SO
	hf01Wl40VvKZYjJFY5CG5VHzNWHnFOo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-414-qRs-ro5kM6uf2VlMDafu3A-1; Mon, 12 Feb 2024 04:37:57 -0500
X-MC-Unique: qRs-ro5kM6uf2VlMDafu3A-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a35ef7abe08so128874466b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 01:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707730676; x=1708335476;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8m8BS/4kcQ9ZcgSdaYKNty5yQ0E446lmFhtSE5Ncyc=;
        b=KmQJlL47NcYU0MQMSlXbyfurXMAzTpBNy8yQMRLVg/SthpckxPHcq/fSnSGnMmN+D4
         wNtvxLiW9l05EL6EXetl5U/guctLuZVIFv9kH2j8Monk/9PujiaeLqcgTOzHsAxuKwYE
         2Zbd4xfcttFpCeXGdPGEzCOyL0PHQpf/0NM2jG6aKmgYyttfDSwnqTzX9q5e+6FCPYXX
         fBNyyD63wLNmaZkJWADvlJ88PzC/SFAZ17bvrSjDzgU9YR1OziexAzX+ir54a9W+Odz1
         tUg5vcy7GxoqyLo2WNOmycrPe9QZH5Eygqmlp4uRPtDyfKBvx6Ex4dRka3ZwstTYqhX4
         0jBw==
X-Gm-Message-State: AOJu0YwZBoW6cV4Hk1wvZXazMn5hGdFI9b0Ly2IG7+NendHCWxAHmvH+
	iCxhmfNo/IzRHHg+46tObMYc2BJ9Ru8AvEEOTLd2hEDf9vtpcKl7CSuRIhJXyaLeFRqjtx6siz5
	cL7750VdLMNpnFGEWAkNtFhM+tznhj8pAdwOaxvhlVcHl21REEh4zfmYf+3kScxyR1srv3z/xrI
	j94Mo=
X-Received: by 2002:a17:906:27cd:b0:a3c:660:6a4a with SMTP id k13-20020a17090627cd00b00a3c06606a4amr4371276ejc.49.1707730675970;
        Mon, 12 Feb 2024 01:37:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFUUiwnvWE2RIniM96XCJPAPaHRYpLKzuUMgAJyOucqqk/lAEM0e/UCyZNI9B7qU3MDWRb2mg==
X-Received: by 2002:a17:906:27cd:b0:a3c:660:6a4a with SMTP id k13-20020a17090627cd00b00a3c06606a4amr4371263ejc.49.1707730675677;
        Mon, 12 Feb 2024 01:37:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVsQIXgq5vXA8l2bbT99Kw4y+92ZzeJZC/OHLSf3ohM2mt7aR9pmGUsEOClJdT7Rq+PBYWDE/pVNcSa6N1cJhwfUe+cmUfJWlbiqw7whPSTespruIsKoV8k34fed6L92gBcrd2j
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id ce24-20020a170906b25800b00a360239f006sm24472ejb.37.2024.02.12.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 01:37:55 -0800 (PST)
Message-ID: <52a15ed2-953e-442d-b09f-ad1bf5ee1c16@redhat.com>
Date: Mon, 12 Feb 2024 10:37:54 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel: int0002_vgpio: Pass IRQF_ONESHOT to
 request_irq()
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20240210110149.12803-1-hdegoede@redhat.com>
 <CAHp75VdR+zVWvKQo_GWng0YZw=oJxsYK7z1MoZUvfaJK2E8HKg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdR+zVWvKQo_GWng0YZw=oJxsYK7z1MoZUvfaJK2E8HKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/10/24 16:06, Andy Shevchenko wrote:
> On Sat, Feb 10, 2024 at 1:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Since commit 7a36b901a6eb ("ACPI: OSL: Use a threaded interrupt handler
>> for SCI") the ACPI OSL code passes IRQF_ONESHOT when requesting the SCI.
>>
>> Since the INT0002 GPIO is typically shared with the ACPI SCI the INT0002
>> driver must pass the same flags.
>>
>> This fixes the INT0002 driver failing to probe due to following error +
>> as well as removing the backtrace that follows this error:
>>
>> "genirq: Flags mismatch irq 9. 00000084 (INT0002) vs. 00002080 (acpi)"
> 
> While this seems the correct fix, I'm wondering why this driver can't
> instead subscribe to a GPE event. See how gpio-sch does this.

This is modelled in ACPI as a separate device with its own IRQ,
so we are just following how this is modelled in ACPI here.

And IIRC I think not all BYT/CHT devices which use this
driver hac a SCI defined in their ACPI tables and without
a SCI there are no GPE events.

Regards,

Hans


