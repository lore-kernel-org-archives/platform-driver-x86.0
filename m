Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861666;
	b=sHoQtg8IzUDcu0H3bCARKYGoIvZ1Uv9gUZEyoktzsVqsqdwqlq1wpYbGMvQiSRsxM0YQ
	 1/uCOWyL1Ci0DP7brfQdiA4me5BVoQ1zSoUSs3JClPBl2UZgcvNFgMJPDatIMe6hkdu/S
	 p2ylMThCrUhsEbPE/Xukn0qxyepS4GTrdApmrRFsT5NwsrtPgU5/NVfQUYQr38SL5Uryc
	 BokuMIQgDbrfxHsE6yc1rWPcAV0vh39J4tptILwEZf4VVPeSJ1xivi1JDEH+zVFB2Oopl
	 tIE6M81p359ZtBLDLbaLC9iUhCxJOjEUtkSPMXk/RL1LB53zdYyhIrE9jBEDSq1b4+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861666;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1JOVMxOFhUKnmlrcXwJX+d7zl/tg9wPLTTafKHk50+8=;
	b=RKrmWFlW8wlLAmpQjGmk7GF/wwz8L46ErebDEGl+qcADU6YuIlo7YbjQEcS5xjl65uRq
	 ylZ/qC2TgSGrks2IyMzx3JXW9KWTH/QREOIk6RabK8BKccThBf8abTIv1LqcAWTD6Hcv8
	 B/Lz8uVh7lqbSRGh9b8kes3LkU11kvDhkYOgvY7BbtU71LQnL8VQufhoHCM2QiR25VcJR
	 q1IeE04exgo474wB1zgWgB/B/vyngQNcxWyd072I1bwnZjZ8I17aA0rHOGw+Dfs8Z8rR1
	 73hHdafGol5Cp7FmCZQDS+m683sExRRahDJGyCK7F71IpFpWeLaZTFiuXL9x8LWGh0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRsrEEi4;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A331606A32F
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 20:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A331606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oRsrEEi4
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ee0533d249so13869615ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861665; x=1795466465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JOVMxOFhUKnmlrcXwJX+d7zl/tg9wPLTTafKHk50+8=;
        b=oRsrEEi4vtbNNz7BLgW3CjImVCA3A5qud/olh+ckIJF27znjYAO1y9GHnLyJ6qZ7Dg
         ubfHsRVtcJ3RagFplrkVK1pl9xM0HfLto3WfFFwMuP69Ns4I4AwAfb6cqHrRr8qibOev
         Q99Dv81eutPXIS6be6uSh4RST38TzuP1l1DOl7DYxO2k855R6TOei1lz6LUn6kyRw6d6
         aPKcVe0khuS2bWw3WKAJrQKF7pvkGHNP8qvgRVGr/VFlKsnfXujdzl9OkkFZgfeQ50ru
         9N2OFxy1djoKbNgJT8HUHoN8azGwck/MarpTx+5lv4cGdQlzp0fCmGARKXIgHqi/rfXU
         BaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861665; x=1795466465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JOVMxOFhUKnmlrcXwJX+d7zl/tg9wPLTTafKHk50+8=;
        b=ZpZ3RVxVUKJW8FpErqzYBiuWSD6YY1Y+YGadRfBFHfrRJUM3GvyaDaqhIkuR7nRoLq
         RPN2qpEqcYikq56Wvw2jJ9NKK/S2eO0TTMomLRvuI0rTx9eq/CZOQa5/2eEMyRLajjsv
         X1dIQU5G+mEO5URPHNQCEziIQVneatgb5P88k+cWGvGqoH67YKrKHFUkrFwJLEIFNYvZ
         QkuP+VCmHATf+756BwOnY9FFHDCXyRIkMpzkeQZzkfzqGoviM7QJhfHwp9WqcKMGglH2
         oxrdWsy8x0PwlLmPf64jK7/i+iRFBQEu4ttGCxiNDm5x65C865dd0OSaoJQbuHDajK2z
         IEHw==
X-Gm-Message-State: APuU4Z8os7G/znpAL/D5lwIX6B/jIkeXjwMnDg/DCxWQ+zDpKUfKfvuG
	jAZ3qD14SqMH2bDclk9a/MvVTRz1JUi3umaQ6tlGAnbg76q6225Mk4kB
