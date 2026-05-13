Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E24538D3F9
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684727; cv=none; b=vA5i5xtsdUptyY2YS1Im4NvQMQaMbLxyG+ilR33y3ES3WEbvQKKFwaZ79a7eEw8x0RvXP75WEOXV1/tfzSbaohYbFJLMKoK89h7A6625p7+rQF4AMdXUa8TQAHg1A1l7PKfBqOugoIu7l05FPLg4X2ohn1bV0+fhqPowS0JuKzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684727; c=relaxed/simple;
	bh=8YXXx+c7Bfn1zIL1XiDsFM7WtZrjadc3NSaS7UHHFkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gwWnknwr4sbEMWNhHRMMNnWTLixcDgsVsD/9w6o71jy2faVIHYwQHMNfJ/Ced6sOC0748/oyclqlffmQulSXivqWfetCH95AMvxR1o91LxrFXwqXD66Vfk4FY+l8MSsp/iinl/mT2+euHka8o1UUdXU1cHuFA6Pby793/8p0U30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fIwAsONb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a3ICG+Fc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fIwAsONb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a3ICG+Fc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF3pEI3474757
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=; b=fIwAsONbzLCkXtYa
	KNPlSOOqNAe4a7eV25WrOsZNkAMwnBRCwGJW0f72LtbvhF701i2hs//5C9ug1O52
	Cezkr9qa1gLF137cR+2GT7wARtjoEftddoBKFyMBYIFeATgpJUvNy2Hv7DveHgtC
	5VkysksqreuXTQLbqoR4KSyQArbPBWpLS+JECRBUTsC7pIldtjM/ewvqCCsAUwQP
	pXxa4w44Y0oHU5hy4nKkZ5D4HK+jRLQk2KCX/sH9T2vZWjx+l3BDNjgfzfz5vXVv
	STlF2fXaEB8yWu0oKF6/h6sYrydwrSNTuC2g1kBlqIre/cr5mguxaLVBHB/s2HPg
	rUtFtg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p419f8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 15:05:24 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6853c2438b9so12175066eaf.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 May 2026 08:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684724; x=1779289524; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=;
        b=a3ICG+FcYeS7B/NVAn68G1Vrqs5ofiXlsd69kNBQ8VHUiP8VS0ZmPiW7WUOz3NRLhs
         GMFygCRRfg0OjrptfslfYIx5Y5YH+0qcBoOxvZCYkL/QyBsRroWcN8GkJdEIfs1msHvW
         jB5Z8kEfjWjGKsMSv8UA0HCWfoAAkvc+0cM/lK16g72E07FuXKNlxN3Ums42PgGUmQ/u
         yKlXCsJmniHBwnBWL6gAqYW7xKIc8wnQ0SqNJOIGlm8EQY2bxm7Xq3nGTrKn86mD3ifc
         eoeYcjjnmc0MHCZ9/CIztHfMYepfr2h1CfPhrBImowxmR6agPnccHp+OMg9dFweDIt9J
         Hj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684724; x=1779289524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=;
        b=oOSb3TMhkD6uore1YTxaaIV8S2vgW8xDcPBU8FAOYZGKW2ooF5nb40XG3XWTmkUoL+
         cJj2F5GuYskWS+hWgy5oQTjcXcBsaxZxLeCRR1a/iQveRs+IQSYlEQ5ohy5hA16d3mZv
         gOurRHJGz1Rd+qCjXOFy+UquewWwSx8qoQl63U/Mh644HsyVwxont7bVoHFLvzRyp/EO
         SAc9sknhs5fm2hEV18QyHNEebFIfs6baWcScUKFJIgWRVQwKOdg75yZ6ZLCBRtOa7tkf
         Jej8M4clQboAVhbgK6vYSKWvZjEnypksho2ohnYYWP6UuMSIQu8HW01+7vDtcQYFWIsW
         nGmg==
X-Forwarded-Encrypted: i=1; AFNElJ/ihJiZImdnzuQYoAUUVCMojQOwH60ZBb3GPp/35mE+7P6vj+aVTlPIEoyHP1bDrsBFZdUITNtL7GlDb/QFZzowhn2+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CvutRJiSC8H2K3Q3VmnpSuQ4Q1SnJNSpqy+BKiGKCBy0XGwR
	i78pLDpXaiJngv6pVaDt1xGZjEXzW4HPuCAtIOofSMuoMxf1102M9ek323VXRYci8HqRDhENzzU
	fpT3IuJFfhAvRbJvQvmFFI+ML/0iR7ajGCBpoXGH2yv236JqPUZm32nbbBfNKohRTj08oweA4/e
	Q7
