Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D09D34EEE6
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397917; cv=none; b=NDXIw/CCTTX4uY8Cbcl4nEcwoXYQ8etjdjR0DQplA6V6dsaB0X04J1Gc2X1srFXakYfhMGPBVqmyTsgvO21RhH1lATo7mbUbH0PUMgGSFKothnYjCULidq11p98i00Hrfw+Qu0I+Wo20HGjzkKBukIXBylTLbPXNQ91Ap/jDxS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397917; c=relaxed/simple;
	bh=0gCStdfi90J1zLoNtjQkeV5b9HZ470QUaFZu2d3u/MU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QwoDN/OI3avo1IR5vIh2ZYyb6DoKtP2XLAPp/IIb7cliTWWeIUPVleUZpNLP4skUeKMQaB2pslq9ftssLHM99w8rzkOdlulQl0JqQLq1yBiD2BhhUb6hp8g5eRBPQi4Ch4kC39uIzkDCrP7U5reTgfxt1mAnVxYc9XXkUOPA/Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SyLJzQ75; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JIWkrUly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SyLJzQ75";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JIWkrUly"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tdC93843952
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1sM8vUnMjs/6i3/VG+5tMcUkWBVpAHwFVnLhbHyrhA=; b=SyLJzQ75N9vv376X
	Vm05qVy8QrVP1Lgftu2Sxg4jvLtPD+vgx2P3gp/0Lhzbjp4905e3bI/vQCfwtyVd
	ih19WTUMO+ClgasaHn456GF0uAUYCmzkjUO8Zl/+zMJC7Xx/zmawjR5Sxv+L2++I
	NK5lvzoDFxNkTs50xxf+LR3CdnM4cfrPgF3tp7FhYeHAXyv55ctNCHlut7eWOvsc
	auz3Kur0hiVvunnkAFLdc8vxwfG/SqbY+At5IAtuPXVdHiw83PyNoB+qkctdx5Rr
	EFndXyVthBIybpDb8tSnsb6gC73Tpbw+uzwUwc+PE2iObOJ6PeVVoVMs2GmqXEtV
	qHHuMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh54wm7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 10:31:55 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358df8fbd1cso2083947a91.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 03:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397914; x=1774002714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G1sM8vUnMjs/6i3/VG+5tMcUkWBVpAHwFVnLhbHyrhA=;
        b=JIWkrUly33bfkQm5sM4VmgbeEQjYUdLGtOtuRaM5aI/YdDXIRt1T2v9s65J0xMeciz
         sYSIp+nLsAILSNvT8jiCWkuL53+Hrg2fLbprA98U6q+xOz2OGTEXIO3bU8q4Q0kuclL5
         yAf4fBXDHTeT7R2F/w1NJJGApo/v8qOknutPkZOn+EPUhcDQpjBu9bM5PHk55r9sT/Ms
         LUMmoKFZwNaM7xG4beDTqS2vN+dmpim4Wr9TmB8BT6GYY+Q6EHmX6sFivnAu58SUJPd9
         Iuobv+Au2X4md65rc04WXEV9Fa3VJRmZ+xPf8uw7JMiOOmP9BEQcP2CVUNdcnWpGrcj3
         P6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397914; x=1774002714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G1sM8vUnMjs/6i3/VG+5tMcUkWBVpAHwFVnLhbHyrhA=;
        b=kJ8IaecMv0ayVcAf2BCSxvomvGZetOiVzWMbi/isiOCoY3eng9BHJ+R37s4AuoHvMo
         u0rFjjJG0X7znsktegUGhTzHgf6OTt4wJGKWXBeE73JofLojbCLolK5isTKvpgg6QSAK
         80SOvc8AOn9rmq2O/BrkP/rkmpVHoDTG39knHyCLxFZDiUZmeBeMSRrGP99hXGQfuI4s
         73QJvZzkYTXUVNDmWIkOIejinp63yRt41GcIEkVTmCOhnPYbtDm5p3p4PdHI8dh4LH4H
         9jOGaEmwa09lPYAPJw7MxFyTTMXjc0Fmbu6D16iu6uYUmRAYAQ+fx6yeqwDQu/7iZ3Rc
         EaFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuVZqXIJJcmpaAjOG8wGdSI2rs3xNS/MdLfPdVdKeB8QXqBpJuP6skOqBzljKBRxZRKfH2SymOfr9o/0IfAfah2Kak@vger.kernel.org
