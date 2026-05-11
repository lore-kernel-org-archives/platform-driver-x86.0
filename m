Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244A39FCCD
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503509; cv=none; b=TlbSpaEeKtKFLMazn5m+hoTBErprjq+L5Otv7nkwW9gaKVdncZn/wDzKajBTFojiGiQC2/ZxXxypJNLPrfAypK81v7/zTJHGijXwTLkgDJb4w2FRuNEhAgBEtrIl5XBbiuE1P3DhIGkFN2kmlDLeA2Bja1KeaI1bV7WhIoVK9e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503509; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2XgJTr8p1XzAMfnErJcoSKZiTUF2gQSgZyjWsXcxnOn3DtF7Jw1UHVfJrpRtEzip1eIoXx6QJ1eszpE8CNI1iBO0aInProZFnu6Sbd4Pdma9dpkCfmx3oUR+E4XAJmdhJSZDZ1EUbQk0YxSsZbFj3OVgExVHWiqWE/M1BSaJwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDjNFKz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jMJVVdTF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDjNFKz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jMJVVdTF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B9I36f017280
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=nDjNFKz4YrY7G8/d
	t6ePcwklcFqSiNS6kr14CWfLVkcWk1QQj1PN43Qnc+bV5CIwtVPBDzt3e0vKIDs9
	/79dsIETCHCNYHZREPwkxNPGwJb+vhMpzgr1/KuBLUG10VEk73pmroNg3o4jnZ4i
	TpBe5OaNvAM1XnQlqmIkmNl+umd51z/jdhU0KYQVEQgtoRj2H4LI+rM/qf5uc6/3
	3AFfsiZ62LgqLVU/q0lFYYXxPZQ6WlU8uiwLJVIOhWNwQy/SNZ6PkUG3JQgawIQw
	z/vip9IVPPhSGMX2OZ00ewXYpD2GtEI8pTAB+9ZC2dwTpjJIg2YZtjYGhnboTKeM
	cGZXdg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e37xfsr42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-7bd5c267082so14507567b3.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503506; x=1779108306; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=jMJVVdTFgIHWwKLwy4ESqFOfsoKw0M6bXDbhzvgQ0Gk9KKhWTSYDfrAzp3HbILxY7e
         tWlku2+x7b2RSQU7eYiEji9pJYEa/GZmdfxHu9zxs51zchgsxfbU/cvmjXqxjkrp9oLK
         D0aTgR4X+XyPGb0olceFe3dD3NVTewb77cxN4fWHdJUtT8NPI+eE0mbcVhchqwI8BNwg
         GSW9loB+XvCdphZeo5R6ttFbHxw/+nBY/f39pVUpN+nGFHrgA0ZXbODbM9lzXxO7PINZ
         xUQXaFd3qrs5azLfges1v89HnX0YXbFPmW5JVw+PICDpWIqJtR5GLUHBokrz2i6gVQJT
         34YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503506; x=1779108306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=pWGDsKinzKUI5nnPNkJ2jFV8cUC8b155k8CbbjS1YVt4WEyPKQx5cvQmrVIip4Ht8J
         Vo9J6GP4/LGKfSqjC1+dGLa28sBZuDkmiujjHLS+4M802LvoH9NIibhFk4b+HFjhsSWM
         h6of5nB6Y7HPQoydAUSNh8vibYDR7sdYx1ZAuSm8nb4iTszZTK/teOtovwHrYgpee9E3
         VJnZEWzm63Ehh6u7K4bPP/ptGpG2NGrc62+Jdqg4BmkAiUOIlKIaXO8jaUwIw+YzZrt6
         P0SYlSC3a/qkmrR+8QVHlSN4XFKYeO8tItFtv365Xw9QTbZkvI1oEiNBYGSLx4Y2+L5K
         Zgiw==
