Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268684;
	b=h6gePVmPJQMFNc+vMOgy14jHGzNBglylJqjiSTyyJjS3fUX4w3jigrUFMk7eNUWT3Mr5
	 oE5hyDUaYbNKrOQQG9u9fRgPvIsxHlQicBAQgQAvfr2StHvOYGLnNaaP/RQFwedjqMCat
	 3ZznyiyraO8dTlB2oDVHOhD1WpS8HWsCZQOqaST514ifuD0R8iSpRNWQfWCYWG4ZPbRWf
	 TS8HGwsWnytOUBuR2JC1sJaF0D0UogQcZdjQiz61mcyBX/8DOhzQGdPFk+DA1ylkNDOV4
	 GYCvw8kc455M6eKZok+isXvk4Ihimpxej6O4WXzQJ2S5YmoI1ymC9UFBFRGoze0jC6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268684;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=tBoCiQ0P4hkAv4FEchG6Yq1mnCd+93CT0QR+T7wDJXU=;
	b=IF+RLOqzFUVqZ/5+z2yLb5KEl9Sr+yFT8JtlanqP+tP9qVuBKQCB9HR0Ud7+ZwmyC5Ia
	 3rSVuxhNWnTGIpyzQ+q6uAThpI8bLKQYXHsNY70xySaaCAtQT9rib3xlySQvAtZjKOj1K
	 brYK8MiWKEdpc5OZeQCX1hff069wuY3SGwLtc+8Z4HWkeXEXUYeMnv55xhPKWOhIWynRt
	 WZraL22grpkUrv/0IqnHnYo1LIoC9v/mz9u+DWgxx/kevgLdlsN2E1KyEr5YSBRYHoqo9
	 6PCClzm0xt07PbhavF2GtCReJK44xHnSpeepWps2Cjyblks1E5y/MYuVnwPXoGRPjfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WbFIJQ0F;
	arc=none smtp.remote-ip=212.227.15.19
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B65C606A338
	for <platform-driver-x86@vger.kernel.org>; Sat, 21 Nov 2026 13:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B65C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=WbFIJQ0F
DKIM2-Signature:  i=1; m=1; t=1795268681;
 mf=PFdfQXJtaW5AZ214LmRlPg==;
 rt=PHBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnPg==;
 d=gmx.de;
 s=s31663417:rsa-sha256:b6gZ0QdMiBAbouOMv8jThLWOJmWL
   hlU24x+7AJmXrntQV9/YKbUyRc+mR3NFGCFwyqyXcNyQoB0iIOwc/Psi/LIppzWi7iV21ptaFc4
   bmtZ6BjfVF9jYfuqgXru/v3GPXL7J+9of/dw4Wz8Aj53lIZVAT3r3q7F8unWbkpND3CUfi2ZGLe
   1qtUyj2+h+CEbb6a4tzBVODflCR3S4yR+W1OeGo+uB2AkvV7ryyVW2qw6/7rJTSBCuku13FC+IK
   2b4cMeAa/kDgXGsSH6QgUJ4iGX8WAp9ElXNYr0lADmmMkwqrSn0ti+i5bfrIBJNOeot5fEEGzNg
   7yfgD7Ar20a78Q==;
Message-Instance:  m=1;
 h=sha256:
   X8UyouQkL2BexkBot8AzLEx/v2UnfMDOtWRf6DgKYVw=:
   Y8ZkLuJ/JxLONEwGLhLv4/kOZJJx88YUXHaeqfFBCng=,
  sha512:
   OSlpKVqNTMzQIntrsGJEekd21P5uukvX5qFpSAybBpWXKn4cAaJr3jWMkqjQVmVpZtYY44s3gj+tzNsa1DmoKg==:
   1oJjT0PP6wSBL+Zxd73RJDHCUH49UWbFmkxkUrzCQI/W21V3mqerjq5Ywb/J/zn8PVzlDeWOBNN8Tcy85HkGpg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1795268647; x=1795873447; i=w_armin@gmx.de;
	bh=tBoCiQ0P4hkAv4FEchG6Yq1mnCd+93CT0QR+T7wDJXU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WbFIJQ0F0x+cY4Ad2qDOiOlMtG6hAzA3aPIzsw/Qw4DssV/DLEv+K28+2J6f25S7
	 XP2KAebOJMgRs0NTShMbc0caYvCE4Tyd/WH3821cRTzZpIOAtIjwv2OUTWJtYvDVX
	 M1lM1Kc/jj8ZXx8WFXuMnBvAm5EDw/pOAu5EHNoa4Z1qwQ1RlupkKBdcu6R1Mz5mS
	 SA2Jz7WC+e2K0lZoAw51w5KlB4INzXsyHq+kzwQ0JdNvmpYpw8h/BZdYeRXdZLahf
	 DN17dI/VeYHCa1VSV+lrDyiigHwOWq+R0FW4B9d8SHLU+aYcL7VSwhV5KrEmV1Xb0
	 UyvAmjGarVSYh8Q9vQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5fIW-1xbwOT1vgI-000Li9; Sat, 21
 Nov 2026 14:44:07 +0100
