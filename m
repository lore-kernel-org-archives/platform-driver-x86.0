Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5703195EF;
	Mon, 15 Dec 2025 03:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765769253; cv=none; b=bAuG1atiAdwMII4LQONIe3SG9cj5x4zg8qEXvWqr02XFnClfz/7q4XiYewISIwWEiOJFUgt53UNZMBQwSpcnDwvAoiTJ2zNCUdFYjH608As9GSt3ocpbuSAXZJncyf/OWnJszpsVRg9NUPMO9HDi6W+eO9Beoc5kqFMul4uwIPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765769253; c=relaxed/simple;
	bh=r31nD7jiWlPdR4ZXugrEqJDU8tuRSXY+4l7DkPndW2Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ACn+VmhCwwdgELcbGVT/+PFJgP6ee/5MlcEG4ObxDx5sR/XU/MmZ/02n8hSRmYt11qNszFoW1OhrmoWpiEB5buTLKMvJrIocBA1quH+/Zc2m+mcrB7nao7QbENy83TdJ2AdCJHqtdhY7IfjPeo1Drpl6KeKo7IpI+Q/IQ0q8QhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: f96e89fad96511f0a38c85956e01ac42-20251215
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:98ecc81e-7cba-4c65-99a3-624be5da2dff,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:a132ce9fff8162bab067a6be75353638,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:-
	3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,A
	V:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f96e89fad96511f0a38c85956e01ac42-20251215
X-User: jiangyunshui@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <chenzhang@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 603283946; Mon, 15 Dec 2025 11:27:24 +0800
From: chen zhang <chenzhang@kylinos.cn>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	frank@f-seidel.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chenzhang_0901@163.com,
	chen zhang <chenzhang@kylinos.cn>
Subject: [PATCH] platform/x86: Switch to guard(mutex)
Date: Mon, 15 Dec 2025 11:27:20 +0800
Message-Id: <20251215032720.50418-1-chenzhang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of using the 'goto label; mutex_unlock()' pattern use
'guard(mutex)' which will release the mutex when it goes out of scope.

Signed-off-by: chen zhang <chenzhang@kylinos.cn>
---
 drivers/platform/x86/hdaps.c | 37 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/platform/x86/hdaps.c b/drivers/platform/x86/hdaps.c
index f11f726d2062..2a11bcaa52f2 100644
--- a/drivers/platform/x86/hdaps.c
+++ b/drivers/platform/x86/hdaps.c
@@ -147,18 +147,16 @@ static int hdaps_readb_one(unsigned int port, u8 *val)
 {
 	int ret;
 
-	mutex_lock(&hdaps_mtx);
+	guard(mutex)(&hdaps_mtx);
 
 	/* do a sync refresh -- we need to be sure that we read fresh data */
 	ret = __device_refresh_sync();
 	if (ret)
-		goto out;
+		return ret;
 
 	*val = inb(port);
 	__device_complete();
 
-out:
-	mutex_unlock(&hdaps_mtx);
 	return ret;
 }
 
@@ -208,12 +206,12 @@ static int hdaps_device_init(void)
 {
 	int total, ret = -ENXIO;
 
-	mutex_lock(&hdaps_mtx);
+	guard(mutex)(&hdaps_mtx);
 
 	outb(0x13, 0x1610);
 	outb(0x01, 0x161f);
 	if (__wait_latch(0x161f, 0x00))
-		goto out;
+		return ret;
 
 	/*
 	 * Most ThinkPads return 0x01.
@@ -226,7 +224,7 @@ static int hdaps_device_init(void)
 	if (__check_latch(0x1611, 0x03) &&
 		     __check_latch(0x1611, 0x02) &&
 		     __check_latch(0x1611, 0x01))
-		goto out;
+		return ret;
 
 	printk(KERN_DEBUG "hdaps: initial latch check good (0x%02x)\n",
 	       __get_latch(0x1611));
@@ -235,29 +233,29 @@ static int hdaps_device_init(void)
 	outb(0x81, 0x1611);
 	outb(0x01, 0x161f);
 	if (__wait_latch(0x161f, 0x00))
-		goto out;
+		return ret;
 	if (__wait_latch(0x1611, 0x00))
-		goto out;
+		return ret;
 	if (__wait_latch(0x1612, 0x60))
-		goto out;
+		return ret;
 	if (__wait_latch(0x1613, 0x00))
-		goto out;
+		return ret;
 	outb(0x14, 0x1610);
 	outb(0x01, 0x1611);
 	outb(0x01, 0x161f);
 	if (__wait_latch(0x161f, 0x00))
-		goto out;
+		return ret;
 	outb(0x10, 0x1610);
 	outb(0xc8, 0x1611);
 	outb(0x00, 0x1612);
 	outb(0x02, 0x1613);
 	outb(0x01, 0x161f);
 	if (__wait_latch(0x161f, 0x00))
-		goto out;
+		return ret;
 	if (__device_refresh_sync())
-		goto out;
+		return ret;
 	if (__wait_latch(0x1611, 0x00))
-		goto out;
+		return ret;
 
 	/* we have done our dance, now let's wait for the applause */
 	for (total = INIT_TIMEOUT_MSECS; total > 0; total -= INIT_WAIT_MSECS) {
@@ -273,8 +271,6 @@ static int hdaps_device_init(void)
 		msleep(INIT_WAIT_MSECS);
 	}
 
-out:
-	mutex_unlock(&hdaps_mtx);
 	return ret;
 }
 
@@ -322,17 +318,14 @@ static void hdaps_mousedev_poll(struct input_dev *input_dev)
 {
 	int x, y;
 
-	mutex_lock(&hdaps_mtx);
+	guard(mutex)(&hdaps_mtx);
 
 	if (__hdaps_read_pair(HDAPS_PORT_XPOS, HDAPS_PORT_YPOS, &x, &y))
-		goto out;
+		return;
 
 	input_report_abs(input_dev, ABS_X, x - rest_x);
 	input_report_abs(input_dev, ABS_Y, y - rest_y);
 	input_sync(input_dev);
-
-out:
-	mutex_unlock(&hdaps_mtx);
 }
 
 
-- 
2.25.1

