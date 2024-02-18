Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB672CCA4
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 10:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708252025; cv=none; b=S0ScZfjEcx430SqNe7FOGDbTE4Yd0YekmgBRjvpgzYMKr/Kq2dbthtl+Cpwfi+Oq0E5Pr5IlZ2hf4eKqOCjyxBw4FRm9koVhyDmOb3mINYSi5wQ9b+dtZoEGOBcbMk+pU8zwLgeTj66nqWxUNjITqSxfKz+hDgOqKv1TIyTtnVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708252025; c=relaxed/simple;
	bh=aePQbG4b2G+c+SGyhxjzdhxz8DnTmdOIk4xi7+UtVtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ay5+NjYOSUPjJ7bWCHm2J59weAPGmetW1wcFyM5JUlDQc6BZIt23wdrckeGGcwGo3A+zFBYWOll20W5Kk1eKFIFUbuaZBoEEcWl+aoerGvhVJ5F/g1XE2QKmfZ82C2YQAeW4ip6FHfNEKewI4t4/0oGc/jY+adpYsDk+7dThwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b930ZSM3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b930ZSM3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708252021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSTWCWfGDb+Ca5J7proRAWQQgeYhikCAseb6RpZTm70=;
	b=b930ZSM3glFTyTkkM1O2neg696QUexs/gs/8XyDTzPddMUNAsWT56IogeGOPHrBgsOyz1W
	ftw8T5GoNLMVLVyPGRZ75kI0/53lQeSOm95DLny16fz/6NJXp1+sOmIDUTFDASJBEryrHU
	WYMUmdV4qcW0LD88dEbK0BKnn9B/n3M=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684--aU7HsxhOU2aThl8fBxLdw-1; Sun, 18 Feb 2024 05:26:59 -0500
X-MC-Unique: -aU7HsxhOU2aThl8fBxLdw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a3d7b6e42b9so156360066b.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 02:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708252018; x=1708856818;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSTWCWfGDb+Ca5J7proRAWQQgeYhikCAseb6RpZTm70=;
        b=orW3K0Wj2BzYehJiLCXRuLbWz5HWN2KHo4mOoUONOm8zCmBlK4hk5fcBMeeq2D5cpX
         xXNDJ9aGap+Zg1plX/2bn6JbwznOQZfw4yL0BRm7/V8CTFpO44AxPCUrRKA2BLMpo4KU
         Xs6fiM5+UAEloHcNKvmwXNZhHDFbXsqc8y4Mr9bQocTyYnt4fKsi7esqL5cXCNOuPFQc
         p+E2bPdIQ6oNLEtIySUK1X1j5T4ZSJYmPM9XIVm1pY3Jxx0DOfkgvxK5fTVAnB2pJtS2
         jmj0l/IC2gBn6tzatIhU24VqCPATSp65wVxp8/wYijZ/QqWuPjhc4UmF6jZ6wHqBQziS
         epKA==
X-Gm-Message-State: AOJu0Yxr1m2ZfJVbrtFTyRnC/VsrcWv0oS8QcB/EobY7cZsDDqDkFfxo
	8JXBVRn48Kj7RMRg43dwiHV1B1/ZSDNbtqCfcnUzd6MYw1oWZ6GalRmRCF1cjleE7VHVthl6ce6
	6UBF+Ez+jlb5xT7QTVHllluBGfpVtpCqb8CckxgN7K3pKWBXzIApCcJ3e8PXP+titF3lmIIw=
X-Received: by 2002:a17:906:397:b0:a3e:62f8:bbaa with SMTP id b23-20020a170906039700b00a3e62f8bbaamr870528eja.17.1708252018370;
        Sun, 18 Feb 2024 02:26:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEgCRADRrQGCDfG54ZJZXr20hXS5ma+vll0yT7H/0sZvUFC/raicvFnaxOU/TOeWhwkUgsQjw==
X-Received: by 2002:a17:906:397:b0:a3e:62f8:bbaa with SMTP id b23-20020a170906039700b00a3e62f8bbaamr870521eja.17.1708252017997;
        Sun, 18 Feb 2024 02:26:57 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b00a3d5a08ccc1sm1812528ejc.191.2024.02.18.02.26.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 02:26:57 -0800 (PST)
Message-ID: <3e81d005-663d-4c80-b9e9-5ddf56600c56@redhat.com>
Date: Sun, 18 Feb 2024 11:26:57 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86/amd/pmf: Add debugging message for
 missing policy data
Content-Language: en-US, nl
To: Mario Limonciello <mario.limonciello@amd.com>, Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20240217012205.113614-1-mario.limonciello@amd.com>
 <20240217012205.113614-2-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217012205.113614-2-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 02:22, Mario Limonciello wrote:
> If a machine advertises Smart PC support but is missing policy data
> show a debugging message to help clarify why Smart PC wasn't enabled.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 8b7e3f87702e..1359ab340f7c 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -252,8 +252,10 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  	cookie = readl(dev->policy_buf + POLICY_COOKIE_OFFSET);
>  	length = readl(dev->policy_buf + POLICY_COOKIE_LEN);
>  
> -	if (cookie != POLICY_SIGN_COOKIE || !length)
> +	if (cookie != POLICY_SIGN_COOKIE || !length) {
> +		dev_dbg(dev->dev, "cookie doesn't match\n");
>  		return -EINVAL;
> +	}
>  
>  	/* Update the actual length */
>  	dev->policy_sz = length + 512;