X-Gm-Message-State: AOJu0YyMxQtOeBaI29b5pqxHJ+fWFmDZbG1DgEKJpr/sp1YA8roy2scZ
	J/eq4QjFsLz3LiO3WDEkQaZbsXmalb/p3g+XEDjgY7jaVrJadrCHajiM0BIRam5hUNNLh0mTXRk
	uxGE2RFz4oI+bj8Pf5VkhzVweSV7LkMLMxFDapf7WOq+EbzOY26uPEOgKvAhzeSDaZ1Me084Mpo
	hf
X-Gm-Gg: ATEYQzw0ZaUn0zwJbDDxtance/CMGT3uk/anH+wuiyyI/jN5Ptx8t1EApyXVjgVIgXY
	4pmZ1kdrcwkiFjpBwlf39sLjJVkL/XIa/2gPejwQFhCv0vFZv1QoaHphP5GowoZo0PuygY29L7t
	GcxvwI3EpQ3UR7EXJPielqAmSwYyFniBelsDS+F/zyUG/g/DpQ0akMPRCqudOQx+ep9CqL6KMAY
	NXkFstCZW821AYTbNM4Ehvm1vmYOAtFzEDRVih0QBIgk7DJEMtB29F4TLIk+cGSgrblvvw8iAvV
	exOlSTSYhnZnJOzvPSN4FhqA7TQY63hPtxazoy91Hm1KY5VBylHJdIECRUp5Hh538tw1cFCjtRq
	Tq+EaTeyHgS5Lv36VzET5YP+rN8j86rIoHYp/4k7WnEERB4rGUWD+E8N0YxZ4dmaJCI+jiImD9A
	WI5BCQ3XiK4C+XsKero6p2Ef3r5Z1820pSvA==
X-Received: by 2002:a17:90b:3f85:b0:359:9083:3661 with SMTP id 98e67ed59e1d1-35a21ef110fmr2504045a91.15.1773397914398;
        Fri, 13 Mar 2026 03:31:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3f85:b0:359:9083:3661 with SMTP id 98e67ed59e1d1-35a21ef110fmr2504010a91.15.1773397913946;
        Fri, 13 Mar 2026 03:31:53 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:53 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:55 +0530
Subject: [PATCH v4 5/5] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-5-ca9d0efd62aa@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=1383;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=koKZLgJJmkvuQ2/G2ERJ69WkW+ygNkTLSWIVLY+GMAQ=;
 b=mkDfQv7TN6sC9yKQkRfX1VHj36JLzGcZfXhroqENPftWosj0joaCcUq56nrCtg65b3Ouuj9yC
 f8ZdxNRK+r9DPu+oqOGGHT8xFpnP+mvNejHvJXCyzTmLgOfj21+B5aF
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Zfs4KpXji1tyj4b0ljcPteqW9kTsQkIr
X-Authority-Analysis: v=2.4 cv=BNG+bVQG c=1 sm=1 tr=0 ts=69b3e79b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Zfs4KpXji1tyj4b0ljcPteqW9kTsQkIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfXy9qPPIp1eOP7
 ULT/8X7JRvxHQd5KZPa25xFsfhXw/XkcBO4+OJnfaQL8wQW2PH3x1yIzbBwTMvBa7kTKoPpX3M2
 ILbbbF4aBOUWF9vIOoYJU1cC58Ac5Vah6U6hXckxE/Ju3NZ1N18fw6EkOmGR2xT+owUayOTe2pw
 FRaJvXJjF6sIvgu0ZPeL7gcAGJ0TxFiG3T1twq3LBXaqS4GN4fidvHaaLbF8kty0f0BfY2mLiBB
 wfrKR2Q4I4j2c8k8rhIJkW58NEOW3iV5qcEdSmd2vHv+U8gDjctWHE7nYefzG/IJVI8xaqApMtO
 ZNiGeb+csl9D3a9L6EYUiyoXh2vtQgILE35WSt82Ggqj2TnYnjRK0rP9djmnqvUdCZA2saeQRcf
 HbC8Ttizt5GMx9lbiXnbWMlhhytJErx2+KtlEYkm+wRV4I31xH1gBXEmXtuATWCIJJmoKk9NpQ2
 urrRF2q9NUEpetlDhCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 630642baa435..b3430424a052 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -799,6 +799,16 @@ eusb6_repeater: redriver@4f {
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
@@ -1272,6 +1282,12 @@ right_tweeter: speaker@0,1 {
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

