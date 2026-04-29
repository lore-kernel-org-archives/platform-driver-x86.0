Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42993C9456
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455975; cv=none; b=VOnruPbLcpngV6n9GenpQUNPy9kGKZYkKpD56M3WKl0x5NgWa4B1AhoDQK3G5lWEkE3M/iF9K7RF8vCCG84s5Is+IkRrTpyERu+vBZ2aU4eSWudcD5Cn07mOp9wtoFs6pr4P9/PALdBuAF0UYI84oQfe60eDtjO/WGpD+o2QsrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455975; c=relaxed/simple;
	bh=1K8w7lxDrP55HsV1q/9JgVmIz67vDIT+jUX+tUBt+zY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KCeGy9fAKLoLBIn/m0IYSoUaMAA/f+DSiXs66/VHRYaStYwsfj2yCqvF5xe5yble1BwiggMTVD5Y00I/ryuKcw/tXM9/GRDVCzKgh3XzPn3jcrAhBQx6oJxQ5fFpwJBTSFbVZEBjd9htxAGyKsL8HL+KG/Kw8yoqt443eO6MnPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1654DNk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W+AkAyMr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1654DNk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W+AkAyMr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8pvWl1728671
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 09:46:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=mK9njPLfxQmvLUwQ4l/zN9
	+BokhHC7gLxYXXmvT5ZKc=; b=T1654DNk8CqjXJZRxuT38ljzn6yLEIhO6ufwhD
	Pak5K7wj+1+NwuXuZqAK2anokdbdIdU1msGo717QAEE+LJLqX3SWDlgKS+oiD9+D
	bV7bGgA5fU4eYkea6NnzZmhiwhyf5TZCd6L2K8aEaDShQxorKWAqT+CuYmv7Sbq9
	cXSi8jiMwmZQBaE42sHFigyjwWbMxs/Lfx5OwrVQ7JR/g+oZwg8VNdfy/tCX/mo8
	cWcGnScJdI+kScAqpYrklx8FNPqAdoPlrybK4XCQeLn7IznKRZEq+YQDuTFGcmoy
	fsl93cXdtUBCvSYhtVldZc0bQg0fp5A7TF7rhqrinHZNttaA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4due5krdmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 09:46:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so132846421cf.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Apr 2026 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777455972; x=1778060772; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mK9njPLfxQmvLUwQ4l/zN9+BokhHC7gLxYXXmvT5ZKc=;
        b=W+AkAyMrF4npqDe8P6o45KtjvR3MLA7XmKg7GOwHGCamfzKxGM+qVzzvWr+76ZykQU
         ITivo3U9Yi2d1TZZQgxSQoRb7EcUJg5h+d+isLmCe3OJs6COdhFYxBiCXMTXRRzFyCAs
         Uj37GWRk47gyUd1SOz53jRZqQio+AJJRXuTGthE/2aPfzaKgNH2EwcMds3WbBJaOyjFS
         mHdrc5v+/cV0nzCHZBruEqdrFi/eKaEaDf5CZuLtCMt+aRK+kMLRsqdzDbeMctKvBVzb
         uAIIIfyBfZqH4mgQteHnbBY/IDN3o7KYzBgrwDC4YPg+xt3I4wnl0SIccI2yZfFsNx+r
         TVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777455972; x=1778060772;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mK9njPLfxQmvLUwQ4l/zN9+BokhHC7gLxYXXmvT5ZKc=;
        b=qumd9tFSnnvV3Cna+fEJ+b6XE4DlpPgi/8lJKjQg3E6ZtmtV3Pij7/2efuiP/ZY1KB
         On00xF/l5pOeF+iFxx2AtIzJ97qh4EfS4Z+hLCctlU/lnP6OjEA/1K+lMDsjTOBzlUQW
         r80DXR9vZymUUugRHSrKJphMvd3sbydVVxYOaeCOFgY0cp2FcPpuh4R3htuchwShGZyz
         kTQMLW+n248Nj2Im40iHrPy+GyIbUccAUvAjmQS3ivB++sEkGLJs8Yl8CZN/BLhtSgrc
         kKsKXYrFuwYYqBc0HzFSxiNvPTWbKJrz6IVg5VV6CKtA8sOXr+xB2IT0luoBF5Bs0fZK
         IwMQ==
