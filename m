Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962BE3C3424
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750530; cv=none; b=SCom2ZYculSGVPLi4Wemd4JN77fYV8EkoAB+C4JwJidT8Gn1zdOK2qN5rWZX2jDRCJShFAmQSL2zci7eDKxGN9ZzJQR/HT0IQHeMTp4Kaj1ee7ZodUomUtXlNenNFOGsNR3YHQ1Svb7Cn0W+lsjiSVDzKMkB0Ede0MeyycoiDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750530; c=relaxed/simple;
	bh=HYU03RmzKUV+AwSkHQUZ8N2LxDpZ7clmdr+G5jIyeng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNge6vrM7nxWPv6iidw3skBmlTw84Mn1IDsarng2iwrwcYAklblzMDTzrKmsTaoFRfjeVzjyAIHZGyGoWx27AqapDUXyWkV4L3qNjSARSdgd1oVlmpso5DlD2BKZct908kb6oC1oww8KY9UW0uI6fDStzrNS4rNyHjeT9B7UvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9o5D+9+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTu41WF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9o5D+9+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTu41WF0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H63M8a1621182
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McU9Jt1Kd23iuHTlAf2hKNHX4Z0V0K5fS02Dbtd3khA=; b=S9o5D+9+WYgvuc6U
	DI+m//yQzbBaH2CKRrPY51dcOomZKn2HF1ezwOh6XXAPkvVmvZpS0H2cwxuJ9mZH
	iL4ViGLX+JF112XDm5bfwXzk0a5Z5jpka9S6UXUbx1fCQV9sq9rR9HIrH3Klj7u0
	7JsBv1ERA1CTsoxDWGQ5ldBRl5MuGlYYk0XkZv4pmUlbE7uD21vvgaUWW6sR1mIn
	TALkhz28SVF66DKOCSDxL6Sk5NCgEc2Bm0H4LJCX6+f5+7W1+plM8cMUp4pUEQwG
	Gn2QEBeagxvse864yO+oXKWUh9EQ4d4TrY3THqXS6/QADy6ivz05kkvMdskrfCuj
	zZwmfg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyemhvm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8299c57642cso35306661b3a.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750528; x=1774355328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McU9Jt1Kd23iuHTlAf2hKNHX4Z0V0K5fS02Dbtd3khA=;
        b=dTu41WF09PLR3ytOEXlPzoEciXKetXYnFxz/gCdNm0jjkYvqwUccUlFLIaprqg/P6q
         pEB1hURvRLSXAwQuqx7U2Szb1aGPfTsfiZl5dLBKyEIdILT7o6gVGonAYiteT3HosMxw
         T6gjmKvO8k40WpEaAwZtmtBMREHCHimHm7/WnbvUNdotJHVC2StO1LigF4frXpN7kNrf
         s8sxjxk9wDFa0gPq5zI7Dwi15d0gsOn2IjWgBj5oW5AQ99oL+ydITcSV0WtUaQHBC9lN
         fCBEa9InXnzBgW7Tb7p4+af+kgm5FlRQpEAWDrgKsKHKCY94ReVllIcsepfYm4C4pOzY
         neLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750528; x=1774355328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McU9Jt1Kd23iuHTlAf2hKNHX4Z0V0K5fS02Dbtd3khA=;
        b=WC4+W4KRR21/jeo44l9h0KrZVeSiMzflZ1CAZxewIucGiwGfvxPe8o8HC5uHpPeiKI
         e4GqCQ2LOtZRq4AzX5LN0Y2vC6QPE5jrq8GBP5BoFApYeNhTOoApw7H15PHwt243ngcx
         71SGajWVlO08M4KY5z5qpa/Ry5mcBYXvxC0hUQx+WBgLqT/zyKtSQNgSatV/4dLe38r1
         e0jMZOQ+ENH8dFl9IZdqP6yCJteoqIyPC8IMWxRRYghhgs3mL+jRcWLqvvYbhM9FaJU+
         TegKDBvnPZgqTxo+wRiaXKgv2GbVjncpWLgnfATNTqRqv00aPIC+PapesHX1KwXSREBc
         noew==
