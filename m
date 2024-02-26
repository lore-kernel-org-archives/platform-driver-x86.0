Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D41524A0
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708944595; cv=none; b=Hy/R45nj1D5FXkOpH134hx0tC+5wovPZQpssVRTSZ8ISJvSkyKeX9jl0/WHz98fkgrYr77NROnX5CLZ9Z6dbQ+vQSsDfpLrDBvO9pjAjdCSfLdcyMo6tHJ0oBXpDnKsfwEexpaRMCNsweG9jicXi/nb+0tdmElo8kCs6oi47jtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708944595; c=relaxed/simple;
	bh=xBvZMepYm7Nn/S7XM6PeWCm3/cfRN3K0c7tROTXKYAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EE+HKejyvT4syOgmQXNhHCP/1QIndtVRKWyH7TwAFDLUupzWwETD+TUeHy47Y5k+8SEeEyKx+/yGnJ0KHkinivLoWcULR9vWco7JKHkatzDoA28RE/tzWAaXSyrVhjE+FKjqc/6aSrTpGrJW2mR0O+mn+tNYHQms94/50JxiOXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y5cuLK7B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y5cuLK7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708944592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zLsQE+aQgJssDnfahlpKah+vS9VVX8IFDY4R5ijqCjA=;
	b=Y5cuLK7BMHaI432WXDuPgW2Pd70Uu/YdaTbNtM3aM3tlrFzsQ7U7oy+skD3EIUdjkhZEIz
	ODUHlqk58+mOZyugWz8pj67XrZsvTkdDteHr/ZVQ3IGnMMIDmdC7BmNhc3C3Lt0Kb9x4kL
	USvbO39i8Nz4nsX04YMwjuqlLyz1CJ8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-vVZHTJfGNBuJ2_HroYaXhg-1; Mon, 26 Feb 2024 05:49:49 -0500
X-MC-Unique: vVZHTJfGNBuJ2_HroYaXhg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4314ed2638so52740366b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 02:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708944588; x=1709549388;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLsQE+aQgJssDnfahlpKah+vS9VVX8IFDY4R5ijqCjA=;
        b=ahbXSWCVVLdaV7gpVqg/Q6+8SOWNvnUAYqjtLN3L4q2btm2F+oKYDnABYo2OZeiYdz
         yASM0dlimo/8qUBuwQQi+rxxTaYvRJOR5HI1B3J44JYGjxIbOzSaIdryyABwenfg4x+C
         0adYU2uvadaQSzy8of2R2/hIU+EqKVHwAQ6T+Zy3zR6NFnliFfQsSIg+O+2UHead3zjg
         dA553k+6xu3UCa7VFAv/OomzvsVJm6Dm0mjC6k/UE/LKBiqD+U1V7GBIenZoV4GjtBda
         X9+KTngBiccFPvCSsJBhn52nU14NfgiLe1SXpqjivg/IMwSnJR0XwqAtij0srr8IhgUR
         V/0A==
X-Forwarded-Encrypted: i=1; AJvYcCWamgFgl/Cxhrqj7uQ3K9aL2nTMfYjq8+MWwzLZS5J2/JRuXXmyh+Xo01An4qS99CrsmMaG7tFTyeuQBSP4Bv7vdxDHf17HmtwyXN3n6NpInBMgGQ==
X-Gm-Message-State: AOJu0Yza5SWNIalZqqb2ZoPahpDwmHvulOZibDwmPQs8JM6FGXO9dd2V
	uVj88Q7rfK9LMceRH0KGOCqs+QcBQ6i7qlRJrxHObw+gouBZ4TINmHT87YLBFVSHY+P6MESlbm+
	lUxTnXYW7AA1QWtUfBiJrRySIXRr+tPQBsYdOek5IEGECFTHsXLekwN2tazIsJ2mCKpb1Nkg=
X-Received: by 2002:a17:906:796:b0:a40:2994:723d with SMTP id l22-20020a170906079600b00a402994723dmr4709315ejc.14.1708944588126;
        Mon, 26 Feb 2024 02:49:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKyU3LFE+SgMH8QDE7z68a7X6R3AF+gQJk2X59d10p2Lq6yuPldRKNWCz1SQ3UGbriyeOf9g==
