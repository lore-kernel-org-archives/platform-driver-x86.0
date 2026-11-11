Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794433730;
	b=KuQ4qb4XMImJPo62Z1xeNCVEf3lLI1xgT18MpJ6hYUWvDajvAc/fjFS2jArdAbIuwuTb
	 Ahv7IOw9dcXVLPkrOaY+b+ACuVvXutV5ZekBiaBEWj/N5X5hm2VpUxDyqn2WX6xpkZ2KM
	 8eIk0UtJl4fMlNYZlOQcle4mlBYEFGg4e5g6DHZNKdwVMxQ+u/agLg+MV8s9AVBC70cMh
	 SBNlGJtP5hVPiLkPAQcLY109Cwlq72lfAYn5rd2crQU5MqWFRFD6UqsReBkmR5M/draS2
	 tZNLmZVMpDxuxBzHB31deLsFoLBT7SD3qcXWA4Gp3CzKOu+X9f3Vu8FHhn4pFRJf4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794433730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
	b=cmq4RFJU4SHXZc4FkkDQXgBW6yt27r6FvwyWo19sWywmxfYxp8WCMY9Xeg3BDhE5RH2N
	 JWpDMdDSsDTsiuDFjlLglXZCdN6OtEai4/pG3w4ak9aA93DpWDWeD2Sd1OMOWQd1euiA2
	 GsJOyw+qTjPBY8gl+rL6dhUjlJbDBEQPknE8AjOZYKDzaVuEmT2LvZnxTTDvUxT3O34ZC
	 vO71D53V+35g/tnd1f6S1HE9CCI5NxnSqL4ZwX4zZuabzn0JJOspBVweFsSoNsXAOPHjs
	 WoABVY/pwAGPztWV9qbt5bCUDgcXQU9Xl/mhC+JE7OuvtmALhpkH7uI1rZg+G7pZYuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF0INbu5;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8E1606A886
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 21:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED8E1606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MF0INbu5
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso2182315a91.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 11 Nov 2026 13:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794433729; x=1795038529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
        b=MF0INbu5MaaNPwlPqfOGFWmfOBBlMsgwfTX9yqoOQukKszhiLhWsvensSmgg5EwMX0
         6xHhym5nnd39YYfADosiSRok6GnimKHgUbRgwEvwTzSdhR9TwY1aFdZy3PAvbHfDkxf4
         fwIbFP0hBOGfh5wEfRpIlV6YGjnwXsaDvaK34MsthoCLKaD9NkCqZlwMQdJ+xA8tT0qv
         l7Jmm2K6lqcavReO4u+S/hvMvGBUxKnCOEBaAmFlifxfixKEhojKyoJmNVskhij0z665
         iWs560WG4BQFURNTTvXOqXp0L9jbbhNh/EWEizzJs9SE4kU1tr5CPbxOfcCqT+FEy8i5
         vkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794433729; x=1795038529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=in2H/EiTzu7oKMx0oXEGmqlnXShESJ9rcbe+oDUN+Fs=;
        b=ioQ8A/0ZCOG+EdZhTVPvPQMntJ5h5l7hd9PZsPJxKpuQkOfepD3hGOkvRYu8bUPCm7
         R8jLfc+XgQWyQvgR5mofYOHIUSqYmdQO/Ku2xNNx1Suci/5zVOpgdx1vqp/fx+8wqoKj
         UHtqPmuQgSmLDBKsVups4Di6rHn9x08XhRw8fDHLppxM5i/3p+Or1tPMaT15LfvPupgn
         a5hUvBoUdYoVJbF7wkRv5xTa4Da2vtjRqJTkVSM0HIY0LT0UR7fBg5BShrMpoSOqA0qI
         SnaT6Rs55501AHNaQKTHYcKMthQoIGqsfs8p2ubomqNYkz4g0msWw8Fura/uHH/U12LD
         p4yA==
