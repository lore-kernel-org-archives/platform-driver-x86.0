Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA9309DDC
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 08:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800001; cv=none; b=ikgV5NTJk5/ySJFYtCGbveyoBrX7E03DAMbz7+RZe49mKWMJDc3ZlWbAWxPXX69uFRSoukf+HJYbgs4i0ucH+tAZfMHmDQdeKGNu1bHMjOoM3ZeSa+o6q+LwqWMEA8xwx7jdaocKVXtvQWggxssYNopzy79ASCGvBH50o/qKkGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800001; c=relaxed/simple;
	bh=a/2liInywBiVyvZH5ZSy1dS+BQtS66ZsSM51lFDwn+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aER78/inMkiaqGYcG0BDwcTpJjFKUZX25XsG2nbvWRcbOqTkp5pCw8Ti/n5JucBk/utzkaOucIl+4Ip37N3JTwPstNz7QH3Xyr7flVak4vacGfRB6BWp99B20PMiVCRkbnHUeau2wsiLwT+nOFsZ8Eg6FgNDxb3dhlvPR9OxwFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EK8IO9yE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L+vXxfyC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EK8IO9yE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L+vXxfyC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B3cTus837953
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 08:53:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RS3ATQIauI/NfFT2FuRblu0XJKn0tBFCAKh
	Kp+3IEVY=; b=EK8IO9yEaUISZAP/8Hx+3MVpdMudQy9iNwnfn209xbur03M3zVf
	l0ylx1ASlmbdDSs4l0c9SIywwwGHA1xtE9E/xSHiiddHpcgTpJhJQefeiDco188G
	zWIRGWvklXPW+2rNS9Ta/zPwdJBYKX24IyCybqpZ8g+AWT/0emUlPo8oWBfA7smZ
	/Dp5cYeCNFTMizCz3pm9S5WDJ3+WC5mgwkx+FJiBu4mPCOo/OT7FPvKH7bXA5h6m
	c4q0Zape8+ZZ/+Vzgavp43StdOIAHDBUeP+TfmTfCrBv2xIMsYfR/oyZYfIU1QIv
	COXV24C1Er2i4EYIp+mIcstloxBUUW9jGSw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8j1t8v4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 08:53:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70fadd9a3so1910099785a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Feb 2026 00:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770799997; x=1771404797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RS3ATQIauI/NfFT2FuRblu0XJKn0tBFCAKhKp+3IEVY=;
        b=L+vXxfyCGfTpdkbZmdQE4xNC/g3vFNCere3a65U0cRbB+inMgKMfo/BbENfjoNgyX2
         W5pZ8xkOzrI4X9dKrf6Q+TZkYEUXvz0MqK1r1r2yn9ArMsqa+LJQQUDdSMzC2N7J/++4
         U5r+w19A7sg759TmJ8oNJRRB1FnUpjRgyYwxes5a13XsTpw6L2s6iyXvdxGQdRQaJkhT
         8rCGUUeRDmvAp3uE4DJM2ZtC3ZHLz29HCzzq5KrfMQ6+w4OcgATnKcJtX1ROjYitncFP
         6u9yL89XYYUQUDywiuPTcAZH2mOVss+l9IE5H8stA8z+zx1AyJipmlhavHiKlTC3AfLE
         gAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770799997; x=1771404797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RS3ATQIauI/NfFT2FuRblu0XJKn0tBFCAKhKp+3IEVY=;
        b=irhfDHesAv+POWPv+yM4/DzvfcRxGEYrGMe4WDSCgjuHAD3mPlnbDq8MpeVeAdXEJa
         pv4mzdSmJ4ZjK9dZMRMt3UYmA7Up4VLdCwkzwiZbYaLkhBzMFt9+afvqlToIkmyN9Rb1
         PbYJ8Z8sFmyv+KULPraBIymfT82uJanYhh+jdBoApwydCpZgI7c7WgT4Jn7B4leM7mAu
         Ho/jWUr1hmv45R4IVaHrPmWF9nUEe/yWPWMoWcCi6/gpH6r/kilTf1Jdv8oJmQ1COtmJ
         cRh/bEWDfnXrMaxAqO9p4sQlNeXaMh8ObxPUJsHJ/UQzMjzj8iN3K2JgeyqxFIQgOA7m
         bLEw==
X-Forwarded-Encrypted: i=1; AJvYcCUjrMyKCIxxh2a2htrNbDNwRHcNTGr1q8BxAdpYwCgML7o5lRzwHBGFRT4zzKmArVNLqXn2abU2WobxJGXaxzUXfzct@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3tPoocznlNjM6X9pcWF6fuRecN1mligGusXX8cHOwoWlfRCHf
	pqjAkR+G141hteaukOBYknrSmM5wyQDtpEHbVNODT92mEdxOUG7/Cz6cHVNt0Ab+w1jwDYFcf2P
	WYUcVI/+fPW5EsszKCgiIwTUvU9+GdtNhsz9IaQeHXSyr3ksErLhZzWXcOFULZ2Oh0CBK13TSKU
	O3
