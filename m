Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AB63E9F7C
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936681; cv=none; b=TKChhZv8xPt4U9IzjiK6DBWwMxw2ZDZ811ZMdrhVYK6A2eofp3reakfa3waHzzTGlBEa3f6CxgB/9teQQAwknREN1kOrLe7exdVgtaN+hyVrLjjniY0NfVHnjln5eOXjwpkAPfMe1LbyCMC/W6Guk+jh06ftcfGgts55r/7gtW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936681; c=relaxed/simple;
	bh=I67SAyES6GkHk6EVmG3C77aUXjElzOIeuDKZj/y0SCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=skTjCNNM2MagXBx1fh6ZVRiRhm514zEuOrE2f+494UF3aP5ST3dlUdC5tJp8A4MXvz6iEKNSPHNDTNr7R5Q5RJa0G2uKVNfRDuv6pawlT7cbPC4ETZJhzkuoNY4eGnfNNvvG+iGWT1y+GjfDkuOqDHltHQDeTSagtypGwafNFwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ae5QsglD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=duiKaGc2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ae5QsglD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="duiKaGc2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEXNa33648192
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 16:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Q2GuadJ1cZYo7UfUMdzhOmnFdwm/5ltCsFBL4t2bdA=; b=ae5QsglDralovOmD
	W5BRrJob800EW4J5Bt5TPADNJHwm8d2oyEvwFqJxsT9PUob2yE0sKM9XBR9pwVgr
	IfBWroO0UjmT9RkVroOoXZh4CUeHNYycPWa1dFhld3gKgp/a9UYOlRan2duw+sQx
	qW+ITL3H+6bMORwRf6H36U54tJGyW8TqfGjxZzTidAP6ffk+K71pRicZfDl+WsZr
	9rEINrGjWTKYVVLilGUDZ+7G9/kQOscZskXHGvqg7AwFh+iaJRfLQDPwgp+A86KB
	OGVfWyaCuYBlyfa1HIWa2LdKXCZrKKVdbD63RhUoOFEfv84AwN6e17mKuWksiocj
	TYULhQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0k0v8c61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 16:11:16 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6028957144bso1669200137.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2026 09:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773936676; x=1774541476; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Q2GuadJ1cZYo7UfUMdzhOmnFdwm/5ltCsFBL4t2bdA=;
        b=duiKaGc2jqJKJsguBVKGerzYGwgpe0IbfJK8UwyjnpBifwaBJVGv9WwhfND3XMwI9G
         47WYThcUtU1111sbCSXXL8vVGE6/xvayPOTR6w4Fn+FHMMbcKQmuuFeQ3p50hL0sQ2wY
         MFLjpErHTIbmXnbGibg2ayF5RFmH36+Iz/JfCK+CeI55pdNTZiYEjvC99YYqpFdx+h7Z
         mrnNELN1l9A5ykNvc+1ZDVbFsJQAYbyfjC42tUCqAStA+Stc67OoMZXNa2DTYY1Vdi/z
         ZIu0PUri/Cwj0u7JCSCsUbupk61tE7TGFC+88lFL2CgFI8lktcc4RLo97lz7JViM93Do
         7Hdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936676; x=1774541476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2Q2GuadJ1cZYo7UfUMdzhOmnFdwm/5ltCsFBL4t2bdA=;
        b=F28WyV5yoc2FQYSDwnYNd1qgIuav6un45Dzg16oKu9u1rEOhbLsRAmtR8116ls7tvs
         7xGL9MYdSU8Z82WZnl46u8wUKeelh13zywcQjPUFNy+qyGrX8mmj0fFUQ85X7pv3H9fk
         rrZLeeo6gU460OwR157PYrAg8Ywlt94Gqu62EH6bQUBWTFTpe7lcybi5jM6zEqrFj9lL
         n1d/K5s+axjKDN/KOFx9WCxtm+Qw0XwNCtHphA6bTEwNEaQuFB2m9kIVNDlQuXWy2AB/
         KsFlXsaJuJo+GTNSiWTVnq9Lq2TtEVAeqd5cJVFOAuU1Ze6rIWldDGkrST9EUOMMNsi5
         7MxA==
X-Forwarded-Encrypted: i=1; AJvYcCX0vb2CxljkSVPy1RsHxij/H6D5xC4umtB3ktDUYLmGI3QQD6XHgcg3h9ZQOdHcpEHctvS3t2sPSDhQODRoPQOl0BKR@vger.kernel.org
X-Gm-Message-State: AOJu0YyxWHR3zz2hTNhQTvj5yTxc7Ao9iqK5cKvib0cg33QhFh2yNSm4
	1SCRXobXHyXYgM4dTxn/RzSmB9RvkKMC2G2d5zgmXNX4/eHcYO1Wcji8SzQV86egWelPA6CmW5j
	XEzAocswehSfV7CybBewgG+VQSZjK2lBWG5rZ+k5ofYJRrcGM2UfCsxtLdopfcP6V6FD2PvZdPN
	IP
