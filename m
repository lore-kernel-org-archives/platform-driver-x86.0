Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE56D3A4520
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 Oct 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058923; cv=none; b=gzWRytYkCyvkVJZ2Lh6Cj5t7ivFYgtMVDr59VKfrT3AYN+mswABAZ49KaXhfsYlNc2mp03vI+M99KLtERqHIAa3DGrDufntWK8M5XAmVDpq1W3H/+3HMx+QZERhmKim097RZDMcGBGAyzTmY6cpqkP34BEoclKKwxw8MLo67VeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058923; c=relaxed/simple;
	bh=vHlNApf1n0eU2OktVinpI4zv/MZunnjQ95s6jli1xzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/gHjWn/WEqWhI+QoguTDZJ1jlBwbzc91R1BPXcKhQcyqVz7QvJ8WdlRcLZyjntjFVEjbqy/iZamTK6mmsZ5Hi9zy7eiFuJP6bHGg6rvfNKbRp/jsLjSsQOpqB4QWat/qyQbAg1TKnMLbF5x7ls7kjK8vkJenS2zyL42sjpxsO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E9CpxOpQ; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E9CpxOpQ"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-4a11603310fso7263565e9.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 03 Oct 2026 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058919; x=1791663719; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=E9CpxOpQvqdDyv5L3mchbAdOH00kUUYB8lcQJjG10gcp6tkpDTJacm0DgQWTRhLV0T
         tAwTjRZwqcREb4depS7jx7wRB8pupFAd5/eWZlx+d1KO2N1OzFJk7d07pG36kIMRg3cw
         MWFmEjYqSCc343DZ+IlEeGeifBDF7hKrk+hKO01txOXbMwydszp98Fcm052sbI6I4WXd
         5UPZpXJRrm3S+XbzfdIGMSBuneyVb+5VXYi3rF+RBqdaRkJoVyEGifmF2Z67N/hq0UbE
         33V4fUhOJlJAcxcL6qVPi9UUPtZECO/DS03hKW0gfQQrtCzcNfiHnOGjqJNLq5Hy6t5x
         KvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058919; x=1791663719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jdTRy1oUzdTMPfJnHsa0F48c4vY6O6GHObHAbcTX0Q8=;
        b=gHeZ9ZIS92+TJLsPnZZzr1BUmz/AELZ4/efIJ/xFKTFLL7CH2b0rVh8B3s7RUrh7tr
         Z6MrS+c5b/ZrpasS2+HBjvjaz3Uok0NsFbTIWsgY8xC9oIKEBYAaFGqfie/BLS3eT7II
         pign9lp5Z/uxoIRo40uSf+Q2j4rbXozOS/kjTO/LDXW1i4DoFlsIDUDhrRLhjLpQVTvY
         CE5sG2S2cC/g3RsNUfZiIs1dM+f3h7w5Ph0556wKJODy3KZNeJzfNGNHty9pAuQwdK7z
         ffzdEx0cT8gCoSeMF6BB9BNAc6Tx+1IXmy94DjuGUcshYFfA689upWdv3GmbxjF/t/8R
         c58w==
X-Forwarded-Encrypted: i=1; AKwUvBxPjw+0/y1C6CkPnmMti3Ixfnp9AtKN7v8VFqt8vOeoIIHxEdYZgefq7n/rpeBlFj2QcCmg+aFNm5XKUD98CvsyNM4Y@vger.kernel.org
X-Gm-Message-State: AFuF++npr/ZmwOsuJSL1HcKlTpNIUYYdfd/gptBPDdkk48FT5cjnar2c
	vHYwuXAvqKy15tmi2YMWQlrJbT6G7RH+JCikCPHH0q22UKEOvzGzGbAo
X-Gm-Gg: AYBFou0HIvE59IeME7KcVdfVuZOOKuvh7n0LmjLbyJKJevjWNuQCm8q0MLfoy505CEg
	Z4NluSgnPg6GtpeUkgFgHejyB1CVfxipvU82SY05rrIFbROfwfYBSu802NaBkw+O4/zHYsCmb/H
	4gy/VFTDWrDRLsVwgNRizOAJdP+jez03WruQ2Y8Z7K5IkvSgFb1QJdJlhOCSEKsr8Wi3dTiT5fD
	+almTdV4uLEHFuYX7L910XhKQ+mtH2lzelI6BHA2ERSVS9mhgcTc47Hz9X/mkkS5O1kJXoJrdgS
	syqvAVQ/KRp8fwfGkXoOZiSq2ZjgocuBt7pCaiau2dqsLCBY50Ke1+VVYb+0n4d81p1qStAox5f
	BSTI0K2baM0Aq7hLGqwOagCBXwUjLimbZOqOj1i65v8MiAj9XvqXUtwQN5+B4tWyi5JzG7M2ZMe
	I6gaYJaS64TLtPZsDjzw75pRTnDNj6MmvA+xSqBrBZ/rh/zFusJHG2onPG6mQf2m4p29QyRRsVO
	zRIfw==
X-Received: by 2002:a05:600c:608d:b0:49f:e8bf:8f9b with SMTP id 5b1f17b1804b1-4a02750fa51mr115371465e9.4.1791058918814;
        Sat, 03 Oct 2026 13:21:58 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:58 -0700 (PDT)
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
	linux-hwmon@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: add the embedded controller
Date: Sat,  3 Oct 2026 22:21:43 +0200
Message-ID: <20261003202143.4697-4-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003202143.4697-1-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the Compal embedded controller on I2C at address 0x70. It
provides the board thermistors and the CPU fan speed, and drives the
keyboard backlight. Its interrupt line is TLMM gpio66, falling edge, for
which the file already carries a pin state.

That state leaves the pin without a bias. gpio66 has no external pull
and floats when the EC is not driving it, which shows up as a steady
stream of spurious edges; the vendor ACPI tables describe the same pin
as GpioInt(Edge, ActiveLow, Exclusive, PullUp). Enable the pull-up.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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
-- 
2.55.0

