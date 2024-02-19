Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2AD2E65B
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708346425; cv=none; b=n5fsNJKsP6mB+vPo6ItFgLyryHOQ4TVOS570L51dbCHkOz28DMeZJ6h8b189c02PezEShWiTyKq1gllZYN7VUWfGjOPSz90tedYVu+b20I4TWlCpJxxFNi0gESZlHSv4qkRFHVvFzDTY0Dbb5uAtyFQdT1DkMLHkwsKI3XK6jSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708346425; c=relaxed/simple;
	bh=eCc2czVnLrR2p0hVwpCcQ0OeUJg74XlztzgLwxVGqBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G4hUWCDWabnggtwQTQighb2aUcZcfUQ/bf9HyLzL+YEi6p/lC+FQA33o1sy5NZAnFLeezPY/uyfWekhoakJNfJHdUE0y9NgxEUpl3TUMVIn96NckH/UItzHQb5tzLoXkVN4+WkoRrPivuszlbE9v1PVIJEljoF4N8i7T+sbd9cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bv+w5Zid; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bv+w5Zid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708346422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bSoWtrntvZIWbBvyP8tHbFaYn0WgGKZufHXTx2xqEdU=;
	b=bv+w5ZidRR4tsywRN511FeiOXT4ldXCm7BWPVzFd9dLxyR3IhfHR4tRn7TC/1tKqqWPTUj
	nS9UHXWI7zO+TWpZyZKRaHEYWzX+Ezi9FBQeu9lIkyez5/nr4U5G84x+hXvxuEyWaKBuPv
	NbAm54jb6bso9/AkYsslVguSrFzgULE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-rOekfUujPY2h8RuRnm3yVw-1; Mon, 19 Feb 2024 07:40:21 -0500
X-MC-Unique: rOekfUujPY2h8RuRnm3yVw-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5646f7fd7a9so631584a12.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:40:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708346420; x=1708951220;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bSoWtrntvZIWbBvyP8tHbFaYn0WgGKZufHXTx2xqEdU=;
        b=l3ItnZjXkS2dsALnSYV2CPj823+e2oH2rF2JG52qW8FA3Knj7/TOWVfDvHQXFOGHOg
         30vVbZhJ7LVMoH7nF3bTzXVyDm1+wh8bVw2KmIhGD/SP2PV/JFvmRpv/AOOWQAqLtqJC
         t6UxreO6QKeXgqTiGO5KfhSJQS3nkpkOlRnHlzcvb67LKGvmt6XcsPZI0bvKlqC2vE0H
         QrFPA/ZDru7PQ+oCkgWNjTxBF/FpG1XZB5MLYEuLc6Gl6kUh29DxOVe5vSplgvNC1T42
         1bN20XzxZpFCJuyzVGegSqHD+7UDT3oBnuC+hKPYyQNGqOn6ZTAYqzDAV7EX8inhnsM1
         O9SQ==
X-Gm-Message-State: AOJu0YxdeMfBRVvjsmXvXAB7YGJT4lxMS3AAxamk7g04+V7x2avThQUE
	5pucX7BXZcvM+1y9nsLcCowUU/6gbvOA6RCVwlgp4DANdrMP3y+Zwt409uZ0vnKXnzuyo0J7lc3
	KHQgkgvrkUJKpWraV/OluGMAU4DR2OaamBlLUYjzrZhsPap0XvgNH+1EGfsvzW7rVEsLJKZs=
X-Received: by 2002:aa7:d9d0:0:b0:564:1cc7:eae5 with SMTP id v16-20020aa7d9d0000000b005641cc7eae5mr3840388eds.5.1708346420522;
        Mon, 19 Feb 2024 04:40:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJPwTlrDEIiQMRVVihRGIPASE6RYyVHWyKpduDzXfgFX4C0OoLGPoJXJ0K8YO5iiFR7giCXA==
X-Received: by 2002:aa7:d9d0:0:b0:564:1cc7:eae5 with SMTP id v16-20020aa7d9d0000000b005641cc7eae5mr3840375eds.5.1708346420235;
        Mon, 19 Feb 2024 04:40:20 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x16-20020a056402415000b005644e4fdf36sm1657308eda.6.2024.02.19.04.40.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:40:19 -0800 (PST)
Message-ID: <f6cc1cf6-b8e3-4687-83a6-3880b033288f@redhat.com>
Date: Mon, 19 Feb 2024 13:40:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86/amd/pmf: Fix a potential race with policy
 binary sideload
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240217015642.113806-1-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217015642.113806-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 02:56, Mario Limonciello wrote:
> The debugfs `update_policy` file is created before
> amd_pmf_start_policy_engine() has completed, and thus there could be
> a possible (albeit unlikely) race between sideloading a policy and the
> BIOS policy getting setup.
> 
> Move the debugfs file creation after all BIOS policy is setup.
> 
> Fixes: 10817f28e533 ("platform/x86/amd/pmf: Add capability to sideload of policy binary")
> Reported-by: Hans de Goede <hdegoede@redhat.com>
> Closes: https://lore.kernel.org/platform-driver-x86/15df7d02-b0aa-457a-954a-9d280a592843@redhat.com/T/#m2c445f135e5ef9b53184be7fc9df84e15f89d4d9
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans

> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 4f74de680654..8527dca9cf56 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -456,8 +456,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
>  
>  	amd_pmf_hex_dump_pb(dev);
> -	if (pb_side_load)
> -		amd_pmf_open_pb(dev, dev->dbgfs_dir);
>  
>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>  	if (!dev->prev_data)
> @@ -467,6 +465,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  	if (ret)
>  		goto error;
>  
> +	if (pb_side_load)
> +		amd_pmf_open_pb(dev, dev->dbgfs_dir);
> +
>  	return 0;
>  
>  error:

