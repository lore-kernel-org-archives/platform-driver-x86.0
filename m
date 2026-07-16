Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624C41DEE0
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205128; cv=none; b=YX6NUzNNsI6mofHtOtZTYVYxk3zSn4vDYDhHlTuBBi9pvqAWCiDnQTh3tIVg70olKTP3xurqZU9IIxC90EndUvxubLM2tMZ3mZIiVu9e5lO46cw/6h3Iy9o7iJ81J3Zpvi0XSXpZSk6S6nscto6/Ozp0PPK8UMnLHQ0dFpjooMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205128; c=relaxed/simple;
	bh=N9AP3SYxejXwZhikmnovuItOtHN2XBZf83KApz5NXJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDCWeromnAMYxYur/pemJfIGNfSDjNfi3m68ccIk8h6EAbFPFJn8MriE++9dHIsDmrMoqMlAGHMgmBd06bRZuC9xgw6lALLdgOOAAwrQnaMUglAFHTURblrqvPLGBYZUfFQ+Xn5HK9RONhjeZIuKceN+afrADS+s1IUrqp4oBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+Kww1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K84IvxSD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+Kww1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K84IvxSD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiqmR2730762
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3y0IvySJBouPRgIKjp+IRovT+WNJHA9QwSsnhwUAWFA=; b=d+Kww1pDbw8BsEPL
	G38+XoN8euPnjzHPwfhBUXjniQCm2z1F09uU2lG/WiYjHy3Mk5sRVLfeFGQM/5j6
	Lw4nkGpegPpQ0y7OZMlJdbDwoAYBTLLYjSX2acswSGc0bo8IcC4r5McqdPshTD8k
	FF4NMAtEUlixWJA66e4PhyCEW03+LoyIERhx+EMuyLMjsiFItgkKItvZH3dj9ONp
	H32KgxRSdow0HZbKLEa7vnpMEHE1lrTE6yZy8TEA/YJxh9Oliyd9LyJTB+t24Pm9
	wzhbmi+D/HurAmNTeAM/fb8SuryK9TAq2ytVVl+cYR1oWcCsB1hME60a2ttblZXx
	wlWPZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wadda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07f25de2so41666241cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 05:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205124; x=1784809924; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3y0IvySJBouPRgIKjp+IRovT+WNJHA9QwSsnhwUAWFA=;
        b=K84IvxSDbIpqyCINU6QHe6zwrWwEk/JXeIpLRh0reNiio7AGsTmRXa+qTuIjJjdesC
         e96VQyZjHjnQTyg8NwQp51og8HpW81q03FdND75r7wfSQay0yozAZyW7VTgLcTGwTGR5
         1R40wtR1aGCUEIiozSeCoocZhWjFB0W1ui8xt7l8Qq6C56mNLNOkL/YnejdqObLHuxPj
         3Ogqx7B5apevnwoeIdTADSnZ65j7TngyRe63TyLRvYGMgjNJtKvqonwYLkLIgOyCxkCr
         t9Spry2RP0TMWbFwFfptQpR9cyF30Y8/4tKudZKWLM59Zgw9XpAJgQYsaffpfLh+CbgJ
         LpWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205124; x=1784809924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y0IvySJBouPRgIKjp+IRovT+WNJHA9QwSsnhwUAWFA=;
        b=Daufd/8IQNXToGGea5r/4J8I6eNZV/KBeTPQDHYM0X4/ygW32JJFoN/JLh3KOKl077
         ULypfUUi3TlfvDJXcHo25VQDgeUSW7iD2dnWgO6UB74MJ0k50foBRE+f88G7hNQ8VAIO
         39+Rj2yFyYebLXcYCq7M+csj8CJ42Og8LMsOh0baa2LUhWj03Gu4IoTCurxH8zqoIp2b
         wDZfdojVcUQnCpWaLd03P1tPfOkd8lY82zeeEx8KgVCS+ARLglrotMlIDCIG7JmsisOm
         jboZBU1KbVfGxudZmomnTfCb2T5HZdcI1XGv9JKEP52lxvF052bk4gUVlg4cLfzwp/oQ
         yl7Q==
