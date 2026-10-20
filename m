Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507547;
	b=co9tlkbJqkX/3m9/ZLSz0T/cUoBJhwz6vRGMvZRxF/RtbkTSToWWvCy8+k6USLW5O9Tq
	 Y1tsqPw8EDDRGvdqxbGtm9QfUTpHgJ6wt4/hh4mYyyEzZfbrVICSMvnocLcqtVy+E+LyU
	 2IFjvMYgZ5qJhrlPmt3K/KAFUPCXdK+kTbTB921GxVhFwIC0UMgkTyMYzeHPD+dHz5XYg
	 y6OewvRbO15WOa5p4wvF5CBd56AYiQkQYiVZyfUQKTOBKnAPVBUa4V3E3hyXYXKyakBhP
	 iM7fAr/7KVHnO9VZva0qbNubmSanQtP/CmwW/LuV0SshFHfARDT6NXcFIl9uTeym56w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQJux036u0=;
	b=WqborG5NvjJVjr+OIH3WSx2x/OaLfWo2QUwfWv05ifJ8XxIxXyHRAN4klFmVoF/kmAgE
	 ezGwWFetABG7RckPRkurJZOY3SPft+jpxOZuMXu3A9BGE4pJ5b18oQEbmwJRG6lZuzcXh
	 yu9CeUmg9Wy0CbE28yxq2CUu9Ewj9tRMwp4kmP7qGkPfHHVocpUZVYUD28eom9rCQmh80
	 4IQ0ucQls7xZAwvQmbb+1BZbJ4j1H+zfkjcmzMcmnQ98O/GM7UeKfQAlwhyy6geZi5Hp5
	 E/bv5O6w91eAlEf6T250zTp6jw9l/9K5383CkfE5iKxVAZ7utdvInpptDNixBf5c8BA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hLMMg0QP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ids73i61;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD0D606A31D
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD0D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hLMMg0QP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ids73i61
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KEIfq72448598
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:45:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQ
	Jux036u0=; b=hLMMg0QPCCSRW1jxQN0pwOX162ofZo2sdj7Uph673jP7aGe2K7a
	/+rirvtt/Grar/hgd667SoVlXSplzEGDDDZ2NfWUXoDCmVN5b4qUntDRnmbmPLZW
	TgfzPoiQyXQCf1RoWSLOXotJ0wH6C0ONGfHtpf68OfTxQ9XpSXEmemUvvSEcUhfK
	xtCT8PjJSns+Z0jTYP0aRN2P5+wRFQUunr59qVRYQeM5LCKy2dIRZR2ECaXM3M7F
	b5227oqMXtn7yoi7dcJdPnsYWxi+5W/PlyDAdAb7PqjJvuopDwM6yUDomyci9D0t
	X3Yb9E/vByA3podX9AoPFZUamMaceyvF+2w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pjykg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 14:45:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f20addba1so608619485a.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Oct 2026 07:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792507545; x=1793112345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQJux036u0=;
        b=ids73i61zfzfbT1OHvtyC7WeOE/60r6cZf7JJIVDtlAtKZ5+AY6WZwbDW760OnXyuf
         q3aZWYPuGCy7tZ/OH1hc3xvmHm58JbSYUGEmtCj1qS85+AosBMLGZkfC0h8+KZjVg4w4
         QzOS9YhgdcoMyd7r7ruvag/YNyKe2AtQ4spbwbX+0q1vdRnWE/C80c8pT8apvc15Ceg9
         9f9ecnUe1O+x2m1Po25QYYmqsI41I2sa42eJNIXmdDo1p8gjk9zXw/l/RQLbPEMERryL
         nuRPixgbYmVSEd86kbc8vFoJ+DhS25gSERjdbBcCq3/hM33mRz0MMuE7ILvSl6WTLsSV
         9NJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507545; x=1793112345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dbti84VQZnRoyeZV4350aERHO6muqhqQOQJux036u0=;
        b=hRv/lV9X1wh798oF/uqrCeXHdA/jfyOfR3AQcNWPSQQ3TDlctBUy3dis5qHRK96l4n
         wlt+nslS3VT1xLw6hK1Z1Ev8D4OAsfCH2Az9UFj2+HBTbidFQ1Glpjv+KQVsCeHO4+BD
         u0Qzp449Qda1UZQUxSxeMjAU77OW+rt2WgjSFBs9t5drMPaTLZJkOEwH5uupDs3d7RjW
         blLQ+Dr5zzR1ynAn683xhJIhgpgh8kGR7vhyoT56EyRXzwAFKhhGXSwd909E29wm6z6e
         DOAAG3+hDlawJkbFeVJiuDcvCUST2Fb1RCD9GzdbnzYq3aEae8zO5Alr4dfUQC9cmSGt
         9ddg==
