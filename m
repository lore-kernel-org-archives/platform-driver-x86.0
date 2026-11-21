Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268978;
	b=y6Q+CukDCsj0HIv7bMBRw78WNm8LvksxDijQQgmQtKZWbIYae5GfXY9hcHoCIg/3okr4
	 UdV01TES9IYWySeK9tfDLmWIYAbQzY0A1N9hk95uwEOOC6kZdmkUrT6aiP2+wEF+aoklh
	 B09Db7THq6Ryif1ZWKm0Earpyj5++JN7/h0ztWOKg6yrtHU7xvCST9NvYmf6CY4F267S5
	 qz5RQIy/icQi8mkDNrgUAWGyBNz2cOWgci1q2dysBYgMLJjPqs7ik4RxNwa0+JxLAKx5z
	 E1/6ajQlId70dk3MmZx9Ajs6o38fv/rROdZU7uS2tYSrxiGguZBXB4d6GDTbnUf26GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268978;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=jWvoi3OyrQYxIMMcxTFtT5nngwxqNY1WJs5JGPs6UvU=;
	b=dYcLCua3mGxI/kFFvy7NFN2xddcwsqFEGFGjCe2q1YPmpFF/DPzEhTIUnPHuZ8b6MCwW
	 DN/xOGyaGYSoZZWzfMT9EPo6gNavDAnuSrqNdIYf4NTd1YkHQ2tccPSQwjAIuMKqyA/ZF
	 eiyiY/JU8bt3GeSjFRAbgRlEg5mn1bkNhlhpiYJ+GjuVJ01AtGUrXsg1tMTSiKOt0a9/J
	 hmZ/EJxD9tGhT+o1/4Zgr+OTasBZ2M9FFT6DRuEL7ETP4t1AFMn6lEV4GiHnOLlzt8hbP
	 9Mljn+lZCe4UF0Oqkj2gAAQ+g7PAvHf/ydcIgKo2qHcRmQ5CWZ6Li5oOGOfnGGDRGSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=nVvRebMK;
	arc=none smtp.remote-ip=212.227.15.18
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF20606A33B
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 13:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF20606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=nVvRebMK
DKIM2-Signature:  i=1; m=1; t=1795268975;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:VC78RpeqBpiIs9914XPQTNocSI4j
   4MBH2lE1ArByXT6cHfoW8BJlROfq6KJy0E6mUYYt4MqEhw2soKun7ilwic7GCPrszEId7OGBXJG
   nT/tX00Sn2TUBB40RWI59gWXs+C8iN+d5QXoaunIMMcSltcxgtE0IhHQYHFzAu0ytYXJZge4qvN
   8FEi3aW9ylm9ioooQ6qz2gZBl0zy3u7DnSXpW67cdpuoOujtuyqyPlScIe/8c3ymt6R+EJFzel5
   VKa4X0T6SM5h7uENDuP2TWTNwDxswSSfyX81fTvYyi6QVbHxpZQLJmmrCN2hDHjIfpBc/A0LehT
   bjh3icq/xURgHQ==;
Message-Instance:  m=1;
 h=sha256:
   g8UyMzUmx9BNMKHKrEeyk8yVLNoTEWaZ8fM/p95QVfc=:
   Tusu5wdcAe81d4sWqrqQeQUbMxnM4lA7nWDSL9DwmOs=,
  sha512:
   ZrGRzN7QT2BI4rxPFKRTrst2KjIHfwNG7XNhTwPn2cV4zhxS7FW9Qkq0oUMSHHUgBzIbDl/GiAXDV17Vog1zLA==:
   fPAAJPSVQf5jp5h3QLYAHb/IlWwc6XSiMlojGep8BAZAOZ+aWpRhyU8j2x8Va6unGhNwq17icRfENLJnjaYtGw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795268968; x=1795873768; i=w_armin@gmx.de;
	bh=jWvoi3OyrQYxIMMcxTFtT5nngwxqNY1WJs5JGPs6UvU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nVvRebMKNZqLGgYwIB+SBo7IZx/hcKcB2y5AHrM/x0kXzmiSHd6Fa4we8X53PA99
	 NTPR4dY720FixNRPWeAWM+lO5x1tSHcVHnJQyrq70xqiCWKoC8PIsnd/rpBuu2Xkj
	 +4UNDyXei/dbYQcYiYNn/+ObEFa1a0CT2jinBsqH53SxOl4szpf+0IbFrAtv9kSUC
	 RaqF9q9c6NOfbqqiOv95fGy9lDHPJ00uM7785C7CUNxsMqfQxeN6a74xI/X3yVeZJ
	 8yica2T9GsPaX6IhcWjr3M3aQl2Q7TYakGRlhMw/KL1odJ2CR45vd2BfFnAiZ1BFM
	 Ue1LDlUFYSM8JAKkCA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M1poA-1xWyOG1bQm-005JkM; Sat, 21
 Nov 2026 14:49:28 +0100
