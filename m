Received: from mail-106100.protonmail.ch (mail-106100.protonmail.ch [79.135.106.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8613A6B6C
	for <platform-driver-x86@vger.kernel.org>; Sat, 10 Oct 2026 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791644165; cv=none; b=UMLxjmXRuCWfvpW+7il4jH3J9AZDxotIkd7SdA8+WLPJmMxhYsSPFufynYyCXJoDe+/ORrwVwNNFFCOo9zOHeUv7bgFkbteA3SM7KezfRta4Rn0QDOqi+QF45f+0sp2iwTpm/6oJKXrLkVxOxMgidNF23cqAmcfYVzfYtFXbAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791644165; c=relaxed/simple;
	bh=UZHazEcVXVJS7l6C2Rm3n3+jkb4pWcZQZp3cmWOcWrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6r/pjJ8rFVgJS33FaGkv1Kenz2525krsrLF6/G+2k02Mb7kRNJr0ibFJvM/FFrRc1/IEkk+WMVXNr1PgZ45i9qAYi3wlZxRThpRl/oR4TIfndh+0zZHngH/On2rr9txjjDMn4NlOnFtdULW0XRvGFt/xiH2dtEiE8q/fYuan8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=c0iuTc5e; arc=none smtp.client-ip=79.135.106.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="c0iuTc5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1791644161; x=1791903361;
	bh=UZHazEcVXVJS7l6C2Rm3n3+jkb4pWcZQZp3cmWOcWrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=c0iuTc5ewn9uY+y0sY+ZV2dGjRKWuLmU6a7p1wfaFOkOmcDhB8cEu6CEyek31+oz3
	 sddQiP/UG7WLpoPI+SGiIy2n5o/8ThQKqczIIUorz9JMeqze7/ICZunnXjzeuXHGw5
	 mqmTdsgutzilXtIMFL0kNlqCVnzim5bqM12xdCGDuRmzi0iTkPVsn0yWkxeyP52XeH
	 WfrlbWWZR/uvrYTSxs5LPPfjkHibuLvppjRyOmdQ+V3C744ck71aD4umT4ckXb0K7R
	 lIm8NDpTIh/Z+/WuDWgU+wbZmi7DZ/Tt1ZTSxNNKrBBD8I/JSNjPGtj29+xXcQzuj2
	 QEQBtxG1G9Mng==
Date: Sat, 10 Oct 2026 14:55:56 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
Message-ID: <20261010145519.8370-4-alex@ironrobin.net>
In-Reply-To: <20261010145519.8370-1-alex@ironrobin.net>
References: <20261010145519.8370-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: aee2f9e55f1b8e7c2f17e108e793ea24ea09a38d
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable the ThinkPad X13s embedded controller so its driver can provide
keyboard backlight support when booting with Device Tree.

Use a pull-up on the EC interrupt line to match the firmware-inherited
configuration measured before Linux configured the pin.

Assisted-by: LLM
Signed-off-by: Alex Robinson <alex@ironrobin.net>

---
Review note: GPIO103 was measured at pinctrl probe before Linux
claimed/configured the pin. TLMM CTL offset 0x67000 read 0x00000003;
the pull field value of 3 decodes to pull-up on SC8280XP.

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/a=
rch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 218573a97785b04528854b03a99c837558a33c1e..1e29bab37de6d192ec49dc407e2=
4e1a3bc9496bd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -806,6 +806,25 @@ &i2c4 {
 =09};
 };
=20
+&i2c8 {
+=09clock-frequency =3D <400000>;
+
+=09pinctrl-0 =3D <&i2c8_default>;
+=09pinctrl-names =3D "default";
+
+=09status =3D "okay";
+
+=09embedded-controller@28 {
+=09=09compatible =3D "lenovo,thinkpad-x13s-ec";
+=09=09reg =3D <0x28>;
+=09=09interrupts-extended =3D <&tlmm 103 IRQ_TYPE_EDGE_FALLING>;
+=09=09power-state-gpios =3D <&tlmm 176 GPIO_ACTIVE_HIGH>;
+=09=09pinctrl-0 =3D <&ec_int_n>, <&ec_power_state>;
+=09=09pinctrl-names =3D "default";
+=09=09wakeup-source;
+=09};
+};
+
 &i2c11 {
 =09clock-frequency =3D <400000>;
=20
@@ -1571,6 +1590,20 @@ cam_rgb_default: cam-rgb-default-state {
 =09=09};
 =09};
=20
+=09ec_int_n: ec-int-n-state {
+=09=09pins =3D "gpio103";
+=09=09function =3D "gpio";
+=09=09input-enable;
+=09=09bias-pull-up;
+=09};
+
+=09ec_power_state: ec-power-state {
+=09=09pins =3D "gpio176";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
 =09edp_reg_en: edp-reg-en-state {
 =09=09pins =3D "gpio25";
 =09=09function =3D "gpio";
@@ -1591,6 +1624,13 @@ i2c4_default: i2c4-default-state {
 =09=09bias-disable;
 =09};
=20
+=09i2c8_default: i2c8-default-state {
+=09=09pins =3D "gpio43", "gpio44";
+=09=09function =3D "qup8";
+=09=09drive-strength =3D <2>;
+=09=09bias-pull-up;
+=09};
+
 =09i2c11_default: i2c11-default-state {
 =09=09pins =3D "gpio18", "gpio19";
 =09=09function =3D "qup11";

