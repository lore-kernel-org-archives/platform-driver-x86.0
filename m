Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC214658A
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 May 2024 06:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714719235; cv=none; b=KyDQPrUn5+xibgnoK7mRk3bV0GVPViYLMQfrclBxxGHY06s0fvZ5W9/nsjrLPQzLKy6BG0D5qwbyMXkKXo0wRJt8PS3CxkJx4rs8sN28wfjw34w2VtsbKq6eDW4NDDAVcO8zCP90BjSrS2OpoYOOIrg74UaVIriIceOFITLyh08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714719235; c=relaxed/simple;
	bh=9r0WUT9EYmthZ0Px23pMVTicuoR4qkYxZY61kpxHnEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=crporFxMZ9owpN8y0jzQQGNB+kPw+ftAv2pkerTn08VOVecx8EJonxExqV0T7ZNE1Q3gZHZlsWfdXnuaBseVjOTtrXKMBotEA1Fj0muTyzUOcHDqo3RjXm1QDk0xGT1MN+NOclEBKNLv9P7ScsN+alUbE1jVGlLmEg1UUT0HX1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R3zjWUJZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R3zjWUJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714719232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7SMs5qrwgQw+h/Z3nYiDsUtQBYzsBB4vdOGUtUdAGo=;
	b=R3zjWUJZP67mFh0YduRo4nF+Jj+2O9iYCWX0dvKw/Ce2mSDciSzRBUPIecETvOe009KH09
	lVjcX43hZggQX0AgANMU5LkCZ3VBNkAVc8+xMjg1TRzCsexkW3nqZ51NEFlUALQGH5P5xX
	n+mbN4gb4ggJ44yQnqMC6uSP4WXFujA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-yCYlZAlNOcCipGCKRKswwA-1; Fri, 03 May 2024 02:53:51 -0400
X-MC-Unique: yCYlZAlNOcCipGCKRKswwA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-572baf39435so1500903a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 May 2024 23:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714719230; x=1715324030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i7SMs5qrwgQw+h/Z3nYiDsUtQBYzsBB4vdOGUtUdAGo=;
        b=sSGzn5bETFXZW1JhXMOqAPpOP7UtvCt3olROxDScZRzipyzevqYtFM94h0OsspEbXa
         e0jq2hvLVByKjQGJt4g8gQ06Z2RyJmZm71q9xxBj6p9bPU7Q4D+T21tzwF+vhKq2fOBS
         S/swyOzB9hXIgom4MXnRmOM1QDDNpMWlCKE8/+wlDifSZyQLNGkTru1bkgwQCbnjpkHl
         3iLZWJ2H1l2cn9Sx6cYrsUXxczHScqSnAfL8jhR3YtRJ3Rl2jXavMPBF6pD7/KbuhUJW
         dOa3c84ZsiD3MonqE9Y2Sb1s2YIB7z29DM684bb6va27ZPBaSUnwcvvB4PCNFccH05b5
         BZDw==
X-Forwarded-Encrypted: i=1; AJvYcCXEblsH8nR6rLx+hQoQxVLF6BfTi7m2kWs2Yfs8WUo6ti2G5sYJ5/qgAhVN53Sxb187bJLjokIji1EDyb4U4wL45Qq0zxSUIRUzgko778AAahIwjg==
X-Gm-Message-State: AOJu0YzvNP2wIUq4pPn+Lj/q0RKPtOjLkwYuJZyGe5N5QBUGywyvNNsI
	w8o6Y1GES9aDsG/P2WZxLfqLMIH4VJGqNeKcywf6FKvmRchJ08WqK1tumf7rnwtq0xCUPFR6dME
	6efNuFELaPToneEXWxxFs+GeBhgnq7ntxf5zPmOr2Zs0nFGlxg41SS9cIpKr6I1jB3Q2KIUQ=
X-Received: by 2002:a50:8ad6:0:b0:571:da40:22d9 with SMTP id k22-20020a508ad6000000b00571da4022d9mr3705827edk.10.1714719230204;
        Thu, 02 May 2024 23:53:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXvymi6HhUa9dnkw6/DSrJwRZ6pkNNf/zpRR/XL1c+d+x3RTZiDl6u19pvNSxYQYRTujaEJw==
X-Received: by 2002:a50:8ad6:0:b0:571:da40:22d9 with SMTP id k22-20020a508ad6000000b00571da4022d9mr3705800edk.10.1714719229715;
        Thu, 02 May 2024 23:53:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c595000000b005729337f955sm1327341edq.97.2024.05.02.23.53.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 23:53:49 -0700 (PDT)
Message-ID: <88d18069-3327-463e-afa6-b80645dfbb7f@redhat.com>
Date: Fri, 3 May 2024 08:53:48 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Kate Hsuan <hpa@redhat.com>,
 Sebastian Reichel <sre@kernel.org>, platform-driver-x86@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>,
 linux-leds@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240502211425.8678-1-hdegoede@redhat.com>
 <20240502211425.8678-4-hdegoede@redhat.com>
 <CAHp75VdSHGXuvGtPBuQSeDLTg0FjPNStcgG3-p07cfVLi_D_YA@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75VdSHGXuvGtPBuQSeDLTg0FjPNStcgG3-p07cfVLi_D_YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 5/3/24 5:43 AM, Andy Shevchenko wrote:
> On Fri, May 3, 2024 at 12:14 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The mutex must be initialized before the LED class device is registered
>> otherwise there is a race where it may get used before it is initialized:
>>
>>  DEBUG_LOCKS_WARN_ON(lock->magic != lock)
>>  WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
>>  ...
>>  RIP: 0010:__mutex_lock+0x7db/0xc10
>>  ...
>>  set_brightness_delayed_set_brightness.part.0+0x17/0x60
>>  set_brightness_delayed+0xf1/0x100
>>  process_one_work+0x222/0x5a0
> 
> ...
> 
>> +       mutex_init(&chip->mutex);
> 
> devm_mutex_init() ?

That is not in Torvald's tree yet.

Regards,

Hans

