Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE4841837D
	for <platform-driver-x86@vger.kernel.org>; Fri,  7 Aug 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786102831; cv=none; b=NZ3VBGOOtxDhRqFgNZh4xQXDKiYGiq0cEFO0Q4uoBxC5qSnHCqyHoO01HNkEO3Bzh5J3FJnBZCB7ZWL+CM9kbs66fGGZGxoUJmiJIZuTrE+0QhKhbqTwhVhudbPPGutrl5AW+OVH9UFsUN+Z42gUkfFrNMOlza+qbxZrs1/Gm10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786102831; c=relaxed/simple;
	bh=N9knYDZBFNPryH7Rgx/98qENXC5GJq8BV/99VAlyTBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFeyiJm5FEe58KrC19pkEAKGP+GDPK22XRNP4awtXws2GW0v2PRT4VB+ehtsrkchJue1JINK0BLw58KkHcCvObrNFPvjHtT1IWTrPM7tjOnCgCRlzk+nyBK7rpKbkdtQIY6EnpTvsmi/7sxK7SE4wumO8U2+EMYc3+XeygFOj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net; spf=pass smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b=ho+AG7QT; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard.net header.i=@minyard.net header.b="ho+AG7QT"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4a416619cb2so2044553b6e.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 07 Aug 2026 04:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard.net; s=google; t=1786102825; x=1786707625; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EMmFXrjSrpeG4wnNrWhFFN4HfKJ+fxYW0scJBNmq2ko=;
        b=ho+AG7QTq0tBcJO5iMiHZPcbuvMjiKbaKScbh/9yZZWegr6dvgITG69snkYO2dIFoQ
         /d4iNi7CkQphEXYa3chPWwg4PyrIyGHpjqwXAdNxKU3GS5IJuxMtF6NpwDtfcgGazUst
         XyXT9hXsZfusPVoCMHdZy4j1bKU93GQ9zG6q+q0+gGw/PXJGWDzztmwIcgMSheCuKCwi
         nt0Ox8JXCQk6hpZ2i54sJylhFJZCGEJDI9T7OpmMYR7R96J+ec74H1CewTXECCyE0b4V
         EsF6bUkUw2rLEs1Lkc54X1h41RSYJBZyYFkA6p6w++g6IMHcnV41mojOOnslIQ1sTEf3
         /NFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786102825; x=1786707625;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EMmFXrjSrpeG4wnNrWhFFN4HfKJ+fxYW0scJBNmq2ko=;
        b=bp0paSi9upHyCWtbkiws3nLUwkDKMvoRRL1CKtMvZYZ7xXQsj2M0YybZ88jCegb2K4
         xnupMb4f6jvXeEN9HZPNzZ4NzIxsVoN/51eobpHAKJ6+ueJPxwF0l3uMRqqQsmE23mjH
         AZRBiYe0JdyPgr1hx1HTV4TC1t9e8RNHDeFo42+kwnvCGuHeT5SlfLiu9Z6DQKz05XJU
         V75RPP503+uTdhZiIxNVPBceQ6vIalcxObzw4vBRXWXnrwztzR1C1p5G1kpdbusTYUu6
         yWQ/WY/suV+JJNtz1Jq35gWRI13HGQUfWr4fCaFVVGTMVLyof8ija4d797WqCBpJoAQZ
         bJow==
X-Forwarded-Encrypted: i=1; AHgh+Rp4lhhogZVzn+lp2VMzY8gXGnRFeqxEeRgQ22Yz8o4thsNYG50x8g8xUUlwA6R+jS7bxvPMvbXkRuZ9Es3OC1TRIgWu@vger.kernel.org
X-Gm-Message-State: AOJu0YzpYj/gLNqK/4SqMXC8dNiu2K+omh0spJ/6bamq7//jA6OaaOSn
	i6nLPjnm2ygauXQbBVAdOEl5IvdTDY6uzbmGruM+LRNpM98+aUFtrkqBnV7HJRCfbGg=
X-Gm-Gg: AR+sD10ey6E8UnLdlKCLTKUN3TVSzC40jpiwUo3IwNT5FzprNvlmWA4XEpgNgEH7UGv
	yzjxlXGg7zqxjA85n6/1r1QY9lyXIxP5mtEZra8QVVMIIf+AWuNHBByri7/OCwjKWWlqv5+b12v
	R5EqT8m6Af/6Jpt+HtA7oom+R6CDVxy3eN+STpX8T/GxnOAsUDi8HUsoU8osorK9AuatUXkPtyB
	HsAbNOhH4TFR8gxiHVEuTwDe5H1CD/+JMa0Ac7PXinwQZjPqNC1BYXpBdGX9r/FfPgwJOhGxR+q
	J60ZuLMYMgism1Ra0LRbmbtLVlzYXBsaAEGral9BhYDDMY+SeaFfoISLaKD1V8wr6D3fJNU/F+Y
	f/ixhgkIRpRQFA28aVThc0WCtswTPZHALbgisYqPkYaGZ2HF0bo6hRBr7UH/sXTRgGp02QimtHk
	oRxU4c810pqMzzzYUS9x/wvbG6u6qW+BvdxXWJ4oP5n40OoO9M7fdZpJLKuYWtzEM6VKTbLKGit
	TXaiXz1GMOsOnmPWpdh8ukgmC8uCyHtLM3HdiFAfkEnHSSCUY6dKt1MrYUbfDKHmTVwS8enXruP
	et3tb8j1/g==
