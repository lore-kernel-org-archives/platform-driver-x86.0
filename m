Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354588;
	b=Ma49FITBxivp7VvXJS1fdG5Q3IBIiQYXBM+8SeO2GUew7qCSIqc9jZvTZhJIfvMRw//b
	 18YA4ufOATbDWOwLtcVCcU2w+lYSIR3kycxAe0fW6KBoZi5Ej7FCbfjBvmwUrsXxAH45S
	 AmLtzJtnW4dcbLXdOK3uPg4qSct9lvCcW+FDJZGhFHsrfRkow2fFlSsQsk7IUjsr7FXic
	 W8riiEHicpmZrXznQirOz0FWN3L6Lc9fV+/ODDXKLgPY9oBtuMWEKaLOTEj65WUzRHRM0
	 Gu1/ocqNzY43102uzRylYbXVUHX0ieQnf7tHpSHFQmXt+XOCKdlRRH/kB0YvemAv+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354588;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=LmzQeRVHFZtkk8sx/quOhspeUT9cke7sPq4pS0wyTsE=;
	b=f/5O/8wZHaByhXpr/1wk0Ty1okuO48FLHemzK0CLz5zGeImDmJKRcIx5xVkPTMtufyZQ
	 8JGP9bkO/0Od/WFIPixUns8u0M3hEmIf6DsBCI3iW2CYJ4VTBW9SAwV2fbBpULqnYUjyk
	 NKMpnbw9NJBE5S+de72+MgD9QPpoirhzUb33cXGQ2aeCasNubWGR38JLCxEMGvAgl7ZdR
	 bilb8//1Bqy7YXNj5mMLuEZnamgdCONpV7SB7DUOh5Ex7L1uZKfHhDL2SfYt2IrDKopLf
	 09NiMvUDk2Zvz4Oy/38ALEa5Y0QS5nYVZnCR8I6z1IhBakvP5Fb5krJvA3vsvDBBmHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinsec.com.cn;
	spf=pass smtp.mailfrom=kylinsec.com.cn;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2CC606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD2CC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinsec.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinsec.com.cn
X-QQ-mid: zesmtpsz2t1795354499t35aa290d
X-QQ-Originating-IP: yasSL0Uzu2zeI/HNQ8mvnB2sQq2bWiVWUmboAbenPYM=
Received: from yoga14s ( [113.246.116.110])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 22 Nov 2026 21:34:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10656347500650760345
From: Luo Qiu <luoqiu@kylinsec.com.cn>
To: Ike Panhc <ikepanhc@gmail.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: ideapad-laptop: Fix DYTC profile use-after-free
Date: Sun, 22 Nov 2026 21:34:56 +0800
Message-ID: <E3DE35B39E153ADC+20261122133456.48054-1-luoqiu@kylinsec.com.cn>
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
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:kylinsec.com.cn:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NN51gi9eLBwaFO6LR7QFfLGx0hAdIQndHTdZkwcWgNC6TyTjWTXC5qP+
	2M3imOlLXrdZPgMO0J7tuPZIscdP9LdqGAPOPHvFZ89442LLSJt0pXirjfolKeA8s8NRTi9
	TRZwjrs0qP4YY8bmwDCYp9P93uMXOs/kyMQzZJmbzj5d8LXYPbxhPbRkK3qIjkCdeiqCJYn
	LGbY3jsWUSq6EHirRhNbBS9Ugzxk8VHyJI4SAXCTq1CDQQSwmqtp4Iaqbp8S7v9F78MuPIS
	yR+Rtl1Cn/pejYnSsuqrs5gVJ3X1PMVnb17KiJ6NiJxk2o82jSf5JHOlW3W3OjKbVipTEj1
	gMFemakwIAeWwN5GgRyGjyjcmHbLy4kpL/MquBAIDBRaNY35YWS45byvsWfgzB9Rgln4lKK
	bxmPchTYw00bzC9MU+fKC82eSWt+Kcv+i3QdQedSm2YaGvNdA/LujxiXZGGo7oa3ZdrsYGG
	WpZXLW8TlXNMtv5IlPK8mhQIdL5LPY+6CJS7yTbcdV32EOeGp+uFvJp9bgLmvbL0C2QiYCX
	zLwUGHM0u1ybyUd0KE1AHtMDt6UMqohMC9D2BoGsC2qFhakQCTpKNZv1FwzxKQZo6nMBcv9
	b5OrjxkXtnheiWIgpeq+BerWDZRM76n73Y51t+yA9QDhc4NCAld3z1AmV57dHybePKy2Mir
	CObDkpIBm9fIIsjNSpyJhvuTHlJUXFmh1j+8IrnMFXIKHrdnPY0SKDD1zbD9924tIWxVz9/
	uHaTiixztCR03d3NNcdi2KBRqQ6wLTTSZVITPt2rHil7N3xdorQgIpKldrtj0+Ly3S5RR9q
	uv6Amej9plmA1mJQCTPH8zXvBcAFPGDVJ67kOIgDlIfrVIIr8cFwdCfEqckq4Q6cqQ5DquL
	Hx/z55kB2Qr1Hr2ekVu4duL0eC6XQzNoNz/54vgi6dkZHYIkrdXpDbJcyv47lHa2uhR4jBX
	1gI835WF7q+m+nHlj3y4uAS68yDVuQiZuUaKCAr2r1xDadKes4Z9STOKE4WkifwnhiUN++M
	g64RtuLg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