X-Forwarded-Encrypted: i=1; AHgh+RprtPZtIavdhaghE8mX6/VlR+ryYCPkIBjsEwyxmX8vhDcNu1z5pzuKa7knhy6gaDhjFmW7bq4V7i1VngAcSvFmoRuf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj60HY4cgnAA0Dl+5u/aaJmz6mUbB+DS8LEPnPSZMBFhvuIEho
	eo2beNfsplZfrRoweG5dQWqbe6gkzYS6TS2FMqKOAqR1H8eOLBvRk4AUUeCJgTUkdzP6BAdtsOv
	PIPPnQgZvVi/yz0bS9mKVGJOIfl9BLUc81K+T5vTQGvLNJCs8GzrEYUqOr+8UaCjKDppm2NwQ8K
	Rx
X-Gm-Gg: AfdE7cnFF9xl+f1fACWgq7lugzGXShrJoe9xfjeO2av7mc4OL6rVe9ndDGfScQ742Cg
	yDBbuP/2DEqlG8hWrFiAqpsDyhBCPCxrE3w6G5dTyBqglLlsQkbvE702gCb2ApF0XzzlqkOjbq3
	jRjUqGnvu5DlAQdUOyJxMh+qmuyRALT7ZVqzM5zN3LwrMBbPu41ViE5YaJHPNFPSICnXcdwcvej
	In6+VyfdBhWUIBnBTJK1zUzVkwuGd/RpPTXdynHhqgt2BAe+pQZwcvlDZ3/PS8ZsaBUJlmF3h5X
	m/mteD9ejnNpJrb4tIuBO0hHZ1d/Qq+EnLZtquDzEn580Rq6Cx07b8sQIkSLPWlfb2bQXTZ0l0T
	+0SeJcpY4QXv3oWsHZan8fwQ/Kf8=
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr225501941cf.39.1784205124015;
        Thu, 16 Jul 2026 05:32:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr225501391cf.39.1784205123470;
        Thu, 16 Jul 2026 05:32:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:38 +0200
Subject: [PATCH v8 3/5] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-3-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3182;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N9AP3SYxejXwZhikmnovuItOtHN2XBZf83KApz5NXJs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM84B4CZo/dOB2syOtU64FTk1R5pO8s/CZfq9
 KDb7tFbYReJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPOAAKCRAFnS7L/zaE
 w4uvD/4unAYN6h4orRS4Qx06lB5hF5W4abKelOlO+kea/N2ACPE1RjvtENYOim1DuqF1YYahceW
 0o/eeFpQVa+J5C3TuanVNe/pFfVPQGJmYinHXmdyzRT5OOFOkXtXB/TaFB0VNm3/sTYZQEtHTVE
 LdTtmW9sv43I978VkwcnpTqLvYd4mpgDTc40WpsbyRQCOkfb53h0gEroKzx9BRon86KnLiE3IJc
 wzoFo4yUOgEC6Lk/93fRpgaiBUN4wn2mzTTOGfE90abwQKNwh6U/Di0mGXnZOrMH3WW4Z7O0YHB
 woTuI6jlG9jzMJ3S+Bbr742Zyhwc7kxNA0aCmoKHkXF4bgYsTE+unyMIif8MQgP6/MhqLzuIfCR
 QLUxvf1+Ck6LtuSGuSFed5i9NiN5S7FJhgNh9qjOLlQP3LG/E2QsGaJkLNNOV/p2bbwXPlnU4+2
 lm17JZs9+5gQfVQ22itFzbErCzxV2THEmdjnCtkDI3vhjBwUsFCHMGlEY3iW9y7Azb8N7i8/JHL
 LSlPUnEdU9c0iBZj1AkO3Uedtoeuu1cv8T8WPgW41si1nD3+e28cK6HNkQXjPjs/Sb9/1lukAOV
 w+EKBHvo4kOcfVX/PdQwR5zepm2AhvHCXWSPOLnsUplcyLGcF4SjUxw+1pCmZqGuMgtrp1phMVD
 rKvLJIPfewBDYjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a58cf45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=djUoAwcJM79xP0FpthAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: tbXidEKSaQGNBtDgO0MIcqr1CncHyWKU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX+po+TQlapm7G
 VDBcRcjN9smOYk0yNlGuNpaFL0HCaCFuSMUyveS1y8QwkzRKvpFnlyi95G7kguFkmNZPBbxX6pM
 6tEEMKFRV0E3b+HexadRg63tEIifR94=
