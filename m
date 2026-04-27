Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5390C3B5841
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777284349; cv=none; b=q9bf/V0/p9+LddTf8pOCgsUCD7j6Q/9koBpxoUYMb+BmSW4JAyfl6Pkj1iB+81XRUbHY5WY/ng2NGWD/c0LDTRI7dY9i1Q8dWajLivuyPv4D9V2IPt667LXFo/5RUMJlabVVzcqKI/g4zCK5yJ2DDIoa5svJxkyBhuRdm+kERmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777284349; c=relaxed/simple;
	bh=nfUlgRiZuBNEE478C2TaHpdYARSv0jZSyoCpVTzZyeY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pDhTpxks/8E94L4xH3OEV86RYgdu9nHbCI+PVt3VqTd7lPr8k+HR9x6bJ7M149dchHlGv9MKiTBtZjmLcGO5YIMvBdD9/7k5/qGkJtJlDFgJNmRaGpy8sDzZjcTAh+F+kCCpmp4ZahP7TixaMQGb7+hYXBME6aWW5vEqtN78kIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NokANQ8/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wb+wm/cL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NokANQ8/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wb+wm/cL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAtT665646
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=; b=NokANQ8/mpSaPPra
	UmzkjeatozBpjPsLhWEMh+cfAm0RZFOmxKPGAWoLdjhWYcTULJDzo4mueDVXIqOu
	988dQNd1lTkxaitlQ3tbFVrH/B4wRcJpRnuQ6kCMeDhVVEAQJR8+HlI66UmgQ/s4
	enB4xQNyofMAu5HekIb92oQEQMMSfRKNbizOlK6eLwFMo8o3c+p/nb8B28L7ko2K
	/O8Eh03sr5XdlAyhvpwE+KxWP5yY11KYmIz6EsYNvAUND3UXiauEsxfW/ko1Qk6v
	OQfexkwu2I4hjn7s093nL7rnRbPg3H7UmeXxPEnRalGLh+I8YVwe6ysIJ1HK6Ei8
	j+DWvQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0uru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:05:47 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f9aa52c92so10352278b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284347; x=1777889147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=Wb+wm/cLwP/WBqYx2Nf6KkKRUt/3+Z4N4ijVUgwR4bXHAoAl/geKofdrtsnaoleMbJ
         Fr6dV6yyFmJ64XQoBm61LNNhdGjvwgFc+ovq59TALN3ZXQbfozilwhg5e4gfEXQw/TDr
         ALaFml11BILOAHHzoA88letLAwYzzW45zkDRAV2oyDtZELJ30bpt4Jw1Dj0neBeKEq1G
         C0lOPeUiGA1ab35uiku/iPkLTa/7C1PvDxfTabOuhZ7HT3xvYRdc3VzhZdHhm9HARsS0
         TzZAoH/FhItxkotjQ3RpJXNva+ohRdmZYsiIb0oWqNhSJum5jYhldhLQ/Am2/IwWP5jy
         3+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284347; x=1777889147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U8XPHuNlG7Wle+hcGKTRA3//qZHMPcvdNl/NeojZNNs=;
        b=K7UmllybMdFdKIlXNu06xGdif2ML05WTYpfx+ubqssUfARv5+6dfCuST1tt9DWftXX
         jEwvJL2+mbwwKKXBsBQt8c0xgE2nDwQm4gkjB9f3fgK8haL2rvLKEjcWIQp6l/bSHwfc
         AYX7mtfQGdqeefTUZplzoWO6nomWaYpE2/NkXu5J1ODIhQfgDBVjsKGHZ29rAYUOVTYD
         ctQveJTo6ugA0Osjs1ls+HsBd+X0k/XKePKGwzfHnpCFc4THj/WzM+RoGMYW6v7xGwJH
         e/ysEPW9zrCvYFPZU1/hXcHOhqF15OJnuCj0Usq7mvE5u5Ctiv9JnNfRHrLk76xLIk+Y
         lPmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9YVGDsb3lHeaeWb8OSpbuIWsXKIbgC2Fum8/2gwgAds1pDN+tolnQeA8yVvn3zOh1kldOejBny7NEd3v2ijsekxtjA@vger.kernel.org
