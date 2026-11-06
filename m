Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793998452;
	b=H66TX/7jaLe6G5+tzf2iAbSz68Wmsn27hUfmooOeV1YXnQbnwsfNLRMJeUwiMQKhsCjU
	 kWcPNq/YnfLwjD3SLIqLEYdMCGhAaSSMDNSfpxq+4wqlA/8ppq1uY8LaHA156U1boW8SU
	 pylGXm5W7/2RL5YA1PsKxFq8TCOR6tbygqxWvCezhSbOw4UGx0EWgkl/vMlGM0TeDUGT0
	 6b6ktoBZKdC6gpk7w+XGpBSSDaTjmilDM8wXtadd3bUSGHvCik7UYXrt6ksPPDIhrWgG5
	 Hp3jUXRW8Q6XdaCSPlD9jzysAHMG9q0KIgw0MbHnwg9ME5mgXRiePeTER1YnPIY1L+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998452;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=2fs9ImFJupqmTCUcFxEp0C42UkUS7Xv9Wsy8jQH4kUo=;
	b=vgug7MAoiWrmpheI/osodWhtI+7DRIRsZVZ4Uma6zZIQ7UMhsktXBj7vzq89lCpLQ7C/
	 IUIPHzhTJDK5k2adokMwBqCK5aS3XJQjtF+TURu7yHqx75PJLdQua/moDz5VUo1T2F4KN
	 WVaZCm9H4/0wGqocvoT5RQDB0wcHPHAAxk2Y6OxL4KAEkqGEirPVQCK3Z55oNX7gbxmAU
	 NU3rZIPjd/wTzzQenTrqlPOzHzrerg97ANk7iDYr5jLhXL/MR4R3PpLG9IDTi3B5H16UF
	 pLAvDsIsGN4Gwh2GR7ZjrdJp/7244R7AjcvSmwd5IBo57AjXpxvL2CzGXwys32fZt6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kiLkIk72;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D04B606A330;
	Fri,  6 Nov 2026 20:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D04B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=kiLkIk72
ARC-Seal: i=1; a=rsa-sha256; t=1793998430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JaAEXPZdanHVNF40DUmFdXWvoxVDVy9xqILaxuqMAjpCLlhrmr1zC/J22R+xIiisTaZcM7QWeCXhLGNWb7tQVHEhOEL+hCNWj8H7bDPD/HOpdLk6QyKQbT501wHuoouCtFKEWDxzOv0CIocd+bSAa6mcKWuyaIhILQe/tkDskNU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793998430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=2fs9ImFJupqmTCUcFxEp0C42UkUS7Xv9Wsy8jQH4kUo=; 
	b=EeGtkRpQcjykY9kf76bBIsuWvEbeRAHP4uuooBzuIWMIod5rq4R1B8zSZPBERuTabKcd5g02z8tU4W4JHAdiqDd4VmrB0Nd6cDMzhgeWSd2n1cKpBJ20vN6/CNp8lF7AiyIw038d13vtpnmFzb6GYDnM5soSprV+Do364kRs8Gc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=kiLkIk72UDtnuLO4qHgf1vazQKOzJ/JawycJNDT9ebxIjVYMKzZQ1WjUg0iIx5nDbbKAIq5iyl9wul0lRxuOvzAhdJ/W2l+sYdgfP7jkaMT5V1SjnzsPiN2PuEgglUapX88DUdXXH4j7x9vKuHevHaYy+ptgDc+PwMosbp/sqx/QDyqZ4GrInx6OR2wyohxWlApvX/IRZs46Bmq2oeGjY40R/380JweAM3f2kGoyYqqSyBk5IvgC98DIEMHt0b+iu1SNazvlAAkeZSSDJfQJmT6IRWjPmix2wDtKPRa7odvtuCL6n67/88kmh0JGEGJJ+M2fXoNBaZR9ybtpEmN0JA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=2fs9ImFJupqmTCUcFxEp0C42UkUS7Xv9Wsy8jQH4kUo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793998430081786.7957050408593;
	Fri, 6 Nov 2026 12:53:50 -0800 (PST)
