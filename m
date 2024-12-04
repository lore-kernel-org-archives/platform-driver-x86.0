Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE171BBBEE
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Dec 2024 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733318382; cv=none; b=da5RFxsu5JPR1fg/wnf2Q/4mBNH6yxbudqUs7JW4RaIgaQGLcIfIr+9YjQRDZ6KY3zx8wk5yiNR/mZthO9gXpoJ8wGj73LZ6miG77yH9ZfOX7pK0dqU41YR6RWuOPnjp0SwyFQwNHRqI+lGD0GD74imyJob7oogKcXMTXDSAD0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733318382; c=relaxed/simple;
	bh=X6VJksb3Co/8r+7HnSfYaiwXYyLcZSRTBftTOo7GcGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tr2JnWMeAuLPYjfwrvQjE9ORPtRiykMC1+++9zuU79NwVo54MVwu5Bi3FhYUCM6+ajWIuIae/MJaoLG4TjEYnl9Bd/mZsYbjuUMRCQV/FYkuqYOW28WCGcZ5ksADFjKTBe5W8sRo2n/Q2WNbP0j51J8rjS0UM3RXV+M39NgW3O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PO/9cZ8E; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PO/9cZ8E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733318378;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aflk7KcI1FKNdunouCjLBd6UrShNW8Pib6fl21i980U=;
	b=PO/9cZ8EBVXgQbwA1QMvgIMSQhu6gNuM+3gJCKkukhkodVLEpBiXrRjqV/rtDVdtSfYe1r
	e8HoVlBgB2YalGuRjoNsYWV8NUpm+TqUK2u/AvlbRV+OmH4EARkkXSkqwEwWHcncMsQH++
	uM4WKvFEgxfP1pPiaaWTk0K+2Ilrnxc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-Hle-3kIuPVChEuz_wInUgQ-1; Wed, 04 Dec 2024 08:19:35 -0500
X-MC-Unique: Hle-3kIuPVChEuz_wInUgQ-1
X-Mimecast-MFC-AGG-ID: Hle-3kIuPVChEuz_wInUgQ
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-aa516e52376so460046066b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Dec 2024 05:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733318374; x=1733923174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aflk7KcI1FKNdunouCjLBd6UrShNW8Pib6fl21i980U=;
        b=s8e7uSUU2kVbslcuXx7b58/pzUAvBtCyYNwfiELqAV804AP2Hg2hcui1w+4JN4tqqF
         B2U7MLcSjguSuDe4ZefFS/OchsD791DCJajWDjqVJlFnbVfCFE7bfAwpWdzC+QOEJ8q/
         P8et3/XuaCONeSKjEzIlH2eWPzqrYNqBS9o5EAXW7jkVGnQ9uWhU8jq1Fhumlo4K2SzW
         Ut91yqjM/EyWMKX61PCA0yKxA3X9MVRQahHdbA6tcFnz9Z1xxoIFa3DnD8lm61eTucWc
         X85jDHh/Fh+vUrQnhoY3D88tyWoUKUP/G2xIMmoFDMTzS6oLgSW5DJkwmaFrs1dpGn6d
         WlNA==
X-Forwarded-Encrypted: i=1; AJvYcCUB3zniPUpRZkourwOUPPfIn2W5KtuCIyaxPmpvvzXUJxgUWZduP/sytw++xmbuROHhQIMRudpk7YnJFRziVvijHB+7@vger.kernel.org
X-Gm-Message-State: AOJu0YwRlJQcPaBtT2grQS4ty37adaqH8vbeZ8qhusehRl1FqnONRHvO
	N/RU7beaoaVGo4mOiBUz2Fo6YVU59hZl1whZ5GES8Dwfc5Iw9kp7LHzmzr/knqKk/rsXl/TL5tO
	i9nd7ZiVDrpM81VZI2WNaQMND4GgHnAQ1uw5jdKzZBbVsKbzoroItGxC7OiLWXjFoUtBzXc4=
