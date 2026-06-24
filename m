Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352193E5A07
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335332; cv=none; b=KrIR43Tsp9RMcH7VnLjouPQTdLH+7oilTU5uPYZARpKo1v70x8RjRBLf/jNJ73+9q7SRPAEigRnOHTbQ7CZ//nVqL22+QOxt3kWv7+Q5qyisKZLjpVBgnKM5AcYipRebODTvfS9TWhYLJ7D2yGC85ArneplkiCVTabnZhKHRwqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335332; c=relaxed/simple;
	bh=WLYdUaTWVpBtZwNr3HlNaZyWKT1SmuJRkQxVpfGW8Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KB9XPkNR7ngBArcjZHd7roOlLfXHWR4gMgNBkAgTxW3COLaIK1cKuvokh2r6LjCu8jMP+z71CZXCSkk2oqovDbbls/ehipLZEcFz+el54IHh6RWkkVYhJtBwizAfJfV0KE1Et/ketkAC/z9F5k8M3wFBU4WJcokxWKv3yFwKiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JVursoEo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4LlfEho; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JVursoEo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4LlfEho"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65OJjHgU097274
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/4mZazLNplc
	RI7UA2lzg985hqmjiwniHBuU0w4DnhHw=; b=JVursoEorsmNtXPLcrRyPc320K6
	YuCsFBeCRo5KNYdCnDR/YCHW8JIj9IOQV8ABEkfyHoPYJTN/2mc5yovMBAKQ4twC
	C/t3s0MVIVaum3yytrsaxYXdxdvJLroIe5h8j8Ie5oaR7Oyv6W0tcGBmsPbxPqsS
	bh8Il40tqvDFD6WLWGxpwtc8NZO+EI+EVs3PDfDda9fQd5DsPW93P46Nuygob5ce
	gDFHazQQv8taF2VIkYfXXbYeRMeIrudFxGA7ykzSbWn8CBscWNHXfb5sy33umXLT
	uqk52F5V3CWS568yEbEwhc9R2C7Vx0cHCR2ZV1GgTW6R7WNcCcMpI0Eebhg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f05ar48cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 21:08:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-91931144870so275082185a.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Jun 2026 14:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782335328; x=1782940128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=P4LlfEhoWqRZFS/UTJqrZnR7yd09R/6WchfUxV7PCiBHOBLNRPlXWaOohjkfYMqYcd
         gET+7h7Z+wX8NUli+w+fKFJH4pmCVGcJBX/lfZAqSX0Xn3mtKAQ/w69nNaUzQ2JDDjua
         dHs+P/xgAwnjWrIf2xL/uaDbnBTDq5Mfki46zIdgXSTZO8XbUZeusszW6Ms3+mEDC+JS
         Hyc3Qf+kOFQ6+M2gvJxOVtPLXDm4HmoJIWOqK2i7NmXV4Eo9DCZ9uxMN4AezTWcsaGnD
         oTIcYzqcODbL5i1cgBXAJN59Uin1JXSfL9lBimpVaAPg3ELn1E7ZNn44eVTknmkVXijC
         zUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782335328; x=1782940128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4mZazLNplcRI7UA2lzg985hqmjiwniHBuU0w4DnhHw=;
        b=UVKGobHngsGQc7PnKFOKMJFs3QHu1u5t7Biw9Fmwoo2THtCOuNWLys72lS7IVoBxpU
         PUSVJN9yOFZFquZ9IUx9CZFXdsKckUXaRxsw1mba+k6oQYCEKRxRXrU3G+MxAOwTi7nR
         mcpe7NF8qJO23uUU2Db/5g/kpGnQJcGM3gE+7ngJl3blTtG1TjRVI6QpRXxKSpioMd78
         WrnD8o/gMg9bgmPiP/cQASqGIBRZLauPALELTwazhSMGoj6NIhwJDC75EN/UZctae5ED
         CeiPTmFmpESDAvKsBIUWaW8ll2+1Vhz31/AfHJuTCnu8PBZpBdMMNtvFr/JqoJVorkqI
         zVLw==
X-Forwarded-Encrypted: i=1; AFNElJ/YvlAJSeA08E5THW4efONYFgddebOWzTDQ8QMDOx7RYnzsF81ewyMonBB11Z6w2SAtNw7546jQb3+mE8F0012YWc46@vger.kernel.org
X-Gm-Message-State: AOJu0YyDyuI5DTGqtYY1A0L0GU8aNGcIA/ZqFta0/JC6ICkcvSW/hPdD
	nZd/EIrOicr2shgt2BLG7TsNDkYbOEO0flZ9f2R8APP9TqLfxQn6k5AccAPfdqr63GQ3JQkSLnY
	8Vmq5P6G/5YEEXUjyLmydofWkSbXhjYj8V3vT46Dqrh/dQ9s2Mn3HurYGYd2C51+PkFDY9HnoKr
	Nd7psUM08K
