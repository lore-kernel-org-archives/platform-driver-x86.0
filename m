Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EBB3DDAEB
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955550; cv=none; b=NEcC3R7QvSP2sqKwAXRHIz7pr0G7/CUH+fr5pQS/tdFTXa6S0PuF4OPdz+LiamDcL7qnocxbhTElRvDVC1zdM2HBPdTeJoc7yY4zw/K3/6cFfmn9jT3P0jAfjJYlVxyL7RxM/PFAhmRST1+dN9GCPgfoP0y93uk/5EIwb+z4j5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955550; c=relaxed/simple;
	bh=oLwa7pZUr6doS0kE5wIzyXtRk9PkNeS7cvA7R3LQYdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T13gW1rSFaNG1AumIIs7CJA2/Wgd8E6pW5SeBT6YU2y8ISNDA4z1d/TagBG+Qm76vJDGbEvPH3IuYz8Nq4r8eb0u8t5bKGGV3VmHGLirc8/GabvRkYYumYpPHflYGHX/+EfPLWD95iVcn+ncnjjnrgO8W1Xh3G/2giO8YNVF8d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcRCB/7D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evsuqGOK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcRCB/7D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evsuqGOK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF83dm1701259
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAzeN59J0azB7+VxlBwnfSfYuZUkQq63rtSgGfRJFeY=; b=jcRCB/7DvOW944R/
	sn83hdNJaSiW5aSaS+Bk7JS92KHNJVniy45ohZWgZim+NDIyllXCfeL0643JD6OB
	jQiUD3NiPCq/ZkcQu6fwgtnRHKfOFfAbldYKMowgpaFzhNoFlNVI3ahliyR2ffYc
	PaViAW2GryjCL39Tsb8bOCkcAxbkRhLEaV320yapgpfF90WqOXk+YG8VONOv061v
	Q6wx5YdLDB/+iafOVGq6gd07pz+87PclsfgfoXKc1ZWdXY5kdD2TzCR6PquRcfnd
	xGjxEdVIjtb4cPrwiAdZdhm0Hfqe2uNaWXfGvh03KDCXkvjygTm4Qw4+pH9saWbB
	umxn8A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3ha1r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 15:12:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0d6a2f4cso46971901cf.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 08:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955547; x=1784560347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAzeN59J0azB7+VxlBwnfSfYuZUkQq63rtSgGfRJFeY=;
        b=evsuqGOKlFmtDKugRDgnPiuM5VBznOvZ0ZUCidk9p/KcAB36xMsctmuq0dceb838Vw
         RmD36GAXQy+2Ucer7sAkePr6Q4xWJpnG9yjcYHmo9QT69I5gKbje6KmX939WHxf0uAov
         dTGGAM0xVVsfohnGp6GKFXsxdS/y+lPg2FsFAGNZ8OoPYagh0XPrWpqlLyp10kAJR6HI
         lWrhLxmV5jF81mimAk+W781k+1yJfO/i4X8R4myr6CMm7vH5Z/Ntcc/MwgTXq25vWV7E
         juFo+xGJxCtWVSvrsp0XEeJMZAIe+cfFBebIzR7sE/rWQ7J5fDXfhBiJjTQT2LOFEmZo
         bCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955547; x=1784560347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAzeN59J0azB7+VxlBwnfSfYuZUkQq63rtSgGfRJFeY=;
        b=j1En462SWKqaEesMlSZs6gWN3Tojck3qZoj6h1Io2UTV8i67WDOTeiDIWr49SxlSlR
         PucmFIt4Um1t07OBDFCR1kJSyRUJQ1vFlU7659WYJeIa7Uku25ztFf7gvuYl79GCEYRb
         HHozOwa/GlRrX6CA47vH6c5Pz4KS7gk+Ojzn4UFQB2me3cKYtSHv5zZj+lMkAJmqAA1j
         xM4PGM7gENSbYg2owwa1Zu1Ctfl8FsaHIa9822jRIzVxDPH4QJik3pvvsVSGzvRgUMkE
         qQm8AGlYi2+PAEG0PClTS7rW1d+AED3UxR9urree9MI0Ryx9wXRceFj22i8wgz+hujl6
         NK/w==
