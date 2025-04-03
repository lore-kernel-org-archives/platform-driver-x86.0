Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844024A071
	for <platform-driver-x86@vger.kernel.org>; Thu,  3 Apr 2025 10:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743676237; cv=none; b=PRVxNHRKNGnw8WntzqoXAd1Ij07ooltmNm3L4u3cKhcTbWj/eqE+7qFhlIsVGkRs6eP/Dm8uzZx2qxCRVmS/cA75hbwJQqHPu5jJpXwOBgX7OFJOASykU0eTEJwDdWR7H524Vn6tx6yiwNRmnYLMyUQ6HH4/4GKALASGDIjoL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743676237; c=relaxed/simple;
	bh=A87vsOTWwajVpMpg+2YlIUmnDa0Xqny7rCqOBEabA3U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HDEJYBZeTy5KnOIHsXqcy3U1a3hHG6DTSGOxNRq0EzvpLWevsVknlzWMDDmaEndctJaO09E3S1FJTSMbzfMUcMN8ttkWu1dAl3uGKNiu/CeXGGfkBbP0WshD8kHcNoHIlpQoeKABVpRK+belyLNnGHQyW/IitfSpAI4x2IhhneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I4lcTVrj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I4lcTVrj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743676234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LFaZWVh1B/vDvD3uNAiTMuyF5FuhAhhXz9cWcRghqMA=;
	b=I4lcTVrjXKOqxUdaBuxB2ZQmDas7PIcml3r8KFwpO8PdzZYHkHYx6oqU7VVIYFvu6W+Tae
	xlYtqcjaNaszOIQFQwY2dRKQm4lwZzYPSrRvPdVqPnimPsTjsQX26Ec/1YSpXXRguxhBe9
	DoYbYp/H9utbfcfncT2NbqdAIhOEy+Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-csaTORIyMIKe9au-LaLqdA-1; Thu, 03 Apr 2025 06:30:32 -0400
X-MC-Unique: csaTORIyMIKe9au-LaLqdA-1
X-Mimecast-MFC-AGG-ID: csaTORIyMIKe9au-LaLqdA_1743676232
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3dca41591so64710566b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Apr 2025 03:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743676231; x=1744281031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFaZWVh1B/vDvD3uNAiTMuyF5FuhAhhXz9cWcRghqMA=;
        b=fbUzBFqD9vtrAHEDbYxg6gdhnjQ3NofAUnq3SHOIMCVi/oq5XUL+RGEUaVbUYFKBSd
         /NOQIyAzizHSCQAnJ444bkUM1h6VVVswxdIMK/AKLzIh1sWS9Y8UVdBj643Bg7a2aFlO
         IRZgZbA7Oun/XU4I3lEzgVchJlBFlf6tXhnhlfZa49u9QKU43pZk5ccev/Kb6P33Lb6z
         Bp3vihXkzsUT5HZTJRRE6+QhsIr6F0B+ONLef7Q6ZzjDHicUvNKxx2LZ/YEqGbl6l0Y4
         sHQoYsW0SOGlf/7I9rPnpHmXW6IEWIZ2D03GDluNdCgnlQtjaWy38mLCYQwwpAqYVwwL
         WpCw==
X-Forwarded-Encrypted: i=1; AJvYcCU19b2vRr4DNcz6B/ebkdvkxZZ1gk6nxei3mbu9gGW4H+wQJvWgaoI4nyCiEkRFWXngBeE43GSTa1E4u5C9ueWos8R6@vger.kernel.org
X-Gm-Message-State: AOJu0YwFNTSgBqiysuk6JoLtLeDrRJzhKFmJ4zAOig+VSDAvM0Nc6pZ1
	GYsJEN7dY3HgplTe9a9RNWO3hkXsvDlVDCc5GmXNomHf8fEh7wSYVFMZq3AMzZ+C2Kl6d865OmD
	qIKuHPsCuw2cYaTIsaS0LgR+r1tRZ0sL9LlO5Ocf9OC0tZMB66fAIer5dBVHz0W2DtMBmt4E=
