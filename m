Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBF916E886
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Aug 2024 13:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724504499; cv=none; b=ecZ6h/L+rcuxdinQofp0yVvvtRO2hRN5jqxwX8fGEoZdsh+zgWGKfvKHkfdZ/c9RK1tgfZyGsdw9rM3Cj7UtCzFQ9YgEVQ6P6pYVvnEIyPQQ+rmcfEgcvkmHDroNvUWf1/y0Fqw65sFMCnkzr6/1UfzQhHBHtmpxYUkMN9XKEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724504499; c=relaxed/simple;
	bh=txq7DO81bdpkm3hwLQ7WHxXwThBlQ1xOCo1W6LasbYY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UK6fsav4NhoxHXKKVwO5pm1G1sOpgb8tpeD7pgCaGV8xXhq3k0dZdShd351jdBN/48CJW4wo37O9irwbm9aMrM2AjD250gWPsn869t2qtCdJQ1jBR/7kE8bQ3Rfxzd9G3ruPCqM85gY2UmPqzgJFR1iLisz58EWrMKZ8C/kx3/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dS6EtGrz; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dS6EtGrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724504496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3FmGV9S+PKzy5WFR+E3I+u/SEWt+C3olz4p/lxi1sdQ=;
	b=dS6EtGrzOej0vNmpx8vLnkAFglcB/UlbpXED2YfTIcer+gOkjR8t6zIHvEjpdZ7OncyLOH
	O4n4kJROsNpuFRP4sRuyLPfrOoScXPAoZlyUnnurvB0UNcmgn6AF2pv6u/gOYaw/t2D/JC
	adHezp3JM90zArqA6aHu3dU7a+ykvu0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-myTIBiTxNueS74OVFQ8rxA-1; Sat, 24 Aug 2024 09:01:33 -0400
X-MC-Unique: myTIBiTxNueS74OVFQ8rxA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a867bc4f3c4so504247566b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Aug 2024 06:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724504492; x=1725109292;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FmGV9S+PKzy5WFR+E3I+u/SEWt+C3olz4p/lxi1sdQ=;
        b=WH7I5Dh1cfpcH19cSyUrHEH/2fFzcy69/DPmEbxPLzogF8Cu88ZVMBfThHLjhatYpy
         ucy/G0XUhqU+DyiuK/eth1ldt/jyX5tcslHoWbM3DV7cyjxoLfn/U81qS52Zki1RSTYN
         ocESj0GTdUTOJ+r8JKNKPoqagXDMp5nq4Co9kUBejdW4ZLPqinTFdx4yIARSUL+6uSTh
         nq2gV8Igxu2c6YKy+rNXHZxrEP2dV4loogVNHF5uEpyWVhk3ELDKynHHrQcJ7NMc0Uq2
         Z4mAOiOwHe5fv83kA/G4szbeKczmtauXg6CdOzobC5NPo1P0YnvNuC1FYunpXfwBnQ5V
         V2+A==
X-Forwarded-Encrypted: i=1; AJvYcCW3cEgW08vzH4Xj27yiyYsQga3GIkAk4VGM0seDO70b4BU3F7H2fRWyw8o7rwDHYulZtVF9jyqvcJe8jUgASeejqt0E@vger.kernel.org
X-Gm-Message-State: AOJu0Yygrzn8Ozq3lDPE2qdpZuerfCfrlv9aN5swvnyOgEoaCSuUfh0i
	k03heIq2bP6/4gmEiOUDyAmSYtbSoEINA2wWjnNHzePHi2jNHmj/Ps/UzhyvWgjcLgaGpMADN1R
	GNTXekzKylbacFLIxPcG9At11aZGADNzgRr4gCGNhTEhShv6qoXRIYQ0ZmDNXG8mUo2CAUmA=
X-Received: by 2002:a17:906:c104:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a86a2f5b717mr457310366b.12.1724504492408;
        Sat, 24 Aug 2024 06:01:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIlvjwfMDr+3ljghp15zPa9PqNiFkpbLpFR5kJ3s1umBFTgioTVRXj5KR0gyqDekiG4WMxEA==
X-Received: by 2002:a17:906:c104:b0:a6f:5609:954f with SMTP id a640c23a62f3a-a86a2f5b717mr457298466b.12.1724504490308;
        Sat, 24 Aug 2024 06:01:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f220561sm397568766b.37.2024.08.24.06.01.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Aug 2024 06:01:29 -0700 (PDT)
Message-ID: <ee22ddd6-0edd-4168-b435-8b422990f24a@redhat.com>
Date: Sat, 24 Aug 2024 15:01:29 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/x86/intel/ifs: Fix SBAF title underline
 length
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Jithu Joseph <jithu.joseph@intel.com>
Cc: Ashok Raj <ashok.raj@intel.com>, Tony Luck <tony.luck@intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shankar Ravi V <ravi.v.shankar@intel.com>
References: <20240823184337.2923179-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240823184337.2923179-1-sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 8/23/24 8:43 PM, Kuppuswamy Sathyanarayanan wrote:
> In commit # 0a3e4e94d137 ("platform/x86/intel/ifs: Add SBAF test image
> loading support"), the documentation for "Structural Based Functional
> Test at Field (SBAF)" had an incomplete underline. This resulted in the
> following build warning:
> 
> Documentation/arch/x86/ifs:2: drivers/platform/x86/intel/ifs/ifs.h:131: WARNING: Title underline too short.
> 
> Fix it by extending the dotted lines to match the length of the title.
> 
> Fixes: 0a3e4e94d137 ("platform/x86/intel/ifs: Add SBAF test image loading support")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/lkml/20240820134354.2aec355d@canb.auug.org.au/T/#u
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/intel/ifs/ifs.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
> index b261be46bce8..5c3c0dfa1bf8 100644
> --- a/drivers/platform/x86/intel/ifs/ifs.h
> +++ b/drivers/platform/x86/intel/ifs/ifs.h
> @@ -129,7 +129,7 @@
>   *
>   *
>   * Structural Based Functional Test at Field (SBAF):
> - * ------------------------------------------------
> + * -------------------------------------------------
>   *
>   * SBAF is a new type of testing that provides comprehensive core test
>   * coverage complementing Scan at Field (SAF) testing. SBAF mimics the

