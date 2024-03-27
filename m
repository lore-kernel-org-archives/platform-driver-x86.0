Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5C914EC44
	for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 20:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711571003; cv=none; b=KzcPnzMwMXnjlimZLDFZJgwGIUWd9odMy+97hYDWVxsRkQt0QVfwNuycoPZyrSohOUDBBA57xmAKd7BTsd/y5JWAdJfDvla/YFr+Bh5uTLlaiCxPeq7TAKlmdQVbP9Swh7A+rJbeqXG7N+U8D+2tXBMrCgE8kMHo4cDQkODX5Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711571003; c=relaxed/simple;
	bh=lf3iGRU4+8TJtIaIB5wpVth3vfvKck6uCnm+CIzK0Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hUPr/ddmLxZskq4wbCV7kalCwa1Pvuz3TyHyhM/W2YD5IyeLnStL83QLOlGogRywHFkstXgHuXzCwRLODD6oTYn2U4YW9dWmjdZ1rdvxi/zc8fP7rK9Z9brzvq0zyYCJgi796Vv06Jk9khJ8KEZ0XDZS6QCPpcfENKlPeyGGq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KqtIzQfQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KqtIzQfQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711571001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lTDl/e4NP4//kzTYlfYlNhyuiB+c7Oh5LOKfCsmlo8o=;
	b=KqtIzQfQGusYVGK+kMxINSajBkQq7p2elFozP9Eq/+RXSNCQmfn5cS0wiM3ERu3F5wHe2O
	Exoh2iMHw8i2LqibAeB2xIY1udx7zaS7FItJlbj3GSWsZbF0sVXTfBRg/kTCc2srXPPBkM
	cNJIucxPRuZvf3iAobMDJ1PKCq8NQR0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-flMVX42HMAuG8gPgEvjd1g-1; Wed, 27 Mar 2024 16:23:19 -0400
X-MC-Unique: flMVX42HMAuG8gPgEvjd1g-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a4455ae71fcso10845866b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Mar 2024 13:23:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711570998; x=1712175798;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTDl/e4NP4//kzTYlfYlNhyuiB+c7Oh5LOKfCsmlo8o=;
        b=fxA5gixMFnuoCBC/scN11vkgNip99R7CVzne8U7I9jFvX8qs3KVFtkjb0fdSNNnIDg
         rq3oWdRo9F2NQtJ1FTtjC/R7IwwmLnYEasM5FCLvr0+QqvI1da9DXURnge2r4KsBvFeO
         mTIwYsm7V9xfWgvwYDJJOYD4Ee0vqItJ4WF3eRd54M3kNbIFY2gJIQ19juixUiV0medC
         z4nYK3V/Mx/DuD7WGLI6PRS8CwExdfsx6vmqQl8g8HXWfAIf3V/nqW+cHX02Cnb6i764
         Wf6fLSq3f29TbJopjoT84olLCi9RyX21zYxHa8FOQTCK1o0qNN8VOjLnrEWIi6kUE6yC
         4LRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYt7Dn58Xo/vN8MBCAoL5qYNYh1LZP6wCliUOeCguqsoyZuBWXrJcLZVmA+FjzFnKHHEgw8/9JBEeFVV1hVTLwpmUoR7RW/fY2a9gOGFf+7y80DQ==
X-Gm-Message-State: AOJu0YwXoZvh1+dE8tP6Ht1v2BlaDUE9h8YvCXNesYPtIBk4U5nfT976
	2it5C5UR80LzP46LnfjKMxfa0lExVBwt5p3h6ApHiwNi5qnNyUP/+nBD603pvlhWHwn75jNrloS
	Sa5V20NXI09wn0l7DWZdXQTL3JVZNdSHqA/TS7A9OeYT7S5GAxi8fNRSg8luegfDITU7MjJ9LLp
	AUqvk=
X-Received: by 2002:a17:907:780e:b0:a4e:1035:3ed7 with SMTP id la14-20020a170907780e00b00a4e10353ed7mr403293ejc.25.1711570998160;
        Wed, 27 Mar 2024 13:23:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcEdkUAPLuW/Ae7idu094WKvWLJZe4zJVSSj0CyhZ3tmJC63xdaI7MSHJiYeLoSlECwHmK+g==
X-Received: by 2002:a17:907:780e:b0:a4e:1035:3ed7 with SMTP id la14-20020a170907780e00b00a4e10353ed7mr403282ejc.25.1711570997669;
        Wed, 27 Mar 2024 13:23:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ju2-20020a170906e90200b00a4a33db326csm3963869ejb.194.2024.03.27.13.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Mar 2024 13:23:17 -0700 (PDT)
Message-ID: <a76ec816-b5d3-451b-9d3a-f1546fdbbd95@redhat.com>
Date: Wed, 27 Mar 2024 21:23:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: MAINTAINERS: drop Daniel Oliveira
 Nascimento
Content-Language: en-US, nl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240327081434.306106-1-krzysztof.kozlowski@linaro.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240327081434.306106-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 3/27/24 9:14 AM, Krzysztof Kozlowski wrote:
> Emails to Daniel Oliveira Nascimento bounce:
> 
>   "550 5.1.1 The email account that you tried to reach does not exist."
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

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
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 51d5a64a5a36..de17c0950d83 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5207,7 +5207,6 @@ F:	lib/closure.c
>  
>  CMPC ACPI DRIVER
>  M:	Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>
> -M:	Daniel Oliveira Nascimento <don@syst.com.br>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Supported
>  F:	drivers/platform/x86/classmate-laptop.c

