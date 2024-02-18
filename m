Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58876BB47
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708268311; cv=none; b=Syssc9ORE2X6RctRHL910oV7HrD1QGUITS0MxYD1iIPI0sCi3PKFEqm5EjSpk+YAoe4uyFgMgXUbwL0KI3VcKFLPUseyb8n3oOPjdofB4Ddc3nu+dXIAEAQ1QvzRihHNNBEU+T+oCUKY8tXCrhpN/pZNP1ujTlYNa5vxZyf4ceM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708268311; c=relaxed/simple;
	bh=pfMqssGcBk+8q9oHOBbEdSRnUV/suWpqRHtdgltSe0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6D3G9vVDx2t5RvnwpIBxA0JvDD+zUmgEU5xM/aUT1tUh+6w6IwN0y1Gvru41i2fMZkrnWG6eaNi2JVvJQeMGVpK/Ru/v0vPy2XjfBYIpPvsEc9ZMeQzS2MzQhqoaT1U2WQPV5sbuF/YIYFJNClPhQl4UCs/aYHCD073qzLY+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fhrSi8bv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fhrSi8bv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708268307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oHwYVxgyxqOqPBsfvqLtV1mjZEI6GQLku3Cf97dCGE4=;
	b=fhrSi8bv++LrGpYPX8WR5EVH+giDoEGIARel9NiWR1VQLaKXuzY7pSP8N8PNmyqRtxl7YE
	6NvqMjwBLKEPZ3ov6mpKh46FMcHDMcff6YNOOxmZMXJdFIcsg3EnJznjbyOF+WhcVxoxnp
	+gsCgGp9qZdW+17JSTnYVdlN+p/greQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-ulY9JsJPOLSVa28CxD7usw-1; Sun, 18 Feb 2024 09:58:26 -0500
X-MC-Unique: ulY9JsJPOLSVa28CxD7usw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-56470754d67so42428a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 06:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708268305; x=1708873105;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHwYVxgyxqOqPBsfvqLtV1mjZEI6GQLku3Cf97dCGE4=;
        b=LF+4Zb04kGBkdPjpInjlajilgrlUTUeUBxp2JkAV/H9hrDOKauKvTepHkVPw50Lufb
         2rMbiEOwgeQySTqWUO3rTPzYHg4f+LNm6yYCIZHPkbyVx4Gc6F2hR4j2WpAEmq93FuXu
         UtN8rJ8Pxr0e4arVNvBL1AFJzbdt9D2dhEUfA8CaeGj8u08ruoQCxQObCmRtixoR4QtF
         l8QZfV2SK42LvsdnwyI2hAmpKU82juXQ7FpddbVEnbRjjwKRt8W/joZe47UkEUSxsuTu
         c6GtlZ5yz+rUI9nkklnnwzAbniGvrXgTBHRRH8htIl8ShzlX/EyZaWLufbKqyUam2x3X
         /jig==
X-Gm-Message-State: AOJu0YxUbLWYYDpepLcSOZPbC5wxPjbf1bLdEbRYpOWfQMLMVCyS5k/3
	PoMVT3JKBrfT/2672NTwLNPtWEJYFs85AbBJG9i6E2eu6jRE5KleRV3AZ55kKQs9wXVNcR9mDgA
	nFRC5xqNbDpDgm9IHfxzzWdAiNHtMPbGvh5iHZSusb9chx3kzLRKEB7y01TF6AL23QKWPCSc=
X-Received: by 2002:a05:6402:2294:b0:563:fcbe:d1b7 with SMTP id cw20-20020a056402229400b00563fcbed1b7mr3462202edb.26.1708268305031;
        Sun, 18 Feb 2024 06:58:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFE6mjWLSxVEbdT1xeO+o19pYLp6ytPgAZ4GDwax5+RHc01HfHAZWgpXs0MtX2qkPV5BW+3xg==