X-Gm-Message-State: AOJu0YyQGmPmaSz7qqA8WnJrWsqsJRXhINEvBLRHZbgdjKgr42M22Zjd
	EXHLwo6xpgP3B7xYTxEFz83L/WmrkD3rz+DILddvEFfIEJ2zVhRUIJlXyms/7RGqQfuZRnbtD28
	unAvdPo5OL1y3VPr1kPOzKZ+sjNH6eyDOjaDNz5rMkcS7GOoV9K9mdF0+xwOcez9veImb4KcmdZ
	uh
X-Gm-Gg: AeBDietl/AZiSfolHpFo/ZV/QruK54i6GWf5Nj2gGYIMHemwUiizFVLx5Vcc4+hhIUn
	somtN2lKTq3aZb4UYtq3/yyEEsFN8KFipQzLc+dkaIo0rAlTgD99MHDh1VMYWRXLzJV1B99sGC/
	Rw8WM/lrI3ixxglFjJInTCuJYKJjqsYxWvCBMHc4nf3SqONtKYMeiJJjAWfz1O8En/oCNB1Yz83
	IQyHeBt5Y4H4bbI6EZdkJ28/FzgzSJz7hqhkRBpB4mcbHfDwHkrBMXjJyF9CN5uXeCmc4E6An4M
	xPy2/QUSLF+kmJkE46a6M9SEvEz2l7Ben5x5I1Q6cd3u5oe/6fms0aHcTPjn3JloX8WTmvTb4q/
	nLKib1l+uzmcZluAHvJAKc1qYODi6i2B7D5PZVbwYUGb8yW8vkE59Kg6XZEeefX5rLag8AjzAjh
	RC2OHIILO08oo6X1PvmOgS6r2T9rqhy3Yqb38a5tO+2+xN
X-Received: by 2002:a05:6a00:bb84:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-82f8c8c29b7mr43178188b3a.30.1777284346976;
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:bb84:b0:82f:776f:a78a with SMTP id d2e1a72fcca58-82f8c8c29b7mr43178137b3a.30.1777284346499;
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec24850sm33004008b3a.60.2026.04.27.03.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:05:46 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 15:34:55 +0530
Subject: [PATCH v8 4/6] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-add-driver-for-ec-v8-4-702f74e495f7@oss.qualcomm.com>
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
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777284317; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=eCeG46QNcGH6Tou/jfnrUot8SRLcYov2KTKbb+oU9wQ=;
 b=R4pmf9MfiwAHnwpHq4Nh2RqUo50xBcnNU0DaN0m+FpJphfpbIE4Pa095E2cFbOQge2DxKYPt+
 y66GYgeeuUxCYdPOomFmHI3WNimbhwS6xixfKHMlyGyvX5pyeRAE+aM
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwNyBTYWx0ZWRfXx0PLYt7Hk6T6
 6AquEZQr+swxmR4mJtj/tE6VxgnNUYul+zSz6uJMrYe+emIdLyGWxu3Pj+r1laRHtFZd/D2VJ39
 HlzaLGfumZhXEt2AE9ZXIBGJIsZcgR5ep11/JLNydXGeckZbKRxLFgGHI1shZMoIWsXZXIpKkp6
 fSpADbzdn+uF2xkunIWUPt5JmTdq/EAtJZ2XEHVdQLu1ArWABUx7+YW4rMi7ooidE7dp+l1tQMY
 YPpqWi/a8OqmfHtsNDPLTEkrTAVTM86Gmc3CXtXXPhbTSe/gqMq64gopUzPJAHv5CnqrqhjpzRL
 y9rUMRoHxDUjzWBh8N7Lq9o2s6ls/4xBmtVrbwlqmKSzga8nr5edTpFbjuCd2aRcq+R/5V25eJb
 JEB5kPZopO3+Z6uYG4R22RpSGHbW84rCQ9hPd33n+x+ZcdKf+hNvyCU3MJ9OibbcWlvga5aELYt
 rvXWmS/W2VOcq7SMBpg==
X-Proofpoint-GUID: wrN9smQc-0k47RUt-J3skiOWcnEIULxO
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef34fb cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: wrN9smQc-0k47RUt-J3skiOWcnEIULxO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270107

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index a9c5c523575e..9602d65c8b3d 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1523,6 +1533,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
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

