Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C05F3C3C09
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750537; cv=none; b=QAzdcDUXm3ObgeazsgwP12jX9S7f5Bvwl1XlDvS2XWiBXs0/Danu9iOdHU0CPCT5QqastoMj1HdjqojqUgzgI8oyzsoyWph3Vpr1+d14ivvKCGFxZ0kB1lTk5zimv5OvXugEWuRWWlxNpm++olZNgq4KBxVJWU0FHIlLApMP5Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750537; c=relaxed/simple;
	bh=beLP9xQ8edVP0L/QD810fokITTZ2eQi389EJpzARPWU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kMgIPQ2CfFOZyQAuZqtBdzOaKh/njSvmrnLbMXoXit+JcU4DHielgRpTaXcOHey4RUpqw2JiLv1jM8CYcKXJOBXeYV+gpI4yZuKt2m45jIDkTovMScFe4jHvXf1khLGNsG2FpbCroyDUNtKBfA8R7tunX8TC7EJqJkspEZldWjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SM4r0HUm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RRiSYIbd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SM4r0HUm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RRiSYIbd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HCO1DR1623660
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5kszyOZLcnalHzZyZUpKk7BpGSA4l9C9fICDpudsXM=; b=SM4r0HUmy8dMm3Rr
	NSnmy2UN2ZLzv04dpef1LyqQoeCwrJmBvzKw06BvbCQztf6EjeD/M2T2EzF1b4hH
	16he+DAkf/ZYsrK7rWVF747crTwAs4kDop1ie7bkInzdiVW0HZmYrUWneHh2NQI9
	3RiACP9OoNRNZI4KL5dHWXkycHSLJ24dEQ1Dtux8DwzcKsrr1vuCFi23Z5GeRg5t
	3MzBubl9+Th2lXXm4nJJujSyH8VsPmt4gRpmobEATjYGkhNrF27qOdOBq0xAKGJU
	wSSjG0X3LJnusTBSOVWpK3ZujQeHprErS4Y2oEuFl0jfCN2f6hXXHpI4gmxR/DrW
	RmfrkQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyemhwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:54 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8299499d582so20335759b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 05:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750533; x=1774355333; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A5kszyOZLcnalHzZyZUpKk7BpGSA4l9C9fICDpudsXM=;
        b=RRiSYIbdPDpTkWJvkJwZKKm2rjdbu2aVAeAcoKusvkfHo+mQ/EZjFv+ZofgWjBgcV+
         gjKdPtXgDMy/qcVKmhllxspAcIvLMLNbdD/gD9ie5nXJSEVs5HG4rkj0oL74G2ASaHuG
         qpBKPIUtnn/tPg5Cufz4iNpmwST2wNxk6zcFOMb00I5NvlNz3jfnwUzT8tOqRHh5aoNb
         Ths7vbMyiUJ2JeZcXIZGFEa1UZ1D3+VwWqMNACYQPjeex8aeHItcp+fhBBrjplTVxpsc
         9nlecrizXf0D20+AdVSRjVCIMYh/snE0SrzNG/xc8yRfjyhZcwRSUi6v9OA+hVX9gYEi
         G04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750533; x=1774355333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A5kszyOZLcnalHzZyZUpKk7BpGSA4l9C9fICDpudsXM=;
        b=ombdHGroS+3kX4E/S/scqBgY//ixeFjjYvN0a2vhcDLsJIYkghTlCuzUZ/I0tK/xQZ
         Byt+hHUvlee/BUC4nWiNrvJh2QEB/N07WvbM1NsQVkYh90iFrznXP6Op/OkHRL3y6OIo
         n46dXZsnCqehe5NdjbLbvFmnaKmdtClZgBI+2j2mbqXFN5/6hg4LJ6k3ooTRIEJec62C
         UP532rj4TkwfBuRmxO3jhNtySxdtm7PLLbjb7xXy83BxP3xgngFchXEF0ed10J1/xnx0
         +wGPAzpFFrZv9g6GRRAkcsGcxFTd/t79IkFZDZ7CW9uvYWtSnJMWuaiBvbsTfhQ5SWI0
         S+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIZ0ZMkoQz/0gPA9TRDMKJ7wvI6wVXri5VnS1igve1ZR1LJT3mV2MzTrzc4cjqsvnSivKvv6tuLa6jdA4NnruBAjYP@vger.kernel.org
