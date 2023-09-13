Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8C9EE0204
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Sep 2023 21:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232545AbjIMV1h (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 17:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232406AbjIMV1g (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 17:27:36 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9110C1996
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 14:27:31 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-51b4ef5378bso188766a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 14:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694640451; x=1695245251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/wc8HkItTPJiIGmBh6ydt0pRRoKMzvmGRq2mSNptlY=;
        b=fF7HMN3KdU2SukU5x66c5UGp8hAb6HIIdQyYqzgs7JSV4wzNW/+ih11xKYI+iC9RLv
         hmHT/1UIJbkD79TkZSeuIQp9aDCAMI7dUQnik+JPyuw71pXKx0+94pR/FhaISepou0Kk
         8BxJo3bTchjg4DLgxixeA9lXn0qOZYXI20R6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694640451; x=1695245251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/wc8HkItTPJiIGmBh6ydt0pRRoKMzvmGRq2mSNptlY=;
        b=N/pS8NFz+ygFKe7GG5KFr/bfq/CMTwt1g35w8SuEwj7Hw5gGG41ifbxp/Z6S0TStM5
         ZdbfHU1peUYIXJI90K5KCJ9iOYnhgxxkBvFvG6TXSe6j0AaTEKh0TJHbaCNRXLtZ8SyV
         Hs8QSTnlPv3Vwv+plS2w82koPhuLm2RtvLzfQ7Jz0N+fhdx0QCL2ACtszWGIRzwwlGkM
         fR/8Jgr+GCMf54hnVEipFuYy1hN6Qm25FcX6GWSKyEohrUy7Bc0czoUPWUb9/uY9R1jN
         9dSUqYEgANU3S0Rvqtz9mmqlQ7RzcLjrPPjfogJytdQ5bfhdUTSfqsXXtJuAY+5Xgm8L
         jJwQ==
X-Gm-Message-State: AOJu0YzsaQCma6Q2f7a97TfR34OA6Rc5T610mpAklyUpbGFKKa6Jp+pl
        llNIhjwVLxhdbl/8DmFypgIM1w==
X-Google-Smtp-Source: AGHT+IHm0OGkEzrdNohUUUOckuJKxRgfCh2mx2y/pIINxq8HCns3limX90AeFbPOw2bqURkm6q6NcQ==
X-Received: by 2002:a17:90b:4a88:b0:262:f449:4497 with SMTP id lp8-20020a17090b4a8800b00262f4494497mr3595415pjb.2.1694640451077;
        Wed, 13 Sep 2023 14:27:31 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:ae97:c6dc:1d98:494f])
        by smtp.gmail.com with ESMTPSA id a10-20020a17090ad80a00b0025bdc3454c6sm1923976pjv.8.2023.09.13.14.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 14:27:30 -0700 (PDT)
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
Subject: [PATCH v4 4/4] platform/x86: intel_scu_ipc: Fail IPC send if still busy
Date:   Wed, 13 Sep 2023 14:27:22 -0700
Message-ID: <20230913212723.3055315-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230913212723.3055315-1-swboyd@chromium.org>
References: <20230913212723.3055315-1-swboyd@chromium.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Fixes: ed12f295bfd5 ("ipc: Added support for IPC interrupt mode")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 40 +++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 3271f81a9c00..a68df4133403 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -265,6 +265,24 @@ static int intel_scu_ipc_check_status(struct intel_scu_ipc_dev *scu)
 	return scu->irq > 0 ? ipc_wait_for_interrupt(scu) : busy_loop(scu);
 }
 
+static struct intel_scu_ipc_dev *intel_scu_ipc_get(struct intel_scu_ipc_dev *scu)
+{
+	u8 status;
+
+	if (!scu)
+		scu = ipcdev;
+	if (!scu)
+		return ERR_PTR(-ENODEV);
+
+	status = ipc_read_status(scu);
+	if (status & IPC_STATUS_BUSY) {
+		dev_dbg(&scu->dev, "device is busy\n");
+		return ERR_PTR(-EBUSY);
+	}
+
+	return scu;
+}
+
 /* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
 static int pwr_reg_rdwr(struct intel_scu_ipc_dev *scu, u16 *addr, u8 *data,
 			u32 count, u32 op, u32 id)
@@ -278,11 +296,10 @@ static int pwr_reg_rdwr(struct intel_scu_ipc_dev *scu, u16 *addr, u8 *data,
 	memset(cbuf, 0, sizeof(cbuf));
 
 	mutex_lock(&ipclock);
-	if (!scu)
-		scu = ipcdev;
-	if (!scu) {
+	scu = intel_scu_ipc_get(scu);
+	if (IS_ERR(scu)) {
 		mutex_unlock(&ipclock);
-		return -ENODEV;
+		return PTR_ERR(scu);
 	}
 
 	for (nc = 0; nc < count; nc++, offset += 2) {
@@ -437,12 +454,12 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
 	int err;
 
 	mutex_lock(&ipclock);
-	if (!scu)
-		scu = ipcdev;
-	if (!scu) {
+	scu = intel_scu_ipc_get(scu);
+	if (IS_ERR(scu)) {
 		mutex_unlock(&ipclock);
-		return -ENODEV;
+		return PTR_ERR(scu);
 	}
+
 	cmdval = sub << 12 | cmd;
 	ipc_command(scu, cmdval);
 	err = intel_scu_ipc_check_status(scu);
@@ -482,11 +499,10 @@ int intel_scu_ipc_dev_command_with_size(struct intel_scu_ipc_dev *scu, int cmd,
 		return -EINVAL;
 
 	mutex_lock(&ipclock);
-	if (!scu)
-		scu = ipcdev;
-	if (!scu) {
+	scu = intel_scu_ipc_get(scu);
+	if (IS_ERR(scu)) {
 		mutex_unlock(&ipclock);
-		return -ENODEV;
+		return PTR_ERR(scu);
 	}
 
 	memcpy(inbuf, in, inlen);
-- 
https://chromeos.dev