X-Proofpoint-ORIG-GUID: tbXidEKSaQGNBtDgO0MIcqr1CncHyWKU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6QJrUrjnfBAa
 rZAehYSlBJB+xPMVmh24q4h20aHJ2u6XL7BIq08vVBmNet/KM9IRGDoFm+THTH0Q6WAusIObO4j
 jTDW8KT8SlA12vZMLDm34p7yOjuBR6B59E8sGLrpVpsU9yEqtoXf/TmtHiTJ3JlNLa2xdSEk8AP
 v2qMPmwI8jV45mTBpK6SC01IesLROPvC5dT4SIIDV+F4j6PWZYA5guIX4i2rNp1Ug19IzK2gdf0
 gfjqQwiCP+3WozPiQ6zuw+L+3KampAMVUcDtCZATd9ZYJPqJst218h0CkmiYhTRtfLeHLjANbPK
 cCkzYvvp7Lg+0VvVlF2JtQ52ZBYnA+CD/kS5FwqcJalkHia+trYNdDwcv9kS3KVD3mbnwGDRTvu
 Khnx3WlnTPtDFYOgM2z4xZbRjmYyTGw0GSKoJHXOLWb1w0zWkZ+65b1QjlMcBCL8DFt5IAwPqCZ
 HiuhyW37Gb3O7jftI1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
 drivers/gpu/drm/xe/xe_i2c.h |  1 -
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 3d80eafb9a1318996d10db11e14af4cfde07ba55..af6e973e5e68125a9c006bb646447ca6e377a6e6 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -93,13 +93,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int ret;
 
-	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
 	/*
 	 * Not using platform_device_register_full() here because we don't have
 	 * a handle to the platform_device before it returns. xe_i2c_notifier()
@@ -107,10 +102,14 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	 * platform_device_register_full() is done.
 	 */
 	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
-	if (!pdev) {
-		ret = -ENOMEM;
-		goto err_fwnode_remove;
-	}
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = device_create_managed_software_node(&pdev->dev,
+						  xe_i2c_adapter_properties,
+						  NULL);
+	if (ret)
+		goto err_pdev_put;
 
 	if (i2c->adapter_irq) {
 		struct resource res;
@@ -123,8 +122,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	platform_device_set_fwnode(pdev, fwnode);
-	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 
 	ret = platform_device_add(pdev);
@@ -135,8 +132,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 
 err_pdev_put:
 	platform_device_put(pdev);
-err_fwnode_remove:
-	fwnode_remove_software_node(fwnode);
 
 	return ret;
 }
@@ -144,7 +139,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
 {
 	platform_device_unregister(i2c->pdev);
-	fwnode_remove_software_node(i2c->adapter_node);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 425d8160835f4648891ff75f2a9c06284241710e..b28229f056c5a664e1d41dc0cc1978782fe1c2f1 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -30,7 +30,6 @@ struct xe_i2c_endpoint {
 };
 
 struct xe_i2c {
-	struct fwnode_handle *adapter_node;
 	struct platform_device *pdev;
 	struct i2c_adapter *adapter;
 	struct i2c_client *client[XE_I2C_MAX_CLIENTS];

-- 
2.47.3

