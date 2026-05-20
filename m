Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083C1367B9C;
	Wed, 20 May 2026 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256627; cv=none; b=b1IGHxL8GSbHEDrEKdgZx0dUadX4uQDzNG8p7E7vDgv32lutjXPmRPHAcBSHzcqgQAFS3uaZArIqdJRWMD9Z6A4crt9AcwOFMl5IO08+aEmn5G77C4ebi36ghHAb4Gm679czTvBBkeFrIVcV/2kvN8mjaM1tck2UsFfGYGbRtX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256627; c=relaxed/simple;
	bh=rAwIxrIzvapYzGhKTh7yR5K4P6evEJUOirV7nbTxXYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Dr14BOJuJLPfbvPZ5QSIhKjLai0A4clXNbhmTF8vz+Le4lHMDEKs+G9+ahar9KXiwsXeVL6mc+wo/axjh8vrIs/LXYHBMg0EA0Gwts9JCfQBCch8GwL/ioYsya1TzF3POULxl8wkVjWWcAuhViWhdC0+njnFd5yW9opoSaMpaA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=YUtUWWE2; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="YUtUWWE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779256593;
	bh=RdJ4Ye8htQ7W/kxA6uzcSK1PmdVGTESwG0T1+Tl3U2o=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=YUtUWWE2TJNpRmivbKYLCfz6TlmdZ2ZNvtt6x+T1kvw8PCUaJFt56nf/fxS+vRvtX
	 /9R0jktwKYDf9pot737O90/9T77sh5HwvOxKXcpGubdWnB7Wj3XzoEhAC92QZ/kYza
	 y7ZpuCziE6rwYkgRzMnG7KZ48nTLsYnSPNdE4bvg=
X-QQ-mid: zesmtpgz8t1779256577tf9e27f73
X-QQ-Originating-IP: 6OY6FHcoL5Y25PovyGAmiUxZAsPWbIPQY+/RkyC6OwY=
Received: from localhost.localdomain ( [124.126.19.250])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 13:56:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 8353176035125787300
EX-QQ-RecipientCnt: 7
From: ZhaoJinming <zhaojinming@uniontech.com>
To: ilpo.jarvinen@linux.intel.com,
	srinivas.pandruvada@linux.intel.com
Cc: hansg@kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ZhaoJinming <zhaojinming@uniontech.com>
Subject: [PATCH 1/2] platform/x86/intel/tpmi: use cleanup helpers in mem_write()
Date: Wed, 20 May 2026 13:54:42 +0800
Message-Id: <20260520055443.1681904-1-zhaojinming@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <b1006ce4-f596-b2aa-421a-518fe3cfe1f0@linux.intel.com>
References: <b1006ce4-f596-b2aa-421a-518fe3cfe1f0@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: MDSqlvH8sYTtT0eLRV0x9m+R9hE4qZp92xs5TetA8u0QJk8N9foU/HV6
	xBihN5UdKzTYjvEzsCxrx7w5J8MUVRpjJSwfdDib+EXI6SAie9KNsJwW9H7JLfR5UtQinTW
	OTvUHRC+QGzDVBUjj/14k+v5paiqDBi5D2hXD5Y97F75gbDz5k9OHD1IOd9qGlPfOBRcpkS
	Lf+TvlcEveh/jNbT4s6ZePEHQC8zv2OOZ6Y9e4ABpsjtC6F93JmELVDG4UNjlRGAYdlu96x
	0cJR4JSnCa0jgHq7CjSS+vFSVA4GOw6kUGLBvsp4iyiUIE0/oqKaGlYXqde5TbaggHGV7bn
	HuP0EBfFR/8u6VzKM8jXP68XXOycocWoHrqqGdZGg80vwSl5dWBsM7am5rd3DHCxS6IrhCp
	/Yrt+TCuQw1ZFZBmsrPozswVKx8/NnPihpvqqK35uxX3pB56ePYv1FDHRGAaKvUG8kLUYt2
	A+0t4wjSH0bZGt/h5qBgoIwjNFOZJWy4sM6LBtc2F7Wb5j/RXUSXHMDQt0eYp+p0MN+vBvM
	1AuH/nCZ+/J99uyHpYqzb3WLLjDznQbCiGwEhyurO+qEXzo2Hxj2ncMt6w/D1IQTB/c4yKE
	lCSMn7LMIaVVBk4G02H0cF7D0+0PdrUB7hHFIy1uTjjumc67iswYfqQrDJwtH0hXiQurutH
	2wliUdUBWdKqqkVarEv4G4oxVQl+1ywCZql9R4MR3RsMN4rEjYQF0IvxxN71ibwVP+nciFb
	ROSDssyFVIcFU4++Ifgn0duYc18NknhzroADYMIGBBJnwn4oWHBL1wAJJcMwEiQUASPmQFG
	Z/UTUYgw+FgRA8TTE1xTXW1Eu2wsoKl1eX7uoqIf9ACo59QkobIwTP8QFBu3IBndKwe0Zdm
	UoM35JeS4f6W3RaYvE7jc5bzJo2pxWPRsdAAR43mjmFbazT0P7XKWrZiNbRbCk3sZ/+9Xt/
	KVbxqk1VPRBLXHv3vogYmhMaV4ju0JyXZ0znA7IVhjvmM5F5usg+k+EOrB9j+A5S/mbOfAg
	qQNPQ/oF/l5SFpok5cgZPKnj17QjrEBA16Bw/I5GM7OO48uPV8GCX8NavVo0vkP4oPZXyb8
	t7ZicBrXx8iWUSYAdSLvez7zRvyrjb20K4GoMsGJiwcDpcp74Hv9AM=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

