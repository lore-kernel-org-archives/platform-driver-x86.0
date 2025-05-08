Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E872528E1
	for <platform-driver-x86@vger.kernel.org>; Thu,  8 May 2025 14:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713197; cv=none; b=jSUI9/i8fw+6IA+H1hDVu9kKunBevhr4AH3Odlp9votCcbYXMkIgJykVjvrYiBfgFKQr/rJrYzP5fVQIbbgmeqpGT4V8Y2OvISTih6tMhMQFetLbrL1fVQhjdNFqEpUuS0g9BKs2n9M8Gc8uPyatKH0AuvLGcq9R/S9NVVxoV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713197; c=relaxed/simple;
	bh=kBdo3d/KoEhV9EUkuxZCI2cRaHqHBylhi7zJ+VTyZVc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=JxTdxHmnXKtt6Jg5m1R2vwVdpx0U2H7OqU4L9qT95surfo/dFc0sfiolGqGwYeyM1caZWNU+gTy95CVxt4ncOx0N97bcKKn3KXdqfzxHuSQ+SpKjFNnu4BgnSq4gJy/YcTp4oW7Od42i8QJHQgW7tkvqPBd1JeAkVZ2aelZdjaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATxvCOUt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATxvCOUt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746713193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5ebO/qCZ0JEZ4vqg1hdJ8oPvjXAfo3GcradBLxE67v8=;
	b=ATxvCOUtV8RBv4pXcvpAkAebc5o8mol9bgVWSYDC7YQHjx8j//CHX79vPQpLVxEXped3Pt
	JRsI0sQ6l5QbMRXNPHHqbYsT5BX1THz+TV8hq1F8Z3k505GvKh/EjxSO7f+d4AefKp6SR4
	pBRsyHdCGb8zU/sPF7sqn/VHo3cwSjg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-NZtpdcJrNquQb-gHJ1GhIA-1; Thu, 08 May 2025 10:06:31 -0400
X-MC-Unique: NZtpdcJrNquQb-gHJ1GhIA-1
X-Mimecast-MFC-AGG-ID: NZtpdcJrNquQb-gHJ1GhIA_1746713191
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-acb94dbd01fso119801866b.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 May 2025 07:06:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713191; x=1747317991;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5ebO/qCZ0JEZ4vqg1hdJ8oPvjXAfo3GcradBLxE67v8=;
        b=AQXj0JWqKWb2mqjMT/K8Nyqma3neCNJJIJKm5ujSjEz18X0FiGW90SN0RF0P3psO1n
         ersUIPvO3Lr18JhPBEb9cWMuSjKpqHbv8m8WIldNmlmfBiFekNvxoP2EErZXqox3t3xt
         dLeKUID162qUrPcVYmjkQuuhTbYus7IoaWw7WIVoP+JZDt4S1/5aDyC39gEQdr21ankP
         +kLct9D6agzwf0KFm/kaIpLIiQQiqKSNPYdQZmI5uSEO8FMetw2BbdJpfQnWLTWVzIAJ
         IX3wN2a2gKJQQ0ffEcbbhHC8t37EI8wwj8DMQUxRhpB3CcAoTIiS8WgRULyuAEE4VSpx
         YMHA==
X-Forwarded-Encrypted: i=1; AJvYcCVvHvrp6FPdbPlV8YIaGzpm0EJd1viQo5x+rywEMMceNqdo3+azx6nODwGRlfxzg4zK5w0RGlx0vU+wnyljyPBlDKEf@vger.kernel.org
X-Gm-Message-State: AOJu0YwhIuVzb9MDlfvW6LOBaGlELLPyEWAWxGTUr4a1u+KjyMya3p4O
	jrehUK4wlzHt/vB2YjzLom4KcmPWMyDYyrzNczrKWA9ZACLc8ccCG+x8V5i5+uLl2Ss9SPwBRG6
	FSWmrfTcWIw3aYFLzjvGCbbzzXWlT2Cg+G4AD3VwOWA5iWAcnWk+2bIcPj3lFJ8QwKpB4v0s=