ideapad_dytc_profile_exit() is called from both ideapad_acpi_remove()
and the probe failure path. It destroys priv->dytc->mutex and frees
priv->dytc, but the platform profile device is registered with
devm_platform_profile_register().

Devres cleanup runs after the driver remove callback, so the profile
device remains registered after its drvdata has been freed. A concurrent
read of its profile sysfs attribute then calls into the driver with the
stale pointer:

  BUG: KASAN: slab-use-after-free in dytc_profile_get+0xb1/0xe0 [ideapad_laptop]

  Call Trace:
    dytc_profile_get+0xb1/0xe0 [ideapad_laptop]
    profile_show+0xe4/0x1d0
    dev_attr_show+0x4a/0x90
    sysfs_kf_seq_show+0x29e/0x4a0

  Allocated by task 411:
    ideapad_acpi_add+0xd1f/0x2420 [ideapad_laptop]

  Freed by task 7150:
    kfree+0x1c7/0x500
    ideapad_acpi_remove+0x148/0x3d0 [ideapad_laptop]
    device_release_driver_internal+0x35c/0x560
    unbind_store+0xde/0x100

Subsequent reads through the stale drvdata also observe corrupted
values. They trigger WARN_ON(val >= PLATFORM_PROFILE_LAST) in
get_class_profile() and fail with -EINVAL.

Register the platform profile explicitly and remove it in
ideapad_dytc_profile_exit() before destroying the mutex and freeing
dytc. This keeps the profile device and its drvdata alive for the same
interval on both removal and probe failure.

Fixes: 0d882fae334b ("platform/x86: ideapad-laptop: Use devm_platform_profile_register()")
Signed-off-by: Luo Qiu <luoqiu@kylinsec.com.cn>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 91a8d11c79c5..2cbd0b87defc 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1185,9 +1185,9 @@ static int ideapad_dytc_profile_init(struct ideapad_private *priv)
 	priv->dytc->priv = priv;
 
 	/* Create platform_profile structure and register */
-	priv->dytc->ppdev = devm_platform_profile_register(&priv->platform_device->dev,
-							   "ideapad-laptop", priv->dytc,
-							   &dytc_profile_ops);
+	priv->dytc->ppdev = platform_profile_register(&priv->platform_device->dev,
+						      "ideapad-laptop", priv->dytc,
+						      &dytc_profile_ops);
 	if (IS_ERR(priv->dytc->ppdev)) {
 		err = PTR_ERR(priv->dytc->ppdev);
 		goto pp_reg_failed;
@@ -1211,6 +1211,7 @@ static void ideapad_dytc_profile_exit(struct ideapad_private *priv)
 	if (!priv->dytc)
 		return;
 
+	platform_profile_remove(priv->dytc->ppdev);
 	mutex_destroy(&priv->dytc->mutex);
 	kfree(priv->dytc);
 
-- 
2.56.1