In mem_write(), the temporary array returned by parse_int_array_user() must be released on all error paths. Convert the array variable to use cleanup.h scope-based cleanup so it is freed automatically on return.

This also moves the array declaration next to parse_int_array_user() as required by cleanup.h usage guidelines.

Fixes: 8e0a2fc68ec3 ("platform/x86/intel/tpmi: Use 32 bit aligned address for debugfs mem write")
Cc: stable@vger.kernel.org
Signed-off-by: ZhaoJinming <zhaojinming@uniontech.com>
---
 drivers/platform/x86/intel/vsec_tpmi.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec_tpmi.c b/drivers/platform/x86/intel/vsec_tpmi.c
index 16fd7aa41f20..e7bc3474c7aa 100644
--- a/drivers/platform/x86/intel/vsec_tpmi.c
+++ b/drivers/platform/x86/intel/vsec_tpmi.c
@@ -51,6 +51,7 @@
 #include <linux/bitfield.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/cleanup.h>
 #include <linux/intel_tpmi.h>
 #include <linux/intel_vsec.h>
 #include <linux/io.h>
@@ -473,7 +474,7 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	struct seq_file *m = file->private_data;
 	struct intel_tpmi_pm_feature *pfs = m->private;
 	u32 addr, value, punit, size;
-	u32 num_elems, *array;
+	u32 num_elems;
 	void __iomem *mem;
 	int ret;
 
@@ -481,15 +482,14 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	if (!size)
 		return -EIO;
 
+	u32 *array __free(kfree) = NULL;
 	ret = parse_int_array_user(userbuf, len, (int **)&array);
 	if (ret < 0)
 		return ret;
 
 	num_elems = *array;
-	if (num_elems != 3) {
-		ret = -EINVAL;
-		goto exit_write;
-	}
+	if (num_elems != 3)
+		return -EINVAL;
 
 	punit = array[1];
 	addr = array[2];
@@ -498,15 +498,11 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 	if (!IS_ALIGNED(addr, sizeof(u32)))
 		return -EINVAL;
 
-	if (punit >= pfs->pfs_header.num_entries) {
-		ret = -EINVAL;
-		goto exit_write;
-	}
+	if (punit >= pfs->pfs_header.num_entries)
+		return -EINVAL;
 
-	if (addr >= size) {
-		ret = -EINVAL;
-		goto exit_write;
-	}
+	if (addr >= size)
+		return -EINVAL;
 
 	mutex_lock(&tpmi_dev_lock);
 
@@ -522,12 +518,8 @@ static ssize_t mem_write(struct file *file, const char __user *userbuf, size_t l
 
 	ret = len;
 
-unlock_mem_write:
 	mutex_unlock(&tpmi_dev_lock);
 
-exit_write:
-	kfree(array);
-
 	return ret;
 }
 
-- 
2.20.1

