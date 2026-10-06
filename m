Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00673DDAE1
	for <platform-driver-x86@vger.kernel.org>; Tue,  6 Oct 2026 09:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791280243; cv=none; b=TZeu/x4AD6n9cS065aKbLeTwU84O18ntBmdBGnpliYwOqJyz6CINRTK+55tOeRub+NZ0P7Ys2xF8mx0QYDwKxvmGnFgd+o92lVP5gN/pT16lqXhT8+DJ+T/cr3NtzpIlAsQQB5fXGStqGvCTBNTldPNpFFWuZMrUgzIVkyObuow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791280243; c=relaxed/simple;
	bh=T0lN/DapWPxHvaDW4pJnUs2DcqEFLyYI8O4ONz2Onzo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NK/4sjWqJ4rmAFsfxHK9glM+ePVmTO5890a81lk/3/8m0uvYd2PyPumz0XRO8KWrMRQEecJgHhi4IkrudAGPXex25s2zVqqc7ENpxJt3AVLmOn3ecEqL6H8WTZB0zr+oFzYZb7zLMSj5hyH05G6JoPFkviYlu+4d5K2TwEaz/44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dXaicJjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMWg3ROT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dXaicJjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMWg3ROT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6969Qlm91447187
	for <platform-driver-x86@vger.kernel.org>; Tue, 6 Oct 2026 09:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=; b=dXaicJjldr2XiWNK
	qDfXDZ46dH1ZHuY06qcM1OaASYRIwMrCacE4jK2IHr3TMIYqdOAsLV6eWfUV1oy0
	wJQwVNuoQ2fGMeHngAdgX1avYFRHgI0fJPmiQS4N9lIcWZHOgkAfG4IeDNo6Qpg6
	VgTs4iJvko8u+/Ss9gf/ANfpGlm4W3mfuFxIIstk5hiONH4JV564ai6RWqbNWP3D
	FWFYEMe9Qxe39eOIuY874by8M8RVS1d5wLDFo9Pl7Ub6gtRCHL8CRYlLmMXi9j5+
	8nEfVdMoP4i5Rioee5Pza/+B3ZAmQ5bRdysdQoSV9uhsZOaD+NvLKVU+PGIP7l/S
	gM2UuA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc502tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 09:50:40 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8886059d3faso5651009b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Oct 2026 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791280240; x=1791885040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=;
        b=RMWg3ROTCw3JfMNOgjXdfg94hCZGkH/tIwsSM1k0pzuhALbzXFSeHN64wi8axSFbQY
         hF8qrFjVcrftgATRcpgu8MMvOw/PKZjiBjO3R7ijshC2PrZ8BLewQAGWpyb5Pxv+3yRL
         xnrthGcnKcTYaTXg0UvFaw561nI9tKg7VtDS/7BF5lOlvNkXH1lsLNSwTNNR2ouwn7z1
         okG/YFeZMl/heUOn7UPd704kqmbfSJ8kO9nbAcPFp+UVbzG8MEmG+JUIHDL9iI7qMdA8
         I+yCwEHyRqlSSZaPjM+puzsWgAxyYSyiyVlkDzQ47xf+HnhT0A9o0bxBbNcC4nC/8m4+
         TRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280240; x=1791885040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jS6d1VPN5H+Nib8Nvayq3z8IMlZlt6USSmNHvwcP2Lc=;
        b=N1hXiribohvO53lhHX66D9dO3W3vMoKA33bNNHphkN7TUp6tpVEVP91o3RS2LniAUU
         bPsuc6XS9OQU1Ujzpmle928zQGRn/FOwIQFvGP/Jxi3pnnD+5JGJcK+NB5pQoMtOkKS4
         OsUQcJiA2/4Bv+pwIpsSk92aPg4fDI2uUkyBOz9lnYtH4U0LnqYnk+5dnR2KJeuJlY9Y
         RvBYg4IpycNRABH5wsaEo19RUsVBv0lGHQ4ndBIkMU424EgSUzGtr9Efn069c+3MJzDV
         EBQZXmDOPW0WC1TawllKlInJ9uY/nCfsNOOPEXKtUWPFdqPWGFhfyJTQx2zvwQkJZ+H/
         MNkw==
X-Forwarded-Encrypted: i=1; AKwUvBwnUpomDcmp972TbDLFcRbml4mwPyDLADGHejqCwDCPhTUhWtO3/qIEiRSM9Jd2rdRkqVPLfnKtE48g5ue55R6QHvxR@vger.kernel.org
X-Gm-Message-State: AFuF++kAHTs1Iy5SeFPuwu4r7Om6g3cdw864D/eGhi75Tv5SONkJU5Yx
	ZTELQOadrC4ebfcMyv32500MP98897W5bd827azdiZtYbzilAhw0gNOYt2NvIoLcT5ea6/F/dcI
	qG3Lc30jIDNFoBHfa8bI3i7E05LLSreGUCcwLde/lsi0bYoA1Fd1EERwEZsNJYSyFIYOyS4wKa6
	z1
X-Gm-Gg: AYBFou2/4dpSpjhHvnvEnIhVjnC9P4gWbAjTb5+I+RDTkBaRVDQrsN2DIFSW96wdFJR
	qWOZ3Gg8pix7MEeCJV29Gf0uR5OnbTRb5Ar5pH+43Tcs9fDbLmpNsHYoQP7Q5BuEro6vheOFrbR
	OHARuywS2PzQ6YUMgGRXYbs7L/qTuosJtpMy/sXgqj5zO+F6aF1rU5HSLeOE+UzIy544EII3+3Z
	iWWQibbpqF4aMurKsmLmBF1LVhnq78iIoPVf0BsJisAna5jgSL14x1qfbUDD1ke3SJCyOXh8ZpC
	6v4mzRyBFUzil4KxAwSIvHP1iFFCr1qRyHfV2JEbBsC1MDfMFlTac8kh50fTsWbfhZZJqL6vSyx
	iRxd/ofv7V7AVR0bXyNNSom7E7yNkYVSlR5UGzTEvik7kWXZoWv/A/KSHLVRzlvuM
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr757972b3a.6.1791280240275;
        Tue, 06 Oct 2026 02:50:40 -0700 (PDT)