X-Forwarded-Encrypted: i=1; AHgh+RpD6cs6oGrIMiIESzYGLo17jxZiadQlpVoU0huguULKlsCoJQz4C/Mlx4o2+zhjXIurZOqutIHFp3yfLjfEN1Rnl0Vy@vger.kernel.org
X-Gm-Message-State: AOJu0YxsmfWINh9wJ9IPR03y8NJOeQ1ZyTAxzN0GqIZ1K4iOhKT/AGPL
	4MD3hx6j+HwzX6BSgTZjHYNT+vwCgGqSirjg67MNXZ8m6tw7lWHG8xVPiHF04rMJfhXd26Iq9ye
	50oAcVzupp43VPZqHo/T7ktExnRaMBDgGMXBzRgm7x6EUuLI6owb4R+ZC11Sta1oRxhHEmg0nQe
	eW
X-Gm-Gg: AfdE7cnAeTAO5Yyj1jaudeyX1kIlsOBpVzbN1qtoV+ymR9EllF3+SGpP0beqj9VHAH6
	VeKCNXTRQIaazC49vAH4jVSQJHcyxIQ+vcZmauAgXleOxDpDnz3KK77T1C0HWIKRKEE1f9BZddO
	g9nMpONfQ4/PPW1ZpUCcQ2OaDsv+z3B8C3TFYBvl5a1bs42BkXf9jqnlpko5u7kSvBlRXHuElIP
	ZzTq4uWSYHbdCQflmT858dJMRMK163gxIM7nvz19htMFiQB0NnCoVs97PmL/E0fqY9kmTs36lEs
	yyXuH0cQyQSKVHUyPXrwF7TEmYuaa5Zo/2iG5GpSiYxPnMJoeSnShDAAQBVg58BtXMokIbJ6hyl
	B/KuasGIDHtzW988i3E9c6CKQSkMj+YxzWiEzsRmi
X-Received: by 2002:ac8:7f89:0:b0:51a:8c97:938e with SMTP id d75a77b69052e-51cbf287e88mr96882321cf.69.1783955546744;
        Mon, 13 Jul 2026 08:12:26 -0700 (PDT)
X-Received: by 2002:ac8:7f89:0:b0:51a:8c97:938e with SMTP id d75a77b69052e-51cbf287e88mr96881541cf.69.1783955546045;
        Mon, 13 Jul 2026 08:12:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:12:00 +0200
Subject: [PATCH v7 4/4] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-4-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6684;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oLwa7pZUr6doS0kE5wIzyXtRk9PkNeS7cvA7R3LQYdg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBNIfBh8eZoHsF8HLG+w8cZbCKKmZx4hpanR
 IC0jnASC8GJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUATQAKCRAFnS7L/zaE
 w+m4EACj7kCadQtPriMiLBsyh/UeZju0w3Z5woybvD2DUOzj/3xS8OhVCjG1jw4pXEMNjsWF7FE
 25xld9nm/Vx8CURMNnyrdYLYP4sA9rMpvH09dbxgUyWKwAaX/0dTTfWITqeCgtVJpMvpy/gWt+i
 1vBo0H/Xk/T9WpvZrUvwzsEdKd17lRXlSv+iu3JaIHmhHidGgkoN6pYxPyMNEjYO2jmXFbgtuso
 Co9zq0hChPyBScaGES4XUgTFXApYLBq1nHUc1MihSUrYvIXtOxs4c6KdHtzEwoGaWTzHukHKg5D
 eIXHliyqoXlTq8iUhPv+zWryvHiffyPz+ovpcHvjee9f4Sh6hgHTEmV5xNwi39W1sddnYQF5AoP
 a1rZT8YCTX+cb+e9tbb1u+7ICiZTmtjNi4/jGvpnilQ6dbB594mrW0VRESqh0GzV4B5YsScNhWC
 Ua+5s5CevweEZkMCVPyPokbahXHn1KH8jE6HXwB70l+/FzOuKmUC8C6trPXKcsYAxeWEOQtur5K
 UTchmQxsvIsB46bDeB4DYkcRiOSziygrE7nM+V3XI2qJqT7o4ASHt7NPxuQO5UccqU/4KIO9Rof
 K/sCY9GMVcEDo+EETlPdMj/xppbFdYHiUPbFv0rDYsrt0oIZXV0B63G9BEs5izCGywK8RvFRvqA
 kgq4M6heDWFlefg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: _ySq4RJOGMVTISZTJAb4aQ7aqP_JFj6_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX0epwCaJ8uXO/
 uWdiANLeqAkbVYK1YulC8g7ro+J662owUVN0b8fManDS3w1gMjqL70Gj7mH7syyysa2BWr7qtQC
 njP/Dph+HBwAw+k407m6+raXcES4BHw=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a55005b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zydxXWD-JFuk5BhJ14wA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX7JfMoqT59MLY
 bhKP19mniof96sQOqLPAYsy0TRU+cz5oijqHFSfCCB5HT4UTnVmFeObGKv2tHVYp5Fyw/SWOwdj
 jFtNRErMMwk7aitFysnpqoOtK9ZOxrtbPmxbusqx1BPmFriBclT8HUZ53gaRDkGIwspg9gOPrPk
 kqcChQVDISwYggw6eDx8YmBrezUGZwLijjyCQbV31Z2Y+AqPyIplgwrGWJ9bBhwPGKQlo6fu8Mn
 LWyEZfjyfcQhtUkvXQYHH+DRLFkMWReaangsoM0gpic3hbPSpY8rkT8vWR3eCBBigyqv5rRa4e4
 oRO1skApbNTQtUGBPVB1LkmFJswh2/HdxMtOz19si2Q9b+l7yxUFKKIEPykj9WbTKxkbS34+GF4
 vLqqaK9cw+X4W3pdrA0B9Su+fkRN+Nozaz1+QA6bjf0OHKbHVcHOXFwcPAhZ3ygq6sQ5maEQ+Ly
 VxpowcONo37Is6lR7FA==
