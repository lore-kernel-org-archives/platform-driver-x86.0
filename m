Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1148820E018
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125492; cv=none; b=YnIZUzyIX+sJ322U2mqXwJhNc5teetf5Za20sCBPVddUOv5ShQMqMQYRQFPpH75opb0hInq7k3Ar5W42uZ3mhGwIZqs61jFpG1g5xOJyAM7FhnksKqS14tC6S/gGI4w60VMLLMgNUX81rCoHk9w1D2AENpjn6m/eE/C2dpxFLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125492; c=relaxed/simple;
	bh=fa6F82d9BBX9LAITeckMVN3U7zJJfDtzzzABuz5mf4c=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CxWwmGHx8bclDxuYpXP9vL78oUhiv2lj1j0FQSZ3At1PVg3Qeik4Lc2ksGcnOwiIOifvRQPynimWN8mL8qRhih1xJI1EMQH66/BChKBddwsrYKCVBgrwOiYKSvwfFTIVoTtUCSFVTeA/B9ZSgjaIFwwSVqbSH78h6nNH0k7FYGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzxBmdQe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzxBmdQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747125489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wLLFCLymOaVFr953pWS5HxRXuX+XLwuzVP4k1lrSadM=;
	b=fzxBmdQemsABVYY5O9uv12hlgtFM52KoO777dkcwxdwlE501Zur8M3sLsYXB1aMpKdbgNW
	371CWGHBr9GsxkpwdMRZk28GLJeHkaIK+jTaYmNt9tC0kwdXKRuV3gabU45vdMdHdFhVAN
	N7y0zTGqGfAUckmltGvDU0snr8l2vbk=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-286-w-Ex0TNFPkOc9M3GqmR8Rg-1; Tue, 13 May 2025 04:38:07 -0400
X-MC-Unique: w-Ex0TNFPkOc9M3GqmR8Rg-1
X-Mimecast-MFC-AGG-ID: w-Ex0TNFPkOc9M3GqmR8Rg_1747125487
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-acb94dbd01fso643026866b.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 01:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747125486; x=1747730286;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wLLFCLymOaVFr953pWS5HxRXuX+XLwuzVP4k1lrSadM=;
        b=CW/rPOQal8XwoC3LU2pLSev10QBG17kWaSS4rcEJFFA+LJ+rnQ5hrRdzGN8KuXUP94
         4NoUE7RrR3uAYO3c6cQOvnUyLOqapAZUowTypYaHf6MW4LONp8/MbEeD2nFg23qdwwgF
         4ArLU4KzdZYD+EcXJrZNUazqG6Jm66QcSOQq2qQbK1w/HFI7/m2WbFsuw0ynMej/W1YS
         YVvX0awOBb751L0svUv4GfUsK+0ZQvb8zfI/Ll2IO2w0FUAttYTRq/IzIH9WpIigF8pn
         HdNgi4J61MikdQARFj08fx0QMmBKBpfQdcOKNgeIyfdozrzs/TlmMcSri336ZznzspYr
         k9mg==
X-Gm-Message-State: AOJu0YyMOn+BEYGA019W0CdYmOiffBTKoUrrO4TMReJZjoOvwYjAmCmW
	XoeoEmJKbW2M5P8GE6RPiho58WzCjrnVN09sp//d6zRJEaKuHPy1bBL7HJTS0dRRkUnGldxmuGU
	pbY3TCxn3lO83qGrdxsvtE93sv9j3LN5Vlgb1u0le10D/rYwW0xamJHyWODwo9alwF5Cs2XtLim
	XRfdSqhQ==
X-Gm-Gg: ASbGncuJf5B0PqaXawp79mf9L4bfHLoafo7kLkVC2xbKpWESw9vwrKW0iOnW/kXIZcz
	9evd4Aqk76zrE27I3wHaZKd2WGGfFFrqiLRoeXNC/GVxRDPPIR0hQXVy2pP+5W6SaY2yOYqeBf2
	vU1LkjLLb8gxR2n/QHCF376rJzcFUgq4ZYBg/Cy9SLvzqxYxW69Bk+htsOE2/DZkBTkUScT3W5t
	SFkAmFFrR2vnpCHmvHpjKshVbQas8x0WZdOhI70brN2QfurrSuXtBxAZZ5uH0Jxf9QmkWp6+Xrx
	z9Zd17Ydx0eKTHKLAPgfA26hKoggN2tyxxVPY4TKXGHKPHci4dnaKDjkWQKHoyW1RJa20ZNQPh8
	oWVuNGYU42V2Vkaay/I5ANbGCp4WhfGcZhQB75oGt
