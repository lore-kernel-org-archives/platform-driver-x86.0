Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4C2412BE1
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205127; cv=none; b=UUyJwTgslSU9pKkLAIWCC4ddVXH5Ho4vBsVbILT2YFPcVmGHS+ONoJE+Zhv/We7mUWH9NP7evOO4h96uVIvKsg5o38oEIYwtzasjeeYQGNobnGds6Bl9JBL5J3ayipGFbXZKe5UP0jbSBl6cVo9PWF+3aIAli4ZSUFMmxpTPZEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205127; c=relaxed/simple;
	bh=V/KoRkaS+83usWGN912iUHUZ0L9VCW5/9FGQG/93XDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NPwtD34pE6PoWrguIeuOsuIWJqZ7q+mlBBYC9sHQYaP/H95lqPxmKzlpLEVhB215GFH+JpJ4dqh7awgd24kzR1cV+7VAbnIz5xa4ebbODdCKqwgRawZs8HD2fgFy5zDo24c4ZC1HxaNXLHOt1x3HmPzgVu8crDwouJcj2aSPxwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzcA/YnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2ZTjUGG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzcA/YnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2ZTjUGG"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBjBBP2506777
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=; b=NzcA/YnUIFTOOyx7
	6f90moPDulXAs6HdrfRjnL8ufIMakApXtUwSx6wEybdv18wjncn1AKp7xMoe/dXB
	FDlhFvPFLeDp4J4p8u7rfIAwTG1MScJHwOOwnFgmysl/FDfYZ5SrSNE3juIQ/7pp
	MaMGUEzghiXsUDnT4MGKzBIIB1p1NovjRen1C/gMPEbBiUSRYUEe/58875T/RWcp
	GXX4l/6MJrWTNzVSiirqEJh7j+WFr7CFT4qgBZQsHvF8hqHhOwQXK7IAJXBMW/I3
	jQjiUgyJnZtF26R6zwungofLPQ5Zicsu5MBNc3Ueb7GpytHRdpuMP4/nH+14RG/w
	BsmlXA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbsd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so63471731cf.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 05:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205123; x=1784809923; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=;
        b=S2ZTjUGGYWV9omCOD0Ld//LZNPGmtF/Jp5zS3+8NDEe4UVO7jyYfSOHy8xW74Nfp6p
         w5ZgzGdWQRPC2DH3qqRoShNKeEkB5eY2BZZFLQl8FGKciGw3SPO07KeBAVAjyjZYWa/R
         Am6fJNGCpM1BAy4XNsTQB1NQAbeDe5UzmnMbop+bkG1+35oBcbHTuFSNCBRHEJMmAYe2
         h16zgm19+6GUA+R/Im4Svu29yLF4PPEhMYKP7NtD5zGmi8Jto5p4RLw6lo492uYDlgHy
         t8LBEljn6CAZi8vWDozPMPzZIlVqll4/p/Op+OOkkEFHpc0V0yROqkzzsZII8OPAuDcW
         9wMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205123; x=1784809923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=;
        b=qrXEagYay71CmVcpEZ/ds2/nqVFv1hBW2QZFvpWIBPgaI59cLa/uq4mzMHQ9mDeo5S
         QBirJvJ0qrVfSPRMMGPSN6edY4w3QTG7aMntbuGMhOJG8mRzXUuBykLwYtnP/qmuCa/U
         yhZ2RCkmg9e+k4QrNyJMoxe1W6r56/qCLWc4DbQVh/GvRbzP8c4KnBcujvUjxskOIFr6
         EKlR5W0UadEFNEuxj33SNcjezOZqStyRIhWIJ+5J/4eoTthl3S7BIIEAtakyEBFxVk/n
         PMgdBEaZjvaZi9K/eQOgZB+wAqQXc6b7IPdXXDx879Tu3b1DdjsEEQXvzN6wYsHLib1r
         P3/w==
