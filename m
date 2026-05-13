Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925B847D949
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684729; cv=none; b=hzwfqbUB5BCVEobrridzi6A1ael0RhJOyLkQzBirbZ8ZGemaASPm5Doisv03l0ZFLfUX1I8xXmSiNEH37jqpZ4Lb7RT+SUEEDzyOJ11muRKIk3kU9cCnUWw+ZrSKFRDLsP7ydnisLswGXw4iwr48isP0KfpYA26YhaJKbthvoJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684729; c=relaxed/simple;
	bh=r5CorKpog6XK7Xw7AuHmiWjyB7Vw/HEf5JCJbVrapGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXSl94k5HpcXHKug5SGacaMFYV5AY609LK0x2qacHlXipLm/vpY0KIxDmW2RtStTXOb3wmBRC77r/OPvekXVqPOq7Rx7SKEOrgdOOwzhDvIUWg5dqXkic/THJWVtGPSrAbQSD7hlY6iOmU3Ch97QL4F+tJ4kB+dvyZwBmL2fGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjREzhdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0TOtDXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjREzhdY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0TOtDXx"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCArGB2965196
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=; b=jjREzhdYcb6VMRDW
	G+ocrXt1WcQle1bA+brk7Wxm8ClbOhn7+U3wGMUH+OVNAWgEK0s9k7/u23yLWp/T
	RVym+iK3PAoAVY78FwDOnqD7wWCFFGjHeUPdjAV31HymQdLGvgV91zbeR3NQfuvR
	gvTe7EdwlaQ64Wsg+NTGYeCRfVD2x9TbMXeP6z3neJDaPulHTS03/P6Z/VUKCMxy
	R6Ax7yoRrxQMEZAHP3L4dMRoZG+NtCir+YYAxH/VyC1TqNePT8M01ohXuN7ZUzu+
	hxjjVC4doAGWcN//vEKlSY0Hi8A9QpX+j6bK3ON3+5/WdTFC/J/+iIzKg91Se2vR
	9eaM9g==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59yhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:26 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-43013bffd49so16792604fac.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684726; x=1779289526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=;
        b=i0TOtDXxUTDVq8GPpbd1Ge4eqaYgt/Uy7XU5klfuoxOoz0BNWfkmJ6BIrT7/ULHVBm
         oQFzYpOTDY4QwE6jHL5w7UvvuURc9DDoMnGc7WgQvU6qM6QbftdObGbQHCl2BmzuEmTQ
         fW1iJZrEqf/VLil5yqs9/8LU3vu9TRdJaH+IHJ5P64TLSbyWpa+icimeRU1QFYwVw6rY
         pEF5hswsIXDzCgtXpR04ARE8wEDwQ5bx/GC7t3CZPuyuB78Qdkxjx5sN4RsD7Stgm0Z9
         xQVFlDZtt1bsrNne7taR/va8vTvXNrbLbOPb8A4lDWvZdkDOTb/pW8KVxREPmnP8jZ7C
         7Q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684726; x=1779289526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=;
        b=jpIiv7cAY5hBYURvI4WQ27WLiKb5rn/XHToeHMvlYlq4MFoUayCYD4mZnJQN3P6NTX
         6fkgo5Z6fXWcvodCGfReIGc1tEZ4+t25VmFF2DED/zJg1ST3HD1hRqPCXI6Ijh3QW+uS
         MTXnuhqvaT8guflQqaCOASj7k23MmduQ3ZIVLyAfkYDAVm4Mzl6Zw77U0/kKHuTnLZyG
         j6f+l8Lm5v0OlgO93qCC6+O9Pag5GpIC/+ml1mw8hWmuwSFizsJvlZiMoYPtYhv1r2+M
         GUMVaV5gKkZR9oR4O8FpcDkZZAEKmXgdt0JDTgofuypwNqX5NWrPHJAHkPdcsNvQuogF
         wyWA==
X-Forwarded-Encrypted: i=1; AFNElJ/Qsgr5rmwcXyyvjeuzWh4ma0/bFT+LO6DnG+R2RDYu8ohg5BXA0dMEKpUqsx+LssdzEzJHXr4u77n932ccImYFIXav@vger.kernel.org
X-Gm-Message-State: AOJu0YwuQZjLkyPhSc8evcHO+b2AToE1etYppAUP7s38Yx5lCEnVYZyI
	MtDTkUccUaz+diat1P44pVV2tAPPjTeQRuseNPl4yJVvyynUiXgF0UfboIGtlH4Thv5ZUayRW2R
	S3YthSrZ1uhUukZO+/P+CZNgtdcIlhBZfDqJ7sE4TzEcam6S31odt7mVNaU1oHGFXP/+5lw3VrH
	1S