Message-ID: <19f5b65e494ed710a65927311cb68535c87953d3.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: tpacpi: Mark charging LEDs as safe
From: Rong Zhang <i@rong.moe>
To: Josh Triplett <josh@joshtriplett.org>, Mark Pearson
	 <mpearson-lenovo@squebb.ca>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, "Derek J. Clark"	
 <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, Ilpo
 =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	linux-kernel@vger.kernel.org
In-Reply-To: <a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
References:
	 	<a14640f58be48d4912ce5808faea1402ad7f7ad0.1793906572.git.josh@joshtriplett.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 04:48:44 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-3 
X-ZohoMailClient: External

Hi Josh, Mark,

On Thu, 2026-11-05 at 11:24 -0800, Josh Triplett wrote:
> tpacpi can expose the charging LEDs as `tpacpi:orange:batt` (LED 1) and
> `tpacpi:green:batt` (LED 2). However, at least on my X1 Carbon Gen 11,
> these LEDs get hidden because `TPACPI_SAFE_LEDS` doesn't allow them.
>=20
> Add these to `TPACPI_SAFE_LEDS`, so that tpacpi can expose them.

Please see the commit message of commit a4d5effcc737 ("thinkpad-acpi:
restrict access to some firmware LEDs").

The term "unsafe LED" exists because LEDs are write-only for software and
fire-and-forget for the EC. By taking the control of an unsafe LED, e.g.,
attaching an LED trigger, any warning signal from the EC can no longer be
displayed by the LED.

When it comes to battery LEDs, they are definitely unsafe to override.
After all, batteries are dangerous things when they malfuction. Thus, I
don't think it's suitable to enable it for all users.

>=20
> This was previously proposed in
> https://lore.kernel.org/lkml/20250403040846.7834-1-martin@arp242.net/ .
>=20
> I'm currently toggling these using write_support via ec_sys, and would
> prefer to handle these via the normal LED mechanism.

Since not providing them via the LED core does not really prevents users
to control them, I am also thinking about adding a debugfs attribute that
unlocks unsafe LEDs and taints the kernel.

I believe tainting the kernel when overriding unsafe LEDs would be a
better approach. This is also one of the reason why taint flags exist,
i.e., indicating that something unsupported has happened. Multiple
drivers have taken the approach (hint: grep TAINT_USER).

We can also make the overriding procedure tedious to hopefully block
users who don't know what they are doing:

- Drop CONFIG_THINKPAD_ACPI_UNSAFE_LEDS, so there is no longer a
permanent switch
- Unsafe LEDs are also registered, but with LED_SYSFS_DISABLE set to
disable write access
- Add a debugfs attribute unlock_unsafe_led to every unsafe LED, which
can be written to unlock the LED's write access
- When unlocking, taints the kernel with TAINT_USER

Users must write to the attribute to unlock an unsafe LED. They can't
unlock all unsafe LEDs at once. Instead, they must unlock whatever they
desire one by one.

From the said commit message, it seems that the reason why
CONFIG_THINKPAD_ACPI_UNSAFE_LEDS was introduced was that Lenovo didn't
want to support the use case of overriding unsafe LEDs. So...

Mark, what do you think of the approach?

I will send a patch implementing my proposal soon. You can reply there.

Thanks,
Rong

>=20
> Signed-off-by: Josh Triplett <josh@joshtriplett.org>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..50a8cff5b374 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -5608,7 +5608,7 @@ static const char * const tpacpi_led_names[TPACPI_L=
ED_NUMLEDS] =3D {
>  =09"tpacpi::unknown_led3",
>  =09"tpacpi::thinkvantage",
>  };
> -#define TPACPI_SAFE_LEDS=090x1481U
> +#define TPACPI_SAFE_LEDS=090x1487U
> =20
>  static inline bool tpacpi_is_led_restricted(const unsigned int led)
>  {