X-Gm-Gg: ASbGncszy725EKJRYL+i2yNFgLc3KN98yD3O7A0/8ehAWhFNPjBS0zf+9CWHkaGTssT
	D1Mc1R/6GRplEm96ugNyIYLfKh8k+0Ew7HOm+IMS7JqPZAdukob8GSwLrVvFQrpYOwVQ6QhPNm7
	RhJ5tAiWFqivpottsW6vTjpt6LAtMyTSg0iXVrOdwvgRjjrq4TubzCkEhWNOF2m1mvcwp9YjXqe
	m2ktcEjN3JlAL7KwJGzVTQtC9M2lKYI9x6R8d8SP3QudYa45KsX/jiOGJPEmdS/yIM+frV1Iw4D
	zqrrsCRsntuZvKk6Zb7q7ewEx3YwpA4N/w8lLpfkV5lBgwvZ8kVtEQbNeB8HbS+ipKse+uV0F60
	y+On06Enl60lwpSOk7IYz8HjO
X-Received: by 2002:a17:907:270f:b0:a9e:b5d0:e5c with SMTP id a640c23a62f3a-aa5f7f6f2f8mr447313666b.61.1733318374283;
        Wed, 04 Dec 2024 05:19:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPusTDYqJAvgkava+BJPuvnHbBuW29s5Y3nopYcUqtApT9uIE6YL2yxsD7aJVqucrPnAU0vA==
X-Received: by 2002:a17:907:270f:b0:a9e:b5d0:e5c with SMTP id a640c23a62f3a-aa5f7f6f2f8mr447311866b.61.1733318373906;
        Wed, 04 Dec 2024 05:19:33 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c19d9sm737913566b.37.2024.12.04.05.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 05:19:33 -0800 (PST)
Message-ID: <87f9c6ae-e409-4ef5-a2ad-319cdebdf577@redhat.com>
Date: Wed, 4 Dec 2024 14:19:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel: int0002_vgpio: use gpiochip_get_data
To: Rosen Penev <rosenp@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <20241203233505.184612-1-rosenp@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241203233505.184612-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Rosen,

Thank you for your patch.

On 4-Dec-24 12:35 AM, Rosen Penev wrote:
> Instead of using container_of, we can pass the pointer to
> gpiochip_add_data and use it.

Yes that is possible, but why? What is the advantage
of doing this?

Given that the struct gpio_chip is the first member
of struct int0002_data it is actually free as it
turns into a no-op.

Where as gpiochip_get_data() is a non inline helper,
so your replacing a no-op with a function call here
I don't see how this makes things better?

Regards,

Hans



> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>



> ---
>  drivers/platform/x86/intel/int0002_vgpio.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
> index 0cc80603a8a9..7ce0774b3896 100644
> --- a/drivers/platform/x86/intel/int0002_vgpio.c
> +++ b/drivers/platform/x86/intel/int0002_vgpio.c
> @@ -102,7 +102,7 @@ static void int0002_irq_mask(struct irq_data *data)
>  static int int0002_irq_set_wake(struct irq_data *data, unsigned int on)
>  {
>  	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> -	struct int0002_data *int0002 = container_of(chip, struct int0002_data, chip);
> +	struct int0002_data *int0002 = gpiochip_get_data(chip);
>  
>  	/*
>  	 * Applying of the wakeup flag to our parent IRQ is delayed till system
> @@ -211,7 +211,7 @@ static int int0002_probe(struct platform_device *pdev)
>  	girq->default_type = IRQ_TYPE_NONE;
>  	girq->handler = handle_edge_irq;
>  
> -	ret = devm_gpiochip_add_data(dev, chip, NULL);
> +	ret = devm_gpiochip_add_data(dev, chip, int0002);
>  	if (ret) {
>  		dev_err(dev, "Error adding gpio chip: %d\n", ret);
>  		return ret;

