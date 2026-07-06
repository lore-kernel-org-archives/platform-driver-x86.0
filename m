Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA114314AF
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jul 2026 16:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783354126; cv=none; b=sCPXxv/dzKUz/KE2nw5slMQTHmDNTovMv2sH28r4y0NNVKTYYV6EntlUjLFZOCSYjjW6ZOiCyGaBaN8QjDoseHyGiyg92WvFP6AErpZU5nTZron9K8by+xMfPqk8jGQPVJkNHjLLYa1vBTYfPTLOR1iQRjl3hlXhrEykjpK3Q1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783354126; c=relaxed/simple;
	bh=DslgyWQhqoS3FgUQ0SixGQYUc2U8QPcs7eGUdXnZmfI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SdXV+Ij4+q5hwJYhan1QrmkLEugCEcsXDXHfauUdEyRbOBvMe/peyoWV7k18PL4yeblUMKmb5dMNnPjenFEtmdJBLpfPcnccRNlJ58DpJGY0ROtiVdfbo0/fPf7f1fn6ZJYDyFz8dUZjP2rYfWEP/NWTFnCuq+4lnM4saPtql2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=luuWWHrD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JcWsNBmf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="luuWWHrD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JcWsNBmf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6GH982437
	for <platform-driver-x86@vger.kernel.org>; Mon, 6 Jul 2026 16:08:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mzAnK24B5Og
	zyCTXlJoJUUix70FZiSCDjrespS3gvYI=; b=luuWWHrDauXffYrXZz+3PTl5Oo5
	b7BJjiZC0nvv9fiRSF1FWrI0sQAQMxpaVwjcFNDhAKnEgPTDwB/x+IHoNioOLxao
	m4zN/K/QSoEhVrVLheLEfCXx8epxa7zOngYk67ZNIn6b4KRJDRFrXyjH6icqVfli
	z8/msNB6vD3qotRRIkX3GOa6NTa15IqUlC9jOo99cOrE+aka1E9J1sPGImQWpVFm
	+j2lBB6kXozaFD5Iz2V23mBfiqzkhj2XXiPd7t94L3UbIrpmHuLmxFe2C7Erwrk1
	/iRRavwKzSor+H9REBO4dST4JQ6c+6EiUz8ZIpuzmghDUiK35Lku55+6swg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qphss0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 16:08:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so5650238241.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jul 2026 09:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783354123; x=1783958923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=JcWsNBmf2qT2kB7Jh8gxvRG/+CAf/+1wSrAWPHdolzprY6Z9l3LtyGXL4RNXvxjHJO
         WS9qwBXsWT9KSN9NYkpVUho5SGgb+Mb6hBpFzbtK7+ggnpRp8t/dS6dGfQgpZ2ivuBpX
         yIbHC0Az6bwcy8L4MEh1cn9pB3nNapXLeljLzGjeol8B9jS1kFKknVa9RlBF+KbjKMQ8
         kSYJbzXEaPfXjj8Uuxq8ENRw8bKe8foQjs5XVjN4rGV+0rDHqJGysao7DPWchmxm3XEy
         bhV0uuPh9SXC5qCAMjejP4OrnhinQJjJSBuazv7lTtkWPE4cO2ZG3oN2OD+kHfAJ+soE
         mFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783354123; x=1783958923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mzAnK24B5OgzyCTXlJoJUUix70FZiSCDjrespS3gvYI=;
        b=FF/aolPIyiIrBAh7vrjNwnT6uAm7MrYDIj3UxQWcLl7sL7nEZuZHYl+3Cy1UNNxPet
         ewtLzVIH0xrXxqFC9j6oPAS78usr4DsHKzIiFkBe2ygNi/iC/dya4WB4TeKkdbbfQGMK
         sp3j0QRBZ6BtRz3HFHgh+VvXk+tdRwLHWp922m8qxuG+V3uP2J/KfPR/SCuIKP/DwUUZ
         At8p24ZZ9bAXPMuPSJE+jx/CMFaeLnWwUp7Kmo1WPd5KxK/7QdaiAVjsJ3Y8xSzgIx/k
         eKFsccZXHK3iT0z35NMXtYO35QW8NlUjcr1zX8CMpZ5pfzYClCCSIXzoUWqeMp5NChIN
         UA2w==
