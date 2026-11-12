Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491349;
	b=yNkVTpPUMNipTXPIpqW/WLbX3PalDifVCywNuqHvbayIkppxgKhQ4JCCtH8cAmq0ozzN
	 Di0gzFGHlCSo/MDBbnTFIRjP0CLgUMxEMAuXgBloCyYeM2kLMBqEoaRvzgD+rgPTm38/I
	 ha3MYKnvhDJViRZN5rlOGTHT5Ns5n82W4uDoKblZCeexSyjcKtOswkMrz770ADctPYKeJ
	 Kfl+P4FeP0Kxt+PJuF3VhxnaRA/zoiOoXhivL4ro13pRyelGp1WSeTTo80f0qccbm8Knu
	 di2O5eE9MdJBhPRo8uMC+E3trJdWMNQV48O1RINxfDkYJrPTI5RrjbtjbB5Z32xLdaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491349;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB559M1PwhJ8=;
	b=25AS7mqCLyzcEG6SwM1nr5//iBfST1oGeG3LRXSCDkSzB1hpvXb5j3MgmWbH0YJX305u
	 3LaqXkPAl9nBJI4mGArov1OQ7MfNokwkUsjZpaqQ/dCr0irFLTrqJ8Mjqh805zv1Tp58T
	 6N/FUDMZxe4MIYwjkENaBa3vl7tI3O9C8sWae211lW6/ncK+i/Z8kZt4vs7eAJXrlWu1C
	 /XiEll4pXytPYOTimhE6n/+VbbPaawoXxVGIuIX98Hz+cIMTCk556DkaCIhEcyINkX7Z2
	 yOWOukmGrurrUITjOfKaBbGsOT9wcMlX+weZxLB+YsUaxBrVNCm6OjyGnn9ObF+gQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIT2BLD6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIRm2kvK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5B2606A888
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 13:49:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B5B2606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TIT2BLD6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fIRm2kvK
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9RNID4092529
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 13:49:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB55
	9M1PwhJ8=; b=TIT2BLD6/nm6h/H0lPjW5FUasIWvkTvrnJDKH1DhjdvMF76yo4r
	WKLJMR0Bknd00v1QUidurARJxQDfCROsoMZmBof/DJLiv2W0R9ziL2Lj4ZtrPWjA
	87QrQ4NU+MtQlYF4SYmhXk4AToPCwXmsBeneUkD09FdxY7BntaMkIfClsGN4jMiR
	+W3dk1rAeUzeqPxvvTAP9mTHRcPmguHeKZyTHqkY262ZNUGSLCmpGuncsyQ7CHIi
	Z07/jneBEEG3b3HbnPMGKhVreAiaspULP73DCpGpl2NoaupPBeruberuRfooTwld
	SNCXn0+04mMdkA+WD4KOYLwI5SLN3FIsvBw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k2tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 13:49:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91eaad6eaeaso81388306d6.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Nov 2026 05:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491347; x=1795096147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB559M1PwhJ8=;
        b=fIRm2kvK81MMVS8Z9BfebEwq0HaSMtu+sNUEDbPeS5BJ19E/f25J49eAKcWW0H0Ws/
         sXSVm1Gb8OvgoeXbh0lJg1XzXuiCUgRb7o6B4wk8FXPMTLNe6cbzv2VDel2WXPR+5+vY
         Gv+/AOt6wK2RfdFBpjrCtUgshEuiZFoxBICrfqWvC8B2FNKoBRGz3NO/6tpPtpdeBR7x
         ykpztkiPdZ8rLUGSxprwU2SScc0U7wrJ1Qv+x0f5ak5uz7Mv8JZ7Wpx/R0bPpKSiZjnG
         rUEhEbe7cqr/3GSs3ArvY+AVjC4J5jccb+F6vXDIX72iDhDtLC8c/xVOaqEzmaXuY8wQ
         Yceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491347; x=1795096147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UWCRboaEh8ibRoIvLn+DX1286L/MuxfRB559M1PwhJ8=;
        b=BzS6FT1mcLzGsNinhvSFZCD2kFgUEmpfXGsDXPhoNCPXbbGuKKGLhfZZ3MZGSx3iqI
         9HXHv1cqCVDA+Mki23/bSB24pFGypGrhbr8I4ECG8w0ka07Z8AJm4uAqA81H3N2Yc8Jy
         owaA6aOHcnxE/t3fx7xxlOlF8RQ+MbHVmVAUlcR0TL7FzCP0Q/Cqy0qRibehA30oh5hM
         o4tjFJo8jlxNKW8VGxEKPt6OO5XZGb7Sd1ZY0fWP5RAT3Qub9XJzhBl2DvDFtxt1uB1K
         fCZYiOgXMtAXdLcjtnGcTh7vYp1ZjE5Oy4+kdLQogd07TriXIpSCsugiUvNQdeWgPh4O
         a6Aw==
X-Forwarded-Encrypted: i=1; AL+hErFRg1pf1nzrqFfTm4rJIrsdwzVlpwG7CKpoS2wQL2EgnOVgXnnA9CBvACKaNUo4gp9cu1Zh77Lzq6WjgCfRIPAAV5N5@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qiyw0i211+cx5Wj87TL6TAMn7lMxxLZyT6lhhtX6tth+JVTE2
	pmftCls8dN9bkhsm2ZVeWN/iGfe+r5aDLOdKB8/LItscL+sD/yvVTD+w/iCi956veqRXiDqVUgd
	GBwtWWwkupzZqJ8wpDtwgYyDe36uYEA3qQcbXVXx+sCgcgvxrBy05v2aPNZEE2q8bYQR8Rzi1lU
	7L