X-Gm-Gg: ATEYQzxmrCebwDYPzQxAiJJg8vByPIV9LMM9Op2qE9sKkok1D2ci1IlAJcBKjokUqpQ
	dQaI4j7CrXn+dx3xswQ1RAj29HarXaGMx+KAybWdAdVSeVBaeSvGSx+X4KPnRm3KWqzBWh/wIGn
	Y/wmfwo1zc1F7WEThd5txiQz7PdGTF3sYCydd4O56MbADt7CwWFu+hIrr10P5jM94G/pb7JCivX
	OGBo/ELm7Y2jbQNVV1+nKto6J6XwouqUDN+th1B+k4pHwy3t8xBrYKcIVjPSK1Ls5qugagf52iX
	W3Xt01tX6tZfRQ4pSVDh10Jc+HsdblZsSIp0zQdkoZNO0AQ8oIq95lXsNOE1YiKcKBHUOorOQ6E
	TojxyU2v2fShuAhyUVMsGeBWx/teOwFsrpLQ1bk/pV/aahIxHT4AE
X-Received: by 2002:a05:6102:578c:b0:5f9:3aaf:fa27 with SMTP id ada2fe7eead31-602aeac9366mr64406137.6.1773936675942;
        Thu, 19 Mar 2026 09:11:15 -0700 (PDT)
X-Received: by 2002:a05:6102:578c:b0:5f9:3aaf:fa27 with SMTP id ada2fe7eead31-602aeac9366mr64347137.6.1773936675430;
        Thu, 19 Mar 2026 09:11:15 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9d74:8015:408c:d719])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e5495csm83756915e9.2.2026.03.19.09.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:11:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:10:56 +0100
Subject: [PATCH 3/4] pinctrl: intel: expose software nodes for cherryiew
 GPIO devices
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-baytrail-real-swnode-v1-3-75f2264ae49f@oss.qualcomm.com>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
In-Reply-To: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3561;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=I67SAyES6GkHk6EVmG3C77aUXjElzOIeuDKZj/y0SCw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpvCAXEnJzDyeXAAVMRIOFLd0zwqHan4F1WlNDA
 lZleC9Bf/OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabwgFwAKCRAFnS7L/zaE
 w7rKD/9ebc0m2OnjoRJCvYcI3h+8uUAgw8SmyXwbhEMtyuB22rwIi+20Uvm2hQC81KqwRrOLzFl
 nOhDRzRajq9qFORRtv4ZfkqGx5Rpushh9f4Rs766oexYU92ifOlerWTAjmVlrrCes3mR4qRHvoH
 JA9pz2ihldbfUK4rpJELslC3DWsnQOPc1ePChrZmjpxHmQqvkAsifhrRpAWZFoQx/v+H8ALtPr8
 I6nb6gg6gCADVrjIAOn1IUlH5BWubBZQvq5WoDtRlVRfAxGNcRXumvhWIKYUNL0Vtl5O0pS2G/W
 ZvBLUY2VkUuVjeoCNXVED2wUcfQx+ujYK+RCZ8NGVdvdkcyF7moB+Bc63mlvBoccTlMuWC/lmUY
 mv52A8XCMB3WBibL3H20AznahHrp7uiIeTL3u/bSJ04+lABriXB1B9tGDQyGbRfsnq3hHHRcEDw
 R4dl/iwlA6RUWMp6TDdgUQJJsqQfELHD/zfn7RMGiPHoMGznoxUkz/TmuA/W9L0SsFBZuk8S8eT
 aKQa63Tp+J4WCZFZnP5QdQI9nPvacHN3xJ4Apgf1/Y15kCVx8eo+wzR8P4zw/jVOrIc7jdf8K+w
 wSUR9ikK6ednoWiCSEAZzmSVkIDceM3m1Vtd/NK7QRfTvt9AYbtDWJaewQjMwLFPs8xgnylW9dW
 rG2r49dLtIW8VEQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 2RoXTzQda1nunfagMlXMUTrcfQfyHwce