X-Received: by 2002:a05:6a00:2e07:b0:886:9eb2:a9aa with SMTP id d2e1a72fcca58-890dbb8c48emr757941b3a.6.1791280239785;
        Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-890acde961asm535523b3a.61.2026.10.06.02.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:50:39 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 06 Oct 2026 02:50:30 -0700
Subject: [PATCH 4/5] drm/panel-edp: Add Sharp LQ138P1JX61 (Surface Laptop
 8th Ed.)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-mahua-surface-laptop-v1-4-406fc042162a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791280230; l=2528;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=T0lN/DapWPxHvaDW4pJnUs2DcqEFLyYI8O4ONz2Onzo=;
 b=b/ojm2NGZbp0Hihaqkh+5mmrSWAdCRDQ5tpvVjjwOccVEs+VMtJ4T+47nPUbfO9aodCOtSSnw
 g6lpFt2gUT6BTcag8rVkDL0D1ZjjjY1yknJ4QpsQwHYj32yQf4Gxryo
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac4c471 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IFSe4OfV7_kOeEc-bZMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfXzL50u4bY9Q1L
 Tqq5zU7rJroDNcLTJKRTSQb1XLV0KqXGlcjXQBlPDt5MNxMKDQasFxmkVyRUhhdV3gRJAjYHusc
 ElYOTLBsKxPe6emSS0hsUvAAoTYK62A=
X-Proofpoint-GUID: OTT4R9j0bubbHkkC3ouFco9W9LI20qKw
X-Proofpoint-ORIG-GUID: OTT4R9j0bubbHkkC3ouFco9W9LI20qKw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzOSBTYWx0ZWRfX5FYsM0I6jh8j
 jIaw2MHTDv7h2H1ToFpuIbHJKd+IXvMBpM2DuMJ02KzJdSLi2uJunbKOJz0F+XnRmrvhmcBKgJk
 7GgvLnpofh2BaSpeX4RV0js5ALKyJsV0IED9OMf8/dQh8bVNYhWLDZM24qUTWvTJKRTigjXI8xM
 pRH9SRhyiIYVoF/flp0InotoEzONjH9ubkx71e2hDHidGAmAGu+pBiozWteGDI2Lmdd6rhxNaav
 AkbVexb6QYiZ1a9+OsFFVygZ/O8nrNeI8iMbY6QLI4Y8eNxFNz6Z6gcQJd12IdWCPXx0jS3gYv6
 zMO12MfukzAOJcz5KoOUxhbAtpnrDzP6otnUlCYs7k1Ga6WT68dE8nF9vtG+dbwxr604Lq4lcBE
 HfXSNNmawIgdBgnSKb9EqElhFfq2M/WeajhjWMPkCca5j/2gbWXwsgr0kEDMU8aOaTK1llGC/wQ
 DUjobRafsbEsbo9OiJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060039

The internal eDP panel of the Microsoft Surface Laptop 13.8" 8th Edition
is not in edp_panels[], so panel-edp falls back to conservative timings.

EDID, read over the panel's DP AUX DDC bus:

  00 ff ff ff ff ff ff 00 4d 10 72 15 a1 31 05 54
  31 23 01 04 b5 1d 13 78 03 7d 77 ad 50 46 ad 26
  0f 50 53 00 00 00 01 01 01 01 01 01 01 01 01 01
  01 01 01 01 01 01 60 b6 00 a0 90 00 2b 60 30 20
  3a 00 23 c2 10 00 00 18 60 b6 00 a0 90 00 56 66
  30 20 3a 00 23 c2 10 00 00 18 00 00 00 fd 00 18
  78 be be 2f 01 00 00 00 00 00 00 00 00 00 00 fc
  00 4c 51 31 33 38 50 31 4a 58 36 31 0a 20 01 4e

  02 03 0f 00 e3 05 80 00 e6 06 05 01 73 6a 0b 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 aa

  Manufacturer: SHP
  Model: 0x1572
  Made in: week 49 of 2025
  Display Product Name: 'LQ138P1JX61'
  DTD 1: 2304x1536 120.000329 Hz 3:2 (291 mm x 194 mm)
  DTD 2: 2304x1536  60.000164 Hz 3:2 (291 mm x 194 mm)

No datasheet is available, so use delay_200_500_e200: it keeps the
200 ms enable delay of the conservative fallback, but uses the 500 ms
unprepare delay of the real panels in the table. This matches the entry
for the closely related Sharp LQ120P1JX51 (SHP 0x15a7).

Assisted-by: LLM
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/gpu/drm/panel/panel-edp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 5d7d696b7725..3d002d75ad73 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -2198,6 +2198,7 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1523, &delay_80_500_e50, "LQ140M1JW46"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
+	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1572, &delay_200_500_e200, "LQ138P1JX61"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x158f, &delay_200_500_p2e100, "LQ134Z1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x1593, &delay_200_500_p2e100, "LQ134N1"),
 	EDP_PANEL_ENTRY('S', 'H', 'P', 0x15a7, &delay_200_500_e200, "LQ120P1JX51"),

-- 
2.34.1

