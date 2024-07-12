Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14100155382
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jul 2024 10:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720779873; cv=none; b=h57n+CQ5B34/WbxdgHILOJ2BT3bof5lag6urLxi2PbToc40HZ/MIlkCMaFTKWIyTyXP3Uhm/MZ8XT85Poo1QtQxD3IqFE0EjBJPGZNxZHwSCTMtiPXpJkCY5PmiFjB3dLi/RaP7cj1SuBoAsLHnxf5ztCSKSv5nbFWoSIvJ589A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720779873; c=relaxed/simple;
	bh=HqZiCRw2NLU2XKAhHPCRc0/GWvY5VzMIPC+2HkzIaLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tLizrhKBiYy74nqFSPdQbo4yewnVfcjkiDozka2+yE+OwM0zKDaKulU6uWLpJc9rtnnCs1aOYxB0u8D/+XaOXhminBFV/VeeBQafp3Th/rfAljI2naHz0MBdJ8esyBhiCnbRQzDFs++vB4rJj5hpIb6PnUY+N6iKh/1NkwqmVW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tTIjKRqR; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tTIjKRqR"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e0365588ab8so1771704276.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jul 2024 03:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720779871; x=1721384671; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+VRQCbcpx9R3q3II2rgwsC0Uz/Ighdl9GbELSByS5y8=;
        b=tTIjKRqR+vuz1dMdeuIWiVQmIYtXiFlOITDNGelgfxc57jadda35UWTgJ0Q9HsCapn
         crqsZOb4kxmTcin/grA4t4tXoHQfpEzCEiZ95ksSQx6+Ux9UIn7r2vYdA9b9esCACKie
         Zmfrc9MdIQRXbiVfb59a1ZpYN3gIlbpMk/Ei7R95IrSGJ08ZfKUvLHWWqmhd2B7TsW5K
         hvhaat62XpC/XqxocSgQFIGEu7H+iBlSplrf+a1vAhCvLA07biZ4RVDl8wgHRCMKDQAN
         DHPMreqKx2YrB1LejNFwUGq6RPIf82OPzHKlaaUUIewW6zdj95YAK1aj2jY+kfUyin5Q
         sS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720779871; x=1721384671;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VRQCbcpx9R3q3II2rgwsC0Uz/Ighdl9GbELSByS5y8=;
        b=bUCbHEWID50VYeL0dRPWQj7OvN3sJJxewqFMAzpK3m6wDyBfTy7P3GsnWLvKQROibg
         G1dJEUW8hWVxLXOtxQ9+Q+AQt/DVEExums7Cz7Aibu+hIHlclqXkGo5b4BrQHsWrr0iA
         RVSSYAwV427K7352k/mn96dVXU1Ri8umgpUD7LVW9tzEOTrE9bGF8UORXfXEZuV3A248
         Q+niC/kxIwLsfxInUtUne+CH6u+W+o5CCn8eiGHeOuX6nrIQlDdJ9OVgj4iWiZaevRhT
         Ey1fvKBKjmwfMp0U72/f4xmD65f2dUCjpESRKsm7MLJJvNb7B2ct5NEQhcsbt/ynHzOk
         tVaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx2zd177EbNkaxG+Y+y8wD7aInJBhfJIsFilzLoY7sS6dFJRIwCUofvwqAw+uvVTNjE0oMr4K6VIjxLzRxb/dvB4ogEA2/3ln4bkZR/fbBKJXyVA==
X-Gm-Message-State: AOJu0YyQtJ5WJINHKSnSrdEEeSyDHpKPavrM7NhMQ43F9xAXXT0wNgz2
	ZkW9JZOoTYMU0uhmXpjXCb/cfrhAhmKyMxBMMDTPELo9A1V2a18uDIR5DExWCc4b2DAMiyIv5eY
	hVCQjIp7m0+57NuResitJqefoWtbf5CqspY9NoQ==
X-Google-Smtp-Source: AGHT+IG2u7oPYblciDyGiNZd4/9k+U/KQ8en3SG5yXyygHZBORuC+P7l6UYsZj1IX1HbtiJTKp1OpY8918TJtuYQ6jg=
X-Received: by 2002:a25:ef09:0:b0:e03:a688:ab5e with SMTP id
 3f1490d57ef6-e041b0785b8mr12312862276.27.1720779871043; Fri, 12 Jul 2024
 03:24:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <80e17dffa8f4c1d3fdedd4d82df3a722aa4044ff.1720707932.git.geert+renesas@glider.be>
 <0e4c9ffdc8a5caffcda2afb8d5480900f7adebf6.1720707932.git.geert+renesas@glider.be>
In-Reply-To: <0e4c9ffdc8a5caffcda2afb8d5480900f7adebf6.1720707932.git.geert+renesas@glider.be>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 12 Jul 2024 13:24:19 +0300
Message-ID: <CAA8EJprLg8-BQT2OsLb5xSNVdFLf2mF6sSw_gAie0dBXawQFqQ@mail.gmail.com>
Subject: Re: [PATCH] platform: arm64: EC_LENOVO_YOGA_C630 should depend on ARCH_QCOM
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2024 at 17:32, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The Lenovo Yoga C630 Embedded Controller is only present on the Qualcomm
> Snapdragon-based Lenovo Yoga C630 laptop.  Hence add a dependency on
> ARCH_QCOM, to prevent asking the user about this driver when configuring
> a kernel without Qualcomm SoC support.
>
> Fixes: 5e5f2f92cccc29f3 ("platform: arm64: add Lenovo Yoga C630 WOS EC driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/platform/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)

Could you please add the same condition to the Acer Aspire 1 entry?

>
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 058a4baa216a83b8..f7539e5419cf1616 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -35,6 +35,7 @@ config EC_ACER_ASPIRE1
>
>  config EC_LENOVO_YOGA_C630
>         tristate "Lenovo Yoga C630 Embedded Controller driver"
> +       depends on ARCH_QCOM || COMPILE_TEST
>         depends on I2C
>         select AUXILIARY_BUS
>         help
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