X-Forwarded-Encrypted: i=1; AL+hErGGGFYswOhpSECBAW4LQ8qQMbXQ0dkNNXBGMqlQ75SXP8z99HMjAWfP3lXAKvYgPuzqUIZbaKrd6kdkbZXDS/pIIzJo@vger.kernel.org
X-Gm-Message-State: APuU4Z8e48Caqj4f3nlxalIV+Bcty6+SvXMHIHFmD8/djVeLW+PYqkLU
	bX17O1npWx3s2z9NiixWz4JWb435EbzFvKQD4cuUH/TElF+g8iYFUEB5
X-Gm-Gg: AYBFou0Suome44og3r3xYuHRB7IDyh19ynshKxU/Cln1Fqe+Zp4XlSE2izcn6seN1Hp
	pbSXTBTFXoFIXpW4IoJh3t2bUZLyT6yK4CxL+fOHqCNBXN70kb78uiRgchb3Q8rSjbf5KzEw9eG
	TSbhy6G82TDioCd5NEmGs0mE9cCo4rK7hx1KYp3JplwDbp/ZzXA/9GmPVuJ3krEvvjx1tkkiYO/
	znXy3r+D9m40E5ptYk62qUR9j6X6B6QaFQ+xBXy5QJxcgqn6Z+sucJsKTi1mEiSBhKtGdFxITcK
	YtlE4v3H9hASZiP93ibMao/LzezEEUsnSB3RCwRGfg7Fz5yoqLo+eY2dqqAn0BAW5Yoe28WmQil
	zRC4LkkjrpTMTjVRaOlTdj+Conss+D3/6BX1yslPX45XLBlQsQU9dhXbjvUvYKl274B9yu5cCEX
	RpvY4y7ZqDQxnanVc6oDu7FcmK+V4wTqnHdEbpzAMuncimc4TwnrOI9TFrOTceS7r6yn2M1rta+
	830l3BPUwd0BBe1YnmEOECWp5cEyACTP6BmuGmW5ZFBGqGZ9BCpLYAHXkfAaD54ZSQmFy1WLRVY
	vpYYGUXbIDfwUvvvUlyWDf/PHPEs3J/xXty6TpDhSiIjvkxRlTtP0y0hk2vaDLdqIOyFsgPakB3
	qLBc8Grn15dHT5VMSRP7ywetIt/cYnrPipRtvhCh7LlZd/YOhE6RWdwHm8oXc5pcmI3S8jML+i1
	oNIQ==
X-Received: by 2002:a17:90b:4ad0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b182f1adcdmr3660412a91.60.1794433729109;
        Wed, 11 Nov 2026 13:48:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b182de1dafsm2754761a91.3.2026.11.11.13.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:48:47 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: dell_rbu: Allocate large monolithic images contiguously
Date: Wed, 11 Nov 2026 13:48:26 -0800
Message-ID: <20261111214826.6577-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261111214826.6577-1-rosenp@gmail.com>
References: <20261111214826.6577-1-rosenp@gmail.com>
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

Monolithic RBU images must live in a single physically contiguous block
below 4GB. img_update_realloc() gets that block from __get_free_pages(),
which cannot return more than MAX_PAGE_ORDER (4MB on x86). Current Dell
BIOS packages are larger than that: the Precision M4800 A26 image
(the PFS container extracted from the update executable) is about 16MB,
and SMBIOS structure 0xDE on that system reports no packet-mode support,
so the image cannot be loaded at all.

When the required order exceeds MAX_PAGE_ORDER, fall back to
alloc_contig_pages() with __GFP_DMA32 so the range is still below 4GB,
and free it with free_contig_range(). Smaller images keep using the
buddy allocator as before.

Tested on a Precision M4800 by uploading the 16MB A26 image through
/sys/class/firmware/dell_rbu and reading it back byte-for-byte from
/sys/devices/platform/dell_rbu/data; a 300KB image still uses the
buddy allocator path.

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell_rbu.c | 54 +++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/dell/dell_rbu.c b/drivers/platform/x86/dell/dell_rbu.c
index a121f59a215d..d71fa9584831 100644
--- a/drivers/platform/x86/dell/dell_rbu.c
+++ b/drivers/platform/x86/dell/dell_rbu.c
@@ -41,6 +41,8 @@
 #include <linux/moduleparam.h>
 #include <linux/firmware.h>
 #include <linux/dma-mapping.h>
