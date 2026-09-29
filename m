Received: from mail-4317.protonmail.ch (mail-4317.protonmail.ch [185.70.43.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451C9569F03;
	Tue, 29 Sep 2026 19:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710207; cv=none; b=McIHorIvSQbdH+RLEeZAjue1gnk2g+YQ9Ro/DttcAvfyY7CEQxy64OymJf8jVEA/USRzYWCHoHv1ft06K9AZt+cLzXZZ2SuLVlYG09E6q1HY9U1z0jKq2hWrbCXbjK3gFITVdLXtlUzEUOuHfmTxaga8EtreK0wMhHodXRL7PUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710207; c=relaxed/simple;
	bh=UZHazEcVXVJS7l6C2Rm3n3+jkb4pWcZQZp3cmWOcWrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NculPldMxzssv5CcnIVtCHhpgAwizj8MTN1bJmLXEidMrB45P75M6ZXXrVmyeMGL/lDra90PWya4qsVThkDBoZWliQoFGRCEE3Ri1bbblG+/PJkYnwjrN8nYAr5OpIFvwJ8M338LDRANap5OpAArw0EaTe1ifsh8TuVbZ8XHpd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net; spf=pass smtp.mailfrom=ironrobin.net; dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b=qvnHIg0P; arc=none smtp.client-ip=185.70.43.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ironrobin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ironrobin.net header.i=@ironrobin.net header.b="qvnHIg0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ironrobin.net;
	s=protonmail3; t=1790710195; x=1790969395;
	bh=UZHazEcVXVJS7l6C2Rm3n3+jkb4pWcZQZp3cmWOcWrU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qvnHIg0Pcxwg5hw3Km0vLT5wxj/oEz19mM2HZWCZCu7IFk07XDbabmPxGEne+TnyG
	 q+60SNCBkBoK8FmOVD7cf0xmIQODfgdzbD6S8fuJnxlJy6Y44rJwEUZ8TgS7aTr82o
	 /kWNOAkT97lJXYBDgevLsKNMBIUT7VmWabpZ9YnJqnrlBYHi7EQLisJe+yg1tH2kpR
	 33qE5lxJN4fs8Fp7/fNS2SdNepXINWRaFRjyEKhPWdKCoVWK5gyvLfkszAMV4OmhED
	 LhHaAgGi4A/nh2YXuChSgWU+T7QTngeKJ/570CSK4ndNpDjfvTh7j9ID+uFmuiLcK7
	 w0nKZcd92vv0Q==
Date: Tue, 29 Sep 2026 19:29:50 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Alex Robinson <alex@ironrobin.net>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, Steev Klimaszewski <threeway@gmail.com>, platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] arm64: dts: qcom: sc8280xp-x13s: Add embedded controller
Message-ID: <20260929192908.16507-4-alex@ironrobin.net>
In-Reply-To: <20260929192908.16507-1-alex@ironrobin.net>
References: <20260929192908.16507-1-alex@ironrobin.net>
Feedback-ID: 54785507:user:proton
X-Pm-Message-ID: 28a40f096bffcfa3e46b21560eee73fc5561a9e9
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

