Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.27.248.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793499877;
	b=dcTmeV72H0z3DKICauWi3hJ+XbN4SFsaXVyaWSBNMgOteyuhT4A+umtEgv5jzB7k9YN9
	 I3gWRuhVYmhaVoPr9OQG3Njcixs+Ch+qNqbtZmjnc0BYZJC5P+uPWWhYCq5pWm4qcQMjN
	 KBKGAvm+VY66eToberwl6WUKtRjsNzgmDxWbypO49zp5wemE7htKXA+fKaslgZ7vjn09j
	 gkqA72FiQ5e3gXb9vLKXBatnQfA0d+RiwQKoj3tYvpoAJA9xEWAIydq9yLvxxPjmmE5bX
	 3AL+x3DDviHN+OKgveU5VkJbeed9TzMByKsFz3ShTRFMXufqEM8wuvBVMI4lnZP93Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793499877;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Gm-Message-State:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:X-PPP-Message-ID:X-PPP-Vhost:
	 X-Virus-Scanned:X-Virus-Status;
	bh=kqU33gEA8KfwKOunAziA7xlh/3MGIAM7fmhplDE5fT0=;
	b=kwirlqmTHcwqReBD1Rni168r1iBmfjO2LI/d2XC9pNPZXh0pf+bJ6z/mF/j4MLWcP+rH
	 w/kEcuvbLoKQmYIESr1DtzI1FInTgmT/3kurwbLsSW62eOOyWbiy8BBJEttLCbwNnh/Sq
	 V1IMwQ7THrG74zYNbZbfSMMHBORpjoUCmMQ/nY9juIy+X0Y9OkKB7C5wUe7cOwN3iCJ/y
	 ZSUQv6rmz/VYd4H+zPkypnHfcV5NDrwknf3iPXQGVKWkXEF4oQwPZchGtMABgFmnMuVRU
	 VDr7ZaV9SunL47ctEfeDm+1PJasGaLUcqcTJowhxBKYkXwArzaSoCktwZoKDFDyu34Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=T0mrSzgk;
	arc=none smtp.remote-ip=37.27.248.198
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7D4606A325
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 02:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F7D4606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=T0mrSzgk
Received: from relay10 (localhost.localdomain [127.0.0.1])
	by relay10.grserver.gr (Proxmox) with ESMTP id 4B14F418D1
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 04:24:34 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay10.grserver.gr (Proxmox) with ESMTPS id 950373EF8D
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 04:24:33 +0200 (EET)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2FFCB200CD8
	for <platform-driver-x86@vger.kernel.org>; Sun,  1 Nov 2026 04:24:32 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793499872;
	bh=kqU33gEA8KfwKOunAziA7xlh/3MGIAM7fmhplDE5fT0=;
	h=Received:From:Subject:To;
	b=T0mrSzgk3SGxLmhAGlssQw0Kh7QMsm/wh6IP7rNeerpPE7jlrgSUUl4R//+rP5MBq
	 7VDhgFgQYI0wkbNqmvo2Pn3prp9sYXig3plV6NFk5vbZ3+ztD4ElbMcYV1hYZpXjWb
	 t/bkTIJW3KZBk6oj/zZ8G5wtUMvXv3niaX0jfV3nuZ0jYERl3AE1DZp8RIwaQYCgLZ
	 oAdPRqc1kmKQUW2dZvsKL3hdSBZ2fVxfb5cp6YAjreZhT3kwZMF6b2ZZRasoaG6kFj
	 MTLbeK6ApLKiOssmReG/vEXleSYGSKa5v3ZRVDnXpyxbhVwwgGX8uLbZKrP74EkLwx
	 j/ILU/EamslOA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.171) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f171.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2e95bd1c14cso17453035ad.2
        for <platform-driver-x86@vger.kernel.org>;
 Sat, 31 Oct 2026 19:24:32 -0700 (PDT)
X-Gm-Message-State: APuU4Z+vbA0k1ECXFUGCRUeTjHx3hy8IKGLPYfY+ApKakRYTIQD2Fh2e
	EfW5oXSNqlzJpT+RU5qfCz2UWSKr3cv1GBPB6yiV+GpkGHk4dkhVkZrXbfKAajYVBIOMuRzbi57
	v1e2Ss9uGIcn2Jfqa6I/uO7f/dr1WspA=
X-Received: by 2002:a17:902:d2cd:b0:2e9:5b4e:b8a7 with SMTP id
 d9443c01a7336-2eb364f8fe2mr65117825ad.51.1793499870868; Sat, 31 Oct 2026
 19:24:30 -0700 (PDT)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: 
 <TY7PR01MB1374656B7810521751CB248D4DB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
 <TY7PR01MB1374600CF756D90DF8CFC37BDDB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY7PR01MB1374600CF756D90DF8CFC37BDDB6B2@TY7PR01MB13746.jpnprd01.prod.outlook.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sun, 1 Nov 2026 03:24:20 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwGbxW9+uVkbcCUiZVZZPK3dVBQsmV-jMXr96XovudEdzg@mail.gmail.com>
X-Gm-Features: AclHuK8ncQZWy8VN_L5_o--scyvvyi6zdooVn7LuqNYynRJ8A1onvxPS4fM4gB4
Message-ID: 
 <CAGwozwGbxW9+uVkbcCUiZVZZPK3dVBQsmV-jMXr96XovudEdzg@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: oxpec: add OneXPlayer X2 Mini (G3E) DMI
 entry
To: Jiajun Leng <adolphpi@outlook.com>
Cc: platform-driver-x86@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?Q?Joaqu=C3=ADn_Ignacio_Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179349987256.1471780.2878184344585968847@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 03:18, Jiajun Leng <adolphpi@outlook.com> wrote:
>
> The OneXPlayer X2 Mini (G3E) is the Intel variant and reports DMI board
> name "ONEXPLAYER X2Mini". Map it to oxp_g1_i, the profile used by the
> ONEXPLAYER 3, which has the same Intel EC layout. Fan reading, manual PWM
> and charging control work.
>

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

FYI no reply-to next time. You shouldn't chain versions on the same
thread especially for series. If you find out why Claude does that let
us know

Antheas

> Signed-off-by: Jiajun Leng <adolphpi@outlook.com>
> ---
> Changes in v2:
> - Remove the X2Mini PRO comparison and the downstream kernel version.
> - Merge the quirk mapping and test results into the first paragraph.
> - Place the entry above ONEXPLAYER X2Mini PRO to keep alphabetical order.
> - Move the AI assistance note out of the commit message.
>
> AI assistance: Claude (Anthropic) was used to draft this changelog and the
> diff; the submitter reviewed and tested the change.
>
>  drivers/platform/x86/oxpec.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
> index c4c4babe8e30..f4b5a35a4d69 100644
> --- a/drivers/platform/x86/oxpec.c
> +++ b/drivers/platform/x86/oxpec.c
> @@ -300,6 +300,13 @@ static const struct dmi_system_id dmi_table[] = {
>                 },
>                 .driver_data = (void *)oxp_x1,
>         },
> +       {
> +               .matches = {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> +                       DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER X2Mini"),
> +               },
> +               .driver_data = (void *)oxp_g1_i,
> +       },
>         {
>                 .matches = {
>                         DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
> --
> 2.53.0
>
>

