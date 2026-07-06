Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A163A7595
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 18:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363657; cv=none; b=fBoFZO0kNlOC2mB+t9kDSAlT/j3HoubMG92RFIEUYhh/zDOIofpRtjtgTbKsIwv2F8HIRkPzL4Y7Ma6ynJLtW/vnn76kkSYaNdBSBkAW7WSPzYXbkcA29/qbKV08HEkwr6nzcCAJ1rR+7zZ5x9+RaNjQx0E0pU2tr8jLDw5lGis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363657; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XwHAFxOWiKBICIg88yHTyQ6xxLfh8Lghk4ZUxJENefg9RAp1e2DS+J5UL4Edy8sxDOelraLDZR/XUsQEU66wmqHlRR3rjHrWs4zVnlX1CgMV5b94VglPVugz4fZJ2inKlpDRBqXhqMYw5c4Kr8Wd1QY4qrDC0ZNJTbwLlw4IcBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIlPtDE2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C1nQYTdH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIlPtDE2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C1nQYTdH"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7WG990243
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 18:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=UIlPtDE2b4OtCjevzArJ+AkWgpk
	7SNhYKWX4SLQiyHvmNPxjo+NXBfaWUOiNnhWFOKGANAw6pHY6lqkjbPVOsjMkp22
	W8dRyw+DeuayeIp+L4vJ6l4+eOqJU1ArLG+CE1rgLDAcvSh8otBl8pKCndxxLhwG
	yFFK3kC5/w5xUc/5On5BGHkZRnyVxa0YIk1vzxDX8jM6UOHFEbyUW/8YmpT4Bc+j
	NZ1T7OqtGp5Hk3AmDhNULODVBOVwOMbIIwxdAGV8ynrjJFPKLxWS53pas+jT2aZA
	A8IraQvZn0QxoLKt4IYDHED5tIGWp1v7n/tvKNhBb62ac8pGDNmWqWwXM/Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3gtep0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 18:47:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6a2f5995so554231285a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 11:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783363638; x=1783968438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=C1nQYTdH3j+TP35XJS22tnqFg7mhBIgNdAu1G0HenjsKJ4D0O8Ztov2qIZRetAp83O
         pyT70HYtEeWH0XNDPo2SjVK4O7IsY+EzXAsMcSyxpGgq4Z5aZft2hoayxcGkL6OqRCcC
         3/SnFAVt3jOmhBG6QX96PnEmNWsgyB22y93+Q2aQ4rJqaLcW3DqBX5GTORTsoOZFIe7I
         42dPXSMeKB199WyYUDM+r6uOqG0EOqetTLnFOxBRf8s5+f7IHwEbKSoYxUSPKjgfXHTL
         f3SJfmhDJHAoopY1isqLDfxOr02yz6V2g5wDSNvrDBsgoe88dRIhl/sTLA+s8VRFB65T
         P80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783363638; x=1783968438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=Jr53EPKl9lEX2peiNlbkI4kyszyNNH9UcdUqWIpTWp9BRFYY3s3r+HIiaw7AWwywMZ
         gLeypGqfz9gGvKy5ke8+RaUD3O9aSP/rUtZ6h4RVPVpLpBNoeih5kWSxAvKW4cuRMlQq
         XR2WGvVCrXPVaUeHOROl3f02iogGcZoBPGkGg/DFLNP5RY409E7FQ9OKCyfJn9krLLgC
         bU4wmQXPpypcKiDGwqZBWS1BKzwtO68JAMA8FgtKcEsEicR7HGjZa2mPVSoRAfhk5/3G
         nLzB1JrWG1vHriQ0CWDe/Jr5/0QYquKzylIqHBI5Bfs1Ah77XjiaWn+2FhEgIviD1wsR
         /csg==
X-Forwarded-Encrypted: i=1; AHgh+Roxv3k9sR+E2CrNejTgyIlxoC98lsFZOklVZgExAH/WjoaVjaqkWCFgVsfxG2amow5xnvsgTbMQLwKbvdPBVgnGIhc4@vger.kernel.org
X-Gm-Message-State: AOJu0YwFniYATqfLXpUagZ4eLyJ7JKXhcyUbvaSA1xceU6/q6hsxF3yI
	9NFAgEuQZZmRdBfdBjkOawUpEGO4If6pj3UHW0oWNEaC6vmvTO75WI0J5/j27zLOBQq7DdAtj7k
	EmByftvU2T90cwJXkig8CBbaiN6Gaj2CbQ/LHvdbgzHdLzJ9gSDoMR2rBCzgDc9PSRbHXMRfHN9
	bT