Message-ID: <77d84196-1e9a-46ef-835a-56275087631c@gmx.de>
Date: Sat, 21 Nov 2026 14:44:02 +0100
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
Subject: Re: [PATCH 5/8] platform: dell: smbios-wmi: Fix probe on RTX Spark
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
 <20261121000556.173028-6-bmak@nvidia.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20261121000556.173028-6-bmak@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k+K58IJuKvqwVUNHJcWPJeP13VUZUwlIPxK567/S8MOqUVRs05f
 tjByCn0ZcD75SvfTnyZ3O9shW17HigCignncPSnwxmicHbDX6lnIYDsPEqxH0xFJqsYpUwl
 ijJoQdNTUYkh5uDG8uuexg0fK9uQPFomBQaGIzRJclsqnHzuAx9VNA4P2M4erzvAoS4RM+C
 tswlyP1wV71SwvnDOcQmg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CO7Zchc6jaA=;GuD7pRGtH4HRYc5re83W5nY5g58
 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

Am 21.11.26 um 01:05 schrieb Brian Mak:

> dell-smbios-wmi fails to probe on RTX Spark due to a hardcoded SMBIOS
> handle (0xB100) of type 0xB1 (misc BIOS flags) that is numbered
> differently on Dell RTX Spark laptops. Instead, search for all SMBIOS
> handles of type 0xB1, and if there is just one, use that one. If handle
> 0xB100 exists, always use that.
>
> This fixes dell-smbios-wmi probe on Dell RTX Spark laptops.

Hi,

i think you can drop the special handling of handle 0xB100 and instead
just check if the SMBIOS type is 0xB1. AFAIK the PCI code also parses
some parts of the 0xB1 type, and there the handle value is irrelevant.

Thanks,
Armin Wolf

> Signed-off-by: Brian Mak <bmak@nvidia.com>
> ---
>   drivers/platform/dell/dell-smbios-wmi.c | 37 +++++++++++++++++++------
>   1 file changed, 29 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/platform/dell/dell-smbios-wmi.c b/drivers/platform/=
dell/dell-smbios-wmi.c
> index 7a5c6d7730ab..ff859d9039b9 100644
> --- a/drivers/platform/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/dell/dell-smbios-wmi.c
> @@ -273,7 +273,13 @@ static const struct wmi_device_id dell_smbios_wmi_i=
d_table[] =3D {
>   	{ },
>   };
>  =20
> -static void parse_b1_table(const struct dmi_header *dm)
> +struct b1_search {
> +	bool found_b100;
> +	unsigned int count;
> +	u16 flags0;
> +};
> +
> +static void parse_b1_table(const struct dmi_header *dm, struct b1_searc=
h *search)
>   {
>   	struct misc_bios_flags_structure *flags =3D
>   	container_of(dm, struct misc_bios_flags_structure, header);
> @@ -281,17 +287,21 @@ static void parse_b1_table(const struct dmi_header=
 *dm)
>   	/* 4 bytes header, 8 bytes flags */
>   	if (dm->length < 12)
>   		return;
> -	if (dm->handle !=3D 0xb100)
> -		return;
> -	if ((flags->flags0 & FLAG_HAS_ACPI_WMI))
> -		wmi_supported =3D 1;
> +
> +	search->count++;
> +	if (dm->handle =3D=3D 0xb100) {
> +		search->found_b100 =3D true;
> +		search->flags0 =3D flags->flags0;
> +	} else if (!search->found_b100) {
> +		search->flags0 =3D flags->flags0;
> +	}
>   }
>  =20
> -static void find_b1(const struct dmi_header *dm, void *dummy)
> +static void find_b1(const struct dmi_header *dm, void *data)
>   {
>   	switch (dm->type) {
>   	case 0xb1: /* misc bios flags */
> -		parse_b1_table(dm);
> +		parse_b1_table(dm, data);
>   		break;
>   	}
>   }
> @@ -308,7 +318,18 @@ static struct wmi_driver dell_smbios_wmi_driver =3D=
 {
>  =20
>   int init_dell_smbios_wmi(void)
>   {
> -	dmi_walk(find_b1, NULL);
> +	struct b1_search search =3D {};
> +
> +	dmi_walk(find_b1, &search);
> +
> +	/*
> +	 * Dell x86 firmware places the misc BIOS flags at handle 0xb100. Howe=
ver,
> +	 * with RTX Spark, it is not at handle 0xb100, so fall back to the onl=
y type
> +	 * 0xb1 handle present if there is only one.
> +	 */
> +	if ((search.found_b100 || search.count =3D=3D 1) &&
> +	    (search.flags0 & FLAG_HAS_ACPI_WMI))
> +		wmi_supported =3D 1;
>  =20
>   	if (!wmi_supported)
>   		return -ENODEV;