X-Gm-Gg: ASbGncvTe4CPhfWhki6QmTmsVzMeMfkiVqivMKsaD+eOZ8ozePs9817VCaJyBc8bT+2
	8UKFo01n88iMITji85GpP7VwegfAQCpm6C3C/MYSgwnAuJH9puTWvxvHPTL+QLEil/tNEYiLKo/
	LAcPx9ra/JqTVsuNvj22jVugV2so6T3XO8c6oCkxGyzTqZCU4pt0j9h21Oi1JH8xBNR3ap5NOSg
	5ksi4LBcUM4WWfjIyzN8a16JZDOXXzK3MSZzMcF2gD2CePQbta/X/z8gRNMyPO6/rN1hXyR+lZ8
	K0snnw/8TE9/SXEhYKZMIV3kdxIeHAuJYCRwFA+Mh7cBR+0/NOwnm45rvMSeTKUQiSDu5trpac7
	hO1VbMLaC5UltusVpcxD3Ajh7TadGhHJ5WJCYNgy9J55adyR+eqlni5c5ccldMhVTDQ==
X-Received: by 2002:a17:907:7f1e:b0:ac3:1763:cc32 with SMTP id a640c23a62f3a-ac7bc163c0dmr161837066b.29.1743676231571;
        Thu, 03 Apr 2025 03:30:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuBAWbDhtW7KpMViYt5p4FT5O6qTEpEmkj/cytsL8+dhwpGg2RUhlad8kpcnRLKbu7xJhkOQ==
X-Received: by 2002:a17:907:7f1e:b0:ac3:1763:cc32 with SMTP id a640c23a62f3a-ac7bc163c0dmr161834166b.29.1743676231141;
        Thu, 03 Apr 2025 03:30:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186aebsm70086066b.158.2025.04.03.03.30.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 03:30:30 -0700 (PDT)
Message-ID: <37de4bf2-c6c1-4d16-9f04-c0d9152dfe7b@redhat.com>
Date: Thu, 3 Apr 2025 12:30:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] platform/x86: int3472: Add handshake pin support
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dan Scally <djrscally@gmail.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Hao Yao <hao.yao@intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, Duane <duanek@chorus.net>,
 platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20250402202510.432888-1-hdegoede@redhat.com>
 <CAHp75VfxjYQ=RzeYUWP7gu=xJ=f1gH=VGXz_cBRqBvkfSH02ow@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VfxjYQ=RzeYUWP7gu=xJ=f1gH=VGXz_cBRqBvkfSH02ow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

Thank you for all the reviews.

On 2-Apr-25 11:02 PM, Andy Shevchenko wrote:
> On Wed, Apr 2, 2025 at 11:25 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
>> pin defined in the INT3472 sensor companion device which describes
>> the sensor's GPIOs.
>>
>> This pin is primarily used on designs with a Lattice FPGA chip which is
>> capable of running the sensor independently of the main CPU for features
>> like presence detection. This pin needs to be driven high to make the FPGA
>> run the power-on sequence of the sensor. After driving the pin high
>> the FPGA "firmware" needs 25ms to comlpete the power-on sequence.
>>
>> This series implements support for this by modelling the handshake GPIO
>> as a GPIO driven 'dvdd' regulator with an enable-time of 25 ms, also see:
>>
>> https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/
>>
>> Patch   1   Is an unrelated cleanup which I had lying around
>> Patches 2-7 Prepare + Implement the handshake GPIO
>> Patch   8   Is a small patch adding some extra debugging to GPIO remapping
> 
> You meant patch 9 here, right?
> 
> Offtopic: I sent you a message asking about AtomISP patch queue
> status, but no answer. I understand that you are kinda very busy,
> still it seems we missed one cycle for the patches you already have in
> your queue. I haven't investigated where the bottle neck happened,
> though. Hence just asking what's the plan with them and other patches
> that are already in the mailing list (I have received at least two
> that I was Cc'ed on).

Yeah, I've been burried in work a bit, so this fall through the cracks.

I've some more bandwidth now and I have a mailfolder with all
the pending atomisp patches in there. I plan to start merging these
soon and to send out an atomisp pull-request for 6.15 well in time.

Regards,

Hans



