Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D341E526
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 11:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708254112; cv=none; b=S9VPeWuu6tFEQx5ObWNKHMESrWVZpEjegQzB60tg9YO13GQb6kmsL1PSmgIr5LBqr57dP5Jv4XM2ZLC1rMiNm0VSWMHFB57qdZe9kR8IA3MLbriC5HkyPnK4CXTd8jMI2Y4NZEi5VVbZuqADcSf0r2XO/AS/kMy8b/Y2bUKOHJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708254112; c=relaxed/simple;
	bh=M/AHIi+x/jiF/PThKbMOMo4JXa4L1ccApc8Jqc9khAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OeXF5+PH+s+JA55rMnzbjTP6OF+Q7HOzul4FvNwKyKGvmU5/i6Mz2iM9fAlqbt+h4dKNYqXO3rNpXqcPzEnmARBbBquHmxYbc0h3PJjBRYRx1U5VlC6A5kUb9fHJF3GMZJk4Ldr+SzUrzczP6H6UMGzoZ94wb/j1eDPOHHmUDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Y2e/Eg05; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y2e/Eg05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708254109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PhzxOa+tdV5tT3KRjUp/wlDOXFfnB7vhxjSt9woYKnQ=;
	b=Y2e/Eg05z6b8S2RUnKocadJlmTKE8HHGsXTBFVc5mLBnJ8JHpFc3O8jML4xtbZJ3Rrj2ry
	J/V9aDexeqUzebiGa71EJWBrHqul5NWRPO14dGIJJ9N0Gec9sdcxmNfNh1U8rPyqxce94q
	A5OjD/64ZGK3RItIQU1Jqf0fFHg3dhk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-flLzEjpMOe-6lwBkjSvTmg-1; Sun, 18 Feb 2024 06:01:47 -0500
X-MC-Unique: flLzEjpMOe-6lwBkjSvTmg-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a3e7f805eccso8061266b.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 03:01:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254106; x=1708858906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PhzxOa+tdV5tT3KRjUp/wlDOXFfnB7vhxjSt9woYKnQ=;
        b=KxlkDASgHiSBiNyhU7Y2OvGt/kalqTGVMeOLZ3W6AEAzt5DaSI1pPuyCZ6QgZx1lKt
         NqIesoN3lBc3m6eO/0ry1/ehlgE+cfO29Ruj7l/XWLb9yyA69gLar7tXT7rUMbfDKUov
         xdBhFWPIJWa0kq766d0xpEesbq5KaWD2+fRs0eT9+/0L5UVHUac+G8HX4c7aYKgGlE0g
         ziwFdn3TRK8gSnLYkg9BUJUKQgvEU5jIymFDmfX4I3JrgOAZvdVvnGqzotZdt0GhE+SP
         KldJ8jK7L8oyyAgs3Eb7DyVcJW4x4Briyg+ut7VbYw7twP+Mt6cOdQCrFVOLf+F1NaNq
         k4EA==
X-Gm-Message-State: AOJu0YyhBrY8MgkGPx7gEX59lQv+SHGY3AG0eigfXrQyZ28TEuT4fY2B
	xlKx2nCaJJeKk9bppQIm8xeuJPJxzb7fRoUT2hwWqkjxgxM28ZjmkgrM9L5mo2/1N4wESFHwtmI
	jhdawIuttvhmTtA+XdnZ+0BkmqAEIhBeb7bb+auuo238d/WZ4rYPg8zBcmRbdQuDXtgxpK64=
X-Received: by 2002:a17:906:d86:b0:a3d:7559:6ed1 with SMTP id m6-20020a1709060d8600b00a3d75596ed1mr6557324eji.4.1708254106153;
        Sun, 18 Feb 2024 03:01:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHTOitH7IczymutN2VoJo3b5YCAFLZzH9xYmmAjNuVWwzt/z1AW3C5zjADbe1Ig+jJdPvmwug==
X-Received: by 2002:a17:906:d86:b0:a3d:7559:6ed1 with SMTP id m6-20020a1709060d8600b00a3d75596ed1mr6557311eji.4.1708254105844;
        Sun, 18 Feb 2024 03:01:45 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id vo5-20020a170907a80500b00a3d559c6113sm1819579ejc.204.2024.02.18.03.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 03:01:45 -0800 (PST)
