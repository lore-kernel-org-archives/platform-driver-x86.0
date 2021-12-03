Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABF53C433FE
	for <platform-driver-x86@archiver.kernel.org>; Fri,  3 Dec 2021 19:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382874AbhLCT0t (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 3 Dec 2021 14:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382870AbhLCT0t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Dec 2021 14:26:49 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA61CC061751
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Dec 2021 11:23:24 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id v22so4364861qtx.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Dec 2021 11:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/NfeKYIAhkUIAZJtgd6awxwNqUewAop8qMlhPdQIiw=;
        b=F+bvJUItKNdS/eTxqRFsYTDexgXI/WlDljElOv5rZ1FqdzNd6az6Wp/czLZQdFLjOD
         lHvZsZgt6E9hU7LI+B65d2ZU+suiM3hcuriSpE6E0LWvX8I0KAqfUtq/36ZvRlMgeIdK
         3HfXFp5U+I6bslWX14LrDiOGVY7iEOjiF9LGHcOZib7XLql84nyPoykoceLbod734csg
         qd8vcajozXjJ+y83I7VW8TYvAzqBnrbf/+9VM93/n0R5Ds7xq1TTKlnKYm0bmwtUS7aj
         LOGUV6d0skEhoIPsXCilztMkKXECKdNDMqcLyrI/RJxormDDNBCcpxBVZXQqzCK3vEGH
         qUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/NfeKYIAhkUIAZJtgd6awxwNqUewAop8qMlhPdQIiw=;
        b=TxuWXw/oS9P7XAc2xFBmb4DtSkfrig1urCPKs3FJOAZMS2/dtzA/EMFMh7TGdx7t2+
         53qr80dZ4zFw6lqzdefjlzz4phzgAPUAZAGpQ4j2lI9xo+QIi3opyUaAX+UUWJvzt56C
         VHn3aEux5hPXV01xGpK+TY+PQbZog6x1OdlyJv6MYESgkPrf6UN3t59Sb+CxBg5V8ivD
         NubMd4VbRGB3Es4+m6+NjzFBP3hyd6KCULY4LvQGMu3h9HYSbRqlcaiTNLrxcMxZ5v9X
         SrCzco34IPt8VE/Z5tbdr517hWMkyb6X+/+pulIgwbFy7lZLXo7nZfYO0YeHq8TVAmkd
         UpCQ==
X-Gm-Message-State: AOAM532QcfJAAXa4+Ol5/w9ynOMNsg9uXU8JTHTrjk0+sVZcQ4SHdyMg
        sA6sxkJjPnNB0DQowVYRLRXG4w==
X-Google-Smtp-Source: ABdhPJwnDlYpqgkf/Sf5zgNg//Uz5Zqh1xUeIEbLhDHGR1sxM6ZGnX3ghbkytQe24N4WA113II3Buw==
X-Received: by 2002:a05:622a:1a04:: with SMTP id f4mr23050973qtb.476.1638559404100;
        Fri, 03 Dec 2021 11:23:24 -0800 (PST)
Received: from localhost (7-153-16-190.fibertel.com.ar. [190.16.153.7])
        by smtp.gmail.com with ESMTPSA id w10sm3099663qtk.90.2021.12.03.11.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Dec 2021 11:23:23 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v3 5/5] drivers/node: Show in sysfs node's crypto capabilities
Date:   Fri,  3 Dec 2021 16:21:48 -0300
Message-Id: <20211203192148.585399-6-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
References: <20211203192148.585399-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show in each node in sysfs if its memory is able to do be encrypted by
the CPU, ie. if all its memory is marked with EFI_MEMORY_CPU_CRYPTO in
the EFI memory map.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 drivers/base/node.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/base/node.c b/drivers/base/node.c
index b5a4ba18f9f9..67b0e2fa93b1 100644
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

