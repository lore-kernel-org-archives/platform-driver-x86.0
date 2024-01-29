Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF2E537FF
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 08:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706518760; cv=none; b=lA9bWT431490qlsivn+smyiw6gGdCSa3/DuSVZl1rd3gajulrZMDl1K/uSAkHesWNkSzbGi3ETL32n5VuHHyh5fYD/gNhB4xtoXqL55Rtif48T+LTh2v0yc0sRriX/Jd645bxJ2oEMxMcdmzUrVZXD5sIko4ub7jrdLVWXJ7dsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706518760; c=relaxed/simple;
	bh=SjgxZgEJ0zE2xG68u2eXZKUCpalABl62X6Kdteb45Og=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cvPyr6HX665VCPUI2Fd7B4G+zKHHD5jSjDxa9jFp5GMN/l9j72b7XekxoLn2kesPaYQBfxQkzd8zJpBA4rK3tDbDY5yItuZB91j7N41Xj6tb7yzDbJ23UOvxGzeo75paHAl477NjrBziJpdPdLF9GC5MxYlP/oZPgSNJdnE5Gto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CatMXJ9d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CatMXJ9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706518757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mz0NTo7T3zvbZQvTXWnrEg5YVgGabir9bR7S1JM1MOk=;
	b=CatMXJ9dkl5cWEJMzT1lh9Bu1vWmlD2yOe6nVdZ0y12+m+v5HffH0pWo3p5gOHGOcoVqxn
	beli+h68IirFIO+t7lcQc2K3MOf1fjMtTYa9luo27oLF2XgdHyNj2OmhkBRPfSs56dOoC5
	YOqaPijvw9eFGP4RWG1knmXHwRPwFic=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-IPfanymOP-aMDbosm6KrPA-1; Mon, 29 Jan 2024 03:59:15 -0500
X-MC-Unique: IPfanymOP-aMDbosm6KrPA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a35860bff34so83922566b.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jan 2024 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706518754; x=1707123554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mz0NTo7T3zvbZQvTXWnrEg5YVgGabir9bR7S1JM1MOk=;
        b=kk1TTwVQMVBzy5wCqWesmrtmWFjJqelmIHueyEG8BfEJlALGTkPNKlNBscO0uG0eNV
         lGAXpci0nRAoAM2Exa/VZxS8hMD8AU/h0IZDojoePLAXOMzcF7lzl7Yn+dPGahCkcnPl
         1hphhZwjIUvY/6z3SH71ZHLVdhCygq9FLSs9dE271qSVAmdjC4zu3E9pm1o4bnZcaKI+
         4icAZ8qv1QMzlPlsyMqFfPzpFgrrF5cetyt4nip+UvG91mf7G1LBtBnCVu24YvrcU7Zd
         RiuGJCqmg9u5n5pp0kzk+zKD+goGuBEgt1ROBQQsGyWm26ZFxdSyKllqDmiWkOWCXOE7
         KyPQ==
X-Gm-Message-State: AOJu0YxmEQRWsVthxbCiUsDutyDPBIi3yxWnGSCHztthtfp8L3DDfx9C
	dhIDNZhGEhUmgLMcm4nq0WaY1BETI6lEpSNHk+NwUv4nxX6QkbWsOP4r3xM+E5hX3xdSVYhO1g/
	iqXsO8fEpbeRI2yMKbqqFLi5fxYFYTiekizOeFSnlGK40dV55S2HU5Lxe15sA4sy0QaZPM3s=
X-Received: by 2002:a17:906:a219:b0:a35:6601:e401 with SMTP id r25-20020a170906a21900b00a356601e401mr2937545ejy.5.1706518754370;
        Mon, 29 Jan 2024 00:59:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHf/JYvN1cOiBBS6nmvk4erwpIf/mxbTQA/LtkKLl9FgSRVphAi5XD9/o+bV8doYWxYglG3RA==
X-Received: by 2002:a17:906:a219:b0:a35:6601:e401 with SMTP id r25-20020a170906a21900b00a356601e401mr2937532ejy.5.1706518754117;
        Mon, 29 Jan 2024 00:59:14 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ub14-20020a170907c80e00b00a3109a492d4sm3647222ejc.20.2024.01.29.00.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 00:59:13 -0800 (PST)
Message-ID: <bbcf1b06-2a65-4f87-b15a-583a668dfc1e@redhat.com>
Date: Mon, 29 Jan 2024 09:59:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] platform/x86/amd/pmf: Fix memory leak in
 amd_pmf_get_pb_data()
Content-Language: en-US, nl
To: Markus Elfring <Markus.Elfring@web.de>, Cong Liu <liucong2@kylinos.cn>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>
References: <901291c8-ca9c-47b2-8321-256b314690da@redhat.com>
 <2b3b4754-4c20-48ef-9844-f5db6a7f527e@web.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <2b3b4754-4c20-48ef-9844-f5db6a7f527e@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 1/28/24 11:45, Markus Elfring wrote:
>> Thank you for your patch/series, I've applied this patch
>> (series) to my review-hans branch:
>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>
>> Note it will show up in the pdx86 review-hans branch once I've
>> pushed my local branch there, which might take a while.
> 
> Will development interests grow for the application of known scripts
> also according to the semantic patch language?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/dev-tools/coccinelle.rst?h=v6.8-rc1#n71

Markus,

I'm not sure what your question here is?

Is it: "Will coccinelle scripts be run as part of the regular patch
test/merge workflow?" then the answer is that there are no plans
that I'm aware of to do that at this moment.

If such a thing were to be done, IMHO it would be best to have one
of the existing CI systems like e.h. Intel's LKP test bot run this
on linux-next, or on all the trees LKP already monitors.

And it does sound like something interesting to do, but someone
would need to actually setup and maintain such a CI system.

If the question is: "Are patches generated by coccinelle welcome?"
then the answer is "Yes patches generated by coccinelle are very
much welcome".

Regards,

Hans





