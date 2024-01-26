Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71CA20B29
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jan 2024 19:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706296608; cv=none; b=CzCY6isQUjk9uDzpaml3imFs+cY4LYOkvyBsj+baq7Sh21TRgAceC1J00eAy2ZbAEtVwIm9RCoWonD1Zo6bVXTt52rQdizv/r1FfrkJrmvyfb7RnKIUa9SSAiMoYcjCN2/wqb3AhGzPmRzJmHL/eWRbZJl1fGzkuJQ46m0uoWDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706296608; c=relaxed/simple;
	bh=2gNWgdBM7VICYtrpltTu9LDq2Yg+z+Xdv5fQPsdcNZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1QcARAhHNa0Z9uatAVTNHBrv1ZWKd0y/Mei8pfF/w9h6C/n1e3yotgPJ9PYtDbTpsUmRNxv46YR6JRLz8vdtssl5m2PT2doh5+/H8qK3AgWnb52NGww1M4V1eWG30h85yCRb9rtqBUeky4f4a5s8cme3NuJD75rF7jLyfgkVxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BED3vt3S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BED3vt3S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706296605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r+3iUHSXvnsStF5C7F2WhhEixMBYUvT1Segc6+8HjT0=;
	b=BED3vt3SypCbDEHIjsmYZb7Z7mmia5i7gYFZPX4yH06JPks3NhgXUqPmNHBLDlf+kExc4Z
	4ITAv9f/Yte7W8beuisgMvqSeATyhauS0T3tYQcjKDQyOujZ7AI2euD91tvQokNONqrfAt
	Sbcr9gH1WbKPP49lMW8HOeyCTumyNv8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-9Sx9QopmNmOslGYcH9Pi3g-1; Fri, 26 Jan 2024 14:16:44 -0500
X-MC-Unique: 9Sx9QopmNmOslGYcH9Pi3g-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a35247a5d8cso7727566b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Jan 2024 11:16:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706296603; x=1706901403;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r+3iUHSXvnsStF5C7F2WhhEixMBYUvT1Segc6+8HjT0=;
        b=tornu5awv4F0lHkLVs/Ggq2O4NTNwRr5/xksekj26WqWHj1BLj3bf+1BkMygffYFmi
         oLIgtz27WawLk/SYYAjoPpVTyusaKxW5HOM2Gkc2hUpjmY1m6VTPYJgC3pG/evqSCaRq
         tX3Z/hp5JHcSHZGzd9T42wxWaTNAoipREln9/r7Qbt48AtobEDnI9SxkpQHZArFfTMut
         fTbI4ozzUpm6NUuvxPd8lswgYYrt+ZIEACRLiMosxqtg3RgjL99poOriPWeM9bE1EFd8
         tZtBZxW7NpVVz4oI8QnX4IhaiHqN7i3UUSeiONnn6fjmrHfp9CSPgGPcWoujEAkSfedg
         7NFA==
X-Gm-Message-State: AOJu0YyyDNEK9r2MwIhO+B3TgiJ+w8m7oGbvzeJAOo+e+OMXskDUWSVB
	bOx7hgrBeJZ1WIT6f2pLoFdPovi+l248MKBlcVCsRscLOoDuKGgUGt5DT1HOt4RAaLFyoKSIR61
	vVeCtXc6TS/RqIyLDAaScP7OKe6Lx9pCCqHRGa53ROIlkYNcyiqr4SbDY7q/1QJvWsdlgd7A=
X-Received: by 2002:a17:906:3b4d:b0:a27:f5fb:502 with SMTP id h13-20020a1709063b4d00b00a27f5fb0502mr74561ejf.75.1706296602974;
        Fri, 26 Jan 2024 11:16:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFomd1eQu7WCwDW+Xvj9rfse5jw9VyIuB0zdXEXVta7ymDWeDYc/QZF0rh/V4AuQl5Mo1noGw==
X-Received: by 2002:a17:906:3b4d:b0:a27:f5fb:502 with SMTP id h13-20020a1709063b4d00b00a27f5fb0502mr74559ejf.75.1706296602794;
        Fri, 26 Jan 2024 11:16:42 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id g17-20020a1709067c5100b00a34a45c8a37sm930564ejp.145.2024.01.26.11.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 11:16:42 -0800 (PST)
Message-ID: <901291c8-ca9c-47b2-8321-256b314690da@redhat.com>
Date: Fri, 26 Jan 2024 20:16:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86/amd/pmf: Fix memory leak in
 amd_pmf_get_pb_data()
Content-Language: en-US, nl
To: Cong Liu <liucong2@kylinos.cn>, shyam-sundar.s-k@amd.com,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <b7bd8769-5f97-4c9a-be80-8d1acac92b19@amd.com>
 <20240124012939.6550-1-liucong2@kylinos.cn>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240124012939.6550-1-liucong2@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/24/24 02:29, Cong Liu wrote:
> amd_pmf_get_pb_data() will allocate memory for the policy buffer,
> but does not free it if copy_from_user() fails. This leads to a memory
> leak.
> 
> Fixes: 10817f28e533 ("platform/x86/amd/pmf: Add capability to sideload of policy binary")
> Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>

Thank you for your patch/series, I've applied this patch
(series) to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in the pdx86 review-hans branch once I've
pushed my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  drivers/platform/x86/amd/pmf/tee-if.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index 502ce93d5cdd..f8c0177afb0d 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -298,8 +298,10 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
>  	if (!new_policy_buf)
>  		return -ENOMEM;
>  
> -	if (copy_from_user(new_policy_buf, buf, length))
> +	if (copy_from_user(new_policy_buf, buf, length)) {
> +		kfree(new_policy_buf);
>  		return -EFAULT;
> +	}
>  
>  	kfree(dev->policy_buf);
>  	dev->policy_buf = new_policy_buf;

