Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D5754CF5E
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2026 18:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788893724; cv=none; b=NIKKmmguue2pLJhjCUHgidZ6vmZwFUj9Xyt+nbg8vZXTaciaH77/ZkYDASdnr33W9gWXvlSXxgVkNAtjSFDS2AKN96Qku9R7V1Sj8lhw8hr5VXxnkmd7bEFnMImAxOamar7McNrAs7mThBOz9M+o6aEEP8DOZOmzh1ixn2xUzik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788893724; c=relaxed/simple;
	bh=eWJkOHalLHUIvrnyKuyleu+A0eKkJJ+UCa3TYQ95f0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RorMH0V2CO/SGX2PyssIAYyM4ZLW9Hj2gGnEYF9cvVnPS9qI6uB2LC5/pV5zPkZQwEAWr9wMJ81P3gHAXvM+ejWAuYaILRZ9SUE41FvpBKbhvcbchuIUrqPjFA5+myqWy9gfjDdtdxqzuUr1rwEQoTdoxCM1z9vCDs1NcgI1VXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GeUwJm29; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TEpXAck3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GeUwJm29";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TEpXAck3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fdbvg3964308
	for <platform-driver-x86@vger.kernel.org>; Tue, 8 Sep 2026 18:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+fDiF02XmnpxDwvAD7XEAHz3RgGQeHNTmnb
	0i3ExQ7o=; b=GeUwJm29Au1fyjOnijbBYQAGOe0uZyndWwU6uDGwU4lGslFJz20
	jrZWqcfzeEsBun/q9uTEeXfMuMreFG4FmD4wX5gp2dJv8qR8SdZGjSO9PZX03aUt
	+SZIgLgkw6FeJDOc+B5Dk/d/3dz8LsakUYUoNxpV6p++yAwu2v0DRxpvh+jLF2hy
	I/b6YZ0RJu7W2TpiMGvnsRuVBZSUWs+PXWSgPAGSq3GmwjtMvgROirIhGchjdJeK
	BhHRj5b9hwjycAQGukVVPOX4LkoxF3vvxksh4d6Hv7fh0wC2TnA0SHFEiatN/imH
	EjYXtZkLa1K/zpisyWxjcWeJQ2XmLtp8q8g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjfp4aht3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 18:55:21 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78830f4bebaso577034137.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2026 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788893721; x=1789498521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+fDiF02XmnpxDwvAD7XEAHz3RgGQeHNTmnb0i3ExQ7o=;
        b=TEpXAck3vwNvzGPphgjVZsiCgWhC/DX8Uwc9wsBlMCpWy4EZKPUSK2hBpgeStEbL4R
         NfUgGeKHZqeW6vcYSg9/XWvtBm4pia3Rd2QB25tcpVn4leTIMTXQQByqVMcctqjvs3PS
         f6m3XNB9+PnUy2+AUlJqhaa/ANevupc/SpiDa4r2lio3VAMkBnkJ8aZV9MnfHTH35UAX
         Z5Q146FCYvn5lvqKiHyWGLuecdZtUr0q3Ur/qJ7WpziLUL9qo8r/T6HlSWGpsCBVIVmV
         DAjbxPCY9xO2VvDLSanCLxPxURz7leRuw5R6ma+IMStDqiGXrMhJRrftkt1qygbW38Jz
         3ONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788893721; x=1789498521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+fDiF02XmnpxDwvAD7XEAHz3RgGQeHNTmnb0i3ExQ7o=;
        b=SHxw3qMyFUdZ94Ip0ibxz072k6zgowLVeGxQQk4v8h/BeyAHcrCX/z88s9KJtzG3CY
         nwrKBj/6yzAwZyM6i+h1wXgfWTC2uiGAOInhYoIvqxgWGBpJCqbF33JbjReuJ0tZCklN
         gTqAtmowByTervOoTWBOiTTw/ju3x1g8H7YOfEeA6CbUj4RMMuGvwrIdPpMc6p4ro9dr
         t9Izalhc+Za6XVf8Kaud3Cuv0GHdCT/JwdCtNPnp/MttTTSOOsBw82XhU2vVOCCJTo/p
         bOlAF030izMTaP0rHxj4sadBxxPEFgiO5bbDzrKFD/uO2pGsE/9MpyEfsl5EBjs+N/98
         BFJw==
X-Forwarded-Encrypted: i=1; AKwUvBzh3+o/bxtlDPmib1drvYepFC2c21bvmQm6LN0ZN0jvcgIK0woWRgEDJWIBeYsdxbOKLt0d4cYoOifYUWrlSNZ9IapE@vger.kernel.org
X-Gm-Message-State: AFuF++mVWWSSkCoQUrz1pMWVULKeBDcqFM3lcmvuqb+EUeNmVmBlI7Q6
	bnpevrqGB01rktWkWKHsL941PTM4ZD2pWJZWm3gWxh+8jDTCgBo61TsY4amsVw9gHOcmgeIs2Rc
	NkQ006BCOLv/iA6963Mc4FkwDODpnszVrP5J3B+xtwZlKmfasLxzvWILuDVi7qStBO4NfXTwtG4
	M+
