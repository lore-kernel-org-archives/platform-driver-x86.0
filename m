Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002543;
	b=QJxgppkyP1ricHL6NnSM0F/T7+OcqPaVUT+1EwvlcGS7VmarVTdbvMEPaL+zRh8McRQ+
	 +SPF/NilKfKxirM5ohMl9+oQ8ztnrYbJoIILI6+kEP3PUCf6arKpTM+6Ugfhl4SLGKRtt
	 MK/jlRTLwPkouy+4QpZFN3IYU3AxHzPOUHbr8c+KdQAW63WEDQPm/4XZqTki8ku6s/H3A
	 I/lbF2pjS2QBlZkrFKkAfgSBI0YECiTl0EfvPM9Pbw956fSq6J6ai7yJLv0vTX+oH0bGa
	 2hMcth/UfSrj40moHkXll1tcfzDC/BnMpVOWipsmLgeE3e52pUNK9lq2WsBzyGFnMtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002543;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
	b=V4HUjbmVbi6ZjNyDVY8Gzhx6PksCQIJcfB5G3P1zTb0JNYmULjrlOijg9mGgFcUBSLC4
	 EgJrC09/11zS4s7nKJhpmNen2FVrEjBHT2XeuroR2Gewep0KOrccTzfuOp+Ta+N9WdCkP
	 2zCoNAxznvl32PIdC9THKo/ZFwnItoFpqjGhkK+cUalKQ84CBNJogNqqLUbV3ZCjeWQeK
	 O4SBiuMyUIk708McEftLGvHBw3s74W2RKeMA8jaWQ8HIpYfrVQWKrNgCv2zeLrg66ZaLr
	 s2VrRm9WIl+VMOoUZsjLw8YkdKASx2V5dp3HH6J1FWVsCHZV25fQhZLpxTznFXYPhrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEu6U1YV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A774D606D81E
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Nov 2026 22:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A774D606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEu6U1YV
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Ht8L5476113
	for <platform-driver-x86@vger.kernel.org>; Fri, 6 Nov 2026 22:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=; b=gRXORdhCts2i1YgX
	BQtNGID5Igg5gTtvX0XVrKRZQIRmVeLDKv0M7ra1pfag+ZrhU08+7rXvqeAAfpt+
	jrYjOJZlu+ioAUoMNxZXKFDnapmb4wPq8TuNeIyR87NDEaHdo8Yjbru1BuMM2cQa
	yhsdZX4REdlqlYRemVFVqvgJr5I2x5+YirfaBJ08vW5AN5DB025am4yJvkbvhQh1
	/ENs/w8ZYW/4s7/BpmCw+m2gdamyjpxAW8+9bNGoKJF2wBKOlbV0yaqsVKIS0QTG
	GQEsJpkqmX1R/zZSTFUXMPIHrC/nt+v0G8kp4h1q3vNt/J5TXMVyIsjtXYeDlhtV
	BOVjyQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsk3wh147-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 22:02:10 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so98823241.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Nov 2026 14:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002530; x=1794607330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=TEu6U1YVFk7yFI0dOUjee7vBODW05BBZ5uwESeE3cqmOo1G6VqpRCo3nHslaPHVSzu
         Lc6Woa1Mk8QmWVbjEtcYylwWJEOTAY29L4Q6qhaCbT9W3xZt8x7SBk5oMXysz8zvnzTD
         HyLke0Ky7gGp7jswGUbAEVn6T4AZcda9mBUxj+gZG5K2cPDFmSaFYnGk/UPEZtfcCHle
         szsPaNnpOhIO7khWxstHubyGDltQbnHiMLYKNt/KwTtC1/BJ2ok+1BZ0ylOfTIOCDs0J
         IbN+5OYk/m1ojM5UT2xnC1W5g57GolRugQgpiVWedrCiqZvcnorBhCSjc7eTyPAblhah
         de0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002530; x=1794607330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=E5/ZIsEteKZzBVWUYO8FrHvuj99JRir2vLv4OLINLnzdwxuUNI6F5v2Ygl/h9ujxdI
         A6Z3yNoAi2zNIE53rQQMPF7dHks/jiiF3/6EtY37sP1Hc6kx9xrjLOywscuRZNRE08Sy
         Qb1w9ZJeaPgu+677t1+jtoySolulgYfTCtzf4KPWk1iYcfGJkxMH/rTmHfb8CAQlmvmy
         CdruO/f2LB+r8TshFha9J53vNEyEtzPC699gqRnAcaNrJflaGgIlwkMKqhsLYzh91Ut0
         xb7nnRKHDL6U9VpwY9GYBYyt4s+car7rFkJ3XaBhmPU+7rZC19uwA62hFiv8N8zzF0mS
         PIag==
X-Forwarded-Encrypted: i=1; AL+hErEveigIh2mVgXHFEeSNMMy/TKbPu3iNYLxLWFr3CZhMEUe4dD012L4KzTZJXszVqoHRsTDhIlMZP8J4/oQ4KXnwkg2W@vger.kernel.org
X-Gm-Message-State: APuU4Z8t18qffJnO+11hJmQIq951J9m2FEKgM+RUK1I41DCDWifTlSeJ
	m+nQUgZQZdIHwJzklVWUw6QyS/iyODOVnYiZJlQQSMh0MnBIz6yq5khkc9369z9d4FL0pr4Dfj8
	5g5Uyq62EkylxY8ktlnAHb18niOYy8WYSv0Y4vrVJHczHbdQyZla7dazV72p4ps6mmQ8RX/pm2j
	yW
