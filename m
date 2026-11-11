Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402980;
	b=CwaKrCyV8pS7icrXHPX2fYkLZxkyfJp86t9xY02o5uM8zXK1T10usNJ7WHz9dWj38gKa
	 liJp+8vP7xlwiv3AXzFvxP+9U96N02wEagVvO19GL9spbuYqkfC30GdxUhwjKvxxF19t1
	 h4TW9bG5pGfAp7bvQcUIlZ/mQXf82Z39bFxvfO4qZiWqsstmUGSryU6gwZHWnHbb76Soj
	 6Ev74FbNBPIeb28APgalv9m5VYZjYuEk6ow7xvkJiw1OLSamx96OAydNJf37oMM0KihcS
	 EQcYTsxaBZy+Zgk0qrZUX7Ua1HsU8/7nnig318YChlEDH8v9BTiVpyjcTJogQ5q+qfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402980;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc9CuN7O6w=;
	b=1OO4Sz5kO/cuQtFkcWf6Lxi++qIT0Y98GQ0+i5rEOLNu/k1l3KRv3oovFIzkYrlaf5G/
	 POWtfetNGh4HOar84nhfQRzu6wuYlXseZqE+ADS/0YWigGEvOBl1F8aYCOSMPeRp528F3
	 pbC4eyZRAe3XJkYBUdERnGkwBDjGfrCJHmythI014ADROL7z/T4ofb457ZsnR4NDDmOyT
	 0sK6GsrCw6OqnUAOp661KeA3p0HO6orfyn/vozo+QUdea5VErbctqlajwjZ1FintPs254
	 uuluXlD+tCeyndZuIKgVFiPCsgx3wQwuVjv3kjOJTe4qA7dmBE0nRkSgAxYA5/mn2tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1tET7ov;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hcS89MQn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9901606A88F
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9901606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1tET7ov;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hcS89MQn
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ5xq2974974
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc
	9CuN7O6w=; b=D1tET7ovDU3+9KHBZwF0yq3+CocjlJIhV0HFEqLLCorlTioinOL
	pocuw7ofJ2j6NeJhx9mSDgFIE+p5fTRDKVXTFd7KwGeQmQMgL7ZUXmvmby/IGLX3
	OlMxwbu5Ro2i33R42TVjSAGC7FIbL90r59gh+8WJPGiqXsKa2sJTWb+VfGKnDGoY
	km0LVTdqR1NlgbyukXuv2+GzLbB6L3g7myvk9eeQbf3spYPCz21iyo+lnGaI2tay
	WL+z9hUUeNiHFD9pz7529GBDprd6DLfHvx7umW4xW2ReGKFQ6+Wwjkvn3BLlpv+Q
	bBDVvKXxQJCKn+KG8NjTBSx+HxI/sk9abxQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbxfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:16:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eacf20364so65002046d6.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 05:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402977; x=1795007777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc9CuN7O6w=;
        b=hcS89MQn2ym7k3pFtQgrPfQxXaxCcZbAtsB5Hunr/DSyuvOxbSkKtFNb7FxPIuBnYm
         t3TXzLdPR95sGvxV7NAitthApRvjoSQLI4yG96A9+k2UymxyXUFPr2R6SYDSvC4O87rI
         jQ4Dxm920XXxxzsZoCwERhnICW1SWMaQOHdSbr0BNWs6mybx2q+Ec7gQkO+FR/7z0mNT
         Z8MT46cIC3SuJ1+XoeVSWMmyUCtLpiVhcz9GVrmAEKgfxpqetGuciwefCoSloBDty9nI
         O0c8h/3zPDcT9ouLdU/Jv56J9EXL1X62Hw56WhlfUSElbnGqptGq346vLdJNDG8hL86n
         2dew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402977; x=1795007777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EpL/UlhMli3NzA/FongzlGW8okom/Xkf+Hc9CuN7O6w=;
        b=NcjW1CI6pZMhFNxUaI7sPnFMt4DImmHaGnPuH8rkQIQCltb8XbcdfnpcXE2gMZHGBO
         Y6lYHWeudc52Tm1TSlPEVPv27+7vRKZsBkzFAGuGbe96P4yUBaAt9pQjXW56FzWMsceG
         aCuyB5noCO2+Rq+Nc0dpevW5RgeGcWN8Fb+57rtU6+QgA5ayxRkImrnixsCLuOE1OtBs
         6mOwj9xK2jZr7nM8Ypw1lS65PveVACPLt3733GApnloBC0uOCmQoIWdfFQ9W/6vLzMPo
         +DETdx3xu0lc929PrfxlkiqnZ84aBHjAgeE7pUE+rpQl98K/hMD5TFCfyVOzVX8pLU1/
         Iqgw==
X-Forwarded-Encrypted: i=1; AL+hErH9i62ps27l5XxvqEpa+Lv27hKdiUghwCZvDOVpZr+Y/y7NR+yhNBVCLyVU2Ldb/1s4AUDuJ7JWAyLUgEbylqq1IVHg@vger.kernel.org
X-Gm-Message-State: APuU4Z8ErhYAiffdLLST9yDvA6YVK6/wuYr7LdCYW2d4/VRBV8/AshY/
	4uv0jGfHdJoiYZg/fmHVjxn+pFGPcGspU5kIu/gyqgiqwLv2jfbBdk2r5GSZoOc/Wqn/Shz3LWn
	77nltkJKeirKKeEDbcOiAgg2sfOg4iI9o02QGTxWwLK98mExgxPONGKxjKmnF6uGYVWJKZR4vio
	FL
