Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794445480;
	b=wi46nivMwYtQ+k87TvJdASfOu1FH2KOZYEoQbFHbhOwRpJz/VFRm2FgKUEqyPXFlGt5z
	 iBt0xXBMOeU7wbRNjEnGnMtAWGbEg6JvUJOYe/4w4ggOtTAPot8YYzl7XpPrmzkDJ4IF6
	 WLbsQLapXmMu8GkG9PNbh3rYn0VCMQMKurYpTXsgV0MnD0A8X1/7aIMYTnIRMATrQuM5s
	 RA036aoKPY3pAbCvhCbt6FizrSXB/Lh3AlTm0/AL+DS8gmjkodGpZvHdqFHLTpAxiYb8c
	 juQqfAneRAIza1wHBdgM5PR0RbDAo+CTmhhGNGOI+quCjTK6RvhZB+Y4+aggitqf3fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794445480;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=j6tlVbWU1o1K91DWHI2T6yTCEpkrptJM63aWaCywbOE=;
	b=js8VEvxoqqZc79EHAcaBOWd5IHcmBnA/Nr4QTuo8k7g7MCyZCFWdKnfsWYEfc3VxJGyU
	 dwCAIb7Bh7mENVaKbAaS7J8YswR9ESwgcA5/4aNiTErz+DRS7/HbunAbnX5qa1tjrlPd0
	 XGM+sNFs6/SmBDILDwo1WssLH9j5It+HT/aBbgNqTfbrjPsskL0siK4oWHvh//c5oHtxr
	 QKY5zvM/3cZuNh+4auhBH15PoLYA19TACi8RvnoI1VhA5EoT6xqARZeP+FeZR4cW4G+eh
	 KbHJzvG2csXU5lPWYk9fMQaaQv3UE/GoILGasJgPxb3ww8Myot4jbL3hXxka68aINiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JwDck3dY;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8415606A8B7
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 01:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8415606A8B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=JwDck3dY
DKIM2-Signature:  i=1; m=1; t=1794445477;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:L7VO/gbJeTKxgwGkxTTbte3TJi84
   dpy0uaWX4ceuXruz7SwxVP5NQCeoAhiSbmhjWfx+gfVtO1DnxA6/EWujA8Zxo9a8bxO+CADry6G
   wBvPEi+YxQKpfFkpMm6zeNJQAUz5vOJnI13b+TRo/6BHgVSyV+PYUFQJtS7HN+GhQ+S2cBRl/6+
   pjYcu26/CaAFvM0OLnDwrbZIu0s/6DlWHxStNc2ZA1jnDFSLVgdzn+XEW9lN0iHTMkiyjvnMOt+
   nMMPrL3sHV+b0bbkwy775KHftOF1SKtuDwny3XcpDw4TuvZB0uhITfhb2YXIiPNgXYRkUhj2CCa
   AaUO0AJXArx0VQ==;
Message-Instance:  m=1;
 h=sha256:
   nrOY6lBG86RsHaopRX5Q77ggFCEqVLrnAdLHqmZo0jA=:
   kt9FQx6TBHGgxOuYVf4Vfbq9RpyQRuuL+PkxXfBb0a4=,
  sha512:
   E304BdJjC8oZhiiNdLS8z1vq15lJmYwjsmatYfyYJN4qW3TOhbsFDeWVvGqV8rrhMm+OVoRumNSSLHupOxuSfw==:
   FoS7C3NzF57kA/TBDz57OpB/HV+dmbOiB6cwowIXWu3YfZw99cZEoJrq3glBffE8rR8Sx8FExiwpOVQbmdN23g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794445469; x=1795050269; i=w_armin@gmx.de;
	bh=j6tlVbWU1o1K91DWHI2T6yTCEpkrptJM63aWaCywbOE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=JwDck3dYYsJPjC2A+zumO37wnWZjMEKNJ2UvaoaSc7ybsi9b+V4idWM7WtcPrNDc
	 b6/UbeobaF+TBgAH/taZl01O+M6Z2QIfNbe+SSIIqhgDlVsxPgkk8N5DrTS+JtnD4
	 WEZe1sKPzm64pRBw4oz3+3S7TliwG2qSHjs8zNFSvvlVdIaKCKP6j8Z9mh+nOFCsd
	 EzVT02MUS7FyppbogoBqwFMoLEGeHgHEmX3TgnUND45jXwstTZ5aR/F+gjy6sXz5H
	 yrh1oNL+JqZEPXfgSHLOU9ZMppC9kHU7h34maS4cuDVXAoDy9l21l57wfAcIByult
	 7HAWjWOlrCViSEeTwA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU4s-1wr9XU3cfM-00fzKz; Thu, 12
 Nov 2026 02:04:29 +0100
