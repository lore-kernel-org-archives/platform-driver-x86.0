Received: from mail-06.mail-europe.com (mail-06.mail-europe.com [85.9.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965274963AC
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 22:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.9.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634127; cv=none; b=RXMTqA+XB2GBNV5hh/6nRVAW47b2Pu8F+kJi9P1Z4yE0LF1Z41l8Cx2zPYgxBybYOaFN+C1t3BG4j//MG7KdkYiL4pHmY2NomHDfRBnPkyO0UbL733g7Y/nHzfyW0C13wguyqtvwQaiQQ+dmU7iWT+XKKVYVRcTLL+qrGuXvJUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634127; c=relaxed/simple;
	bh=jxQIGlRzWMJco9Sa5nbklR5miaAbJIOj6iG1hQgIqVc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Aj8h5yeDPdiaXRGWGTv11JCQo1FY2Y3+FooMSOopkAy05W+80dvPQEhX5jkFIJ9+zAbLEF+bYY9sMsA9Bt8xmFA6rGeoB1n44ncbc1Uwb7KrfpQSeUEsWjJeUHug7YvC8q6+7JNnCBQ7YLDhivbfGxOWBgQPKfwQM4iTn4PURDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=GjQc2X7X; arc=none smtp.client-ip=85.9.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="GjQc2X7X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790634109; x=1790893309;
	bh=jxQIGlRzWMJco9Sa5nbklR5miaAbJIOj6iG1hQgIqVc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=GjQc2X7XDRNt6mc8CK23AJGIrkKO28lrizLG4vrU7VNY0t896dvuTwncP2rq+PcjX
	 5qUlliZ/pdr4J7tAk8le+zcf0jeRxl9UjSxo6bghGHpoVxjgfNXBKyv4aLwsLuAZ9P
	 JnQAxWzKtVpG/65KcG7XW9UkxSmeYeB/QMS+1o90JTdBDn/OmmIgQLrB47ozKbENyc
	 +eQU66IswsgFHqvbe1Eulx2gOpMA+gpKucp/fFrKjd7JAUl7D48tpN1L06MbHyrQmS
	 9X3YsaKrRzjyyWytil659xjpalTzaJu6jZvE0L9/xcXBMWdDPhs3E7vcTQkD/RKo8C
	 OyZgzPzfV8Ylg==
Date: Mon, 28 Sep 2026 22:21:44 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
Message-ID: <20260928222056.10044-4-alex@ironrobin.net>
In-Reply-To: <20260928222056.10044-1-alex@ironrobin.net>
References: <20260928222056.10044-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: cc2cebba6810aaec06c88d856e98d7c1d25c2528
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Enable the embedded controller at address 0x28 on i2c8, with GPIO103 as
its falling-edge, wake-capable event interrupt.

Configure the QUP8 bus on GPIO43 and GPIO44 with 2 mA drive strength and
pull-ups, matching the working firmware-established pin configuration.

Configure GPIO103 as an input without overriding its existing pull
configuration. Describe GPIO176 as the separate active-high power-state
output and configure it initially high with bias disabled.

Assisted-by: LLM
Signed-off-by: Alex Robinson <alex@ironrobin.net>

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

