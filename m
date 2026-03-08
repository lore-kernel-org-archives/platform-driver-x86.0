Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E3F355F33
	for <platform-driver-x86@vger.kernel.org>; Sun,  8 Mar 2026 23:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773013020; cv=none; b=pS7ThcOcbqgCCZw02JqbXgSCWwZY6z32NFraB7gjKuSAJgm7pR7H0VYOHmWq9y67BXrN5aCCIM5H/lsq1zIa2JJUdmDLiUzhtznjDM/0fi+4ybA1Xvy/gEJqOvp4WSYK5E6/M9pfZkNBpQQ+4yCKXsEnhFTncAhhkpwCNZM4T/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773013020; c=relaxed/simple;
	bh=LsuLQU3Q6tOhLJtUMwNlj5LUpMJ6U2rs9gj3LP/mBjo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nm+CtoKnYlGM97oIrf6HQsBJ2ZczTckTrqAc9rGzCLO5GPkyQ/Jpciem8TWrbDihL8qssCKDrvMrJUdsNGdINVWURTb1aH87/yw/1lJxRcRtmejGSxgCoXOnt5yQNegBs5Hl/Drzy8+IrhutWtTG6+luUaNr17TYUWYwQF7V78M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cNHrzm85; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNIeZOkl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cNHrzm85";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNIeZOkl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628MxmF0197349
	for <platform-driver-x86@vger.kernel.org>; Sun, 8 Mar 2026 23:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hHb4wLKQHzlp9thoFi/hVKJDsXC4VdUDRw5
	11MEVH+8=; b=cNHrzm85OSODkp560Ev/5tGsWW8dfm2wd3dS/a3ALO3BqdPU9H0
	WW3N5qUGoDJMLfR9hevX0Aoa3DsSGAH1QOIcrU+7w6WbtWtxzmorymqnK9wBRTRZ
	SR1kgtgibSHEAz7zlSEu4TH66zfXxsestWjPV26lA8xhvTsJZUz7qMay5Bs1BMGb
	nZmCGDYVMLKP35UDFipvAlFTBKa5WlU6a/gt3hiRp4eZEKjnlJRMHkljVgI4Ovv8
	U33+a9hXMfvc8hptbRnpTmdK9Nsdvq1T+pQwhOfVbf8cLJQJ3L+ANJVjsMYaCoLn
	/8rgNWRfK6jmIMPP5j/JsLlorkm0ltWJtFw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vb8bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 23:36:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae4e20a414so426288495ad.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 08 Mar 2026 16:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773013017; x=1773617817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHb4wLKQHzlp9thoFi/hVKJDsXC4VdUDRw511MEVH+8=;
        b=JNIeZOkl5oZKu5Cfn1BBhG5ltYWXRiA1yXP2rz7096HlsLpdgM5IBTCS7y/DZCagZl
         cPOC0RHkad1dYJrK8wuMUxSUqhSGoPJaNSqR5GhzzZ42LXRw+eK0eq/2VM73efZSsAT4
         kiWtFOWZ9uKPaPMYQ32SWf8aQ3EIUxgyrK7CRGsr3Y00sneSqY1ZcnFhnpQDKtzKMtb0
         YAn896qoYV691jQjPp2I3nv0FBn6UvxZAgfj3sHQ2mC1E/qDlxxd/3S38A4xP3+Edo5R
         xtfuSCczP7diCcak4epnlxnno+LG3Ss8MU9x6sSlw4HZ8BSM39FcFQsBdZF94FYKyS1W
         Kaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773013017; x=1773617817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHb4wLKQHzlp9thoFi/hVKJDsXC4VdUDRw511MEVH+8=;
        b=Cwpoisw6onRE95BwaiVDQaATsgGyCMPyRHWco/1MrCEIWF0xF2vLM/W30ZpYkmfLLq
         WFCSanXnkWYj8OOhURIWrJszd83dF1TRa/6FL4j8b54aRLxvHn0iR87Kim13acmTjhGE
         8XA7YgI5gWf9n3I5lP+sTaLFbJ4vDFdc1JcSdvl5VskPxUG2U9eImi0UTTjYr9/X9+Dh
         mivHWqgH84U2/1ynyzyP4Qq9yLwwn0Ydk1pVfq4Q928t5cWznC782IuE7pIBoOwf0N07
         8Hu2Yg0p8EcJwHNxPbgPbXTdf2/qxQX22Gd7rEOhDPyGY467oPsPdz668Ph6YAyGa312
         kUNg==
X-Forwarded-Encrypted: i=1; AJvYcCW11OtKfMncswQIw6YolJXCAs3okGg/V/bk2nRH61aYrdaT76wGtZs86BEUFA9slEaOesfnbxqPm0izGafthJZmeFyS@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWUqBw8ANvSjpH9KYahTpCmV1jVBgBsTPMN87pqzMeimKplhW
	hqmwVUedYDKTBhWCXVEwZg7jHvUWycB9v+eheWbkG3Ts3ND41HoyZRcuSZXz2BzkpZB6uDhCkNS
	U/0RMOv0hKkiBLy+nmsZ4KI6BuGziH79CnoZoRUqp5HLH3oCt6X3itkGuOflFrQ9F12AQNP+uk6
	xX
