Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBCB3C198E
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750516; cv=none; b=kqvnLmWbYcCxFFCA5ZxCo1rC1z2Y1PgcZrkVgH8GAgY5zVLq47WOGPxa123c+Ees+7/iokAcqiuDR2SZP+HsEPhN666afYTj83boe2seLiJa+9srtprh08oZMtLmo8dzCbUxLuPYDe8p2KPZnIhCdruSjgLezyq33Qnm6I1Afcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750516; c=relaxed/simple;
	bh=G6xUZS6rI6v6FuqUgHM7RyAVAD+MtE0kqzjRqfU6VR8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PEdLzgyPd5IFDemow/N6/ILRhrZ+13YcwdJ93ec5DeJw1cdCA1RgxNuNukHyjbP4fOBp8lZs5J/zacxJAIkCCG/R1Yh/sF3bK/cmpwLR5VY2+dLaIn0PSJbROVGHILRL8mWYfow9o+q1TRUxiSrL4t+WdljvQL4BQDgonOb01mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fiT4GcsB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R07Sr0ZJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fiT4GcsB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R07Sr0ZJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H8sit02314590
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2nTUiJW9SzW2O8XA+4e3N3
	O9Mr9gS+1kCq9dHbVs/GY=; b=fiT4GcsB+HdkaWtLGFOeNYBMkba/kryPhvHNYM
	ir3PyIfCddBhYu3OAnaWuxTviD/g2acvBKMvV5IUMkSGA2ha5liJrlWCW5YrtE0m
	ZB4ECC+MHmacr3m6mxQxVMdz1JN5GFOscrtD3qCJONjwxN+kbTQHPtj+umED3LFi
	jGNxOvrG0LSDk/h1JetMd9inskGx7dqgXxDZiTppakU1km1wBhLPmwxNK2ZBSe6K
	Yv4DH8rzlxu7fNJD3RseexEBxpoz0zHW8zCjX3waad5yuBZxZ5L+ca086g5qNBfR
	zBVkSe1BZuUarVv2Z9qKE2HdTTqfoaN+jE3EfcJWE0Wi8KdA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxmf2btks-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 12:28:32 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso29991213a12.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 05:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750512; x=1774355312; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2nTUiJW9SzW2O8XA+4e3N3O9Mr9gS+1kCq9dHbVs/GY=;
        b=R07Sr0ZJlcESSTVR4h6kgB/PqkjH9lYcJBu2+tXBcGnhj6nlCfG+Rz9y2cQ4lPzc5l
         4yxJ+zhewM3rSbJq7sc9ZTdA9YFozJGiiilVlc50PJ2j0do/cQjbArvb3q+jl239QSWx
         mz02B+yQpq7N0hPpHDMOiMDULFeY3LOldKaON5mHV9HRoMiXxo55MFtHES6efzABcjvR
         2UJZOZudodphv9NOUujpM/ZemZJh9aj8fhfFAEAPl5bN4hwz0wPXQFglRwm6wGsK8J8T
         9/rqywbS0Wrrc5iIaKOvLIPTVwKFVDTF0QCbdnlt8uUp1Iqugcg5jXIDJg1pkEhzDyJf
         J1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750512; x=1774355312;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nTUiJW9SzW2O8XA+4e3N3O9Mr9gS+1kCq9dHbVs/GY=;
        b=j9lFY1AsVkOa7FKtLbmxO6o0J8AAmK8t32q2sUN3nLZosOz6VC7KcBu+54BMgA5/9E
         JREGFsuoiNk+UZJfFyjmMIc3DDmdLDBYhyUzViJhlu0qKM5+yec71M6H4s23FA61/Ap7
         MmGGgDoLl0+uXQuTCvyoGuUAaURjEC+KChdRT6itcTEpI4jj2dqgEUIV9Pk/3WIZcyMO
         njkYIx0ThOOvbT5kjmO5X5mR2rHS22kQTxYSM00i5rJqCj3v7NFCU5NrmV6dCcO689m3
         IYB5IILfArKeFOh2wT/u8RUj0PsbvMjW+apQ+JE5Zh53go3RccZdZvKH2/bCFU9aW+cn
         iouQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG7z9q5BPESHZBxyworoSooDtTg4vZgrOlqoxRqRcxgyGyHLzXSl/3m/b6elOGj2m89okqLjBYEMZu9PwgloSfeY19@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkKNP1lLxCtO00Dl2BadimECx52cUrwsuX2+Y5x80VJSxz1b6
	DJOqPL5hNwIoV4d8OYWGa0StjOz6z8mRyrSDwGkkBpQMEZQnzHZO26kdDHsk5uSPjR92/vrZEPN
	qE8b9fWICh+PYImKj0dmzmsGKo0naciZT8IYFc+4DbBNJJnxlHeorE6NmbcOLE8ZCCSm+FW5N+T
	L4
