Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D842FF643
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771411697; cv=none; b=qhnfS6WzBmmmaznxBmRKP/3a9FJrxLSWTY/XmL1pSPnBOt29s5+yPwcoM/X9VdpEurOz0aQ6nhwXxSltMWDPkqzn6Yahoh/6R1eIGKOQVEw8YIbM4kX3msD1qkrae88C0PPvAU0k/9JrueSKCbZ6+WKKz5WZ6IKfMDAofP1MSpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771411697; c=relaxed/simple;
	bh=p4I6eLgGRPjOxVMeO7n0rnhs9k1EdCulGiDJHuM75Po=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uWdZecTqoNupEgpNblItoUqfOcxUB89kKyM17mQH3Ab9PD272B6VXVCandz2CqNHQ4WpgHt99PrBssSkOk8q+6KaEa2oIelXaV3e3QXjSmPGIkWi1E+CkMw7BuUNNi9LWRD1+pFLMWoSH7H++VlqLpUl46w/Zz0kQTWhCC57eJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI0XJwyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SlmNnMfk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI0XJwyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SlmNnMfk"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HLlAuK2111674
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsNgWrsWp7kwiLVZlGJPzPg13q4/xkGmWurk0RM732M=; b=TI0XJwykUWalujq8
	g/QypjBKF0DW7TgbglGx4t8iEgHEzgM+wd7z0Zy3Q8xdTpGUz+weDkD/+POEEQIX
	nuvEvmFTVtH5HlzBz9zYqvDaH+PlThRAdMa/v4M7KY53lwSWK33Ey1B0ilCwUqLW
	muq1/BcmmlVS10ygQSS4tvZMzPiWH1uDixFcNXqrbRiWbDfD0IVTkQrj8I7ukMDe
	YwdUda9mitmqq2MEkNKC5EC+ujGDdx3ihjkANTYtVT7rXAeLiDjZ0TjzGfYzsch0
	CPQkNSgfLq0tK2cxCTHKGze7E57HvjnCGKVcWmW1C7SgULsMSJZTFrxqGoXbuiJT
	6XL5sQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4mh9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 10:48:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso191651185a.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Feb 2026 02:48:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771411693; x=1772016493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsNgWrsWp7kwiLVZlGJPzPg13q4/xkGmWurk0RM732M=;
        b=SlmNnMfk9VIxZ525H2FvxR8b+NNo9L7Vs+B1tluKMNR6DI1M41ADBBoXEkhVsbCioz
         VouuB4vyPFDIw6s8Oy54EFb1/U97nc2QYU6e5dknnZ8pOzo1ejSlRU1L5sLJyAYmdKJZ
         vyZ3v3NwzqzrR7/7bOJIN1UoWfokRn8ofJeF5bQRphSajMPdfUJFnvO1sOTILGGOiEMi
         dVS9q85Lb42h/YfKDs2oq40mMtY+L8rnvRtlUMnjtyGkqi/ULmpRAg6aR9FSLwO7dg5B
         8tKzVylqmXOuV4bgYMm+bRkcrff8K10eoejWblAdbjP8/9a5yFTlIS269C5GCpCAIZuQ
         w22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771411693; x=1772016493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsNgWrsWp7kwiLVZlGJPzPg13q4/xkGmWurk0RM732M=;
        b=uuOrvIJDcvQWbOVVg0JSUKCl0Dfrp6V4pRVFlSaqeNgMGmxGTISo4Vc0NX+nT443VN
         yzF1MDmFszIqxJYCfz+Jf+seK/e48gudOXYncj56MVOP930AdPkz6pFL+35bdrelj6pg
         fAoQl8WZ0+EWOpiLhNoT3Y08tgKqPXa+ZsmeUNu0/jQvnFl1SjOgZ1k3qrGTI6cf0y4a
         8Wfr5QubLKgtpnd8wynEcss8VJVeDyRWiKQxeHLYcGu5/5RXjr2PiUi/72oMuzE0sWd5
         peJP4SiIQVFp7YP9GY8GoIrJa4UqiUARydRJGuMOWu3ppe+oD+cSLuooPTzz3CLdybLh
         1Jpw==
