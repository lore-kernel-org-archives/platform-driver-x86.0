Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B13AB26B;
	Tue, 12 May 2026 23:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628127; cv=none; b=N7ZrdEQu2maSuKEfjTWDD7lwm6cMKSC6DMlbUOH9P1/o9BFQeFm70Q2VC19QpSh/d/hoHJE31miOR+gnBAFTXvKhUiBjxMZ6yRwQJk40ebxuTl9gQFMbFWhlr+FA5YVEaFgaS2XtsnRJxL7SIyNLOAEMTXZu5AnmkD+cKl72X+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628127; c=relaxed/simple;
	bh=KpBew3LPN5Kt1RkK5urtax7zZazRJunhyU1iLqYK9mA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Whgl6feE3hGkbQuYkT4R5zpbiSVR6q+kcgZemHUDXEPCRdxwVLhNzbCh8uomjdd3i98wVEjKlZ7od96YF1+g1eBztPwniteid/pWWmaD+BuNbPZPLRwqQ+lmizUE2Ao/iwbsDYGUzE7+PemLm41PIXtJdYrmDTeWqXGK5QoZFj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MaEU++Bb; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MaEU++Bb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1778628116; x=1779232916; i=w_armin@gmx.de;
	bh=vgSeByYt3HduI9qwuNRC0RK1o8v0kGzzs1/YyeR97a4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MaEU++BbqTSJjJjb2YrtbBCgZCNsWsP8S3lqhVpO90pjsZHNydmcaGIHvJEeLAH2
	 5HB8uV/sRKDbtOVeGwC4Fd3fyTyxODKJ2iMXBjmV4lPywYTDT0a3BQGz4o6fHHwFT
	 9bV9oCnNdANh5SxvCQqXmMJikODh6Nsjs2t2Uu8ByQ5hzmBaFyODI3yDv+1+se54k
	 mKwOH8/IJvie+waROmxQhEk2mQPDazc/4CB0o1WZvojigvx73sMVUwlhHM8SuCXSS
	 aavGIphREp/+9Bg4aZrL3Nc92ge9jua6yn2+qZRkIYyaybyrom/m87UJqP58oFFgD
	 Dtsw1XxTreAyUNP9Ig==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgvrB-1x3PmD2Zfp-00iqtc; Wed, 13
 May 2026 01:21:56 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/8] platform/x86: uniwill-laptop: Rework FN lock/super key suspend handling
