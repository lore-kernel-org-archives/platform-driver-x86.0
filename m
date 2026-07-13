Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72C353A7C
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955546; cv=none; b=Zixk3PhP4cpG4Zh0I2AYIjFox36/X87u5vjefXwAyVEwWZhmvZor6SJv/78c05sRhx1gB+ALKdQGFHcwY3gd+hM9tN0A2BrgahpaVbS1ksjicM5wOC8f5D3k2NtwtcBF2+vyYijaJHg1AIo/yrmpJAA5fX5dpkH94ZNkBP9D4FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955546; c=relaxed/simple;
	bh=K59bsZsPg0oBc3El4NBYgpsIGFNwewCJ8H6R3I7pL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9CexzaVU/nSj18Aa04kjXcBbvBQR0PkZKndj2Ha5vdZKN5nSH8yGsoZlV4rAZA+hNRMttJkNYXqKIPxpd1qy4jT8iOiHwb9XOdXOoDfKJNOibFQP9kbVAApEot+GiSiugmYOE+2RiwhclpAcAd5QAr3XtMl3riI0Lvg080BsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOCC5f0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ap/oaqgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOCC5f0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ap/oaqgn"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8CDR1968360
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=; b=BOCC5f0UeMABLuQp
	/DeFIlYIp1dkCmGgfkTYCYsNLEXzLx+6TaIqcIl515s8AIhWOFmrK9qi5YidC9/X
	J+Mx6zXNaWuvsy2Bn2EHvCBTcZIpE02rGregTh/MoZCdrCvM8pyWnHjD783DGi7E
	cWhX2PYM657cnGCMBOgo8ib2BjV+PYoA7fWe0Fll+9vg+5IqqxbdqOv6WSyoCS6q
	IIn+jNGjhhGYHZSJBU3pmPDyhVWdDlWW0lXDnYYdY/RlALFZHPlMksAG38ypUR5Q
	Sh+B4eCOI5LK9plwzUpJzI8p23QZPidPEXC01VfV8MfImK8kp6kidUu642NJHS9R
	wq9bpw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b6nk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c110a3b6aso49331081cf.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955543; x=1784560343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=;
        b=Ap/oaqgnPDb5P+7cQ7HM9fDnrHAnPRtyI4o5sknyRh2Y2TNLxtc7LrGufYKDhpKWvY
         yrRiyIOHDx/SWZ6jnmVkcHRmOYA3wOSvsrbu17q1cq1DV8QhueBndLaRecIkeikCNScE
         IH9Z/ApSBSDSZX0kRscOoTKvbcKIvPITOcN4VZEBPN4FbnohKO9U4iilPoyQUrwT9fu+
         j1BT8n+oPnaifYz9YTkiFiyRNJBO9S4pSKDd8UP1S0FShVVlsRAqpdl01P5FYkTQeJPi
         DGD9UohhTlBcMFbDymoy/YBqqeh67dLJ9A0tqDJLefr4L+GggE6Ne9DWKfyvC4/NU8Y9
         CJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955543; x=1784560343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=;
        b=ejccyM6k9U/fJ01jIsc/tsvWGdxU3en8dTwrWiTHfD1tmEKvmeF3IFHZsBpZcdWKn3
         AXjst1x+oZaf8iE66njB9zbrNkO5ulSibLlVS1+yhuC6AYPYfcL1We7Ac6TX5B238eZg
         M2CKufgjgX8g/ZszP9vJxExlZu6Aof4sPiJk+X3GQRYhsl+5MGb0JbJD+Z36I644DYSK
         CWNZMGjS/Za6+O2NLmfmTZiBIR7ba840wIF3QKj+bKOSRE0tBk81dPl6Sr15KUsXivIc
         fMkhoOcNkMK6RcJuXhJr/QqCGOJRCj/1N08SoSgZZOkMQ5LHFglT/Imp+E1KGDs9LVOg
         dduA==
X-Forwarded-Encrypted: i=1; AHgh+RoF8ii4xtNDG9sYQ9+gwz8SKnDgeKCpP3jd0NfYv3+5ItOZgYrrEtzsOkTatGrnxkA+l20kXaUBAPuIe7VQGoTjIhAt@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43BRFL3WBuSK7jQS1ty+ewarmhpWCSEgg1eRwWgYtRwrHJZJj
	L56R/q0YvQLOTHT4m9ww3yebuiBencDiwkirDOaoSykSwtvlqy/N/HH+rrW0Ffd2h/1XKYYE2I0
	etpKNQS43CSgUfD81aVKDSyJ1vQDpQJRdFS/EXbP62AD+XSKEjsRLgRBTmwDIrSMSP0TxNMeIv+
	Bt
