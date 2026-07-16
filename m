Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7321D382361
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205137; cv=none; b=c0uzgtNMTMI+juq2aHI26fgHl2PRcRuxZ1TI8iDBji0mAUKlWP2DPPBXLXQ4rpztFSzrVVf8uFlG94m0mgcgKfbSg57F1qOcwS6aV4LUGz8JEiIqKnNcwFsAQOSl01p5VGqC/D4esiKf2DIekiirkXfDyEcWDEWENSvKTnA+iXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205137; c=relaxed/simple;
	bh=oLwa7pZUr6doS0kE5wIzyXtRk9PkNeS7cvA7R3LQYdg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TVXUzdeYwKLgchrB7zV5VhtNPjwCQFH2xZhGhWtr5m4i0nJ/yD61BTqCkUcrbS0NPo0QXbi2NC4Hoc2onsW4D3wkdwe2PdfsZejeRAMDKDHGy8aAeprVbWnEkX/8cUjjUxII90Uravz8xIiccKG38G0aP++n4+p5V8+6WhpKhmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TNdTbLyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd0mz4TH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TNdTbLyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd0mz4TH"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBiOGF2518316
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAzeN59J0azB7+VxlBwnfSfYuZUkQq63rtSgGfRJFeY=; b=TNdTbLyIq3C8GHoH
	CMM24CYvyIJ0onFcZGEHOXDBs86sHKm9oQp6ToM+qOwxNYpR8sa2LidfgHfEGNUX
	79c2zsCtt8YmREygJCHEQ+wqFoQe0SzBZQS0t+uUqVRqWj7aT+nsFAzxVo0GXDt+
	aZiBzXhI1/E+0Cptt0hWRdwDDU0qMZ9owG2Q2mPbhjQdo+J+R6EpXN7jv/Op9lv9
	bZpeAmLkdst/CPN9aGkm7GzdrmVMCDHKmdB+gLeh4ELFhCt8tzfL+YtdRGDHl5xZ
	8bUWeZQfBCdToOmZiD9KfJMH/sS1KvHOdr4EO6DIVi8+C6+j5X/NPhqDcUiAHFEa
	WilE1Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv0sbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8f18c4d1f82so132765946d6.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 05:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205128; x=1784809928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nAzeN59J0azB7+VxlBwnfSfYuZUkQq63rtSgGfRJFeY=;
        b=Jd0mz4THaG/Sxoq6yVebFP1Yz8YVsQzZI16OJJOVi+5LWxElmOzgoet+9dEPBtqBte
         r7bHvmA6GyCoTQtISZCtz0KhNDOYyAN5gkhvSxlJOUds50mpOOfiZhYr9kunj14hCtyB
         /CcgABxPU7Z87LkPGrN6tf+iB8g8qZZJn/gY18mMJFPc3JV5i919IjzuhZLxb+rwNrlZ
         TdLfoFBGXd5ejJ/RCqac2DPDTkRP4rnj+W8jRWvg1oWcOI1PZ6xGXau4s2Bg20cLsCK1
         x1155NgdQXiwNOCukRkexRlGkhO1Jr9J8oJjK/AehYq9gu9moFArRXiRrMftklKmFakd
         p4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205128; x=1784809928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAzeN59J0azB7+VxlBwnfSfYuZUkQq63rtSgGfRJFeY=;
        b=TrdPS+tEiea4038qRky/V/Bre/h0xNgys4D1x8vCSl+4xT6srCxDusbempr2LFHgHa
         bQ4CIvBjKhvydmDNda5HhNLWo500XhoXIHjz2t9k+1xAhHvi9YGe36o63Ld7m0207TBg
         xuklIMiTTgEJD2XfzsMY1NyX2CjeeZH9Bk1pj4AEKzrUgdWCTLuZ8YpVotdLVbR5GIFu
         uZndK7fXwlDmTCHh0ghQfEY6cOJTQH0LeXormtCQPFZRnKZq4va0l24p7lIkdm4cKy7c
         wli0YJ9CFKA48/J1bkEDbyHp4Jxh7ErW29oU2V8T3AIi5czVEIpQRvsbZOCBFrfOCA4K
         SvfA==
X-Forwarded-Encrypted: i=1; AHgh+RoOPiN+SuwI6b+DeR84qG8/3eW7+GtQH9gLz7QcWt4gt/ZKRYnwXHJ+kU5K2cCcsCPvipCUKpQq3dJ5XCmu5dFjfrvi@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyhb1nP7vziwOtyMrTckz71WHNyBcHVJLIxci8y/WYQH8JwjrO
	M0H0JyNmTptOS6ajY/h4oF8ynSkrFqI9xLjQ2YYUbiHLpCDmACGM/5Rpu0Z8aabitejBhGra+2t
	niSlemUCA5dskLo0xVQeiSCw3PjAGG9jCJe87tzCk50ENo22i7QEuBgI9JYsr9wvDcWARG+14Pc
	1q
