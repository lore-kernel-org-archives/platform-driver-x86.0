Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795786409;
	b=PhejFPaDCaojPif8PWjr4FeC5NJ/8wPncUzC3ywSIIqB6s7YzFPQj3yRT7/IywXKwYEf
	 QCPCkj6VRSWZlMh2TwYRpASnUguMOmk1z0ZZqwn/TnvEuj2Taj3T70fIXkO0NPGrHFqXt
	 Ob5xaGrKaLuT7xvcrtcphGMRO3HJjR4XOPsEIhRs25zFz8G5Alm8XYt5iHv+PTKBpnG0a
	 BWtlo/hwQVPm636/y3pWB+DamDp23g8cVQYTInd7899aOec+vUHYjFapNppUuytn4DBFz
	 A/nLSwBDPIVX5dUAkr4V23ZEBqVt2CTyih884j/2poKs6uU/++PuBVWBzJN8/uJkcOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786409;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=4bOvD9F8wXxeuJGV5o6nNw+frH6lFpiy+J7ytf+khqM=;
	b=iELvqUWaprsFK4/Fbc+XpqcB5cs0Pvo54McdKfkwIcIcAqNO2SdlW2JLQKd+T4VWLz4b
	 r0P82tHRJI+NgYRkUXedUgqbDBgPPv5VBVtE6tMPgjoKfkw1E6aKEWrGbqZdJH0sw38jK
	 bfKA2yNnktF7QmwfNzfQxcRHa5lNJm51bngCx6/tOmgr8xik5V8ywmRr0v1yP9BjFk4MQ
	 XDq8/l9vqt0Kx8awRJ7edm0OlZKA0VgRO4X7VxyLYFeZXlfvRbczTBAfw/WBfsf36KxCe
	 PA7QrP5ArGj+Cu7LudKwBsUWd8txn7kJKuPaW6kfEiMwIvtzP3WxwCKlqoJp3VT/TlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="Lg/45KUU";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C631606A31F;
	Fri, 27 Nov 2026 13:33:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C631606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=Lg/45KUU
ARC-Seal: i=1; a=rsa-sha256; t=1795786373; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ev3uamfBnz5Xj0hB4jWqXrguNa6/0CCx/Lljlx3nVHq2PdjZhur65S1IqoQspUbT/IbeZgOrvi7NCMCwG/S/OJ0FJW88gu5NA7yDW9t2935/nrOVRlGq2aUxPBppjriDEeITFq6SHM96SwAsVntn0lOHsGbwDx760SmBWZRhLEY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795786373; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4bOvD9F8wXxeuJGV5o6nNw+frH6lFpiy+J7ytf+khqM=; 
	b=LODqX6Nb4NUMIprE/HUMSNEASAMYr487hYedncwu75gh0THyjEaxPjToSmUiogHD7GUST4Elwbzmd+V0WzHPS33PVgdfp3FT80hJ2/7onzMkWnufcEKJN4PvjbtM3SmVnVEddEa34sbVcYg7gYJRo0qRxu7JQry//Va9mvnpl+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=Lg/45KUUjfUvDqMYdnUbga1owfyYoe1i1ScqrVDLgoYG5t6PzxMcsiOZwz9IAKAf2DdtBkFAveKEnI/244EFEWDRlkSiEh2nRjcuQ8tYpbGMSj5Nw3TM15YY6I1x9K+yE7e2Dgttn0VhNxrHLJf0k74Jo+i1NpLABhP5wt1syOE+2O+akKAO6Tq+f/pHOQzE4dCK54uZZd5PFWS+AkkQXkxHXqymJN4Ft6L7K/1os4bnvkf41HnFcaNg2h1oPzWBGNheyi9lq5HMbQGPqJtEqxg4O7MKQgSEDt9bb/v3aekjFyZan+JQCg9JEXCHTfKnJFdrOXA/msgXnQHpk/1Gbg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=4bOvD9F8wXxeuJGV5o6nNw+frH6lFpiy+J7ytf+khqM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795786371321993.0028180051801;
	Fri, 27 Nov 2026 05:32:51 -0800 (PST)
