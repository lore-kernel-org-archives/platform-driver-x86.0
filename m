Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC9338886B
	for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jul 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783452160; cv=none; b=YADM04FhoR0Yef6vdde7zlyAkQDqTunz52UmjfCyOA0n9gKnC3EyIv7EjGwiRc64GzdIYFOL7Mo6J5YYvdID7xkRfefaHa+XJidUOlMfs6CGoEjxnXZXmXc6Qk04yKV/DrDlBmRt75PNsedaPZk3HItSjgPT/SzlrB0nCLUuWNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783452160; c=relaxed/simple;
	bh=OLMI44Lp6GoBRY1rHghq6n1Fah+DXzoEhLtqQBP7V2o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NvacKUsm12fXm13VVmVlqhuhkYx0PpvfqhSHC3ySEfC6UBeLvmT4UQsePzufoV46v2WjqXFiKukNhg7CSCk8eLtZxqieekQz4kDQU5IjKwrqNZgBLjKYdzak9DzE1mpnRaKWrKJUpTsnuPq6WIpNk1+sFlWxLHuuWCOErAM7s48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gNq83lrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EG2kXaIB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gNq83lrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EG2kXaIB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667J5Vch509556
	for <platform-driver-x86@vger.kernel.org>; Tue, 7 Jul 2026 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PH9kSE6ElCx
	Spv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=; b=gNq83lrRtsUMcnMImKB7p9xnCO7
	ItfQyJ5pFR5inaiQEXi4axYHT0o3yVyyRj+RikIWjT0x12HXA//QpRsNwAjUM4PU
	Ow9pU/rtA0+35z+UkKzx9KMQhuAWzuI+/SbGv79A5gJFWJ2GL+LXtVC7EKqr+lyG
	vqXQsadcGUuA17B+bdiR1LROdt5xt78DbMohiIwWXVY3taPBZFncWfLWtJpiADq1
	6/CX5ysCPvoP5dz4sWNpz4M2NnpSFECX+ijZJWE6YHkX789m9qJhQHtDxLq2Qsi6
	RttaXrM+1dNQlsHD2acnFiEEO09ACefkB2r0Nep4FUUsBJrWMTD8kFYYBzg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2ys1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 19:22:37 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so58987096d6.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jul 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783452157; x=1784056957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=EG2kXaIBGbpphCx+LrwHHeCcLAZuKP60ZyioeewXHJeX6GaXocr9OO774bp8hgQl8l
         6Jb8VuxzApY10/bxsHOWHxa91OnALHkAK5xbtLghldOZ0f2IDjPJ4n47VRQyJc6bw3wp
         FuyjYN1pd680WUe77Gf2XdRMxZO2Kc0PWSjBJF6z3SFeJd5tiI0zY383BHVio48K9mbJ
         TlwkttEJz/Hid/Ajy/vRIegoGXJQ+Ly+x+0w8SQ3viViHoVvB87i9A2T2+CgaSIUXIy1
         AWEhf4f2vyCcf9gkgfXAMsm8PHXCUfB1ypviavjNpFjpmkJFhSpLT5Z9JhxHCePKzrl4
         peRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452157; x=1784056957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PH9kSE6ElCxSpv01qD+dgcHkXgkXzbxHF+kJhTdzTJ0=;
        b=dadcyz19YgHtEc/28jPNTua7Saja2MjOi2so6YhT0jpqCImGL3qxW3tg+VQ8EyobF2
         Kt8/qAyvokg07ANSewX5m9IqIU+02/OYxghXB/97qMAFjsjy98mADOjXvJ8TZGobQ4TW
         gb9xndYU65QJOHlFZpjBZq5vo/aJud2yH5NaJ5RFbQrmR6TTSC6yxORgE419pt+zXpWE
         UkVkEgMDVB8Xv4D/Q+oSUeOyb9CdLg1XTGEvWeUzvoqIO1ZIYnU6Uw19RVxg9NBEX2oC
         eTWzJgeNSzzFJMytmrjPA6T2VBkKDINp8NYWtkBw6OeixLEv3+zV+4ATn2sy8hABKIjH
         48Kg==
