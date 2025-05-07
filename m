Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4508433AC
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 May 2025 07:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602868; cv=none; b=JPNuXW9qzqTAELDBW9LjD/ljhNrjCgJTdWAeG25Z7crbU5K1FPkMn10unXpkyBEFr+xAm+qdAJonfP4Oy2qWdABH8SycwaUF312280c8FcsRNu2IrLp6U7HjR//IHoarjyuSPRGCvsUCs3ET7ETGY2EvnHaUNfaoJcVHrnvLhM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602868; c=relaxed/simple;
	bh=/aX5bq5YfO+uIdJxRQLwfj4EO8JDWB5QLAhlLEbPTYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=os2AvZBrH9HjNw21eh+2KSl52ezHJc8NaUazQG1hITDBCKwP8BsdTDH8ip124yOeYL7CyPYjekWDe1cyPiR4UrzYyQPvSqLHpTbhXIR6p+X1lDEjH8VMZKYF6Od3d1x6CXK4+UxkiguCx8blrzi7SFWylx3iGEPOyOjNdFZWhU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SIv3DKE1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SIv3DKE1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441ab63a415so65386435e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 May 2025 00:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746602864; x=1747207664; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bOMLVPLMT/Ti/Aagdn1vs0WyXQKd27bYNVBAQVXwrMY=;
        b=SIv3DKE1b7MPrOq2z+hfp6sHYxhO6m3ta6BwX9eIvWXpb3Ht4zUh3qZF27VVC2S0up
         XFlW/oReKsoMmHUcgCCpAKcMiDPunKQhZTjQAfG1NRJacAywE3VR+WOAG2Fn4RYRx340
         HIhgxjSDVre4qX+7AvxsxhpSK0+EKXz3RumB2grMZ7GDjmLdb6Cn3DoG2S9P8dcQGaek
         LLqOuLgYmRnrnd3PiRsQUaTNuOXfVv/BE26oWvyUWzqa0g7cTkpM1jEeg4CSdpwe+5AV
         KYJmXwXJxA6D18anPZWDouzsEb/ZCAjgF6iCcackWx3gpCCnchi1bHeuPng6+Ns7cFSc
         399g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746602864; x=1747207664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bOMLVPLMT/Ti/Aagdn1vs0WyXQKd27bYNVBAQVXwrMY=;
        b=BCr/RMTvxFkRfNypWdtvsOo8Drwkp2CKoTkd+Sg0RTLwuWw4mmdZ3AcmrsKuLPrkJo
         a9rZ51BvuNiuGdG1K4ED75M6Q8jaJw1RXOXVdZZ3acehsEhZy0QzRXd18uAK5JzUePtn
         llD4LgODDjfL5Fu5ZwuaYmXv0A0E8o/3X9bjsuPDKgqlWHF97Zq8YzP+eHhGDy1H2Zsh
         ZwGF1YNRWNUrK4EKcsisOJL1ldVj3Vg6Wp0lmAQVk5U9fWS+ZRvvB2tIOivnOj54vtQC
         c0rhgJLE8GGY/w9CKIVfvYZ4BB1GDW2Qd44jBdA6NFW14iJawxkvembfhZwwjKKRG2yG
         jyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqfHaLPSlroVlL3te4YayZ8KB7TCEkMydB3G9UWUkpbvCdoltC9FLAA982iMa6e21bAhOZbRxLkGhxffuQ8ZeNfQDN@vger.kernel.org
X-Gm-Message-State: AOJu0YyKCPIlgk2RwLyMczCpNSEQeHQNzUqhW0kksAgGnVWXUFCNw3QQ
	crYbitQEoESZWWC0xZJ0BdQ/gY/2siQbAtqasiGr2sFmK0E15bcfxQrLNUWdApIxuUP3GdZNT20
	x
X-Gm-Gg: ASbGncvsa2dbPV2/HjmT1kp6nX81q0Iz8YOpAmNFEwJ4hd5TtFHs51geae7p97E5d53
	dGv3j9jH9ztdoE8YXk4acr62uyeGD+gbSbqHXQUpSm9F1nFjq97SQkPjMyJ05dK6tZ9plpIvwZU
	Zws9xYUOAv+ymA/lEefCE0gacEKKkoHdQEt7shn+XEoJbesWB9cGPA5i2VK1Bbsyycqk7nMiyQe
	4kptOaJr9L7k637KoaPFSGmuP4gKr406aJ96P9YAzllTAuaNRy/e4xfu75rh7cmdHFdY0iTTZWy
	8yrWKNb4/h3fRfpoWmN3Gi3h8RE+JLkhdqUxyyJGCwhgYfU1Ro8FXehF
X-Google-Smtp-Source: AGHT+IFhuZiy2LXE1Ti7k4HVpHa/nRycztYO8afegHsWo37CiiWmYZ8KRyYov/WLrmkt/fx8CBDX+w==
X-Received: by 2002:a05:6000:4312:b0:3a0:7a5d:96f6 with SMTP id ffacd0b85a97d-3a0b4a14a6dmr1880366f8f.38.1746602864043;
        Wed, 07 May 2025 00:27:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099b0fe92sm16213193f8f.68.2025.05.07.00.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:27:43 -0700 (PDT)
Date: Wed, 7 May 2025 10:27:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mario Limonciello <superm1@kernel.org>
Cc: mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86/amd: pmf: Use device managed allocations
Message-ID: <aBsLbAQxgQD0_05h@stanley.mountain>
References: <20250507020838.2962896-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507020838.2962896-1-superm1@kernel.org>

On Tue, May 06, 2025 at 09:07:23PM -0500, Mario Limonciello wrote:
> From: Mario Limonciello <mario.limonciello@amd.com>
> 
> If setting up smart PC fails for any reason then this can lead to
> a double free when unloading amd-pmf.  This is because dev->buf was
> freed but never set to NULL and is again freed in amd_pmf_remove().
> 
> To avoid subtle allocation bugs in failures leading to a double free
> change all allocations into device managed allocations.
> 
> Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2:
>  * Correct commit message with correct offending function root cause
>  * Switch to device managed allocations.

Yeah, this the best solution.  But we still could end up calling
amd_pmf_tee_deinit() twice if amd_pmf_register_input_device() fails
so there is still a bug.

regards,
dan carpenter