X-Gm-Gg: Acq92OE96yjg6G1Yb5mk23hkw03f0dHWhghhCHxSnkPCjbYRZlQjlRCFqryewXQU+1Y
	TT55MPgeGDeGYA3C8KrVZUH4YcEuzrZCc6D2UWTj0aNtUPIylplIdOEPzOzbTOTwgIWgpwKyoIz
	j1345XoeGeynQpWgdGLbYYPnrTu773qREKlE7E2U0ZPkNstDzIJO+rTTf6mhZ+IIxE/R8vn4sz3
	g9JUMAtnacLNK58W9kRux0Up2ZMA2De9u8idFaZOXxgYq+wpoHkc2JPbp+LixMglbxdxbELafoP
	oIuImVKe8haw7zuFTVdNIK3dTBNKioJZBtvZkRg5c9gmHMJuaQM71NsEekj6gwoU+K/Tc0pJQwb
	AYLhVlHYTsHaDXOW/hdMeuh6UwIY+3/EwZKbr/chHzGEJqJTG7w==
X-Received: by 2002:a4a:e649:0:b0:694:96ea:dc7c with SMTP id 006d021491bc7-69b6788d9fbmr3446745eaf.38.1778684726001;
        Wed, 13 May 2026 08:05:26 -0700 (PDT)
X-Received: by 2002:a4a:e649:0:b0:694:96ea:dc7c with SMTP id 006d021491bc7-69b6788d9fbmr3446719eaf.38.1778684725508;
        Wed, 13 May 2026 08:05:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:50 +0200
Subject: [PATCH v6 3/6] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-3-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r5CorKpog6XK7Xw7AuHmiWjyB7Vw/HEf5JCJbVrapGo=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMmq9JW0v7kRFlCKa3cQX1e7fyvU+j31gEFo
 GPWtnshMziJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTJgAKCRAFnS7L/zaE
 w0kcD/j2A0ewkNS2bCevVPmTc7c9OKJ+dLjh+eBcqW93BRugn0nF19BZeEPkdpJ4d8JfXxJOl2R
 0yRABxbWvBbxIAvu5Ciq0Q/lk32XMa6eIgh9i+LRRwbdDc7j4i3L8TQVUz1e/OtOJI3UuAEx8Hf
 5IW8XAZDv2Unf9peA+4En+gRC9RdwpQ1GRG49SGchp6jLdr64eWzMpf1kz8WQQbuTfZGPcq2ZRT
 9WmLXhdT8d7rwlOPBCkaQADhzAcNNOJDAdv+PPXi6P7nH0NObPzaYPBiSbKG/c1fo3OZT6hTDUI
 f2TMra/TKercmXMDbU96CPWQJunrpCUNvQsvD0y9yWpDo3F5S4yE2vjeYQBd3EdBOCcHtEHjX40
 TVsIMjUcQbKJAQdGI0Q8UP5BQoCYOGn1rUFBqRQROZ2D4UOyLzAiPQHqN6sKbAvHrT8xSxUOrRi
 IvDG2wJbh0FzEW4RtFzrEqwBiOotHHKQ03U8da25RuETsDGT/vEMmw1/Ua4JuNVPtC7DIsJvVWB
 zCtYAHUcHDnJ3CP7KR/wIJFcozrxpsLv8fX745KgB25rR8Zlg5i19BqJhRlEOLoIJg6pbkzXepT
 WLDnxY0wJWesAgedGNBSuY2MBYkfToT7EPADVSY9o30rdCXsBTr4c5QeYu4cGDyVAbq92CJVCDU
 9ZFoM9pKhvtc4
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX8NkrqBna74XE
 3UdOQMumRQX5PJnyXUImtXOE3ZjqlH4Qfx2Hpbw/QxAEiahQespwYxDpIuXRZeE8Xx2X6IJ9N6z
 MY6ow8u7rqwiq/LJoudt9p3IVjw/bmicOjUOgp16RJipA0Niu6UYfE2oxgHR+05aIyMxOrfdYiW
 9Ak56dCiVOBH6wJY9NAFPNzUuwbK/6jLkvH/Gw/D2eXouK7EMtKEiS85ykmXbhQ2AunEaMZciZw
 VnCypNKiaito29JAPM+tzkoDgKV+N57WFuLNda3CdCQcwO/MGClGg1i00SOeVeNNhOlpFCHnL9b
 PTBQEsM72gwOAHmP0zSHo1P9Sg4bG1UChLn/+EU3oV3M9eE/QeNgJkONM4oOBdvdshcQ6fFLkEL
 vLPUm14KOYMDqXnqu0r3QTtEN1OLc7Evd7+6lZN0g5MeFr3ojP8OjjEPhIvU4EeQISQvLWwvgRu
 3aVzAZ8T7yCKUij8Jwg==
X-Proofpoint-ORIG-GUID: rTq03lyqfMf4RtVnw4yR8IRHcitqs8fQ
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049336 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CQ4qV2wi1td1G5PDrAEA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-GUID: rTq03lyqfMf4RtVnw4yR8IRHcitqs8fQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

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
index 706783863d07d66b4685005d6649b3cd143ecc3b..5b0026bdb1c609bac12cfa1453c685846f3b731b 100644
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
-	pdev->dev.fwnode = fwnode;
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

