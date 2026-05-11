Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379763A4520
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503514; cv=none; b=cF12QG8iNuJp6XyGZLouq44kSxTukvvzWaFWMGYNeNj8kJQGb64Ah2fabgHBk6lnK22bYa2TJ0Cgq2Edfq2I9eHxketFyNQgE+h/lwdbWK9r0tkmejdVPZLX3dPwib1ur6ekUhkqgRxF3FB1E3l3ty9YwOKHk1icQ28G9m++yPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503514; c=relaxed/simple;
	bh=BOYXG53bdi2XjvZ92ZYJP4VZld7lbUMGFXpmLhK3Xv8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TohXVcO9RGy64wlUQ+9CpcfoxSfmWA0mKGQGgvDAx/UOFniK1Jrs4bpl2WAd7yEIfL89LyklI26XD8a3M/gHnmoHndxCojbqhjTUvwLtCLiv7HJnONUvInHiR1HAqe2iDiYJCtVq0UZtaquEjGnaZBj78bQ3tH64NowBUQByxro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipz16ZZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WIhMTD9b; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipz16ZZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WIhMTD9b"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BBIUYo1344469
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=; b=ipz16ZZSDzK8L/7N
	Kjsy596wMnDZQor+IIYC7ATDhrl+n/y4fHk2P1JncWcxW5jn8l6EQmgMK1m6zHVp
	7fa/70sq0Y5YKvJvOz5I9AfMDqwBuAd9EmA7n1b7RYqNKHHEAv2wLct+o4qk32Qd
	s/wLXo6x1JoMIQcnIehLY85MM3s8hX12OacTmXILUgGtM7NP8CzYHzVmXGzDugdu
	1Rv6VxcKVma7osebl1zQ4/ljGrO6fjPhzyovpOr8QpmXwn3k4zSkl4sUrpenkiiB
	zIW/uhZGET3a2EHhLPEUp3iKHHKlkowMg6NesH38zWdlsrqFkHB4pEqFd4JQcirc
	La35mg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3e4988vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 12:45:12 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7c027fb7a62so18241027b3.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2026 05:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503512; x=1779108312; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=;
        b=WIhMTD9b6HDR7h7P55h5P8ooo3C6s5yU3JmxG5Yz5BOb7phoEPptCqFHKKx+PSSIRJ
         osBzI33vOhIj6tfI3otmfkRB+A+RMh34hRo13EOcEDRrXPcycEFbvVqk0yUONqDm7n4T
         0kyKRRNMfpQLB5JFX1wA4eKDtXa/PGbx6SEFOvJltbIdvsb6aX5ZNwFVf8wB5afKs0B/
         sYjC5ZgQyr6Y1h/uvNnsSlI+Q94o0dHqvSmzb3+uaXja6nuiYZQFDtRvBpbhDx/rvnGl
         hfMKEI9J/QdxxLjc+zUuWglE+h66pehHTeuwU4A1GqMIy8855iA2C6oBNq3YIgsM2kVU
         wycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503512; x=1779108312;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=as+Eb/DRPDzFIgx5gcstJyS2F7gPE3qAatW5+WlePd8=;
        b=mLVgGaASfM8V27D/WNiBuqYcHNUIix/qPtcdyRp2VSSCqATetuVpRy/rC8JbVAbBJ5
         6O1P2no2lpJyzZUYeRpRXwHdO52yYkJjuRQtxqND7ZOwwWHgOiVG/U3D5tKVqIjnE6FF
         NgoJtki8cMNbMBwsrONTHhoyA+zWW1wansZAs17DLqF0PRbW3ltvzmCUemphrNYp2i16
         SWswpVUuQ5J2GYPiSUduAJm1bDQ/Wb02oQZ0WOvKdCv/ZSDPdqbq5V1hJSnqR/odr7TC
         78aPcNMtpeoIexaEVgmIp9nXcDb3HaYSIAURWFKKZZ3DVoVOrcAsBiNv/QY2rdfeAO3i
         /9Vw==
X-Forwarded-Encrypted: i=1; AFNElJ9b+KJ69AH7O2oNPk+eBC8vY+lJgtdvCUA1OoExGyYM7pTV48b28gN5WX3vOZ1Tzvo/xMD7cx+4OdwsFASjLoS51ZW8@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkt+MXf/KsIDb8wMPfcTcHjlwdRTnCh6JTn7RFXzqvYJjeAGkh
	gElnDenQYL9aKWcC6/Sqf+/d7pD20hYBR6REn60Ur1MP7CXviFtFhzDMKUr27bzQDALYXbBSoDP
	PxQRgkMh0UWs+6Bvop1CuualpFG960JcgCkSIlVWDuygiGCxynPf/kNcWo8ll9v4Job7XNRg+b8
	JA
