Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D196A309EE6
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777285508; cv=none; b=AEZmwbPld4cMqCXmROak8DDXyURA1pn0SLnFNPE4TEQXmjIP6Ij9QxZQ7HezZEP5iafcxDFvhD8MEXyInofhlhXGaSiDW2fjTQGStqRR2SBFYG653e7k0yx/Wb9U9Jsbh/3wVtyzFzujdzZSgyhlV/P+j7PA/IV01cWgR1+Aq3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777285508; c=relaxed/simple;
	bh=l8gVTRdjEjPX6DpjWTp0ne9Dim2eG8RQY01cFfNNruk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Os7mZ2qHpPcU4z0f+i10TDp6Fd0oCNbiB/z77JikKVsFve0MOtcZSz8hQW7SKMd6yVO3RWz3b2nlD5PZo8aA5JH7NdtT0O9IKflRBGNLd8JjfQRQsE3X6gL+dXO/uJwe90JD3l5JsGVGG/aCNkauIlghVEQebfqGbWcTndY9t4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fGspDwYY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vwqjp+Os; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fGspDwYY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vwqjp+Os"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8T8BI861176
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eZfNJqu/A7eiYqq2K7AqxJkwTucV3roYkxu
	CZrxlbk0=; b=fGspDwYY4NrhSFIB7TzoPitu5cxeK3A94PBIqqwTpTlfDi9Wf/D
	KZSuXB7ny5DJaos3F45JFuXvO2194tRLZTo3F4/rC3ErGmlQ3abmbMA6+01/Vg9K
	XWiGhm2B+2gY0VCDmYoBfDdCoLXgOgNnTWQews6mliBC7XtfO5Pet2LPlaNN8YK7
	qyf5JNaZNuAEA2vOYx7mmUGcUEcvKl4tGJCkw4XKLZ8YzqR4bKr8A1NQWgdeXWMn
	giLdTRr4LFqX+iIG4akGFCOyvQM5Uv4D/Q/QqoZYt2tIHMLme13AOfgwumlVgKML
	nzFc4GOP1Ipr9OuuDZ9ZZyttJQdGRlRbnGA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnpw5nus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 10:25:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3403e99so182258371cf.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2026 03:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777285505; x=1777890305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eZfNJqu/A7eiYqq2K7AqxJkwTucV3roYkxuCZrxlbk0=;
        b=Vwqjp+OszOeGzOUAoyuBzXD3sOYXSQjQ5cgTRAcXqzuYSKIqOh+bI6YnFTzMFOkff4
         fjwkf7pRFPMdUE7lAGLJUtacn4sTDO0clrdigB5eGtTXBi+JFEUJ6P5ujrFL/bEKBz3q
         8xOzzc4S7CZ23ZAkGgFERoa8JMw3UvTaHDB5ZTXO6RxBIxM8z2ZktZTAg8tf+2BloDpg
         xtdqS46x7qpz8cy5zjYC+bW/9EXueFmYgGRPQze4LF0v1QycLeZYfqpM9VVBGgMQNriX
         D4devwQR4OVt+2XWQ6IE9CoqYditajyTAnFY7J9Q7o2uM37Q39YUTIgcYXIJzR8W4rB+
         RdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777285505; x=1777890305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZfNJqu/A7eiYqq2K7AqxJkwTucV3roYkxuCZrxlbk0=;
        b=aMX1t5deKyHshD46PHPoR9HKOZipya18Dms9dHDtBfDxOCF7zaY5AI95zNcm10CJwB
         gQrs0YNEdUhf9WJvIYKqzJclfJSPx8yX74kYKVhB0VLLdKnMdOa/oSH0N8W5/cZz2eGQ
         RYXTIjjwkIHexFw3fLIMrVXzmdEvuM6umDWfRs6WksY42ZWVxuRfTAF1kJC6FeatvQUO
         Ls4G7VKXXx7+Wkxd1DGw9oqGpTHoYAIrcHpbHa/hfd0CibdYZJZMV817+qoyG1z3HTB7
         6HLKfRCZGQG6bckgPOdkNrL7hIIaxfIh9x2pDCMjV8RLvuVgFw5PeMCLBuKYReHg20kl
         zGCA==
X-Gm-Message-State: AOJu0YxtBRuNFIV3q4LXx63kBqOCb+iJtuAdhR1rf7LZzAgLlOn06B9W
	E6ynZjHEGHqzulUi3U4YinoUjxNnt3NpATWdV+HBsj3HkzFz6OBFecsosJnMcdtADjdVtMn78UW
	Baj0XNZmORaVQl4RNpnlizUgtgM4LeADcTkNK20AyE/gMWUW2PDzPG+2++cfwNTl22sTo5ptb3L
	Nr