X-Gm-Gg: ATEYQzzpp+rKj7OS/+OfjwsCyryoQbesAnU6silSXPFyezHoqCBQ/WJ7S1pkcH9nfB6
	Hlv7T1xIRLziri4oOlbEpYMHI9qNRS8GV9an6wvkgFUAIHXK8fgnc9jdyxJ5Y5MLUYkOeMQrkWQ
	CrmOI3z4Y9S43KTQOzcMrSgDhjWREBX79DP9WdyD7NXWN9Jf5MlG1Nrk8vv8v8mFQDf3FPU1Zm/
	8v6jgjeQ4suTIdI7o3IUCHdLmeeCwPp6ov2EviisUA1j3lf8AJuqkJfuapolc6IHAcu4hRMzJMF
	HrdOqsfwd9g/Rke1Gpt4EIySHSE9yBodoT8hnibX71pn7N1uapn4Xr1nitiN25H8qZpvpvfScv2
	GKpa7Tfo2dHChYdaDQcrKQARe8XCM0RrS26XqGTST8umfXz6x4tnajhs5NzrZMHJUN7khViKyLm
	7yFaJUPzPVbreo/9m5MY/oA+nfvaEHC7p4pjdT
X-Received: by 2002:a17:903:334c:b0:2ae:5671:7074 with SMTP id d9443c01a7336-2ae82386d2bmr63833225ad.15.1773013017235;
        Sun, 08 Mar 2026 16:36:57 -0700 (PDT)
X-Received: by 2002:a17:903:334c:b0:2ae:5671:7074 with SMTP id d9443c01a7336-2ae82386d2bmr63833065ad.15.1773013016779;
        Sun, 08 Mar 2026 16:36:56 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e9ad26sm114274845ad.28.2026.03.08.16.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 16:36:56 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, bryan.odonoghue@linaro.org,
        ilpo.jarvinen@linux.intel.com, hansg@kernel.org
Cc: conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH V3 0/5] Add driver for EC found on Qualcomm reference devices
Date: Mon,  9 Mar 2026 05:06:41 +0530
Message-Id: <20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AZHu43oRtarXnxKCAz7RQrrNCO9HuhVg
X-Proofpoint-GUID: AZHu43oRtarXnxKCAz7RQrrNCO9HuhVg
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ae081a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=T5_SIA_r1xWFi_hSMU8A:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDIxOCBTYWx0ZWRfX19NSqnIVcmRm
 4mLeJPoWZ2Y8wCXzD3DfPzy/bPvh+vqVxRL85IuWPu0ehZNKeclYyPevwj1OLvpArsOsI0yLfmm
 vMoGUTwl/OjjkBKmq59XbNCIoeP2K32pE65qJNireTPc90A1698r4Um+d88EKljIeQQxI2Jxcrc
 bIH0erBeFPTxSSukqKU0PpQQNhfdPyb1Aw8ZqvEBXd1ogPDGQG/XV1Xc+0qWlaumCdcWnGtU6V0
 FASwI8pwNJ9AfoBQwP45RI44TXTCAECpwpQp8z7vG2XdL1oobwUMx82pv4naQsh8vsHm5CYnOZ9
 EfsyFx1iJ69fuuU7QdrcGGeV7NwjX/S1sTQg9A8VoDSn+ocT0NkEYutzuNFWAU7ax1p/saivMHE
 eQzSwRchrFEHDaESOO+1H5aOzdE+zD14P7wf6GQlDC9XbsLnTPwi8MbcxFE5XRzeapolpLVz8hc
 cDrzTdyl9Ta1ZSM2ARA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_07,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080218

From: Sibi Sankar <quic_sibis@quicinc.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards, which run on IT8987 and Nuvoton MCUs respectively. It
handles fan control, temperature sensors, access to EC state changes and
supports reporting suspend entry/exit to the EC.

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

Maya Matuszczyk (1):
  dt-bindings: embedded-controller: Add EC bindings for Qualcomm
    reference devices

Sibi Sankar (4):
  platform: arm64: Add driver for EC found on Qualcomm reference devices
  arm64: dts: qcom: glymur-crd: Add Embedded controller node
  arm64: dts: qcom: x1-crd: Add Embedded controller node
  arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-ec.yaml    |  52 ++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts       |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts    |  10 +
 arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi   |   6 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi          |  16 +
 drivers/platform/arm64/Kconfig                |  12 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c        | 462 ++++++++++++++++++
 9 files changed, 588 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-ec.yaml
 create mode 100644 drivers/platform/arm64/qcom-hamoa-ec.c


base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
-- 
2.34.1