X-Gm-Gg: ATEYQzwM4nH9mnvJH7JnTTFT9LJcGB6d/QQj2iU61UZcTTOiR/EP1V4IMYjbSuAgdry
	ARcmM0JVeMmbRAk67VdVMC9ZsVKNIAB+QAXRNkwg9ADK3kvl+wayD5ypKxIoNKnY9yS+ZQf4QQV
	mCmx42xYatLvQ7GU2mEQwputfIP4EPNG2jtlnq81stlDKVg/nbnuI0nNl5isZF0afo3j13Fwl0Z
	uEZr3zgXb5EccTNhpw8J9CJiIg9RgTm2xhRMkxtemffAMn3zl+VkKy/gi9HgX7mHQchdS1V/wED
	W7GVzFoM3a0IVmplDNldu5/TIwDrzcloOREkxGgUykBqhJPydpL3O2ZWOy5S+yAHDMkh5AlcUTY
	JxjGzwa9J/hVy3An+41ALO8wL2exsnyz64nNQTzqjrwA0KcDP8vSoPyLlX6btIyPT7eXyha5Dam
	tn7fy5JZYygedJgfcL9dcJFwJSsyUEVAeuaA==
X-Received: by 2002:a05:6a00:b4b:b0:823:998:95b0 with SMTP id d2e1a72fcca58-82a19898788mr15666641b3a.35.1773750512020;
        Tue, 17 Mar 2026 05:28:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:b4b:b0:823:998:95b0 with SMTP id d2e1a72fcca58-82a19898788mr15666604b3a.35.1773750511390;
        Tue, 17 Mar 2026 05:28:31 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:30 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Subject: [PATCH v5 0/5] Add driver for EC found on Qualcomm reference
 devices
Date: Tue, 17 Mar 2026 17:57:54 +0530
Message-Id: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMpIuWkC/22NwQrCMBBEf6Xs2S0xjdV68j+khyXZ2IBtdKNBK
 f13Y/HoZeANzJsZEkvgBMdqBuEcUohTgd2mAjvQdGEMrjBopVvVqA7JOXQSMgv6KMgWG09mf/C
 6Na6DsrsJ+/Banee+8BDSI8p7vcjm2/5s2wazMn+M2aBCS51T7F2riU4xpfr+pKuN41iXgH5Zl
 g+29Sm+vQAAAA==
X-Change-ID: 20260309-add-driver-for-ec-3fa478f264d9
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
        Maya Matuszczyk <maccraft123mc@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750505; l=3502;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=y15SO9dBVhioyN+ktx9Ibw3OH/3fAXn4C710C4vRsuA=;
 b=3iqvdsebhRKC87XO+CHZH2pjwO4/OaZicF1Nno7202rEFac05uX8fxehNvuMYLj/tqzsVZbNL
 PjrR2hugcCOD0KaVDri05et9mzemkT9z0Soaoq38Dx8aaUU/ZBsbLzz
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: r7DYhgaspWH3uSL5HjZG_u2g_61PCpa-
X-Proofpoint-GUID: r7DYhgaspWH3uSL5HjZG_u2g_61PCpa-
X-Authority-Analysis: v=2.4 cv=FvcIPmrq c=1 sm=1 tr=0 ts=69b948f1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Ri_lbDodsUoyWFYh5ukA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX9LP8c3xOffKG
 aYkk+ds9vn4tWlcTXi0qWPLLtHmif5+hGodhFcnVdN/Qjwqht+jBq7+32coNQClKbanDXYs9AUG
 UJzfJ3w44rr1aRjdZEaxrTc5M3RRUvq4W42jQtU0L6b3C1R1zQa6VnaZkJCYh7hS5FzHxwWRIoU
 X3iPJc73wWhCmHrPjw4DvY6BHCtl9qjSMr+XFf/jQ5sy1O8rXpcfTU7M1H9OTukQHnqj7tRKP/j
 JBKDy02hfVTch1lVlcd3mdUJ9u//KM646fIuAdasD1ibJn+e5TldYFQOVrcHwPWRiNCcWFDFnqh
 oww/2EASgGFNNQ07h9Z8WLBdd8JiX1oZNJXCMQuUmcjzWbd7kPYP/8rFd/Sj5IKCEZRP+aueUuz
 osk02Qn+//BcpyV3kCdztVPxVgvZhHSMvT6fzbZaaJRwKbZjbul459/1Ajl7FUoRevcwEynviTx
 Ht/+cmRkUTbe18guO3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170109

From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>

Add Embedded controller driver support for Hamoa/Purwa/Glymur Qualcomm
reference boards. It handles fan control, temperature sensors, access
to EC state changes and supports reporting suspend entry/exit to the EC.

---
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
Maya Matuszczyk (1):
      dt-bindings: embedded-controller: Add Qualcomm reference device EC description

Sibi Sankar (4):
      platform: arm64: Add driver for EC found on Qualcomm reference devices
      arm64: dts: qcom: glymur-crd: Add Embedded controller node
      arm64: dts: qcom: x1-crd: Add Embedded controller node
      arm64: dts: qcom: hamoa-iot-evk: Add Embedded controller node

 .../embedded-controller/qcom,hamoa-crd-ec.yaml     |  56 +++
 MAINTAINERS                                        |   8 +
 arch/arm64/boot/dts/qcom/glymur-crd.dts            |  22 +
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts         |  16 +
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               |  16 +
 drivers/platform/arm64/Kconfig                     |  12 +
 drivers/platform/arm64/Makefile                    |   1 +
 drivers/platform/arm64/qcom-hamoa-ec.c             | 449 +++++++++++++++++++++
 8 files changed, 580 insertions(+)
---
base-commit: a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
change-id: 20260309-add-driver-for-ec-3fa478f264d9

Best regards,
-- 
Anvesh Jain P <anvesh.p@oss.qualcomm.com>