X-Authority-Analysis: v=2.4 cv=EcjFgfmC c=1 sm=1 tr=0 ts=69bc2024 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=nG9bRbd_0SKyiAKh2pMA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: 2RoXTzQda1nunfagMlXMUTrcfQfyHwce
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyOSBTYWx0ZWRfX84xM7JtmqA7D
 6oni4ve1n5ir8WB1cpCRfjOFNxxrU0aykNwnFKdaQ68e6+KSTtpSZe2SeQdvlGtICiAH7az5Ewj
 Vf5mOPCUkoJfb7SPM+vXiXH942r4puB2tWKA5r7tPuf6c6Bug2MgtVkKbTTpB6ApPepzRLCJQw3
 kfXTLIg1B3t4sB9YU/4YHWfuvGiVxp8P8Y4XODObWdQXUpI1DsXamoKuZW82GsYqPPBB+BBwKOJ
 k7PeRuY1Lu07CZOn5H+yXpZGGr1rnZo1Rr2GubuS29KHHvA7Bnsr+mU6DYH9LK92MlZmPWkFeaL
 tONwfFApjz62bU2gZY//HcJiszhIYdxdGZEfiXAfl1tvwyw6otY2W0B5TpcnIq/QN2R7o/3LojK
 HbjjVicNr77UNbMtz0Y9tI8VJTCUrRE63ValpZsJOE3cDWP6GidCSqyt4giOAxLP87xDimmqGC8
 ogSRFNHewSGOEAiu8sg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190129

Use the new automatic secondary fwnode API to ensure that when the
cherryview pinctrl device is added to the platform bus, the static
software node provided for drivers not able to use ACPI will get
automatically assigned as the secondary fwnode of the primary ACPI node.

Update the existing intel.h header with new symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 47 +++++++++++++++++++++++++++++-
 include/linux/pinctrl/intel.h              |  5 ++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index a33eca5eafc44ee3337c4665967682404cb6ece0..45e52a796c8201c844127dbab497b4b3002930dc 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -21,6 +21,7 @@
 #include <linux/types.h>
 
 #include <linux/pinctrl/consumer.h>
+#include <linux/pinctrl/intel.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -1769,15 +1770,59 @@ static struct platform_driver chv_pinctrl_driver = {
 	},
 };
 
+const struct software_node cherryview_gpio_node_00 = {
+	.name = "INT33FF:00",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_00, "PINCTRL_INTEL");
+
+const struct software_node cherryview_gpio_node_01 = {
+	.name = "INT33FF:01",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_01, "PINCTRL_INTEL");
+
+const struct software_node cherryview_gpio_node_02 = {
+	.name = "INT33FF:02",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_02, "PINCTRL_INTEL");
+
+const struct software_node cherryview_gpio_node_03 = {
+	.name = "INT33FF:03",
+};
+EXPORT_SYMBOL_NS_GPL(cherryview_gpio_node_03, "PINCTRL_INTEL");
+
+static const struct software_node *chv_gpio_node_group[] = {
+	&cherryview_gpio_node_00,
+	&cherryview_gpio_node_01,
+	&cherryview_gpio_node_02,
+	&cherryview_gpio_node_03,
+	NULL
+};
+
+static struct software_node_auto_secondary chv_auto_secondary = {
+	.node_group = chv_gpio_node_group,
+	.bus = &platform_bus_type,
+};
+
 static int __init chv_pinctrl_init(void)
 {
-	return platform_driver_register(&chv_pinctrl_driver);
+	int ret;
+
+	ret = software_node_register_auto_secondary(&chv_auto_secondary);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&chv_pinctrl_driver);
+	if (ret)
+		software_node_unregister_auto_secondary(&chv_auto_secondary);
+
+	return ret;
 }
 subsys_initcall(chv_pinctrl_init);
 
 static void __exit chv_pinctrl_exit(void)
 {
 	platform_driver_unregister(&chv_pinctrl_driver);
+	software_node_unregister_auto_secondary(&chv_auto_secondary);
 }
 module_exit(chv_pinctrl_exit);
 
diff --git a/include/linux/pinctrl/intel.h b/include/linux/pinctrl/intel.h
index d45f090adc1f532f866c98aeca144a4d83fa28f4..bd3e6ee8b15ebc492275a14ae6d53827b701f783 100644
--- a/include/linux/pinctrl/intel.h
+++ b/include/linux/pinctrl/intel.h
@@ -9,4 +9,9 @@ extern const struct software_node baytrail_gpio_node_00;
 extern const struct software_node baytrail_gpio_node_01;
 extern const struct software_node baytrail_gpio_node_02;
 
+extern const struct software_node cherryview_gpio_node_00;
+extern const struct software_node cherryview_gpio_node_01;
+extern const struct software_node cherryview_gpio_node_02;
+extern const struct software_node cherryview_gpio_node_03;
+
 #endif /* __LINUX_PINCTRL_INTEL_H */

-- 
2.47.3