X-Gm-Gg: ASbGncuyK0j3DQ15znk2L28vjP81roGI04n6mnyfs8Ixyp3kGFAaJZcUc6wC13QEsKh
	MdNLnaXvQ4TYIzNfxlG/eLkrkZQYHHsthWhdWy2cNLD/MMh8MW02xNtzMniX914+JzO/6vPwZgy
	CAMDlIiTUHfda58ug8fQPl6/i9Ohl5DfJwK0th9uDIJHyWqJ0Qjh+VLyLhzSDkCXQV3ylxYZhnD
	ktwiLdT9rVfIZq5vl3Ja4/Vn93rbbT9GpIEApkH3P4c8nIkeX74t4vvFNXC2LYrWKADG7Ht2SF2
	OZA5AqJVRGbzK/Sy1jkTZuhrvgJqJtqmULyQLDcLXCu5UFATSJ4+sRIouVzWr4ZtGfVfI8W3ugz
	XGifx0a4XRTHLyH5DPrMlH4SSiPRVrFBCNnYv8lzPxLYbS0vkYmJRfr/8x2Zq8g==
X-Received: by 2002:a17:907:1b18:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1e8dbe8eemr783521566b.48.1746713190595;
        Thu, 08 May 2025 07:06:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjk0Ylim6P8bbYmFioBSZ3Y8jszu127kHRxjA4923VyGRj8RfhDIcxpEg4n97baRRqmai8mg==
X-Received: by 2002:a17:907:1b18:b0:acb:52cb:415f with SMTP id a640c23a62f3a-ad1e8dbe8eemr783514766b.48.1746713189971;
        Thu, 08 May 2025 07:06:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad214d24f07sm11348966b.93.2025.05.08.07.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 07:06:28 -0700 (PDT)
Message-ID: <1a5cca5a-4bb1-4ac5-aefc-b1ef0e693914@redhat.com>
Date: Thu, 8 May 2025 16:06:28 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] media: atomisp: Switch to int3472 driver sensor GPIO
 mapping code
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andy Shevchenko <andy@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 platform-driver-x86@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20250507184737.154747-1-hdegoede@redhat.com>
 <20250507184737.154747-7-hdegoede@redhat.com>
 <CAHp75Vc0UZOXbfhjeq1XCAwt-2SX-SGOYomHhEfvx5HuXaxf1g@mail.gmail.com>
 <6d5a5cc2-a7b1-4032-82cd-0250f345dca9@redhat.com>
 <a8a6257d-854f-62c2-dd63-c3d2cbab31a5@linux.intel.com>
 <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Content-Language: en-US, nl
In-Reply-To: <f8a321cc-2545-4048-a257-56c3c5dd03b3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 8-May-25 3:56 PM, Hans de Goede wrote:
> Hi,
> 
> On 8-May-25 3:48 PM, Ilpo Järvinen wrote:
>> On Thu, 8 May 2025, Hans de Goede wrote:
>>> On 8-May-25 10:34 AM, Andy Shevchenko wrote:
>>>> On Wed, May 7, 2025 at 9:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>
>>>>> Replace the duplicate code for calling the special Intel camera sensor GPIO
>>>>> type _DSM (79234640-9e10-4fea-a5c1-b5aa8b19756f) and mapping GPIOs to
>>>>> the sensor with a call to int3472_discrete_parse_crs() from the int3472
>>>>> driver.
>>>>>
>>>>> Besides avoiding code duplication the int3472 version of the code also
>>>>> supports more features, like mapping the powerdown GPIO to a regulator on
>>>>> the mt9m114 which is necessary to make the camera on the Asus T100TA work.
>>>>
>>>> ...
>>>>
>>>> Don't you need the Kconfig(s) update to have proper dependencies all
>>>> over these cases?
>>>
>>> Yes I do, I thought about doing this already but forgot to actually
>>> do it, thank you for catching this.
>>>
>>> When I've some time for it I'll prepare a v2 of just this patch
>>> addressing this and your s/then/than/ remark.
>>>
>>> Since you and Sakari are happy with them patches 1-5 can be picked up
>>> and merged by Ilpo as is, so I do not plan to send a v2 of those.
>>
>> Thanks for the quick reviews.
>>
>> I took patch 1-5 into the review-ilpo-next branch with one typo in 
>> change log fixed (reser -> reset).
> 
> Great, thank you!

Ilpo, I just noticed that Sakari typod his Reviewed-by, it reads:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

and this is also how the tag looks in review-ilpo-next now.
so missing an 'e' you probably will want to fix this.

Also Sakari gave an Acked-by for patch 6/6, but since he did so
in a reply to the cover letter all 5 (1-5) patches now have:

Reviwed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>

so besides adding the missing 'e' you probably will also want
to drop the entire Acked-by.

Regards,

Hans