X-Gm-Gg: AYBFou0JHLAGBH8gIYGOXsCWGklQZnsQcR1pMg7aaBN3Rzuw37zqeaqQxesDMOGlYv/
	fNfPq65RwC4kxVFLWFwx8iRqxFnaTRPcEGmxinVRI3v/MgQREp3Pm+ogdRdv/cWfnEx5HzNhOJM
	jcVnfdhiKJIExBOt0ZtEk/yWbra7HmKDOdkhXYbPgqV6AO3JmiQviMxw9juJorzcGeFrw63WLYk
	tGG5IxukOcft7FWpcMilL/s6UnAF/yltReto9u+Cek4z6te9r17m9H7Ixjdtaep+HUepnIjxx5Y
	/CZ+yK/tFZ+5kzbYZVTEAPeA7Fw0BJHJVZ/vuzxds3p/kFQzH3h9xUfBaxkNwIebwnr1uNr1kOa
	WIZyxcdlFxWhHKAvjI30wUQDZ6/NuDMqHYWbMGmP9bya8xHx3VLV1MwArUj5L3QBYUKOgRaWQGg
	tVY7wnDMI4D5SNVbr7bNdBpuKdPQtkepuMaEqd6sH0XYcjPNfCQ726mbMuo3cW
X-Received: by 2002:a05:620a:390b:b0:93f:3646:7a53 with SMTP id af79cd13be357-947b008b8d5mr977309885a.83.1794491347524;
        Thu, 12 Nov 2026 05:49:07 -0800 (PST)
X-Received: by 2002:a05:620a:390b:b0:93f:3646:7a53 with SMTP id af79cd13be357-947b008b8d5mr977306285a.83.1794491346974;
        Thu, 12 Nov 2026 05:49:06 -0800 (PST)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a643f12sm352641666b.62.2026.11.12.05.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:06 -0800 (PST)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Armin Wolf <W_Armin@gmx.de>,
        Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
        Han Gao <gaohan@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [PATCH v2] platform/wmi: Allow wmi module to load when acpi_disabled is set
Date: Thu, 12 Nov 2026 14:49:05 +0100
Message-ID: <20261112134905.6100-1-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX3SMyzoDDQ/qv
 B26Tcp18mlzcbjVYRCnmFoxIoEBInI3JGyZywhK4ze9DsBbSK5itnyUWj/QXpmSrTYjw4o0usMA
 1S/q4q8eLkCXtWoXlCj42lLr5VwGO7E=
X-Proofpoint-GUID: VIxuSfbuaHOolw4IKPs5_eqOuGgBCufb
X-Proofpoint-ORIG-GUID: VIxuSfbuaHOolw4IKPs5_eqOuGgBCufb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX9E2Jrn4nK8pn
 jzET5dytdw9fStZfofTRREFHsuCw33KT5CeVNu2NjeDypuU8hW7P+00cjv5Rb5k+l3ZsEPHcCei
 5Ml7ygUwAfL03FZCe3f4qKIN3GKkMs3VFokqcnHuZxeKk1b53BauKjfpfkmX6C0Xv9kOnTiRjd9
 XgkM1vxFqb+XqKcUY640TTr1dTXwaASH5MCdJ8CKwH1qWmNOpwCYMsCnR5kp2vOLsii87iDgqLr
 PG2/8JnamZlgyQ/ijzKX4zKml1XolU3W43hEBeEy8nKK5+KFlwxdsK29P3svaye3pVEiVQSshGn
 ZUFa5TNmsbGZgicqm+fL2yAIg/LF19uHx/uIwPK7wTzie6p7YH+AhJYvxtKbRnbOIBikqJm8F3H
 pwjh6I0nFecAYMBh7eKMdWniHpyZChdc/S+eU3ZgpgcuAzu5UZJ3Z3FZOJ5VEp1ueBaIBxDrgWr
 Cqf3Owamo6ZG2CBuiWA==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5c3d4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=zogTTYgQR-khBHg7lYcA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054

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

Fixes: e2c1b56f3dfa ("platform/x86: wmi: Move WMI core code into a separate directory")
Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
Changes in v2:
- Add Reviewed-by + Fixes tags
---
 drivers/platform/wmi/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/wmi/core.c b/drivers/platform/wmi/core.c
index a99da9b7039d..ec1a51f08e02 100644
--- a/drivers/platform/wmi/core.c
+++ b/drivers/platform/wmi/core.c
@@ -1598,9 +1598,6 @@ static int __init acpi_wmi_init(void)
 {
 	int error;
 
-	if (acpi_disabled)
-		return -ENODEV;
-
 	error = class_register(&wmi_bus_class);
 	if (error)
 		return error;
@@ -1609,6 +1606,9 @@ static int __init acpi_wmi_init(void)
 	if (error)
 		goto err_unreg_class;
 
+	if (acpi_disabled)
+		return 0;
+
 	error = platform_driver_register(&acpi_wmi_driver);
 	if (error) {
 		pr_err("Error loading mapper\n");
@@ -1628,7 +1628,8 @@ static int __init acpi_wmi_init(void)
 
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