+#include <linux/gfp.h>
+#include <linux/mm.h>
 #include <asm/set_memory.h>
 
 MODULE_AUTHOR("Abhay Salunke <abhay_salunke@dell.com>");
@@ -55,6 +57,7 @@ static struct _rbu_data {
 	unsigned long image_update_buffer_size;
 	unsigned long bios_image_size;
 	int image_update_ordernum;
+	unsigned long image_update_contig_pages;
 	spinlock_t lock;
 	unsigned long packet_read_count;
 	unsigned long num_packets;
@@ -335,6 +338,37 @@ static void packet_empty_list(void)
 	rbu_data.imagesize = 0;
 }
 
+/*
+ * Monolithic images must sit in one physically contiguous block below 4GB.
+ * Current BIOS images (16MB on some systems) exceed what the buddy allocator
+ * can hand out (MAX_PAGE_ORDER), so fall back to the contiguous range
+ * allocator for those when it is available.
+ */
+#ifdef CONFIG_CONTIG_ALLOC
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	struct page *page;
+
+	page = alloc_contig_pages(nr_pages, GFP_KERNEL | __GFP_DMA32 | __GFP_NOWARN,
+				  first_online_node, NULL);
+	return page ? page_address(page) : NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+	free_contig_range(PHYS_PFN(virt_to_phys(buf)), nr_pages);
+}
+#else
+static void *img_alloc_contig(unsigned long nr_pages)
+{
+	return NULL;
+}
+
+static void img_free_contig(void *buf, unsigned long nr_pages)
+{
+}
+#endif
+
 /*
  * img_update_free: Frees the buffer allocated for storing BIOS image
  * Always called with lock held and returned with lock held
@@ -349,13 +383,18 @@ static void img_update_free(void)
 	 */
 	memset(rbu_data.image_update_buffer, 0,
 		rbu_data.image_update_buffer_size);
-	free_pages((unsigned long) rbu_data.image_update_buffer,
-		rbu_data.image_update_ordernum);
+	if (rbu_data.image_update_contig_pages)
+		img_free_contig(rbu_data.image_update_buffer,
+				rbu_data.image_update_contig_pages);
+	else
+		free_pages((unsigned long) rbu_data.image_update_buffer,
+			rbu_data.image_update_ordernum);
 
 	/*
 	 * Re-initialize the rbu_data variables after a free
 	 */
 	rbu_data.image_update_ordernum = -1;
+	rbu_data.image_update_contig_pages = 0;
 	rbu_data.image_update_buffer = NULL;
 	rbu_data.image_update_buffer_size = 0;
 	rbu_data.bios_image_size = 0;
@@ -375,6 +414,7 @@ static int img_update_realloc(unsigned long size)
 {
 	unsigned char *image_update_buffer = NULL;
 	unsigned long img_buf_phys_addr;
+	unsigned long contig_pages = 0;
 	int ordernum;
 
 	/*
@@ -404,8 +444,13 @@ static int img_update_realloc(unsigned long size)
 	spin_unlock(&rbu_data.lock);
 
 	ordernum = get_order(size);
-	image_update_buffer =
-		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	if (ordernum <= MAX_PAGE_ORDER) {
+		image_update_buffer =
+			(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
+	} else {
+		contig_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
+		image_update_buffer = img_alloc_contig(contig_pages);
+	}
 	spin_lock(&rbu_data.lock);
 	if (!image_update_buffer) {
 		pr_debug("Not enough memory for image update: size = %ld\n", size);
@@ -420,6 +465,7 @@ static int img_update_realloc(unsigned long size)
 	rbu_data.image_update_buffer_size = size;
 	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
 	rbu_data.image_update_ordernum = ordernum;
+	rbu_data.image_update_contig_pages = contig_pages;
 	return 0;
 }
 
-- 
2.56.1