X-Forwarded-Encrypted: i=1; AKwUvBwVzz40MxirdNUU2Be6bO0cB/AOOOZVmvEjuZ1BYa7VBBmcX59ETbxPnf8OOmpBuJa1fJJGioeeqP+CTNyWgnBQBayV@vger.kernel.org
X-Gm-Message-State: AFq9FYIrVsSUowesVaUTZzoCZgGVZw4pdiVMbpx5Wg0Y8f6qH5/TYCfe
	WFP5djNHTMY8EjGA2kPDF0QL6ynhDKypoSGXoT5Zu5+YQjcHd+5W1WPyO6EsvyZO4bq9cMFV78z
	NUpBBGIJWxQl7rvDgt7UON3P8wRJOl7nqh2S/O4Cn/8183mjlnq28dZWrvPhhqZNwjpxyJMR8kl
	+D
X-Gm-Gg: AYBFou05mhU23GDjksahxfdLZ7bjZlRcOkMYmQjLPHGQg4KAeEqu4X0NOkV4BRfS2VZ
	jNssr3JmkjXtKW1BGX2fvmAjNN+0/SETOcIQW6AlnoWsmWhOpE0zBbP4KxJhfwEO2tYKbs9Flhs
	XppdF9l68meutAX1nFrEEBATSFnuLMrQDpVrCgr3TK2ImRqdcMzpygZHUx+YCzO+LMvWYob+519
	P5din5qTWUqmNX9U1fFkv2mGVda33yB2KaHIdBLN9aWIXl/K96jBgWGgCKos4800yRfhFWIOW+C
	vLGKr9Z2LsLCOcQm3+zY6a3D4ug+76IA9cEClWrviP9+njRe2Sj5gqe0yO8G/KZ6GZRs4Jx0Gs4
	KlsY56yvXEKrkn408BXj0xNyNs6o=
X-Received: by 2002:a05:620a:7014:b0:912:1206:ddd1 with SMTP id af79cd13be357-93f29b46ad7mr1631405385a.1.1792507543007;
        Tue, 20 Oct 2026 07:45:43 -0700 (PDT)
X-Received: by 2002:a05:620a:7014:b0:912:1206:ddd1 with SMTP id af79cd13be357-93f29b46ad7mr1631380385a.1.1792507540863;
        Tue, 20 Oct 2026 07:45:40 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:4884:6e9a:d9ff:9fa6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1df370381sm179377585e9.1.2026.10.20.07.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:45:40 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Len Brown <lenb@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Derek J. Clark" <derekjohn.clark@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Armin Wolf <W_Armin@gmx.de>, Jai Luthra <jai.luthra@ideasonboard.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        Jack Wu <jackbb_wu@compal.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Zhang DM <jixianqiang1540@gmail.com>, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v3] platform profile: Separate handler locking from sysfs lifetime
