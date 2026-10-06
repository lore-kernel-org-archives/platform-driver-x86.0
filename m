Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B750F3D953F
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 09:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280236; cv=none; b=TVpd735c/eZFSFoL1GKkITDjjcxkXRrvxB2oE3UhS9nBB9lQ4LoDZMuMdVqcwwkcQmrDwKQAml2BTLjt7IWIlWP8dlb/RFwuGk17VWE/GPjlbSOLv4SmMqVyA+oICtSf+8kElL5PjBiXO1wnVlXXpMxxCAwgQRKefGT1yV75yi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280236; c=relaxed/simple;
	bh=vBESHexR1XlckAAiOTO635W5zfqoyXyDw+1NzmtYhMc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=I8WF3LSnB/sADoBd49UGtgVH28RzGPmsPrambTmUEEWnR1DiXg3Mn4kR59C1rRCvP/fHLkatGN7E5lqj/4H97+iFZNzmiGSzslkE5YRJ6ft99gGsF88v1/nMRb8Z5uIWrVp2WSvSVHOfAplg87gT2i0oXnbp3lYJ/KJ8jXh2a0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1FN5KEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bNML1oMh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1FN5KEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bNML1oMh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eDDh2834142
	for <platform-driver-x86@vger.kernel.org>; Tue, 6 Oct 2026 09:50:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T9oEOBEBhJUjWH2nQll9Zu
	PtpcYhVcGfQm4EXIdM0IQ=; b=R1FN5KEEE30nDMwDoKFKY4GCY7QjCNhKdTQQ0s
	9j/40Zv44klyD9Ou1fKZYui7D79nOAdvoAc/DP262XEFdmpJTxefmynWZhYHs9ju
	56rgil2zyRuyoEdK+Nyf94iLTiag2U2BIEEnaWQeTDuJPshh8yqSupbNZdjfjekS
	DHdHkyzME4DyIQ8gQty0U3c45zTvNt6gsS1HpTQZOvm5IqIyWJYJCeUP4hBB7vWo
	TUEN3mQ1S4NulnHSqIc3UKS7PMSSFg7te4eEartGUq0XlXyDKJb8DSKhMbmilwh1
	p7JqClcK/Nn/Qe9P72eJwdGeNH+jr04eQ9ci+gPnS4PUU5jQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4dnckwtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 09:50:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbe77d6864dso2740327a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 02:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280233; x=1791885033; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9oEOBEBhJUjWH2nQll9ZuPtpcYhVcGfQm4EXIdM0IQ=;
        b=bNML1oMhn5yfJwwNAiXhK69hInRhOjD6ysXgf5TfhTbyUelU0jCtMzBQo8ggwlLhhG
         kmZGEk+rIjZFprvqwlS6sUm6UUmRRLefh8CEUt+/3sT7nQWGuSryKq1ZcoJbTt176yRR
         c42CaWc5K9XdGn+9xj4b6crBMkNTtiIGfGiTmteFDXaatdRmidoSvO7AOFHE1jhFqt1i
         tV5R+KUL/NkiUaS5BFN0oVeo3n+t2SQEfWMKbkaBKzUxYrY3fmKyjONdoEMSGhUpZtUq
         OcHNmBjB5UkrZK+P5MnUGAI+amf4zcighx5OsXUQzEDH83cYDxEoY7GqOr0jeo9DP5gt
         CAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280233; x=1791885033;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T9oEOBEBhJUjWH2nQll9ZuPtpcYhVcGfQm4EXIdM0IQ=;
        b=1QfyVpEpW1twQc5hgpEnP21QY1gAgl0K0MrnFXGEEwngccnWRKs7Jzlg6G20wA4TU1
         TeqVH7d6I9QjhfJLXEcUvqJKXQmoGVJkVsiQQ9kiWE8M+Q4gdWUhG+SaHy+VwCIlrKLp
         bdoSYxJDsSsty1ulAe8pH0TXDQsOdpoyL6ojDTKz/mkPkRT18LUepY9ddW9JCoz3XM5C
         ZhgXsRUKZGg7e/s39oLSGRhzk5Zhw2rt8lL4+iqu2VJpryWbPl9wZXk1DlFJXg0oewXG
         bPDrGDRoLJgvb7BOqnbA18DHv0vPcAyS2HhYi/adFNfgLXJJmlk3ycEiSkOTREbZBMnQ
         lyQg==
X-Forwarded-Encrypted: i=1; AKwUvBynncCXsXHKDj9ohvVUek8I0SspISk5ieZJiiLkMaCLpGM5cTQlMAp3V08iJYnkNlL6ciEWFdVu4PLJ+8ucDAL3W2l4@vger.kernel.org
X-Gm-Message-State: AFuF++kw65KqKJkGRWhMNmgYRguI/79N3L/0p5ldfbhBvvAIbsDOOqxD
	A9XXvBrIzvsMAe2cLSbzJWfozUTqeGktOerWre9AZmzYGfWQiIvy+2HEOyil0tRo2QYEMu1uiBp
	ULPjLsnNAiD2oPTeQlAZYkZ+d9iKwNDaTdD9GKm2t5VGwOzra96BswUdnI3oR11tDi5q5n+glCz
	+L
X-Gm-Gg: AYBFou0QqlnfvPCLnBN9kQm/9Fkr9D6nm2/zsGawk+XiJikJjiq7EWo+ZC97s4ATRMn
	c01wPktafw0bM1YLV6YFohgJOU13Kf+9DwSrTWSHQi895rraIZ8nuQiHT+DR/IT6MZfb+c4maqm
	H8QBkDGcUpVh7p8116E1hThHMJfQYL28NBWfu90MHMr8DksKrRsElCdN9bA3KrcDktHizDpsPr3
	JuijI/NdWTnzw7FfvzVQrWl4kvbrp4NVHHGltpRhGHkXpSq307tdcZhbnNseanCEy50fAFqa5Zt
	yoC2ohuxkAzBw+a/I0PxFdmnIt8UN5jpG8gtgQJNMZ5JcbCbldgNNRLq3jo+KC5Bw2N6lq38ueY
	ANrzggmrvpeGO9myVO2GpMcaCKhuULGfPb/DtoQqZAtyFe2Z1aL2YG6gJgdt48TKG