X-Forwarded-Encrypted: i=1; AJvYcCXYQy/Afm1yTLS0nzzHhQ+ugOEmP2XWsF3phE7rFoMvt0PkLr730cIruJFFMV3sc5PLo3gJupo0ScXiuQ4M4lDHzpEp@vger.kernel.org
X-Gm-Message-State: AOJu0YzTSx17Zn7BMYTfiH+MtURZZZTOM7JhsSlS0QoZInfb+E2nxUVk
	VPqralNoelbvXB1M+UoGlulCIEqaCwaKD/2DA9dbl6MsCZ4rjnmksqOXSbDS/AZxlZkPa6hLO4e
	kajxRxFXMQMdAWoSirWdZjkVlI/fRxmZSP5PtQbj6mvxeB0nK6Z2v3S+DAdTTjMacTpRoWhTUNk
	IG08Zld+2B
X-Gm-Gg: AZuq6aI8PJRw+p/oKPCp7AuJoiyQx32eccQSltJTkrmvUE7QRxp4p4OYE5qmw90lOjd
	2lHoiH8FKAUY1linX+KTeY9O3YpIiepxmc6/R1qSnexDIX4ceLMeTuvzYzNWWbGBcV+fwI+lk6U
	TFnWGMRiAJkQ30lprqyrCOg0L1uKeVGWeq6lZpNwGVU8XCKJeL1mWOecoS3R4VyWp9jA5MEqOph
	MubKj54kzTMO21ySF6J6IyKign6cSGmCK/ZWcwY4FAxk6cNbh/zq0fE2gqLEhq9voLlzTQsQ1HH
	Fgg1QRpe7m8uuJeK4ZtH39YQDWbeZ8YKG19E/1vDvcKSa1huzwAd0/2IGui9fD5eqKgb+/aK+P8
	GQCKX6ZtZqbknD6BfCoTzCmXwxZCFffDhLFpMl0h369uB/QJHWwk5
X-Received: by 2002:a05:620a:1a17:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8cb7401cf12mr156573585a.8.1771411693267;
        Wed, 18 Feb 2026 02:48:13 -0800 (PST)
X-Received: by 2002:a05:620a:1a17:b0:8c6:d309:f9c0 with SMTP id af79cd13be357-8cb7401cf12mr156571885a.8.1771411692806;
        Wed, 18 Feb 2026 02:48:12 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6f70:9a29:d138:f5ff])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac8d46sm41907451f8f.32.2026.02.18.02.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 02:48:12 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 11:48:01 +0100