Message-ID: <01ed9468-083c-42cd-ba33-5746d96be55a@gmx.de>
Date: Thu, 12 Nov 2026 02:04:26 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: dell-smbios: Accumulate supported commands
 across 0xDA tables
To: Rosen Penev <rosenp@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Edward O'Callaghan <quasisec@google.com>,
 Mario Limonciello <mario.limonciello@dell.com>,
 "Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261111214440.5473-1-rosenp@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261111214440.5473-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:823/N+IEDbQpZDaUOj2wGNf7n9AjDxOuRoxZLtzvHZ2dWvlwFje
 +7Xme699oS3+9r5lnY6yuy1ukz4zfyD0ur6YqdFXrQ8/OAvxvr4sLtDXC1CpIC8UgFDne+3
 E4smRK7V4HjcjpMJugGZ6ogi6ZUxWJmlB9307997FgX9AR9YjtXsk4RxvNBuxerYNrAW5YG
 eddErG3mZOhjS5V9gUMqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2Rsot88W+3E=;r4WEU/suPPzj8QKEtUtztxWmBHo
 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

Am 11.11.26 um 22:44 schrieb Rosen Penev:

> parse_da_table() runs once for every SMBIOS 0xDA structure and assigns
> da_supported_commands from each one, so the last structure wins. Some
> systems expose several 0xDA structures where only some fill in
> supportedCmds. On a Dell Precision M4800 there are seven: the first six
> report 0x40361f5f and the last reports 0, which leaves
> da_supported_commands at 0.
>
> As a result dell_smbios_call_filter() rejects every call made through
> /dev/wmi/dell-smbios, even token reads from root:
>
>    dell-smbios ...: invalid command, supported commands: 0x       0
>    dell-smbios ...: Invalid call 0/0:      5c
>
> and dell_smbios_class_is_supported(CLASS_INFO) returns false, so dell-pc
> refuses to load.
>
> OR the field across all 0xDA structures instead. With this change the
> token read succeeds and dell-pc registers its cool/quiet/balanced/
> performance platform profiles on the M4800.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Fixes: 1f8543a5d602 ("platform/x86: dell-smbios: Add filtering support")
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/platform/x86/dell/dell-smbios-base.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/dell/dell-smbios-base.c b/drivers/plat=
form/x86/dell/dell-smbios-base.c
> index c8e93c12c445..f79847f0bfe2 100644
> --- a/drivers/platform/x86/dell/dell-smbios-base.c
> +++ b/drivers/platform/x86/dell/dell-smbios-base.c
> @@ -406,7 +406,12 @@ static void __init parse_da_table(const struct dmi_=
header *dm)
>   	if (dm->length < 17)
>   		return;
>  =20
> -	da_supported_commands =3D table->supportedCmds;
> +	/*
> +	 * Systems may expose several 0xDA structures, and not all of them
> +	 * fill in supportedCmds, so accumulate rather than letting the last
> +	 * one win.
> +	 */
> +	da_supported_commands |=3D table->supportedCmds;
>  =20
>   	new_da_tokens =3D krealloc(da_tokens, (da_num_tokens + tokens) *
>   				 sizeof(struct calling_interface_token),