X-Gm-Gg: AeBDievq4gQ8FY6RayturBEx7gqPdSe/wYk5RNlnN4Ohtpakt8owhbLGr2Xd4Tq9uJo
	1RUkYdYbc5MEOM7XZSfii77BcMOJB22jwNROvMsVH3y1j+qYzYPEIqEUN/CFh/vSMQDUIRg9pcB
	WNqcNSj/zIUC6pTZHguVFTU8IiN4nql3ws0gzxnCQpRrQTPfhPPzoDMAbb/ZTC3dSH8jMzPDspW
	H/nkoH6SqlkiqCgVwEwHDT7jqEfH5wuYgg+Yn0gPR5SVPDQG8ZWsgRCv29GPl7LXaHwPE85ZW9Q
	z0iOfb25IO6JGHUspH80YIpPPnaVQEv7ENyQ1WkF3CuwR8THLIMOar+/DVPplUcgxXawaFH8tGF
	qu0itY7gBrBvON1G5k7VrK2xt0NZ2VV3sxvvoeZ5jLhSyOovnoz6O1JbPXL3s
X-Received: by 2002:a05:622a:1446:b0:50e:d316:fa39 with SMTP id d75a77b69052e-50ed3170229mr458440091cf.35.1777285505184;
        Mon, 27 Apr 2026 03:25:05 -0700 (PDT)
X-Received: by 2002:a05:622a:1446:b0:50e:d316:fa39 with SMTP id d75a77b69052e-50ed3170229mr458439751cf.35.1777285504782;
        Mon, 27 Apr 2026 03:25:04 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1c0354sm723208115e9.11.2026.04.27.03.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:25:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2] platform/x86: barco-p50-gpio: attach software node to its target GPIO device
Date: Mon, 27 Apr 2026 12:24:58 +0200
Message-ID: <20260427102459.110332-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExMCBTYWx0ZWRfX5BzdM1VHK+80
 NhcbJT0Qte/EYqrP8S1oiIQfn6Z7mgAkFkb3lT/v29K8mKESyqunJYbFe6BI5BxJUMlXJjXHVvZ
 P/hgbfZCSwwLe0RejQQmqJNDG8h06S1riqrbRTVdRgLooLBsM6TbMg4T3khv4FZ2FWzorE2fJn8
 q72dVedh/TKo6rnJvzB+PZWIMyFRF76Qzp1rpLvUTVOS9tJQx57rlNaQ5GIHB29qw90Hl7PWrgL
 vpPWPIFgS23gmhxz+iQ+yGI57eTUafS8FKysirj8MzsmNwlQZBNm+4onaSY2u4yiFvFK0xWAroP
 jyAIBt8z6ruidkKxkQZqIun1iSg0VqFCmhUoV/kUG4n9m7dpzAtlY60Lf6cVmOYSPG38HjeYTxR
 cYGvfFfpNrLa+n3Ppk13gW7dOHXHMjq+0ITTFR+vUudkdkIKuwJhViOaR1iuhxW6MA/DlA7QAJ7
 ig+hqqGSGKjd6DEEvUA==
X-Proofpoint-ORIG-GUID: TSTay53nVf4ewAMxhwhL-vnkqab6CMYZ
X-Authority-Analysis: v=2.4 cv=RaGgzVtv c=1 sm=1 tr=0 ts=69ef3981 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=lArYlug_uSWyOl0oBwkA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: TSTay53nVf4ewAMxhwhL-vnkqab6CMYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270110

The software node representing the GPIO controller to consumers is
"dangling": it's not really attached to the device. The GPIO lookup
relies on matching the name of the node to the chip's label. Switch to
using platform_device_register_full() and use the swnode field of struct
platform_device_info to attach the software node to the GPIO device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Use the new .swnode field of struct platform_device_info. To that end:
  switch to using platform_device_register_full() for device
  registration.

 drivers/platform/x86/barco-p50-gpio.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 2a6d8607c4026..e1400382465dc 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -124,7 +124,6 @@ static const struct software_node vendor_key_node = {
 };
 
 static const struct software_node *p50_swnodes[] = {
-	&gpiochip_node,
 	&gpio_leds_node,
 	&identify_led_node,
 	&gpio_keys_node,
@@ -424,6 +423,13 @@ MODULE_DEVICE_TABLE(dmi, dmi_ids);
 static int __init p50_module_init(void)
 {
 	struct resource res = DEFINE_RES_IO(P50_GPIO_IO_PORT_BASE, P50_PORT_CMD + 1);
+	struct platform_device_info pdevinfo = {
+		.name = DRIVER_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.res = &res,
+		.num_res = 1,
+		.swnode = &gpiochip_node,
+	};
 	int ret;
 
 	if (!dmi_first_match(dmi_ids))
@@ -433,7 +439,7 @@ static int __init p50_module_init(void)
 	if (ret)
 		return ret;
 
-	gpio_pdev = platform_device_register_simple(DRIVER_NAME, PLATFORM_DEVID_NONE, &res, 1);
+	gpio_pdev = platform_device_register_full(&pdevinfo);
 	if (IS_ERR(gpio_pdev)) {
 		pr_err("failed registering %s: %ld\n", DRIVER_NAME, PTR_ERR(gpio_pdev));
 		platform_driver_unregister(&p50_gpio_driver);
-- 
2.47.3

