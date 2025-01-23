Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D3C1C5F14
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 10:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628494; cv=none; b=sd5Kj8S3iRdUu09DIm365y+m67a6rWhUB5gsUSb8PkYZ9uIOdcB5YiwyPEXMr3KPedmW0mOyv+6H0Ak0GOIIekomqZUjMlW5F+Pc9xIT20uBo33KBAGwn3yxj8gm0+ethdAp1jBSY44fpdLfkDrXB+GEMGTnin7XxAryuia9zVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628494; c=relaxed/simple;
	bh=xGmn/s1NYn/2DwZQOXBwgeCltyV3BM3lfNGbJrfjw64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XdX8h5GccVSQaVLaUifJ3k+LesvbquFmZa2omYj0hgUVs+1/w5vChRrCfyshR1pZA8RWexDdjMXY/0eX4RMXYKyxL/18DCUJRx9GCEPm+RgyP1Li3SnkyroPHdyFWz02cDsUTwMNtYNfBOlMcbgs91NpanMnMB4vUVJ/ylYJ91M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GY5YKxSc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GY5YKxSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737628490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IZVLsQzG9IiY5wfHiBu4HoaOzxRqbQDPg5ueHLOV0oE=;
	b=GY5YKxSchvn34PUFss0OL2VFu38ttQDvwLukmEqL4F1s+mgKtUYVma5zl/N+eYD0+i+0nE
	UWDkni1svPrukHrh/YPqW94OUr3jsMLxJ0cxDbt6eHdsnGZLzXSb8QqJ4chf3MW6RrWs/3
	W3KN3zGcbMi8ZhpLlAMZTNYa1WTXRLY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-G7PUQSJcN0mTqVcK-5skvw-1; Thu, 23 Jan 2025 05:34:49 -0500
X-MC-Unique: G7PUQSJcN0mTqVcK-5skvw-1
X-Mimecast-MFC-AGG-ID: G7PUQSJcN0mTqVcK-5skvw
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d90b88322aso773008a12.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2025 02:34:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737628487; x=1738233287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZVLsQzG9IiY5wfHiBu4HoaOzxRqbQDPg5ueHLOV0oE=;
        b=h3MESm03OriEgyu/FWJAY023ym7w+I7AW3pj0+VB0cM97hoci9VDPB2YKYzeg1BWYB
         fXN1vck/FviM9qDk7x0iu2tRpngO1s4tDg/TvK0M1eB446DqTJ3UaF5yZd8+BTAmdNw5
         boknjKtmzvztHB4X0Ea1HgtABJoV0KBNCiBrSTFJdLH6NU5ITIF+D3UrDDFQ7VwTKKWP
         zIw+VwAVd8g73V9rtwGO69nvWKKwFekaDDbntxrvLw5xKVCEvZMVPxF+QPgdM6oDMgsk
         YfqNSjOW858AeNKHtiusK2zJBVurDe1rAx2PWI//G77b7OmBaar5Zo+DSel/0xbK2j6W
         oZnA==
X-Forwarded-Encrypted: i=1; AJvYcCUgSKZWR2B5h85Hqd9HTbYmvAVug59KvKyGjurEGG9fY1fHSUBy/wiTfkfpg/fV4hojyWNJW8FOacHmp4FKMiz2Msny@vger.kernel.org
X-Gm-Message-State: AOJu0YyQvGaZgibBeibMkCkPGXBLDqwP9XNt7cGd0CTZArSVXARJPpXo
	E7IgPmlsFdLQ8v0fEi3SPebm+7dyf87YqnRkNS5Pn+hwiQErxZofqzwmJduxU9eaSII65vwI5/s
	HuLlIXK+kv+TZseRkEyWggA7IwCKffzRW7pStfZYjVIWKcdJWGOoUpI01Cfha2aBenk7jH+BeDr
	qXa3A=
