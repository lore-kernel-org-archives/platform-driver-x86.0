Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794995167;
	b=DV6YFRmMORSwCCnmSPrZwPWyVeE6P5uH9MqLOaIOVwpWLVjPrAKXSaQeeRpfNXQlcqq7
	 mn4gHOiBpQrcHFwaHpg3zShOWiVgts1l1hmJLvzVRtnxxffxLvd8KZcxB9QjOnewDDC8O
	 ZCYkOg+IMVYWPNxUV7JlfbBYE1pDkqk3xAQ7haQDgtnlZuTBxNvTGFCHx7HeYwRMjWjJg
	 lpSR5SfUZg9csmakXYduaLzqsxiTnw34yYjnwGKTXVB7PSr2gQeV9d6T0uETUIigx63Gp
	 INThgRIJvR1KyBBAjHGaXQAQ9Q92JUN1UCFFHnaY4MTmeuaAZ9LbZlPMv6D9v93vLcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794995167;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Gm-Message-State:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=Y2snq3kmbmt6h0EJBWlXqu8gHdkXZ7l25ETC0UXrVs0=;
	b=ajPy0coKzBdFFkgFT/61wT6do34d0ip22thsq6t6o386oMvgVOAPznj3pH0ZhW5TzyVP
	 6Zy6kPNLRlfGXOK0vANNPh07BveN/cnVJIEq6Q/saZAvIZHJ5wMTK/Yzw5Map1BPrujG3
	 3+MP0PJpzciMqvKwqQhX/iuXhGJnMgaUJcsLzeyQyolowqnK7kZHYNwWbdGmLYXNiC7/w
	 U2HA9e+qeoM531U7zPqxYpRsXxw9MjoGUhDhndletvgEfyZJnY6/w4i0CzwQnyEO4bXVc
	 b8IEaih4kS3e/gUXcoUIKt76z9dyhKimJZT32aItxq48GFy5sZnGdiOhdjUVUBQZhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b="eQkIi/p7";
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35980606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 09:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35980606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=eQkIi/p7
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id C19BF3ED7E
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 09:45:57 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id D56A13EA57
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 09:45:56 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 44DD01FE63B
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 11:45:48 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794995155;
	bh=Y2snq3kmbmt6h0EJBWlXqu8gHdkXZ7l25ETC0UXrVs0=;
	h=Received:From:Subject:To;
	b=eQkIi/p7j/0ZEl530mCZh0bsRWoxib0841GMZ8hEZkCa6MOxRly4A01E24tmUqnbx
	 HsjMVlUXFLKEGmnP/D4GGqK8nGRIXhRypDKfUeUMsN1ex8teR7l14cpPuFUgO1rx8u
	 HUz/rMIaT392VMwF8SHVo6Y9WSteamfd0EktKaXqSpbXPVoDINHEpUsEwFXyt0IQmm
	 BB64/2GMqsWfC8uNfFB1RKNPitgMUkeSiX+dO3HwsyTACvad82QU0w0vqBNo56C5FE
	 pZ5rqIf8Asl+wm/u3ga5WBRzCpgYtRxVbfDGHRb/uUMoCUzwuSjXrjCU/Ab4l/yuNf
	 OME1/xBv9oEYg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.54) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f54.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3b0bbdeae06so342935a91.1
        for <platform-driver-x86@vger.kernel.org>;
 Wed, 18 Nov 2026 01:45:48 -0800 (PST)
X-Gm-Message-State: APuU4Z+oL17oZFLhklploWkWsbL9V90ZpYuYnmQ7TUm0s9LeAvQmhB8j
	j6k12N3IxC3aO81CmRl+T9IMXWExHYkGEBu5pXUUB04fb2HA/9BztidcN0pE6cdJtFipE+fgrGJ
	zX2yGmFTXjmTblY6si1IvX+bMQPncHXs=
X-Received: by 2002:a17:90b:224c:b0:3b0:accf:5c66 with SMTP id
 98e67ed59e1d1-3b3d07d84ecmr2173543a91.49.1794995146521; Wed, 18 Nov 2026
 01:45:46 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052557.143089-1-jeff@aletheia.io>
In-Reply-To: <20261118052557.143089-1-jeff@aletheia.io>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 18 Nov 2026 10:45:33 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwELhT8WFiPNQ_GxQBgE=iwh9ZoL1idb+b3vq9wMskG6Cg@mail.gmail.com>
X-Gm-Features: AclHuK_RgzFTabDn4DcMqwFW5RAbtMF2Pjzy2lEmbXwMxSzDh65rGchGrKfQ3B4
Message-ID: 
 <CAGwozwELhT8WFiPNQ_GxQBgE=iwh9ZoL1idb+b3vq9wMskG6Cg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: oxpec: Use the APEX charge registers on X2
 Mini Pro
To: Jeff Hagadorn <jeff@aletheia.io>
Cc: platform-driver-x86@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179499515334.481986.7274466523992287539@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Wed, 18 Nov 2026 at 06:26, Jeff Hagadorn <jeff@aletheia.io> wrote:
>
> The OneXPlayer X2 Mini Pro was added as oxp_fly because it ships the
> same system board as the OneXPlayer APEX, which was oxp_fly at the time.
> Commit 0ccdf9a1381c ("platform/x86: oxpec: Fix Apex charge limit
> control") then gave the APEX its own board type, because its EC keeps
> the charge limit and charge bypass at 0xE5/0xE6 rather than 0xA3/0xA4.
> The X2 Mini Pro's EC does the same: values written to 0xA3/0xA4 read
> back, but have no effect on charging, so the charge limit and
> charge_behaviour are not enforced.
>
> Tested on an X2 Mini Pro (BIOS 0.22) on AC power, at 88% charge with
> the battery charging at 42 W. With this change, setting
> charge_control_end_threshold to 85 stopped charging within 20 seconds,
> and setting it back to 100 resumed it. Setting charge_behaviour to
> inhibit-charge stopped charging, and auto resumed it. Without this
> change, neither write affected the charge rate.
>
> Switch the X2 Mini Pro to oxp_apex, which applies the oxp_fly quirks
> with the APEX charge registers.

Hi Jeff,
implied in the Apex commit were BIOS versions. Apex is a device that
is a lot less popular than the X2 Mini Pro so I just replaced the
quirk because disambiguating bios

I have not gotten any reports from X2 Mini Pro users about the battery
limit, I will ask around

Did it never work for you or did you not test it before? Did it stop
working after a BIOS update?

Best,
Antheas

> Fixes: 1b3c0028dc06 ("platform/x86: oxpec: Add support for OneXPlayer X2 Mini Pro")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Hagadorn <jeff@aletheia.io>
> ---
>  drivers/platform/x86/oxpec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index c4c4bab..a7d21eb 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -305,7 +305,7 @@ static const struct dmi_system_id dmi_table[] = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
>                         DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini PRO"),
>                 },
> -               .driver_data = (void *)oxp_fly,
> +               .driver_data = (void *)oxp_apex,
>         },
>         {},
>  };
> --
> 2.56.1
>
>