Date: Tue, 20 Oct 2026 16:45:25 +0200
Message-ID: <20261020144525.3265851-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Authority-Analysis: v=2.4 cv=a7WlZkSF c=1 sm=1 tr=0 ts=6ad77e99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=4c0kPULnjDDMktAHOzUA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: B8QfuPH1moi3wBWb45jdfR6E9QC4jDxt
X-Proofpoint-GUID: B8QfuPH1moi3wBWb45jdfR6E9QC4jDxt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX7b9AuHHQgrKa
 08UctCqwJToUBGKItxuTnnKgN5oMBhcTbl7F8JMHuRNZyjdcTp9jorzzL3MhzDPLy9nk7xzmeUk
 jFLkgboV//5/8YkdmM0g5Vrglitv2fo44gavsjh1EPqsRWepN9BSVV71WW/7EZfHv90Y3yhzduj
 yETShI1HZQaXncx07l96p4FBoDsdb3RtN5WvyXDBXOGWat2Fc0V2/gLut3Fe1L5qN0vkEwsrSMD
 l8Ut80/4K8/sJZ2E9lb098GkKTeEwAxcVlr2rnGR1x8ByXumDX2PV4n0zFsbxHQZ4iGeKuJ9O6S
 nlyh3rbKHb5ki10fLjcO82CJqghYAc125UJAqIE6fIAc2ZHqwmdbvFa87DVDye5Nylx++m576jg
 CakbHPAOfmCd5tO4XzMwk6outhImZ/bUo+oK5CnFyTgoLPr78G2U6sWfExNEUDuVLL6njAxi7zY
 3RtJxpkG4Ugb/KvCNSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1OCBTYWx0ZWRfX9w0MH1YVoiGZ
 rHSnOKncoN84xUvY+kHZKhOWNrd5ciWDBBUNXw2eKJlq5wiqKobmYP0eRxynbVYY8e4F1HtZAq7
 Ictfxa1elj/YgqpgwYDWhIlo2gGmjy0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200058

Registration and removal currently hold profile_lock across
device_unregister() and sysfs_update_group(). These operations can remove
sysfs attributes and wait for their active callbacks to finish. The
profile read and write callbacks acquire profile_lock themselves, so a
concurrent access can deadlock:

  Removal/update path             Active sysfs callback
  -------------------             ---------------------
  acquire profile_lock            hold kernfs active reference
  remove a sysfs attribute         wait for profile_lock
  wait for its active references

The removal path cannot finish until the callback returns, and the
callback cannot return until the removal path releases profile_lock.
This applies both to per-provider device teardown and to updates of the
legacy aggregate attribute group.

