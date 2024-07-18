Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3C3B784
	for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jul 2024 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721292187; cv=none; b=UGxzlSLf6z1sn1GOhZgZEBUNYXEr/I89U1vpgRq05R3euXQkxR13gamzO+vWKyzokHa7nLcU0fvq0/SQ5nXo8wJF9akoyWe/Sr2qNcN70jwYoIu4pnCoOHdAJqkkroBxrv2fku5k1YYB9g/kI/u+NUZKuKlFwmaDsfuUAUGWJqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721292187; c=relaxed/simple;
	bh=qz51xka9cbOC0s03TK499Msdn+FMZutfOs2fmw+gT20=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=riBu5RR4arwFJr+9SIdvxTgJOXeep2C+xD6fp/VsfnOKWzJhL9V0vffPA1OFm0rjY+67OKc5ISqcWnnLsEWLw4nNs8dVVQOUi2GkJbbq3j90AFOtBJ0mK1OcyGJM0xSgBf2VelyuDoRw01LmrUR3xwc5tTs8uNZB+AVr//RD+Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4bT0aqD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4bT0aqD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721292184;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qz51xka9cbOC0s03TK499Msdn+FMZutfOs2fmw+gT20=;
	b=J4bT0aqDjKUzYVKRwTTy3iXN2eQ9zT/EZtVyh/C9HvIuzW6cC1yIZh4i0L1KDiLh7ffO3+
	QP/O52nSLimypzPHht/mG3KoqIynBKKxGenXOTzzR0vBO6ueBdnV5ub6oa16WPfrEh1VIY
	ZM1kAqfCYCdDTgicL+vHg7c2OMcR7CY=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-s_cC0IFHMVKMTppDZeKBew-1; Thu, 18 Jul 2024 04:43:02 -0400
X-MC-Unique: s_cC0IFHMVKMTppDZeKBew-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-52e98697a36so33698e87.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Jul 2024 01:43:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721292181; x=1721896981;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qz51xka9cbOC0s03TK499Msdn+FMZutfOs2fmw+gT20=;
        b=Kjn1XmoKUw8vPd+4ov1UGsXP6P/69rbM7eiIJFMBYkdzyMueyuwIn6qnULMILoOIIw
         q1Mx/iYwXb0glBaH4Sm92pIu5qWoxNhFYkAHuBFEQlBQOFtMVV27nfBubHi/lHTRu7ZU
         A+PCubff97ttutuVO5P36AgTLJhVLt3Uw66ZHZ03PSzRVCccV/dL/bcSXHHgFM+YpnD/
         Wu8QA/7HVoCMjD6TMbXLKtzbQ2S9byJqX089jC0PPupoID6TplZDE8DeKcc9t02UHsN8
         o7zx21oBs+KIn4pMWDdlZD4+umK+h+Jv64qrvuA2u3/pAkIC9XlZ6xtzcJmRZdcUVYS4
         AkGw==
X-Gm-Message-State: AOJu0YzAzZLoh37pFJ+A9Z2DWe5pRZy7qxyK3HEmgYDUX6tr2M0mD1ri
	szLIUXlKJk6pIVZ/bv2vAaEEJXNMRT/bpdDga0xBYkFOSD6LkI9IIJK/1czFijO3sy/KYvVeK9g
	O8ap1IZVQ2L9O/Il1gBMvhicYtmiSI8uqeRArVL8ArSZ0eedo12VY74ldE+eZqMh6CatPlDuYvQ
	nXzrQZkw==
X-Received: by 2002:a05:6512:3404:b0:52c:a070:944 with SMTP id 2adb3069b0e04-52ef07a6de8mr51795e87.23.1721292180781;
        Thu, 18 Jul 2024 01:43:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuwiAgOEtW/6pB6dct/SCs6osvcrRqZ/KrjeLcI1XGWODPvOy2uUKOeNpoi4CJMptbwfTngA==
X-Received: by 2002:a05:6512:3404:b0:52c:a070:944 with SMTP id 2adb3069b0e04-52ef07a6de8mr51787e87.23.1721292180323;
        Thu, 18 Jul 2024 01:43:00 -0700 (PDT)
Received: from [172.18.228.53] (ip-185-104-138-47.ptr.icomera.net. [185.104.138.47])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ef079f886sm15421e87.284.2024.07.18.01.42.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 01:42:59 -0700 (PDT)
Message-ID: <cf2af03e-d2ef-4c0d-84d6-52d01d6de180@redhat.com>
Date: Thu, 18 Jul 2024 10:42:58 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Hp victus hp-wmi code
To: Matthew Blankenbehler <spectrino3d@gmail.com>
References: <CAGRv0CguAT-vcE8AV+0egxfzmS1PZr0ukwmgvY9TqO4zzLv=FA@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
In-Reply-To: <CAGRv0CguAT-vcE8AV+0egxfzmS1PZr0ukwmgvY9TqO4zzLv=FA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Matthew,

On 6/17/24 4:23 AM, Matthew Blankenbehler wrote:
> Dear Mr. Goede,
> I noticed you committed code relating to the hp victus laptop performance drivers for the hp-wmi driver. I am not too familiar with kernel code but I have a different model not listed in the driver its 8BBE. I am wondering if the board needs to be added to this driver to get the full potential of my victus laptop. Model is r0085cl

That question is hard to answer without anyone familiar with the existing
HP WMI Victus support (which I am not) taking a look at your laptop's
ACPI tables.

I think it would be best for you to email the author of the existing Victus
support: SungHwan Jung <onenowy@gmail.com> about this and put the pdx86
mailinglist: platform-driver-x86@vger.kernel.org in the Cc so that people
on the list can also chime in on this.

Regards,

Hans