X-Forwarded-Encrypted: i=1; AJvYcCXqCgQZIV1AVP4M7jmv7Mefyoqz0QlAQwHAi0IRNBjyrfhl4Y6iUnYWqPPcu2cHN3nMNuZ/pLGW3FNq8496Rjxk1Pv1@vger.kernel.org
X-Gm-Message-State: AOJu0YwJoKq519VYei8DM+pkM2TlvQDTDdoHUwB74nm2+Qk3nA/LLXxX
	zI3vBnw3/zB7we3JLG6FQhsOLeEKgZpdSFe2awg8GILmlwTjqFeRj5lOc65vEwk4TqWG0Xaqd4R
	SW4H5YWsWBPiwTA1x3pAVThpQZA1HllVp6EAwr5zy7W5Rju7pJtA7wynufgENweEihtIS+mbGhA
	vz
X-Gm-Gg: ATEYQzz9WqNcZyq5VUDrUexpvFe6dIIzgZ9+KgsIUsQebljbs1VH4KEwhxgxOYswLp/
	K3dgO61vG3fdCvY0ITTqPYWLvmQFl2CoXTjQ5IqeQ3xOqIA8w+YpaWZZfb30032XTxNX78lsVNV
	RBtwoyqJ7xFgyE9NO9owgIYz+qfyUGKcXdyVpSodwTIy55GtHOCuexRa3po+xXTCpi3ZXbeYR5m
	nCR6m8iRoTpappJozxsywCrmPk20eQVwcvYzj3mPNryGymYFJ4WdkErVJB7rPJnNZEbkH/FC5SY
	Yp65Eaj5JiJQfiXMlVD19nzKwL81KYZ7XIlI7W24EJzIUv9xWLk+63wwJrKFWb1pE550p7d6luC
	/vAwfYp5FqCmJRq6CaT+rijWrzvRaIhcRiyYKFffCuXFxnSP0hHaP8Ymve2Q5yFLDWhfxrv/ssW
	1YlDNIcvVj8SsQQvRQo7vZy+4wCtuRatiHww==
X-Received: by 2002:a05:6a00:2482:b0:81f:9b4d:e029 with SMTP id d2e1a72fcca58-82a198efa10mr11726542b3a.38.1773750527675;
        Tue, 17 Mar 2026 05:28:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2482:b0:81f:9b4d:e029 with SMTP id d2e1a72fcca58-82a198efa10mr11726518b3a.38.1773750527187;
        Tue, 17 Mar 2026 05:28:47 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:46 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:57 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750505; l=1592;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=F4VqrzakaV/RHQ3yEPoFZkP98ctNixvxc2zYkiOSj+w=;
 b=HxjpBIE+Hi1s9KO6JtdKIM84VvhJi2edCNRGEKg2tTyJvj1ezKA3zF5xgWlQAWQuu76+aY3+V
 Iyg0pykm4duC/wY166LpP+wW5jmu4LFVb0wLIPKgos58Ivp+g1DAM2B
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: UeozvfZQXP1UVTtfUN-D0zrZEMkVa0eP
X-Proofpoint-ORIG-GUID: UeozvfZQXP1UVTtfUN-D0zrZEMkVa0eP
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b94900 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=QoH_nSX9lomw0ZZp7d4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX5cUcNII98I6h
 lAaIiEzmuc2DA8whwEEuCLzpIYjbIWam/zJPItfpYif49CYN0gPztaKYmTy1G+WGDAM/bt4v1sx
 usKlqr78YqcVWgXq56NhMV77EiSOE5yZoBUFx646QBGOQblhzwaLujCkxaYYKRLz7AumnzG/pT8
 /G3cVOQcjsu+Yq8c6d54DwVk/Uuoo323stbQCUUQKL1b0kkAxKrkw4ZqdpRxhPLXaIv8DKnsXEt
 LAfsxSKk1RkkjBe2dHIXn0OTWrpy0Q07KeIWStIXGz04e7r6QxX/0hIRh+ORqUrL0rN/pvuAOJH
 nBohkbUZvj9NnZ15F/lUEf2wdS8QT413Vpw29jGbN7FrbesPsN/3apavgF4d7apdzd62Wu807e5
 89xayJ3WXm0/1gfjzM1W5WmY/tklRa1mWx+MZwoiC2csZILlF7MuxYOGI9GtgMsH11yDxdSdO1o
 euXR8s9tBqzqVmBqlug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170109

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..ae24af25aa6d 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -367,6 +367,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -490,6 +506,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.34.1