Date: Wed, 13 May 2026 01:21:42 +0200
Message-Id: <20260512232145.329260-6-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260512232145.329260-1-W_Armin@gmx.de>
References: <20260512232145.329260-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OtA0Kr37UUygrWS+VcuEm0AYzmKa6wicKnxAA/KXSZg3ddAVfj8
 gQkVvmRRUXowEcEotTdZfvl/D7A1XwMI9nmdo7rmJrw8odmcKBReLeXcPttSDtt2CMOXaFG
 ZyTfDnHCYHZ+n3DiRqMIPiiEb7ko5Lk9DJASVNubKqbeLpEDRmcU3V9XJnv1RbmIycAmEAb
 MVDh4wDTFiCO7ZxSR+nhg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:G1K14DUoR3M=;2jEG5IRadF3G5d8Pe52i1fsR71d
 v4mjOneFuH2FxgHMu9iA27QF40SJwkWt30DjogTAG2IsjnQQcuzgFP9J92FpgmdVzxvVFpMBp
 oOxM8aYYxGOYZGD6oQJb29HijOSoPmNgg5Xu3PzPeKCl/r6uLrmLaLZYF8s/n2vpT5ZBkSDt+
 YjPIKMZbDFzIeeUcliagJtRDdaUAzYaJ6z4RJ+pZLx6Kf/QyR2TTXyyqfBx8UTrkO9m+vqVJn
 gVomIQYKJAZmRF0sYKpqFVHQ3kq5u+TlG+B82YOlmM0KnHcc3BwMvNrjlfZg9PIDB4omFZBLc
 jIYd85fZkTD3Jh7WRXt4Go3gItWJRQ41y0q9Bey4mbFK4te+YQ9U52tEeKfyVi/HRYRlJPqgu
 aD5ssbzf+up12eQg/G/HfWK79McIDb/Vp1xVueFAhWRvFeDcp98LZ5FiGfr9tdIiSWD/dEGqL
 5aBwRHNCdzdPUH+2r32XH7oJzwxTpkMMjB5XlKUU1ey6bT/VAbkABnCuPeagHxoMr845HNUpD
 UUetkWYS4z8B5wYjhTP+TnNQcRPsQS1364OwUCuGDejecYMaEiLKh6CG54Oyd4t9enoRMgOIB
 wumvWqQ60j1Cv8UU6v78KlwRzXP3nNZmL48SGBxg8vFAj2aIvxf7o1l3+3a8Cr11l37HnhBKg
 g0yRE/gl2yLurnwqk7o/miluTXEbPNYJ7OuWpcZ1TMy3Eyu9idOpGY5Rk+1qdXuYU7pRSCHYh
 rZq8Itid+P3rKnHtMiPTPtinkai8/j3jl95+5KfP2QjNmP8KhqKw4c7dw3JikgKGZOiAlajh6
 Bg6mm7rp2eb3DvzotuQCJTE/ShnrRY8vJZpNs74xib7l60YXqyWJPpdNT+N+NpLtUTfi23sqv
 CYvmTuTYZPlcJpq1mA0m/YGbsbvk6DS86NljfHLQijHi/EqQeGYpH6dgSuxPMZ/Ph2x+t6iA4
 zX+45uH82gtnDJAp2SUEK4RrP0P4YGzfOPuuk71yU2uWTNbUMZ8trFNDwkH2ShY09PNtqC9xl
 EA2gEdNKtnQH5zlu6bB2VFn8VyofJBrECnuOD/ZifsjPOZ6ka1347QjX9ssu9BiYfSEbfGwnO
 XGTmpuN3TrXz2QYOy0g7J1c7Sg2+fzNButCvywqeyXN0LoY+KwZERTNk+4QV9VHwgYFi9dg7G
 9WhjSZZKtmS/ZgQEc67qENIz3uf4Iimbu9UvlrdXKCT5BbQx7F7nwPrZRKmBKO3OQSdqlzXnT
 fBJU72XLKgHXpMJ3Ud6PR6LNvnyC5JaKhu62YOQWLqoyzLyUB7F2a9+0XHN9jPGKkrnt1bQxZ
 hxwe0eSHF/NRbDpCInM2NOc3M2kPEpb7F/s3Tuy9vYrcKvZ2YBFmrpky7Wa1r6R4EScTAVBf3
 pf5FJMnK9HT5m3xeZjGLT3KuKOemV2gC5TNpYuQ/m9vRFPkQ0WIrVpthlMRgRp3AFmdJkCiqQ
 lzpQCY4cXt8VfgKO0d7+M/O2iBJ86n+k+WVkcRja47iHRRHKrPr3ZmdROyL4ZcDkRB4JXjm36
 f7bQIeHQgj93OLclqvOsczc3G93FMNWXAbfYWPy1Wn/oDGDJyj62fuswMgsuswfvlipCmDL3S
 SvIfD3eRTNvX+Ga2Zc7DlT/9z5vIIzBGc2fTpGHEaTdacaqyMmRvMbBV/bMzXvwhZQMbbkGkm
 TQ5ljuZE/0eQMyAvJpDGssFtAstl3qN9IC/YHBFPWH1oiTdSfigy7vzRnfbApV1APnlGFG1k9
 s8D1z2ajjzDl+ZdPAYCYmI10gTnfhQYdlV03V4qYLlYrtoT2DB9I502FKXWWQcDwbubU3FZdu
 v3nP3lNTedC3HuuD7+vLFUJhG4DkXpAdgF2O9aEGORlGuja0Xan3PPuKy8IjlVX2oAAv6eQAv
 UZjY9D8TRNWLXXxYKWygAydrGx/8iT7oo0xwq01fOsLhDnHIhEEAz9BxDAzJID0e3JIP5hVf5
 U0qpS1OvdxobBl/MTq2fx2tj9HLiNlJd4Gf/jncfUNSy43XG5UmMqnnkPea8Dxf8JI3N10yA8
 9WtsqUBSlM1t1hVuFchFOyD9b4cYy8zpBl8xgDYTSQqTELCWBITOGRepRwC2njct4gUBZ7Uiq
 sFggpYg8179pyNYgzbYdcHbq0TQqyxMdoWnneM11IYXdWeW/Q2F/p6wK7/GP3sGYe2B5s2wOz
 WvjvFdcwa1BpxzY+BvfNSgd/bC0wRp2A+bq4t7E8oBwPlhkDuWbrQw/EhfDPunA1ZKJNK3D4N
 NdU+HHOnzFWGH5rqE0e0+5rcmRQoFPYP6TnCAhiQy3y8Wo0SvRsQEDijw1EsfbCPy6Hsx8Mu6
 xD30fnu8bSSr+U014jz+DzuBEGFDto+9d9VQEBiK+YpNlX+XmGWRFxM2kTm/NZY/jAMs93BcX
 t1Dt/HzQbthkdP8UzphXwyHici5xWlAYSFv7T6UW9hiUb7BRHKmbq4/njQfNH9V/0jH9Ivp8a
 9iqSSbfeqwgBWVZPBs9RbPuizIghold/iBQ+02Yzxmm59vJMidXuQx1swPNTJ7M2cEN7XVPXQ
 GXTmArIFFVtgICWZteYQ2bBS4kDUeCN3To8r0ICh25jkoK6XOYvelFtmgR7+JAnjIt2g8OtCP
 4A4LR45J0K7VNRvGOkEeXg9nNbuXHZX1ovrJjzZJBmA/Ur1QET7FY0TTWj2s8z5RKPd7CZnuW
 zbewmLbd4YpBowL/L5QZZC/mB6gWGeMxkBxy8GyXwq7UAXm2s78xS8gukNrwIKOyNpgrBySjT
 Sx8Tts4xNAKiYYGGhYOW2IocB3ouiCjr5nqEFK03a/756xOJVj80v7stFfAb/wggkcL/QO0wv
 TK6e2F9izM9wxgc04MLv9+AtfREMyrLhryP/gtu02fC7XVUkKSAKqEQAmGYPdk+Ujx7bbd5yI
 NelQX5d7UPYRJJVWrKpslmplZDCeW/nLip3rwguA1NqdjIemmVyJhGtKTSVHJhWxXaL3sATQy
 CcGLqoxz8QEZZvkPUKQ8gwnEdchV78ofa3nIOWYs9HjP65xHu52v/3d/loPIqbhcZbS6jetJA
 qh23FgEpFsFATT4Ycit9GaqgDSbEMqUoQntR54erZxdHGny8aSYXctvejINm843HkbeDXyVwL
 617Aaq/NvKLpiF+bNIa+yOA91jTx9yzcJLzMmRNRCI9oGxGzgR3ER0iV9BpHTmcOc23ZksXrm
 E8KiGsISsxZFKeOEOs9KhLyMtSohkQO0Xa0nk6bLBd3YuJBLG+EiLDswLgcjTy+naCda3M7ao
 n4UeMXupBLVpKoYMxTzBm988ODfV+t5us/OO7Rpi3owOMBWqgyRq7qZXXYx9vaUrb9OKD1h1Y
 TtmHkB/KLmkuvdq+AfsoXbcryfrTUYH64hMtLSM5+ztp+rjcn7nkiORY/59Ff5lEnPEV7fN4O
 6ztJ7PISE8WrbES9F6vwVT3pram6Qon2TzUKQHxQdk7QLMmRiwgoduZNowV1Z4GooXdOhbJAb
 MfNbRgQqPBR3LMWU0apQAr8Ey08q69yyNn/2FguWCybYjoKoZfyiHH/GcM0BVzeQo+4wYMvj0
 DZcVfphfbVmX7VGGP4murA61W8TxXgTLPfPFea0VaxI1uJz4u2hJE/BRPgEaWSrfp6S6umUcJ
 NHEeRNML3Evp3EvhI1qBTDa2z1UczTghG0rbXEd3Uyz1NYzJg7dQxAEVz0I4lHH2NQyteUTm0
 cs11EDFwcquOeqbxMfIyJ6gAh3Hw/niK/TADxOkikTgPMt1brqV59Jy1HhpQxhuZf8/FcaDHo
 +NBzp1SCGhEXrPxPOqu0+1/OSie0Is82lt5yF0Hdj4mtadJGCtPcPGiq39KGnmFXXwhMaHQ4q
 cn+QL0yXT3XAetqCJik5pP8Ysoh98B9RxHEP6RaR3g1Hx9XpgGiR2WjtXsxIg2JkXsBqhmfSR
 Zte1hEz1vOsrcsvZfugdULAPDxykR2zs6hwFscRdg1WrMnMNZaRnQHc5yWpNgvYZOEVLfNGIs
 StdQ5OY0idJ82Rrz9bTbWCtVyCSZR1v68Rf/Kx52Re9d2Vgvbw+7hmu/Yf/x1SG4PtrdXodfC
 Tm67K6HvQ/0OO1+vINrGdiFIX9nSwvw8kkJqphgIUEbyq8VtH6o9gCFPjZ7MJHLLH02JGGmRE
 AVkEVtAGEB4lI5Axoki9NnLoD4S24cz6EX/Jf/mrhPUzKVhHWOYGezyHwcIQkxixEkgBvoXhd
 TibREIdZEI38JoUj1jHv1pz/uSzehm1AALiPc80wHtU833R3xKak3ScwIXZQBL0bTBy3WYXWo
 7gA+yPMahlBxgih88y7uySHg/k3pmKf4dO38NAWD1JTJuLiN8UHxOfCQM/sUNflLOXZKZ8zc3
 HHBIFC18tkbOTGpCSB2VIkO7+YpzDm6bXWh98vvF/OCn2B+sYInJ7YbvNlpehp4+EYzVD5oR7
 wocPcF8uPNt9boM6OS4H/G4eG3380J5v8Uj8VhxtIKjn0D4FStWPIpqpwsGpr1tNUFekfcKqa
 i3NjerDWKzIlEmU4Gl0Tj2QRdL0zfQd/d3SkGbdgZqBUEwq5hcLB0WME7oOaPYmDMrWZWiSBF
 T3GLk6Ktm4NpvQ0aL51Zn/6QpzuZFJsWFiim5nwtQqV1HMHJyVReC3jw2DCIxQb6tBZOlUW4E
 Y7mGh7OR4w5VAfLt7Ea8u/Wh+K/HiEjw/QpZep37mmI7szN+uWDIAgfLfQTbYYTjvEuGfTx/R
 a8f0ZvYroNAuAUrQNVwx56qTAQ6hK7T/piiNvc5v/GJJYLLr4i/VSeGrmKfHCNy60ocn+6mQN
 3I88TvkIIsAyRXJVZOXC+2chXFMB8xTAJtAMF7GQC+IQ5qbDRTsGaloiBR+zF1ydjlKOM8xoM
 8ol1qehTZdtChEC4L523Ef30UoDzWwa1RSID7wKZm0W+tiYHwJMyPsn/IVdxSrGcvViln07Ha
 1PFKp7FGmWI56ZFarJHcgzywKwNXKKUOr+2TCz01qHCrKVzCqQUlMQ4M71b9r0HQMukBjW91+
 GQEBSZ69H4I3Dz/u9AjpaF4Mv+f4sJptZZyZwbWlEbBh/4L4bAEUZ6X+pI6TksLVEK2lCyOCn
 NYQnN8mXNTCSAfIuRAwzNUS8p+vj5lbR0IXhX3YhZI2mMLcst8Vr5e7u3C0KN213huQAfC8Qr
 /jhrHOT53IKNt3cD3yt0yGfWLBk5xxF443Kh61ftp8vm1OUxgQG+r7aS13v2zG1T7sx/PaF1m
 1pomVF/4yf139nds14A3BcrycTiFk9T1/REf3HVycTUMmWDRMOhEhZNjuHeAWdBVyK7Bu6FwQ
 KiPKF4R+EyXuyCHAPc30yU3a+PyJQiDwdA6Huy4h12jtXNF/kda+4IRp9VgPWA6yBzZAp5GgR
 l1j9BMpAM0FVSkGm/ycKynyWVhnKrsUAFenTvgKhqKvUPFGSiScAcrUYaR7w0e4PXN0podGc+
 RRQYUM31XKxV1/hNZY587YK9UEKyym4xEJJetd7TE5NjMLSqPYsexTO7P1K3Mq3B1ajmAwnn6
 Yyz+LK7XPn+v9uotNf4cb0Z30TE8SuhdGMaTV9Xn4BsmdatWSON4+Q6vx