Message-ID: <f3dc7e25-9c22-4b1d-9555-e83db82d05a1@gmx.de>
Date: Sat, 21 Nov 2026 14:49:25 +0100
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
Subject: Re: [PATCH 6/8] platform: dell: smbios: Add quirk for non-functional
 calling interface
To: Brian Mak <bmak@nvidia.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Kurt Borja <kuurtb@gmail.com>, Stuart Hayes <stuart.w.hayes@gmail.com>,
 Matthew Garrett <mjg59@srcf.ucam.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Lyndon Sanche <lsanche@lyndeno.ca>,
 Prasanth Ksr <prasanth.ksr@dell.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, platform-driver-x86@vger.kernel.org,
 Dell.Client.Kernel@dell.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261121000556.173028-1-bmak@nvidia.com>
 <20261121000556.173028-7-bmak@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261121000556.173028-7-bmak@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mgqe7FkDVlGiSHuulleQiTJIhS8NX5oR43BTfmJ7Z3kbTRgEGEo
 REPhdNTkUh6JWJL+VZ6+pNprzrA4eMoZEHahgnaafLu5afP0Ym+NRiuGcZ9NC2wkjeA5uyo
 QM62zrsQ4Dm4sIqOmt7FZlZDvZ1I7bUcjoZxbPj19TLi1nTJUqpIZl0Pm9UMq1k+ZdfBA2F
 Igq6Zwfo4nXWF4NoM8SmQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2+LubUGgMd4=;Hk7W7m9Wxr+dtSvdEgCuvHcG+qf
 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

Am 21.11.26 um 01:05 schrieb Brian Mak:

> On Dell RTX Spark laptops, the SMBIOS calling interface completes every
> request with an all-zero buffer, even for requests that should fail.
> Drivers that rely on it, such as dell-laptop and dell-pc, end up
> reporting bogus state, like battery charge modes and thermal modes.
>
> Add a DMI quirk list for platforms with a non-functional calling
> interface, and export dell_smbios_calls_functional() so that consumers
> can avoid loading on them. dell-smbios itself still loads, as dell-wmi
> depends on it.

Hi,

do you have access to such a machine? I would be _very_ interested in the =
output
of acpidump on this machine, maybe this could be an issue with ACPICA.

Alternatively, maybe the wrong backend get selected. Currently the dell-sm=
bios-smm
backend will try to read a specific token in test_wsmt_enabled() to determ=
ine if
the WSMT ACPI table is active. This might not work on arm64 machines, so m=
aybe parsing
the real WSMT ACPI table would fix this problem?

Thanks,
Armin Wolf

> Signed-off-by: Brian Mak <bmak@nvidia.com>
> ---
>   drivers/platform/dell/dell-smbios-base.c | 22 ++++++++++++++++++++++
>   drivers/platform/dell/dell-smbios.h      |  1 +
>   2 files changed, 23 insertions(+)
>
> diff --git a/drivers/platform/dell/dell-smbios-base.c b/drivers/platform=
/dell/dell-smbios-base.c
> index c8e93c12c445..e07cbb0e8a6a 100644
> --- a/drivers/platform/dell/dell-smbios-base.c
> +++ b/drivers/platform/dell/dell-smbios-base.c
> @@ -390,6 +390,28 @@ bool dell_smbios_class_is_supported(u16 class)
>   }
>   EXPORT_SYMBOL_GPL(dell_smbios_class_is_supported);
>  =20
> +/*
> + * Some Dell firmware completes its proprietary SMBIOS calls with all z=
eroes,
> + * so any value read through it (tokens, battery and thermal modes)
> + * is invalid.
> + */
> +static const struct dmi_system_id dell_smbios_calls_broken_list[] =3D {
> +	{
> +		.ident =3D "Dell XPS 16 DX16263",
> +		.matches =3D {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 16 DX16263"),
> +		},
> +	},
> +	{ }
> +};
> +
> +bool dell_smbios_calls_functional(void)
> +{
> +	return !dmi_check_system(dell_smbios_calls_broken_list);
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_calls_functional);
> +
>   static void __init parse_da_table(const struct dmi_header *dm)
>   {
>   	/* Final token is a terminator, so we don't want to copy it */
> diff --git a/drivers/platform/dell/dell-smbios.h b/drivers/platform/dell=
/dell-smbios.h
> index 1e64803bc00d..26f54364ffde 100644
> --- a/drivers/platform/dell/dell-smbios.h
> +++ b/drivers/platform/dell/dell-smbios.h
> @@ -89,6 +89,7 @@ int dell_laptop_register_notifier(struct notifier_bloc=
k *nb);
>   int dell_laptop_unregister_notifier(struct notifier_block *nb);
>   void dell_laptop_call_notifier(unsigned long action, void *data);
>   bool dell_smbios_class_is_supported(u16 class);
> +bool dell_smbios_calls_functional(void);
>  =20
>   /* for the supported backends */
>   #ifdef CONFIG_DELL_SMBIOS_WMI
