Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3D3B6C0A
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284360; cv=none; b=VrB12pl4fzsgj/GwBzGXrzzB3lJJ3lJlm+AtlTrtQve2LcPm4FWqtNOTipePy4GeeHcQMDbuBBIRaarKd+NaFmu0aRBAYsr58HBQGcJBDTVdMPf8h/9S4DrTw7z8Mso//QWruoUCYNoO22yFomeRSel3X88ZbsG3T08vwoZ2ptc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284360; c=relaxed/simple;
	bh=p8M74poezKvw740VE4mBcYJSH1dA6AFy8jlB9yXNq+E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tjDUggt8hCZQU5Pb85H9rRE/AU7x4k4kj8AogRhn9wIefFtxGRVJvsnW59BZFYuOJ/Y0s2I/dTOxo5Zmo+NIKF1fvvt24QR/HIDT1VRKOiYMgffr2/K28RPyTW4uUuKe0gaPnacIX2xPjZImnQkAKH6G1GkxCEuWG4pRWmVp/7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PKRkAvsh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dy12zYot; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PKRkAvsh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dy12zYot"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kEXc3961889
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=; b=PKRkAvshUAiu6Ds3
	aTvEBHlxyA84HxwK/1h6/TGJeOPtWhk5Cbl5AS9dKvpN7m0JZQJFeEhdAug+mNXN
	L+g/fOlyO/Hz1K9ALJZnKRtqdmYxskHfKhNmrVk/zycXyINUgPKvX5T8X/n2KdaB
	IHtiDFc4uiYLabT8Jz0I9PYCM25xpjCsIaCHZbkHvNmeafq5uxvTN+rlZYrb4bo6
	ViRHr5TNUIaz6tqnGfOx7ZpHcrhq746w3fQsgQMPZJUt+c7YFB+v9k7LNR765AEj
	lVSZTp6y3XSMCS+J5huwR9cbu+DQ4DefbriJ1807qd8HjqNwjLVtLe03J28254au
	FzYJZg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30j10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82f6b0a7164so13377397b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284358; x=1777889158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=;
        b=dy12zYotQpkxkdjp7h63GA2z5HLb7snBilq8aUgLW0Ar3KCcFtFp8LwvFjSUApaZU5
         j6J1ojjstATgwVa31TSM3eadDE8Eu7Pr9QcSvKSxmhAzvYSWjtBLxH3L6ddPIjWw3Aqy
         Now3imCAerIrwjfctGtDAv9DElwVl+tT1V8u7qgQe6s5kWTmn65/UhBFoZcxG8GbzVey
         ht9aHBrAYnxiwXOz3xpJ1y8nI8zOT70LJ2wMVD7nSR45bGvBQalpa9pyl5vlyMp4YBD1
         jlh+4Y71ft2p78nreMXU6nuViBguIDBr7JbIdTlnHAwwQap1bMsBFyxb6VvbrOc1Nwd+
         jT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284358; x=1777889158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5OAC9CanJ/+2Zt8Fy1VZoGxcKLS/SkOBP6k3HJ1PIPg=;
        b=eboKHRI6yIfE9viWXqJtnw8MuFr/SoBqYQ+lIVl5Fye43UkSSpjkM4dBPGuFS/VNg2
         GSFILnxwpAU2dzb53QblQWV0Wy803h+ilbs/bSx0ztF0eHCQ5FOnfvpP6VP5IWWnMRJX
         KQcyt0mUlnU9/TF2xBZ6wYOWRhNEPI39FmqjSA1sqHdu0tSlaJuzzRhZwW1aW9XwIu9S
         A+yROgK7BTm0cwRL3FcK/yyXmURTVrarsqiukVJ1zXz7LJ42HGw7zMHjmikq1Cd7ZlrT
         t0gr5NjlqEYqAGFS7PHl0S+JuH+RwcV6IUOnmKvQDxPTooS/Jr0GVH9lPLHNy4HFnRUg
         1WwA==
X-Forwarded-Encrypted: i=1; AFNElJ/he2FFswG7yq7cJS7zBBtbqcev++wbfUJgf2HaOfheH4Cj6vd+RrbYVMLVqhHNAzQlPXyL+Mf1Aeo1G4RL4ha49bkv@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd38iuIat40VBTjU/3+UKoGCPS+s9ZKAzLLOqMDHUijwbW4q5y
	SCqbTaQrg9J36XrbUpl2PoPALzEJUD8yniMH1iH/KktSOaeQEwPkTTqcJAg2/L1vSSOP0cBs0Ma
	8xHxxWrWVymp4+DGnV9B1qMD41wHrKQKUOu3ZlJGIQd68asq2a7eTSOOCXE+cII2ED4K77kF/Ff
	hM
