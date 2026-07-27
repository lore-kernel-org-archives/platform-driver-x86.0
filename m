Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDEB3F86E6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 14:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163403; cv=none; b=VoVqUxkzvmYQnvPsU/1fWl0+iMdvPtbOb81asLBZ6/xk+PSNSvHJ/nO8kRgBjkNvjpB7Y5PI5XpC+qIEpU5SdgvWWQHQHlGK81e6Fp1XbiIlSOa9x1xgQIWVPYJEEsPEb2JWntjqcOW2qVZIuJ0aOPgE836pJwRe/0uWKrQ3Y3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163403; c=relaxed/simple;
	bh=6K5tiSlzsncg4FkPtoee6fhmILmD3n2OmHv5dJDH9Ig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ie3aP4UT/Rwbr6oO8buyDg43ZKT+yzjBK9q5kPv8hVXVZtGXADsTymZKjYneZS1Lbc3axJg5TBzOt7azbbK3qSIBBDfbE/0H6V17U4rReZEG+6eA9Ankqz8Y1L4X9j20br/EZY7sxn6Zcdoch8DTlEDySmoTQ/mFA0tBh+KfdJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6D20Q0H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnWCf5rv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6D20Q0H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnWCf5rv"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlZDU4115070
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 14:43:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=42pBso3LISJ7Zb0g5z0Oloz6vbI/ciJmivh
	lkvoWhkI=; b=A6D20Q0Hb41w7me5Rgv1r154Xp1/OUgeMQuJmOPgseWk2zIuovS
	xb+1SFkhN9OQ7m7XQheJBGzrjwZUpWArzE9HSnujil/v797WIJgsFB2ZO0RjpEa/
	XMkWQvjJss5l03JBUVWehRoVI8vtLJeL1d7XTUg3Mo2V0uMe2RSwGA2uGBXTk0d8
	d6awTNW79CeWKiS9ugyxsHoN8PxRK1tWC3jqImJ3cQ7QrF1oyOYqCjuuGiY+G7Hc
	bfKogDy6RiwW5RmCXrrIOCVRy3dOIQ+wWqQKUPgO2P3zKkLI0iOxy2zkGBx+eS2i
	0TVheGgjSRdgBYwsJya1hzs5oSkfpMlQDYA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4mrs7wn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 14:43:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5174a236220so31642311cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2026 07:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785163397; x=1785768197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=42pBso3LISJ7Zb0g5z0Oloz6vbI/ciJmivhlkvoWhkI=;
        b=gnWCf5rvRmtdwXQx8o4EUx9zt3R5xPIxNkTwf5ELR2n1poIfWGShKuwxE33jCsD8be
         myWjyF0ztiPzvm9PjgBFHiD/AnXcvAZkq+ReDlO/uSJwKgyZ0Llf/I6oQuXtWq6zNhg3
         CW3pckufxM4kI2BlnDX8j3yrRMEAZbGp+qBMxZd5Zpe3A0L5TcaXenWy+m8Pf7vEDK79
         d+LmbvKrVP1wnjioMAW1wxXq1NR/8rj4xfG/Yh+SOyxRpF5xzaiuLhHejm4jMxGPjEF3
         5VPLBIrzl+3kWSW/jVZwWMpVpXuGpuHRIFFzKqDT9qx5Dd8sHX2WCxIROHY2u3fJZkbd
         PJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163397; x=1785768197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=42pBso3LISJ7Zb0g5z0Oloz6vbI/ciJmivhlkvoWhkI=;
        b=bfqPBgp8PS3NKbb4AOY5Vvg47ngiTJOFVMJZ16kO1ijLNfaNWRDiWD3MbT0k/gGROZ
         CVyj7S4w1LysOEVd0d8AhLKXtwAsxkm/kHS+3WjWLnaHYbho5IiVfcbDzAQAxTRiP1su
         q79kCdPMnDJeMwduKKYaeCWL7b7TGIeFiLZJqDhUqmA/BFrQkIKlwQptxjS/8wyfMZkI
         U9TxvgJ3XkZ/fUIc/mrVwvN/z8DL8WfzH7aQi7yIioarTiJVQlzbRlAVvfxQqCmaaJiG
         vvS/oYeE2oiIc6yqjBcphcm7HYKQREln9j9LQg8BLX8eStuvP1/9BYty/DbYcc4xJ9NA
         rk9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrIEkLcYaUklfy/EBW9uLkyEjLCwunSh8NHg0tsHKavgbFuc3jlhYQa5hXtOGzBc0/m73fgO7fdFF65fvO5/uzZssQR@vger.kernel.org