X-Received: by 2002:a17:906:3b91:b0:ad2:23b6:149c with SMTP id a640c23a62f3a-ad223b61518mr1151210866b.43.1747125486158;
        Tue, 13 May 2025 01:38:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtI5fZb55eqGVMRNAPogeBfueI32p48GGwibAizMRDag6NuYsxFIRR+AE6V0GTOADC9KV9/Q==
X-Received: by 2002:a17:906:3b91:b0:ad2:23b6:149c with SMTP id a640c23a62f3a-ad223b61518mr1151208166b.43.1747125485552;
        Tue, 13 May 2025 01:38:05 -0700 (PDT)
Received: from ?IPV6:2a02:a457:3555:0:7285:c2ff:fead:c51d? (2a02-a457-3555-0-7285-c2ff-fead-c51d.fixed6.kpn.net. [2a02:a457:3555:0:7285:c2ff:fead:c51d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2192cc454sm740004966b.32.2025.05.13.01.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 01:38:05 -0700 (PDT)
From: Jelle van der Waa <jvanderw@redhat.com>
X-Google-Original-From: Jelle van der Waa <jvanderwaa@redhat.com>
Message-ID: <e6cbd30b-5e97-49ba-9f62-2e7e1fe835fc@redhat.com>
Date: Tue, 13 May 2025 10:38:04 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86: ideapad: Expose charge_types
To: Armin Wolf <W_Armin@gmx.de>, Jelle van der Waa <jvanderw@redhat.com>,
 Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20250511113012.9251-1-jvanderw@redhat.com>
 <20250511113012.9251-2-jvanderw@redhat.com>
 <964a9e0b-8901-4f50-a725-9f841fa6914d@gmx.de>
Content-Language: en-US
In-Reply-To: <964a9e0b-8901-4f50-a725-9f841fa6914d@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/12/25 00:54, Armin Wolf wrote:
> Am 11.05.25 um 13:30 schrieb Jelle van der Waa:
> 
>> From: Jelle van der Waa <jvanderwaa@redhat.com>
>>
>> Some Ideapad models support a battery conservation mode which limits the
>> battery charge threshold for longer battery longevity. This is currently
>> exposed via a custom conservation_mode attribute in sysfs.
>>
>> The newly introduced charge_types sysfs attribute is a standardized
>> replacement for laptops with a fixed end charge threshold. Setting it to
>> `Long Life` would enable battery conservation mode. The standardized
>> user space API would allow applications such as UPower to detect laptops
>> which support this battery longevity mode and set it.
>>
>> Tested on an Lenovo ideapad U330p.
> 
> Hi,
> 
> i like the idea behind this patch series, the charge_types attribute is 
> indeed
> exactly what we need in this case.

Thanks! Credit where credit is due, this idea came from Hans de Goede 
(who also added charge_types). I only wrote the code.

>> ---
>>   .../ABI/testing/sysfs-platform-ideapad-laptop |   2 +
>>   drivers/platform/x86/ideapad-laptop.c         | 126 +++++++++++++++++-
>>   2 files changed, 125 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop 
>> b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
>> index 4989ab266682..83eca4c14503 100644
>> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
>> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
>> @@ -32,6 +32,8 @@ Date:        Aug 2017
>>   KernelVersion:    4.14
>>   Contact:    platform-driver-x86@vger.kernel.org
>>   Description:
>> +        This interface is deprecated; please use /sys/class/ 
>> power_supply/*/charge_types.
>> +
> 
> Maybe it would make sense to move this attribute to Documentation/ABI/ 
> obsolete?

I am not sure what the normal workflow is so I've applied this 
suggestion in v2.

>> +                       void *ext_data,
>> +                       enum power_supply_property psp,
>> +                       const union power_supply_propval *val)
>> +{
>> +    struct ideapad_private *priv = ext_data;
>> +    int err;
>> +
>> +    if (psp != POWER_SUPPLY_PROP_CHARGE_TYPES)
>> +        return -EINVAL;
>> +
>> +    err = exec_sbmc(priv->adev->handle,
>> +            (val->intval == POWER_SUPPLY_CHARGE_TYPE_LONGLIFE ?
>> +             SBMC_CONSERVATION_ON : SBMC_CONSERVATION_OFF));
> 
> AFAIK the power supply core does not check if val->intval holds a 
> supported charge type value.
> Please use a switch case to return -EINVAL in such cases.

 From my testing checking val->intval wasn't needed, you'll get an 
"write error: invalid argument" when trying to set "Long lifeee".

I believe that is handled in power_supply_store_property, but reading 
the code I don't really believe that's true? So I've simply switched it 
over to a switch/case.

Thanks,

Jelle