X-Received: by 2002:a17:906:796:b0:a40:2994:723d with SMTP id l22-20020a170906079600b00a402994723dmr4709300ejc.14.1708944587789;
        Mon, 26 Feb 2024 02:49:47 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rf14-20020a1709076a0e00b00a4339b8b1bbsm1143238ejc.212.2024.02.26.02.49.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 02:49:47 -0800 (PST)
Message-ID: <3a641698-a0eb-4335-932a-2f0ae73dab44@redhat.com>
Date: Mon, 26 Feb 2024 11:49:47 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/mellanox: mlxbf-pmc: Ignore unsupported
 performance blocks
Content-Language: en-US
To: Luiz Capitulino <luizcap@redhat.com>, ilpo.jarvinen@linux.intel.com,
 shravankr@nvidia.com
Cc: davthompson@nvidia.com, ndalvi@redhat.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <cover.1708635408.git.luizcap@redhat.com>
 <f8e2e6210b43e825b69824b420c801cd513d401d.1708635408.git.luizcap@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f8e2e6210b43e825b69824b420c801cd513d401d.1708635408.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/22/24 21:57, Luiz Capitulino wrote:
> Currently, the driver has two behaviors to deal with new & unsupported
> performance blocks reported by the firmware:
> 
>  1. For register and unknown block types, the driver will fail to load
>     with the following error message:
> 
>     [ 4510.956369] mlxbf-pmc: probe of MLNXBFD2:00 failed with error -22
> 
>  2. For counter and crspace blocks, the driver will load and sysfs files
>     will be created but getting the contents of event_list or trying to
>     setup the counter will fail
> 
> Instead, let's ignore and log unsupported blocks. This means the driver
> will always load and unsupported blocks will never show up in sysfs.
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/mellanox/mlxbf-pmc.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/mellanox/mlxbf-pmc.c b/drivers/platform/mellanox/mlxbf-pmc.c
> index b71636eb3db1..746567767e5b 100644
> --- a/drivers/platform/mellanox/mlxbf-pmc.c
> +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> @@ -1043,6 +1043,11 @@ static const struct mlxbf_pmc_events *mlxbf_pmc_event_list(const char *blk, size
>  	return events;
>  }
>  
> +static bool mlxbf_pmc_event_supported(const char *blk)
> +{
> +	return !!mlxbf_pmc_event_list(blk, NULL);
> +}
> +
>  /* Get the event number given the name */
>  static int mlxbf_pmc_get_event_num(const char *blk, const char *evt)
>  {
> @@ -1761,6 +1766,9 @@ static int mlxbf_pmc_init_perftype_counter(struct device *dev, unsigned int blk_
>  	struct mlxbf_pmc_attribute *attr;
>  	unsigned int i = 0, j = 0;
>  
> +	if (!mlxbf_pmc_event_supported(pmc->block_name[blk_num]))
> +		return -ENOENT;
> +
>  	/* "event_list" sysfs to list events supported by the block */
>  	attr = &pmc->block[blk_num].attr_event_list;
>  	attr->dev_attr.attr.mode = 0444;
> @@ -1840,7 +1848,7 @@ static int mlxbf_pmc_init_perftype_reg(struct device *dev, unsigned int blk_num)
>  
>  	events = mlxbf_pmc_event_list(pmc->block_name[blk_num], &count);
>  	if (!events)
> -		return -EINVAL;
> +		return -ENOENT;
>  
>  	pmc->block[blk_num].attr_event = devm_kcalloc(
>  		dev, count, sizeof(struct mlxbf_pmc_attribute), GFP_KERNEL);
> @@ -1878,7 +1886,7 @@ static int mlxbf_pmc_create_groups(struct device *dev, unsigned int blk_num)
>  	else if (pmc->block[blk_num].type == MLXBF_PMC_TYPE_REGISTER)
>  		err = mlxbf_pmc_init_perftype_reg(dev, blk_num);
>  	else
> -		err = -EINVAL;
> +		err = -ENOENT;
>  
>  	if (err)
>  		return err;
> @@ -1983,6 +1991,10 @@ static int mlxbf_pmc_map_counters(struct device *dev)
>  			return -ENOMEM;
>  
>  		ret = mlxbf_pmc_create_groups(dev, i);
> +		if (ret == -ENOENT) {
> +			dev_warn(dev, "ignoring unsupported block: '%s'\n", pmc->block_name[i]);
> +			continue;
> +		}
>  		if (ret)
>  			return ret;
>  	}

