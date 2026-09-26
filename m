Received: from mail-05.mail-europe.com (mail-05.mail-europe.com [85.9.206.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2939EF0B
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Sep 2026 19:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.206.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452511; cv=none; b=Cq09TtJSop9P+6XL5yD2FnTBWaq/LWXSHN4ToIf8CCw1TYhujIpYgbMO545H9XiSr5lrMr5uzRij0ON2cw+wmnnCOLPKrnmrp4jD6i8qdlPXC7hxVZ8r94oHmtvbgKFVi1FbPjJ5hl77gkvcUBmOgLH1G8lyyGr9e6JrDQmw4LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452511; c=relaxed/simple;
	bh=zMBdzxqLEEqeeDLck7SD5iTs89vD4211AK1HsDvvX5o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyAGAc72eKGWG1OdKbJB9cw8OW6ru6ETS3bHCNGCWneJGMb3apJtW2o/G8gg1YFSusnA3t3xG5F7HJQcNgqLK67BpIkyDaq1+9pX/HAVfuivCDhXuj9jiBU8yF0HwJfkSqlxzMOg/ztyMny+IzPTuvXD3+lq7CmZBZsTj3W4Mxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=YFpr1bc3; arc=none smtp.client-ip=85.9.206.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="YFpr1bc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790452499; x=1790711699;
	bh=zMBdzxqLEEqeeDLck7SD5iTs89vD4211AK1HsDvvX5o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YFpr1bc3q4YUL1IJ+IPt2ALZ9U58oiAQaGa6z88epHWJPxRaj7eHWClTU1a5DcdzG
	 SvcnLzcYeekffQQhJ/to24iZDsc0cdrwJGjFvR39Rtd+HUgxp0uA9PL8lly6loO9UJ
	 OSVWhvU7G2p2vSovbbmdv1d9m7acTUoxyRaeoSlZ/3NSQ12sGkDZSgzq4Mk8SRURfK
	 s6CtzzfoDeyC20DEhyQH8yB85O+Qli5qlOPTOqlUgc3NM7B/mZmBOYHxAEm4rlmm4s
	 AZ3nQSJBQAeyCpkcuHTKx3wlOmMwEGWEQMc3lTxzgI2BBEwRpH5ho8Ob3X3aSN7AuS
	 lfOxtdKeJ2RZg==
Date: Sat, 26 Sep 2026 19:54:56 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
Message-ID: <20260926195415.5995-4-alex@ironrobin.net>
In-Reply-To: <20260926195415.5995-1-alex@ironrobin.net>
References: <20260926195415.5995-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 564dd1b5405d90cf35a5037f134a9b374380bed7
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable the embedded controller at address 0x28 on i2c8, with GPIO103 as
its falling-edge event interrupt and wake source.

Configure the QUP8 bus on GPIO43 and GPIO44 with 2 mA drive strength and
pull-ups, matching the working firmware-established pin configuration.

Configure GPIO103 as an input without overriding its existing pull
configuration. Describe GPIO176 as the separate active-high power-state
output and configure it initially high with bias disabled.

Assisted-by: LLM
Signed-off-by: Clover <alex@ironrobin.net>

---
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/a=
rch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 218573a97785b04528854b03a99c837558a33c1e..1b875809773dac3bb0d1dafb1c9=
bb41a88f5027f 100644
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
@@ -1571,6 +1590,21 @@ cam_rgb_default: cam-rgb-default-state {
 =09=09};
 =09};
=20
+=09ec_int_n: ec-int-n-state {
+=09=09pins =3D "gpio103";
+=09=09function =3D "gpio";
+=09=09input-enable;
+=09=09/* Preserve firmware pull configuration; no bias override. */
+=09};
+
+=09ec_power_state: ec-power-state {
+=09=09pins =3D "gpio176";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09=09output-high;
+=09};
+
 =09edp_reg_en: edp-reg-en-state {
 =09=09pins =3D "gpio25";
 =09=09function =3D "gpio";
@@ -1591,6 +1625,13 @@ i2c4_default: i2c4-default-state {
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

