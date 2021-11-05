Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE1AC433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 21:28:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57A4361159
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Nov 2021 21:28:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233876AbhKEVbJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Nov 2021 17:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232771AbhKEVbJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 17:31:09 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 302E6C061570
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Nov 2021 14:28:29 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id o12so8419247qtv.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Nov 2021 14:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gxIUf/B3N4aGGQUAMZHbQRCyO8Uzdu2r5wmZjCrSyg0=;
        b=L1eS+i4oKuVI5Q1uem7KkM3uw6ruSey2ogCweNsogV1NCmM1EgSU6Ed8N1xt5PnB/4
         XxN0Iwx/QxhK6/9Bp6gBzzChhpCJTvp8zsyNLBVpXoeE6KCTBfcJ/xTrXi9W1fCNLkx2
         tZDe31haI4Yge0wZajTw3WV5axnLouyVC/5cpFIx1s/ByJV2U7BQXy/vmy2tf9KBMjZn
         GP5ulmNcj5ogpVTqYBMZvr/bKthnjloH66OPOdBGfk/vtxdwr2IzeaTRR+MlOs1EBtJB
         deDjsWbv48fjj9GC4y03dnARDMKrlklQ8BiZ8NGwnkuzUCe6mUjYjKD+WXtEqlzvOrIO
         2bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gxIUf/B3N4aGGQUAMZHbQRCyO8Uzdu2r5wmZjCrSyg0=;
        b=rLFMDvBDk7U0weI/j7UfIUc+D9eq27MZ+Dexkuvte6LCiuVeg+P6+Lz/reE6O8zZIf
         VOTOmJLqYOog5DEIDcCOJPs3vx0SiQ3cXzaSoRSh91pT+LKnS4oHOM9bznvnd5zmqXY/
         rqfJol0/f1Mc15PaI01k3kQRH/SbBLwOJSnI9Xl3t04O1eN/Hvy9+R02nVNxVu/k/Vk2
         pGetFnxD7K6Istoze8ZmpDVK/uJ5WcbkbEfpjnxUMBPhL/2nRpRCN9bG8tM9CNSuHOIR
         VgKa7eBibWphVfxhy7p/gWsME2OyWQ2g0ShbFR1DyWN/pfb8vxqqD4jdEhvt9xZoU3v8
         7AqQ==
X-Gm-Message-State: AOAM530xamqDuZECkDdsJbJ7aV968y1kSRKPYJVf+VmDX7eZv7VO5hqE
        Q8n8soHIXIJxizypeFg/ZKS6gw==
X-Google-Smtp-Source: ABdhPJwYBeSyDO3JGC+Sc9jq/t4j69Yuj7HadpAAHp4OHQi2KcqG3CfMMkpuf2MJEAp+wynaZw4gng==
X-Received: by 2002:ac8:1e9e:: with SMTP id c30mr64933163qtm.238.1636147708412;
        Fri, 05 Nov 2021 14:28:28 -0700 (PDT)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id d129sm5815706qkf.136.2021.11.05.14.28.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 14:28:28 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH 5/5] Show in sysfs if a memory node is able to do encryption
Date:   Fri,  5 Nov 2021 18:27:24 -0300
Message-Id: <20211105212724.2640-6-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
References: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show in each node in sysfs if its memory is able to do hardware memory
encryption, ie. if all its memory is marked with EFI_MEMORY_CPU_CRYPTO
in the EFI memory map.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 Documentation/ABI/testing/sysfs-devices-node | 10 ++++++++++
 drivers/base/node.c                          | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node

diff --git a/Documentation/ABI/testing/sysfs-devices-node b/Documentation/ABI/testing/sysfs-devices-node
new file mode 100644
index 000000000000..ab46fdd3f6a8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-node
@@ -0,0 +1,10 @@
+What:		/sys/devices/system/node/nodeX/crypto_capable
+Date:		October 2021
+Contact:	Martin Fernandez <martin.fernandez@eclypsium.com>
+Users:		fwupd
+Description:
+		This value is 1 if all system memory in this node is
+		marked with EFI_MEMORY_CPU_CRYPTO, indicating that the
+		system memory is capable of being protected with the
+		CPU’s memory cryptographic capabilities. It is 0
+		otherwise.
\ No newline at end of file
diff --git a/drivers/base/node.c b/drivers/base/node.c
index c56d34f8158f..4e6ef86f4523 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -560,11 +560,21 @@ static ssize_t node_read_distance(struct device *dev,
 }
 static DEVICE_ATTR(distance, 0444, node_read_distance, NULL);
 
+static ssize_t crypto_capable_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct pglist_data *pgdat = NODE_DATA(dev->id);
+
+	return sysfs_emit(buf, "%d\n", pgdat->crypto_capable);
+}
+static DEVICE_ATTR_RO(crypto_capable);
+
 static struct attribute *node_dev_attrs[] = {
 	&dev_attr_meminfo.attr,
 	&dev_attr_numastat.attr,
 	&dev_attr_distance.attr,
 	&dev_attr_vmstat.attr,
+	&dev_attr_crypto_capable.attr,
 	NULL
 };
 
-- 
2.30.2

