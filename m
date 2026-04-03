Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72594336888
	for <platform-driver-x86@vger.kernel.org>; Fri,  3 Apr 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224334; cv=none; b=rRL4PlMv3SZhyYyeCdUr0o0JMuCW2ocUuptLKB4yRK3Tomzb+k39K4KivMP7JLiSqGYkIuIx9ik1/gjAX9lBp9zD/0btvQTlneCeQ6SEwvv4mxaCS86QQbgNGioSkTxNV8UoMWgFmkVCrPFYD4FrW9VDmbHdKxZUaL/fD/vZixA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224334; c=relaxed/simple;
	bh=tSBsw89+EgLqL9rsGM6nffcOTxXCKvBjsnCc9VJADCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VV0jvkKokDDJVCtCaYD7nbUgOEV2O+em1b2MaPxvgqvNzisUsUPKIyCKkVZyKyDT0XToUoPL/BMpKTqBgMwavhfiiyMge+Fn2gX8vItTHrcz1mQZm8ZOTN710Ibvl1AhGJJbKUbvrckX8e6Q3+IQa3AxSqJ4tySB87X4vurOaUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA4hAnnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UhQEiPBN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA4hAnnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UhQEiPBN"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6336GiNY3772892
	for <platform-driver-x86@vger.kernel.org>; Fri, 3 Apr 2026 13:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=; b=kA4hAnnZmv5H94x/
	OTYim2w+MWizJGnpmVBblBDjCY9Ah8uQeLEo+7iB9qhrzm/zZgfLY2s/YZ4G5Z5r
	iRqP5tgj3s87OM+I61p/MBUqcs97aQ88XPHIq6ONTUnG1m040D9U1m2zJNGT8wEH
	z1Pig7dAfbRcELP+uJJj7sOaG5RWTRTvkzovCieE4PMejVV14FKg8TEO0bqRrrfA
	lDjRUKAq4JfMWiv4mTZw0yKL1Mw8YRaRw12rCsJF/0T0pLiJVDIzKcKjnEE1ReC4
	dIx2qA+Y6ryIqjQBONPEENriM+qUZZNvy9a07DUD2cteSjNFma8IEAB5IbGI/WmC
	mnzQIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9wcs33dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 13:52:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-509044f54aaso55295161cf.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224328; x=1775829128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=;
        b=UhQEiPBNuGaxFudCbA5g7x1FOPoc4GVCKVev0AEFo2AN8uUzmUp2SZjbRIZW8elxSN
         VdVuwnztja6QlBOLl7SXwDsacA4T/2Z9axl+h7y2TPLUcN8Z1RgAJdC7GGQB/uFv+ImM
         nEGkTYMS0FKOfDlAe/JChpZJjuhLcmuR41qWjSnkx2dbUOKtNPr8rKhO0JDLu3n2gL8/
         0TO7MybACl41JhDLaCt3/HpdiIygvHtzfqYW4dATyFrQe+2q2RFcJELbCha3ZyqvLGWy
         eWS4XjHBMFUUgh2IGz7DwsR+YVc7CD1f15/W5A7RQXSlNSzcsIPcY7gJC//iH4w41F+u
         0qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224328; x=1775829128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=;
        b=Mk8qFiWOTByoswW6XnExI3itLrGv9FQK8uis6z1vmETiiEg0G/TsfL7fEyLX/Xp4tW
         xeyLvj35yJMd4jQmhQxEQn+LmciJswQRvNYmnGueuwRTQ/+0rC894KwPEvmJ0wVYmJlv
         hNM8Xi/D9XBsaCMCYB8WzVjTQbJjUzWZwlWENvuIMp1rPKiXBn8Xd5ojQZY8q5kBXjRd
         VzCExRKdwGFu2PBSMEJpNlKdWpCZgwXLYEpseMIT472ri7gLPZnbJfm4n4efXrLooeTL
         84gKP+XAtOe5MLiIdpQqaBLiKlIn00caRgiuM3jhrTbevpzC9fJZzphYUxMUYQaemW3p
         1T+g==
X-Forwarded-Encrypted: i=1; AJvYcCV4O15lfyYsQea9C6ZA1VJIhN+M1QMIlhgmmK8QKaRhUva4JoiCxm2G8WqPT3Vvhip7+Ck+33QcqP+4zIC6sM3Vuwf8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh/sDgyQqoJxo4m6sp71ZFxkStwGPtBFK16J/1xpCEfulXTe3I
	UqdFt6l+Nodo8Agl3icC2O+NU6hUNpL5AjSda+osdstX0ZRzJQSpCaD2R+mpLVBswkUqIrQemPa
	H94wrb054vgcJ/P7FZYllkMmxKlw6Xdq3QQ8jBf+ll1CoI2jMjSduXP56M2hQ2idbv5IDRUshBa
	yr
