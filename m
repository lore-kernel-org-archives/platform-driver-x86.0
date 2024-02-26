Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B625C12BEBF
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 15:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708962582; cv=none; b=tzW5azajbXE5wse24tPf1PQLKXOygYlurJg8Ps/Z7gKNgBNpl4L9A8pAzmh+gMl94jvzBmk+fpRl9w3bQ1J9uaKoS9EBGIS4QcrE2WxyN+luKKK5YxNHvZHIJhcxTbO8QtoR4XofPYVaXqdAH9u6V2LyAQIZRR0+xfAGVekGhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708962582; c=relaxed/simple;
	bh=Oh5CsBBlobRYygAYm4MkY9Kh99N79OCnEqvDML9+AVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lAQfud6PDyyleRLzMi1loPMixMOWnU4KsPaddY/KQOE9IGxaGm8s+86ND6yh7Z5kpCcB4U4VN4JiYYTXshQvQY6CzMQ7BewYM5bHmHBToJnVOvp0aoJlcARq45P1l4ZULlR1WDcbyiXEPxU2zSDR4p1V5RuoxVQtHZHeYmbDNvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aSa0ebvE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aSa0ebvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708962579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EhYMCOuaBDTEq4hFntP2XN/jZc/12pZFEht7y217G0c=;
	b=aSa0ebvEFA8IV6/2UpJnRoRTVlzY9TTcDN5w4ETNZLNj8pgQAz5xa4q1oZEZHA+qSnNQuQ
	0028V7JnFK+29XWnHwMt96h7N2SMYzymDWLW+zNRJn9iALY8K5O9Tu5VS6Y9e/VzAXeq5B
	UFLfQoWjQ4U4Yb7isQwsGBm4RGbgxMI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-m-r9sSKZPE-V4jXCAlGtKw-1; Mon, 26 Feb 2024 10:49:37 -0500
X-MC-Unique: m-r9sSKZPE-V4jXCAlGtKw-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6901226a144so6681686d6.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 07:49:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708962576; x=1709567376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EhYMCOuaBDTEq4hFntP2XN/jZc/12pZFEht7y217G0c=;
        b=KBoGhMXvVJl/g4Yo93YwM3nM1xZ0LyEPcfce+cGb2GCpycLLt2PcTPHc269fmJAxbz
         qUpwCehpumhWsZwbBQmHPUv1rtDxGgAtELRDerDp3ol5UZi7QAIu+0odo7nvCOZ8f/C1
         MQm/si1FoTz+meBDOBPJsa6vaN4wZ77dae96ublk1DTSdHvxdLGkM8VIG+6tXbmjF3GY
         BEG6HJZmqcw0CRXl1fkSBp/M6GcDJCBjTHYew+zkfKuTxeCL0HeBkxLWQbHPlRtsA4J3
         3ImqT4FbczT6JAgXgaJJJeWzVnJEmxAwbbCwNqBHsTpxzIecuio319ZxY/lM9K7tGvny
         zE5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWw7L/muxrT6awxa0geb9AmY0I9f0fBE4slgZ2gtaK116Q0V5B1ycCgfF3CqlPfQXO+HQNsIxTflvPz+63aPx+vo4N7ZCXp9j0GUiG6VBXgEC7E9A==
X-Gm-Message-State: AOJu0Yz4ySx5So/kj1DYsEGpTvZmmzrK9Zgrxa6Pt94kg9YNGVrf83fz
	i8u+FhUn/s5WmJ0s0De+8pm5jaliCNhM/qvlAM5I6dCViF1ac0U4V4eUa25wkskx4AXROe2x1FO
	Wmxj7EsQvTOCxLz2yz4ni90nZIGisr2su1yC5kBhWhukZzXXe7uuRNY9ko4oQvSRFs+ju0zU=
X-Received: by 2002:a0c:f103:0:b0:68f:4fd6:ae35 with SMTP id i3-20020a0cf103000000b0068f4fd6ae35mr8036378qvl.6.1708962576709;
        Mon, 26 Feb 2024 07:49:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHnNM8x1qAleAD38+Gu2vMTLOhwZtljhx/ociuJFMUmmimUfOHk7mxa9cX80DmzHTa50cvaQ==
X-Received: by 2002:a0c:f103:0:b0:68f:4fd6:ae35 with SMTP id i3-20020a0cf103000000b0068f4fd6ae35mr8036362qvl.6.1708962576461;
        Mon, 26 Feb 2024 07:49:36 -0800 (PST)
Received: from [10.0.0.33] (modemcable096.103-83-70.mc.videotron.ca. [70.83.103.96])
        by smtp.gmail.com with ESMTPSA id em19-20020ad44f93000000b0068f0ff36defsm3035281qvb.47.2024.02.26.07.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 07:49:36 -0800 (PST)
Message-ID: <def1a153-3cfb-431d-a7d2-a13bb7d65f4f@redhat.com>
Date: Mon, 26 Feb 2024 10:49:34 -0500
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/mellanox: mlxbf-pmc: Fix module loading
Content-Language: en-US, en-CA
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 shravankr@nvidia.com
Cc: davthompson@nvidia.com, ndalvi@redhat.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
References: <cover.1708635408.git.luizcap@redhat.com>
 <170895404513.2243.14840310263795846559.b4-ty@linux.intel.com>
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <170895404513.2243.14840310263795846559.b4-ty@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-02-26 08:27, Ilpo Järvinen wrote:
> On Thu, 22 Feb 2024 15:57:28 -0500, Luiz Capitulino wrote:
> 
>> The mlxbf-pmc driver fails to load when the firmware reports a new but not
>> yet implemented performance block. I can reproduce this today with a
>> Bluefield-3 card and UEFI version 4.6.0-18-g7d063bb-BId13035, since this
>> reports the new clock_measure performance block.
>>
>> This[1] patch from Shravan implements the clock_measure support and will
>> solve the issue. But this series avoids the situation by ignoring and
>> logging unsupported performance blocks.
>>
>> [...]
> 
> 
> Thank you for your contribution, it has been applied to my local
> review-ilpo branch. Note it will show up in the public
> platform-drivers-x86/review-ilpo branch only once I've pushed my
> local branch there, which might take a while.

Thank you Ilpo and thanks Hans for the review.

The only detail is that we probably want this merged for 6.8 since
the driver doesn't currently load with the configuration mentioned above.

- Luiz

> 
> The list of commits applied:
> [1/2] platform/mellanox: mlxbf-pmc: mlxbf_pmc_event_list(): make size ptr optional
>        commit: c5b649996ac63d43f1d4185de177c90d664b2230
> [2/2] platform/mellanox: mlxbf-pmc: Ignore unsupported performance blocks
>        commit: 4e39d7be4123f65adf78b0a466cbaf1169d7cedb
> 
> --
>   i.
> 
> 

