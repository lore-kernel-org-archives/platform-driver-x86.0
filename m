Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974210;
	b=nsCjjoCsEpUJSZ7MF85BulcDDw91CU7vfIkYaPfpereIb1W67jYyZlp+uqvQ3VJlm2qK
	 yTrNXIv4QKJ3kxNXdYci0vF440/HGRgNay7qSGNoFOr2dij0vMeDJfTP9yAjBDSbT7/x7
	 jliNr3Sa3oE6gCFqaOMwGZJlGXe004aVYrm4ZtmiCqlHUqri1ftO/2y+LilEMgaptSkgh
	 I7BwKxmpcnR+74iTmQpKlowOav3mjxzyBizQLz3xViaQZaSAnFNOlsx7ssbMOAf6rON3o
	 2DW4aPm4LqHMKwik2F6jKvBsPhPMnjcrBYJiKd+uABz5ihDUpVxfHbo1n70tzoB75Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LU6C26A8wdUz4JwqyHJ+H7MKA8RNTQ+RHRvHjwYNCns=;
	b=VIPgeUpb6Y6NffmxudUN98vLv9VxKOYI6AnmnzQVzL7kfEb1TiUTLe1Xre5PQ79yYda8
	 rzfhHWxmZcgrrnxEAuIazu6YVl6m9zUUvpTtn8Gn0Vv+g8BxZVeiG6KflDGifextWtPiD
	 sX3b45Vd015QuS+NEWPbMQbiNWTGeKoF51XNPV3B6Hh0VAqROawgOlkR9u0I8J2KraUC/
	 ZMTFGpsKPzIZrCPd6NlDbpzY/b3WgXXzmY7XzzwnVfpegvsHP+q5qWR/2DBYZkAYdmwYt
	 6BAzdwuffw3L1h3MGdYBu9w+y/zVDVl+a9EmVjDM3roZ7Oe+Z+OgyG/reHHmglM7rjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE1h7pqU;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3610C606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 03:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3610C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cE1h7pqU
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso262945a91.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 19:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794974210; x=1795579010; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LU6C26A8wdUz4JwqyHJ+H7MKA8RNTQ+RHRvHjwYNCns=;
        b=cE1h7pqUp1b03QO4+AEhJCAlOLY8lKr+Tis2/UYCBRsY27SOR7nZ34qOTBxsu9o3jM
         sZ6wW/Qw4BTVR7YahR50JS7vScbBuFqUO7qyv+SYjws1LiawvTs8hjERhS0D7e6f6GRn
         uNCUPbAyXYKs327X1YvfizmZ6qCgahzalIR9tSsfScb6npDoIrjBIBv/rOXsRBux80iD
         d+mXqfUYgRvQRIF7lJSODYaOIPT8qvo8AYWiYsTmJ6bGbJEAc/reR1n2BmY33ttIq85k
         LeZKFMf+h8ssy+VdZhN+DF7btJQBzKPoVx5630r/hahBV2fMCaQhW4Y5p6JShiSTZo7z
         UZTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974210; x=1795579010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LU6C26A8wdUz4JwqyHJ+H7MKA8RNTQ+RHRvHjwYNCns=;
        b=xs6FroB7DIl/MYjBkdzwLn9tLRWR7uY4KY1zlzMp5xOgazUBn7+JFN41PnD3k+Ykum
         Y7aLdEG562qHpudQcDNvt6RETeOlFe2m9hVjPgddJKryx40HTNrttpA8AL+CnwOuI923
         SWu+2X1jLE8qfmBmqqUIqyH1HP776XnJw7elvF13vk6/FQAIk6RE5zUh/WQA9c0o0nmn
         YyYqtHKntcjm2w1g3hW/OLQAwl8upc3eKCDvR+jU+sS/FWv9a/ch+k/O0TWF5UgmzcDM
         HZpDeWIq7e27/nDK2ZZn17LmqCVk3x4tLSxCW1fIyPmF2ef5VEfo1gzPLKdExAslwaY4
         312A==
X-Gm-Message-State: APuU4Z9o6asNkzDtGs8kMQ2L52Y2gU/uJuVSCcZeMzH5yLBQr3CX5LKl
	BIAXMGFvk03/A7oYb17mceEs3ytP6wRoIHSpuLTAattpwTbH0yHHh1ny
X-Gm-Gg: AZFdTZc9m9IFouYJTKAPmqJn2PiqtUHtHgYkwK6D1VOVkVZgZ+5JyT/e+1cgTmCo461
	ymA3bmE70OhOhGeZMnFS71e5CZ8Fa+Lw/1mH2MoSWInWlJeImhepXb1CrtGoeiOBoK1WklLPBC+
	yLExvDHitX4JLS6K9d/Se60A7nD+vH8FUlF4ZO+pbvvlD9rxAdAT9tP1YFZEvzESZpsc0rQhLJG
	p6K/KfaI/a5VPo+Epiin69ey9JxugKjy1Rd0KHk6m4Sw3Bl+4K1619Gn9ImHchsqLg121j7ff6W
	iNK79T5Z6LJbEF3oW/d1LntYNY6XoH0WUyIZTBCBJ09Gnb3AJ0oh+SJuFkYolswc2Bk4hlq0LhG
	y+w3Sy0+dZe563NLExb/UpyWlObl0nxTytt75uTGOQTajst+q5fh/61cDa01UKEvPL2ZA2o3n9h
	v+etD7n1PK31Jt65IY7dU8g+slmQvH1JE2HUtYRA3xBBx17OllsP4bOxlBSNktwXp7fikisKTJs
	m4U7twK0o14ep3g2PCgFXfpMHkV3fsfbUpjEBORw7ztz8ssPvXU30H2jyHl8iFYF9vePKMbIYO/
	AiIcjn6iXNoLZfAtJUD+zGHosHarc+8wOrTP++2FZoUQ5iGwuILTRtwesA4D6kivJL4qKFwlAwu
	ew8GTze/f+oXcWlleEx/q4t+jF0szkjrCV5IL8/kpT/NlXtKcMROImimuo1YMQl+S04Z1GnfvUv
	xtzQ==
X-Received: by 2002:a17:90b:4488:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b3d07d5320mr1500653a91.67.1794974209557;
        Tue, 17 Nov 2026 19:56:49 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3d5570208sm598227a91.0.2026.11.17.19.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:56:48 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 3/4] platform/x86: dell: dcdbas: Release the SMI buffer in remove
Date: Tue, 17 Nov 2026 19:56:37 -0800
Message-ID: <20261118035638.11773-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118035638.11773-1-rosenp@gmail.com>
References: <20261118035638.11773-1-rosenp@gmail.com>
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
index 6bab3e0619bc..1f64f707744c 100644
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
@@ -683,11 +697,11 @@ static int dcdbas_probe(struct platform_device *dev)
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
 
@@ -695,12 +709,22 @@ static int dcdbas_probe(struct platform_device *dev)
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
@@ -749,22 +773,6 @@ static int __init dcdbas_init(void)
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