X-Gm-Gg: Acq92OGvbBVCKZpOldInoTe48qHBWO373/pRHBx44b40TVeW7oCZOogadRZQVC9Yk5k
	FSyCaUvQhBDOXWwk6qNpgbXjRtRNMsfj/3qmH2khbnXFgxbZKP498PwSwP7p6a57t55qaJwi5X+
	FexE44xJxx6xUUDJw1Ngs3rwY+0mq65n2F9VqBgDEFvffcwXjhv50bgqAfpW1nrOmcjszVgKdU/
	PcC8r/sYPLDzChQph+d3ZsIeZuAAYpnIQoZj3Q4ZPO1WUVYHn9dKDVEUPBGnWD1ycNvrNI6rvUn
	DUSvWcOHNTrACFxZc7gNAJ+Tkx4sySUwGI+fRQG/aP/Cyd135C/PtlvgaO19//6o0bqUZ2QVIdz
	jngKJj4CQdw+ymrrp4dSJ0PHqV8TqttO20xR9tTTOC4Ijy+ByUQ==
X-Received: by 2002:a05:6820:188d:b0:69b:544f:b2e1 with SMTP id 006d021491bc7-69b78d497f2mr2330112eaf.2.1778684723582;
        Wed, 13 May 2026 08:05:23 -0700 (PDT)
X-Received: by 2002:a05:6820:188d:b0:69b:544f:b2e1 with SMTP id 006d021491bc7-69b78d497f2mr2330022eaf.2.1778684722980;
        Wed, 13 May 2026 08:05:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:22 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:49 +0200
Subject: [PATCH v6 2/6] platform/surface: gpe: use
 platform_device_register_full()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-2-f9c58939df27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8YXXx+c7Bfn1zIL1XiDsFM7WtZrjadc3NSaS7UHHFkI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMl2Rv+Zsya8pgVoXljSmeDSjKOIFoePae2P
 wqY8CfPQXSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTJQAKCRAFnS7L/zaE
 w3CuD/98ugd/Cm4ouSqqIrpnFdGzXCZq235gFk9owOU/zFx+CoQTW5DwiQs2+zWJPfopBalIUME
 xllUWojs8pk6AXWy0bLhJ8zpleeq5qpzciSpxHU4Ox66qfOsbYs1Nf9DEbUTMsmre2IWFMuKCit
 lbARISHLXyEqKBji0cGiUsppbj8U6v9R2zWub4w6fJmFh4T0oJhIw9AgxBK6RRG24AWBHPBiXvf
 CTPZ25F2LLehNMX0T+Ju3IJfP+ohgaSYt/bze8gFxBb4O+dRQsKZsTOiBtR7rFzF7TQZJlevuVB
 W0FWbgZ2uFIdHSw2/nyYT+T3EowHBJ1Xcf4tVhvidSBFrhio06ERNni6e34XyhP3V3hNX2Y3ylh
 JILB7jqFDOd8r0gKUkx1bC/+xt4pTD80KpXdbXMF028sk4C2ItXFTZxeqPHqYoI8fo6mKY89z0d
 X9pFFWf+lAk8EfToQUr8hMYfxnHeqyTmL4UhzKGdq2scsEwAHIFXS9UsFouJiA26z6pTcU/R39Y
 5ofXM3GpgBV1jjMwVRSKLhsMqpEMSbkebl8kzR2Y5ttzc9swYZhOwSrrM7CK2excO5pyytVVN70
 5Samp3Z3aZATl7T1tj6zWcXGCPgxxIc4MZvaf5nmXS9neEb/fGL/byvOi4PRUI/SLF8ZcNCeth+
 ap34w4jYSGt1xsQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=df+wG3Xe c=1 sm=1 tr=0 ts=6a049334 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=vKDqCkOE6BQjc6v61vgA:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfX0B9pZRTaSufU
 NqQqZXbr46cjEHgydbpaJMNfin5bucpd9hlCaG82lLjomWc6MAJBW6DPug/k0QGQpaD3n3d3gAZ
 3QGCUMAJ2jwySIABI+N0JsDMwTLplo6IZmKisFVaX7i02meVhrmBkxnBsrXrz3ASgDBBuG2joP/
 JUN8pETcrmS4AOMgIIT963HfbsTMCXeFdp/Vredx/FtcttObnURN039ey1jj/255sC+Yg8dN7ag
 gKd2uXFYy/L+ta+m5IciiyWI3LyiiWorzJkHClG7K1wb94EPqymsPchSRMpnyMrFVYHVS442ONv
 8Koa1emY1grerBTUfKdwrKA00mT2FUa4AUYQRJOTykmeB68uc1SNkN/sbbAazlMHyCuoccTcrTg
 9B67+ayMv8K3VJ1wj+xi/sN018c+i2ErKpgdTdm/6fXD+WuTWGRtasUP9sfo8pIzm6CiNQA1jC+
 fKwwy1hHrv/GETEdBgg==
X-Proofpoint-GUID: tPt29jmD4HU3omSJVrT3eO0GGsz4eNs7
X-Proofpoint-ORIG-GUID: tPt29jmD4HU3omSJVrT3eO0GGsz4eNs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 36 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..b8bb47b0d91f036ee5073d21534f8f26a4d5ed15 100644
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
@@ -305,34 +305,20 @@ static int __init surface_gpe_init(void)
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
 
-	pdev->dev.fwnode = fwnode;
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
 

-- 
2.47.3

