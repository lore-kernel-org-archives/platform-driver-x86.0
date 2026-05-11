Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202239E6F0
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503473; cv=none; b=dnaB1jIBkS1COiKMT/LLfdLY77CTxX9fGExWHLbYp2ed4zwnhatg3pFTp9lyd9fT8DynVph6BAVzy2A+bjVr/A8/PA2p6M3xVd5fXtbry7Vhphrryc6XwnyDSmGiISueuCxRyrLEYyMUP/CphGZRK8EIBmETaDCPx8y1Abe1zjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503473; c=relaxed/simple;
	bh=noK88RejQ7TULAoLNVAOYJRaxyYokDYOmwAURCVno6M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SvlTSTjtsQE+Mq42eyrlKIwG/uXk3fGai7DtRdOr97SwEK3BDYPecSt0+F3WGwtSCFoI/cxEVK2dk7oWVjXbHRB9j6uNw2vatPLwYjFF8x81ULavkBjn355ft3E+zFyvUKwUTJT3Y1h9IDryrA0VQ21RhrDyZtaLyq4lfpcRPSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7/Yqea7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V6/jC0W4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7/Yqea7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V6/jC0W4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7nvlM949464
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RXe6NoXBOtmI8I4ffQqNOi
	T3eXKiCCfDhBTTD2wkPjY=; b=f7/Yqea749zusuMRugOS3hHl0X0pNYoJVNEt4R
	gK8hiBKLaDfABzgkVJ6ff/elzJSQ/4NMSKfdoUYiUJASmbrlwpPnCEDoZvDSSkaO
	pvNtRmd3I09tFVB0rnWQxY0/ynAdZ6c/6w4WJ11FzAZfPU4lFbdMivVgtsyGZRa8
	/cFW7ibYmAEosnPi6Mr983m5Bo4LPq4XV70bljU49Ic+mhWE525Jk2gxuKvKfk6H
	kHXkof2kAPmjov+0fKiXU04tRHOMFts4xOlLt9A+g1ooi12ReSy5SWbciHXe1act
	umpHRayXNTeBG4EeWbcKo4b+RcFIqv/wj1p8+e4KHy4xiKHA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e2dksm8au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:44:31 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7c485e98f8fso4317177b3.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 05:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503471; x=1779108271; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXe6NoXBOtmI8I4ffQqNOiT3eXKiCCfDhBTTD2wkPjY=;
        b=V6/jC0W4SUZJ8XOqygC/jL1tYzKbZSGHwvzIQTYhpWiXEOvctTuQfbjbeFa8QLxdwP
         se0jaTEH6QDuJ27jEjK3V/XysyaWm63YeXQcUwoI5XZm0bSFUFg8dG9uwxF4N/XswATW
         GPQZ720jh+8eJVw8jP5TDHV7T6M960LUu377yWCzkQnRFfSXF3QlxvgrChJx3xl8ef0+
         ZcpvNo7+9f83awrgS9OOTYr1WmRH+w2mJXgfYTKWy1t6P50FZpexJhntUmNY9up4jIT2
         C4NlTEzo1k2SYid18/dIc9epcACyp/GHa/rsBWwoHsUT01b26r29SvXFmdYg7mPad2c9
         NlgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503471; x=1779108271;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXe6NoXBOtmI8I4ffQqNOiT3eXKiCCfDhBTTD2wkPjY=;
        b=jk+UDM09ArV2DJuglb5vNyrvWeuyEl4CDANbg8H6Yj7tRE+9UOVkWI80Gz/E1YWzMl
         nX8NnLgKinyWs4E65b0+oudCF3s587OMOaQW0GEP3CLUYKRRqPUks4vxXqOMSOAccsI3
         zOT9FIGYLHJKb4jyUDyRSbooGW1DV295XzMiK+imZOgAWhBiNrTXEWbdKoehm4SGQvuM
         JwVmkOZK9phdJjez0XTQrqKbRJRrgWUzq6grREXLM/mQBDaLat3D/31ixOqS+QXfIyCc
         CNXO9rXxce4qRlmIP385ACq0VIGYeP0x+F5+A6sT4g/s/xrIISzkJxAJtQjDiZS/1IqV
         zSWg==
X-Forwarded-Encrypted: i=1; AFNElJ/bgecq46Rm3i3Qa0sOhUqgc4hLNsei2f3XJVqDYyuluqubfMWb3GC6QwBKIAYX8X88Bneb8nd4XrzG4A/ZHWucZPnT@vger.kernel.org
X-Gm-Message-State: AOJu0YwXLXoNkv40yZO9kiVLFCv2XyFqgaA2fvqlNcBtdbifCKcgePyo
	PWNtJONERy1J1RgYaYewzYYtSFDs0CLS0GqNQi9L3H27fj6E8kXywSTe9RB9x1PNfnt4rON4AXr
	+IiWKOz8xkGH43ZGuFmnEjiRV1avR1c0jrUK7jrjiWcyyNCUfydbrTOjTztdvjBRq4FAdIeAuGO
	M/