Currently the suspend handling for the FN lock and super key enable
features saves the whole values of the affected registers instead of
the individual feature state. This duplicates the register access
logic from the associated sysfs attributes.

Rework the suspend handling to reuse said register access logic and
only store the individual feature state as a boolean value.

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 117 ++++++++++++--------
 1 file changed, 73 insertions(+), 44 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 8cc01bec77b9..c73e280a58bd 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -341,8 +341,8 @@ struct uniwill_data {
 	struct acpi_battery_hook hook;
 	unsigned int last_charge_ctrl;
 	struct mutex battery_lock;	/* Protects the list of currently registered =
batteries */
-	unsigned int last_status;
-	unsigned int last_switch_status;
+	bool last_fn_lock_state;
+	bool last_super_key_enable_state;
 	struct mutex super_key_lock;	/* Protects the toggling of the super key l=
ock state */
 	struct list_head batteries;
 	struct mutex led_lock;		/* Protects writes to the lightbar registers */
@@ -619,11 +619,22 @@ static const struct regmap_config uniwill_ec_config =
=3D {
 	.use_single_write =3D true,
 };
=20
+static int uniwill_write_fn_lock(struct uniwill_data *data, bool status)
+{
+	unsigned int value;
+
+	if (status)
+		value =3D FN_LOCK_STATUS;
+	else
+		value =3D 0;
+
+	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS=
, value);
+}
+
 static ssize_t fn_lock_store(struct device *dev, struct device_attribute =
*attr, const char *buf,
 			     size_t count)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
 	bool enable;
 	int ret;