X-Received: by 2002:a05:6a21:495:b0:3e0:c961:b5bb with SMTP id adf61e73a8af0-3e0d6baccdfmr8945956637.66.1791280233268;
        Tue, 06 Oct 2026 02:50:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:495:b0:3e0:c961:b5bb with SMTP id adf61e73a8af0-3e0d6baccdfmr8945928637.66.1791280232685;
        Tue, 06 Oct 2026 02:50:32 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:32 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH 0/5] arm64: dts: qcom: Add Microsoft Surface Laptop 8th
 Edition
Date: Tue, 06 Oct 2026 02:50:26 -0700
Message-Id: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLExGoC/yXMQQqDQAxA0atI1g3EUQR7ldJFOkaNtDpMnCKId
 3dsl2/x/w4mUcXgXuwQ5aumy5xR3grwI8+DoHbZ4Mg11FaEHx4To6XYsxd8c1iXgMTSdK4uW1c
 T5DRE6XX7bR/Pvy29JvHr9YLjOAFUIl2heAAAAA==
X-Change-ID: 20260930-mahua-surface-laptop-0ae6d2419240
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=1985;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=vBESHexR1XlckAAiOTO635W5zfqoyXyDw+1NzmtYhMc=;
 b=MpjB7a8GEPa+bcf+sqbcNhELpb0WjJ6AVsq1tEC4UAa4FYFSazy2XGawD33zmxlL91PNp71EB
 RgnGVVJjUHRDSkVNiufFUiVVG5dYJD2zlInZ5ronm/jz+Ile7EfYQWt
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX1LXawMZ0CDfG
 nSGr4YG0F/h0yew6REIVc62ysR+2aPJZZJM+/RO9oHChI6IR2/r4nj1m5Pl9wCjrhr+YkFsV/3I
 8TzLbws3aKlvAL+mkSrnPk2fpBwXQYU=
X-Authority-Analysis: v=2.4 cv=Vdxir1p9 c=1 sm=1 tr=0 ts=6ac4c46a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6qiGk_Zo5UkJWkwZqDsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: sN7QPKhmpCMFzXdGwPEulxQV24Lwmrq0
X-Proofpoint-ORIG-GUID: sN7QPKhmpCMFzXdGwPEulxQV24Lwmrq0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXz7lrWK4ZKR7U
 k+jvBtAZMDjdgExjmMteWETU5HAi5zpzsh2a32yGe9tmfe/flXlukIvHJIzy8g9GCJkc52sdNee
 kPj2Wol60V0o9Y2S4sbFh9OECvLiHSg5XsRHBGKUniKMO5Hk239us40hbSeSL/BF1fGrh8I+rYk
 s+ca6x1p2HjkuU4deV4oA8vMCl9b930X/d9zW08Hdj8rGNcZm4QK7vZ97YgKJt5CTMrlKTzLUyF
 6kFFiskcFrOUcbpyenSIhjpO5qLKOBh49q8VNXtPF2QF5n3P+s61dWDUTqK8qciiQtGXdchWjF6
 aeknMM6v8lvK39ggLw+nXWBvjYRc2+BFIHHyRiDKRQ5BIWlZvavSHKnTjWzyNEk/zrALK2iXYr7
 snCVsbaSm0DvY6tiwtxjcw6Lj8TUOJRrSR3mlDr7HARPlXLrGLDbVTq7q8tddwX7mMwF11HiTzN
 u59bquVl3OiwYY+mjMw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

This series adds initial support for the Microsoft Surface Laptop 13.8"
8th Edition. It's built on Mahua, the 12-core variant of Glymur with
cluster2 fused off.

As on the Surface Laptop 7, the keyboard, fan and platform profile are
handled by the Surface Aggregator Module over UART. The rest of the
board is close to the Qualcomm reference design.

With this series the laptop boots to a desktop with rootfs on NVMe.

Features enabled in this series:
1. Internal eDP panel
2. Speakers (2x WSA8845) and DMICs
3. USB-C host and charging on both ports
4. USB multiport controller behind two PTN3222 eUSB2 redrivers
5. Wi-Fi and Bluetooth (WCN7850)
6. NVMe
7. Keyboard, fan and platform profile via SAM
8. HID-over-I2C touchpad and touchscreen
9. Lid switch
10. UEFI variables and RTC via QSEECOM

The QSEECOM, SAM registry, and panel patches add independent support for
the board or panel and can be merged separately from the DT patches.

---
Gopikrishna Garmidi (5):
      dt-bindings: arm: qcom: Document Microsoft Surface Laptop 8th Edition
      firmware: qcom: scm: Allow QSEECOM on Surface Laptop 8th Edition
      platform/surface: aggregator_registry: Add Surface Laptop 8th Edition
      drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop 8th Ed.)
      arm64: dts: qcom: Add Microsoft Surface Laptop 8th Edition

 Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 .../qcom/mahua-microsoft-surface-laptop-8-13in.dts | 1180 ++++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c                   |    1 +
 drivers/gpu/drm/panel/panel-edp.c                  |    1 +
 .../platform/surface/surface_aggregator_registry.c |    2 +
 6 files changed, 1186 insertions(+)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20260930-mahua-surface-laptop-0ae6d2419240

Best regards,
--  
Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