Commit 041142d7d252 ("ACPI: platform-profile: Fix possible deadlock in
platform_profile_remove()") previously fixed this lock ordering by moving
sysfs_remove_group() outside profile_lock. Commit 55b1e68134bf ("ACPI:
platform_profile: Use guard(mutex) for register/unregister") reintroduced
the issue by extending the mutex guard over sysfs_remove_group(). Later,
commit 77be5cacb2c2 ("ACPI: platform_profile: Create class for ACPI
platform profile") replaced that teardown with device_unregister() and
sysfs_update_group(), still under the same mutex, extending the problem
to class-device teardown and aggregate attribute updates.

Simply dropping profile_lock around these operations is insufficient.
Aggregate operations currently discover providers through the class
device list. A provider being unregistered could therefore still be
selected for an aggregate read, write or cycle while its sysfs files are
being torn down. Concurrent registrations and removals would also race
when updating aggregate attribute visibility.

Introduce profile_registration_lock to serialize registration, removal
and aggregate sysfs updates. Sysfs callbacks never acquire this mutex.
Retain profile_lock for profile operations and use it to protect an
explicit list of handlers participating in the aggregate interface.

Add a handler to that list only after device_register() succeeds. On
removal, unlink it under profile_lock before calling device_unregister().
Acquiring profile_lock first waits for any aggregate operation already
using the handler to complete; unlinking prevents later aggregate
operations from finding it. Release profile_lock before draining sysfs
callbacks, allowing active per-provider callbacks to complete before the
device is released. Apply the same unlink-before-unregister ordering to
registration error cleanup.

Walk this list for aggregate reads, writes and profile cycling, and use
its emptiness to determine aggregate attribute visibility. The class
devices remain the per-provider userspace interface.

There can now be an interval between removing the last handler from the
list and removing the aggregate attributes. Explicitly reject choices
reads and writes during that interval: the intersection bitmap starts
with every bit set, so an empty traversal must not advertise all profiles
or report a successful write without updating a provider.

This separates aggregate membership from class device teardown while
preserving the existing class and ACPI sysfs interfaces.

Fixes: 55b1e68134bf ("ACPI: platform_profile: Use guard(mutex) for register/unregister")
Assisted-by: OpenCode:gpt-6.1-sol
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
Changes in v3:
  - Send the locking fix as a standalone patch, independently of the
    firmware-agnostic extraction and legacy-interface deprecation series.
  - Document that profile_lock protects handler-list membership and
    serializes profile operations against each other and handler removal.
    Explain why it must not be held across sysfs teardown.

Changes in v2:
  - Expand the deadlock and handler-lifetime explanation.
  - Add the Fixes tag and describe the earlier fix, regression and later
    extension to class-device teardown and sysfs group updates.

 drivers/acpi/platform_profile.c | 80 ++++++++++++++++++++++++-----------------
 1 file changed, 47 insertions(+), 33 deletions(-)

diff --git a/drivers/acpi/platform_profile.c b/drivers/acpi/platform_profile.c
index 79d2e92e5c28..d79080a20e21 100644
--- a/drivers/acpi/platform_profile.c
+++ b/drivers/acpi/platform_profile.c
@@ -8,15 +8,25 @@
 #include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/init.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/platform_profile.h>
 #include <linux/sysfs.h>
 
 #define to_pprof_handler(d)	(container_of(d, struct platform_profile_handler, dev))
 
+/*
+ * Protects profile_handlers membership and serializes profile operations
+ * against each other and handler removal. Never held across sysfs teardown,
+ * which can wait for callbacks that acquire this lock.
+ */
 static DEFINE_MUTEX(profile_lock);
+/* Serialize registration and sysfs updates without blocking sysfs callbacks. */
+static DEFINE_MUTEX(profile_registration_lock);
+static LIST_HEAD(profile_handlers);
 
 struct platform_profile_handler {
+	struct list_head node;
 	const char *name;
 	struct device dev;
 	int minor;
@@ -44,6 +54,22 @@ static_assert(ARRAY_SIZE(profile_names) == PLATFORM_PROFILE_LAST);
 
 static DEFINE_IDA(platform_profile_ida);
 
+static int profile_walk_handlers(void *data,
+				 int (*fn)(struct device *dev, void *data))
+{
+	struct platform_profile_handler *handler;
+	int ret;
+
+	lockdep_assert_held(&profile_lock);
+	list_for_each_entry(handler, &profile_handlers, node) {
+		ret = fn(&handler->dev, data);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * _commmon_choices_show - Show the available profile choices
  * @choices: The available profile choices
@@ -306,20 +332,18 @@ static ssize_t platform_profile_choices_show(struct kobject *kobj,
 	int err;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &data, _aggregate_choices);
+		err = profile_walk_handlers(&data, _aggregate_choices);
 		if (err)
 			return err;
 		if (data.count == 1) {
-			err = class_for_each_device(&platform_profile_class, NULL,
-						    &data, _remove_hidden_choices);
+			err = profile_walk_handlers(&data, _remove_hidden_choices);
 			if (err)
 				return err;
 		}
 	}
 
 	/* no profile handler registered any more */
-	if (bitmap_empty(data.aggregate, PLATFORM_PROFILE_LAST))
+	if (!data.count || bitmap_empty(data.aggregate, PLATFORM_PROFILE_LAST))
 		return -EINVAL;
 
 	return _commmon_choices_show(data.aggregate, buf);
@@ -384,8 +408,7 @@ static ssize_t platform_profile_show(struct kobject *kobj,
 	int err;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &profile, _aggregate_profiles);
+		err = profile_walk_handlers(&profile, _aggregate_profiles);
 		if (err)
 			return err;
 	}
@@ -423,15 +446,13 @@ static ssize_t platform_profile_store(struct kobject *kobj,
 		return -EINVAL;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		ret = class_for_each_device(&platform_profile_class, NULL,
-					    &data, _aggregate_choices);
+		ret = profile_walk_handlers(&data, _aggregate_choices);
 		if (ret)
 			return ret;
-		if (!test_bit(i, data.aggregate))
+		if (!data.count || !test_bit(i, data.aggregate))
 			return -EOPNOTSUPP;
 
-		ret = class_for_each_device(&platform_profile_class, NULL, &i,
-					    _store_and_notify);
+		ret = profile_walk_handlers(&i, _store_and_notify);
 		if (ret)
 			return ret;
 	}
@@ -450,22 +471,11 @@ static struct attribute *platform_profile_attrs[] = {
 	NULL
 };
 
-static int profile_class_registered(struct device *dev, const void *data)
-{
-	return 1;
-}
-
 static umode_t profile_class_is_visible(struct kobject *kobj, struct attribute *attr, int idx)
 {
-	struct device *dev;
-
-	dev = class_find_device(&platform_profile_class, NULL, NULL, profile_class_registered);
-	if (!dev)
-		return 0;
-
-	put_device(dev);
+	guard(mutex)(&profile_lock);
 
-	return attr->mode;
+	return list_empty(&profile_handlers) ? 0 : attr->mode;
 }
 
 static const struct attribute_group platform_profile_group = {
@@ -502,8 +512,7 @@ int platform_profile_cycle(void)
 	int err;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &profile_lock) {
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &profile, _aggregate_profiles);
+		err = profile_walk_handlers(&profile, _aggregate_profiles);
 		if (err)
 			return err;
 
@@ -512,8 +521,7 @@ int platform_profile_cycle(void)
 		    profile == PLATFORM_PROFILE_LAST)
 			return -EINVAL;
 
-		err = class_for_each_device(&platform_profile_class, NULL,
-					    &data, _aggregate_choices);
+		err = profile_walk_handlers(&data, _aggregate_choices);
 		if (err)
 			return err;
 
@@ -525,8 +533,7 @@ int platform_profile_cycle(void)
 					  PLATFORM_PROFILE_LAST,
 					  profile + 1);
 
-		err = class_for_each_device(&platform_profile_class, NULL, &next,
-					    _store_and_notify);
+		err = profile_walk_handlers(&next, _store_and_notify);
 
 		if (err)
 			return err;
@@ -583,7 +590,7 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 		}
 	}
 
