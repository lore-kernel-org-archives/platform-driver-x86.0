Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0EC2EA172
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 16:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206755; cv=none; b=DW0R7J7qpkHW7VWukcXD5anrvml0FzJFRIFRXrk3ZPrziSToeVWn0o2/880/3tV/hAesXWsQ3wPAdTG78AwrTMJXOW6p9YLse3+cZ90m3qo3uGu8+9Y7oi6qJ4LlCYjsJNt1huTfqH622VfvJGBMS+GxdNeB8xNR5Wr4KBadPN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206755; c=relaxed/simple;
	bh=l3Qsy2AF4IjUh9TNz1i8iBjRLUjPBxzV7M9hqAMaKas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyhYV1LFCOkj4r5wgwnV9UhKKpynh348uGbYjxoIsEor9PTNdl7fV4dvdHaS04fNOHCeYQ3EPXATFOtNT53oTEE/NPAgjNLvejV6JgBkvmCEOhp4m/+GPTFY60b7HcaubAnURprjDSzvYrJM1kyEIqbxRjcWeUEFzYwdVlYv/KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=akK6gEat; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="akK6gEat"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id D9CC3C63D8
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 18:57:05 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id 59B55C63E0
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 18:57:05 +0300 (EEST)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id E2BB5203A66
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 18:57:04 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1779206225;
	bh=hiykFQC8nNhbGyQwp13LpFV8bd3BBCrjuurOLUxG8dU=;
	h=Received:From:Subject:To;
	b=akK6gEatmVeWQiBxR1gwaxLDHNq//ALjHTlSRZHJPFPsiL+YTNk08KbKu9MLiMZsK
	 7/XbYhP/nz3Jo0sBwLeLky5QuAqhLhRnh+ZEWIgsV4hbxqWBpWdZ+ab8HOUsthlRE1
	 I259xLf/j+Do4sbceckJVOmfx7+AvUnjECBPTLpleqPYtWuWzHuuNdfP8FCi7QMDpw
	 1H9WYI8nZfWXg5E7Z2HOwJkFLxQRIRzMZ3mQuVcRe7E0YziDRtpB79NQK40UKM5Y2I
	 9PShWPz0Xervgis2kRv9STA1X5JbHD9L54S02oxYRAAxVmUG1EWBln82SHHqU5VIHV
	 8ivQ0/wf91EVw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.215.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pg1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-c8027e876fcso1622498a12.1
        for <platform-driver-x86@vger.kernel.org>;
 Tue, 19 May 2026 08:57:04 -0700 (PDT)
X-Gm-Message-State: AOJu0YykHQFpUzEsg6Qzvu5IrBW8rrVDUdE2fN9F99i1UqwtYZlmybFn
	uqpw2AxobOjkQ/7VFNw9a42HUlndkJ7TuHU43D0+k1Wa6vBueQcEhMPU0S5RCa1tT2CWmVfLCP/
	gccI57VwaStJwqyV54VejjAR67w3x/CE=
X-Received: by 2002:a17:902:e743:b0:2b4:696b:7bb7 with SMTP id
 d9443c01a7336-2bd7e8ae070mr221498425ad.15.1779206223672; Tue, 19 May 2026
 08:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330101028.876277-1-begeebe@gmail.com>
 <20260519155124.3240359-1-begeebe@gmail.com>
In-Reply-To: <20260519155124.3240359-1-begeebe@gmail.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Tue, 19 May 2026 17:56:52 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGzVXfY0TUA0-HVJC=yfxciGLwt9ND_tv+DQvqaEDFSOg@mail.gmail.com>
X-Gm-Features: AVHnY4LtpuYSfNgD-IrOdEXZKwX1RYoLmRppJtURRHRwjPZZ4PiP9e2z7r2nZo8
Message-ID: 
 <CAGwozwGzVXfY0TUA0-HVJC=yfxciGLwt9ND_tv+DQvqaEDFSOg@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: oxpec: add support for OneXPlayer Super
 X
To: Alexander Egorov <begeebe@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	derekjohn.clark@gmail.com, samsagax@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <177920622510.3530569.6830124279423956483@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

lgtm

Antheas

On Tue, 19 May 2026 at 17:55, Alexander Egorov <begeebe@gmail.com> wrote:
>
> OneXPlayer Super X identifies itself via DMI as:
>
>   board vendor: ONE-NETBOOK
>   board name:   ONEXPLAYER SUPER X
>   product name: ONEXPLAYER SUPER X
>
> Current mainline oxpec does not contain a matching DMI entry for this
> system, so the in-tree driver is not auto-loaded.
>
> The tested Super X fan, PWM, turbo-toggle, and battery charge-control EC
> layout matches the existing ONEXPLAYER G1 A handling.
>
> Add a DMI match for OneXPlayer Super X and reuse the oxp_g1_a board data.
>
> Reviewed-by: Derek J Clark <derekjohn.clark@gmail.com>
> Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>
> Signed-off-by: Alexander Egorov <begeebe@gmail.com>
> ---
> Changes in v3:
> - Reuse oxp_g1_a instead of adding a dedicated oxp_superx board id.
> - Add Derek's Reviewed-by tag.
> - Add Antheas' Reviewed-by tag.
> - Use consistent submitter identity.
>
>  drivers/platform/x86/oxpec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index 6d4a53a..99c0dfc 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -205,6 +205,13 @@ static const struct dmi_system_id dmi_table[] = {
>                 },
>                 .driver_data = (void *)oxp_g1_a,
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
> +               },
> +               .driver_data = (void *)oxp_g1_a,
> +       },
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> --
> 2.54.0
>

