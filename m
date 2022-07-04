Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8D7C43334
	for <platform-driver-x86@archiver.kernel.org>; Mon,  4 Jul 2022 14:00:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbiGDOAc (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 4 Jul 2022 10:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234550AbiGDOAB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 Jul 2022 10:00:01 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C527E099
        for <platform-driver-x86@vger.kernel.org>; Mon,  4 Jul 2022 06:59:48 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id o190so9105637vsc.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 04 Jul 2022 06:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hiQZs7RQJ57Y3iMEvjKPq7apwG47z8xfODnJPhnyEtM=;
        b=h0cx2J376VdMDKbdnNSudAZQFU5bNAb+af1nsukIB0ohm1yOAPCujoxEhD9RXdrsTN
         59gWNY7oIZmpnuoyFxH0Lfsl2dJloyzrktCOwSAhx/pcUBpqAhwobasrepx8jaNSG5IB
         +3V+Cz/MOtaMXMEN5TEaTQPabi0feo2LWbZUM09F5pJcBvlR9ydj4wefZ1gUCoZ/Kj3d
         6Zk5liSBxCrOnBdnuOagWCvacvfTLNkQFDUyGttjpU3agSg/uS+wBYUlyl0jI+GWDtdB
         7y3rJJBNyXJ0bQlJkj2s+b4F6h4T+dammjL6tWPz3wX8lhSw7YKSuZK8HHmrFpWUNLAO
         TyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hiQZs7RQJ57Y3iMEvjKPq7apwG47z8xfODnJPhnyEtM=;
        b=I0g7U99Ic3VDVqMKdKd0QNAxP8cig8tODSBkLDX8YHWhToyK5osfau7JylgsJHf92B
         za0la9XFh3AlrJTvEVfSjOoYxqKBWRv24Qxli+ro191EAms6pLcQIeNKCBJKeOYX//uD
         4gvCqpAR1CfswRWMqWrFZjk/pihEclgrNHSt5e/OZX+6k5Zf8+LUi07We9EnIu68rpGp
         cjOv8EmeWENfq+TN2YpOElVJE614oBhvZv+w2mj3EkgbXye8z4j/oaoOC8wCDs2k+kRT
         AxtfLKJ44gYxW781adbXMe/vIxWeeUlEQKgDE7xqg3w+9hkcPtwxh3X1hODu3LWw2CJY
         iDBw==
X-Gm-Message-State: AJIora8/SxmKULC1w8h/qZcDf6PzJErqEyR51xdsoqW/ZM8A4P1i1kjk
        XnM36jpxI1m3E63gLJN8hVFpDQ==
X-Google-Smtp-Source: AGRyM1tZA+RFAUNVohbAzEyn5WDlKTAd76W0duJR+JCRJSy8RhT4D5c7wIBcLsYpIxHYYEOGInbcGg==
X-Received: by 2002:a67:f142:0:b0:356:3251:e53d with SMTP id t2-20020a67f142000000b003563251e53dmr16561722vsm.40.1656943187638;
        Mon, 04 Jul 2022 06:59:47 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id p25-20020ab06259000000b00382b14a73afsm311704uao.30.2022.07.04.06.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 06:59:47 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v9 9/9] drivers/node: Show in sysfs node's crypto capabilities
Date:   Mon,  4 Jul 2022 10:58:33 -0300
Message-Id: <20220704135833.1496303-10-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220704135833.1496303-1-martin.fernandez@eclypsium.com>
References: <20220704135833.1496303-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show in each node in sysfs if its memory is able to do be encrypted by
the CPU; on EFI systems: if all its memory is marked with
EFI_MEMORY_CPU_CRYPTO in the EFI memory map.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 Documentation/ABI/testing/sysfs-devices-node | 10 ++++++++++
 drivers/base/node.c                          | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node

diff --git a/Documentation/ABI/testing/sysfs-devices-node b/Documentation/ABI/testing/sysfs-devices-node
new file mode 100644
index 000000000000..0e95420bd7c5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-node
@@ -0,0 +1,10 @@
+What:		/sys/devices/system/node/nodeX/crypto_capable
+Date:		April 2022
+Contact:	Martin Fernandez <martin.fernandez@eclypsium.com>
+Users:		fwupd (https://fwupd.org)
+Description:
+		This value is 1 if all system memory in this node is
+		capable of being protected with the CPU's memory
+		cryptographic capabilities.  It is 0 otherwise.
+		On EFI systems the node will be marked with
+		EFI_MEMORY_CPU_CRYPTO.
\ No newline at end of file
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 0ac6376ef7a1..f081fa48c8e6 100644
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