X-Gm-Gg: AYBFou3bORxJvAzrg8qkkq1TpLl5nABe0C1CEv+UjDnO2h1t2nMnySY0bu8Q14BCXa2
	cVFCnaYX2d42qiYzz8DPop1tAVUYawnu4GAcTehd8hXe/22s8kfD8IwKZlItYRhcT8bh8257hb5
	eY8oFIFxxMan/WychEHPUDnw7Om4AEtE6SKmEbKFy/GVaLddVF7LFzMB7vvEX7mOTOfu1kIpBkn
	ybHNRKAvqJvbGcsuqUP8Qai5RdePel0xgsz4RSCCS1iKuJK5lSf0OCYQ01Yc4Ir/7OnfKgGAuwc
	w6oVFwr+OFwLH1GTJXlo+9UK+nibiu8r+9076+FfWYz53LPsnacG2p4kuCb9eHRv2Wbw1gNiTUX
	5Jcm2eJbWHc3RRTSwAuoavhf/50t6roYiNOkWW9OYJo4yL/ByvLUIGalgGs8o1Ewi6jkbjvDAKN
	FU/ftWLyphCZmjyzkK/nya5iBEM7WCAXTwfxiPTjW5WuVYRvgeDKjKulehBREE
X-Received: by 2002:a05:620a:4107:b0:93e:c5eb:2230 with SMTP id af79cd13be357-947afd92bf7mr381828685a.33.1794402977245;
        Wed, 11 Nov 2026 05:16:17 -0800 (PST)
X-Received: by 2002:a05:620a:4107:b0:93e:c5eb:2230 with SMTP id af79cd13be357-947afd92bf7mr381824785a.33.1794402976801;
        Wed, 11 Nov 2026 05:16:16 -0800 (PST)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7578eb0b1sm2399995a12.22.2026.11.11.05.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:16:15 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH] platform/wmi: Allow wmi module to load when acpi_disabled is set
Date: Wed, 11 Nov 2026 14:16:13 +0100
Message-ID: <20261111131613.6290-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX58Q9WRjAPneW
 2eYgyeH6SNL1kmJj2f+IMYcLVCrjkafFnXuI67DtTzpcsMzcA8z22U5WiufhlFzyzjR73y/CUCc
 nIES5G3LL7Z7eeoMn3dgv7uFhGMReALlWVdvmotP+PYOEJ4vxmCInyH1QowLOQhzV71r0WD9Dxu
 gcIAkumosTl7gQcaPg+K3Dnl2k7Pzh5BzIePO+jPc+3pHP/febV/Hp/Jzgr0KHbNSwuaTlcvvwp
 55OQMNIQmgVqnJST+zXJjptxl6dMZONLOt+yGhZlyEMHlkry1RoEIFYuZjYWaHruo+4fL4Hw/ec
 It2Dfv30SVjX0s0XJOpQpGKZwm9lYbs186IgaFUpHLreH4zY+OWHvtZ2xfCzwoKG5QPviNzS8tB
 eTI6a6TtSjNhIo9dmFvS6NzyBLs0vd9n0Uz4gVh4TCVW8JWTJdvbN57DEFalwwvTztsHsnr9Qms
 DX+UuRd7N13EX6sLlIg==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af46aa1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=zogTTYgQR-khBHg7lYcA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: gM_rVZeUa8WkqvAW-ji-s0gNVLgIMgzs
X-Proofpoint-ORIG-GUID: gM_rVZeUa8WkqvAW-ji-s0gNVLgIMgzs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MiBTYWx0ZWRfX97c+IDriNEW/
 6KiGjfkKoXZWY2TXAYyKaKteDbpMeATVgWG3ZP4deWMEF9FAf8XxsHAMozD0WuhtdbmmzhVYfkk
 VrZ4GRyObOl4gCTab3dr8eG8/EUWfDE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110052

The core wmi module provides symbols which may be used by other modules.
These other modules may still function when acpi_disabled is set, but
the current behavior of acpi_wmi_init() returning -ENODEV when it is set
causes loading these modules to fail because the wmi module these depend
on fails to load with -ENODEV.

One example of this is booting a kernel with both DT and ACPI/WMI support
on an arm64 systems with devicetree which will lead to acpi_disabled being
set. Trying to load the amdgpu module will fail in this case because it
uses symbols from the drivers/acpi/video module which in turn uses symbols
from the wmi module. Note the video module itself already contains handling
to still load when acpi_disables is set for similar reasons.

Fix this by allowing the wmi module to still load and also register
the class and bus instances since some exported functions like
wmi_driver_register() rely on these being valid.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/platform/wmi/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index 529825dcfbfe..412f2e23b01d 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1573,9 +1573,6 @@ static int __init acpi_wmi_init(void)
 {
 	int error;
 
-	if (acpi_disabled)
-		return -ENODEV;
-
 	error = class_register(&wmi_bus_class);
 	if (error)
 		return error;
@@ -1584,6 +1581,9 @@ static int __init acpi_wmi_init(void)
 	if (error)
 		goto err_unreg_class;
 
+	if (acpi_disabled)
+		return 0;
+
 	error = platform_driver_register(&acpi_wmi_driver);
 	if (error) {
 		pr_err("Error loading mapper\n");
@@ -1603,7 +1603,8 @@ static int __init acpi_wmi_init(void)
 
 static void __exit acpi_wmi_exit(void)
 {
-	platform_driver_unregister(&acpi_wmi_driver);
+	if (!acpi_disabled)
+		platform_driver_unregister(&acpi_wmi_driver);
 	bus_unregister(&wmi_bus_type);
 	class_unregister(&wmi_bus_class);
 }
-- 
2.56.0

