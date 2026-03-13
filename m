Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4A235AC37
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397908; cv=none; b=X2j6RKbKnPZyWxbWaVNVoB5PVc+xrCt6Hhk7Uh3F4+ezuBPRi03Vz/fs+P112cfV16oBq8Ay3CaCr53Bv3S+eUJSjMPFqdVc90g7eB7CSEnmeRRqzadK0s67uZmEvhmeS0HdPnZf29+T9NxiHhihXjdxEhSWUGxCC2YqjmofDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397908; c=relaxed/simple;
	bh=xldEZlkL3TP9FPHEHS9y1uxnS59IKMaOFivpS/3Xf5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqzYqjGUipCD30zM2u8MRG2TfKIVbSCTmuedptr+DwBATFreAZXSVUDbwcjX+PGWTCVV/6MJ69tC7k5zHqZEPF/zu6FGq4qkFnRT1kKx35meFcAMnWweYvQhdJ+0lSHAKUWghlT5ronqADxVDmBt7ojiDYkmkzwyLzkDz3wWLWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGA1ALx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VH7kGVaV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGA1ALx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VH7kGVaV"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5td1k1574530
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Xvn1JCUZ0cwf2oMk92ZZMfp11uTKnNctokTsra0oTI=; b=ZGA1ALx5Nw7NAUxf
	iHavz+RLs5A9WQ2kmgGWiRoC2bF9OyWSvNKcb8OALU7DXspyVI83E25FYBlu3bjy
	Gs0YLQTYORE0SUWsKE0yng0MoRz0rOHjN4XNjxDXI5qAXx8Me7C1NTkENe6DF6oi
	VpX+kqbP6QNVqdHvdzz0MQZbToheT1tvk2Swl4f0MGwNv6rhe8sv9KyyiIYOeUbT
	JwmUOABlwtn4f45DvwW6cHbLceexvZ4gqGFTeir8x2tx+LTeUuy8HE8VbkXcbFV1
	yEQCGaX9S9J5+Ob2fXMORuMEWTAcqaGmmi4FWt8Jv6o1tbu8wiUpFvJapYTC/ZCf
	cVucuQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53nnq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a0ee0fed2so1597260a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397905; x=1774002705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Xvn1JCUZ0cwf2oMk92ZZMfp11uTKnNctokTsra0oTI=;
        b=VH7kGVaVQu6lwZ32yAe6/RobbzO4z9srOnLeyCGXD8zaZulRMx0X3Pih1DC14LW9w7
         cS+DyJXbV/DapVQMCIQQrOOZJn/gmE54Dv046cwT7WlEKSmKCENoe4ME1SCBEjZ0F2rr
         77Ewogbmgbr2nnDlOAcqn//K+9/XogGEQ9Kp6HjHwYxeDk1iVYsHNqt/Ns/GpTgSeeJf
         LpAsbd42gJvrGsycxx9yX8snx9e2WA7QSM8wj+lqjTg7rv7RwpwzIL0pzp6lpgpTpgPl
         KeQjvQd/tE/A539d7qn/jM6Q4/5/FPK+fYFfhw/+tfSPKcM9zjdGIpxkJnDaq0zePdMW
         cc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397905; x=1774002705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Xvn1JCUZ0cwf2oMk92ZZMfp11uTKnNctokTsra0oTI=;
        b=kVHOEMGxs6cUjp9vA+fYOS1Rp0Y60aaNNsxSerhT6b+u7ipKXMO8mwbqo081BGAlsK
         IufS4tGl11QQ9ajjk5JcGqjP1cvbPlgfAejBJikMSWZ6fX45DpEFwQzPF+VuJF9NgqAR
         i43bEpcKyjMRErorG8stTrcGrlBM+4+EAwykTjmJWyph8cTocGNj8IceJYcchoNScjfn
         ioAHGkwV4nakMl3JyflaYER+E9lY3TCrlz1Y0VZQrkoDFueDZaOZ4vJv2z31QbRUdBHR
         XBmMOHzAwqz/RyxcxV4Exde0LGa9pmg7Yw6V/7J2YTYzeXRqf8XgU9UGjS8b+4GDPWN1
         zI0A==