X-Gm-Gg: Acq92OFeHepcdxGEZHAK4zRPANwVNdBlTC3VgIw/pBSSMiHKCf6jij2uvGsG+gKkujR
	Wt74pfOVRAQbRCZifSHFp9a4PBEBUvkEqKqi7BBaFJcKnKPCIYp9eSiHYwk2TIMnH+CShrfjjZ1
	Wn3E1AuCjghUZ8JtQei6rCzVF5MSGqkUec6SwEU4q21xEH5L1wtqSHZqOJ/1H9S7Y2sPoCo9hxy
	bEPtoFV7e2TYMeSh8eBTMRsUcNij5ZDNnrCjSijHXyKEGbXCCu+uHKP4572rUraRQGf7ay4BQUM
	LfV9PLGoVwzioSxL5O6e0D8TVMae3+lgjPwEAPJ3s8hqU6ZYMSfdxWiUJPvv9Tlv8/LqiybaYNy
	zH/YEqOJI7RQZuAlK5GyFc0XWF8RhoL+ov10LkI2APXTdPN0avqqsk3Uj7gmEhhbo2E8gNA4LVM
	3G9GPhPpm/DTiRk5B3NRmElTWWi21ek0Crtw==
X-Received: by 2002:a05:690c:a012:b0:7b8:7855:4d37 with SMTP id 00721157ae682-7bdf5dc6f20mr203542767b3.13.1778503511828;
        Mon, 11 May 2026 05:45:11 -0700 (PDT)
X-Received: by 2002:a05:690c:a012:b0:7b8:7855:4d37 with SMTP id 00721157ae682-7bdf5dc6f20mr203542387b3.13.1778503511287;
        Mon, 11 May 2026 05:45:11 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:45:10 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:24 +0530
Subject: [PATCH v9 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-6-e5437c39b7f8@oss.qualcomm.com>
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
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=788;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=BOYXG53bdi2XjvZ92ZYJP4VZld7lbUMGFXpmLhK3Xv8=;
 b=+MyicJXnA4tzbG5S/Yus7WbBggmWS/SZ8DpIDufSxWI1PvyDWXpW6drYh4Mlw9JRkVAfDTGMT
 ix92tXPJrDXBJacUaH5em/tn005lalBL9XJ9q9WV0FeH+9VOuoQckOn
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: cRvEENIaFEDmCqRmY2zGhhU-YM0BMA-F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfX4YloXkCNWGvB
 vqVer7t79MHJzNWdqtNKkanXKQVQau8Qmem8LCmvThFyCqJmzEcAI4MJjyYyeY91Ps5HGZWPJJl
 HbZZBCz4MF77TF8sRxsGroUOVf0SFOBHb8xTBudTkCl3Dc0uv3/lhigstBEs2AR4vo3KpobudDV
 7GOjSRw50WmhSRe/Ua+tKWVV7voSmt9ywWKI9gayRjFwgrXoJFMqmSakYzEYEFhy/jX37BWx/PP
 EWqIpGqPstJ2m1HVLcWOFvXKB15nmyN9Lvc3yzbihhRBDrqCOEnzGmxPU6MmECg9+lrTKh+/XjS
 WC+3RIphZS8gOdylqUjn/+J1dm9pI4h0STjLc5y08F0s88kUvgP88aSI2F7PX1bTpSvzCnO9cZy
 Aw2jcSEoQi2q3ae4fyvpZwe901y4qT5m+ch/kyp7FzmVCYCgnrLI2gfHoHq4WZvFPVvxMmTjx/J
 bMxeLaSxu7/P7bRzROg==
X-Proofpoint-ORIG-GUID: cRvEENIaFEDmCqRmY2zGhhU-YM0BMA-F
X-Authority-Analysis: v=2.4 cv=Yr0/gYYX c=1 sm=1 tr=0 ts=6a01cf58 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=p1egL3lCMx1E4hDV5aEA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605110141

Enable EC_QCOM_HAMOA as a module to support the embedded controller
found on Qualcomm CRD reference devices such as Hamoa and Glymur.

Reviewed-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e5f1901ee408..52ab5ffe29ce 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1415,6 +1415,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_APPLE_NCO=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y

-- 
2.34.1

