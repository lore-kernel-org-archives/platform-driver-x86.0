Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97912561F
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Apr 2024 15:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712591084; cv=none; b=bXigvg8S97TR0xofpVnD5RbMX1Pik8gIXYfvUOpJ4VVXNr3JdartdKg2ek4xcMW+TYUgKAyYrlUK9opnb111qKUGzcImBh8z1uGtzqMGYhEmE3+SUcUvZ9TdqwsnwgGU5ggNEjh5nmbJSONnYfNX+jJ8ZlPyNdl1cd4g6SaIZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712591084; c=relaxed/simple;
	bh=mqMLFl19k4O+r1v+Ko44H+Jkt+YK9fA6FCQAXAxxcF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bys6sx51XY02tMrg7eq1lMU7Mo33NwFK1Otp9j3MXuKHOJfFFLizk8jBadN2PDfS7MPzv9GRwNZFQs+lQQu2P58WYFK8A4qw4UMunD3o5TGSfEx1Jm9lMNcNuZdpIC/CT7YzBbz2gLVG4PZoYTc7GGkPDHIPdz1hPqZV5MEKq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TBm7eFvl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TBm7eFvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712591081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LhbKqpKNONC520TlItJ2WGaYvUE58gAmX0r81GekJNc=;
	b=TBm7eFvlg9Y6YOs04m8bp7hYyRIBYTDyiuyeY4hgYEUhc8AOEa4j2o6YlIBhco31m2WLTI
	J6GSuUbhIeNXPwZZbuJk5nHrC7Dtm5Qr7InAxzkGjslMi53m1J6A3qKDe8tWMYnuT5jQIN
	ATgi1KRwsJ4/gQ2h1LeCfGe8xkWNIyQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588--8Y83bcWML2lv3PaJatxgQ-1; Mon, 08 Apr 2024 11:44:40 -0400
X-MC-Unique: -8Y83bcWML2lv3PaJatxgQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a51c76700adso122004566b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Apr 2024 08:44:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712591078; x=1713195878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LhbKqpKNONC520TlItJ2WGaYvUE58gAmX0r81GekJNc=;
        b=HS3/XhqjsPifroxM4LRYRO0LBQMIdJZntVaEvVubzk2FXXtpony//meGh7SDElqp0m
         oqCzrhMyczcLS8KHvxSVo5Q1pNaCttjZCJJKC91Ea0SELOEjfDvtVAAhY9nYkJYd8zKU
         br4OMqSHukXqij4YBY71U7wxKbQdL4TZmC38XjlBaE8KqVyIWYXkAOxoWBO8GcLknU3Q
         xcLur1vXqNFD2rq/mQHLbAIi6CC6sAHxg9qvAQYHrszznioLUCxCA6GRRg3y1tgi+9xh
         3l7RbtufqSVTVauxFHWGKcDtAVT1IENmN6122z/a04WGlyUFbV5adPeKIjIpqhVCHVR6
         nIfA==
X-Gm-Message-State: AOJu0Yz2iZGtQRjuX1ZjcFqVUyqa9eC66ecsKBFwRCiyeDt6TmSxVpEh
	v4OVrUGCJ7Fd06U0DOkNjZvPMar33nNHtrgJh/dX5r4+8l9rAJD9nByZ4i5vx8tQTNFVeyXoeoy
	Pec6p/cxs5LVEXFrplTcLzKEDBS/mIgCzDh7cJdGkBLTJEbGp6tGCRBL42kmeYQ1BY9bnmNmraI
	0WOAetyQ==
X-Received: by 2002:a17:906:fd8d:b0:a51:e188:bced with SMTP id xa13-20020a170906fd8d00b00a51e188bcedmr26763ejb.37.1712591078860;
        Mon, 08 Apr 2024 08:44:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDnhFjANQrO0mRTewA23YDE4zi3Il4K9RdIR4EHAWS8d379H2NGYeVl4b4V1l5oc3/+miHmA==
X-Received: by 2002:a17:906:fd8d:b0:a51:e188:bced with SMTP id xa13-20020a170906fd8d00b00a51e188bcedmr26749ejb.37.1712591078569;
        Mon, 08 Apr 2024 08:44:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id qf15-20020a1709077f0f00b00a47439647efsm4569034ejc.133.2024.04.08.08.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:44:37 -0700 (PDT)
Message-ID: <451bb318-aeb0-466f-9507-4983dcfa4858@redhat.com>
Date: Mon, 8 Apr 2024 17:44:37 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Silence logging for some
 events
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: platform-driver-x86@vger.kernel.org
References: <20240402124351.167152-1-hdegoede@redhat.com>
 <171259093806.17776.3713671881492753491.b4-ty@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <171259093806.17776.3713671881492753491.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/8/24 5:42 PM, Ilpo Järvinen wrote:
> On Tue, 02 Apr 2024 14:43:51 +0200, Hans de Goede wrote:
> 
>> Stop logging unknown event / unknown keycode messages on suspend /
>> resume on a Toshiba Portege Z830:
>>
>> 1. The Toshiba Portege Z830 sends a 0x8e event when the power button
>> is pressed, ignore this.
>>
>> 2. The Toshiba Portege Z830 sends a 0xe00 hotkey event on resume from
>> suspend, ignore this.
>>
>> [...]
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo branch only once I've pushed my
> local branch there, which might take a while.
> 
> The list of commits applied:
> [1/1] platform/x86: toshiba_acpi: Silence logging for some events
>       commit: 0dd50b3e2c3d651ea972c97cff1af67870f3deaf

Thanks.

Note I had also applied this to my review-hans branch for for-next,
I'll drop it there.

Regards,

Hans