X-Gm-Gg: ASbGncu4yvYXNTFtN3dwuImpoaszQQsn3M2BkHyZb+33w0zVIex0YhW9mipkq+sQB1s
	p80gHe3R6HZcnWTbHZEESk1qp4ksLYmYT04W920r249rNLWMoWi4mujfOwnaqz2R88NeS3nulKO
	erh1iIJHSAsgOYp93aLtUIHN8HSDTiZAckGYm+KizD9HjhU96A018Kh/+JFyCOgrCHDsJQkvNTs
	vqVyqxNfVhxcWOpQHWnXfF5Vql56+Gy0i18BMTR+mW3C25pyO9yyg9nhGxCbEI2hJsu/9r1pMin
	N5+e+JgujIF5hLJjt1VjrU0z56c8t7rjMb0TVON01qlraoXBkGNbyKa5wQ7dUeqgqs9gFMJC9K/
	qJXW7YQt3mUiXprykiDcIu9clxPfieCehT8PrvuXYfkyoTz0=
X-Received: by 2002:a05:6402:520e:b0:5cf:420a:9 with SMTP id 4fb4d7f45d1cf-5db7d2e8ff7mr24571343a12.5.1737628487523;
        Thu, 23 Jan 2025 02:34:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsh1EGqUxMNy5n5/COxOInUEa5II+lUWsEduN5sVOi+U6vzFfN0r8UpfHY9qmdGdIE0fEHdw==
X-Received: by 2002:a05:6402:520e:b0:5cf:420a:9 with SMTP id 4fb4d7f45d1cf-5db7d2e8ff7mr24571324a12.5.1737628487134;
        Thu, 23 Jan 2025 02:34:47 -0800 (PST)
Received: from ?IPV6:2001:1c00:2a07:3a01:f271:322f:26b0:6eb5? (2001-1c00-2a07-3a01-f271-322f-26b0-6eb5.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:f271:322f:26b0:6eb5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dbcfb8ff37sm4548192a12.72.2025.01.23.02.34.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:34:46 -0800 (PST)
Message-ID: <9ff0c16e-aa9f-455c-aa51-57ec11a6cbf2@redhat.com>
Date: Thu, 23 Jan 2025 11:34:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] platform/x86: int3472: Call "reset" GPIO "enable"
 for INT347E
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Daniel Scally <djrscally@gmail.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, linux-media@vger.kernel.org
References: <20250122104344.245128-1-sakari.ailus@linux.intel.com>
 <Z5Eh-mX-RiWw9giI@smile.fi.intel.com> <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z5IIkM1i1MV42uvh@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sakari,

On 23-Jan-25 10:14 AM, Sakari Ailus wrote:
> Hi Andy,
> 
> On Wed, Jan 22, 2025 at 06:51:06PM +0200, Andy Shevchenko wrote:
>> On Wed, Jan 22, 2025 at 12:43:44PM +0200, Sakari Ailus wrote:
>>> The DT bindings for ov7251 specify "enable" GPIO (xshutdown in
>>> documentation) but the int3472 indiscriminately provides this as a "reset"
>>> GPIO to sensor drivers. Take this into account by assigning it as "enable"
>>> with active high polarity for INT347E devices, i.e. ov7251. "reset" with
>>> active low polarity remains the default GPIO name for other devices.
>>
>> ...
>>
>>> +/**
>>> + * struct int3472_gpio_map - Map GPIOs to whatever is expected by the
>>> + * sensor driver (as in DT bindings)
>>> + * @hid: The ACPI HID of the device without the instance number e.g. i2c-INT347E
>>
>> W/o "i2c-" part.
>>
>>> + * @type_from: The GPIO type from ACPI ?SDT
>>> + * @type_to: The assigned GPIO type, typically same as type_from
>>
>> @type_from
> 
> Agreed.
> 
>>
>>> + * @func: The function, e.g. "enable"
>>
>> Should we speak in terms of GPIOLIB, like connection ID ?
> 
> That rename should be done in the entire driver probably then. I can post a
> patch if Hans agrees, after this one.

Yes renaming func to con_id makes sense, but that should indeed be
a separate change in a follow-up patch.

Regards,

Hans