X-Gm-Gg: AYBFou26qTXm3s1Suso0gEuGyapT/CjnbpZc/y6JQ0lJKvglinFk+v8GCLe9MNlOH1x
	irE3SfujKtaJnk+EQmRxZUYO2dw3i/m+DtNGpgnITndkgF47R23TgcskFqgF3/z6zRnK0jsjW5L
	0mS7XdNVHlKeIDejFV/bB/RqCFai5N7HztbxU2v0hSv3DbcdLWaKJf9GbJfNfnUwp+Nl1IKnUNj
	56BOnNQy7GCKzp/iCOSw9YfIDhc5GmfPZoLxxMGXF4CKqU141U3DYdLtrceC3M1OEA9oHOq9gmf
	3uCJT6eabdTPqIiO5n8vkGS2wm9GTvkLkas40c+5pTs6DIuY5FfT3L+1DnviOg4kgTeCR8ZBYi0
	eW4UhO5mfrFpqEwbGa9WqkA6Y2DfZEkXVfEsnHBx53WLxA6lFXzNiSSSKJ48CDsxXTcMGg6uugd
	tZIuajn0Wmi8UweRM=
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id ada2fe7eead31-78a4a9106f4mr10892080137.7.1788893721301;
        Tue, 08 Sep 2026 11:55:21 -0700 (PDT)
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id ada2fe7eead31-78a4a9106f4mr10892068137.7.1788893720893;
        Tue, 08 Sep 2026 11:55:20 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68a6a1dsm5798916a12.7.2026.09.08.11.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:55:19 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2] platform/x86: x86-android-tablets: fix gpio_secondary_fwnode_init() not working
Date: Tue,  8 Sep 2026 20:55:17 +0200
Message-ID: <20260908185517.49047-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Qu9uG1yd c=1 sm=1 tr=0 ts=6aa05a1a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=toqxyINKj0e_rNMiHasA:9 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: dsNr2a04GRNElKuCOH2HkqBdLepabKIY
X-Proofpoint-GUID: dsNr2a04GRNElKuCOH2HkqBdLepabKIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDIwNSBTYWx0ZWRfX+aO3FFmAre3D
 qEDWd7MEaHP8tEsMsToaIFrRR2bViDdrLG9yMtAxd81I5/5WPMtTI2OO1WEeVj/0f3qw7Q3E9CR
 LWhNkueYg2Fe7npWsfS7B9OR0ZCWhqtcZm94MyNebMmjoHpcEJi3Mt/o8Kgk3bz7oi8W18zadPh
 JJ7NG5nv30QCHWHqkAVE9g8UfP64htPa+D0gsX1gNSnF7dDgGYOjMidjkKmmHNzK9SWQvf+mLun
 Jvw9BpvQdPVBOAw1VV1btgihVCpHIrSoLejk7DeNlWAG4lg6c8/Ma+s6IU/dEteearnp8Uj9ACR
 fo+RY4tB/YxTuK2Jzk9Wlvl65ZK8h2xAtzIq8N5iLFOnKGXx17A8jngMUI/Zbzmmt4slexaMxoU
 IW/UytRJHzEh4Ieu6ZhxpVvIEYComP9ywe7OCZHTvAPBfk/MLnspJ54qUIcSY/DL/iL7msc/10s
 62EHotfZStT0gM9SSFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDIwNSBTYWx0ZWRfX5fC4T+OuC5+v
 vCighDi30p15drx/o0tKdF8agpX36xOdRs1yeAF2GBwTzIJY1jAO9ifxnrSWvvDyE4u9Hg/R7MC
 BnV8Gb26VxqHeHya6FImNDVUCOHihAk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080205

acpi_bus_find_device_by_name() call returns a pointer to the device object
on the ACPI bus, aka the ACPI companion device.

gpio_secondary_fwnode_init() then continues with setting the secondary
fwnode on this device. But this is not the actual physical device for
the GPIO controller (e.g. the GPIO controller platform bus device).

This mismatch is causing GPIO lookups by secondary fwnode to not work.

Modify gpio_secondary_fwnode_init() to instead set the secondary fwnode
of the first physical device associated with the ACPI companion device.

This fixes the GPIO lookups not working.

Fixes: 1448c2d2ca5c ("platform/x86: x86-android-tablets: enable fwnode matching of GPIO chips")
Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Move phys_dev declaration to the top of gpio_secondary_fwnode_init()
- Use %pfwP for the "No physical device for ACPI GPIO dev" error
---
 drivers/platform/x86/x86-android-tablets/core.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index b028af1c9942..cfff7f5eac5d 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -390,6 +390,7 @@ static int gpio_secondary_fwnode_init(struct device *parent,
 {
 	const struct software_node *const *swnode;
 	struct fwnode_handle *fwnode;
+	struct device *phys_dev;
 	int ret;
 
 	if (!node_group)
@@ -417,9 +418,15 @@ static int gpio_secondary_fwnode_init(struct device *parent,
 		if (WARN_ON(!fwnode))
 			return -ENOENT;
 
-		set_secondary_fwnode(dev, fwnode);
+		phys_dev = acpi_get_first_physical_node(to_acpi_device(dev));
+		if (!phys_dev)
+			return dev_err_probe(parent, -ENODEV,
+					     "No physical device for ACPI GPIO dev: %pfwP\n",
+					     fwnode);
 
-		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(dev));
+		set_secondary_fwnode(phys_dev, fwnode);
+
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, get_device(phys_dev));
 		if (ret)
 			return ret;
 	}
-- 
2.55.0