X-Gm-Gg: AfdE7cnwshWE3172hsyglGQrCCytYWcGiQDfqIPRyVh3EKadUM/8pKaEMFHwOf1Uzpv
	D0YiCe9/xV71hnHTH++Bo5BeWdikUFzZZfFp0VUjDaG+uIOdFLdnK/Lfeywyo5qsOW5oElMEUt1
	29W6wRT7wgo8dcoN6BpqdCSeg/3oNMJ+tiwQGvmuCUnsbSZedweBmjnsTaeiCJ9D5xcvk5bqGrl
	N4Lq+51KfBmTH4NB6RFXFNOgkmGT9BSEypkRHTGQRWI8of9hb8cu6aDNtHhloH2O5d+RoPAT5VD
	simKducnm5potTs0auQxWNSoIn37b8pognOH7Sg/OsHHp4BFqdcljWqS3zhrizxYjoHiG9/Khw5
	GCT2vIfmeiXEdMAJuVBPaKVTozT9b/kSskkSR/l/AaMEm8w==
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248197185a.18.1783363637931;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
X-Received: by 2002:a05:620a:31a3:b0:923:8612:f15 with SMTP id af79cd13be357-92ebb4e39damr248191485a.18.1783363637451;
        Mon, 06 Jul 2026 11:47:17 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:b077:843a:5587:be05])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0078d56sm3858625e9.8.2026.07.06.11.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:47:15 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 20:46:48 +0200
Message-ID: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eoiuLuFZW9JwcV2TlC9fErL5-C606rPX
X-Proofpoint-ORIG-GUID: eoiuLuFZW9JwcV2TlC9fErL5-C606rPX
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4bf836 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX0XCTG6I2YfcY
 ffVLYeHjoNsSgQYP1vZkyuuuGTU9nrFiwvzRJmDx6j1JVsCHu8IEhbPMxWFS/d/pbO4N10vfVb7
 9A1qe6VDIKGWGmQwJfiWToUYZsU5/2afFp50MTU0JdIlifeavgyHKnWWBIukLg9JralDntAPbwg
 45uFpLk05XtzEwFNkZ/Xz06Qc/2uXhIsyLUJ6mDLCyXv8XlRnHssd2kUiT/hBucuYcELW99GHY1
 yr8zFqvdCc+YY2X2a/MMUY2JEQU64Ld/0XPJMhiLlJR5j0tLISdQd4tFzmk/qmacihHE57oKfuV
 y12wFLXDyfmJuZX+Y9qutz/rDaImF7dWx7h6dodnfVg5r23k9/BMqUkegyPh3BbgYNeSz7fv53J
 VPwIzivYkxtUexxDTbhME266jwFozMm787B2+D81bNgDz0Bhkv8dJ9X/wstGosxbcwmUFlwh8yJ
 NG6WTo+142HX21qmmxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4OSBTYWx0ZWRfX/kvY1xdNc5qK
 wJC8f/g7VNU1hcHWXJHew6i0bIVYybzVOPvv8VC4vmo+x9OkI5vWgOYbVwp3yhlhQbOasGrBCva
 kQ9XYu52TUsMJ6maWiYqTsmRFUN/yxY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060189

The Lenovo ThinkPad T14s embedded controller exposes several platform
temperature sensors that are already used by the firmware for thermal
management.

Expose the EC as a thermal sensor provider and describe the keyboard
skin and charging circuitry sensors as thermal zones in the device
tree.

The keyboard thermal zone defines passive and hot trip points, while
the charging thermal zone also associates a cooling map with the CPU
clusters, allowing the generic thermal framework to apply CPU
throttling when the charging circuitry temperature exceeds the passive
threshold.

This integrates the EC temperature sensors with the Linux thermal
framework and enables platform thermal management using standard
thermal zone definitions.

The EC protocol currently does not provide a mechanism to program trip
points from Linux. Consequently, the thermal zones rely on periodic
polling to detect threshold crossings.

Using the charging circuitry temperature for thermal mitigation provides
a conservative approximation of the platform thermal state and prevents
the platform from reaching critical temperatures under sustained heavy
CPU load.

Without this change the platform reaches a critical thermal condition
and resets under heavy load.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
 1 file changed, 66 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 5d49df41be02..ed5ba3a428a8 100644
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
@@ -1729,3 +1731,66 @@ &usb_mp_qmpphy1 {
 
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
+		/* EC trip points cannot yet be programmed. */
+		polling-delay = <5000>;
+		polling-delay-passive = <2000>;
+
+		thermal-sensors = <&ec 3>;
+
+		trips {
+			ec_charging_psv0: trip-point0 {
+				temperature = <55000>;
+				hysteresis = <0>;
+				type = "passive";
+			};
+
+			ec_charging_alrt0: trip-point1 {
+				temperature = <63000>;
+				hysteresis = <0>;
+				type = "hot";
+			};
+		};
+
+		cooling-maps {
+			map0 {
+				trip = <&ec_charging_psv0>;
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
+			};
+		};
+	};
+};
-- 
2.53.0