X-Gm-Gg: Acq92OEVrTYpsfcEcH0lSxPOeWTJCcR8jUJ5kv4n8wCIb1RWkDrmZf24EnEUi4oviQB
	Cr89dLvHYqy08tgvgsb9QdaYQLaTVKJUJGNDH9wveIhvtoCYrOTm5OFFtpwPe2Aw6LFyLAh0SY5
	R+2yhqxT/nevVSWs+PoirSYVerbWAFap/0xDgR0ec6iUr4LqHjhRg9UuGn4h3N2q+iy2NNpd1md
	g/q3yfeFkZpjALldeY0dUjems4ZYE5dUv4g30BuG0LLAaogaPI/o3C4O5LuQDsu4IqCX2JG40n7
	CMAjbjwSshLz23eym5rBX/eNrU784bgpgNrh5p6r6Ty1q/UvO18WAV8HefKzBSq3DxzLx9aBAqw
	Cp9c7wrew243F88DjNyns30VYedu+zx0mp/dDlEZzqjdjXEDFdnmnTYyOgjssZvn0x0ccs7F2Wb
	KPp32KLYVmckLVydF9EdeV2UGuN/Ku9G5mXw==
X-Received: by 2002:a05:690c:92:b0:7bd:5af0:3bed with SMTP id 00721157ae682-7c10333370amr85000647b3.21.1778503470620;
        Mon, 11 May 2026 05:44:30 -0700 (PDT)
X-Received: by 2002:a05:690c:92:b0:7bd:5af0:3bed with SMTP id 00721157ae682-7c10333370amr85000147b3.21.1778503470167;
        Mon, 11 May 2026 05:44:30 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:29 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v9 0/6] Add driver for EC found on Qualcomm reference
 devices
Date: Mon, 11 May 2026 18:13:18 +0530
Message-Id: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAObOAWoC/3XOz2oDIRAG8FcJnmtw3fFfT32P0IPoTCM0sdVWU
 sK+e91Q6B7cy8A38P1m7qxiSVjZ8+HOCrZUU7724J4OLJz99Q15ij0zKaQWs3Dcx8hjSQ0Lp1w
 4Bj6TB2NJaoiO9d5HQUq3h3l67fmc6lcuP48TDdbtnzbNvAkYiA244MG7KJCilt6/5FqPn9/+P
 eTL5dgHW+GmtpgZQapDs43TREqCVXoH0htIqhGkO+QtWmujcCRoBzJbaPiR6ZDRFoKbFIIMO5D
 9h2AM2RUSkgwgOEVmAC3L8gu0mmso4QEAAA==
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
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
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503461; l=5277;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=9i1GJWm4OIJeTC8XHqFxrwHseUOBG1giB+zkssomCkA=;
 b=/TapYJ3YwJc0t2QGxJ2qZnTHGiMLtoMYEKms609Lde9YnkRncQNldPX6I3LugBuNVAkaaNtvS
 C/ZSbYBv7VrCfsJ7lUp6RFvZ0jOrF0V1fH3njW0NGzGl23RoxxcHoBK
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX9dQ0osOzK+mA
 AQsUQRds7YPZJ4MkSswMMXW+NTpRNVXSY5pwqtseBjRsWQnmDFb9t31ViWQrSb6pbckoAX7a4/K
 DxDnZbSeeqMr2uwkGzHKORD54nZwdovT90I0cGxMLM2pP2qG9ch6EEKBqVXGGUnYAMougtnrymN
 4YBbwZm6oGgXwBzgeiOwX7DN6cRKJCd0nKmPyK7TGGe6XvBCPBRib5kJHpp0CAZmlI11URW9pAc
 kA/i7UKIAsrSIEw3fLnz7tYpQQXXZTYdVLB8cIcBsB/8YqRU9EpmFYAxEGXXMQed/BdZ6HbpmNr
 yKWk1cyuN7ub60rQABHs1XhafuGbH2/i2GlpDCO6vQ0G8hGZSZWlYm91DDF1nXZuQ82NEMA6/hi
 oJp4Rs6OttZSVX5u9OnxFjqHYdHgUjdMki+W6o5nVtjjXbGPgCjaiytHR5Sxcho1O2RvbT5f4m9
 NrrnTAM8ibD0BNkyzRQ==
