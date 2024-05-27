Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B966322079
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716796023; cv=none; b=BtekOJzFIq0oYeA/OjqdNeMYTi4H1limSithX7okA5N6H3izS4xpO9gTJGqSU7rULKVi3SuV0zZoWBpQWMJ2M/DiqRPbLDi7RokHllh6LyzmJ3cSGHDmAuf3G/YgzqGDHJ1rAVqP70Gl8rYBNCsmf4ZtL9HLWxxRtWnoTQJGJkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716796023; c=relaxed/simple;
	bh=up9gR5h35rJU8pOhuqgAhLr7yuE1swmfJI5wPrkQu2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDPdRcbivD+E+D/swdTSGEOzEumGlczZA2lFTwOuq8CTMPHCoTIWEML/Hh1bRoBjBbNuaQvQu/WXTA60R9YgXxbuSS0jo9TAUmC3KYqMjrzNtpsNLMgfGiuFEab8y3Uiwtax5Y8dJnmM1JqsO1GmnoosQz44qkMx1sPk57P1cqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HPlgRfXk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HPlgRfXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716796020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xUdBJOlNMDyZa+YCtxUhNojZ0+Jm9ydIv7IASwpGh8s=;
	b=HPlgRfXkobaBJViHb9WXEyWFc3hyx5ME328EG9hNBIHZ+q+hOTKqAwMKysceeUorwb0phf
	OZ6p4ErYVY8tecs4FJz3g4dOr801ZuNV0mMkiaUpWn+AksVlhHaeZUmW8LCE04djpfjlmF
	SLOnUJSpiat+BF1YVAHjE2yp+8MexI8=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-w2_viJe-PMedkUhrAbexQQ-1; Mon, 27 May 2024 03:46:58 -0400
X-MC-Unique: w2_viJe-PMedkUhrAbexQQ-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2e95aba2b88so21145781fa.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 00:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716796017; x=1717400817;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xUdBJOlNMDyZa+YCtxUhNojZ0+Jm9ydIv7IASwpGh8s=;
        b=rOvzUCArUU3mIk36XC7l2kvX7EzIOxCyKJtgAwYyV334w60fJQApgFOE+hTKiOcZ9p
         dbVXm9tCVH3o7K0Etz0y1rCfps+/ups9ubYRyHKfCEWwAVQic1adjxHMm0Uw3vXPe+6x
         kbDPZ4gDQobhYkg6/miyAelW02gi2BKDNMLVueqK8Ip/PXZGuEj+S4tYJ5+PGNXSmc20
         j81Y4agcLG5fkiwDadQdZEO3ID2XTE7SN3iofhb4i98l/gstAupX7bYQaeXGRe/MWjBu
         kx1AZZ810/eTN2Zr82NI/tXMD2o7KG5J8+rQi9ItnY26SaFWr0EpEt97h/1r2rE/CQmx
         X1sg==
X-Forwarded-Encrypted: i=1; AJvYcCWE2Qc3t2COV9smDObF2KQjovtDm3ENelr7TJbt73Md0gELlq+SkBGYd8cf0beJ4nZT5FNjpoD/ZN8LyThR5JB8iYWkS+N05/ffTG3pf1/0LsZw8g==
X-Gm-Message-State: AOJu0YxjkqWU5qEnAM4LHGQdYnqI2Uazj/qVWM2U75cOzqsncAdil7ma
	n8VPZo+wfSwvc5SGGsTQs37bvvHolBrFTCjdZQqDmpLWvVtTjFrqkmjLe6ERFtIe0JByKJz2b+0
	UPCKgX8ep959COURPoUg0u/z91ugJqLOoJrH7ifxuF3X5zsV4yNWDe3PLavDzwNQVEhRUyah56e
	tczeDLHQ==
X-Received: by 2002:a05:6512:41c:b0:518:e69b:25a2 with SMTP id 2adb3069b0e04-529668ca059mr4937163e87.45.1716796017176;
        Mon, 27 May 2024 00:46:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9frOQSYEnspZNGGUngSS7Jz90lPxJiToiZDmSNayrikCC8EQWLhhtJl6llZe5YLjwXIzwgg==
X-Received: by 2002:a05:6512:41c:b0:518:e69b:25a2 with SMTP id 2adb3069b0e04-529668ca059mr4937150e87.45.1716796016686;
        Mon, 27 May 2024 00:46:56 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5785ed2bb6asm4665397a12.26.2024.05.27.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 00:46:56 -0700 (PDT)
Message-ID: <9103e7ae-70f4-4ca0-a18d-322bdedbbdba@redhat.com>
Date: Mon, 27 May 2024 09:46:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Input: silead - Always support 10 fingers
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, linux-input@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20240525193854.39130-1-hdegoede@redhat.com>
 <ZlK4ar5rnqW7F_4e@google.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZlK4ar5rnqW7F_4e@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 5/26/24 6:19 AM, Dmitry Torokhov wrote:
> On Sat, May 25, 2024 at 09:38:52PM +0200, Hans de Goede wrote:
>> Hi all,
>>
>> The first patch in this series stops making the maximum number of supported
>> fingers in silead_ts configurable, replacing this with simply hardcoding it
>> to 10.
>>
>> The main reason for doing so is to avoid the need to have a boiler-plate
>> "silead,max-fingers=10" property in each silead touchscreen config.
>> The second patch removes this boilerplate from all silead touchscreen
>> configs in touchscreen_dmi.c .
>>
>> Dmitry, since touchscreen_dmi.c sees regular updates I believe it is
>> best to merge the 2 patches separately. As long as I know that patch 1/2
>> is queued for merging for say 6.11 then I can merge patch 2/2 independently
>> for the same cycle.
> 
> Why don't you merge both of them with my ack for the silead.c?

That works for me too, thanks.

One challenge here is that I typically send out new touchscreen_dmi
entries as fixes. Are you ok with merging the silead change as a fix
too ?

Regards,

Hans