X-Forwarded-Encrypted: i=1; AHgh+Rpiz615yyD1URiXggbp9USafGjfRYSm7yB1TNU0fXMmqVM1iyAtuhwiI9uUbisCu+zBZiNvcinhHJP5MMxRN3U47iNF@vger.kernel.org
X-Gm-Message-State: AOJu0YzwcQbfbfQD9WS/quwjpblK6CubR+FZJ2AJggyzp4BUlgeYMSZQ
	D+iz0wemvWcmZz18eF8GGc73EdpwtYkzeY6zF3/T8CDbh6cmkJGNp+1h1pP7GGsSAHj/dTAocE2
	XbEEoRWwMTWQev06SYLjZxkFrnvZOefl4HdBP4cMwvfYdIba3M37EfZwT9mW2/HihpiCNbd/TQk
	tI
X-Gm-Gg: AfdE7ckhKhNdrc0JwzP2bC8tZYXhzl/99PurnUrt5ePoiaP2INtFhQti2t+qlNj5aSd
	uIutOc9CSRWGyHb3W1/lAzLa/9mMQ69r09KHixyfis/CLBSwVv3PmGJcSOxzGRHCUQauRTt7l3h
	Ntu43Cu//yzz0qBeQslhpINTEehRudg1skFKqMrjmEcZAg3oVNf8m2JGj37JUPuUqpzvwDzRZuA
	0dXM4ndOrOYtvaFQUCw1LkPuW5nZZ62VIbSUDsgKBbmEzHMbDm6Qgp4BVqWV2we0f6ID4r99q90
	c9eD9QfaIjk8I70oZBjebPcfXAD+L3ojfgG3idMxpILOR5/uwPlGV0q7bbl8JGUK0nYsHPpidSr
	6wn5oQoSEWij2CYHM1bM8SgbALqsr+v+vzP7Zkq72HfE=
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85363051cf.8.1783452156473;
        Tue, 07 Jul 2026 12:22:36 -0700 (PDT)
X-Received: by 2002:ac8:5989:0:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51c7477d221mr85362591cf.8.1783452155901;
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
Received: from juillet.box.freepro.com ([2a05:6e02:1041:c10:8029:bbc1:63:ed84])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f3677asm70025515e9.4.2026.07.07.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:22:35 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: [PATCH v6 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal zones for keyboard skin and charging sensors
Date: Tue,  7 Jul 2026 21:22:28 +0200
Message-ID: <20260707192228.14647-4-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
References: <20260707192228.14647-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: dBvPVDxqSbZoDg4zlCgkWINkdeS8FH0Y
X-Proofpoint-ORIG-GUID: dBvPVDxqSbZoDg4zlCgkWINkdeS8FH0Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfXyFez26wFtxKB
 VveNvJffAnyDIQaKTdyHWmvt1gSQdjETFI9f9aZpePA29TrqB0gW2dNByCHlUGsNydodZJAvCux
 41Xl+chMqmFAIF2gjtjoiwKgoZfRV7m8ufvRKZR4H+GmBUStyqO6zfUpbIBfaDF9D5P3WNrTv3L
 zb1d6rXyT9zUWojR49Xy+JSxiE492qcVO11dgRcqQLyf+Hf+QtAZAYfJM4vqcI2LIiuc5FYQZnA
 pS1EXsMgC2z5NMN7fOd1oxEhLHMyVhZEEFc+CI+Wa/cB8OyZNTGAmyrEOlQfw/CUO4M2eBKSaoh
 r+5jOhlbGKLUGeGZMDk1ai9kwIOGLUQlosGN0ajK2IPgjwIUuwWwEFvCcfUHwgKRlifM4CK9RFt
 2F8UItaEOcTEVG2P02XWaGqbumv6oMsGk0WWCzTZFxDE6jynbFRhVxYNQglCi6sJbwxZ1AScN9g
 Nmar72s9spXSAaj5ISw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4OSBTYWx0ZWRfX1O15P0fZf51f
 TycE5ng/nn4+lvtNHDbGTo+wy9bcNpON6Ho+p/oLxlZcKR9u2YSzySitwKFyZ61g8OM37VwE5dE
 bE+o3H3iI4pgQtz6FJA9twxKmyz2kv0=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d51fd cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=8S540zSUgs8tgqG0LUMA:9 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070189

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