Message-ID: <f6c48e55e348c5087b3a82e79cb88fdd4e6baa5c.camel@rong.moe>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix fan speed reporting
 on X9 Gen 1
From: Rong Zhang <i@rong.moe>
To: Vishnu Sankar <vishnuocv@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J . Clark"	
 <derekjohn.clark@gmail.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Huang Wei <huangwei@kylinos.cn>, platform-driver-x86@vger.kernel.org, 
	ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	klorico2@lenovo.com, vsankar@lenovo.com
In-Reply-To: <20261126085937.53711-1-vishnuocv@gmail.com>
References: <20261126085937.53711-1-vishnuocv@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 21:25:33 +0800
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Vishnu,

Thanks for working on this.

On Thu, 2026-11-26 at 17:59 +0900, Vishnu Sankar wrote:
> On the ThinkPad X9-14 Gen 1 and X9-15 Gen 1, the EC reports fan1 RPM
> in registers 0x84/0x85 and fan2 RPM in 0x82/0x83, and does not use
> bit 0 of 0x31 as a fan select. As a result fan2 reports fan1's speed,
> and every fan read overwrites an EC-owned bit.
>=20
> The EC also does not latch either register pair, so a read can combine
> the LSB of a new value with the MSB of an old one.
>=20
> Add two quirks: TPACPI_FAN_2REG reads fan2 from 0x82/0x83 and never
> touches 0x31, and TPACPI_FAN_UNLATCH re-reads an RPM register pair
> until the MSB is stable. Enable both for the X9 Gen 1 models.
>=20
> A single fan level write controls both fans on these models, so second
> fan control is disabled when TPACPI_FAN_2REG is set.
>=20
> Tested on X9-14 Gen 1 (BIOS N4DET42W, EC N4DHT39W).
>=20
> Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>

Reviewed-by: Rong Zhang <i@rong.moe>

Thanks,
Rong

> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 79 ++++++++++++++++++---
>  1 file changed, 68 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platfo=
rm/x86/lenovo/thinkpad_acpi.c
> index 4f81855ad721..266f774b8ac3 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -7964,6 +7964,8 @@ enum {=09=09=09=09=09/* Fan control constants */
>  =09fan_select_offset =3D 0x31,=09/* EC register 0x31 (Firmware 7M)
>  =09=09=09=09=09   bit 0 selects which fan is active */
> =20
> +=09fan2_rpm_offset =3D 0x82,=09=09/* EC register 0x82: LSB, 0x83 MSB (fa=
n2 RPM) */
> +
>  =09fan_status_offset_ns =3D 0x93,=09/* Special status/control offset for=
 non-standard EC Fan1 */
>  =09fan2_status_offset_ns =3D 0x96,=09/* Special status/control offset fo=
r non-standard EC Fan2 */
>  =09fan_rpm_status_ns =3D 0x95,=09/* Special offset for Fan1 RPM status f=
or non-standard EC */
> @@ -8012,6 +8014,8 @@ static int fan_watchdog_maxinterval;
>  static bool fan_with_ns_addr;
>  static bool ecfw_with_fan_dec_rpm;
>  static bool fan_speed_in_tpr;
> +static bool fan2_with_own_rpm_reg;
> +static bool fan_rpm_unlatched;
> =20
>  static struct mutex fan_mutex;
> =20
> @@ -8073,6 +8077,9 @@ static void fan_quirk1_handle(u8 *fan_status)
>  /* Select main fan on X60/X61, NOOP on others */
>  static bool fan_select_fan1(void)
>  {
> +=09if (fan2_with_own_rpm_reg)
> +=09=09return true;
> +
>  =09if (tp_features.second_fan) {
>  =09=09u8 val;
> =20
> @@ -8093,6 +8100,9 @@ static bool fan_select_fan2(void)
>  =09if (!tp_features.second_fan)
>  =09=09return false;
> =20
> +=09if (fan2_with_own_rpm_reg)
> +=09=09return true;
> +
>  =09if (ec_read(fan_select_offset, &val) < 0)
>  =09=09return false;
>  =09val |=3D 0x01U;
> @@ -8202,21 +8212,48 @@ static int fan_get_status_safe(u8 *status)
>  =09return 0;
>  }
> =20
> +/* Read a 16-bit RPM register pair (LSB at offset, MSB at offset + 1) */
> +static bool fan_read_rpm(u8 offset, unsigned int *rpm)
> +{
> +=09u8 hi, lo, hi2;
> +=09int retries =3D 3;
> +
> +=09if (fan_rpm_unlatched) {
> +=09=09/* No latch: re-read until the MSB is stable */
> +=09=09do {
> +=09=09=09if (!acpi_ec_read(offset + 1, &hi) ||
> +=09=09=09    !acpi_ec_read(offset, &lo) ||
> +=09=09=09    !acpi_ec_read(offset + 1, &hi2))
> +=09=09=09=09return false;
> +=09=09} while (hi !=3D hi2 && --retries);
> +
> +=09=09if (hi !=3D hi2)
> +=09=09=09return false;
> +=09} else {
> +=09=09if (!acpi_ec_read(offset, &lo) || !acpi_ec_read(offset + 1, &hi))
> +=09=09=09return false;
> +=09}
> +
> +=09*rpm =3D (hi << 8) | lo;
> +=09return true;
> +}
> +
>  static int fan_get_speed(unsigned int *speed)
>  {
> -=09u8 hi, lo;
> +=09unsigned int rpm;
> +=09u8 lo;
> =20
>  =09switch (fan_status_access_mode) {
>  =09case TPACPI_FAN_RD_TPEC:
>  =09=09/* all except 570, 600e/x, 770e, 770x */
>  =09=09if (unlikely(!fan_select_fan1()))
>  =09=09=09return -EIO;
> -=09=09if (unlikely(!acpi_ec_read(fan_rpm_offset, &lo) ||
> -=09=09=09     !acpi_ec_read(fan_rpm_offset + 1, &hi)))
> +
> +=09=09if (unlikely(!fan_read_rpm(fan_rpm_offset, &rpm)))
>  =09=09=09return -EIO;
> =20
>  =09=09if (likely(speed)) {
> -=09=09=09*speed =3D (hi << 8) | lo;
> +=09=09=09*speed =3D rpm;
>  =09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
>  =09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
>  =09=09}
> @@ -8238,7 +8275,8 @@ static int fan_get_speed(unsigned int *speed)
> =20
>  static int fan2_get_speed(unsigned int *speed)
>  {
> -=09u8 hi, lo, status;
> +=09unsigned int rpm;
> +=09u8 lo, status;
>  =09bool rc;
> =20
>  =09switch (fan_status_access_mode) {
> @@ -8246,14 +8284,16 @@ static int fan2_get_speed(unsigned int *speed)
>  =09=09/* all except 570, 600e/x, 770e, 770x */
>  =09=09if (unlikely(!fan_select_fan2()))
>  =09=09=09return -EIO;
> -=09=09rc =3D !acpi_ec_read(fan_rpm_offset, &lo) ||
> -=09=09=09     !acpi_ec_read(fan_rpm_offset + 1, &hi);
> +
> +=09=09rc =3D !fan_read_rpm(fan2_with_own_rpm_reg ? fan2_rpm_offset : fan=
_rpm_offset,
> +=09=09=09=09   &rpm);
> +
>  =09=09fan_select_fan1(); /* play it safe */
>  =09=09if (rc)
>  =09=09=09return -EIO;
> =20
>  =09=09if (likely(speed)) {
> -=09=09=09*speed =3D (hi << 8) | lo;
> +=09=09=09*speed =3D rpm;
>  =09=09=09if (fan_speed_in_tpr && *speed !=3D 0)
>  =09=09=09=09*speed =3D FAN_CLOCK_TPM / *speed;
>  =09=09}
> @@ -8873,6 +8913,8 @@ static const struct attribute_group fan_driver_attr=
_group =3D {
>  #define TPACPI_FAN_DECRPM=090x0020=09=09/* For ECFW's with RPM in regist=
er as decimal */
>  #define TPACPI_FAN_TPR=09=090x0040=09=09/* Fan speed is in Ticks Per Rev=
olution */
>  #define TPACPI_FAN_NOACPI=090x0080=09=09/* Don't use ACPI methods even i=
f detected */
> +#define TPACPI_FAN_2REG=09=090x0100=09=09/* Fan2 RPM in EC regs 0x82/0x8=
3, no fan select */
> +#define TPACPI_FAN_UNLATCH=090x0200=09=09/* RPM registers are not latche=
d */
> =20
>  static const struct tpacpi_quirk fan_quirk_table[] __initconst =3D {
>  =09TPACPI_QEC_IBM('1', 'Y', TPACPI_FAN_Q1),
> @@ -8908,6 +8950,8 @@ static const struct tpacpi_quirk fan_quirk_table[] =
__initconst =3D {
>  =09TPACPI_Q_LNV3('R', '0', '0', TPACPI_FAN_NOACPI),/* E560 */
>  =09TPACPI_Q_LNV3('R', '1', '2', TPACPI_FAN_NOACPI),/* T495 */
>  =09TPACPI_Q_LNV3('R', '1', '3', TPACPI_FAN_NOACPI),/* T495s */
> +=09TPACPI_Q_LNV3('N', '4', 'D', TPACPI_FAN_2REG | TPACPI_FAN_UNLATCH),=
=09/* X9-14 Gen 1 */
> +=09TPACPI_Q_LNV3('N', '4', 'C', TPACPI_FAN_2REG | TPACPI_FAN_UNLATCH),=
=09/* X9-15 Gen 1 */
>  };
> =20
>  static int __init fan_init(struct ibm_init_struct *iibm)
> @@ -8959,6 +9003,12 @@ static int __init fan_init(struct ibm_init_struct =
*iibm)
>  =09=09tp_features.fan_ctrl_status_undef =3D 1;
>  =09}
> =20
> +=09if (quirks & TPACPI_FAN_2REG)
> +=09=09fan2_with_own_rpm_reg =3D true;
> +
> +=09if (quirks & TPACPI_FAN_UNLATCH)
> +=09=09fan_rpm_unlatched =3D true;
> +
>  =09if (quirks & TPACPI_FAN_NOACPI) {
>  =09=09/* E560, T495, T495s */
>  =09=09pr_info("Ignoring buggy ACPI fan access method\n");
> @@ -8993,9 +9043,16 @@ static int __init fan_init(struct ibm_init_struct =
*iibm)
>  =09=09=09if (res >=3D 0 && speed !=3D FAN_NOT_PRESENT) {
>  =09=09=09=09/* It responded - so let's assume it's there */
>  =09=09=09=09tp_features.second_fan =3D 1;
> -=09=09=09=09/* fan control not currently available for ns ECFW */
> -=09=09=09=09tp_features.second_fan_ctl =3D !fan_with_ns_addr;
> -=09=09=09=09pr_info("secondary fan control detected & enabled\n");
> +=09=09=09=09/*
> +=09=09=09=09 * fan control not currently available for ns ECFW,
> +=09=09=09=09 * and not needed with 2REG: one write drives both fans
> +=09=09=09=09 */
> +=09=09=09=09tp_features.second_fan_ctl =3D !fan_with_ns_addr &&
> +=09=09=09=09=09=09=09     !fan2_with_own_rpm_reg;
> +=09=09=09=09if (tp_features.second_fan_ctl)
> +=09=09=09=09=09pr_info("secondary fan control detected & enabled\n");
> +=09=09=09=09else
> +=09=09=09=09=09pr_info("secondary fan detected\n");
>  =09=09=09} else {
>  =09=09=09=09/* Fan not auto-detected */
>  =09=09=09=09tp_features.second_fan =3D 0;
