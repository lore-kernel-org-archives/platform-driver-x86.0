Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E966B3AB46F
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577431; cv=none; b=lpVI6X+78f1K9TamuH7I653CIiAV6/KgkdKNUOz6kNAKTMILDxVoIEZzwuu6+QnGVMCC54gFo5ioM0KQS1rQfCPD8vjfezNVVeZv3SdeJEI7xaVNz25c77Xf5MEFgmNezsMglWTu2fRlVGYwQ3Pz4rpVw7aAb59kpEkKlsedODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577431; c=relaxed/simple;
	bh=pi1nlOfbuXTW23fGZQRxlzqvgo2FgPdrsa/z5teMeKk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VAf2dInt1OkUnPRV28mfzftCVQh0W/iPCYxWQhPCyuz3yt0U4rYGzB010Ffi4lPn8/Qs08uqLlpgH/frhqRfME2lT7iYyEpskUM2qvyUx+Mg+piokhCEj70N6W+hpGJa7km+cZOYSZihe10CSFFEttCRhoclGmFWkAlzhFuGz2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TSt6ytxJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PPff8qH1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TSt6ytxJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PPff8qH1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S5XVCs1666650
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Zjq6w9GGoU/fBAsCOTHHUE
	zVoBXixqvy2upUbVg/rdA=; b=TSt6ytxJtsgSxHZr0nUyDUgfG/0XmNvqmGdsC4
	UYT97kPP+nMggr4PpYgUmG5fvt7tCoOX+iPlqXRzYJ3CFJBZ7WRZ7kQLf7/vjRX3
	Iue0ALNL6l6NCxtW6mhpDBkynItafrKGjC5UtDRAg/1w9WiZPPQpRAcR9aLkAyEM
	uAjl6VzUGOHY2q0ULwvIW5I8T6GkqTVHf3TuUA4DKL42BJ28RMVI1cnJN29PHVU0
	BK6lUPUC5tTuY9v6GqtsPt8kbmMW0QTQkQACp0ANXaSPJnp0k3vGGUWYerRFpGpf
	YlhCSQp5sCFpLkvp/MiDfGblYCp9u0NtGb9QuCPTvNznsyVw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyj6t06hd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Sep 2026 06:37:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd8920c132so39922835ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Sep 2026 23:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790577428; x=1791182228; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zjq6w9GGoU/fBAsCOTHHUEzVoBXixqvy2upUbVg/rdA=;
        b=PPff8qH11/LbTeSLL7xTgD/RLddbamy8g7yMxternD2EgVD1abScVoDaqzejIP0JD8
         pNqVtX/M+mWmJog3+GVqiNl3W+bckowIfIItZ7bhmaUUYcV4be1PZkzzDXpLKXWWDe05
         jaLti2AhZo1Gp2xkCH7bw3kGQQOC1sSwyMil4utrTvyr1ue6rj6uaygyq3gKHIHdpeca
         4E3JqE6P9PuyFJgLQ4y/dSGvJwFzOCzsKIjmtfWRi1ZskptHYJg9w7NcgdSk5BvtR9nG
         6e+4SkHSPg/Jf5S+PPN6sxlW4flG0vQQktIB1DYS/AH16Qy4aD9pHG7ubVPIU/E9pyJW
         fC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790577428; x=1791182228;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Zjq6w9GGoU/fBAsCOTHHUEzVoBXixqvy2upUbVg/rdA=;
        b=Wra9alYiK9KcrDhOALkp2uU8IJYvAUjAZA1WBG3IcXTQKO8iwQln6th3rB0JuHME45
         dfUUYsTT7VTm/abatw5pukQcNqotWYBTfAoTfw5Ihnzfyl8g9Kf3erBKpOUfmT3R6mcE
         Ov74kJiQQ6xUW2g4aKEcJpyX4qBkAKBAu1X4dfHPgD0DPxOWlgUK83HLQZIxiEPYkPU4
         GT0uUqbJLudlzJZmc/8fI4H9WOAfSrHBCG+FBs2+O6h2ffqKAQT0o0MAXeAMrC8uq+z8
         +dqLA/oyWpWDmsUS0rXIRI/UW0lkyE94vaERYPBbGUsr8136Q+toWaME9K8KgqjLznq5
         KWzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNJpWXaBSo6SvM4xmN6YRCYZb7q2YK5NQbut0iMhjSZf0OwBulB2JhVVnsWHE5seX+BNfr5/dsPaGJyA3U5FyoB8Un@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6gbE2+fgrFqB7Mo3FUpdBeL1EgRHjZ1D2q7Yy1XlwORabea56
	uzL2EwZnJdeyrg869GEBwhlgpnZwZ0cCCr77AvMpEsmKAbyQ7C6LyxTJ7DFs8BxW2uo4rqa/kvA
	8IVrP8tKyMNM5WG2ALdKQF71kLL7IzTnkr5bFyRp/TuBxIp7jkEn04sMQO2ioIifLIva+oR57C3
	6R
