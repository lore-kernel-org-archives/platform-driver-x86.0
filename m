Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637520;
	b=Oef3E3c+9ogRqHPrcgJoNyO7JpYn/10IFQza3ewkntGxZOuD5JfRKl5i8rZP0ELo1Vyu
	 q00DL6ELxNU8HvacRTn9MDJuuo1q8+7LH67qy5r5yDt73f04J6X2Tzb5dWkG6PB3X6irQ
	 jPG2cxdMr+OjXetqPvKzYbMzIEm6hbfDTx5dAqJZi9H01Mu0+LuZsZRTWDKYJG/oKC+Ma
	 9yVo/cxQ2nReFbwSXdr1hM/vlEsSthBR57vw8j2fznE7z/4euPWvwmKedY+Ts0Jof2UXv
	 aA/cN+5rhyLMhatuQCJnk3/GHRqSJrjtXVit+5qD4+kkKXaoUIPOFrf/6w4U7yljMPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637520;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=2WGPteuHnSLOwvDm9/vsDbf5wTWrBYNeJGx6JscmGUc=;
	b=2jxAW3GOouj+V9ZX4OZSd9QGnxLNLOralOzFtgzT3bBk+rEHPVBKZk2ELOi1V+YvuGsr
	 NCPT8035+VzLFGflpoZNC+0OCvEpUeb8L5dQL8gvz3i70pR/jjVgxLeYcg2/W2GTbW3cz
	 3UWyIFrobuFYML2/sfXObBhlIticO+YQYiL4UVSfEumRlXF+jwQoqk33hHTRYX7h+h/zc
	 UeEya/34QNslKjznQ1bvZEpRuEIVCyjfZPu9ezmqetiTUXSFdKTCRMto3dIE6uU9wZsMA
	 JdieDo/8QmvzdjMehutkmNSrPHdzaGt8F+Dp655RC1mCKXIHBN8hlG2FDCxNG2iDqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDM81Zhr;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF8A606A327
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FF8A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MDM81Zhr
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e96502e447so22256425ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637520; x=1795242320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WGPteuHnSLOwvDm9/vsDbf5wTWrBYNeJGx6JscmGUc=;
        b=MDM81ZhrXVtkf7RBmuhEtOO6fdtBonUzvMEZu8Cudg59MPVHYbjGXSirI2b8DKFfZT
         /T2rnZR5HX00xbkEKz5oMYtbU1Cg3N5UeUBOMA64UVFbjXChBD6b6PuRBclwIELluCcT
         3yuRxwiAvPquyZKw/bI29op5T3D3ewRn594D5v5JaF+mRlA8R2p36CZok5OTQeSItACQ
         Ic0opiVzD6W+zfi+ZXxwkZG7QaXDP36+Yu/WbFMIl/hW9pgS6dDydQGqTLs7wudiHXMR
         G2lpzXb5s1YLGceRGAWFwY85EYJIZvP1e641m8AN9sE69mcztpvdDFt8AQUi9z24ZlQP
         vKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637520; x=1795242320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WGPteuHnSLOwvDm9/vsDbf5wTWrBYNeJGx6JscmGUc=;
        b=hC7GVRuEhJ1Nr6w4WAlRH4x3ewAgmn4TIY8K7Sx3+Qd98+YRQuVxd0/SipTICVvjxk
         AbONyyAGLp9omBligzu8u8nFADMaNXeG13k0bM2u0yEgcPpwLdU02GbiPALf5LrYqXiE
         LXz9k2nneWlKcHnNo11Iv9rcZku3GvW7b9WdlUHBBMkRSVi0P/qozNd8pVp14SYfec8+
         yX1Qz23K4optVD4JeaOi4yHE/RQ+nQ0C+GiXlGFziw0HlyRGayI88zXvXLNXhfADSr+Q
         Ji55I/sW9ljWpbJLNeo/t0DeeuFPuUwTUAaYsU3nAT/Bxii4LsWYVNRH2QuQiG87u6SO
         /55w==
X-Gm-Message-State: APuU4Z+lDBSjLr4odv0THcV1LrB9Todz5rwVB5zM7zp3c24oT9l4rnRK
	WkGj7A7a1vMrPEN0FwuoK+VSRuJzAoDWQxNqCvWiW2N1GfT1/2qKLOGU