X-Gm-Gg: AeBDieuOLfiRVBB7pWwe+ERD9n2ZIxTnsRVkhtraYAR2QJf3QVmHVzxIyDght9O/QIK
	SaYrWy3HmgLxUAQpb7AhLAmHyEyHTnGS3P5D06geQwngwg6M1eMDn/gTdOKc8wbRV0RRLuwS6lG
	UKYusxQ3SxUIuUmInAirOn3hjfuIvoYfHgw2e7TKBMRuErrwVCsIVptJeVL1a7P8N3NHzpYTG/l
	Z+J6V9B2RyZQOFcLk806dplqArEAcoYtyhBhXwk07jURmBcIJEzW960Wu4pCl5v6RpTZOGw+AFQ
	T6BGNlGEB2tbEGfK4pc6HHRJYeGpKR/+KeoW8aY0aCbyVeRosaBaHoRsCyJW0ipGXvZu0D/fmzm
	AaBFYOgdTbs4RIZfNapmilc77BHs7ZmUFkzodTMEwoaSk36lwmAs8Zip+xFmvTCJj57E/zgKDd9
	IhklsrIl8UVt1UXMaIITON9KBsgSuEO2p5cOabAdyedn+a
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr43091192b3a.1.1777284357527;
        Mon, 27 Apr 2026 03:05:57 -0700 (PDT)
X-Received: by 2002:a05:6a00:800d:b0:82c:9223:cc95 with SMTP id d2e1a72fcca58-82f8c7db124mr43091148b3a.1.1777284357113;
        Mon, 27 Apr 2026 03:05:57 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:56 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:57 +0530
Subject: [PATCH v8 6/6] arm64: defconfig: Enable Qualcomm reference device
 EC driver
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-6-702f74e495f7@oss.qualcomm.com>
References: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
In-Reply-To: <20260427-add-driver-for-ec-v8-0-702f74e495f7@oss.qualcomm.com>
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
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=724;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=p8M74poezKvw740VE4mBcYJSH1dA6AFy8jlB9yXNq+E=;
 b=oMYB96eaiECDwGVUkuL+RkA5FxwlIxcIEjxby1XZC7sAyRDeIMSdYgkAQQDFMeIqIrLa7diBj
 AnHEYtv3xdXBGdy66tkLqg8i76OtRYzo8tM/kn7RJ9SH2tEW983X+MT
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNyBTYWx0ZWRfX4glZyhxM1vT9
 FI+aoa/dXequOosz8Nr+bVw+ICZy+aduwnxGUdUTptskmSJKGaVqB/zh7pJEwv/G90KwbyPk3KH
 eyImfSATr+LHM7a1/IkXwQDTxhkrZaXy7BDW2h8jIvc1fo5oKUCai7TIJsaWjqh6g4TOAgRg5aL
 df0Jw6jmPVFgREL8tlLRcvxW1yCl7oNyhGIsKrnsOFCtm43xOj306glY5/wVOLPUxvJduWdO0Ka
 2dXLVN/aD2gAuTk5gzW8yeqtA2Op88A+8mz6N9Yhx2NXnJLhrQ2lPW2IMzLztdcxyTdw3+n/ZcH
 utHYqX4SVqC+oOBzDyqGi2O+t9uEtdC3vE9Hg75ehlGrjtWJG4hdKW4FEYHDWWMoP7RSYtcjP4C
 f80YQM3yNoJ3xcbRuk4LppGGFiwHhAl8//Qq5jH66h8NT51InSOvRg8UY5yGhP7ipSR/2LGXQxT
 QfH2FJHtD6Ere1Xx1tA==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef3506 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=p1egL3lCMx1E4hDV5aEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: l_iQ0XdlpnemGvVRBLlQjrvhYzJBTT_n
X-Proofpoint-ORIG-GUID: l_iQ0XdlpnemGvVRBLlQjrvhYzJBTT_n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270107

Enable EC_QCOM_HAMOA as a module to support the embedded controller
found on Qualcomm CRD reference devices such as Hamoa and Glymur.

Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dd1ac01ee29b..c48fce61d738 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1440,6 +1440,7 @@ CONFIG_EC_ACER_ASPIRE1=m
 CONFIG_EC_HUAWEI_GAOKUN=m
 CONFIG_EC_LENOVO_YOGA_C630=m
 CONFIG_EC_LENOVO_THINKPAD_T14S=m
+CONFIG_EC_QCOM_HAMOA=m
 CONFIG_COMMON_CLK_RK808=y
 CONFIG_COMMON_CLK_SCMI=y
 CONFIG_COMMON_CLK_SCPI=y

-- 
2.34.1