X-Gm-Gg: AfdE7cnEGBxYIJH/2t1uUl22yQAw0N3wewLjEavCgz8KcVdwQo0ruxNapJeX6ByPODs
	EhrruVzLfw88Ge1Rvt/ahbdXriL3fYwvRUtVN+CtAjVNFrT2Y0ogMmcIgwaW9TDtUFt9b0vj1Wd
	Tr8iC0vAj6jpiwqK184lhyHD9nr51YtXkJvikltAeZwYUillo6uNE4a9YvP4Ce+LL4op167FoBw
	FfJANERnyNxg4STosTh9XcjFTpcvlYHC0n+dO62FPcv+3LI3QVRGd60+0K5sxCmjCC0P9IfDgzH
	VxeNcJcuGRLGSir5cJjAtXLzHL9lUh3LE/zruHAwExZQor9NsEdLx3xjFyutxIuYgUlt0h9UAEg
	4pZeCHyAOISsPFHHQ8qrP+O4upJ8=
X-Received: by 2002:a05:622a:a15:b0:51c:7b11:419d with SMTP id d75a77b69052e-51e4f12d97cmr73023191cf.74.1784205128391;
        Thu, 16 Jul 2026 05:32:08 -0700 (PDT)
X-Received: by 2002:a05:622a:a15:b0:51c:7b11:419d with SMTP id d75a77b69052e-51e4f12d97cmr73022841cf.74.1784205127901;
        Thu, 16 Jul 2026 05:32:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:40 +0200
Subject: [PATCH v8 5/5] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-5-5c2b8cc38c28@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6684;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oLwa7pZUr6doS0kE5wIzyXtRk9PkNeS7cvA7R3LQYdg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM86rjx7q8yriQSpjvNMvC+uK23KVDXnrN70X
 cPCoyYSQM6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPOgAKCRAFnS7L/zaE
 w+FlD/oCqR5yg8/HruSl6XV9Qef9k8PuUl3pCHhLlXI07rbwdFQ4r4DuXSoLJD9zG7k3+gK6fXH
 I5bgglPrpf0qPsrPVAB66suKg1ixVCgnIY/eXMCDP7sLqbgYmwHfg6ODp0mSvq63BKb0LllZmUD
 tVflkqY1g6iE4zfyeGRmDgxVlzR2q700GyVziNMgQ77nbpdOfhLxzBEsK2SBEUgavZKW4WWMK1z
 nXUODe7S2WhvCsBOXoPPAsMQ5665zHGAlR5Cdu7OMNh4Jv/tEbxzXbXtK5JCDdeFA6F3SF8zL8c
 I0IFzaNs0Pr9yGiFr5y1cWsWUdskLIYbxBVYeWifMFmIQIBBmQSMiHurxjJbbY5l3uk1HYqrk8n
 XVr05SZI/QAwwRBN/SUKKDyD5Px0ZE2py4Qjwpg6u5zKCyRw31a9diFe02yNqfxz8TpCjTtYEQN
 HHAcSA1uN2exfHsAD1lRh3/o5LBOgKVfKLkjM/A9CPkLY9KbhF9C7pXip/0Y0OwDhiDvTo9C0qe
 4hzinbfM8/xAuJCzv6yBN9rAYDzpa+a4IbPtSpu8w/dlmHpmf4GSVJNox5uWrvx6yLbITA7JGJU
 +or7SktwGZcaBXv3oMa/Soao8cZ0SRM0Ha589ZYyHXqqn+Vpb5ngifohdPZFxu4iXmSYwBOXrY0
 yBTebxLn8QuNCyg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX9wlEuwo/noUu
 TSgowkICOH9fy927F22wPjVwgJJE846Plo8fDX/hOFylkBgTj71vA/g+0lAIWg85pcTRXwG0crG
 NOJVH4mI8i956FyGkOddYA13yyi55IkgVXhUqzjA87PEj+V23tyvPUm7LmDsGWtU182rnyco0tO
 h1k/YsPbuIHmUaOnBC8DYX3nIFNR1lmC/t1YlNqKNiqQcXv3o2hI2JFKNZYhpxCxTVKrPn0FQE+
 3vzEKZ6M5tyGKhKmPsE2scSmb3FHzvaM8lVdayKNSllLb5NHwRPas94QF1PA12iQAUhtT0epeOD
 2DZHuvmhEGG+tBo1XfWbI+n0IJxouVHPjFp/dwtFJAl7sb9Umhv56mg2soOb8t4Z+ZAOkdQ6MPY
 49otBMUHZyFd2vjkE6K1takOvdDcuWezBogVjsmiPJZZhudYM6/w913KRLkngV9iD7ZRpGoG34n
 i96kYIS2JE9lGF1Szzw==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a58cf49 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=zydxXWD-JFuk5BhJ14wA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: vEywQ-Baoahjh7czyfup7enKgiNDsybq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6eq4OO4YAYkP
 257Ey6ZLC91meQaF9swJDU/I4IKd8v+bH3pBj4USHpk5s3e8C2mqIgN7HEqPBp+Wq4Es0fb5R8+
 hNt8KLcqFchPhGt4hdwzZ0gMr6iHkWw=
X-Proofpoint-ORIG-GUID: vEywQ-Baoahjh7czyfup7enKgiNDsybq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

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