X-Forwarded-Encrypted: i=1; AHgh+RpO0cTywu6ORP+9d6/GnB5Dldm+9l52a5Qhy8h8/sdqRPTsAj2GCJxPgCiu0kpWIine20rRaBtuxJRgHD+/wSEEzz83@vger.kernel.org
X-Gm-Message-State: AOJu0YwaClA9QeB/zslzfVFZGdKxkMGj7OQPvh0Wm5kKyycZFnyGP/JJ
	LoE/++P8WXT4OTrCsYZ5WvWa/6hzBkXWb3fmYYZBZJhrq48vYHBFc/E6tTuqiUOOjSSL3oaw9iF
	FgAvlGdRjc/MGUY7bwPmo719UrySzCtBhGvP0eOKorPz45bNkeyYIi2ASMXybuAitellTBJVGIM
	5O
X-Gm-Gg: AfdE7cnh+XZic5RsUaWVgnoKeytvc3UF2owfvF+/E7tpyL47lp3bnitci/pRx8DRFUV
	2idHT6ivan5lfV0TsMHeeyQesJiBZ72tHROO0rAky343zEx9B1StuozBkFukh9TFcDlIs0nzSbm
	6CW09Gk+l3pa/mTpipG8PyK1Nye0COXMi+LBMH/0m/ZEm8VuycWevWAl70UNaCbNcvtpbbof7n6
	ua7EdQtMV6XPD2G+UFeSL6rnrUdnn+pvsiMiLfLvSX11Gv+ewDLJM65RKLjcpgK69CU889dZXah
	u0swAnRRI6m59ImByWFb1vd/17+ZKyq6Yfn/NOjgcjKqYIMiwkxoKXUjTfaVdtuXQ+zhTjVHtML
	EE99X4rdBaJbFvCPxJhAU6hj8vbk=
X-Received: by 2002:ac8:6f16:0:b0:519:f59e:8108 with SMTP id d75a77b69052e-51cbf1601a5mr221552071cf.31.1784205122579;
        Thu, 16 Jul 2026 05:32:02 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:519:f59e:8108 with SMTP id d75a77b69052e-51cbf1601a5mr221551271cf.31.1784205121589;
        Thu, 16 Jul 2026 05:32:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:37 +0200
Subject: [PATCH v8 2/5] platform/surface: gpe: use
 platform_device_register_full()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-2-5c2b8cc38c28@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/KoRkaS+83usWGN912iUHUZ0L9VCW5/9FGQG/93XDA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM83p9RhBwshF4v+CF7UXRSRfhDVORsXqTwJU
 8v1VZYWbjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPNwAKCRAFnS7L/zaE
 w6bLEACeQ+4V/bJNhB1WQ2H6dfrwOUnKDGZwjMD2bpdwuqfEUzAcCRev4jXklTgd3KmKQmjvjJ5
 V3bviQgXPe1vcVXP7uUFN79OgQBkLMfH5mKJ62AcgOSKTLmBFYF60GRZ1XMuQkUpRP/Ambd4vzE
 TaTvXhASUgCDA32nnOTZgkLMvUPoGv5kLBBdOBsUBXGin7coEH2npQP3i8dsVUByeNzfnmmzVys
 isOEE3p8B4BKITgqM3lZ3dOSqEjGBHyoXvQouFqUgJuoEou30Dk/QYEmb79qDfFl7hbdrITIOgG
 S+bLySv/eAgRKWYiy20yFKIxiJPzWIFLXt1FhfL0TNnmH6AnV7XNaUH93hbP2OGsngqLePWyVhC
 KA/Zvzt22eJFPxOgiwvvyFlHxVcqqQ5Ss3OvTXhhBcQa1TKI5nKm/QKZOaBwSm/ADdeVso2VXJO
 kyI6h1udNzdLEk2RY8ueGxWZXQDO93MXaJDTajfwCcL00Ndx3wlylUSeX30NeIEkZ3wVEBT15ep
 A8epEbSZnjjNd2P7VgEy0e8Qp+qVu6zAuF4GIwwtOZOshdSxyM6rpOvY3N71NS7IS2ZpLH2kJ7L
 dIPr9hKSDR5eA9cYQNyAlbPDR05FixCknh3x1NSyMUCBws7Xd7DO0JhORd/gGknYTDtwuKgN9tp
 c/13CIP8A7ARwlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58cf43 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=vKDqCkOE6BQjc6v61vgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX0H4k64diPR97
 7wOwbITAWZlLqzTrN5XK8CMq7Gm2FGRIRYObjsGA+iAY9h1/yA3Qx7vLk4qpmUIz01+pRcAl47G
 3cl4S5OFIKJbQZqJ34bTLEMwCN2K9Aa8me0rKaTYN7R6EJ5e2DYrVAHqOQNgmyN5gRJuksjipT9
 ztgpN6zX7pOhHHqb4IKD84/qO+jA4QbFW83xvn/90L5FGdEQ6MrWMSfUMVKCglGozuN7eYXFtCo
 ze5A8N3yQHquH2egk8/egx8BjbXc6UmwhI2DaX0q5PxeP4BE/lwlcXPzyZNIHiJY5/ORvhx8c6o
 PullbXCmHXMje5sSjsIDe8swYxTKT0FdjbRZRIDANBhgaHLcaIapwCfMtlalxa7JTB+TFEokZ73
 KBiCilIFag5Lg/WImDk9wtsiHP8NEzirbWXfpVfjteP79EvOCdN6jc+pWrWZpLUEzmuzJIuZn6h
 TDgqMPZ1JjI8GccN9kg==