X-Forwarded-Encrypted: i=1; AHgh+RqoXAfSkP0l8idjHvGm+P/9wY7wYt1FwaVL1EsXYDN76BME1uvpaYLv3CyV70vl9F0PBTF65MyMKRCteAM2bVh9nKAg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ilg2x5CRVDQ8Z6s9QjWO6oxTTL/BVkJk73KncWThEJk62iDU
	ZcO5qHNZXgpVG3T0HpBcIGpb4Rlm9ZFQtTK2sYaJerUqUzZUlF8TVInQrWDrqugWCaBBQeAX3l3
	TJLsz7Yy178E078jOjvQTehiLLNgmNwIXPGjPB7Eb5az5/P0WDSkoTbXaWb+2OU9ap92zCRoIcF
	O8
X-Gm-Gg: AfdE7cnZtIzev/kHL17Yft0Mlcbekd0DnB/uO0AYVGfOd8VUoHhZOE2QdpZ+j54FDBW
	Jyxgfhht3p4oJa/0eUgU61Fy0hTwCI+xo0+pB0U9/ABfyYnABIAdbgsLKhPJPMBK9K8iA8Y9a2p
	QVu03fgIO4H5cemPD122GmXECz+xrvJnhA9/oaWjTxQ6FMu9qiDJLFmUQygG/Atn/KorI7aFQdt
	LfAr0Oz78521x3QDRh0JEB46LfQ5E56QMQiR806U6e3nb6OSJ8Dn8F1qL1FK3Mmj6qbj8MwpCLF
	DduPgFWfQYv3+yKEDUMpmVQvxc8Llwu60wguHkHCvUoNRLRLNy/SzK79WP5+ZyI0t9Jdc/cngTY
	Bz9fRJ1tjw5Z1v5p3Aw4w6QUtgy1NsdH54s+xN9NiQWoRhA==
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583478e0c.4.1783354123177;
        Mon, 06 Jul 2026 09:08:43 -0700 (PDT)
X-Received: by 2002:a05:6122:d15:b0:5bd:8dd8:146e with SMTP id 71dfb90a1353d-5be908f8d78mr583381e0c.4.1783354120941;
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8405:4a9c:95fc:4b8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm26071966f8f.9.2026.07.06.09.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 09:08:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v4 2/2] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Mon,  6 Jul 2026 18:08:29 +0200
Message-ID: <20260706160830.17698-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
References: <20260706160830.17698-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4bd30b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: w3LSJEiwzvouafjDYks0f6S4mANo2ABq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfX57jX/UA5VAzc
 E6T9F1MPzCkZosguG329Dvopqx2jQe05TOeuJ6M/imLnIKIWStiXb8Yvf3+tKiXqeT3hwxjug7K
 A2Jz6M+He+Mt9WvhQb9YdfK/LG2tsMS4xlW4ZFyshE/vE2CJDvcDwWNlZ626T8hd1NvR0GR9bs1
 3b+8MkKc38x9tUaQxkLk8Q1H9S8wQxIe6QIlWof6CyLS9XPwwnoHtY6/+gxkX6NJYTHyV/TreZA
 gGbn2XEfkbvw3xaf+V8qt8ay4QU7lCgFHdKnn0NiRQJ4ArSW24yORCNXqhSvBYU90bo3y4m2czU
 xqrBXhEgIG87X6iqsgRjW/Ffyb5ocAN44HH/wlX3i4bDo/g/xw89a+Q5ZHu6BoQSqzS/FIq/huu
 F+qEIUp4Bl4BMQ0mUb/sKNHQsAgMQTGPjliX3nS2xVV7Y3KCjHyS3U0oUv6gGASUTYd6BvISL/l
 xCpT0/GPP86cF6yG5vg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2NCBTYWx0ZWRfXzRboWucWmJIw
 1knEeK3M7zYoAazRD24qxjFBMhqI5OUDU6ohow5tRKIita2PW5gNP8ZL3tnSuDVNWoydwMj8ecY
 wEgZ2V8uWSyNTQaC5sjzgUhTsCDz7OE=
X-Proofpoint-GUID: w3LSJEiwzvouafjDYks0f6S4mANo2ABq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060164

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