=20
@@ -631,21 +642,15 @@ static ssize_t fn_lock_store(struct device *dev, str=
uct device_attribute *attr,
 	if (ret < 0)
 		return ret;
=20
-	if (enable)
-		value =3D FN_LOCK_STATUS;
-	else
-		value =3D 0;
-
-	ret =3D regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATU=
S, value);
+	ret =3D uniwill_write_fn_lock(data, enable);
 	if (ret < 0)
 		return ret;
=20
 	return count;
 }
=20
-static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
+static int uniwill_read_fn_lock(struct uniwill_data *data, bool *status)
 {
-	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
 	int ret;
=20
@@ -653,23 +658,31 @@ static ssize_t fn_lock_show(struct device *dev, stru=
ct device_attribute *attr, c
 	if (ret < 0)
 		return ret;
=20
-	return sysfs_emit(buf, "%d\n", !!(value & FN_LOCK_STATUS));
-}
+	*status =3D !!(value & FN_LOCK_STATUS);
=20
-static DEVICE_ATTR_RW(fn_lock);
+	return 0;
+}
=20
-static ssize_t super_key_enable_store(struct device *dev, struct device_a=
ttribute *attr,
-				      const char *buf, size_t count)
+static ssize_t fn_lock_show(struct device *dev, struct device_attribute *=
attr, char *buf)
 {
 	struct uniwill_data *data =3D dev_get_drvdata(dev);
-	unsigned int value;
-	bool enable;
+	bool status;
 	int ret;
=20
-	ret =3D kstrtobool(buf, &enable);
+	ret =3D uniwill_read_fn_lock(data, &status);
 	if (ret < 0)
 		return ret;
=20
+	return sysfs_emit(buf, "%d\n", status);
+}
+
+static DEVICE_ATTR_RW(fn_lock);
+
+static int uniwill_write_super_key_enable(struct uniwill_data *data, bool=
 status)
