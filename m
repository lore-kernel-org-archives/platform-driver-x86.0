Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADADDEE14C7
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Sep 2023 18:09:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243747AbjIFSJ5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Sep 2023 14:09:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjIFSJy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Sep 2023 14:09:54 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C06B610F7
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 Sep 2023 11:09:50 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1c0c6d4d650so903245ad.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Sep 2023 11:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694023790; x=1694628590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4wi6bhruWz0hbXHukGopFEWiMps+cu8JOpx7s5KKUhM=;
        b=hYau4/nUz5iYqd5W7Lj14r5dMlAYeqsITBKXdHZLNSG+82MGmLXvcE+458iJ+JH7oi
         aoU+66bn6yw+JaPcXej1plpvtQaTLUI3sW/sIpuO6gjXM02xmiuJaqwWfUqMHI45GQZd
         fM4MgOHCXVOBcHjG02SBO+erWI7DAr1QLyxTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694023790; x=1694628590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4wi6bhruWz0hbXHukGopFEWiMps+cu8JOpx7s5KKUhM=;
        b=jxLvGebUkO94glvtOT4cYnhWsYq5pT7URSgpHlewLNaRwLPeNwIC+vJoG0y33OqMK1
         FtMI2EYE92SmZ1bcF9wrc5whvn4NAvBiYZv90F9CDGiqRepy55golvNF/zI/9bJqSC4w
         KrUiNq6kK4guV8s1zWLXu/n3A2P1Q4FMdfLSxYZgnfMq8fvGAbRbAwYbdVtC/1w0UkRC
         SP18mYPpnkcQVXno0TfMN0okkPk2qXy4tJOP45FqAiyHlQIW51nSysQ9R55mpaA+46df
         2DGZUDDXULq8nDcEDujkEO4T2FUqNQ3vrneI4L/BxbnOwA3URyZ/T1sNoceU1+lauXTw
         BrTg==
X-Gm-Message-State: AOJu0YxR9TI8f7NC7zkJKfjRqcnr3RZ/YqP8Nqh/AQyZvdQHX9XgW+By
        adzEGVE5tzJNqhU0oaA/EB3TNQ==
X-Google-Smtp-Source: AGHT+IGRoSyy5prcv7s6aCNDx4HYofOxt/2GfTUCB8Kos+5pU7v9KRLevtDFB4w6cibWsZB6VVxy4A==
X-Received: by 2002:a17:902:e5c3:b0:1c3:52ed:1905 with SMTP id u3-20020a170902e5c300b001c352ed1905mr6467512plf.28.1694023790329;
        Wed, 06 Sep 2023 11:09:50 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:a404:ed4a:5a1e:3b4a])
        by smtp.gmail.com with ESMTPSA id ix5-20020a170902f80500b001bc675068e2sm11363996plb.111.2023.09.06.11.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 11:09:49 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Subject: [PATCH v2 3/3] platform/x86: intel_scu_ipc: Fail IPC send if still busy
Date:   Wed,  6 Sep 2023 11:09:43 -0700
Message-ID: <20230906180944.2197111-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230906180944.2197111-1-swboyd@chromium.org>
References: <20230906180944.2197111-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It's possible for interrupts to get significantly delayed to the point
that callers of intel_scu_ipc_dev_command() and friends can call the
function once, hit a timeout, and call it again while the interrupt
still hasn't been processed. This driver will get seriously confused if
the interrupt is finally processed after the second IPC has been sent
with ipc_command(). It won't know which IPC has been completed. This
could be quite disastrous if calling code assumes something has happened
upon return from intel_scu_ipc_dev_simple_command() when it actually
hasn't.

Let's avoid this scenario by simply returning -EBUSY in this case.
Hopefully higher layers will know to back off or fail gracefully when
this happens. It's all highly unlikely anyway, but it's better to be
correct here as we have no way to know which IPC the status register is
telling us about if we send a second IPC while the previous IPC is still
processing.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Fixes: ed12f295bfd5 ("ipc: Added support for IPC interrupt mode")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 3cea701d2bbd..8be24f48a0fa 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -271,6 +271,19 @@ static int intel_scu_ipc_check_status(struct intel_scu_ipc_dev *scu)
 	return scu->irq > 0 ? ipc_wait_for_interrupt(scu) : busy_loop(scu);
 }
 
+static int intel_scu_ipc_busy(struct intel_scu_ipc_dev *scu)
+{
+	u8 status;
+
+	status = ipc_read_status(scu);
+	if (status & IPC_STATUS_BUSY) {
+		dev_dbg(&scu->dev, "device is busy\n");
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
 /* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
 static int pwr_reg_rdwr(struct intel_scu_ipc_dev *scu, u16 *addr, u8 *data,
 			u32 count, u32 op, u32 id)
@@ -290,6 +303,11 @@ static int pwr_reg_rdwr(struct intel_scu_ipc_dev *scu, u16 *addr, u8 *data,
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
+	err = intel_scu_ipc_busy(scu);
+	if (err) {
+		mutex_unlock(&ipclock);
+		return err;
+	}
 
 	for (nc = 0; nc < count; nc++, offset += 2) {
 		cbuf[offset] = addr[nc];
@@ -450,6 +468,12 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
 		return -ENODEV;
 	}
 	scu = ipcdev;
+	err = intel_scu_ipc_busy(scu);
+	if (err) {
+		mutex_unlock(&ipclock);
+		return err;
+	}
+
 	cmdval = sub << 12 | cmd;
 	ipc_command(scu, cmdval);
 	err = intel_scu_ipc_check_status(scu);
@@ -495,6 +519,11 @@ int intel_scu_ipc_dev_command_with_size(struct intel_scu_ipc_dev *scu, int cmd,
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
+	err = intel_scu_ipc_busy(scu);
+	if (err) {
+		mutex_unlock(&ipclock);
+		return err;
+	}
 
 	memcpy(inbuf, in, inlen);
 	for (i = 0; i < inbuflen; i++)
-- 
https://chromeos.dev