X-Gm-Gg: AfdE7cnDXyDYm8Btki6gZpNHTYWf9Wuaz1O1uzziWFVPlujwX/R8fg77VzEDnPWtgXi
	b00tfblhgTaBfQCkhfR8cFVEr0C9+c7a9+Sc0/Pdip/oLSiwsHQKYUp7Lgkv+s6mDHgPX56WRwU
	2uaUbr39OKRMs/UPJtko6qrethrYQKODG2fil/ApcTw+yrAQCh3rZae9KWRUyWedhBOvHGX0gt+
	v/EFeF+v7YTTajG9fmN3JBsL9EnyL5XKPaUeJlVuQ52ke24uzBElotN0bSxofcg6t+brUQvnClU
	/iCMD8PMnA55yJ6Qmzfwf7/d6vvvy9907hcwsy6LtU8m8Rg/PIrenYqmc/J5DPUmNpI753GEEDr
	okCGu37YcwONX/H6ERTXLcGr7LtVTphAIC1XiY6C/
X-Received: by 2002:a05:622a:10d:b0:51b:eb55:2916 with SMTP id d75a77b69052e-51cbf162a37mr95302341cf.34.1783955542507;
        Mon, 13 Jul 2026 08:12:22 -0700 (PDT)
X-Received: by 2002:a05:622a:10d:b0:51b:eb55:2916 with SMTP id d75a77b69052e-51cbf162a37mr95301891cf.34.1783955541957;
        Mon, 13 Jul 2026 08:12:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:58 +0200
Subject: [PATCH v7 2/4] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-2-6d6bc448427a@oss.qualcomm.com>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K59bsZsPg0oBc3El4NBYgpsIGFNwewCJ8H6R3I7pL30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBLHe90K6lVmtYl/c5igcZli7qp/jrWQWKZt
 nDmast6tViJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUASwAKCRAFnS7L/zaE
 w9u+D/4rljpC3ahmszRx6QX+sN3PBN42YyT4ut7PwFuo5riz9VlF1xvazJvVY3hozqhuIWxlOtz
 Md9ESdszzAvd9ry6gerI0QURYd5Pu5ZufD/2fJZ9Yh1Q2OjnICBZwmsXuGHtPoyVIPA62doZmCH
 gYMnwWXUrh2G2HXZeszXq7/yrbuOnVW4FiHd4InX54iZ93wcck8ACxvX/WpPc72TFr1kCt19TEi
 ld3BMRR3Cl97tXhUGsYr+KbkCpELBTJHGZ28dquEd5M2BZDM0fGeWCQB3xSjOs8zwHfX4FX0U22
 XQfGMhYnOW75lAO3QEXIhEIPwivnWn7kh11TxvdB9iCVaV0d74Zs3GSk+4yWHQhfsxveaH04iGA
 Qgc6B43zyL5o5/J0FsRTf75X7Jv8YZdJ7W9Oe3uIBSEvEfp8eFOg3CoU5Wr4D5MlElEfXWRL1ai
 jv3K3ciVTZavQ0G8xTkbynioZLTaCO4zzExp2fpoXB3d/z57DwM9OL0pKQkcdeoumhu0QmU5t/h
 e9o30diob7Dq12Bt00bW4YM2eV2iJXSDVDfwTT7HOXfQG7J52fmMQA5lgIkrc8XxCIGW6q0Z1n/
 gL6qtyzAXt5Mfpu0NyYdZSunKhyhX3z6Q4PLn76W3B0Gy3XZV1LObT4A65zPrhge4y9XbO8uOG0
 wNfJxiV0NV2rJiw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX5Gvrm4Titgaw
 +oVdgUeXlWOwPZomx/nCHPBBvDpSUpBTE0KqhXPLn3u5gCVSJUM3/2eNRMMPuaeyRPZmTiNGybD
 UdqDpenCTbe8Y+BgAFHEyyCzJVd6C+Iayk6Vk/F9jDFEFkRFerDBuR2gEgX++9gkgLpyFKACKOI
 QPPKmdxVUB0eCLWNfAvk6uUsZhq5u9FgBn3CxqNRLlWHXCbF8saRpxjUlFV7lKPmDHWGDit3K0w
 ra3/f3DAFBaTFpFzr4/IswstRS2cV4ZBIQmW7TQpKHvUzpRE/PXk2matQohgeTBDGnNbm0tNyY5
 T8eabGVUjQ64hwgGvKrwegU2zTJffZr9ZhCX/OQyf6JG48LEpAhzzKvELEzVJ5Y7GU5xE8u8lft
 /BpeIy6l3DiDWm02VvTfjFYRnvSup7c+0nKOQrXSRvaMSCouDeU26/xtuj0lPoP05tZeche8Be+
 XHi634vWE2UJRN9f02A==
X-Proofpoint-ORIG-GUID: e6L7tPqJfCkrHrM4OdhPlSnNDimwEVGU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX9IhQiAmu3QQY
 oanzrVEewN3cmvdhk+8fM0cXH90Z7NkBMCMdYVYuBVOhu/996Z2K7pyEqfwf2QZhiBI/jvfXB0y
 5dIdydcOLpTgrEdMnuE7IuSBsvXheR8=
X-Proofpoint-GUID: e6L7tPqJfCkrHrM4OdhPlSnNDimwEVGU
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a550057 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CQ4qV2wi1td1G5PDrAEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

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