X-Gm-Message-State: AOJu0YyM1xJHbCnGxZvC1nmnh0fKGm4dDhyrWzKGrJbFHuP3A9xeZYGv
	zaZW2Cd/PYp/G2CCTqdOEsC1lumW0XIBrbOLEUx6WOdWMXGvee2SrGh3xhdjQZLn2XLWwF1pSpK
	Xm4uZG9xIIGBfw8lD5QwixGkklZUmtx+qLGH+e7Eixb5xe/A29ixnVZqBqUGomMgXwaM57tDgv5
	JmzluRiS5N
X-Gm-Gg: AR+sD12XuwWQUN3ZH3aBUT2tHPJ0B5ZWAMaV0bERdWlMH+u25CjY7sgJu+QRfHGGpMS
	eBsVCPcIu9JGYBO0+tjNN5dclPWM4kAXgNQ8KcF4WT9sA5wWDaWZ87g8jGl3gLYflis1Ug7OM38
	AEHHSZqVAhxlY8cyD+IWdwKZqRrScnZZIlUXV4QAxFkijzpL7Nyexo0cDxIX2pG4kKFeymWMuUI
	JimPrmhnunMKLbFJIVtXRRk2sEFhqpJ+Rwj8HdkaDuC1oiDgQC1AOeCwnol7LgoX+PqE7ePwAJr
	ghTBzLXZNJjJy7MHmLc2tt3VyAbSyO0Z1c5I8I+nD+5igmhl/EAV16NDdyG+5rCbWzhjbaT7bFM
	w33gwWoXXWghXD9gZBV68yJpVy8g=
X-Received: by 2002:a05:622a:4009:b0:528:3163:716b with SMTP id d75a77b69052e-529ccb0c3f6mr11651571cf.3.1785163396889;
        Mon, 27 Jul 2026 07:43:16 -0700 (PDT)
X-Received: by 2002:a05:622a:4009:b0:528:3163:716b with SMTP id d75a77b69052e-529ccb0c3f6mr11651281cf.3.1785163396448;
        Mon, 27 Jul 2026 07:43:16 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1449:2d40:6dd2:20d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957b5ed646sm236938845e9.0.2026.07.27.07.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:43:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Danilo Krummrich <dakr@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] platform/surface: gpe: add missing err.h include
Date: Mon, 27 Jul 2026 16:43:08 +0200
Message-ID: <20260727144308.61842-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfX80RJZ6j6ttQA
 VB6w4dNxNfyJv7pP1VwpSmnxkYU5sXNo/eqGJ+5Jqylp/IaI/m3+/Mz4g2iztXCA71iwmeRQgWV
 JMzHOL9Bg5a01TYcYakVDipNB5fHGSY=
X-Authority-Analysis: v=2.4 cv=UYBhjqSN c=1 sm=1 tr=0 ts=6a676e85 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ihY1yBl6Li-yio5GuEYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 44bqIlgkPpL_mO7VmMqX3LM_1Y8x3kRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzOSBTYWx0ZWRfXyecGOazzbibh
 TqKi4WiMn9a9u52/GmYNrPenluJ7yVKUVos1l09cPMT62WWwrbY6KX6BbZrLewF40JB0m3/s20h
 0UYVrWlOeoa5/ZtLdUCo8gxtp4+7r9sYkUiW3NpD5clyDzIxHXpsWLHExVZ77/zoja1IAvxTGOI
 EkYGRUpa/Hqji6KbWe9mobzoTelWx//eTq+riwEmMm/ffUnUlFq0hiXlECvELFOcvzXlz+2ld0U
 ceHFj/7FCDEb9z9AhfAMxKEbR+w3wPRfowLMOQ7LfXCLLoYVDrvKcHHI64v8kxiSerg6i21oKoQ
 o7XshxbgWe5WRMPgap+YdPssb1CRslVMNAAHPDa5NGr+YR5vLok46GYLrBh52Va9rLt/xbG77RY
 H28vF7qV7sD6YSebYfuVZahDQo/+p8Fb0ZgCRyJa0YEhgN1raD0X6g2aZw6Q12FS+lEq8PU5384
 y1WHl624wgn8rXuB91g==
X-Proofpoint-ORIG-GUID: 44bqIlgkPpL_mO7VmMqX3LM_1Y8x3kRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270139

We now use PTR_ERR() and IS_ERR() in this module so pull in the header
that provides them.

Fixes: 1e0bd438b876 ("platform/surface: gpe: use platform_device_register_full()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
This must go through the driver core tree as a follow up to the commit
it fixes.

 drivers/platform/surface/surface_gpe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index 4ca7ad76f3b9d..29b264f2a444e 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -11,6 +11,7 @@
 
 #include <linux/acpi.h>
 #include <linux/dmi.h>
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.47.3