X-Gm-Gg: AYBFou2TesoGMTV0MgqFLzeXZOUplEtZQnHcwPSjegmDG+W5gXwtn5tMvgY59WMMMbP
	3cRSJA5BPAijHANmkbHw9Lk3z8cuGQydfNaXmMPoriDUPs2abwzV6hNU44yS4l9D5BaKNes+5AM
	txEGrXqwZLzoV/mfjQ/dvIUgt6vlsVvLIrV4FDatrn1xIT5YSsLhsjR5tekd73z296eA3pa+4TV
	N5bu6zkfjbH5Qa1cRGRaIgYMUnEOYS5/piTVtibUfzmiJgNAzKKQDBaQObnFcFKWCUTuznyDges
	1lgwgl485Xp/N1BaCd0z0eVAIJx66g82qwnAMD/0dc1NXC5xYtE6vQLiAOTdiF6NZ6ymxI8Ef4K
	6lujxfNr4VB8QAenIIdl5CgYs7jA/W+cnexSAXmgwgB9VAe4rXq9zKobHmw==
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67599137.45.1794002529881;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67580137.45.1794002529113;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:07 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:54 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZRuR8urqXbfjmra9eBgfstiezyG+KjQ2tGTK5mUoxrM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5XbGwrmbI6wXy3YshymRedfydChFZSrqa+O
 P3Of+nDj5uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVwAKCRAbX0TJAJUV
 VhLaD/9rRE42Aw46TEo2LJbXjS8hQEuDsJvU3vGP0AKO/sLeAUmka11W8I6erRPVEu08NvT5XP9
 jpkulFzIFVDdW+65cOeLZAXuXrUaMt0Ihl4L1f5pQDEdaPx1v39it3OHz3fPjkBPxTQSsDR2HW2
 uw4ATXd1i0ab5jNfhZxWjAjzA57Fkl9H9m738j0mRenQCpPCHwRCOQ2B73dpSzkL2zSa9ftyBN4
 ydN5MP5BznIUX7TeCiYO+vruhy8W905D3TFwNbic2j+8AtBFixT3K+0bmRnn4v5Vm9pYIH8fviE
 vvzlzpJ/fjJknvuT9pLqDKJi2AienX2/GX8fb2QTAfBv0+94Ho3Z5RHftXBn5eM6G4sWgXBFv+g
 xyWLichrTYZEypvOwuXA2OLa4f6FZeyDtabRuK3dQoExFhQjKkAD4Muoyl8zjJJHpZ7PvJ7vNsw
 GoUvi/AdErciNIRqgTJ18FBmpFJmcAO9ma8b+xZjHae/U7azv2pkMdm1G1a7s+mVF6WFrfuiX63
 EfjnVlkz7i7z4YE5cNYsWshyz7cRPHmE32gtJ2r7Vny8D6xJJo2tLaGsTkD6aWfNSqN8O2AdDBV
 WnLn2Ti31CliaO5fr4G717TXzmMfm9fSb/Ht2b7xK3RcqFg5dTFcs/XS3hLZgHgWOtgBfkUwqkT
 j3bjyD9eeA9jDXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: gIbbK4UzQoxeTj1U2dW-OYoZpAWVCXwh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX2xOkCjz6YVxf
 27Svgb1s3AjG8yBW/l+h0CBJ1LELHw/F8MesBvyvum2nZwY6xAj1u5+JUWHlAbkavIQiZ+6uEb8
 8priiPBBaEz0asNfIt7vfvW2dyAyImdigJETXoLhXp2CzGXMOLrudQZYYn9GjgKgHZme/PDWhUU
 zS3BqShIP8bSTg48LubL4Ao5ViANYxfSqzEBbhRyqqAtIyiGFF6dZ8mn9nVnGfQs83J7UsQ2HIl
 rTLkyYy1vx6exF5TABr+5UHwx4kyPXemDUhH/aE3tuljl7ngU94ih0WFqei/8nFw/XdYjmdbUXj
 u70MB3cCoOml8mvZkukIH7hAA2vNGSuSjjDzTsMhujibdqpye6yrag3zmEz3jz6vZ7RQJixvaWI
 ERqE2eql+qQP9hBN6O9s4l0M/sKS7+cpAPQXUKKKQF3kUUA7fOi5ni3tqPk1kPz/ws21xt4c05X
 26xN2W3JoIEUeZeWPXw==
X-Authority-Analysis: v=2.4 cv=a6OlZkSF c=1 sm=1 tr=0 ts=6aee4e62 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-ko0rdnKxUD0urDMsK4A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX48dG0yvxLe6T
 IkeJhBMucnJ+IHSOdmhlwHccg4GKk8mHchPvtHSdXncG6DweKk2gjKnXLEgPjPC34oiw0FosGoo
 KKp0gVFIONpeWNi3i9zoWrH85jXwa0Y=
X-Proofpoint-GUID: gIbbK4UzQoxeTj1U2dW-OYoZpAWVCXwh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
GPIO 66, as on the Gen 6, but the firmware describes it as edge
triggered, active low. Using a level trigger makes the handler fire
continuously while the EC holds the line low, with no event pending.

This provides the EC hotkeys, LEDs and keyboard backlight.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..05814dc8d905 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,24 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-gen7-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -987,6 +1005,12 @@ &tlmm {
 			       <44 4>,  /* TPM */
 			       <139 1>; /* TZ trigger */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.54.0

