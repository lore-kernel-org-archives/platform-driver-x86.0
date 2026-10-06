Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA073DD51C
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 09:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280239; cv=none; b=sOjzvxi3iMlq4Gxa2VcjmDRiybc1NLNc7jiyCV2xL0tgmgwy99LrhMHPo8TY4RqD/l6yYL+IZtCBDy6u6bT2RhPa7x0MpFZ2rLyUHoRCnoTSMdljoZTu1nfPyD/JtAiQQZDCqHiNUSprTrIMMIvwJiK1/FTkpFWKF2m6owqS/Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280239; c=relaxed/simple;
	bh=kDUg1fRRmqKzaG6Zc2sw6qY3SgF2FeNwHEhldgx/a24=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O8EjPM9OUVZx6TPGuK2aYRCC3Co8Yy9h094Ds357bRjK01l+4YrVFFV+y+KD0azt4bqIUgp9l8M5RdoWud6zk53Nd0dx9WwvCc1kQJt+deTyw6VR5WPSENkH4HKwq5ZT1qjJnfwSaDwdvf6yIYNV4PDaFqlkqQxeZliQvHYQKFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUyim16t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eKrvTdvl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUyim16t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eKrvTdvl"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6967ScQY3537533
	for <platform-driver-x86@vger.kernel.org>; Tue, 6 Oct 2026 09:50:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=; b=HUyim16tfFBieg0R
	R49TMQCW0m1I7DQ4IV6nXOkrqZpMMMUTYmwrngpRr32/XG5tiUq8Gvx7KUg+86wR
	40l4wp87SBqCeFRq5nGs3/+B3U5k59RAxFzYcq2w04P/CZmZTNwqS6yLSMKGZn8J
	Tj1HKxmP1mYhCi23whIzmO45hfvr5eUy+ztOg8kuRPhrwhrGfg8RZ/vbBINEmwJy
	y0F6t+Ne8DmNVtCUd8blrqjZn8ph3H9Re3YD9qUpw/uOzFaRS11TFDCkUW9/rJ5h
	RUfBkYiGdEnpTTo/hAAMk0SBZHk0xggzssWTpB5u7ArP5W6ORW8x4buYzlnsWvgT
	EDS31g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4vmrrg00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 09:50:37 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8886059d3faso5650956b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 02:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280237; x=1791885037; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=;
        b=eKrvTdvlUKPjvLbWLV2l33l1DFfOXTehIUQk1C6awtBoY+9vPAgeEvXz1eBQ4k7Dfo
         zS1/SyWWdLsz27whgtgXJdFiaYlZd29Jczlym9M5bISF/UnfUeTI6ATBvojTGR/4kzJr
         uyW1IYTAaTpnJuYOk+XaBoP7WTvx3av+ewDWTKrbdngJPmwGvZLMRsrxr8ISiZAqSJn+
         MRA+eFZwuPU1sqaFC75zHqOjuWsVag3VeszDksYmO4x+hAkriWKBnq9ea8w6/IMs7FPc
         OjL0yUa1CJIhtZCBfUnSmksxaiktRZGoadKkJ0vySUk9hQ7C/tVAIWPPZAttvue41tTq
         t1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280237; x=1791885037;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pUHikJVq9dmQEfe/H/jSfclflEc1+RHz3l/t/iTT+4Y=;
        b=uzlnHp7VFAw2pED2mU4TTnH99EjUY7WxK51kSvLXh7ok8MuavqHqxq0b1fvaVQN9GH
         v2rtaTuhjPQGq9g+OtTqe8o5nlL0hnUvczvcDOzoP7KqlX7yDfEY0mh+nZf7TDaDgDDf
         vy8tnHQkA8TOIUXOJsVtuyYmNhK9i45jEWDh3db8iEl+09/kpw4W75fpnjbdm4FSKfKP
         ZuKkOl7HB1ZHPE+zthVigeZiywco6WB0jqNSBc9Kdx6xSMaidBbXkw+bytqgG7PN2RKj
         yQSJVKsO3824O147NIFNSE5tJ2oyDcrVjyDFYGA7FMHFqBWNWR6c59T8a4E8ixALgeGy
         3y6A==
X-Forwarded-Encrypted: i=1; AKwUvByccSgKeHtlv84O7oMUUwUhA8rBtQlDB3jQjpRgBHDTvhNLYfR6SYjq3qU9dpYzWUrPRirey8pfSKheMFIigrPu8rID@vger.kernel.org
X-Gm-Message-State: AFuF++lfhFjars1lP01doFMINme07023KdAxihTU5oZGo5k9DwFkyhBs
	glR2f9LPpq0eMCxfm6cB40SbH3P77hNBdZiuZJ5JAmKW3pX0gt2WPyA9nI0/v+IsnRngNMqxWW9
	+K9/F95dSzQ0FGPXWxM6bp6201m5ZVmCmEhMebuG+Mg/GSoAvzhot3z1yUVPaLMHaZHyb93dStH
	i5