X-Gm-Gg: AfdE7ck1Rj2h4WWMchebo7UQHucuA47zADvp6aMOvij1wBe484ehR4ync7E64HvAbKt
	PJnZ4zLubrALQcIYvodEtfda3hrAJZQfKSqD9siDf1nQQsgIlQJZEfJqL1cOEuyvNABWdb3yPoT
	ecEYy9cs/kXsS+LekHiaATY2q03kyJ0LivUb+eXex7Rl3kRQBqcK/UW26Z/0GyRzUfMP+GR8BkU
	MoIYglOhRk2b0RyR4zIlSY54qAdLg7DWXySJnPfHmcsF5dUGPK7IuN8BDUKCztPfy62s6ptN+yR
	fAQ5BYGq8YF7uW01X0ko37hDLrOQfCASDkf87CCGfufAYrBgwwvFtuvRyoJWTp4KvH9h0b6CRas
	i+q/QbyVkipiHpvOsSkQrBcC4NVM+PDlb10eUO99jZmxJhQ==
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431681885a.19.1782335328449;
        Wed, 24 Jun 2026 14:08:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4808:b0:915:aad5:e961 with SMTP id af79cd13be357-92644cf4c21mr1431676085a.19.1782335327986;
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:91ef:5c1f:e854:38f1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c1e840efdsm9455767f8f.5.2026.06.24.14.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 14:08:47 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v1 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Wed, 24 Jun 2026 23:08:25 +0200
Message-ID: <20260624210825.264454-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
References: <20260624210825.264454-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ssgw3QzD7R9m2bm8L38GiVA1fFoKMMoO
X-Authority-Analysis: v=2.4 cv=EuLiaycA c=1 sm=1 tr=0 ts=6a3c4761 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=MYPoBHUstc7QsOuohHEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfX0ihXhdfg8yVm
 bba/+J4mrBRVH7geLRA13HG0L53B01+4oh9Tf4URpUziCVen83Jg/+xFafNZQ3ro7vTuZwEc4jE
 pHoxyx1/C7UIIhmiWAC//Rwn0jAokg8=
X-Proofpoint-GUID: ssgw3QzD7R9m2bm8L38GiVA1fFoKMMoO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE3NyBTYWx0ZWRfXwGQgubluSAYg
 qKwo/sWFi9jne6Y/P3/57n+JWV4xIjYDvMiIISFgG4kCMK0jTD+vDy9jZ4EN71UlM2uPwilZe4I
 YFpYpsFqLfvLdyLmHhK+N+CyfzckMi8a4lrKqgE6N0qzAFFMGX8eUnI4QLhcmDEdo4F7QYYmTWN
 JC2tVwP1FZGP76QG1oY7TSGbee131Pm7C2mg/k5KTbHmGWiZNo0LWMMjdxf9qU8yRqfzhAjjKLe
 KhxzcGfl7AgdbfgnA5b4KLCxedkW34gEyM1ogsIhNbyrlOn/Ehrmro/JITatWw+ydAkcpjYj59R
 9iBiqRlmxW5GfnP+u7YDky3Yamm2Upe5NmVqzyLZ6NxzeLFDzM/9rI59qtGSOHQ3fdhx/lRbOFj
 tKirv8FZswo2FMbD4OdKpXpSDciaFMKf+VJRX9W5Jv1e6dbDZqI2y09ONhYgFJFPbz/2s738U+h
 ZX8npy4PVPI6wG2tRbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_04,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606240177

Add thermal zone descriptions for the keyboard skin temperature and
battery charging circuitry sensors exposed by the embedded controller.

Expose the EC as a thermal sensor provider and define two thermal zones
using the temperatures reported by the EC:

  - a keyboard skin temperature zone with passive and hot trip points,
  - a charging circuitry temperature zone with multiple passive trip
    points and CPU frequency mitigation levels.

The charging thermal zone progressively throttles the different CPU
clusters as the charging circuitry temperature rises and triggers a hot
condition at the highest trip point.

This provides thermal framework integration for the EC temperature
sensors and enables platform thermal management through standard thermal
zone definitions.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 68 ++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..e27533665c8d 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -979,7 +979,7 @@ &i2c6 {
 
 	status = "okay";
 
-	embedded-controller@28 {
+	ec: embedded-controller@28 {
 		compatible = "lenovo,thinkpad-t14s-ec";
 		reg = <0x28>;
 
@@ -988,6 +988,8 @@ embedded-controller@28 {
 		pinctrl-0 = <&ec_int_n_default>;
 		pinctrl-names = "default";
 
+		#thermal-sensor-cells = <1>;
+
 		wakeup-source;
 	};
 };
@@ -1729,3 +1731,67 @@ &usb_mp_qmpphy1 {
 
 	status = "okay";
 };
+
+&thermal_zones {
+	ec-keyboard-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <1000>;
+
+		thermal-sensors = <&ec 1>;
+
+		trips {
+			trip-point0 {
+				temperature = <55000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			trip-point1 {
+				temperature = <62000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+	};
+
+	ec-charging-thermal {
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			alert0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&psv0>;
+				cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+
+			};
+		};
+
+	};
+};
-- 
2.53.0

