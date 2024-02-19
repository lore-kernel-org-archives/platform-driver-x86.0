Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8EE33CC4
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 12:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708347588; cv=none; b=i3OEu86smoTExpuUi8AFVUKiKlcOhsGcroKrVz/VpVGJDTuRLgZf3qaAvxUxlGJoyjnZ5a/VIzK9kkeWBwCXxBpPa33u15uojC/unl2HGvswnEhtK53pLvKxYg5xkIyX2IYDPJfCX2P52P49SIEOdbYOqWLZGBw9IiWpCqT3d4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708347588; c=relaxed/simple;
	bh=3Fi65QIGXfdHgZ04kFVl3weeoPhyvqfKbrI6gyowmVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2BlDuYWqWEiHQ9CHWhWXBgot2fSjtffnUVSxKLmJ3PWaYR+UR3pqa1FufsParLC/hkFUhfVys5LYiol7doaoud877U72xQQdrGRiJr0mAnO4NdWPv1mzdRfABlVCXu7+eNBX+uYcTiFyNVMm8TGhtpV+K8HgXbGM39lbOwMilE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UpPC2RyS; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UpPC2RyS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708347586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nMxKeQCC51WbQZLbi5a685VF0mibFkff8D67rJw7soU=;
	b=UpPC2RySwdQtHBpFs58kkNvzz+EDP1k97tfaOaKRyfEQXjd059wC2Elf6xcq4g3uhBZgJP
	74YY27x0SE1xcRKnOM1vU6uh/ilPpHh+kAhqYMAjuN7qIui4bEHpgvGZTuesTzrQbGqsDR
	52q3/CVoyHUfzUsvm9jNR8ydkhZQEns=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-uNbVGuJZNXeaLSlXxUsX4Q-1; Mon, 19 Feb 2024 07:59:44 -0500
X-MC-Unique: uNbVGuJZNXeaLSlXxUsX4Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a2bffe437b5so363449866b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Feb 2024 04:59:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708347583; x=1708952383;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMxKeQCC51WbQZLbi5a685VF0mibFkff8D67rJw7soU=;
        b=EO6dLs517Q8dgeoc2dYvmr+0GEUP6Cng9KxMWR7JMWBkDa4UfVtLsy8kb4xo5sqL5n
         SJZT9H9+UjSd/lBoTQY840T9k95212ML8+nVCiTS9IlTtksnzse48hCQZ0NC9lEXLUL7
         7/AcwkC3ZHpvw9OH1FTXsHq+5JYkrr8/cDnKmtSoQ8gDZXXQ9fJKQbUlGM9t/ww+T/Ww
         sZNdWipo51yXpviuRsZ/uq8k5pfec6EdFvuJ9ibepZn5M/MM1qHv4javwpfCrl3TA/8X
         rddJ0p8w3nHf6LLjWKAA1cn/PglHM6vnXkiGheQ11Rvwz+Cc4CaBH3MMBqDeYDps9KqK
         /q2A==
X-Gm-Message-State: AOJu0YwwkQumeR5TB7GZg7m/TfLRloYhfeHfEPPVbZT1K4ZVo6InFVoz
	/Qg19oDL6sKqctG+yjadRLT4mdOxgkEtO29Fj4FV5+oZCl9TBQk/X+EQzieq6ApTAI0RvIOCjOA
	cEINGTaE1DHwvhb0r9uxOwJMLytu/Xf8Dn9gjIAH1n9CFB6ibjQxqEpVHKjcZMvqVjNQAGRdYyq
	lyVlU=
X-Received: by 2002:a17:906:718d:b0:a3e:7cd8:3db7 with SMTP id h13-20020a170906718d00b00a3e7cd83db7mr2495946ejk.68.1708347583642;
        Mon, 19 Feb 2024 04:59:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0lzjx1aAmMTv/0aa0dQdKzvgpfGRNniCzHwLJhmH2u8A2FduKGrk8NWgLHabH3q9tu/SZwA==
X-Received: by 2002:a17:906:718d:b0:a3e:7cd8:3db7 with SMTP id h13-20020a170906718d00b00a3e7cd83db7mr2495929ejk.68.1708347583325;
        Mon, 19 Feb 2024 04:59:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a19-20020a1709064a5300b00a3e2b0799e0sm2404226ejv.4.2024.02.19.04.59.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 04:59:43 -0800 (PST)
Message-ID: <f0f64e2d-5e6f-4a3b-b57d-e617142eb08c@redhat.com>
Date: Mon, 19 Feb 2024 13:59:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Only update profile if
 successfully converted
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240217022311.113879-1-mario.limonciello@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240217022311.113879-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/17/24 03:23, Mario Limonciello wrote:
> Randomly a Lenovo Z13 will trigger a kernel warning traceback from this
> condition:
> 
> ```
> if (WARN_ON((profile < 0) || (profile >= ARRAY_SIZE(profile_names))))
> ```
> 
> This happens because thinkpad-acpi always assumes that
> convert_dytc_to_profile() successfully updated the profile. On the
> contrary a condition can occur that when dytc_profile_refresh() is called
> the profile doesn't get updated as there is a -EOPNOTSUPP branch.
> 
> Catch this situation and avoid updating the profile. Also log this into
> dynamic debugging in case any other modes should be added in the future.
> 
> Fixes: c3bfcd4c6762 ("platform/x86: thinkpad_acpi: Add platform profile support")
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
> BTW - This isn't new.  I've been seeing this a long time, but I just finally
> got annoyed enough by it to find the code that triggered the sequence.
> 
>  drivers/platform/x86/thinkpad_acpi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index c4895e9bc714..5ecd9d33250d 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10308,6 +10308,7 @@ static int convert_dytc_to_profile(int funcmode, int dytcmode,
>  		return 0;
>  	default:
>  		/* Unknown function */
> +		pr_debug("unknown function 0x%x\n", funcmode);
>  		return -EOPNOTSUPP;
>  	}
>  	return 0;
> @@ -10493,8 +10494,8 @@ static void dytc_profile_refresh(void)
>  		return;
>  
>  	perfmode = (output >> DYTC_GET_MODE_BIT) & 0xF;
> -	convert_dytc_to_profile(funcmode, perfmode, &profile);
> -	if (profile != dytc_current_profile) {
> +	err = convert_dytc_to_profile(funcmode, perfmode, &profile);
> +	if (!err && profile != dytc_current_profile) {
>  		dytc_current_profile = profile;
>  		platform_profile_notify();
>  	}