X-Gm-Gg: AYBFou1aCOWF22qAIcIWDYyocHReg19SStH9/mcGylAvrzV3cjA0KLQZUSuz4ecCNu+
	UUcmFdbkWySQRoopQmv6ItgZXMTlMFQh/JB1oTDUEWqBJjQJJwVizEqOwWdjZv0G/np9zYVLJCw
	FrFscbC+ujhnhmcJ+WODDZp5xBpLWAomN7Km1ECnw7hSP8k6h2SYk7GI8o9n8Q177xiQjHRafQo
	pvmDgYC5vgcJV0Aiz43vdkctIdwxZaBFhRX+oPhd56i4I3nArJwvsn+y4s/33ft483FJyCvp8gZ
	nDUZ2a9sLDmhw/IqKsx9D+5jzO0Kp3PgPfJHcIw/LIn9F1b4F1Vyy0S/TFy5GauyQrU3A5jPY6v
	km+qIrXDMNqPYR4D29AMuKPSFafDPZ4SJvB8jSOti3N47Eta7iZ89tkmlbw9T5brK
X-Received: by 2002:a05:6a00:1581:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8911caa4c0fmr226518b3a.57.1791280236627;
        Tue, 06 Oct 2026 02:50:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:1581:b0:891:1caa:3f72 with SMTP id d2e1a72fcca58-8911caa4c0fmr226486b3a.57.1791280236192;
        Tue, 06 Oct 2026 02:50:36 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:35 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:28 -0700
Subject: [PATCH 2/5] firmware: qcom: scm: Allow QSEECOM on Surface Laptop
 8th Edition
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-2-406fc042162a@oss.qualcomm.com>
References: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
In-Reply-To: <20261006-mahua-surface-laptop-v1-0-406fc042162a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=952;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=kDUg1fRRmqKzaG6Zc2sw6qY3SgF2FeNwHEhldgx/a24=;
 b=m77AJBxiEiOXnMON0T+PwcT1ix1BgC8IkQTobT8Dov8QxJKID6TD1khw2uuZIQxKCKSH9xmMr
 1OX4Ljgs05bBI2N/4rdGHcvd2OBZjtwSRHvrJ+XXNQTjncvV6HJ84PM
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=XZ4cX455 c=1 sm=1 tr=0 ts=6ac4c46d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=iOO-S4HMiWNIuKyz5uAA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: n6CGHRemHyGDl6QqEPY-qDWD3G1_QpgO
X-Proofpoint-ORIG-GUID: n6CGHRemHyGDl6QqEPY-qDWD3G1_QpgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX/HfA9++3DDn/
 MhHAqoi+fJL8zLs1m0n/TjMBNzToNewPIUoxY0nuR9z5p/NazMmraiqJ4Qv+g3YKg15YcYabxnE
 m1M+tBylwjIsOjL5IkW090lL7bkB7nGgrH2vmkeS9eb/O7hypKp7lkTInoLF03K3MITq06QWWEX
 v2NeDN9hNl4K6NHSNBaWxs8e4AdRnpbzdY8XeBbij0BEz7MhF/WQpoTBwxrUgrVbzzoIFc/disu
 S/j8uUue5FMDmw3a6/k42n8sDOSE2MGFOZykJeIh6CRzv4kc66D/FM3kcakFPLqLYij/Bd9R/K3
 GpkrqbdCvDS1c+NF5mPpotf0K1eFYmMGrBwect/W3hAB3e+c40wMvg28EwS0UQuQA5207q0WMiy
 TBoE7kWygNxtEjl0JInHfz+YaOxzjXyZJ/C2EWG37GAGlqA6RvAgwWRBRLyMpaUN3yEHGUc/Ff4
 xanCFnuV+ESyjoSNPzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX6T0ycyVDk1fN
 bADksi+dTAztrJZcr07T8/5zfOnJ8jRzbwxn9CGTFauF6CUmI8idZdARud3Ao2DzgoPtntf6jHQ
 iJVpyC8lB+FcStaF83F1hlSnQlZTiEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060039

Allow the use of QSEECOM on the Mahua-based Microsoft Surface Laptop
13.8" 8th Edition, giving access to the UEFI variables and the RTC
offset stored there.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 43e250faea75..1fa912a9f700 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2255,6 +2255,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,denali", },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
+	{ .compatible = "microsoft,surface-laptop-8-13in", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,glymur-qcb" },
 	{ .compatible = "qcom,hamoa-iot-evk" },

-- 
2.34.1