X-Forwarded-Encrypted: i=1; AFNElJ9mYInLeZXTRDT9nM8xRNxif4jCuYrFWSYfAb4aJClyztiCGKwe7EWJEVf9Q3UnoTc8ko8lK5Vb52vUMy+Fp/wn+u+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2GooYeDinlm96s9DqkkdbeUp+HN1JyHKaDTEkbKWfL/eqWRmv
	x2SQFdjFVuMqaHxFEn98Nz6eHYRo385EfiED3pzdBik9cK9f0ReM7HGQf3rKs9b/nhZo9upgI8z
	qf5GIdFlVl1+U4To/BVDhjArui+PJWoVJzWUVxoenu7eizXvMG6qTJ+eWwftbrYUlA1ioclxRxL
	ZD
X-Gm-Gg: Acq92OErbKUcYTNatFvXjPiTto1ZO+ao8ElDZp4osQ7BrIMx3TwzZBvwGzBCW9fNL8f
	CT47QlC8q2jW06GLUxVdSaf1FvzTE5LUZ74mlHYTxTC1ABYZYDQHFoU94oQawl9pMsgXM2Bldhb
	F34Zfrl8eOKDV/7A1gEYj06K4z91hrlh16g2+2OR4/PPws06YpQBguo3Pv3ljK7OUqB7HP0xs9u
	GOsknf6OlRkCj5yyq4eMbJA8bInr9pOqSMAL2EZGM04Msnz6cugK1GddL8X0sz60TYQeR7sTd/3
	+RKJB6jYhFxete212CgGjBREaS722T1wMsWIF2EucKTGfwG0eDKRKa9agyhoam1EdmFHgvQdxik
	N5RixkaGNYjoXNlntNM/IYFz++yHaoBgVgWtGW3/YhnQvQbr0VpyvzXBjwAEHtHbhtTEa+rAnhU
	0i9YfOKbm2yXIBm9XiiNucZWV5JMROGQzBcG6WHbtZAEJH
X-Received: by 2002:a05:690c:8d08:b0:7ba:fb15:3293 with SMTP id 00721157ae682-7bdf5dc7e18mr223304677b3.18.1778503505451;
        Mon, 11 May 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:690c:8d08:b0:7ba:fb15:3293 with SMTP id 00721157ae682-7bdf5dc7e18mr223304327b3.18.1778503504929;
        Mon, 11 May 2026 05:45:04 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:45:04 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:23 +0530
Subject: [PATCH v9 5/6] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-5-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=GmUcUV5QNEdwyQE3ykhFFlHYBB28J6Z+H/Hs+RW1suQ2uI3/v1jxMef+f7BvzLpuKo8M6wlhD
 RWcu87i0AO2DW2jN3d9AGlf7LKOgBebW3fJtMAk6bVtXUo1mSg4T03v
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=TqXWQjXh c=1 sm=1 tr=0 ts=6a01cf52 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: LC3X4On-SD8G9a2z1N5G7RDGLURyn2o7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX5JxRK3h4KUHT
 8849hN39LirtkEpyvhFAb75OEnxDkelnWAk2F+xxT5Lz49l+0rngZGahwKhDfnga1V1JKefSzas
 4YgQoIPJS/0BqEK3fkJ2jRvWLUJRUuKe4qGNmUtCjR1I6Qf/nSBs/FRUwX6rncVhMTu+Tj7H5vE
 mjeOhvavvtwrG+Mm6cSf+aLR6q9W0GU+M5MuIyXAdaXEfp4jTopkhvB02l0nbj/CpYuJNjVhWFD
 gCh6ncRjb0oSLs5X3N9/6pCtgBeXKE9xDzs9YnHShNkUWMSfVwxZxWa+CEJvjFkz37L/5AxO/ea
 pRYroolIg1LVKToV+4fMrwhbwRHEPRgX5GyjEGIkItTctH5D3b0MeAIHHvif3yZTpqg+GAj1/7P
 oWfMwHEZ2P3K5B+MnqhlLSqj4yTeHV5tPPWdc5DANoW+L36LiGS5MLHGeW19HYJAeJl1E4QQNGw
 td98gStxMiq8hE//mWg==
X-Proofpoint-ORIG-GUID: LC3X4On-SD8G9a2z1N5G7RDGLURyn2o7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110141

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
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

