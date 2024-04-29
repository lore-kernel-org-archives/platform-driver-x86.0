Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F360F2941F
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714387801; cv=none; b=L7myF7VLCnSIr2ufZHLAM8EJkHbBHN0xU+o9dldoIi+B5PczcXh4+J/fHmlm/zkXLzoUa5ibCqdXFAZcLuUEXLP9fZkiu4m3yS0XvI/gzYBLh2mxGuDlJ8KhWyhYPMiuIAew/AGyEMG/HVyvlUBI8/zCGAc2hJ8kzqK5XCJxg8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714387801; c=relaxed/simple;
	bh=UGloWyBZuHazCTnA5JUy0JL498lI4VHlVYFtMASdMdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nxfdnkTHLducLpcXTBnafSX7wO7m26FXxK6kVMvGkYHiX6TZHzSD53Ntz8/1e5vYRJtMzZ/D1u4BBAHTJ6eM/w79g/XJ+AMzYfO4FWSIMBdjzR/ErDNnREvy2bnygFkOpb29RLcTrG0rhkQujpDmg5H4MdPbnoOINTQcNl9Kwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DUur3TSw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DUur3TSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714387798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vcd2JWrf3E7vjtQeMf6O7h0qouO2cxaE02l5lL6WC20=;
	b=DUur3TSwicT1Nhu4HczvPlGQF78yXt2mcvYkb9T8VgpSNL5cfRUQUO+TmAYKV08qGLnsZg
	NIAKVQC2bd9fcSWWhMNL1PETPYq47gN+UZKDQoAHjf4W1sxhchocbPNHA/sdkF62JLoEPC
	ra5wCSmiRjeV5HFavlWeIdhTbYxjj0M=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-ZD-kX5FuNgm1kEdlPI-3BA-1; Mon, 29 Apr 2024 06:49:57 -0400
X-MC-Unique: ZD-kX5FuNgm1kEdlPI-3BA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5723f3d81caso1368921a12.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 03:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714387795; x=1714992595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcd2JWrf3E7vjtQeMf6O7h0qouO2cxaE02l5lL6WC20=;
        b=EqiGuL4TZjpuruejneK6rgN89GJmjHdydTRCHRv8nsxV2P2VOFx6vWY0/KpGXckcgl
         qny5bJ1Q9BK0aEMIeDxyWmFqocUKEcF0VbvkNtVf/o0dk6fWuv7G8sQIHdW/Qm+pqpgl
         krxnlVH6S7aWJ5IQ2L6umm5f4f4XzeWFJ7iOmatSRkRa9DJoXF8HSh5qF8WtMxLn+JWB
         G9qvmTdeUqdklTxPELS4EvkfUvHDQvWu0Vbkn/D9hlKnMChL4RLgBCExRlNr2b7wSDiG
         4GFH19pOG7Cd00LAB0+4ztaWJ7AQKH9kP4gX2xJbrzHsfuETdh5FM3HeCIOHImvHtdfW
         SqJw==
X-Gm-Message-State: AOJu0YxR9oImcb3LRERtjAjm8Ba/Ev8znLY+KM3PM6RTJ7EVM9OEli/G
	zYshyVwcpxc3fc1nJDePq/2LdH0n1xldmiwf1bFDNH+XYYzUTiddlLxIB/0s4kfCazLQFuEowxo
	KTQZXthOtwWhcFmzbK/wQmeJkTTkItyHmM88BXagxg3khsmwj4tImNpjldVzJeUk3DG9e/B1e74
	Ym7/Q=
X-Received: by 2002:a50:bb2a:0:b0:56b:829a:38e3 with SMTP id y39-20020a50bb2a000000b0056b829a38e3mr8133367ede.16.1714387795498;
        Mon, 29 Apr 2024 03:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxaAk7ujYaxXYwlydlAdtfXBP2naI+GbOYOjO3PpgkOZlewZ6TuzGpHbbXbtuUhFpTirBPew==
X-Received: by 2002:a50:bb2a:0:b0:56b:829a:38e3 with SMTP id y39-20020a50bb2a000000b0056b829a38e3mr8133353ede.16.1714387795219;
        Mon, 29 Apr 2024 03:49:55 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id er25-20020a056402449900b005727eb1ed6asm1219115edb.68.2024.04.29.03.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 03:49:54 -0700 (PDT)
Message-ID: <f7ff317b-f91b-429c-ac09-61b338264890@redhat.com>
Date: Mon, 29 Apr 2024 12:49:54 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: ISST: Add Grand Ridge to HPM CPU list
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 markgross@kernel.org, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240422212222.3881606-1-srinivas.pandruvada@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240422212222.3881606-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/22/24 11:22 PM, Srinivas Pandruvada wrote:
> Add Grand Ridge (ATOM_CRESTMONT) to hpm_cpu_ids, so that MSR 0x54 can be
> used.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

This looks like it needs to be applied on top of the fixes branch, or else
after 6.10-rc1 is out.

Ilpo, what do you think ?

Regards,

Hans

> ---
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index 30951f7131cd..1accdaaf282c 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -721,6 +721,7 @@ static struct miscdevice isst_if_char_driver = {
>  static const struct x86_cpu_id hpm_cpu_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(GRANITERAPIDS_D,	NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(GRANITERAPIDS_X,	NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(ATOM_CRESTMONT,	NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(ATOM_CRESTMONT_X,	NULL),
>  	{}
>  };

