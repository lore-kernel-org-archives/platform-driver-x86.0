Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FA3264633
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Apr 2025 08:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102236; cv=none; b=q4NjuuBtSVNaXQ/h1+ljvFTsAacTbRB8CAcuq25TtBY8f8/kn6fB4Ue2KOx5Dson98Mw1XmPfDAe//QHERaMHYjJ5J/rptFXwwjM/Z6WrqjT7j2lhGKPAQNUOjr2EUdg6lIzjdv0rMGTHP+FLPVR6nTTGCnSy7eek9tiHx/APKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102236; c=relaxed/simple;
	bh=kxoU5HcQ+O7M8SUK0YQ8e6eKmlicd6hex/t7nCbWbt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mu2RZJ3Nks+/0fyMipc4C53djJPDA22dloBRAtiO87NfrD7JZDLvAxpyFsQsJPnHxnkqrq1r2DiZV057kj4AMFz0P+fPtqx25EM7lsuff2CRWRHT44iyrNm6YfNeLh/IsMORd1yA4EJlc5WuOe5pk1+5rGWYPWOFjZtAEGgII34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DrGIhWY4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DrGIhWY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744102233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zQopZXdiy3xymCGR0rYIHwGprz+N88tu6wezwOaN3Nk=;
	b=DrGIhWY4m3VvwhBrqogO2sFCF6jCBayMUjO0jde6aMlzijXCJyk0GE3QwvwsV2Gn+hlPj7
	f3DBlPrZJ9gJSL/6HUIHr+iSimc5qp2p8kIJ09vycS4Y1KEqWiduxoN3V1mvxTVsMU5Z+p
	Ldr7s0qWUTqFFTplouxH86MdWPSVN8M=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507-JVk4Q9MxOiikrv_XALoKaw-1; Tue, 08 Apr 2025 04:50:30 -0400
X-MC-Unique: JVk4Q9MxOiikrv_XALoKaw-1
X-Mimecast-MFC-AGG-ID: JVk4Q9MxOiikrv_XALoKaw_1744102229
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ac3d89cc4f3so422176866b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Apr 2025 01:50:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102229; x=1744707029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zQopZXdiy3xymCGR0rYIHwGprz+N88tu6wezwOaN3Nk=;
        b=O+ASLNNkVRqaMZzl6FHnWdEZCHp7NQfpSrAHRR0BhkPc+tLrNqj+tziZcCEreB+Ugv
         XClRaGMDdyR0UrjrW6yr5E6ueIAIBZ7Sg51d6asjvS1w9WvtQ1Pf2BqG0Qkbj0UuK5EA
         L6ThZGqh+YSbup151OpNxCpatKvOLpp9JZn39BF7sshmIJXGOtu8dTrxzu2qC+B3TqcD
         8Z768kF5cQ2LgWPVDz6TTMNP/8/oqHsbH3qLMfX11ILmE8nWeMX/FvD2C6WaWSDZHjgR
         gyKZvv0zjnEAYw5dYBYcZm60fLJzNr9ugbkxDu5zB8jNBxSZytYqFo1JHrtR+ZZqREeV
         EJgg==
X-Gm-Message-State: AOJu0Yxu7GaA9XI3+dIPaUElIr3utL6WOAzN/Ze0WBa463bEaYaruECK
	GE/AcYQiS5jLMMoBgnfZeNlr8cGWlIMCuQksi3nHMvLgBMGh7ia4LuEWem72kOuv3vbszLCB+J7
	f9v0JxUkY1ojcwVWlDqIc0NGgiImbIaKflDEvfgh9XShu+8w0pTUV0H813uiqVtndKWVfDZ0=
X-Gm-Gg: ASbGncu78/sULi++cmJi5YPwyqvNJuBf3R7eY6JzNXYkZqvPLGyX9xUq+STp/rHuEpj
	+gUkDTSjB8CA0Qnu2/lO7nsYGWuEZsDxsD+xaVajf1pkP33P9PIa5gps5YV/Vg3TSG/8cDb/Gwg
	p/aJSa1q8AZgtdgdPwntwhmvsu0gmuvQSsY6XMFyvXNfHxidVAr2Mfg+r+KLfGYoHDACug/FJg8
	COG9I1XQz0Z6FYL+hlPW5JJv0JjvyOvgXOB9uD6mkrPI6NrxtF7fCApCwFVvaVtOCU8p663sog0
	SR1UNCXxiw0DOuEKXYwg1NAjsLKd4Gb6+FMwKKMvH45QQinxVb1Tb1qywyy6XzhLXubVafmxkFJ
	LHTDPL0Wy/n7B64I+OsIZOGhfi7nqfu5iNNsYKaV2tPjpF7rj6+2hlnMqXuQ3gLkKHw==
X-Received: by 2002:a17:907:1b11:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac7d6eb8de1mr1531978766b.43.1744102228789;
        Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpsTVCILDyaXBZ5lkeFvik1nQEDh5z5n5qIxRWyhWTeQPllYWoHbltidBzTa2yJlwiabVPwA==
X-Received: by 2002:a17:907:1b11:b0:ac2:dfcf:3e09 with SMTP id a640c23a62f3a-ac7d6eb8de1mr1531976466b.43.1744102228388;
        Tue, 08 Apr 2025 01:50:28 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe99b30sm882797566b.58.2025.04.08.01.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 01:50:27 -0700 (PDT)
Message-ID: <56826617-5e91-418f-869a-bdd24bca0f0c@redhat.com>
Date: Tue, 8 Apr 2025 10:50:26 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86: convert GPIO chips to using new value
 setters
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Santosh Kumar Yadav <santoshkumar.yadav@barco.com>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Bartosz,

On 8-Apr-25 9:19 AM, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all the x86 platform GPIO controllers.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Thanks, the entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Regards,

Hans




> ---
> Bartosz Golaszewski (3):
>       platform/x86: barco-p50: use new GPIO line value setter callbacks
>       platform/x86: int0002: use new GPIO line value setter callbacks
>       platform/x86: silicom: use new GPIO line value setter callbacks
> 
>  drivers/platform/x86/barco-p50-gpio.c      | 10 +++++++---
>  drivers/platform/x86/intel/int0002_vgpio.c |  7 ++++---
>  drivers/platform/x86/silicom-platform.c    | 11 ++++++-----
>  3 files changed, 17 insertions(+), 11 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250401-gpiochip-set-rv-platform-x86-86788597f4a4
> 
> Best regards,

