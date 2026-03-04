Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A637B3A872B
	for <platform-driver-x86@vger.kernel.org>; Wed,  4 Mar 2026 14:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633541; cv=none; b=WEcAVe18mrJhKj4EbN7z0lRG3u0504cyCOA2U7DvJPcGUX2/iaYamGvU5gd2g/XhX63S07nRQ22xxxAR/ulMuPl/9nQ8GX9G0Ad359hoYHFjOOBgenmz2FJiq07Yt+dV734zkd7/+l4mdMLJLCuesjtbaBknGyALgCpej1/UCdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633541; c=relaxed/simple;
	bh=AIUtslso5iIkjbmHDbiOHIeMpp5uSmsKSDhK79tT/2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCXYeXPdqR2emhYEyX7p8pCbdalF9mzZl67Tgz1vmCOj8VYC2tw4kY5XOQGmIsLM4BwaRc2PDw2GFIVcgPp2eh0xnQTXlQPr1VsGLqkpV3cEZaY3Uvp3dY9OFQuFPBDN5MPNwxWq2PiRsLMt9j7ntoDhSOUrB3x61gC9f6BURsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtYOgxaM; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtYOgxaM"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-439cb5af25bso387533f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Mar 2026 06:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633538; x=1773238338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcD8XQds/RI2ieISdUwma/EFDfDwVkqqTIP0gyLSJTQ=;
        b=EtYOgxaMfXm6oYST1UOpTz2fkQGeF9dGgdT2swRQTZmkGJrqqBT2nhY/eiDXSJztx8
         CuN5LXY+spAQ5Ei4mJEpRg93Cw8WGugNwp5puMrrCBvs+K+XuqQ4xIz5dkSQWr7Q8cmy
         vkKbBbr2LdozYWXd7saasyg4AsPEhbSCBrPaSxrB1bjHD/RCf37W8Q/sicOUtMAZKg0I
         ZwDYIAhy76XGUIIz+x/38yhWNrj3PJzUntZSMUnT+w6yWaCWHuo8ECkAs2yBrv+2hlmZ
         iJEqrwO9UrZ4+YVPRpbf6sDIGDJHugJ3lkNj8e8ApJ/pWCQ7d5CqX0y4Rq/FsNBNwWQM
         Qlbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633538; x=1773238338;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcD8XQds/RI2ieISdUwma/EFDfDwVkqqTIP0gyLSJTQ=;
        b=vvselzu/6iBblviiQyAdx8Gsxzgnp1Winx4De7mG15xZudWTej+ivKkC/FpT9o8BA5
         bxsuheN9Eh7o6/edWHRAtL9DS0MSJ+hTLHRlSEO9d1/zs/PZHvZIXpvu6HKehHgJmabc
         UaE86dStHYCqbEIjwLXuIWOVmJw0RXUkwF+Inf2YfdqJ9+92O3uF/6KST4FiylZWRNtV
         LbDMXwRBsY7oIkab4/kLIAk5/In7CEht3imWS1N7Ud6BZgL8xCnTJbOObrxqdcZOuLda
         Ggm4y7kJYjROKFxpkLp2SrwDFv+vXT6W/z3I0FakLBIA77EoOmXWR7u4JwEKQLznOsJa
         oB3g==
X-Gm-Message-State: AOJu0YwcDZ5K/ebLDA3rNjSyPFDvO2DK85w6ilWXX1erhIAKQ/RLTFWK
	E8d5V2U3xLqmLPEi0mAavQqBWmVptbME8FD/Szf7CRB+xnm6OiBHeF3w
X-Gm-Gg: ATEYQzz0EW4JINW+G0Qomol5WbyIJqfL8ZQymrO3/P86o4W4Awq/v/qaeInRtWa6RY5
	5UQzoU9XviSE0wGC7pYudoB7tJHA5oePVaO9c1y+AVCV97WzBWVAoVrExWb0R+jgSDgDKhfGdqR
	dUN9NI53VwT4/Z18gltCbIVLI4pwHWCrUQhcv2TQzz3EVBef/pKI/iuKsWsOb55l5/ErlhEBvpT
	gpozwrAkKwj+WA6+EOKgeeShQCAjwev+DBKEOVU3wC4r0JbuijdsgUWs4luhugz/DuElXDEOKlx
	7pKtMRILayCAqqnOC9nd6pC3FRGxaX9Lac17t+M2WRbSyv9yEbaro0V7fNzoVF1VEQLNbj015cx
	XNDA11Wn1+do2jbUs/+pelp2c3I+q23UOezZ3OwkDFFm9ZcfJ29mtqtDIjTnUYbD3MshbPaUH1J
	oIXbCqwgVhnjh1qLGwZyQOeQtvhJE82XSSZg==
X-Received: by 2002:a05:6000:144f:b0:435:94c1:3714 with SMTP id ffacd0b85a97d-439c7ec5252mr4282944f8f.0.1772633537916;
        Wed, 04 Mar 2026 06:12:17 -0800 (PST)
Received: from [192.168.1.121] ([151.61.18.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b0549600sm29011943f8f.35.2026.03.04.06.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 06:12:17 -0800 (PST)
Message-ID: <92ca5517-24fa-4619-9538-415103b61bdd@gmail.com>
Date: Wed, 4 Mar 2026 15:12:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: change email address of Denis Benato
To: Denis Benato <denis.benato@linux.dev>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20260304141102.63732-1-denis.benato@linux.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20260304141102.63732-1-denis.benato@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 3/4/26 15:11, Denis Benato wrote:
> I have been using a linux.dev email since that is hugely better than gmail.
As a proof that is indeed me:

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
> Signed-off-by: Denis Benato <denis.benato@linux.dev>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 55af015174a5..27377c282e67 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3989,7 +3989,7 @@ F:	drivers/hwmon/asus-ec-sensors.c
>  ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
>  M:	Corentin Chary <corentin.chary@gmail.com>
>  M:	Luke D. Jones <luke@ljones.dev>
> -M:	Denis Benato <benato.denis96@gmail.com>
> +M:	Denis Benato <denis.benato@linux.dev>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  W:	https://asus-linux.org/
