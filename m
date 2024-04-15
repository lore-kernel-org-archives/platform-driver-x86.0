Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807F96FE0D
	for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713189231; cv=none; b=QjHfYbpIS6FNUaJ5VvetGcej/+0UfmeLzcWy9448DvChcAHjTd7iv1dblD77HLpiMSu1W78ytcD51a3kkUJ1NhHP8hOoQgbPx2+R5den1fIjy6E+37gera2NjOmJS6mmG04/V6Y6B/LuCpgj8cesdwky9+ThP917IYXhJy+1WEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713189231; c=relaxed/simple;
	bh=e8r4meLLCVFLEJIolyVuTevqPesuuQtIFEMspP+PcH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xn3WcU6+1iTE2Q45G9YPea7OPAg+dIVHIJXXhJvB7/AwteQYjoaoRTskmvIF4xuy+caW5egusBZ3ushkGSPp3ToM6POSaW9akCkRmUOvyOsOZQlsR/f6zyqkZlAf13r6ERMN9jvNKyvEWzCxMxUXxv9Lw7TvsEpsd70KVvvx6s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IOvsPZz4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IOvsPZz4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713189228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EcYetVAUnd8yjyi2R2xR0MIpl/lEgXF/2oYmcl+n/R4=;
	b=IOvsPZz48f2MlSnPgbFUM/b+Z5V1+U4tUbBuf9bnp+Mwze2sfd3qWOHA0NqQZ8FyhtNJ4r
	alfwfzxY66fBJWQ+6ND974dSzQ4LVzLCPviN4U4WiBTiA/k+KqpvEmEfVwg3InRTmapwqw
	EL7b6a1/2CeckEO9mOPPv2ziXRyO/ZA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-orxYNr0sOVOkAO-8CmlCew-1; Mon, 15 Apr 2024 09:53:46 -0400
X-MC-Unique: orxYNr0sOVOkAO-8CmlCew-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a46cc88be5fso214311366b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Apr 2024 06:53:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713189225; x=1713794025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EcYetVAUnd8yjyi2R2xR0MIpl/lEgXF/2oYmcl+n/R4=;
        b=bPYcdmjilAmp/HhTg1lfDwMA13zg8OPJ5shdfdOTnaSuiaJ+hmd9Uq5IRzbGmAWSfx
         AiGxWsRJ/iGN6xd5znwGlGE33D4y3hxDXwzBebcZNmmU+zaIxMiqBftSRYxzrGJWGYEs
         bqSo9cDbneDyrYTbwseWMGiqLfJvF9pla6bEUBimnzsshRHzQNyRvrkmm0Ep3HJGuUYV
         UcoOgcf/dtWbmuKbls+zswnCKpWG8TRWTIPNdK9YJyBc91r0MrUssWjlzUmVjLLRAzHk
         8E90KfZN8ilGnzXsgEX9yzXciOupPIrkTaidAsMHLv6wdse/WXhEuRytQpDkIYTQD3iw
         E9kA==
X-Gm-Message-State: AOJu0YwS/tgf3S26QLEsVd24j++V17j4mbH9UHO2KfAN2ckMclzVZn94
	T/KSindHb+tU0ShMLGAvxAFpDASVLdntNxH4T+4pkRrQvQOfdRFtU0+OifgbMO2BRtvpBfSFgRd
	e/plHuZUKodLHn0kyfCDY61nGTaUponacavcAUtqqP9NXIWNf8rEkf/xe1t6/xa7aC4yHays=
X-Received: by 2002:a17:907:724b:b0:a52:5a04:fb0d with SMTP id ds11-20020a170907724b00b00a525a04fb0dmr2900192ejc.3.1713189225573;
        Mon, 15 Apr 2024 06:53:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWuB5A5SsQOaSukdC27biQIyT9STwuEkf8sqAF9Fp0gfw6he9Y8j97mGuUrg1wtKatTm/QIw==
X-Received: by 2002:a17:907:724b:b0:a52:5a04:fb0d with SMTP id ds11-20020a170907724b00b00a525a04fb0dmr2900175ejc.3.1713189225271;
        Mon, 15 Apr 2024 06:53:45 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id s15-20020a170906354f00b00a5195ee5d62sm5485249eja.164.2024.04.15.06.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 06:53:44 -0700 (PDT)
Message-ID: <05290c01-f458-43d4-876a-da066a6ff39e@redhat.com>
Date: Mon, 15 Apr 2024 15:53:44 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] platform/x86/amd: pmf: Decrease error message to
 debug
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: "open list:X86 PLATFORM DRIVERS" <platform-driver-x86@vger.kernel.org>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, al0uette@outlook.com
References: <20240410140956.385-1-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240410140956.385-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario, Ilpo,

On 4/10/24 4:09 PM, Mario Limonciello wrote:
> ASUS ROG Zephyrus G14 doesn't have _CRS in AMDI0102 device and so
> there are no resources to walk.  This is expected behavior because
> it doesn't support Smart PC.  Decrease error message to debug.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218685
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you, this entire series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Ilpo, since this fixes a bug and does so based on a DMI match,
so the chance for regressions is quite small I believe it
would be best to merge this through the pdx86/fixes branch,
can you pick this series up please ?

Regards,

Hans





> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index d0cf46e2fc8e..60fc71c9fb0f 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -437,7 +437,7 @@ int apmf_check_smart_pc(struct amd_pmf_dev *pmf_dev)
>  
>  	status = acpi_walk_resources(ahandle, METHOD_NAME__CRS, apmf_walk_resources, pmf_dev);
>  	if (ACPI_FAILURE(status)) {
> -		dev_err(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
> +		dev_dbg(pmf_dev->dev, "acpi_walk_resources failed :%d\n", status);
>  		return -EINVAL;
>  	}
>  

