Received: from mail-244118.protonmail.ch (mail-244118.protonmail.ch [109.224.244.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190384EE877;
	Fri,  2 Oct 2026 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955815; cv=none; b=syEwGdALnNsEH3SED9a+qMjxmDq5+kWhjXpyqG+XXg3oSchidqukdWNSKWYrQVWnJYnVXgmfUKnJ9awVq+QA1RxhYfOcGiRzN4BxMwBcslfOFkVG8QS9g+dPx9mJVhJ5pzP69MXyHVpGQyfMfHrQu4PCzXcDwKrAkiiAzyRI79o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955815; c=relaxed/simple;
	bh=UZHazEcVXVJS7l6C2Rm3n3+jkb4pWcZQZp3cmWOcWrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ieTlvUTGGAg9oDA8URJcz32/uJArk2CK6Yb3WKf97+SqS1P22bcGZFsYhBz5ns9udMlEEEyQl71QQVMXKoSAgEc0zPXX6PqK73ge3uUm4pOHduukGd7Izef1RyRpIlNR4BthScWS+9gw024vrPlFFolbqVsKPNONOOLTC0uXzIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=rDeblY1g; arc=none smtp.client-ip=109.224.244.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="rDeblY1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790955800; x=1791215000;
	bh=UZHazEcVXVJS7l6C2Rm3n3+jkb4pWcZQZp3cmWOcWrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=rDeblY1gXvA8ozc0JzjCBCH1SKhDZ2ty5TNK5v2cQKLjW+ZpgPswRP9tYvgLccGz4
	 4EsSLGzoZjrInsfd+JDVIf0qsfWLtCBelzn9MrYjh8+xpRQxg90ryR+zcJu+2dw+EX
	 j1F+DlXP/gaKgQgmrr+G6to2Y+ayjSk081M1ezKCMuqA+RfEhJPb+pWgLLiPAtxCxb
	 FPq/fW8EHvMQ7lAEHI0L3tJIM7q6mvI0BOR84oW8nX+OmGM2uecINt5GIPPPMK5hEJ
	 4x9dMn7zmE/PdUW9JPWMKoh+kKeRcohJM6h6ogeSEoVkH50hDk1SETG0cSjT7gFtTK
	 3bPI/0SsH6EWw==
Date: Fri, 02 Oct 2026 15:43:17 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
Message-ID: <20261002154231.31376-4-alex@ironrobin.net>
In-Reply-To: <20261002154231.31376-1-alex@ironrobin.net>
References: <20261002154231.31376-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 002dbe524b745558d53926afcee191bbab8376a6
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