X-Received: by 2002:a05:6402:2294:b0:563:fcbe:d1b7 with SMTP id cw20-20020a056402229400b00563fcbed1b7mr3462197edb.26.1708268304677;
        Sun, 18 Feb 2024 06:58:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dk11-20020a0564021d8b00b00563a86979dcsm1826868edb.42.2024.02.18.06.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 06:58:24 -0800 (PST)
Message-ID: <15df7d02-b0aa-457a-954a-9d280a592843@redhat.com>
Date: Sun, 18 Feb 2024 15:58:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Fixup error handling for
 amd_pmf_init_smart_pc()
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240217014107.113749-1-mario.limonciello@amd.com>
 <20240217014107.113749-3-mario.limonciello@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217014107.113749-3-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Mario,

Thank you for the quick v2.

On 2/17/24 02:41, Mario Limonciello wrote:
> amd_pmf_init_smart_pc() calls out to amd_pmf_get_bios_buffer() but
> the error handling flow doesn't clean everything up allocated
> memory.
> 
> As amd_pmf_get_bios_buffer() is only called by amd_pmf_init_smart_pc(),
> fold it into the function and add labels to clean up any step that
> can fail along the way. Explicitly set everything allocated to NULL as
> there are other features that may access some of the same variables.
> 
> Fixes: 7c45534afa44 ("platform/x86/amd/pmf: Add support for PMF Policy Binary")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * Use a single label
>  * Move all into amd_pmf_deinit_smart_pc()
>  * Set to NULL explicitly
> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 65 ++++++++++++++++-----------
>  1 file changed, 40 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 1359ab340f7c..4f74de680654 100644
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
> @@ -455,22 +436,56 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		return ret;
>  
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> -	amd_pmf_set_dram_addr(dev, true);
> -	amd_pmf_get_bios_buffer(dev);
> +
> +	ret = amd_pmf_set_dram_addr(dev, true);
> +	if (ret)
> +		goto error;
> +
> +	dev->policy_base = devm_ioremap(dev->dev, dev->policy_addr, dev->policy_sz);
> +	if (!dev->policy_base) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
> +	if (!dev->policy_buf) {
> +		ret = -ENOMEM;
> +		goto error;
> +	}
> +
> +	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
> +
> +	amd_pmf_hex_dump_pb(dev);
> +	if (pb_side_load)
> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);

There is a small race here where the debugfs file can be used
to load another policy while amd_pmf_start_policy_engine()
is running. Leading to both the policy-buffer getting modified
underneath the first thread running amd_pmf_start_policy_engine()
and to 2 threads possibly running amd_pmf_start_policy_engine()
at once.

This is a pre-existing problem. Can you post a follow-up
patch (on top of this series) to move the:

	if (pb_side_load)
		amd_pmf_open_pb(dev, dev->dbgfs_dir);

To below the amd_pmf_start_policy_engine() call ?
That avoids the possibility for this race.

I don't expect this to be a problem in real life,
but it would be good to close the race alltogether.

Since this is not a problem with this patch:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for this patch as-is.

Regards,

Hans





> +
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data)
> -		return -ENOMEM;
> +		goto error;
>  
> -	return dev->smart_pc_enabled;
> +	ret = amd_pmf_start_policy_engine(dev);
> +	if (ret)
> +		goto error;
> +
> +	return 0;
> +
> +error:
> +	amd_pmf_deinit_smart_pc(dev);
> +
> +	return ret;
>  }
>  
>  void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
>  {
> -	if (pb_side_load)
> +	if (pb_side_load && dev->esbin)
>  		amd_pmf_remove_pb(dev);
>  
> +	cancel_delayed_work_sync(&dev->pb_work);
>  	kfree(dev->prev_data);
> +	dev->prev_data = NULL;
>  	kfree(dev->policy_buf);
> -	cancel_delayed_work_sync(&dev->pb_work);
> +	dev->policy_buf = NULL;
> +	kfree(dev->buf);
> +	dev->buf = NULL;
>  	amd_pmf_tee_deinit(dev);
>  }