X-Received: by 2002:a05:6808:13cc:b0:497:deab:2bfe with SMTP id 5614622812f47-4afadecaaadmr11898057b6e.1.1786102825384;
        Fri, 07 Aug 2026 04:40:25 -0700 (PDT)
Received: from mail.minyard.net ([2001:470:b8f6:1b:f431:c4b8:c018:caf2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4afae1777d2sm7036162b6e.0.2026.08.07.04.40.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 04:40:24 -0700 (PDT)
Date: Fri, 7 Aug 2026 06:40:20 -0500
From: Corey Minyard <corey@minyard.net>
To: pzalewski@thegoodpenguin.co.uk
Cc: Clemens Ladisch <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mattia Dongili <malattia@linux.it>,
	Weili Qian <qianweili@huawei.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-integrity@vger.kernel.org
Subject: Re: [PATCH 3/4] char: ipmi: use named initializers for acpi_device_id
Message-ID: <anXEJOF27FiNOqWx@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20260807-acpi-char-v1-0-742c450254dd@thegoodpenguin.co.uk>
 <20260807-acpi-char-v1-3-742c450254dd@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807-acpi-char-v1-3-742c450254dd@thegoodpenguin.co.uk>

On Fri, Aug 07, 2026 at 12:26:10PM +0100, Pawel Zalewski via B4 Relay wrote:
> From: "Pawel Zalewski (The Capable Hub)" <pzalewski@thegoodpenguin.co.uk>
> 
> Use a named initializer for the acpi_device_id fields which
> makes the code more readable and consistent with how lists
> are initialized in the rest of the kernel code base. Also
> drop explicitly setting fields to 0 where it is redundant.
> 
> While we are at it - unify the list terminator to have
> a single space between the brackets and no trailing
> comma.

This is fine, it's in my next tree for next release.

Thank you,

-corey

> 
> Signed-off-by: Pawel Zalewski (The Capable Hub) <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/char/ipmi/ipmb_dev_int.c     | 4 ++--
>  drivers/char/ipmi/ipmi_si_platform.c | 4 ++--
>  drivers/char/ipmi/ipmi_ssif.c        | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/char/ipmi/ipmb_dev_int.c b/drivers/char/ipmi/ipmb_dev_int.c
> index 680ff15c30ab..d576a77df927 100644
> --- a/drivers/char/ipmi/ipmb_dev_int.c
> +++ b/drivers/char/ipmi/ipmb_dev_int.c
> @@ -360,8 +360,8 @@ MODULE_DEVICE_TABLE(i2c, ipmb_id);
>  
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id acpi_ipmb_id[] = {
> -	{ "IPMB0001", 0 },
> -	{},
> +	{ .id = "IPMB0001" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, acpi_ipmb_id);
>  #endif
> diff --git a/drivers/char/ipmi/ipmi_si_platform.c b/drivers/char/ipmi/ipmi_si_platform.c
> index bdc481ce1302..fa221cbb4b3b 100644
> --- a/drivers/char/ipmi/ipmi_si_platform.c
> +++ b/drivers/char/ipmi/ipmi_si_platform.c
> @@ -387,8 +387,8 @@ static int acpi_ipmi_probe(struct platform_device *pdev)
>  }
>  
>  static const struct acpi_device_id acpi_ipmi_match[] = {
> -	{ "IPI0001", 0 },
> -	{ },
> +	{ .id = "IPI0001" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, acpi_ipmi_match);
>  #else
> diff --git a/drivers/char/ipmi/ipmi_ssif.c b/drivers/char/ipmi/ipmi_ssif.c
> index 07f1d2327bb7..2361103c5edc 100644
> --- a/drivers/char/ipmi/ipmi_ssif.c
> +++ b/drivers/char/ipmi/ipmi_ssif.c
> @@ -2057,8 +2057,8 @@ static unsigned short *ssif_address_list(void)
>  
>  #ifdef CONFIG_ACPI
>  static const struct acpi_device_id ssif_acpi_match[] = {
> -	{ "IPI0001", 0 },
> -	{ },
> +	{ .id = "IPI0001" },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, ssif_acpi_match);
>  #endif
> 
> -- 
> 2.55.0
> 
> 