X-Forwarded-Encrypted: i=1; AJvYcCXbMgCV0DN3OmAlReXOpJH4hpHECCtTxFHnR0JL/YaKeE0/CbUTHFQWO+lXyt//8C2sk12/9boT+Kt/NaLKCwA0oiJH@vger.kernel.org
X-Gm-Message-State: AOJu0YznLWPsvyQSZeux1b0mXQn7H69Sco7LmblY5J84xGvA6AbyUM7q
	n+Um63DmHAjFCjLMJnsCE3eVtqHweNS9aWpcmh8L9p4HgbR/k820GDfP2DFMZLbtyTCRIT11qOg
	G9/RM1vGHmoWOIO2NfHuNx1LFxULp+cVTARcn8J+tn51OfN5MrwKh2JAc/N5/z7dgzoB/v8utX1
	On
X-Gm-Gg: ATEYQzxdcAxMxOMFAnbA/xPhMG7q/bN9tsYrhjAi6FBPqbtt/VErF1WzpqVqbVE6rzR
	sf2oj6EfI9Q1UeP/kYe6vjYYxms9bO+3ALr7TeZMpsCvac5fp4FHsjYyL0cdXhzDTUgC3qWjbU/
	WBXivXhmm75p4ShjBug31oyks5ddLUtQ1jZkYX4d2AbVFUueSjrQdWY7dwZxZ09XnKxjp38vi6y
	avE1MG+q646zHkrtID9QH68bQgWFtMakEUmKWLuu3pc6KKZ1asf0Hj+NcFh7LOMNUMW9tnYmExh
	k0fNxQwzUPiICiBIVwEOpq/7slUo7F0/C6/cSUjR0DYClRTGW5iEH6tm8EDJ8T9Dv3Ax0NK3i3i
	KgwLB/4lt0vqWA20ZlQVITgqKrZDfCJk3mESyW8l8PGQNnmm94sDpLmOMuBSGZRgS5j0iAKoeby
	w+GLmFTmPZT4GcCpbo7gy6Q39lFQbSDe8L2w==
X-Received: by 2002:a17:90b:3908:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-35a22055899mr2461297a91.27.1773397905186;
        Fri, 13 Mar 2026 03:31:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-35a22055899mr2461274a91.27.1773397904697;
        Fri, 13 Mar 2026 03:31:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:44 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:53 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=1464;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=8N7OjW2s6im3g+0cokctzc9m2ycLJN/bB2F3iLp7CGM=;
 b=f8mLTT9leD61wtzAtfCRAB5ZhTMzEhqIRJgSK/TzgBXB0qkn4ndB5oyTHwLCgLZEfn9iw0Npp
 UNVsp2YDg9YD2314Y0ezS3gznzpTdipPpIIwudiEuSgd1XxPvwmiHf7
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3e792 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QoH_nSX9lomw0ZZp7d4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX0b0KQDZW+kmx
 soKWRmcwTIfoW8uAVw3VvgxuZpfvEkoT6isnSPo6WgyVkZti37fJxX9iBbP8J+D9cbbcVGvcOFj
 BdQq7nG5fkyLFGzQNcBEfTEmEq3hazty58b1Iu3bDjiI/DtpBco0D9bpmx3MCF4jkt0qbJ1WLHD
 aWM2NkGb5Ny7KH8XMHPm1n1RkHB3u16dsFtXVeoEE0Q0S0uZu7wZLTNb6mJNMwZnaMANzJB/ZUM
 OS9efyqCNLnFZr+echYsxU83FwJJ1npNQJRdJ2RoRceG+tNFMYJO4iBiclKzvP9mbdlRziC3zHy
 Pjk9PQ4XoOThCU+AbpXechbPPSQA8Uw7wyYJGatkl2YN29yXBTdUmT+LzkzuaSVTjDc/aEw9pmS
 f1C0RvBGygIMewcZOhD/HAC3qiNT+IKf88su39e2xE3yDzH6JvMM5eSZNSu+R2OTnTV5s1Vya6j
 lGT6uH+xW9g0PxvajRg==
X-Proofpoint-GUID: dGEa7S_zG_BGBtLIabheMNSqWDSeZ28c
X-Proofpoint-ORIG-GUID: dGEa7S_zG_BGBtLIabheMNSqWDSeZ28c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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