X-Proofpoint-GUID: RjYGK5hSS--W7bw1U5Lg_LCRKeIvNdyr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX4+yZdvC6QVYL
 BqpXOwXabzlDKOqcAuP9f3q35649YJq6LoDAHzg+dO7wQzM7qo5+MWLQ4RRErSufdDHmOolYxUL
 J6IPTT/+kSlEb6WlsFXFda1elga8jP4=
X-Proofpoint-ORIG-GUID: RjYGK5hSS--W7bw1U5Lg_LCRKeIvNdyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 39 ++++++++++------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index 40896a8544b0a4da4261ea881b1eaed62d93b32b..4ca7ad76f3b9d2b6c455a5d5b37f23a85eb69c69 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -290,9 +290,9 @@ static struct platform_device *surface_gpe_device;
 
 static int __init surface_gpe_init(void)
 {
+	struct platform_device_info pdevinfo;
 	const struct dmi_system_id *match;
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int status;
 
 	match = dmi_first_match(dmi_lid_device_table);
@@ -305,44 +305,27 @@ static int __init surface_gpe_init(void)
 	if (status)
 		return status;
 
-	fwnode = fwnode_create_software_node(match->driver_data, NULL);
-	if (IS_ERR(fwnode)) {
-		status = PTR_ERR(fwnode);
-		goto err_node;
-	}
-
-	pdev = platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
-	if (!pdev) {
-		status = -ENOMEM;
-		goto err_alloc;
+	pdevinfo = (struct platform_device_info){
+		.name = "surface_gpe",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = match->driver_data,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&surface_gpe_driver);
+		return PTR_ERR(pdev);
 	}
 
-	platform_device_set_fwnode(pdev, fwnode);
-
-	status = platform_device_add(pdev);
-	if (status)
-		goto err_add;
-
 	surface_gpe_device = pdev;
 	return 0;
-
-err_add:
-	platform_device_put(pdev);
-err_alloc:
-	fwnode_remove_software_node(fwnode);
-err_node:
-	platform_driver_unregister(&surface_gpe_driver);
-	return status;
 }
 module_init(surface_gpe_init);
 
 static void __exit surface_gpe_exit(void)
 {
-	struct fwnode_handle *fwnode = surface_gpe_device->dev.fwnode;
-
 	platform_device_unregister(surface_gpe_device);
 	platform_driver_unregister(&surface_gpe_driver);
-	fwnode_remove_software_node(fwnode);
 }
 module_exit(surface_gpe_exit);
 

-- 
2.47.3

