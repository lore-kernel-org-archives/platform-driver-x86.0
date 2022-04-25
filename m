Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A4B6C433FE
	for <platform-driver-x86@archiver.kernel.org>; Mon, 25 Apr 2022 17:17:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243921AbiDYRUJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 25 Apr 2022 13:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243981AbiDYRTr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Apr 2022 13:19:47 -0400
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A57C12B27C
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:16:38 -0700 (PDT)
Received: by mail-oi1-x22d.google.com with SMTP id m11so7045962oib.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 25 Apr 2022 10:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dBhJQBFFy4Ceg8cAsnJhQlAVWnX2jFGl2toK7LYg2vI=;
        b=ZUI1SW0LDagU7wptgLkLAyo11l74Ya3MsuwD1LvUoGpHB7JFCD9eGwk+TPuFbsg94J
         1/2jlCIpJxuoSUuRE77FpuY8ivlJycTuspgiLAQKEm++YBdSPzIgc1bCHwvyU3bM1OIx
         QVQlUy6mpNLw/RH+old6c5hmH0AGxCuRDi6JZa0UvmfRHrSkPnUMz3ibircJSgTzvhqv
         vzyJoGr57dosEvqOjyqJIo0/ae+ilr8gmRG4Nybz3RfmwCFa0D2hnsmc/RJNg/8pRgkF
         kbG9O8mJJfwfTK2t76xzeoPxWz1lE+4Zb2NHMLo5de+3pUBSoQI789poPU5L2Sskqw9r
         QDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dBhJQBFFy4Ceg8cAsnJhQlAVWnX2jFGl2toK7LYg2vI=;
        b=0QbbJf1Qc9wwGa2xRFFnCQ2nYhbEnDttdlulUWJ4uAZXYiowmlFWvN2zhksMEk4/CW
         ciTE169VVhU1/WyeHYW3patikkNO3UzlmPBkciJbNUCAH2oOcIdrnynV074eiMh3qyvq
         Xm0srVIM/Siqj1Z69q5rU4N4s28SPSMddg/sIx9uRYPRu5gaag5MRgIxdoE+iMSwDKxb
         NcM9XnAisVS7MhcgBMKNG/zrTauYEZDPSuRhborRJ7MqajfW6/DBINjFATNY7HYPz692
         NC666Zv83OmjssJ+N/mCld8KuEbBC68GtbnFUMiI32Z6XLPbfcKZLSVD1mJzJ2RIqRXY
         LA7Q==
X-Gm-Message-State: AOAM530vFz3wXTWwBWFDLmNI1SjHf8+mMwOP5aB3uz9b2c81RFIFdV/I
        LHbJdheQ6gUMTYkQbz+SaLQxYpELmW+HpxnP
X-Google-Smtp-Source: ABdhPJw2CA5OnWQr+1gbJ1Fj/HVda/dNTu+4D8Lx2yhRTTRMdTF6nMZAB44F7+DCfcQSISEqTGmGkw==
X-Received: by 2002:a54:4d86:0:b0:324:ecc3:fd02 with SMTP id y6-20020a544d86000000b00324ecc3fd02mr7359683oix.243.1650906997950;
        Mon, 25 Apr 2022 10:16:37 -0700 (PDT)
Received: from localhost ([181.97.174.128])
        by smtp.gmail.com with ESMTPSA id fz13-20020a056870ed8d00b000e593f1f26fsm3441269oab.18.2022.04.25.10.16.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 10:16:37 -0700 (PDT)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v7 8/8] drivers/node: Show in sysfs node's crypto capabilities
Date:   Mon, 25 Apr 2022 14:15:26 -0300
Message-Id: <20220425171526.44925-9-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
References: <20220425171526.44925-1-martin.fernandez@eclypsium.com>
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
index 000000000000..5fd5dc7fc2eb
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-node
@@ -0,0 +1,10 @@
+What:		/sys/devices/system/node/nodeX/crypto_capable
+Date:		April 2022
+Contact:	Martin Fernandez <martin.fernandez@eclypsium.com>
+Users:		fwupd (https://fwupd.org)
+Description:
+		This value is 1 if all system memory in this node is
+		marked with EFI_MEMORY_CPU_CRYPTO, indicating that the
+		system memory is capable of being protected with the
+		CPU’s memory cryptographic capabilities. It is 0
+		otherwise.
\ No newline at end of file
diff --git a/drivers/base/node.c b/drivers/base/node.c
index ec8bb24a5a22..1df15ea03c27 100644
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

