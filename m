Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2F4BC433F5
	for <platform-driver-x86@archiver.kernel.org>; Wed, 24 Nov 2021 20:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbhKXUjj (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 24 Nov 2021 15:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237117AbhKXUji (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Nov 2021 15:39:38 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F02DC061574
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:36:28 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id j14so7695070uan.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Nov 2021 12:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a0bmQaOoWIKx1kavxDMlDEybQyi0u9rYz3ceRUr9+6k=;
        b=GXpulxUj/NTga06qjAE3HAjBWugm4oEzvW5KpfiAJvK6BjAZFCdV0CgjcB63DmEMHE
         E+dopXfEybcehbx/aOprHRE+ktamblL+WWYge6sP3tdkSKbK8Do14ykXWh5Ra+OURbwW
         KMGSRf0D8RIbTUOeEUjIoDMnt5YaOfEC6aXa2XwnWaLgujtezW0W4ltSpQ9OP1Rpzm2j
         LeT3Y7HCpscglgNU60UIZisIp5NqmxxLaJDBDNe/B0g85VFCCqN5238L4jhygqH5VZEh
         6QEOyMGoCLfB39NSPrMeFGEevI07bksUFAORTDZ+fO5iBhHuCP+/dB+329koc2bR35C2
         k+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a0bmQaOoWIKx1kavxDMlDEybQyi0u9rYz3ceRUr9+6k=;
        b=TnzoSAYNrVj5xaIo1d1q0sArRYu3rxN8QrOyRZtI+I97tD8aAEtJmAAM8UbTjbYE5k
         uUGq2WZ0M1Ew1YJP/9WXrw//bs8ybsqXzLGu8UBSiA+QiXjRN0iHlXctxo5UKC0EdpXn
         aaEPlOJvvd8WRxNK/IRDmsakbqFnJUo+/iZOH0ThZ2DFlaI19hfITnjR3Yp2ZJtdarZ2
         Zmg4nJtjLKHvPTT7qNfj6MMwqsnCgMvwdbpA6Ul8Hlr2TH97rA1OmrnGanLH+0pOE8JH
         I9fqaIXRRN9NLJDk3HldeEIhWq9ohEXwQY15pmkyrcdxS5qloIHCm9CNMAT8bCX0gSoT
         3e5A==
X-Gm-Message-State: AOAM531eKY2/a11hobRCA2weVQor4HQ/25QAt6BC0vIDrwewhY1K/KLK
        n7tk3KYdfvPgpdfh1pa9Get3WA==
X-Google-Smtp-Source: ABdhPJwnwownuw1qWugehWIJfRfCAs5vic5yWR6x7sRWk1I0s28pWe14YmN8T1VHJJPqK28xF5g/7w==
X-Received: by 2002:a9f:3e43:: with SMTP id c3mr15227660uaj.29.1637786187676;
        Wed, 24 Nov 2021 12:36:27 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id q20sm616962uae.17.2021.11.24.12.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Nov 2021 12:36:27 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v2 5/5] drivers/node: Show in sysfs node's crypto capabilities
Date:   Wed, 24 Nov 2021 17:34:59 -0300
Message-Id: <20211124203459.4578-6-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
References: <20211124203459.4578-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show in each node in sysfs if its memory is able to do be encrypted by
the CPU, ie. if all its memory is marked with EFI_MEMORY_CPU_CRYPTO in
the EFI memory map.

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