Subject: [PATCH v2 1/2] mfd: lpc_ich: expose the GPIO controller cell's
 software node
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260218-meraki-swnodes-v2-1-92c521da241c@oss.qualcomm.com>
References: <20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com>
In-Reply-To: <20260218-meraki-swnodes-v2-0-92c521da241c@oss.qualcomm.com>
To: Peter Tyser <ptyser@xes-inc.com>, Lee Jones <lee@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p4I6eLgGRPjOxVMeO7n0rnhs9k1EdCulGiDJHuM75Po=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplZjnHR7sLlN5GWokwgAasf628dp9E0nYaxya5
 FCsyzG1X1iJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZWY5wAKCRAFnS7L/zaE
 w2R1EAC8WSP2OVkIZpUEPEZm9JLCf+UxCPU6npJpKJSqsHPzuUt6LcDZywEgfGtg5EU1n4B+sQp
 FL5TDEAgtkOyvGL0wPfjlaJgVyp6VlRJsRV2/k2puuysSFpPS58IsEaalMaDOPlryqroR9FatRU
 iSM+3KnWlNRmsP50mPJy9fkXzHvHipTE+ljFLj7pPtYPJwu/p+3BvCW9ksi202V66MrR9U/g64n
 adUVVeKta8yOMuLY3gWwMNYuKtPOb2I6EyNpTnggbF1I8abc2eBIrMXwqAsrWE8AytgBW0khBzq
 8O539Q+LvOSrIeS9qqWS94rfk5AI8YKppg7kKv+/fI/ZRunHlHlDP1mIJPxx8BnmbBb9hxSrHNR
 aSiYzqjzKLg0HoDtwb2+uNjpmNOULD1okZqiHV++sdc+Pf9fD/ToompMcw93YoddEePSNSnZv7p
 ZWnlw0VVoeSh3GG9gqTfSdaK/5EsZxOohvwiv7ingtnPQ8IsnIX6vLx8OLFIw6+LszOlsaUAEcG
 XPeujHq6vs8QBiCCfY6InZvKs+Kkw/9K8QThpnEgOaJV8cC177g+IAfWQ2KNC9NOxfjry1B194I
 otLP1LtPIKLkqoV9kKWkl9k2GbPRvP7joScZ9puQbya65tcqkO30+ihojuO2SxaTBGc+2540XLU
 a9gXt355mx8dn0g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=699598ee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=gkop4zNMY9-1AnXrjugA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5NiBTYWx0ZWRfX1oJrs+X54vEz
 s+ysjyRQstjSqDfo/KKiLT4DJ2oxi0jDHdsRqt6stNzPzpMXlCkvog9eLAZqqzI4ElLT78GWifn
 W2+Fd4D3VQWZ2RVhvO8sT0wrqLAof+sMWCnlDPNuFReEDOfz0b2bCy0Jt+2DWkODvWXq9s6VTQk
 QIKrnAKatiQH7skfSfAvixju302KUMFQns2RDgPJMcrEHZyI1FmpDPPl8wO5HALR42oawPyihSx
 JM6nPSESWDWcGtgG37/A7tfoHtVe2e7vWFEpDqPFPHFncqb7v6tGLGRafpQsvhLiXBINbuW0dfF
 YkLr4E9FhlkJ1YBdHC2fU2Sp7oKhVYBLboaHBnpZKPWCBRyud3oyYiQHykkwyDG2lu0idSlf0Cc
 1Brv/jETsdIaJF/5AsKTZQ37/ZgQ0jgsFOye0Ya4o7KBkBGndiOnaN8LBC7dkxSXLnOBt4RFI8Z
 qdFNWbbNV1BU8E+k+gw==
X-Proofpoint-GUID: YqMoe5iKf-EsPnZGbikUSRRCX-C4fa_M
X-Proofpoint-ORIG-GUID: YqMoe5iKf-EsPnZGbikUSRRCX-C4fa_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180096

One of the users of this driver - meraki-mx100 - abuses the software
node API by setting up a dummy software node without any logical link to
this GPIO controller and uses the fact that the GPIO core matches the
controller's label against the swnode's name to make the lookup work.

We want to remove this behavior from GPIOLIB in favor of actual matching
of firmware nodes but that would break this user. To facilitate that:
create a software node for the GPIO controller cell and expose its
address in the provided MFD header.

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/mfd/lpc_ich.c       | 7 +++++++
 include/linux/mfd/lpc_ich.h | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 4b7d0cb9340f1ac51bf3845427ba1dee8cad5667..5a3d79f339dd23994aee615c2dd6ef637e3c14a4 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -45,6 +45,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
@@ -125,11 +126,17 @@ static struct mfd_cell lpc_ich_wdt_cell = {
 	.ignore_resource_conflicts = true,
 };
 
+const struct software_node lpc_ich_gpio_swnode = {
+	.name = "gpio_ich",
+};
+EXPORT_SYMBOL_NS(lpc_ich_gpio_swnode, "LPC_ICH");
+
 static struct mfd_cell lpc_ich_gpio_cell = {
 	.name = "gpio_ich",
 	.num_resources = ARRAY_SIZE(gpio_ich_res),
 	.resources = gpio_ich_res,
 	.ignore_resource_conflicts = true,
+	.swnode = &lpc_ich_gpio_swnode,
 };
 
 #define INTEL_GPIO_RESOURCE_SIZE	0x1000
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 1fbda1f8967db41ba3bacd331e5d18dfa8ebca3c..1819aa743c5c9aa1ac51710bbdbbefab50670ebe 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -37,4 +37,6 @@ struct lpc_ich_info {
 	u8 use_gpio;
 };
 
+extern const struct software_node lpc_ich_gpio_swnode;
+
 #endif

-- 
2.47.3

