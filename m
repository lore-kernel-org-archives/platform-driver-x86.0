Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F57F1714BD
	for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 20:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732307135; cv=none; b=OpxpuId9p6zhP8q1/TrgQ3wjpn2UQ4yzEtVu25LSCFjJMem32Qen1drr/XwQN7X6uRBIO8lMuNsfbo8Nd5DR8wy3YADaXbQRiBDMcab0QrKrN/SYojTvZV2qeVGM7lF9E73W0eV/cuiCwK1UucbvrBAZRFDCPVv6hacF+duRpos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732307135; c=relaxed/simple;
	bh=15QKZ7Lt7znC9HmjptUVaA9z+iLi4vM4ADkkfVuxDg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeVvrHufI8ofqGYikQSwBWY1gdfaLnLUPt4uXc+8hHknv8/OSIw5W6ro0fFih/fW9sMUN/zvQB9i6c5XWMOtXTdOvFN4kHdYDGOc0ZnWSgYUTrVfUwvzXMyt4ed6IfTzXRXlgrrnq7wbGtkvFN5yDmTZAptNIxEkzSDx5heONKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kmVvXUxS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kmVvXUxS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21285c1b196so25837855ad.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2024 12:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732307132; x=1732911932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jXoiiu/4jz2vdhkpZBwl+x88O4bNARb5DUcsBp7Dgok=;
        b=kmVvXUxSwn8kbAA4bePShX9yP6J2R+i7+/gIBtiyk18dB8wwEAfDthaNPZpuij9Wi6
         kuxi+uSmbbR+73aPRxSLGiP6ifJYOSNsk5hzi/KmDAKonzPcGA7rvTBglv+R6inL6x6a
         WXmXncaunOUWFmc9rWMkXiJ5qIpG3HC1zGGiEFr5g3WNIR5v19upGwzULPgdwK8v9iXN
         Y7WMXUqnhtslvX1RtNxkeehGTOS8msTanIKRaZaP2Enb+ovTK+5KgyxTzM3/1VZpYoSS
         obUkc/XztgH/yN0r3GY//OC1rfRO+nMUh/RcufpUmRQvVYbAnEYg0v5gV3TDZp0TVFWL
         a+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732307132; x=1732911932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXoiiu/4jz2vdhkpZBwl+x88O4bNARb5DUcsBp7Dgok=;
        b=JhXn01MzriuS3TsbYNiABMXVA3wxDEvo/sru9yB8CRO/HJTWmd+UZ+ISGum8EZuA0M
         8fBAaVXza0M3vHLe8K3/VGJuj7RvCgWZv05UglHBOP4BmCrProEnc4bc+6CmK40Nk2hB
         hj6QafHjMOKj6iojohKWxRzJBRSl8L+EoJMudgBzY+AUt3WGGm+1ocuSqnZzzgy9jnzE
         ClFMgZmLWb8pmFFzCZ640LB16ERjzUCU/gTXVoY/OXE3k7ptgmmW74X7DZh+KMpFVx18
         iFVo3nifhuOjoZ8toCTpXEy49pd3brorOsQjnX7tGVJlmoLGJoN+BnvYF9vWQpTFseEI
         8QMw==
X-Forwarded-Encrypted: i=1; AJvYcCWphh1UzoUToVLPP9qBXu4k9JdG89zZtn+DnQv5N43eIOnJIlZKPF9v+Pa3gxBZJ1LlEbzT5kprFp0coN3SOx3QPSpl@vger.kernel.org
X-Gm-Message-State: AOJu0Yw79R2GfarwgFK4NMw+iTstHVg+TtUo8bh2zDB4co9hcQt8UCto
	RCo8Uj1Zdffv41NSr7xMQy7uoV/q2WNoq4Kf1B5vfhn630SJvT4B
X-Gm-Gg: ASbGncu0Dq6vbyAi40lgI/A5AKHZcPZRqghRMtBoh4g9/NvGHqBur/6I3kQiBf5B76h
	U55OVt+XZEbB5sGYyLEVtWeGpRisFuEcvpi/Jw69SCwyAxjJGE1kxuf5k7f5+jcyuAb374PlXaT
	YI9arYLXimICqfDrsHmNRlELqVth7da7IBHf84AhRPVBjvvgcyunZgZ0oqZSl1czBUN4/TKRDeb
	JWxkHFC2fHT5IIOU7xxVYNpCOF8ZYUaf3ogLG9piChtsw==
X-Google-Smtp-Source: AGHT+IFLHVAoIvMWciLpUZVqBOcGquTCQ//y6MleWwC2nXEfyg45/EvgZ2A5M7WUnbtAnyAp2ufR+g==
X-Received: by 2002:a17:902:ec89:b0:20c:7ee8:fc3c with SMTP id d9443c01a7336-2129f69914emr49514525ad.22.1732307132415;
        Fri, 22 Nov 2024 12:25:32 -0800 (PST)
Received: from alphacentauri ([181.84.94.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dc2517esm20313335ad.269.2024.11.22.12.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 12:25:32 -0800 (PST)
Date: Fri, 22 Nov 2024 17:25:28 -0300
From: Kurt Borja <kuurtb@gmail.com>
To: Joshua Grisham <josh@joshuagrisham.com>
Cc: Armin Wolf <W_Armin@gmx.de>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	platform-driver-x86@vger.kernel.org
Subject: Re: Adding a new platform driver samsung-galaxybook
Message-ID: <qsdbzbvpwlrnx2sqhrjfg3rukbm3z5gjkyjwlwoc3jnd3vre36@72py3mfwwsse>
References: <CAMF+KeYus9dW00WNJMLVxLLHdG9JgCfrGJ491fu7NM8GAEqqCg@mail.gmail.com>
 <fd4a30e0-b5bb-47d7-8173-312417dce215@gmx.de>
 <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMF+KeZkqwnBNT4vVNLEC03zZqSTSAE-Z=8j9ZLACf3yBeun8A@mail.gmail.com>

On Fri, Nov 22, 2024 at 06:29:57PM +0100, Joshua Grisham wrote:
> Hi Ilpo and Armin and thank you for the replies; these are exactly the
> kind of questions I was hoping for! :)
> 
> Den ons 20 nov. 2024 kl 13:00 skrev Armin Wolf <W_Armin@gmx.de>:
> > After looking at the driver, i would advise you to drop the acpi_driver stuff and instead
> > implement the whole driver as a platform_driver. Does the kernel already create a suitable
> > platform device with the name "SAM04[number]:[number]"?
> 
> Yes, the kernel creates an ACPI device exactly as you asked.

Hi!

If there is a suitable platform device, your platform driver already has
an acpi_match_table, thus you can get your acpi_device with
ACPI_COMPANION or your handler with ACPI_HANDLER. Check [1] for an
example.

~ Kurt

[1] https://elixir.bootlin.com/linux/v6.12/source/drivers/platform/x86/wmi.c#L1239

> [...]