X-Gm-Gg: AYBFou2P1ewLek5SVhn9x9CiIEvLIVyHajH7qvR8SDHicPLvGZxedS9RZ2Qqjm4gjCy
	ZNNGdoJGV9hMk8nHNTr298rg6J1JHPDFMC+PrZa8nWC2DCNOilod84hCMn5uemCxyLTPZbS/tuh
	nCsZpMn/3qjyPVE5jTBqReGdrrlONIyTZZRw+t0m9041eTWHgy63vMJo2HRlEuSFL5Ge/I9cBCr
	kcxTuRwV6rQWjXXGLzOeo1tD+kog4awymtDoy/ZT7SaZPK67nrMa2cbsvsq6rs09zHPPqdCc2rQ
	vWSH80bs0PtU/4L9GJTBCa5M9C2fHQyLEU26WiqzpJXRDnXK9NFQ3JfeJcVJ17GEWlXdm9QPZ9K
	VgvSPsdd4HpuVt/sGnUS64L+6aOKOshP3IjoHSn2GkQPimhZZwON/Yp/AFeBQ7Gyef4hw/wQSXb
	62Bv3L0Cyr8UGHklr3fopYiGZF+nKF/Vp5aI3/ncikD9z6MItUudebMg64WQvs7XzZVAJPLKePI
	RtEcxB8IXXPUHYIyP6moUFfDFQhcYtroL9+5K48lCBG1ziGjd1/FRit+GAlO5mw+mk0/p37kA09
	K4S2kTLnRxvITq7MPKP7ImZ93DdOzySBCivLFQoKmk5kYTb/lLWBkeW9ZXRX5SoY1zo+XMWAN2w
	5Mr4AgUoZgmZLYm5hzJsglXp8qPw3eOjIba4fqquQTEnSZwIAdo9cJQdL+0eb6R2ezD8Sg0bAJv
	g8yQ==
X-Received: by 2002:a17:902:cf06:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ee0dada474mr41995045ad.27.1794637519659;
        Fri, 13 Nov 2026 22:25:19 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75b467sm18593085ad.20.2026.11.13.22.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:25:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Darren Hart <dvhart@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: dell-rbtn: Serialize access to the rfkill device
Date: Fri, 13 Nov 2026 22:25:13 -0800
Message-ID: <bcae17e45257dc32f4b9af20e1760dd3f7fff46f.1794633181.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

For slider type devices, the rfkill device is created and destroyed
from rbtn_switch_dev() whenever the first notifier is registered or
the last one is unregistered, i.e. when dell-laptop is loaded or
unloaded. rbtn_notify() runs from the ACPI notify workqueue at the
same time and does

	if (rbtn_data->rfkill)
		rbtn_rfkill_query(rbtn_data->rfkill, ...);

with no locking. If the slider is toggled while dell-laptop is being
loaded, rbtn_rfkill_exit() can unregister and free the rfkill device
between the check and its use.

Add a per-device mutex around creating, destroying and querying the
rfkill device. All three run in process context. The rfkill core only
calls back into .query and .set_block, which do not take the new lock.

Fixes: b05ffc95f9ed ("dell-rbtn: Export notifier for other kernel modules")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
Developed with the help of an AI coding assistant (Claude Opus 5.5),
which found the issue and drafted the fix; I reviewed it and am
responsible for it. Builds cleanly with W=1.
Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules: the dell-wifi and dell-bluetooth rfkill devices are
registered and unload/reload with dell-laptop is clean. The race
itself was not reproduced.

 drivers/platform/x86/dell/dell-rbtn.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-rbtn.c b/drivers/platform/x86/dell/dell-rbtn.c
index c0b3877bb27d..a38bd84bac5a 100644
--- a/drivers/platform/x86/dell/dell-rbtn.c
+++ b/drivers/platform/x86/dell/dell-rbtn.c
@@ -5,10 +5,12 @@
 
 */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/acpi.h>
 #include <linux/rfkill.h>
 #include <linux/input.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 
 #include "dell-rbtn.h"
@@ -21,6 +23,7 @@ enum rbtn_type {
 
 struct rbtn_data {
 	enum rbtn_type type;
+	struct mutex rfkill_lock; /* protects rfkill */
 	struct rfkill *rfkill;
 	struct input_dev *input_dev;
 	bool suspended;
@@ -115,6 +118,8 @@ static int rbtn_rfkill_init(struct device *dev)
 	struct rbtn_data *rbtn_data = dev_get_drvdata(dev);
 	int ret;
 
+	guard(mutex)(&rbtn_data->rfkill_lock);
+
 	if (rbtn_data->rfkill)
 		return 0;
 
@@ -142,6 +147,8 @@ static void rbtn_rfkill_exit(struct device *dev)
 {
 	struct rbtn_data *rbtn_data = dev_get_drvdata(dev);
 
+	guard(mutex)(&rbtn_data->rfkill_lock);
+
 	if (!rbtn_data->rfkill)
 		return;
 
@@ -154,6 +161,8 @@ static void rbtn_rfkill_event(struct device *dev)
 {
 	struct rbtn_data *rbtn_data = dev_get_drvdata(dev);
 
+	guard(mutex)(&rbtn_data->rfkill_lock);
+
 	if (rbtn_data->rfkill)
 		rbtn_rfkill_query(rbtn_data->rfkill, ACPI_COMPANION(dev));
 }
@@ -415,6 +424,10 @@ static int rbtn_probe(struct platform_device *pdev)
 	if (!rbtn_data)
 		return -ENOMEM;
 
+	ret = devm_mutex_init(&pdev->dev, &rbtn_data->rfkill_lock);
+	if (ret)
+		return ret;
+
 	ret = rbtn_acquire(device, true);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Cannot enable device\n");

base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.0

