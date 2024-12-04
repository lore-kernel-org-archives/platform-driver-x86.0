Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519BE1A8F7F
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 17:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733334009; cv=none; b=LmOxVJXlXkIcCp1qH2esJETW+kasBHlteN8aAcRN6oQGY8YjmoaD3MQOJOCvfpbThfeWeNFdUaZt7VrlgwYV3SrSCHMs0DZkqx3aRoBtx9J7BUkrpU/CRKcuLvX+WT9d35qxkyvSNa4QqyMMoHe9WR+DsTF7qcjDq2tgTEem6tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733334009; c=relaxed/simple;
	bh=MPn/756OuXwrDiM4gMzVdVC/UpdmYt2CcL2/CUpQmZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rgF+ArOsKYegQKr2DNIT9rOuuEBLwnRLP+Qoy2R3p7PzZqUBHUtsVv655F3WEFEtDgY/OwsW7qvXsyfCCZS333ttAEVLvi4Ur6kE/qU3Xe/ElITPaXtzMxgDfZG1phhQ0R06dyhJX0BzH/wLQLgZMlUi/cB6fY1lg2lSqjXso+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P84MIpjw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P84MIpjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733334007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=18JYp7TEqlX1Fl/SbSHCRDqMC+WAdyi+IBTZ7eNqO1U=;
	b=P84MIpjwdpptHvQe1s2WI2PJ0cT6LkzaILRntIoHnrPy8JgYH9NQOmPNJnHm54lWRifiKx
	8T5S3eKDT8avYS1MlCrXHmA2pjCFfyvCp46455M5dgEZijf6feB16gkLJ6yeV1YRLbjCKi
	YfwCOFfqeAE9/oJ6tMyvwyy7ujNk74M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-rJRKXobmNMKCx0SPp8txDA-1; Wed, 04 Dec 2024 12:40:06 -0500
X-MC-Unique: rJRKXobmNMKCx0SPp8txDA-1
X-Mimecast-MFC-AGG-ID: rJRKXobmNMKCx0SPp8txDA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-aa51a52a5a5so387110366b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 09:40:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334005; x=1733938805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=18JYp7TEqlX1Fl/SbSHCRDqMC+WAdyi+IBTZ7eNqO1U=;
        b=Rxtvh6E9Ai6UcuDoVLSNch/ZTmR36Dud6dXCUguaxY+UPEdIzfVewMOiOXl3SeIBhH
         dou1WhTvtVKjnRQKGSEq49WLi7UZ83OoVNcz8wvbsvcwzi/O8G32betRTuS7oXWLbfE3
         HdHi6nnQIV9Z3miDct+GajBZzkjo1URgs8cEChETrjDnWFB6fgPmhoNr1V6ho1fx7pcq
         JUEgv8ysbyodNQEca06XjJxHLhaMsS+VPKjmNkdUf6C8C0YMmURMggCZNEjfeSgzRvqH
         1wgojvxkMD8Tbag+cQAC5GAmoc8YBfJ4QecDh4dEzfMDFfeWAFzXTayS9QltEz9Nj69V
         UxbA==
X-Forwarded-Encrypted: i=1; AJvYcCVqzlQJ4TLPDzKQugdh9u0Bcu8Hd9Os0C2E4IHUxoQe6ywC/xOjIYqENsvDFfr8xoTqUhqx+B1Uey4PbWKihHzvrkOe@vger.kernel.org
X-Gm-Message-State: AOJu0YzgWEQ0io/MhPiMxMgQifSo+Ic3l5TsU9Q31XnKCkgai/mBv55f
	ZLMQ952ugWltndC6XkIOvZFhN5R3pKNw9/PaizM7clf0X5x1rcXPNm0Ly9wqkGXL9uMt93N01bz
	1+1+sjDFYOiXxJlPb+ZIjrIItEhY4lYS1Bd449if6h5OdnFPyBacuUaQ6e3mFkql9IgTKhEY=
X-Gm-Gg: ASbGnct4vd0NxFSAyxN1OeyfEf1D2NXZ65teT5EzfCFvZqmdvznFDnAWHx2i0JipR+e
	wr41wEnDsbNKkuYsPQTRJvVnKY+S5o8FUXdTR4JA0/Qn4C3WC23pZGQWXkj89SjN2i8Z2BKpkJx
	2m7lfIXpBno66haDpegQMbk6e4Nm/Hf+h53AZFgr55YZrecp2IOPmi0J7yOznLzRR+obMNJmMH3
	Xoh+3hkUIuVEC6QfMSh6doMT9yG2aKOtWOK4VH08t3HoIu9tJoaSbTpX82VQDI+RHYq5KRB4Onx
	zqLSC3rebCaj8ANNtMkbNOtCI4+7JuT9AmkMY6KBTij6dRYn1Es7wZWruwfi8ICPZVglJ9HSHDS
	rrGMzi6hreKiFh/Jr34JWqbiT
X-Received: by 2002:a17:906:3295:b0:aa5:b2b:f236 with SMTP id a640c23a62f3a-aa5f7dbd393mr556072766b.28.1733334004951;
        Wed, 04 Dec 2024 09:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzpqsPxHNTU0aq4K/4j/ulzIATTYfFRNTDXFGveT73WspH3nkxLulfhShmqRo59knNNFn2Eg==
X-Received: by 2002:a17:906:3295:b0:aa5:b2b:f236 with SMTP id a640c23a62f3a-aa5f7dbd393mr556071666b.28.1733334004636;
        Wed, 04 Dec 2024 09:40:04 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1945sm751433766b.19.2024.12.04.09.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 09:40:04 -0800 (PST)
Message-ID: <45502fa4-3b9e-404e-8494-a9a2101f1791@redhat.com>
Date: Wed, 4 Dec 2024 18:40:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] platform/x86: int3472: Check for adev == NULL
To: Andy Shevchenko <andy@kernel.org>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20241128154212.6216-1-hdegoede@redhat.com>
 <Z0iRlZPFYItHIV7_@smile.fi.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z0iRlZPFYItHIV7_@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 28-Nov-24 4:51 PM, Andy Shevchenko wrote:
> On Thu, Nov 28, 2024 at 04:42:09PM +0100, Hans de Goede wrote:
>> Not all devices have an ACPI companion fwnode, so adev might be NULL. This
>> can e.g. (theoretically) happen when a user manually binds one of
>> the int3472 drivers to another i2c/platform device through sysfs.
>>
>> Add a check for adev not being set and return -ENODEV in that case.
> 
> But what kind of "bad thing" can happen in such cases?

NULL pointer deref oops in skl_int3472_get_acpi_buffer() during
probe() when it tries to get adev->handle.

I guess for v2 you want me to reword the second paragraph of the commit
message to e.g. :

Add a check for adev not being set and return -ENODEV in that case to
avoid a possible NULL pointer deref in skl_int3472_get_acpi_buffer().

?

Regards,

Hans