X-Gm-Gg: AYBFou3gqB1qA378ubUwzc3aUNNfuA3riA4Y4mO+oETWcxXpGPIs69q9Y0ao5CauX5Y
	mHImOR4adDnEj+1ga/euysQlYC60Ce+bTK5XxnZgFqvj3CGXZKB0T0O11boyqeHnE8CBOkFgrSD
	49IMs4obIcesKylknP0d54X8ij9od0gq9Rr2njifIU60ZSLlOQbTm5HwdEwCx0VNl+c5300z6i6
	m8rbuQA1e/otC/Q+hQKYfOt5rvd1YMpKj0Psc/csxw77HMT0cSOAJ8IVc0QQodugrmr2KQL294C
	r4IHyvWf+shbNIibXlkSyZH1qRPFwX8G6icIxRGD3l7VFsiECv67PvY19PgARZFCJ7MaoBXQxfN
	uawxu9k3csyCr8CODFPhZadF/0dORhHtMo5nZqtEm25Hc2nW30V+R/KGWbrlAUfmYxToDacnMgr
	nTLP15eoIVxiSr
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr51326555ad.13.1790577428442;
        Sun, 27 Sep 2026 23:37:08 -0700 (PDT)
X-Received: by 2002:a17:902:e94f:b0:2df:a4a0:6443 with SMTP id d9443c01a7336-2dfa4a06479mr51326295ad.13.1790577428009;
        Sun, 27 Sep 2026 23:37:08 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91468978sm35292685ad.79.2026.09.27.23.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 23:37:06 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH 0/3] platform: arm64: qcom-hamoa-ec: Add thermistor support
Date: Mon, 28 Sep 2026 12:06:36 +0530
Message-Id: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPQKumoC/yXMQQqDMBBA0avIrA04qYr2KiJS47SOUBNmYimId
 ze2y7f4fwclYVK4ZzsIfVjZrwmYZ+Dmx/oiw1My2MLWRYtoyA1xJnmzRi+DbiF4iaZCa9uqnsr
 mhpDaIPTk7+/b9X/rNi7k4jWD4zgB/IQRhnkAAAA=
X-Change-ID: 20260911-ec_thermistor_support-5122956d4831
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790577422; l=1079;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pi1nlOfbuXTW23fGZQRxlzqvgo2FgPdrsa/z5teMeKk=;
 b=wQNlfIQGWtf4zsEMBtI6agJA7H/7dv9y+dq3sVQzxsWm8kRyduGfTiuKVfqkBLF48YKB+oIMb
 mrJRycGCx4JDoulXK6zbF16OixmBtd8PQUiFQXfYo8USVLVTMfQWvnn
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfXwRjLRkwtq/ta
 vI7EEY14ycffW7yvUUl3R7yDTeas5HlOJPyQFwP+eMG/EiLn3R1Tt+HCoulVoMY/Qg0wXdLSQal
 T4PV7feDe+dSY1In06+doTtbAtbKupe07/NmTAWOFxbS8W3kR5ilRnLnqnHWuuF1pEjdRjfGD44
 UqcGx0mZcTyrnHIuKCAbMTDYkMLfpygIqUwm6UWgDT7m9SksM5oMvmp7tZEwJxosTH7If5reIbw
 OkAcWieCwZxhDQR7FGab4s/jhXfmgt5BK9SZPPYWw7nflB7ykt1xURpqLG7Wy27AWhoKLG7u9Ps
 9Jl79zONBvkkdOAL+LRjVvJyLTRVGsSTXGPGrJFAUNWkyBP/plhG4wSKeYYBIa6pU3IOyYb6kd0
 6vmHO+vRfD/Q8Bn+tMzVgYcd+WfLj+aQ03RVhkUrSL/448fdcqzOCjYjYCpaodq3NHm/cDD53OU
 RJI0bnwzTY0YvtGJ0qg==
X-Proofpoint-ORIG-GUID: 8rnintwNKsjs-zNuZAwKeyoCqELZU68_
X-Authority-Analysis: v=2.4 cv=dZkVTnXe c=1 sm=1 tr=0 ts=6aba0b15 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8uFsmxiYqSYk2WIGYwQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 8rnintwNKsjs-zNuZAwKeyoCqELZU68_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyNiBTYWx0ZWRfX3Wyo1cVdhqWA
 m70EH6EWVoXboI50J8/o6VQdDlRDOMzj/ayY9RsxDysRK/92JjgmW3ue4sqUxff74epXdaKLmGY
 2sivJnsLUyEEYxqwOXlJXHG8iPO3AGE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280026

The Qualcomm Hamoa/Glymur embedded controller hosts multiple onboard
thermistors. This series registers the available thermistors with the
thermal framework and exposes them as thermal sensors, with the EC described
as a thermal-sensor provider for Glymur SoCs.

The series also adds the EC thermal-sensor references and corresponding back
cover, keyboard and SoC thermal zones to the Glymur CRD.

---
Anvesh Jain P (3):
      dt-bindings: embedded-controller: qcom,hamoa-crd-ec: Add thermal sensors
      platform: arm64: qcom-hamoa-ec: Add thermistor sensors
      arm64: dts: qcom: glymur: Add EC thermal zones

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 12 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           | 45 ++++++++++++-
 drivers/platform/arm64/qcom-hamoa-ec.c             | 74 ++++++++++++++++++++++
 3 files changed, 130 insertions(+), 1 deletion(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260911-ec_thermistor_support-5122956d4831

Best regards,
--  
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