X-Gm-Gg: ATEYQzyZNwNv+KQmQV1F0OnZIl9uqU/SMPZmbJllo5XstyFy/gPeFqsdJv/W+QmuNiv
	cweR5BnJR1JIzdg/J3SE2SRYKwiCCyE2/lmcIl3txgKFUDOkMNNIeY+fzswYUg78GAEWa+hQoC6
	GM5cpB1M7gQnsbdZam1SfpZ1tJD76mtkjjScOF/+dmFxeNhWi8HSKxE1asySI3HUsEGs+GAu/ov
	tVMCwNrRvZCl1BYzevnPAl4ilccUmQlfGAioRvsFkewFxMyvnMc4q8KcLtkAYRyUOiilpJAoRe3
	V/Zh6J6G8YcK8byqJN8HZkoxyvSLczMS7KECPfKZ1TvGLRbvpkvzbKtoc8JXBt2ODSG2MEac9GO
	f7jebeRGEYT3MOS7nC2CoE0+wXL9YxmXsSUEAP/mkntWWGPpGz8TY
X-Received: by 2002:a05:622a:1f88:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50d62b4fa9fmr43413121cf.22.1775224328258;
        Fri, 03 Apr 2026 06:52:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50d62b4fa9fmr43412841cf.22.1775224327844;
        Fri, 03 Apr 2026 06:52:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:51:51 +0200
Subject: [PATCH v3 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tSBsw89+EgLqL9rsGM6nffcOTxXCKvBjsnCc9VJADCU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8YAvNkQYAMYU2+XmQ39EqvAL7D+Os1c/agWm
 lWlplJNjyeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/GAAAKCRAFnS7L/zaE
 w79xEACi/EvAOBokb2UlYyvQLhzNY58ORTrHqYEOL5dnJ0LMUFJxnRi1gRZPM8kds3AFjqK6s0b
 z9z+08cH2hhRHbHZxxAECRMT+T7StWLJLK7aSMAjsaSvZTbteomdkmQ6QSBYcgNrjx+T4DCGXEy
 XdZZe4WGT2wIJr9c0tvF5G0dKKwJadko2QHV1UBEKkpkmliH1NBD90hCgNoqxriU5v2zVUnM7fh
 pvlMidJ9IQwTBN9tQzHZ2cNdtL6IRIAGXOIdWll9yt0Qjx3q50Jfe5DTdm3MpR+RVFg14neZsBO
 p/dlY3E7/8FzUm9HUWJeNA0QMrauzjLbDegIFuBKDnKEw1t1goj4IeMTF1/wMQFi+f6XELvJ/QX
 SDOGbXxkZafCChsb9luUjhzdwH037EOqsuFKUnN+NfAk+TScsBOsle4H3RUZXGtWedCcXaVE+eC
 n7a8qMWaWBr3nVx3hEZjMDk2dxmqawVHBsJos1xWbHlyGOIjvH5Bc4h4ul1+x43mgWwkkU3BNvZ
 pL9hFxvLwySDRvZbl6H49UmlkLc9UxTDa6Ph6DAm8BmsBMISprLDcDSH8VvFPLbssyyVwRLND7R
 TRyJvIB8CzTBAtuB2XZV3VSUQ6+uGpLqQd/abQmrHqqeWWjk/M+Dd99SYX6lZDBgtA2z4SWuTSB
 sXc+J9OMfBcep9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: g6SmfN4hA-86Cq1-LNcNDfo1k1NGEPeK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfX9ClGmJZiNfU9
 DhsPMLtFgrWiLGPTCw7SXuEr+WjW6l+Y9s4/kl1BhopZiyc40N8yQSxhqxbcyCPR3+8Rd/cP7a8
 9gE9mf6wSqmZN+JFEf35UnjgFO8zWfMOFdkpTaphwo81xSmpckKW7KuaRG0d9gYFR70nEtTo9NZ
 e0Aiw4BvOz9JUJ4qC8Ce7UhzNxIRKICWDmfBl+Bi7nZtASYuaUQJ6pkVOjEluuiG5QX8zq9SAVc
 jAF51nxh+XRy3ISiONip5QfLB2zR7xgNVdKWRLer9fB65Me5qAnlkFbtHxmYt7hA8yR73H0RKLV
 axKa0swohwBhJN+rTpCFFlY5OEtWO1+JtsVNcM3LAh1A95ljEsXHrOZwI9zTLnVp3yklp4GWWHO
 RPAfmDmcC3rXRfokQFJjGx/FNCrXswhvZZaK5k8g4zGjKUx90395E174ctOonbZ1XpZ4UKlL4Nn
 X3pUKH4WRc1XyKvEmWA==
X-Authority-Analysis: v=2.4 cv=ZuPg6t7G c=1 sm=1 tr=0 ts=69cfc608 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: g6SmfN4hA-86Cq1-LNcNDfo1k1NGEPeK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030123

fwnode_property_get_reference_args() now returns -ENOTCONN when called
on a software node referencing another software node which has not yet
been registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENOTCONN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..77f4a3b00641bc9535ec32f8654ea7f547c34153 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -91,10 +91,19 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 
 	for_each_gpio_property_name(propname, con_id) {
 		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
-		if (ret == 0)
+		if (ret == 0 || ret == -ENOTCONN)
 			break;
 	}
 	if (ret) {
+		if (ret == -ENOTCONN)
+			/*
+			 * -ENOTCONN for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
+
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",
 			__func__, propname, fwnode, idx);
 		return ERR_PTR(ret);

-- 
2.47.3

