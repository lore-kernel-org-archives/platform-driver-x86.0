Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A5BE1531F9
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Aug 2024 07:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725003501; cv=none; b=f2wm5GNsnH8B99O+DL6BECfUp2k8hzRsXtfXusgHMwp0uGq2fdFcRW5fs3J0bcshXiGH4fJwObqS4PWZAJgBdcSvJ2W5y8Jnlem9tcLVYRiO/Vm3z4LXJAvqP/2tezjLxyW54MN7TikH4Bge1mVfV2D4UQV+nfTSjGxwkrVWf30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725003501; c=relaxed/simple;
	bh=iim98PeFYn3vJGWje/LaVJf43um3zVJgFETR5s97CbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtd+7Fa8IHUOSqbaqszUvv78smZ1yMSoiKjF8Iumnwc0QxZ0ybMYDKvg1wAeYz8f02QjHBXqTW+5E3lWbj8ImmvPW+U4f740GBed9yOqnC2/j48Scwnw6YvS2oF4g+OTrh6uSb1tBOB41xskZYi2dhY6bLCAR3gqwansk3V7jw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H4m3a85/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H4m3a85/"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5333b2fbedaso2446016e87.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Aug 2024 00:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725003498; x=1725608298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iim98PeFYn3vJGWje/LaVJf43um3zVJgFETR5s97CbY=;
        b=H4m3a85/u7BWX52cyDkS66LI5InqmTHHtpz1GwZPMAR8gwNh+7rfq7z6sm7kABoZPU
         ik4jHyeLChNI7RjnZv7FA3QWN5OdncIj+rxzquqqJycOsaimqpScqI+jJfJ2P3WZflp1
         bmFnLmSUiPMs3vuQ8/KK5rnwb0wTVr3yxUjylYMAXJ8NpOjUD5MFSGrnE8JNa8mJjQWx
         spKd+M+mYebxUkj10a6ejmtlL2PavZmCoDMxakZxmxaUpXxtRag9AZGCexrWuhRshq5N
         8X3OfbSFLa5LfzPKnjG7EP1dVQKDnaVod83/fyGm2frY7R01Yz7yL7mHcT7yx7Z/tNW7
         eEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725003498; x=1725608298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iim98PeFYn3vJGWje/LaVJf43um3zVJgFETR5s97CbY=;
        b=Z2KwFvNnumW5dig82WMok0YZPSbEtwzasz9Ie9eHNtxhj3gSN05JI43ulFM/4VqxbG
         z1QFHgAamLex8DExRnHDWM7wB6lid12GiPE5GzG7fJwoLk27UDftd3KwiwohhZvvB3oY
         gCVixnytEqkbvWN0cQTrS8vFIo2aLSSa1G/T4Ng5H6AEeVElm1cUfDrELPYnuoxWyREL
         Q6yO/8Dn0bDh6sTEAvQYkaCt0InRrfo7KavuOiB379UB3fCp1XxEKxh/NVA0DM25J0SV
         WLPOoqqICe4EOeH4Mb0/j1EhtxE2Njjv0A7iTKS7vTTu+4pIcxDwEdMuHnnPe3Qgcz50
         KX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW7VmJ/UkHEkPGLBsl4OwBC6XbhajdR5UwKEmLhzcYJ21lGEeXdoenvyj+1DwxCaxXTbh6SjPPpsYX5YPF+az4fbJ6L@vger.kernel.org
X-Gm-Message-State: AOJu0YzPHHF44mDmrjhb0VfU790cIDzLyeUg1tIjlXzBvSa59DVITiWC
	LHqm3MPS1VC4h8k7a0SdOg1KdQrvadx5PQ/SIIy9pVhWU1oKeD3iKBhZHKb7rVEyOa+8/75I72H
	5c15/IIE1/hKh4qSjTpY5nP5UEBR3MDlLo+sYIg==
X-Google-Smtp-Source: AGHT+IHxkixF1ZMKDWkS6k5VuHOdkobn09eGVtFhVdrfJCoaaBQNjgvaFXgDkx6pmJaEBqWJKiLdwrLgg2PPrR/fIJA=
X-Received: by 2002:a05:6512:6c3:b0:533:4591:fbf1 with SMTP id
 2adb3069b0e04-53546b05e20mr895512e87.15.1725003497545; Fri, 30 Aug 2024
 00:38:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ZsV6MNS_tUPPSffJ@google.com> <a2366dcc-908e-41e9-875e-529610682dc1@redhat.com>
 <ZsYu0SEy8ZUKEJqP@google.com> <0923283f-0b7a-4dcf-8d22-b55595b1ba35@redhat.com>
In-Reply-To: <0923283f-0b7a-4dcf-8d22-b55595b1ba35@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 30 Aug 2024 09:38:05 +0200
Message-ID: <CACRpkdaj73fJxU_8B8wNB_TffADNbFcQs59p9APd-YvPSzOoUg@mail.gmail.com>
Subject: Re: [PATCH] x86/platform/geode: switch GPIO buttons and LEDs to
 software properties
To: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Mark Gross <mgross@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, linux-geode@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:46=E2=80=AFAM Hans de Goede <hdegoede@redhat.com=
> wrote:

> Ok. I assume this is part of some bigger plan to remove platform_data
> support from either LEDs and/or the GPIO buttons ?

We want to remove any GPIO numbers from ALL platform data,
because we want them out of the kernel completely.
See drivers/gpio/TODO for details.

The large amount of platform data for LEDs and misc input devices
is indeed the bulk of that problem.

Yours,
Linus Walleij
