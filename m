Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637106;
	b=zYpKvlDjpw2vbqW/iiKNRRXxiqJMVO9Zem9KRUuM3IQIYQDPIUbhyBqdoYUQXhtn6InW
	 micunpALKeGArsfkJy5nssxW++EkZgxbov6a2VGJl7t8fo3lLykwHAHNnEGra3rrh6yIU
	 kZsJIttmAcKM2aI4HnsAKBvNYJClGsnVCjQveEBcjlAx0/wpI4eLr1w/MnM/9A4eJCQGy
	 1qzxEvuV0EyyKPnuNGJtUwhHD7shuE9YIGpo0hTS8GOr/a2LhPNmmPPaCOU2sYD4sf0M6
	 tETIaPVuBSUBSYyVt2HI03IpBjVLycBFVGxBQUrMEkuYYG94yKA/0T/cU0nsfh7loDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637106;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AxskKNP+ExdUYEUD63I7VLyUC4k6M7995NGPwwt3jQk=;
	b=hkaznqPOo79xxDz/0o8cTd/04ZAED7ilu7mYxdyfP0h/vJdIZeDJ0X6fDlj66GMOkmqx
	 vWis5nnKL0DapWXMGYgesBr/+q2MfsVSbWL9TvwYD7ePiNEn5HuNWDsYhtw3FKBtDIV9W
	 ylxmiUxjcZArTIyIa4ooaEdJy9TPRqpUpWhjKVIKjAgs+labHfmkZ8Bn9fjhFD+qNOFa2
	 8IhHgoFKW1NYr5/M0a6DsTWK13VxLGkRh/Yo8x3xzpZXEHZpIU+95G9m9GT472EP4INMj
	 LPKm9Eau2pkMd+AiptE050Kjq5G75IWUJXXhe4m1FDW5kVSfuQHr3gDhh0hvWmnVEtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tC2CzwL1;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F9D606A8AD
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 06:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F9D606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tC2CzwL1
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so5013556eec.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Nov 2026 22:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637105; x=1795241905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AxskKNP+ExdUYEUD63I7VLyUC4k6M7995NGPwwt3jQk=;
        b=tC2CzwL1wbsLhsyBcqeHOIQJ91lXU+h1uYgDG8Ce+9Vnq88UOinJhb5EmDdZF75JYo
         j9sKnhwU6r7GcQPqGXaL8819LfMEZmt2GmIE9+NlVBLiUpAbQaSoKbwTxTaeiYg0dG8F
         Zs5DpZvbLsCa4AtxqfV6XJgEwoh8JAZGwpBuREjPz8jnTXkcb7zYEr6h86qn+NEZp+WQ
         9Bpr4PrurQJRczELvlxQuVVVYiKIkaonT524kHx2xt2AhOc6rii0lPA/dl1m6EP8pbhg
         ud3kgSKaXnf9I6KZrLzouWz4eJTAdSbRhjBjj0AkX2ZtEoXBJyX/7YF5AT63z/T+mK44
         +5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637105; x=1795241905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AxskKNP+ExdUYEUD63I7VLyUC4k6M7995NGPwwt3jQk=;
        b=Z99TySBDxL4Ci3e6fW4ivjS6sE1RXjnFvR2QNWUKaEduUPp0LjMth2L7Bvnwxaht5l
         WOqmncIyjkXQapDRNvDe4hbvAkqwORLVFIRLCfk+yaxPBHarZlF8IaTQIdOrsHW1FteU
         kG6T2C3lrJcMRf+YoINMZw3dkTSqwe3qHSNHbTMF22kMiajqLNhrXepZBsDQmXMmY1ec
         mlTfTZIFwM1VHOOQh2Xg9SCtlHwlEHSkJTkmBW5I9zhTEBcOBHklzKD12mpAy3iQsstF
         Jy+ABJ6t5lURdE1WJotgb1fX295XBR12qFKeTLj/cuLMwFsq0kMNBLy5RqIxDpw/FkRM
         v16g==
X-Gm-Message-State: APuU4Z9aaGUsZpvfmHe6grisl8BUedl4eYAOLMFsrHMR1wxOdfuDDmvW
	rSJxP5GjCN0/Nm/DzzFZmS7d3BYjfwUi1gZ4Bp6IV1cf0nmFBJYT3Pxe
X-Gm-Gg: AYBFou0M5ylCG3NlqHNIfqnH2+FkvgDwjL/9fOaADnNJ15jqsR+jBTOI08HzmrozEfO
	Qt4IUKh1EE3j1JV+co13yH4FgHEgJbCtG4VZVOe1TGJTVuMa+a1eEe805iVAZvyggP6phAiTzNX
	79TS45TFTPM5zGvstK2CljJLdZv6T0AlIgQZ6OmXMFetvoUdrG3JpgrSZ/VvKFqLLLQEUl5umrx
	Xy3Ao/FvHSmEphs8VS0RFdyCAjhdY2axwJGChJvQxLTS33qYw9YgMlhBWh4PnNT050AzRnVs0pt
	fcuo5xwsuu39+pGVD77yxOESrmlWB/38zXWGK3ediRC/a1gT9AV48MPm8sAxTH8kAMQ0/o0SB7H
	xvzrZYOjYaiLiL8ep0t197nYKNwxkPyuaBzvfzPOylW9406Irvi6QPCeJ8xnLm9Vp8ruw96+sv5
	kyziDtY1LIYMvvkXRWBfFZE/7xUq+ZvSl7HOdxAfBxU8fBFxgeTvSftB05Q3a9UA9j7+3HkwN2w
	xatce+uAU78d+IFfz0nsw3sQQ7urqsd/1jpl7h4uXo2VwLgLicYhdkqHGwKGpNioPyepSBKs3A3
	hPZktOIbrx0u3crWtZ0nPh3vUw/yqqdpelfrluRll7aiBZCCDNkArBCK19tdR0iC/ZCWRMrqCFJ
	Ze27k5GhHEPWaOe+SjMJmbimBcz5oO0mUDnW/B4gVDT83WC5kEkRSvBLbvfuL1QuOq/tHsGy4Je
	5adQ==
X-Received: by 2002:a05:7300:680e:b0:369:21a:dcca with SMTP id 5a478bee46e88-37966387e53mr4560423eec.10.1794637104930;
        Fri, 13 Nov 2026 22:18:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:24 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] platform/x86: dell: dcdbas: Release the SMI buffer in remove
Date: Fri, 13 Nov 2026 22:17:56 -0800
Message-ID: <a486b9714c8e58761e6368e7d75169441ce87e96.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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
 drivers/platform/x86/dell/dcdbas.c | 46 ++++++++++++++++++------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 601ee8ca92e4..d5a93aca9c93 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -98,6 +98,22 @@ static void smi_data_buf_free(void)
 	dcdbas_smi_free(&smi_buf);
 }
 
+/**
+ * dcdbas_release_buffer: free the SMI data buffer or unmap the WSMT one
+ */
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
@@ -685,11 +701,11 @@ static int dcdbas_probe(struct platform_device *dev)
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
 
@@ -697,12 +713,22 @@ static int dcdbas_probe(struct platform_device *dev)
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
@@ -751,22 +777,6 @@ static int __init dcdbas_init(void)
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
2.56.0