X-Forwarded-Encrypted: i=1; AFNElJ827Lzd+WaxV2KcL+vjfM6I437EqRPpOF7s6YBv+3xZv3rhtQR7i9u33QGIqmAD6UWIpA3pBsN1i+3xXT5U91KEVada@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9iTyp6PKPJAv+mPHFv7wqx2kXckDvF/dU6yCThPLWlsC3XBHI
	lc5CVjAk49ipMETHO2BvvGyLTI/o5THYJAy4D3XFuxioVyE6aQU87dc5oshthlvA+eCbdbbjHdn
	JoUjNIQjsqcNUfsdsHr/eic69qUIIWXt1Zroum3r6bdQlv+o9vxnzCkdYVDyDd2QDrTWdwLdrNg
	FNpt2y8H6s
X-Gm-Gg: AeBDievhWH/QOYy4vzgny786PLjZGywVMcakd0EL1ADSRpi+wW/qPUkpAkiscwVAPmE
	1hjtwwJGw2LX3/OMU5lf3McdfZ6t4fSIc5X7wkLToF82qlD8r6rwi+ylBOKiNIuodFYnKLW1/CK
	+G9mDK8G4soFf1W2ncv61JobmghfW8xZHgAZ5O5jIodm3sWiLol+zh3MeAckmF1JEP4rYiA5Is4
	Ro+qqwap9EvIwItTrmkc1ppAA3CMnxywGEB8DZFvdAIzK4zoUvTLVkxfdCw6SqG+96vQvmqYrRF
	3P4wQlUjYqA1ZgWZsU38lUbyzGHTsPoA6xIjuCiU1aR/DqT1eap8dJupKwVEifB/89TEvn6jjCU
	bMNSE+bsFrVSjA79HgwwkgzJeGlWY6i9TZcQAs8TS4panCTldQ1ji0USuGSsmqA==
X-Received: by 2002:ac8:59d1:0:b0:50d:aa29:2b64 with SMTP id d75a77b69052e-51018a3437amr45635541cf.33.1777455972048;
        Wed, 29 Apr 2026 02:46:12 -0700 (PDT)
X-Received: by 2002:ac8:59d1:0:b0:50d:aa29:2b64 with SMTP id d75a77b69052e-51018a3437amr45635181cf.33.1777455971552;
        Wed, 29 Apr 2026 02:46:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:668a:d11c:cbb3:a94f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c57335csm44559115e9.3.2026.04.29.02.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 02:46:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:46:01 +0200
Subject: [PATCH] platform/x86: pcengines-apuv2: reduce indiraction in
 swnode assignment
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-pcengines-apuv2-swnodes-v1-1-cd1a6fad856d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFjT8WkC/x3MPQqAMAxA4atIZgs1FKVeRRy0Rs0SS4M/IL27x
 fEb3ntBKTEp9NULiS5WPqSgqSsI+yQbGV6KAS221qE3MZBsLKRmiueFRm85lqKANnjs/Gydg1L
 HRCs//3kYc/4Ae1PIz2kAAAA=