+{
+	unsigned int value;
+	int ret;
+
 	guard(mutex)(&data->super_key_lock);
=20
 	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
@@ -680,20 +693,33 @@ static ssize_t super_key_enable_store(struct device =
*dev, struct device_attribut
 	 * We can only toggle the super key lock, so we return early if the sett=
ing
 	 * is already in the correct state.
 	 */
-	if (enable =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
-		return count;
+	if (status =3D=3D !(value & SUPER_KEY_LOCK_STATUS))
+		return 0;
+
+	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KE=
Y_LOCK,
+				 TRIGGER_SUPER_KEY_LOCK);
+}
+
+static ssize_t super_key_enable_store(struct device *dev, struct device_a=
ttribute *attr,
+				      const char *buf, size_t count)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	bool enable;
+	int ret;
=20
-	ret =3D regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_K=
EY_LOCK,
-				TRIGGER_SUPER_KEY_LOCK);
+	ret =3D kstrtobool(buf, &enable);
+	if (ret < 0)
+		return ret;
+
+	ret =3D uniwill_write_super_key_enable(data, enable);
 	if (ret < 0)
 		return ret;
=20
 	return count;
 }
=20
-static ssize_t super_key_enable_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
+static int uniwill_read_super_key_enable(struct uniwill_data *data, bool =
*status)
 {
-	struct uniwill_data *data =3D dev_get_drvdata(dev);
 	unsigned int value;
 	int ret;
=20
@@ -701,7 +727,22 @@ static ssize_t super_key_enable_show(struct device *d=
ev, struct device_attribute
 	if (ret < 0)
 		return ret;
=20
-	return sysfs_emit(buf, "%d\n", !(value & SUPER_KEY_LOCK_STATUS));
+	*status =3D !(value & SUPER_KEY_LOCK_STATUS);
+
+	return 0;
+}
+
+static ssize_t super_key_enable_show(struct device *dev, struct device_at=
tribute *attr, char *buf)
+{
+	struct uniwill_data *data =3D dev_get_drvdata(dev);
+	bool status;
+	int ret;
+
+	ret =3D uniwill_read_super_key_enable(data, &status);
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", status);
 }
=20
 static DEVICE_ATTR_RW(super_key_enable);
@@ -1723,10 +1764,10 @@ static int uniwill_suspend_fn_lock(struct uniwill_=
data *data)
 		return 0;
=20
 	/*
-	 * The EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
+	 * EC_ADDR_BIOS_OEM is marked as volatile, so we have to restore it
 	 * ourselves.
 	 */
-	return regmap_read(data->regmap, EC_ADDR_BIOS_OEM, &data->last_status);
+	return uniwill_read_fn_lock(data, &data->last_fn_lock_state);
 }
