Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7954A4AAC63
	for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 14:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790002210; cv=none; b=NZoGewypRgNt4NNPdoUyOOPgxH8A/hE3XsewD/9O8bRImgRo9Er7YWJd5zPD9qa9r2l2tbAS4i+lvX97FmDRa9ScQ/JZk/JXiurP3gmSgbR/L2RruZfezsze2xdyMgVM2fL7jYQDl2DWSD0irKJG8X5Ad7wsxZAcg7fNqUH7dqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790002210; c=relaxed/simple;
	bh=gQp5P6A4HKZPmr2RXt5nnsqu1turFNqjNRfQGzceh+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9xwUdekDyCIbE47QfCJ7BbGGPSGXbcm0YXtDdUMHoHTozl55iFbi2uFoW1fmao0Fb4WZPXaarWtgUbf/eLmm7K6WI8B7AGFTRTtkamPV3HWLBAzSt+ayRty9te7Jay/ZZV/Id7y5jydhzQvMRLb+DVrHKvlvas16SM1xoxRpIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1l6QMZl; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1l6QMZl"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso43706885e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Sep 2026 07:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790002206; x=1790607006; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=M1l6QMZlJJ5OBCcXf03tRRdMPH1cHn9uWdZSCVQnYfrqzEOgMctZqG7bT9gpR3rnh/
         jWKVXR+egPc4mmsrnoDVGIEbdW62poaSZAijxmgZqqtNeKwsIZC70UcO9vJraAonk3up
         3SRQbPINez22DWc+3ooNL9bZvUpr7kchGr595QhalcUa8uuCCuTETJXypbksWa+2rY0j
         t5QIooTPHYEgAYxseUhv4+Nzs6T4eJ5rzizXJ8tniK6odNhzqTNjead5ZaGFoG4B+Y4w
         Dr+PC0kbnn4OT0NXTConNFNP5foW3E3Z1meDHyToimIFzejow5CItn6zqNzTTzEN6rzw
         8yHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790002206; x=1790607006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eycLZYI0OnWON4y4DQc42djuKTXBLKJTdaLEQ0NYzI=;
        b=tWmJrg51yaNAIS3PGiBiejKgQJ0GaRb3y75OL7BmPR1uplrvnyixwiTii+S9gAy7Hz
         OrGy7izjKvf1VvD8tOFLwNlxGH/LEa3E0mSYcIyPhcjm4pmgAgsWBPMwrADY+ZJHD73T
         G7xVtPkGgTblwg77X8gNXKf+XfJX4k5BC0nTZjQ+P/e++PQBPtrpv2319SqVRK7zgdaZ
         UhJptyVRDW/tSz2ePnlvRxVztXry9UWWKkTAkI6eX3MmjquO0pRTdsuLRB8J5meHOy9k
         c5W+XYjklm4ar7iN75z/okvLPBjAwkbLUQmhl4Ahr06CB9lO/aBbEws03Za82ZgTHAsx
         ZatA==
X-Forwarded-Encrypted: i=1; AKwUvBzYbWIjSs/wnGF1YjQJl2kqpEk8aPFrQ607rM5fMSXPpVM7NPzID8g+xDijKdwbkmEsaXSCa/qluboxcR0znvAmXiN9@vger.kernel.org
X-Gm-Message-State: AFuF++kTWXrjUYdUC8CgKIeDGw1hjiilIHc2hi80JSrTQ0cwB/JxfsKQ
	4buQExi0W78JW7MqEVnAflrZj3Fz37DRTYSEJRQPUNCdSSfqgAcHgFyD
X-Gm-Gg: AYBFou0XYGlBY/6cvCmLt39F0lWeeXj1r1BGYa+776+fx/c3idpF76HqjcLz3RKK3fk
	wj1YsSSyRR6YXGL3vC3QXRq+uZnUB8KhGW36fnttbzyTGZoWUX3ShdPWjlgedJTblpAllo4W768
	41jQ56JnULCfx1PdTSk41FUyLBzWOhd1CvdqG/YioGCY9KmQAnubfznJBkFmAN8o5rXmj3fbzGA
	sNgaegaNOwXQ9luVoFvT8TMCXKRgn9xQgrO35CnpL8p+2Ltef1euRzKl8ARmdKN/1xVqO2U8uRk
	c/jUgjI1HtqsbRkdhmTlc5Fh6DDxpoE6gF2pHr3c0M5i3m1raP9Tr3KkIjyVIIsI0mx2+jRRcDI
	H26Zey8/ZcDUHUjNwaMwaRR3UCcc8WAHCWnNq0VQ3zRupohSC93C8xWGgnWcrwwWFbGDoIo3zVa
	T3cHSXXUvS9CSfnpBm22U1Pz6K29kE7FROcpEAsKNYOq104eNn+KGOULNJryJaCeXVPBPaJ/T4m
	WzuXhkJxb0=
X-Received: by 2002:a05:600c:3e19:b0:49f:bd3c:bc1a with SMTP id 5b1f17b1804b1-49fc572f27fmr153111575e9.21.1790002205475;
        Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
Received: from localhost.localdomain ([194.154.195.114])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fcd8bc15esm191595725e9.1.2026.09.21.07.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 07:50:05 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Mon, 21 Sep 2026 16:49:53 +0200
Message-ID: <20260921144953.15113-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921144953.15113-1-okerixx@gmail.com>
References: <20260921144953.15113-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors, the battery cell voltages and the CPU fan
speed, and drives the keyboard backlight. Its interrupt line is TLMM
gpio66, falling edge, for which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 .../boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts      | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..bc840fd8e458 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -659,7 +659,15 @@ &i2c9 {
 
 	status = "okay";
 
-	/* EC @ 0x70, irq = TLMM 66 */
+	embedded-controller@70 {
+		compatible = "lenovo,yoga-slim7x-gen11-ec";
+		reg = <0x70>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &lpass_vamacro {
@@ -990,7 +998,7 @@ reset-n-pins {
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";
-		bias-disable;
+		bias-pull-up;
 	};
 
 	kybd_default: kybd-default-state {
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
-- 
2.55.0