X-Gm-Gg: AZFdTZdhjkMobU4WLP9BChwiekqTnDS8C5gPDA+nAqwZRdAyXMLsDfkY9wGLqXB16jW
	CfuQ1yRWDAWzd9r8YkLMlTyoR2qhV5GWR4UW1tk5+JaWO9K0cA7oLEQOhsuZW6uHA5GBElN60ML
	ZqfnmMUaClDrYbaPttTlOfhidO1Or2Ud3YtLy8zy7OgwWZOS9lgDPXLV8OvfihfJpAMg/WACB6G
	zWdOBAVYLDy9pBvCnywQf7CTLTEbRvkNAb9Rg5Aa5LT2/ySeM62OhU5Kkzfvcf1nFz4+8XbPgZc
	BQM6NArP2YpihlraxxjqzD/bjWRuMn4NpnIFSAlJjc3lRp2fEoCo1L5tS8zOgcWWrKKeWYi0cla
	lWPZVctXi+m0JMCqHir50anNvpyt5v4HpKB+EV82/d9IRxhQhW8ePlbNWHmbOol9pfkXqeS+uGn
	6i/R8jecaSt71VHl2raG1nRo5XweU69EBvZDn6TbOP4X5uyi02fhWiy9WK9CtxVz3shLazEXmep
	MgqWt3GDNoMpvX7/haILgVHe3yQhcls4wKgn/uxwEGCGnU31ZtpxTytOc1dki9+pKEt3NGvYEkB
	5iym0OCGu6BPeusSIbl1znJOLFn5S56e7ldpjsGKK8JyZa63gBz/7tJOYlPDm0L7FgmbVZUJH+N
	nbRE75rFEg8ybn6O0YGLn53yvFIj45RtP3LdaNY7BQvGPG9KRfd80ozJSb3myJG9E1wv1ltbLyD
	typLGSWDtPyEtDrXFrtf3S1Fc=
X-Received: by 2002:a17:903:1904:b0:2e9:61bf:6587 with SMTP id d9443c01a7336-2ee0df758b3mr113876965ad.49.1794861664780;
        Mon, 16 Nov 2026 12:41:04 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:04 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] platform/x86: dell: dcdbas: Release the SMI buffer in remove
Date: Mon, 16 Nov 2026 12:40:51 -0800
Message-ID: <d9c1df9c5f28848f77beec2b4cbabc0eb4da6c70.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

dcdbas_exit() frees the SMI data buffer before
platform_device_unregister() removes the sysfs attributes, and without
holding smi_data_lock. The comment claims that only at module exit can
all sysfs attributes be released, but device attributes do not pin the
module: while rmmod runs, smi_data_write() or smi_data_buf_size_store()
can still be executing. They can then memcpy() into the buffer as it is
freed, or allocate a new buffer that is never freed.

sysfs_remove_group() in dcdbas_remove() waits for running attribute
handlers, and dcdbas_pdev is still valid at that point. Free the buffer
there, or unmap the firmware-provided buffer when WSMT is in use, and
also do it when probe fails after dcdbas_check_wsmt() mapped the
firmware buffer. Reset the WSMT state with it so a later probe starts
clean.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 44 ++++++++++++++++++------------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index cd72f8c29a86..0db278eed5d8 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -97,6 +97,20 @@ static void smi_data_buf_free(void)
 	dcdbas_smi_free(&smi_buf);
 }
 
+/* Free the SMI data buffer, or unmap the firmware one when WSMT is in use */
+static void dcdbas_release_buffer(void)
+{
+	if (wsmt_enabled) {
+		memunmap(bios_buffer);
+		bios_buffer = NULL;
+		smi_buf = (struct smi_buffer){};
+		max_smi_data_buf_size = MAX_SMI_DATA_BUF_SIZE;
+		wsmt_enabled = false;
+	} else {
+		smi_data_buf_free();
+	}
+}
+
 /**
  * smi_data_buf_realloc: grow SMI data buffer if needed
  */
@@ -685,11 +699,11 @@ static int dcdbas_probe(struct platform_device *dev)
 	 */
 	error = dma_set_coherent_mask(&dcdbas_pdev->dev, DMA_BIT_MASK(32));
 	if (error)
-		return error;
+		goto err_release_buffer;
 
 	error = sysfs_create_group(&dev->dev.kobj, &dcdbas_attr_group);
 	if (error)
-		return error;
+		goto err_release_buffer;
 
 	register_reboot_notifier(&dcdbas_reboot_nb);
 
@@ -697,12 +711,22 @@ static int dcdbas_probe(struct platform_device *dev)
 		 DRIVER_DESCRIPTION, DRIVER_VERSION);
 
 	return 0;
+
+err_release_buffer:
+	dcdbas_release_buffer();
+	return error;
 }
 
 static void dcdbas_remove(struct platform_device *dev)
 {
 	unregister_reboot_notifier(&dcdbas_reboot_nb);
 	sysfs_remove_group(&dev->dev.kobj, &dcdbas_attr_group);
+
+	/*
+	 * sysfs_remove_group() waited for any attribute handler still
+	 * running, so nothing else uses the buffer now.
+	 */
+	dcdbas_release_buffer();
 }
 
 static struct platform_driver dcdbas_driver = {
@@ -751,22 +775,6 @@ static int __init dcdbas_init(void)
  */
 static void __exit dcdbas_exit(void)
 {
-	/*
-	 * make sure functions that use dcdbas_pdev are called
-	 * before platform_device_unregister
-	 */
-	unregister_reboot_notifier(&dcdbas_reboot_nb);
-
-	/*
-	 * We have to free the buffer here instead of dcdbas_remove
-	 * because only in module exit function we can be sure that
-	 * all sysfs attributes belonging to this module have been
-	 * released.
-	 */
-	if (dcdbas_pdev)
-		smi_data_buf_free();
-	if (bios_buffer)
-		memunmap(bios_buffer);
 	platform_device_unregister(dcdbas_pdev_reg);
 	platform_driver_unregister(&dcdbas_driver);
 }
-- 
2.56.1