X-Proofpoint-ORIG-GUID: Jd5a0U9ShkQ5veaEEAXt5NKGIgJII9ur
X-Proofpoint-GUID: Jd5a0U9ShkQ5veaEEAXt5NKGIgJII9ur
X-Authority-Analysis: v=2.4 cv=cKjQdFeN c=1 sm=1 tr=0 ts=6a01cf2f cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=iX_g8SPVEExGA-XIGasA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
Changes in v9:
  - Remove blank line between i2c call and error handling in qcom_ec_read()
  - Use explicit ternary (enable ? 1 : 0) instead of !!enable in
    qcom_ec_sci_evt_control()
  - Add trailing comma after .pm entry in i2c_driver struct
  - Link to v8: https://lore.kernel.org/r/20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com

Changes in v8:
  - Add missing linux/dev_printk.h include
  - Fix byte offset typo in EC thermal capabilities comment: 0x3 -> 0x03
  - New patch: enable EC_QCOM_HAMOA in arm64 defconfig
  - Fix suspend/resume notifications inverted: swap EC_MODERN_STANDBY_ENTER/EXIT
    so suspend sends ENTER and resume sends EXIT
  - Add depends on THERMAL to Kconfig
  - Fix MAINTAINERS binding path: qcom,hamoa-ec.yaml -> qcom,hamoa-crd-ec.yaml
  - Move Glymur EC node from glymur-crd.dts to glymur-crd.dtsi
  - Link to v7: https://lore.kernel.org/r/20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com

Changes in v7:
  - Fixed alphabetical ordering of MAINTAINERS entry.
  - Link to v6: https://lore.kernel.org/r/20260325-add-driver-for-ec-v6-0-a8e888d09f0f@oss.qualcomm.com

Changes in v6:
  - Add missing includes: <linux/bits.h>, <linux/device.h>
    and <linux/err.h>.
  - Change the thermistor_mask format specifier from %d to %x.
  - Change loop counter to unsigned int.
  - Replace snprintf() with scnprintf() for safer string handling.
  - Use sizeof(name) instead of the EC_FAN_NAME_SIZE macro directly.
  - Add missing braces.
  - Link to v5: https://lore.kernel.org/r/20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com

Changes in v5:
  - Fix subject line and commit description, drop redundant
    "bindings for".
  - Rename binding file: qcom,hamoa-ec.yaml → qcom,hamoa-crd-ec.yaml
    to match the compatible string.
  - Update $id URI to match the new filename.
  - Add <linux/interrupt.h> and <linux/slab.h> includes.
  - Switch to devm_thermal_of_cooling_device_register, remove manual
    unroll loop.
  - Ratelimit all IRQ handler log messages.
  - Promote unknown EC event log from dev_dbg to dev_notice.
  - Remove redundant error message after devm_request_threaded_irq.
  - Simplify qcom_ec_sci_evt_control, resume, and suspend using direct
    returns.
  - Add dev_warn + early return for zero fan count; driver stays loaded
    for PM notifications.
  - Fix thermistor presence bitmask documentation: 1 = present, 0 = absent.
  - Fix snprintf format specifier to %u to suppress -Wformat-truncation.
  - Remove unused cdev variable from qcom_ec_probe.
  - Fix typo: "exluding" → "excluding" in register map comments.
  - Fix capitalization: "ec" → "EC" in error messages.
  - Link to v4: https://lore.kernel.org/r/20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com

Changes in v4:
  - Fix fan count calculation to use min() instead of max() to correctly
    cap fan_cnt at EC_MAX_FAN_CNT.
  - Remove unnecessary mutex lock/unlock.
  - Disable fan debug mode on ec module removal.
  - Fix issue reported by kernel test robot.
  - Consolidate hamoa-iot-evk specific changes into hamoa-iot-evk.dts.
  - Add board-specific compatible strings as per review comments.
  - Link to v3: https://lore.kernel.org/all/20260308233646.2318676-1-sibi.sankar@oss.qualcomm.com/

Changes in v3:
  - Revamp the bindings and driver to support generic ec specification
    that works across Qualcomm Hamoa/Purwa and Glymur reference devices.
  - Add ec nodes to Hamoa/Purwa CRDs and IOT-EVKs.
  - Add ec node to Glymur CRDs.
  - Link to v2: https://lore.kernel.org/lkml/20241219200821.8328-1-maccraft123mc@gmail.com/
  - Link to v1: https://lore.kernel.org/lkml/20240927185345.3680-1-maccraft123mc@gmail.com/

---
Anvesh Jain P (1):
      arm64: defconfig: Enable Qualcomm reference device EC driver

Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 arch/arm64/configs/defconfig                       |   1 +
 drivers/platform/arm64/Kconfig                     |  13 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 451 +++++++++++++++++++++
 9 files changed, 584 insertions(+)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260309-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

