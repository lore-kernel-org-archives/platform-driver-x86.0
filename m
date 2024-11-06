Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB02213A26F
	for <platform-driver-x86@vger.kernel.org>; Wed,  6 Nov 2024 21:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730927916; cv=none; b=EaduZCjz2l0W/n/naSB7K7k7SjL/QP15erHgqSlosf12tCGal9K3R6XXIstVIqCdJBw5kwQd5DauQg9nq9iwmr7PrRfAh94L7Oio7KIS6DoKHu8n8/glAj76kP1QJB8abVEzcN02SRyjOA4PGAJQffD+dMKfWD9RfvjTg/VGquo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730927916; c=relaxed/simple;
	bh=TrlKpZ2BdiH3v10XRLEc6ayKiIJs03XlhMQQXj+xP/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PwNu7rf+Z83td+sfEf8voDuLlOa3W/VKbBI7S8zZjxRks+ooFoXtHxd9h0SAwNNVUTQImulzvdAbjrDi0IGacO7bYjFWkZmDVcTCIi6mCMLs3qw1NqSx9k9HEEegeYDZin/7AdAcEediLifSkjwPsa6Y944HsL4ruhKi8ADPIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d4VoHAXq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d4VoHAXq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730927913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFqNM25rK19bbAEb3VQR2Sc//Ga2/Ua/vEGYPXEVLg8=;
	b=d4VoHAXq3tFW0hjCv/ZVZHDsdIgsMsUUBO/M3oiGIHgdZDvl67tvn7O14dnR8qRx3+1dWZ
	B7QOrOX/z2/0OhClvb0Au/VEh4TH/efw9+Gackex1KLRrgk+fJVm3lZdusidlguzo0DEgx
	8Qjv9CclekCzJfB7xNn/QWwSC6g5/8c=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-kep_o0jwNPevxL7SX2CEpg-1; Wed, 06 Nov 2024 16:18:32 -0500
X-MC-Unique: kep_o0jwNPevxL7SX2CEpg-1
X-Mimecast-MFC-AGG-ID: kep_o0jwNPevxL7SX2CEpg
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a0ac0e554so126806266b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Nov 2024 13:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730927911; x=1731532711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NFqNM25rK19bbAEb3VQR2Sc//Ga2/Ua/vEGYPXEVLg8=;
        b=ZK9yqVfMQ2dSILicFmJ14tVOjHodfsW7cQTOY4p8RT+rKnackUPH8RqgsfbMPCQ92s
         fWq/1hCFfbhY+EVqq9G1JumhncIIj9yhCEt3dANfulZWdjzqqrR0S50IE40SUdeycKeK
         +vHPJM0lswdNqyqIKgNQHhIKjfH7bwDIOj8t0OaYeDREX8XEnOqk/vEbEAIAPNay4BPQ
         UjW7wug41XlMR8Z8UhBrhnKdQgSx0PEM1ikd5tFEvVLX7RuE7fiIRunRQAuUm3wvHikx
         28KdcoaJArSrI1CHjE699a7uFTl62pt3u4+yA+0wXUtWe2tj5h6/NKGqCWbPb2umKSmS
         R40w==
X-Forwarded-Encrypted: i=1; AJvYcCVuSZx4l9yfNEj4ZpnF0iYqkBX7z5l9eHCJQIDankOQZ1ACsIR2rXgrToDUQqLEwAy84vmunxXSnL+wZnKVlNNCBYSL@vger.kernel.org
X-Gm-Message-State: AOJu0YwqoaPH7RKrfdlFkaNgA/PNiEjwQdbZ10JFyohRvQoTXs2FUFrz
	tzAHFtdcGh8jjTUf8A1L+a1Xg80Dn2EsyAN1/fIWfqw2UoHuHW5Fa1eOltbILRg1c2oWAwYqqsZ
	liDsvoznlznM8OT5fJk3wDSAinh3D7LO8VN/iF/mpDxXaRnA4lyeJnebZwTyyYAo0t53e8EAlwe
	lSztc=
X-Received: by 2002:a17:907:930d:b0:a9a:ca:4436 with SMTP id a640c23a62f3a-a9ed4cb3071mr70445966b.13.1730927911199;
        Wed, 06 Nov 2024 13:18:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFsK3Gy03ORX5fCtwIW0846sktyzQNJCqHfBIXj/DGSqUDePQFgT3RYrrBKrWOFD3/Lo55cjw==
X-Received: by 2002:a17:907:930d:b0:a9a:ca:4436 with SMTP id a640c23a62f3a-a9ed4cb3071mr70444566b.13.1730927910794;
        Wed, 06 Nov 2024 13:18:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16d59casm331340166b.49.2024.11.06.13.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 13:18:30 -0800 (PST)
Message-ID: <2cf9bcb3-8488-4bf7-818e-2be7832a4dea@redhat.com>
Date: Wed, 6 Nov 2024 22:18:29 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] platform/x86: x86-android-tablets: Add support for
 getting i2c_adapter by PCI parent devname()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org
References: <20241104200848.58693-1-hdegoede@redhat.com>
 <20241104200848.58693-3-hdegoede@redhat.com>
 <CAHp75VdJZeVmAjceMYQ-QZf-+RHAY5Y0nuyXgtVFzSiQ4yMPag@mail.gmail.com>
 <20b471ed-2e49-4a45-9b1c-25d9c2a181dd@redhat.com>
 <f1911338-37fb-931e-5045-20029a5897f0@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f1911338-37fb-931e-5045-20029a5897f0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 6-Nov-24 2:25 PM, Ilpo Järvinen wrote:
> On Tue, 5 Nov 2024, Hans de Goede wrote:
> 
>> Hi,
>>
>> On 5-Nov-24 9:22 AM, Andy Shevchenko wrote:
>>> On Mon, Nov 4, 2024 at 10:09 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>
>>>> On the Vexia EDU ATLA 10 tablet, which ships with Android + a custom Linux
>>>> (guadalinex) using the custom Android kernel the I2C controllers are not
>>>> enumerated as ACPI devices as they typically are.
>>>>
>>>> Instead they are enumerated as PCI devices which do not have ACPI firmware
>>>> nodes associated with them, so getting the i2c_adapter by the ACPI path of
>>>> its firmware node does not work.
>>>>
>>>> Add support for getting the i2c_adapter by the devname() of its PCI parent
>>>> instead.
>>>
>>> Reviewed-by: Andy Shevchenko <andy@kernel.org>
>>>
>>> ...
>>>
>>>>         struct i2c_board_info board_info = client_info->board_info;
>>>> -       struct i2c_adapter *adap;
>>>> +       struct i2c_adapter *adap = NULL;
>>>
>>> Unneeded change.
>>
>> Ack I noticed this myself and I thought I had dropped this change,
>> but apparently I did not.
>>
>> Ilpo can you fix this up while merging or do you want a v3 series?
> 
> Thanks both.
> 
> I removed this change while applying. I also made minor adjustments to the 
> braces in the patch 3 for stylish consistency.

Great, Thank you for merging these.

Regards,

Hans


