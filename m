Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794139878;
	b=cAt6+tKsWkjXwqsm/NJfHkeruMkjLvqkXhOW7ZIkYrzZfcF8szWonwEEEum5Jq9BCU+g
	 YwuuYxADbE3M8Y0nslsTe5o5VTc7LBe//UzvONmFQUp5HVYXGLE0FELIgDUD2z/mI8x5e
	 56JSiP11pPxmbKmupLhsrJc9xt+yJO40lg9nQqNe6GyjBzqi2HCzg/8ngCFNAONMD/QvZ
	 Y9Tb71V81TXCDk6HaPrPVGw704KIyz1+NsDARoIfIuU/2DfVfmywa/tTH7kAHwOZ9EjzN
	 0CgkiWpPSwzY6KgbFjliZ6KF69SDAdRPY42/DUErPWlyINqO4MwIa5Lp2fOyC7a1ebg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794139878;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=6ef9yYLdxXIUGY8RVd41r6+xeg6pmHrfr32Rdvc2dTg=;
	b=lPE6Rj4Jzjyd33QN4rJKzfJsIv/G97QzoFHg1DvGoajYSL/72Scq6H+UjeGS6bPorFfk
	 cke/Dcs1M6xhTdvQAhLfGgdivqDHZAFx/Vby4zJnTixJFDQ4l2JWzW/WNhaelZPk/skkS
	 5kYqRorS7Deci3T7zaAxZg1iUJYBq3tD3bk80IZbDxwBknog07D8pwpTiGhQpLYc6mn+O
	 VdkypBTufrXxlFNdE8XctY+9U0amerSsN4k/ZVRL8TiShnIUzO3ZaXG1jMh4Y/80Wxm18
	 xX4Po6ivKsoRqi3yC98hNtUwDtwUnrzkIdSFQuSHsA6FnI1P20Hxz8bk7fmeYSrVwfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=HRnjmmfI;
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8467606A31C
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 12:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8467606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=HRnjmmfI
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 8A3863EC01
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 12:11:08 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id D96103EAB2
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 12:11:07 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 18F631FE451
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Nov 2026 14:11:07 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1794139867;
	bh=6ef9yYLdxXIUGY8RVd41r6+xeg6pmHrfr32Rdvc2dTg=;
	h=Received:From:Subject:To;
	b=HRnjmmfIdy3IlWKdFSMivipAEy8tbgTZFtfLrTlxEbsPz1MvaMSOY8tXsNJS1Lhnl
	 NTMS3e/MDzN/EcXT0mF/TdkJifGCDmIivbHkecTzHdeSdLiK2o9i7XZG/t5WL1ePYL
	 8AKwy+6ZXkq9x7vVhbTJw0PnIjGsv0m3gKe620cXX0ZfP3zCqPqEyzHZ2JwSrCWh7W
	 2/Jz92i7rlCv8wKTym9d6bpVAona8BoBEc4tDpEB36NIHzg24DQY+w+B0bEf3g4NR1
	 ds2Wjw61IGKIqqkWL0bFaSmQoJAKTNyUrSxYqglHMuGGylge47jw1mwljCIrmZxLD5
	 G+Fe9FZYDwHlA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2ed0b03ce3eso86295ad.3
        for <platform-driver-x86@vger.kernel.org>;
 Sun, 08 Nov 2026 04:11:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AL+hErFy+Jo0u4P/IQOgQXBFPVLSo1A5i1pcWlj9H5LKe865Y7ybp4szwhPop5Klwe20XBtyLP1h8f1mO+ImHyGQbTjEmtOT@vger.kernel.org
X-Gm-Message-State: APuU4Z/fWMRZAr4HYdRju14jXv0cYfNBp/r7O7Y7CmTd+wgNi0rxS6fm
	xfQwtdshgeb5gN7TonngXKOiHpMy+b+29lsDV4snh1vWXp05fSm4rUqxDFMbYveywzPEJ3aIiz8
	dVPnm6l9oJnfOEJq9xGmYTaCz1qLKJvY=
X-Received: by 2002:a17:903:3810:b0:2df:8733:f229 with SMTP id
 d9443c01a7336-2ed837595c8mr11333125ad.24.1794139865573; Sun, 08 Nov 2026
 04:11:05 -0800 (PST)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108020351.62494-1-hijae99@gmail.com>
In-Reply-To: <20261108020351.62494-1-hijae99@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 8 Nov 2026 13:10:54 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGjyhc_j-gaoTj=ijD6us=7QbNyXymT_Gbd3iNue5_RiQ@mail.gmail.com>
X-Gm-Features: AclHuK-zKZVbA7hsNK4LKG0ZduJ3hbw5slvRyY_Oky5Z8mfep99kmAdzUSaMCtQ
Message-ID: 
 <CAGwozwGjyhc_j-gaoTj=ijD6us=7QbNyXymT_Gbd3iNue5_RiQ@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: ayaneo-ec: Enable charge control on Flip KB
To: Hijae Song <hijae99@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179413986733.727781.14048310417781021061@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 8 Nov 2026 at 03:04, Hijae Song <hijae99@gmail.com> wrote:
>
> Flip KB was matched to quirk_fan (fan control only), the same
> quirk used for boards without a working charge-limit EC
> interface. Testing on real hardware shows the charge-limit
> register works identically to AIR/AIR 1S/KUN, so switch it to
> quirk_charge_limit.
>
> Verified on real hardware: switching charge_behaviour to
> inhibit-charge stops the charge current (status: Not charging,
> power_now: 0), and switching back to auto resumes charging.
>

I would have liked a slightly shorter description with the slop "
Verified on real hardware:" cut out, but it is not worth resending.
Ideally dropping the second paragraph, and swapping "real hardware"
with "the device"

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

Antheas

> Signed-off-by: Hijae Song <hijae99@gmail.com>
> ---
>  drivers/platform/x86/ayaneo-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/ayaneo-ec.c b/drivers/platform/x86/ayaneo-ec.c
> index 41a24e09..6fe2387d 100644
> --- a/drivers/platform/x86/ayaneo-ec.c
> +++ b/drivers/platform/x86/ayaneo-ec.c
> @@ -88,7 +88,7 @@ static const struct dmi_system_id dmi_table[] = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "AYANEO"),
>                         DMI_MATCH(DMI_BOARD_NAME, "FLIP"),
>                 },
> -               .driver_data = (void *)&quirk_fan,
> +               .driver_data = (void *)&quirk_charge_limit,
>         },
>         {
>                 .matches = {
> --
> 2.54.0 (Apple Git-157)
>
>