-	guard(mutex)(&profile_lock);
+	guard(mutex)(&profile_registration_lock);
 
 	/* create class interface for individual handler */
 	minor = ida_alloc(&platform_profile_ida, GFP_KERNEL);
@@ -604,6 +611,8 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 		put_device(ppdev);
 		goto cleanup_ida;
 	}
+	scoped_guard(mutex, &profile_lock)
+		list_add_tail(&to_pprof_handler(ppdev)->node, &profile_handlers);
 
 	sysfs_notify(acpi_kobj, NULL, "platform_profile");
 
@@ -614,6 +623,8 @@ struct device *platform_profile_register(struct device *dev, const char *name,
 	return ppdev;
 
 cleanup_cur:
+	scoped_guard(mutex, &profile_lock)
+		list_del(&to_pprof_handler(ppdev)->node);
 	device_unregister(ppdev);
 
 cleanup_ida:
@@ -636,7 +647,10 @@ void platform_profile_remove(struct device *dev)
 
 	pprof = to_pprof_handler(dev);
 
-	guard(mutex)(&profile_lock);
+	guard(mutex)(&profile_registration_lock);
+
+	scoped_guard(mutex, &profile_lock)
+		list_del(&pprof->node);
 
 	ida_free(&platform_profile_ida, pprof->minor);
 	device_unregister(&pprof->dev);

base-commit: d0cd1e850e1602729dd60dc3c5fd96f80e0cdc5d