X-Gm-Message-State: AOJu0YzJCWyt+cGJ8dWoo9b5HSjrio3K/Vesp4/a3MXuv6dopJR8d+HQ
	9lKSFI6otAglj/EWqAZvZ7q6d7UcX9aBsIlytAgcDsXVtPPLm1+GfHi3jCYdHz74P0rJW3UDpCG
	h37H6jqZlKKKqmwa7ZM7WGkKefbRsc2BKvuIH/Sciq1nlf3F8msHL9u7NT2rOLnkJm5FdWhy6DH
	0q
X-Gm-Gg: ATEYQzziW4Tdx+iR/YCzIvVaUCqxG9jPbqJf/TkNZ2ha6riRuTaPejXDiwDZbUu7nWS
	hEx6yc9NyD8hi8KlwsiC5xz6OEX0B+indXqy5vfmmd5uIFS7CjP/oO/0r9jCRIcI41H1suwbUPD
	iTZYel5nEt/eZBFKHDwKmc24qSiJGc71M9iAI7N+WC2TPW7ckLK/vupCtoK5zs6hKfUbRRvOU4l
	yKutGsSCKkoc1JzMuOYez3PI3/r/wN0dC4iQuyY2WY/onImthhWmEl2TUq3WgO3ftGk33c53otx
	taGC8ExwbNfggDSbp96ziQSmn7x9o0nwsr5NQMUIc32r9XUyr4odOklx61LMfkSm2glvYAJOYRp
	HxyyRFan3YNy4BybwS7uQ+smkrV3ALZphoFbP0YmNShlqBUtW/pLxs2jrJBF5fmoVGlaMSvwQA6
	VBsMSRqQfHHaxDR6JFLC5w3/vlxF6l9d6IZg==
X-Received: by 2002:a05:6a00:8009:b0:829:86a5:d31b with SMTP id d2e1a72fcca58-82a198d043cmr14174939b3a.51.1773750533025;
        Tue, 17 Mar 2026 05:28:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:8009:b0:829:86a5:d31b with SMTP id d2e1a72fcca58-82a198d043cmr14174916b3a.51.1773750532522;
        Tue, 17 Mar 2026 05:28:52 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:52 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:58 +0530
Subject: [PATCH v5 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-4-38d11f524856@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750506; l=1451;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eJUFlWOASt+GfF9tcmOp5WNaFYI8meeurPuTUj+gCxo=;
 b=b3EcZ3VAERJZsHY31loUO2UH4JEhRprLOnvwzUgXLdb2Vxx+KZR86lVWU81dz05WJ6HBTXKvR
 r96YzEs8WFMC3w19pj+0ByGT1BduxvrXGwUokVtO8skYPQ3+A06eASs
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: XNkzHFn6L9xF6DH0GzGgVKWS7LuVnWR6
X-Proofpoint-ORIG-GUID: XNkzHFn6L9xF6DH0GzGgVKWS7LuVnWR6
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b94906 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX1JrbnVc0Cab0
 lMIOUW1yCaFjJJ+vi8vc4Yqy59jjXEBrdSS/6dhqfu9LnncO3ssEWYLT+txb7SHchSBCgd4aIhZ
 sAWaU4QfMoPqYW5FO/121xEGlQ+WThEm7rMiC2SqRPyf/4CF19+UJ0VgzXoKaoJxfNRVEgd5t0O
 TECMKnK2OCYSCWSOb/m71ymeK+IYbXRujAEWWq77yF81lTMDljPg11v+l5ltrd+sG3NEhVO8eXf
 m50IFm01QTtAl8Gl7UDUx15gGJ/3o3ZFCi3whS348IZ8ju3m1ARXoqwQIiA2VbEgl0gSLE4mhAf
 IHSGkL365HLhUeEH1MryaCS7gBTXu8Z/NPGsobeZ5bQ5hMCV1D6gAWXBhzQQvTCVyju7m14y4Vb
 iy8OGRrGTK+mjVpbu2UvecQ9kFzOuphYo+Sgh01nvK7/D82xavK+HQO4dZvs6ZioKxgUg2YKH3e
 JneL/Z8FOjR00T9CquA==
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

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489..d523e7cea3ec 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1042,6 +1042,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1485,6 +1495,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1