X-Change-ID: 20260429-pcengines-apuv2-swnodes-c20c9279b044
To: Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1K8w7lxDrP55HsV1q/9JgVmIz67vDIT+jUX+tUBt+zY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8dNdhS2MlkoPjYPTnUm4YKeTUTvY25pruGjgS
 PtuYpBuNe2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafHTXQAKCRAFnS7L/zaE
 w6oWD/9mxejkAW7Gamwdl3J3c4Bu+DlakZD8PleokZqCOpqUgykRFU/U4IcsBeoNn2Pez4rdQ2Z
 zMsNv0uLv7Byhv6iSLWjf7+4/T6XjuRWtpkWSi4JHifnWNrs9cTieVxphGjf3griv3RzqJrMRB1
 YMGhmmLgUeqYDqpwMMq+DkAYsk3F3J7/w+lswxMhUfqHVBE6cFHxfI4r+xGx1YjuUzW9GIgnkfj
 WwACVXDzcZmLwIu24Sbiyu0fqUpDw488D5pUw35AckTdd2bg8wVa0Alocjx5MxWqAB/XQLFidlr
 5Lcj9PrafBrsiVyfAFfv5FdS+vWVGFz/5Q3MHWGG8yD2iUqUYtfv7It9B6Qeq9+Ov2yDjzU2qlr
 s4gfVWPTqdZdKluc7u2myxPZA09fVc48GEOc3LX1Jguknp6yUWV2sNb7FlFkWusnuq2At49t12Z
 180KcprSIWyKH4sXRwayA6jiffFjsceiG21FqaRQl9F1poM3FBG8V7+lh+BhcbQ+FH+D3/RDczt
 7KyS+78o/o04vtdAtaaUX9XEl8/2ixhb/zo+2476JHwJ9kNAeCXpy36jQlcFRNf4K4VRbtu/7kz
 fGBbKtzOZkYYR0qlIzEofXIlQv1nNdYfn9v35YLSQMvursUlLebh0NVJtt+q63pnlHhXavKwsb3
 m9E+BsCDP4h5GMQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5OCBTYWx0ZWRfX19uHyidVeRb8
 IXJcI3aTiDaycGUL6BokXwQy2Kk8ZOpRz3BaHzME4WO8p/YayoM5IIJ3w/rmJoM7MBSVgVCZDDC
 DT2dvbttgo+ODHdROC5Xte1NPgmSBjwpmEGrGTF0NMhHe946FSs52ljrdapZtESoDvvOdkMkQT+
 szoftnrGed9AX8qjcBLLkLxCygdtflyHkvzUl/O+Vnxf1P2mG+sNGk0Wgih0DmcLL9r03PPa9xG
 krCbCEtKw0uBYBxGzwbvlwTfvxpvAkac4m1rgBSZ6r4k0xRRnTth24gLkpiwGIy8We6fzBTHMaL
 B/b5zmQ7UV3mYPJMQWxu9n+GDG3Po0C69ZX5fpeKKTZOdIXw8aZzFaoyBb1/WO1FrhUk8oZZZE8
 lu52ETBIdXY8x9X4LpTiTjKpLX6fs79j8PfuN80ZTjiJU8EXQvnMyOY17sgQoOuUa7v2iGIxsNn
 5uCcjgbXXeIFu9XDDMA==
X-Proofpoint-GUID: al8Q2Ebb2hdmxzUDAXk-VY3fNoKXMXwN
X-Proofpoint-ORIG-GUID: al8Q2Ebb2hdmxzUDAXk-VY3fNoKXMXwN
X-Authority-Analysis: v=2.4 cv=CL4amxrD c=1 sm=1 tr=0 ts=69f1d364 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=9Q85iZQ3lMrl2ID22CkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290098

struct platform_device_info now has the 'swnode' field allowing passing
software nodes directly to platform_device_register_full() without going
through software_node_fwnode(). It supports both registered and
unregistered software nodes. Use it to drop one layer of indirection.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/pcengines-apuv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
index 3f19589d1ba032d8360a56a6f8efef14c8e87049..8ac5f719c5a39b3511d7f4e4d752adc9d99eabfc 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -262,7 +262,7 @@ static struct platform_device * __init apu_create_pdev(const char *name,
 		.id = PLATFORM_DEVID_NONE,
 		.data = data,
 		.size_data = size,
-		.fwnode = software_node_fwnode(swnode),
+		.swnode = swnode,
 	};
 	struct platform_device *pdev;
 	int err;

---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260429-pcengines-apuv2-swnodes-c20c9279b044

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

