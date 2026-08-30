Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D781BA3D
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Aug 2026 04:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788065073; cv=none; b=s+hUDTHI4R/C2SoDV/n/hc33QRQTvipyN5SJtREKW0pt4lZusetQXK4yayBRBMGNRQN8SttA3HK7HlFCpftxvRLp66Sbd3oRlnc2vTrUHwAemzHvVZ/gXYvpgpKOVl1hmjsFqovAm1TvPiZjzKdGbH9plXgNHRNaC/EsB4VaSjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788065073; c=relaxed/simple;
	bh=Xt6P3SOxIvT5y0oHDPPWmLVOBwqnNI6prkkrjBhNkgQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=qCF5JGWqumyGSO/6fXZWBdSHZjIL6H5Vlndk/NtSP6Kq/VU3SdaR6zBHtXPAP2S4s4V474cmE0AsUbhg3id3I/kroE83inzr5qBfI16dSrsJlQh3VPIgfMo15LTc2KqMOt4U3qSLod4QVtIJpcSOxrEqfCDeoE/0xODc/f7qYoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkjtMtMD; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkjtMtMD"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5bf9506704fso1170832e0c.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 21:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788065070; x=1788669870; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qiTTxzp4HXiHHnT6uGxMqgpdQesOTWIkegK+zdcRPBw=;
        b=pkjtMtMDtuRcHIsx5N4IBPdR6XMw7lhxe5Xvu7429wU6iUqQbRTnuBfaolRIIrIi3j
         tXp8DxWKvFXVRAN64Dbmqi2+A4M4CNBKxKxMl7RCLrm4Ob9TOpyURrFU8DMsCN8HIQ5B
         H8UrwZnHkRskbiw4+5Q8pK9Pwg7p/BTKMcjKluK5nDgCg/yv/r9jpwEQwg9giS8oHpWC
         4TYMemBNt8HHO1vpTl478yvek5hZZZY4WFeVTFWhMLf2tPm/JND5Bs6Wgy1bN/eibGiN
         CZHN5IwWK3kouyAaBBQe90cmUFt0BdJJna1THLUMrbE9z0hQVkB4uaPYDfO5mcwIroMA
         03yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788065070; x=1788669870;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qiTTxzp4HXiHHnT6uGxMqgpdQesOTWIkegK+zdcRPBw=;
        b=YJh2kGPNGzlHQkyq4UJYxD0ruFKvcl1BsQofAfY7gtnIhP3vVABiTYolEoWN53Bwck
         KWznBUeLcQh8RlVVGtCwfdAfQhbpQ3+E/SGxmNpEnhtimdaaWAEwHzdOfuSJ4o70JY76
         1/TSjJPfquxOCnqOCvAoW0eNjRVhCe4S5kuwfsdti0lCTaTm7pzKyLz6FTZKrSQ0o9eY
         tzbfChfNn+JruKVN1ZL+nMX3sA6YzLwdQBYpqyiUPnfRCKFqu3g40IRsQ2cULYx2Okgc
         t4qyxB8KTWl2G7hHxpOQqkWYKZtJjdUy571ZUdn1sxHklRp5dadMzMYp0E8REfg2Stv0
         pckA==
X-Forwarded-Encrypted: i=1; AHgh+RpCKDHMAgNMeGRmwdNkbt0MhVowxBW8640oniKSsOJN8QYyOEV9bgAitV0T5YR6gPOmSeshjXVf6JBTOiOmroqwPzWW@vger.kernel.org
X-Gm-Message-State: AFuF++nkVmigXlUWCaIvqX+AMWpzcg0OTgw16jMzNvBN58uj/GTBibbm
	Rycs8vhHTg0bP4N8BrcH7X6YLLvgDwDHf1MwpJTMsOuSAjNXor+F0Z4b
X-Gm-Gg: AR+sD12qRBSPszVQXSAg4pukI6T9WElIoXy8ldPncwqhm2IkHkC8A3v76I6SKu9qFb3
	p69si7AhGymfYJpvWNO/xNTgd1gud4TbZqMuxbSFpHjhS+4ST/gMt7xfMuaARsoW5xkqzsiUTLf
	jlRh1mKJG7bQKEVN/Z9NVdTAcWCLz5R50WmzPB6M/VvOavLDDFq67BGCL99UyAWJ1SbJElEvdRW
	vvmgOBkM5v3Md5tV5splGDgh1Y5qVwmdPyrVnYr9ZNiCpneUcmOFUhE9wYrOJHwVuagzno7YdZ0
	DEu9DVSLTitx4fgglMIaAL6Mcq7NlQHaKkn8EWMwZtkIsYb1z0S5uPAw4GVLAVrubGo8JqOkMA9
	OndeZJi0hQpwPHUe73D994/qsVtFqf+ZDOm76GrE5x1ARj23sfedLBCH5AoVxubuwrIXBKv7J0o
	1NKMuku54axIUeaNu3cpv0fwNmLGN5rlNSH4kPSIW2FdooVHRkC6w=
X-Received: by 2002:a05:6102:370e:b0:785:39f2:d80c with SMTP id ada2fe7eead31-78596cced64mr5624738137.1.1788065070467;
        Sat, 29 Aug 2026 21:44:30 -0700 (PDT)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97e84a55284sm5275707241.4.2026.08.29.21.44.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 21:44:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 23:44:23 -0500
Message-Id: <DL205Y6LUAEY.1ZA0G5ZVUPUN3@gmail.com>
Cc: "Hans de Goede" <hansg@kernel.org>, =?utf-8?q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
 <Dell.Client.Kernel@dell.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] platform/x86/dell: alienware-wmi-wmax: add Alienware
 Area-51 AAT2250
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Rickey Bartlett" <subtexel@gmail.com>, "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260828145756.341733-1-subtexel@gmail.com>
In-Reply-To: <20260828145756.341733-1-subtexel@gmail.com>

On Fri Aug 28, 2026 at 9:57 AM -05, Rickey Bartlett wrote:
> Add the Alienware Area-51 (2025 desktop, model AAT2250) to the AWCC DMI
> table. G-Mode is not applicable to this desktop, so generic_quirks is
> used. The full product name is matched to avoid colliding with the
> "Alienware Area-51m" and "Alienware 16/18 Area-51" laptop entries.
>
> Tested on hardware with BIOS 1.6.0: loading with
> force_platform_profile=3D1 force_hwmon=3D1 exposes a working platform
> profile (quiet/balanced/balanced-performance/custom) and a fully
> functional hwmon interface (6 fans - CPU, 3 top, 2 front - with fan
> boost control and temperature sensors).
>
> Signed-off-by: Rickey Bartlett <subtexel@gmail.com>

Reviewed-by: Kurt Borja <kuurtb@gmail.com>

> ---
> v2:
>  - Reorder commit message paragraphs (Kurt)
>  - Cc everyone reported by get_maintainer.pl
>  - Send with git send-email; v1's indentation was mangled by the mail
>    client
>
>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/pla=
tform/x86/dell/alienware-wmi-wmax.c
> index d1b4df9..2b0ffcb 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> @@ -121,6 +121,14 @@ static const struct dmi_system_id awcc_dmi_table[] _=
_initconst =3D {
>  		},
>  		.driver_data =3D &g_series_quirks,
>  	},
> +	{
> +		.ident =3D "Alienware Area-51 AAT2250",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Alienware"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Alienware Area-51 AAT2250"),
> +		},
> +		.driver_data =3D &generic_quirks,
> +	},
>  	{
>  		.ident =3D "Alienware Area-51m",
>  		.matches =3D {

--=20
Thanks,
 ~ Kurt