X-Gm-Gg: AZuq6aLSzsYUGTIbH5LlT4QKl7HLyK2vf4jkaul4eduLpS9eGQ9Oi9T2u3s9dFB3sqU
	AGd29r0b4KzZQv5aLc+14umDZAtHtdFLA5l5eCEKV8AYNRBfC/Bt6Gs2yrxdW4+JA9OadRUypDr
	efM0JSD7qlcH53eTJdStLtpZJKv/HPJCYccke+QwElsimlsV90Lx2eFNrxhYyvyKmXPEeIGNMPy
	44F+aWmM6nifJgr8nzNeiL5cn9JVm/8TGkTcQ12HZrILqso1Z/5HX21cdq13R0zZWMPc4Gk7GyR
	kDtdQ7RumF9mkuykxrT5AE06aUYVFoKxDhRcaiRaDdL1o0K/NKbriroODpBedbSpwgjr9HL9V1U
	kU4kI62WEe8eSTeZi2c3LK42GMEsTU92Ce/3BpZ5PKM2wH1iWLac=
X-Received: by 2002:a05:620a:288c:b0:8cb:16:d936 with SMTP id af79cd13be357-8cb2808f823mr256762185a.77.1770799996894;
        Wed, 11 Feb 2026 00:53:16 -0800 (PST)
X-Received: by 2002:a05:620a:288c:b0:8cb:16:d936 with SMTP id af79cd13be357-8cb2808f823mr256759085a.77.1770799996369;
        Wed, 11 Feb 2026 00:53:16 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d772:ba4c:782c:2fd6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e3a9acsm3100770f8f.30.2026.02.11.00.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 00:53:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] gpio: swnode: restore the swnode-name-against-chip-label matching
Date: Wed, 11 Feb 2026 09:53:13 +0100
Message-ID: <20260211085313.16792-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDA3MSBTYWx0ZWRfXxlcv4GyGPYK7
 oPN46oWUYnhcplpWiW+m83JiPWyVoPlj2P5Z2Dx+BjYPLcD/4tLw0FwZ70p+2eeVBzXg6luDukd
 71YIJJHW9VSj7j6Hrv5gIy+4lJFIAdFewjjrYHxzyFSlS3DwSdDk6JIMpYkITH/Fk89h6qLsccb
 8GYXltI17lJ4NnweP+yHmnWzIgiZ0+O28Q0yjwdZLDsmTEEWwIBo+UFp0Eo4rfVbgAmzw7mPlwW
 YIOYLgabQ894L2yww1gE5ydtyYgC+P7adg1+JYfugPm4G0losGmUKsiN84OjYBojQUUHIqV7mcT
 uAO6Ay2bBegRsMkGmWMI0tEJZCX24XIIrf6bezQ2592RekKMaLqAwi/hRD0KKhxzGy1ex3vJPxt
 4uQcHIgfo6+iiTlak1ITlNzNcYnt+J+o2OYb7r3h1EXIuRpquNEIpbqdfGFHJxrdZ1n7EpB71S8
 SFPjLBspLM4SpHR+R2Q==
X-Proofpoint-ORIG-GUID: F-BKRvxaVGyhB855oe5F83kUzRYD4CRS
X-Authority-Analysis: v=2.4 cv=cabfb3DM c=1 sm=1 tr=0 ts=698c437e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=9y8YAwuLlfTazgfakgcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: F-BKRvxaVGyhB855oe5F83kUzRYD4CRS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110071

Using the remote firmware node for software node lookup is the right
thing to do. The GPIO controller we want to resolve should have the
software node we scooped out of the reference attached to it. However,
there are existing users who abuse the software node API by creating
dummy swnodes whose name is set to the expected label string of the GPIO
controller whose pins they want to control and use them in their local
swnode references as GPIO properties.

This used to work when we compared the software node's name to the
chip's label. When we switched to using a real fwnode lookup, these
users broke down because the firmware nodes in question were never
attached to the controllers they were looking for.

Restore the label matching as a fallback to fix the broken users but add
a big FIXME urging for a better solution.

Cc: stable@vger.kernel.org # v6.18, v6.19
Fixes: 216c12047571 ("gpio: swnode: allow referencing GPIO chips by firmware nodes")
Link: https://lore.kernel.org/all/aYkdKfP5fg6iywgr@jekhomev/
Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- check if gdev_node and gdev_node->name are not NULL before trying to
  match the label (Hans & Dan)
- use the right link
- collect tags

 drivers/gpio/gpiolib-swnode.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 21478b45c127d..0d7f3f09a0b4b 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -42,6 +42,25 @@ static struct gpio_device *swnode_get_gpio_device(struct fwnode_handle *fwnode)
 
 fwnode_lookup:
 	gdev = gpio_device_find_by_fwnode(fwnode);
+	if (!gdev && gdev_node && gdev_node->name)
+		/*
+		 * FIXME: We shouldn't need to compare the GPIO controller's
+		 * label against the software node that is supposedly attached
+		 * to it. However there are currently GPIO users that - knowing
+		 * the expected label of the GPIO chip whose pins they want to
+		 * control - set up dummy software nodes named after those GPIO
+		 * controllers, which aren't actually attached to them. In this
+		 * case gpio_device_find_by_fwnode() will fail as no device on
+		 * the GPIO bus is actually associated with the fwnode we're
+		 * looking for.
+		 *
+		 * As a fallback: continue checking the label if we have no
+		 * match. However, the situation described above is an abuse
+		 * of the software node API and should be phased out and the
+		 * following line - eventually removed.
+		 */
+		gdev = gpio_device_find_by_label(gdev_node->name);
+
 	return gdev ?: ERR_PTR(-EPROBE_DEFER);
 }
 
-- 
2.47.3

