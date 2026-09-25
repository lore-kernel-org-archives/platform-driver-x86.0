Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59912480DCF;
	Fri, 25 Sep 2026 21:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373319; cv=none; b=tNDY9Qs77GnWeyPBtiW1DfncN1f9KwoAphFfnXq613k4Zg1pE7n6YyARsVkCxGrcvsNopbrLaTFj13POuPHGK+yfb5y7ebRY5IEDi/m7e8+EaFj3ZlLMMJB1COsWSMNCN7i5bVIfz1gj4P3DzmVcOunkv5AC3LUKFw3vGJcPqxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373319; c=relaxed/simple;
	bh=Z1Lz6VjC1nfLX9tXpB5qWzouczKMgmXaaDgJwAcCH/8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RCAgfy8KyHJWyHWdipDvXh3tOXyVf9xVFc2EL+mDuwo0j6mQf/056QDIsY+QhlFHFEXpawceM6psxgcSDQB+3hgGNgpiMjZP15vsZuD6+dKxt0zyDC6RJH7+EWC6j/Sm4+A7YxKt8cAE/Ydj7qF0SUUpfGWLG0IsGgAbnPAfRs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=J0e7aHpn; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="J0e7aHpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790373305; x=1790632505;
	bh=Z1Lz6VjC1nfLX9tXpB5qWzouczKMgmXaaDgJwAcCH/8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J0e7aHpnhMvTla5ZsVkYceEaavqRnFjq8OBYD+79M7qxGUF4bQlQpMbjx/xSsM7zb
	 7kqvZ/lcQKt49IJ9XJwbAhcVtkGYVGgL5UtD+Y6t2K0XhQMrISzoPCe2CCZIv948Nh
	 jkEisp2AJHYJc7GXiKZv24Ny/843aamMyOpmdL/ph4+IwfqP1tQ4AxUwvEaijUJXNX
	 FzUKqfgJYJ0HkZwbDpHrugJ5CozFZ+0+pI+WgXlF16ZUqkD5mRmc6PrWyn/Oej+jhu
	 3wIdcgAhqsvmMkfpJxcUqOfTaqAWVsdX8pZMqPhueMnKnG6aLw7iyDHDbjbQke+MtS
	 C7+RWHQpo7zTQ==
Date: Fri, 25 Sep 2026 21:55:02 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Clover <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
Message-ID: <20260925215358.33417-4-alex@ironrobin.net>
In-Reply-To: <20260925215358.33417-1-alex@ironrobin.net>
References: <20260925215358.33417-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: acb58e6e5e5453966f081b866d275785b5b308a2
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

Configure GPIO103 as an input without overriding its existing pull
configuration. Describe GPIO176 as the separate active-high power-state
output and configure it initially high with bias disabled.

Assisted-by: LLM
Signed-off-by: Clover <alex@ironrobin.net>

---
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/a=
rch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 218573a97785b04528854b03a99c837558a33c1e..e0eb415ef9b42efb28fc9d5a101=
0162f057aa558 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -885,6 +885,21 @@ vreg_l7q: ldo7 {
 =09};
 };
=20
+&i2c8 {
+=09clock-frequency =3D <400000>;
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
 &i2c21 {
 =09clock-frequency =3D <400000>;
=20
@@ -1540,6 +1555,21 @@ hastings_reg_en: hastings-reg-en-state {
 &tlmm {
 =09gpio-reserved-ranges =3D <70 2>, <74 6>, <125 2>, <128 2>, <154 4>;
=20
+=09ec_power_state: ec-power-state {
+=09=09pins =3D "gpio176";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09=09output-high;
+=09};
+
+=09ec_int_n: ec-int-n-state {
+=09=09pins =3D "gpio103";
+=09=09function =3D "gpio";
+=09=09input-enable;
+=09=09/* Preserve firmware pull configuration; no bias override. */
+=09};
+
 =09bt_default: bt-default-state {
 =09=09hstp-bt-en-pins {
 =09=09=09pins =3D "gpio133";

