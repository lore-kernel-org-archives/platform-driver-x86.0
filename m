Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB83C1EF0B4
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 14:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729520602; cv=none; b=X+VPY9hKNYpMTC1JO0pFribu8DjTRzGIGsBbE4WOYRG98JzFgEVkFLtOWz6O2BYkc3fvCK+balbI9i+9X9izORgVnQrNE96bwJ8MjKXsA1qtQYoEacc2SPgFa2eQ5s0MAAzs1cZtaiMwITUfARAhq3HCgu0A3g2ekim9CfZX2sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729520602; c=relaxed/simple;
	bh=HPoTI4wfBNW7mlNWtn/TpUsjOkIC7PizoJKkN5K4VeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jko6CiemZxj0UQekFQfhW0gKJ6BBYqDCsJ0/5g4sOji8aVue/7kw67EFn+LduVHNmha5V8PtSaj5f53Tu/mBI2JzoXwTE9Z7H34pv66ojIJov7GWssKQYN3IaLEbtjloDlwI0/G73w/toXL6tncSzky61px0OnxAeRdt0hFt9cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FNhjfg+j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FNhjfg+j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729520598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45kL1DgBIGNDWwId+Q2AQnmJdYSSdQR/WS6d8E/wgHk=;
	b=FNhjfg+joUlio12ekW6ltNZTLZ6az42EVZOXT3zqy1+OQQKaeBcIwxWsCp3S+X95gmsREc
	wQttcpF3PHbtfMIBY8CwCo/vSyf5r2elOXyD2ZeiLU4fu30hra+s/9Ebs23s7Cn8YTb39j
	AotaAt09PubyDZeJQSLUVWMTPUvkZbo=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122--QDtDbtiOHORp_GRvk5kcA-1; Mon, 21 Oct 2024 10:23:17 -0400
X-MC-Unique: -QDtDbtiOHORp_GRvk5kcA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2fb60277fb2so27848931fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Oct 2024 07:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729520596; x=1730125396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45kL1DgBIGNDWwId+Q2AQnmJdYSSdQR/WS6d8E/wgHk=;
        b=CEbHgRC1xmaGEq2VW12iAJz7ybSjI33W1LTH78OiWkgVbBp3FkW4GgWGEbLltjG6l/
         w1JEUG9LVBP1Q2+B9jAapu5gefiVLiCiYvVh3mv8fJmosVHGqVYZKo8/hOZAa+wrcEin
         XLQfWkqEB6xxyt4wSvfN4nukULZyJOZoO8VQez4QpYWY5uUEEZq61IDrDH2dGBvcOLy9
         muOTLuvxCjpvwsoLvQZtPetRLnz3YxYsCFxnNq0o6T97GegLNsCweVFuAgTFnYp7gOdj
         lBuWgCrKTur3RLyeJZcSzC9eIfa61Jll45c9cjvc9KKuwsy3BH3MlEd+TCLa4z6a9Q81
         frxA==
X-Forwarded-Encrypted: i=1; AJvYcCV6ucbXKcPCp27IpsBZJEVHt7oRNlsRiXtBXWm6z1WcAIweNTK3PG1F/AxVrOQL3KjY4nJXoRY/Vdaw4iul3epxymwz@vger.kernel.org
X-Gm-Message-State: AOJu0YwjB/pCfieqYvJU1TwAsst7EFpQgdnNhEZ+Lr0bUf+vmIffaxMa
	6Rbu6SVQTdqOfn7MlfrU70l4mPoQI0m23QiCp4dNCMhUkfDrdZBwwcKGaRRdW7nPvq/0yqa796N
	VZg7WRaNgGpqEMEkhEbGTm2ph73Vkkcx/KHdCbllU84mdZSshlksTtehW77nVIdNXCoEj8uc=
X-Received: by 2002:a2e:b04d:0:b0:2fb:411e:d979 with SMTP id 38308e7fff4ca-2fb831e6cb9mr43476701fa.31.1729520595605;
        Mon, 21 Oct 2024 07:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2XIDzdCLYKaFR5S8qkVFM9Oys5/ZSPG7zKV8k4dZvGRurypxE4/MiOXmNLCASYpED62iHAA==
X-Received: by 2002:a2e:b04d:0:b0:2fb:411e:d979 with SMTP id 38308e7fff4ca-2fb831e6cb9mr43476501fa.31.1729520595051;
        Mon, 21 Oct 2024 07:23:15 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c72757sm1980539a12.92.2024.10.21.07.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 07:23:14 -0700 (PDT)
Message-ID: <40a76a97-b3e4-42cb-bee2-ca54731cc8ef@redhat.com>
Date: Mon, 21 Oct 2024 16:23:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-wmi: Ignore suspend notifications
To: Armin Wolf <W_Armin@gmx.de>, pali@kernel.org
Cc: ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org, siddharth.manthan@gmail.com
References: <20241014220529.397390-1-W_Armin@gmx.de>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241014220529.397390-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 15-Oct-24 12:05 AM, Armin Wolf wrote:
> Some machines like the Dell G15 5155 emit WMI events when
> suspending/resuming. Ignore those WMI events.
> 
> Tested-by: siddharth.manthan@gmail.com
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

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
> For some reason mjg59@srcf.ucam.org causes a local error in processing.
> ---
>  drivers/platform/x86/dell/dell-wmi-base.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
> index 502783a7adb1..24fd7ffadda9 100644
> --- a/drivers/platform/x86/dell/dell-wmi-base.c
> +++ b/drivers/platform/x86/dell/dell-wmi-base.c
> @@ -264,6 +264,15 @@ static const struct key_entry dell_wmi_keymap_type_0010[] = {
>  	/*Speaker Mute*/
>  	{ KE_KEY, 0x109, { KEY_MUTE} },
> 
> +	/* S2Idle screen off */
> +	{ KE_IGNORE, 0x120, { KEY_RESERVED }},
> +
> +	/* Leaving S4 or S2Idle suspend */
> +	{ KE_IGNORE, 0x130, { KEY_RESERVED }},
> +
> +	/* Entering S2Idle suspend */
> +	{ KE_IGNORE, 0x140, { KEY_RESERVED }},
> +
>  	/* Mic mute */
>  	{ KE_KEY, 0x150, { KEY_MICMUTE } },
> 
> --
> 2.39.5
> 