=20
 static int uniwill_suspend_super_key(struct uniwill_data *data)
@@ -1735,10 +1776,10 @@ static int uniwill_suspend_super_key(struct uniwil=
l_data *data)
 		return 0;
=20
 	/*
-	 * The EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restor=
e it
+	 * EC_ADDR_SWITCH_STATUS is marked as volatile, so we have to restore it
 	 * ourselves.
 	 */
-	return regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &data->last_swit=
ch_status);
+	return uniwill_read_super_key_enable(data, &data->last_super_key_enable_=
state);
 }
=20
 static int uniwill_suspend_battery(struct uniwill_data *data)
@@ -1795,27 +1836,15 @@ static int uniwill_resume_fn_lock(struct uniwill_d=
ata *data)
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK))
 		return 0;
=20
-	return regmap_update_bits(data->regmap, EC_ADDR_BIOS_OEM, FN_LOCK_STATUS=
,
-				  data->last_status);
+	return uniwill_write_fn_lock(data, data->last_fn_lock_state);
 }
=20
 static int uniwill_resume_super_key(struct uniwill_data *data)
 {
-	unsigned int value;
-	int ret;
-
 	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY))
 		return 0;
=20
-	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
-	if (ret < 0)
-		return ret;
-
-	if ((data->last_switch_status & SUPER_KEY_LOCK_STATUS) =3D=3D (value & S=
UPER_KEY_LOCK_STATUS))
-		return 0;
-
-	return regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, TRIGGER_SUPER_KE=
Y_LOCK,
-				 TRIGGER_SUPER_KEY_LOCK);
+	return uniwill_write_super_key_enable(data, data->last_super_key_enable_=
state);
 }
=20
 static int uniwill_resume_battery(struct uniwill_data *data)
=2D-=20
2.39.5