X-Proofpoint-GUID: _ySq4RJOGMVTISZTJAb4aQ7aqP_JFj6_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 180 +++++++++++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..9ce563f76aad6943472dc78f3639ea1a2d72dbde 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/resource.h>
 
 #include <linux/device.h>
 #include <linux/device/bus.h>
+#include <linux/fwnode.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEVICE_NAME "test"
 
@@ -253,9 +256,186 @@ static struct kunit_suite platform_device_match_test_suite = {
 	.test_cases = platform_device_match_tests,
 };
 
+static int platform_device_swnode_test_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver platform_swnode_test_driver = {
+	.probe = platform_device_swnode_test_probe,
+	.driver = {
+		.name = DEVICE_NAME,
+	},
+};
+
+static const struct software_node platform_device_test_swnode = { };
+
+/*
+ * Check that reusing a software node works correctly. If the call to
+ * platform_device_register_full() fails after adding the secondary firmware
+ * node, the software node must be unregistered in the device's release()
+ * callback or the subsequent call to platform_device_register_full() will fail
+ * with -EBUSY due to the software node already having been registered.
+ */
+static void platform_device_swnode_add_twice(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	bool bound = false;
+	int ret;
+
+	fwnode = kunit_kzalloc(test, sizeof(*fwnode), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(fwnode, NULL);
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	platform_device_unregister(pdev);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	platform_device_unregister(pdev);
+}
+
+/*
+ * Check that passing a software node as the primary firmware node of the
+ * platform device does not result in it being unregistered by the call to
+ * device_remove_software_node() in its release path.
+ */
+static void platform_device_swnode_as_primary(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	scoped_guard(device, &pdev->dev)
+		bound = device_is_bound(&pdev->dev);
+
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	platform_device_unregister(pdev);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, software_node_fwnode(&platform_device_test_swnode));
+}
+
+/*
+ * Check that passing two software nodes to platform_device_register_full()
+ * fails.
+ */
+static void platform_device_two_swnodes(struct kunit *test)
+{
+	static const struct property_entry properties[] = {
+		PROPERTY_ENTRY_U32("foo", 42),
+		{ }
+	};
+
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &platform_device_test_swnode,
+		.properties = properties,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+		.properties = properties,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+}
+
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	KUNIT_CASE(platform_device_swnode_as_primary),
+	KUNIT_CASE(platform_device_two_swnodes),
+	{}
+};
+
+static struct kunit_suite platform_device_swnode_test_suite = {
+	.name = "platform-device-swnode",
+	.test_cases = platform_device_swnode_tests,
+};
+
 kunit_test_suites(
 	&platform_device_devm_test_suite,
 	&platform_device_match_test_suite,
+	&platform_device_swnode_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for platform devices");

-- 
2.47.3