Message-ID: <7260ca36-fd92-4bf5-86b1-fb91393ad064@redhat.com>
Date: Sun, 18 Feb 2024 12:01:44 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/amd/pmf: Fixup error handling for
 amd_pmf_init_smart_pc()
Content-Language: en-US, nl
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240217012205.113614-1-mario.limonciello@amd.com>
 <20240217012205.113614-3-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217012205.113614-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

Thank you for your patches.

On 2/17/24 02:22, Mario Limonciello wrote:
> amd_pmf_init_smart_pc() calls out to amd_pmf_get_bios_buffer() but
> the error handling flow doesn't clean everything up all allocated
> memory.
> 
> As amd_pmf_get_bios_buffer() is only called by amd_pmf_init_smart_pc(),
> fold it into the function and add labels to clean up any step that
> can fail along the way.
> 
> Fixes: 7c45534afa44 ("platform/x86/amd/pmf: Add support for PMF Policy Binary")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 67 ++++++++++++++++++---------
>  1 file changed, 44 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1359ab340f7c..feb9dfafea30 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -338,25 +338,6 @@ static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
>  static void amd_pmf_hex_dump_pb(struct amd_pmf_dev *dev) {}
>  #endif
>  
> -static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
> -{
> -	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> -	if (!dev->policy_buf)
> -		return -ENOMEM;
> -
> -	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> -	if (!dev->policy_base)
> -		return -ENOMEM;
> -
> -	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> -
> -	amd_pmf_hex_dump_pb(dev);
> -	if (pb_side_load)
> -		amd_pmf_open_pb(dev, dev->dbgfs_dir);
> -
> -	return amd_pmf_start_policy_engine(dev);
> -}
> -
>  static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const void *data)
>  {
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
> @@ -454,14 +435,54 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (ret)
>  		return ret;
>  
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		goto out_dram;
> +
> +	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> +	if (!dev->policy_base) {
> +		ret = -ENOMEM;
> +		goto out_policy_base;
> +	}
> +
> +	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	if (!dev->policy_buf) {
> +		ret = -ENOMEM;
> +		goto out_policy_buf;
> +	}
> +
> +	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +
> +	amd_pmf_hex_dump_pb(dev);
> +	if (pb_side_load)
> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);
> +
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> -	amd_pmf_set_dram_addr(dev, true);
> -	amd_pmf_get_bios_buffer(dev);
> +
> +	ret = amd_pmf_start_policy_engine(dev);
> +	if (ret)
> +		goto out_start_engine;
> +
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data)

I just checked and dev->prev_data gets used by dev->pb_work
which gets queued by amd_pmf_start_policy_engine() so there
is a (pre-existing) race here and dev->prev_data should be allocated
before amd_pmf_start_policy_engine().

Note kfree(NULL) is a no-op as is cancel_delayed_work_sync()
on a non-queued work.

So I think you can just use a single error_exit: label 
(or any other label-name you like) and do:

error_exit:
	cancel_delayed_work_sync(&dev->pb_work);
	kfree(dev->prev_data);
	dev->prev_data = NULL;
	kfree(dev->policy_buf);
	dev->policy_buf = NULL;
	kfree(dev->buf);
	dev->buf = NULL;
	amd_pmf_tee_deinit(dev);
	return ret;

There as long as you do the INIT_DELAYED_WORK() before
any of the code which may fail with a goto error_exit.

Note I also added clearing of the pointers after freeing
them, at least for dev->buf this is important because
that also gets used in non smart-pc paths and those
count on it either being NULL or a valid pointer.

Regards,

Hans















> -		return -ENOMEM;
> +		goto out_prev_data;
> +
> +	return 0;
>  
> -	return dev->smart_pc_enabled;
> +out_prev_data:
> +	cancel_delayed_work_sync(&dev->pb_work);
> +
> +out_start_engine:
> +	kfree(dev->policy_buf);
> +
> +out_policy_buf:
> +out_policy_base:
> +	kfree(dev->buf);
> +
> +out_dram:
> +	amd_pmf_tee_deinit(dev);
> +
> +	return ret;
>  }
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)

