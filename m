Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C072ECA0EC6
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 22:06:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355738AbjIKWBt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 18:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244225AbjIKTjt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 15:39:49 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77EA618D
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:45 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5778fe9d183so520756a12.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694461185; x=1695065985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iZS9exdhsXGWlwAB3PPHAHPTpMkYjkQ66zHV37ZNnIo=;
        b=VJFdmIKkhv/Q+m+JOoiFKhTBZ+rrK10LCUqGXdzbKbRxyxO8VMsfe8fPD8KOMRWZcf
         vU251VLuJpCuLwTAwx+e6hWYNi3DA5QOlKgv1LHZqM+kzklQD7DMAFRt5+hB4T2AYork
         SLJZF2nasOAcgpLboG144l4aqhJkoSBMSfExM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461185; x=1695065985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZS9exdhsXGWlwAB3PPHAHPTpMkYjkQ66zHV37ZNnIo=;
        b=OzGMsDxufzRPAxojOWWJ0Hb3S54UNsbBmVXLW4TlWWaf+XLhznbTJg40dcp5mP4Ddw
         GRW6fO+bQjqkdE9NDd6nDktgbQfsu9qGVlarDwmlqnNT2AufhSztiQqc8S5WwGcu3+pB
         pDD+pzEU96dKbS6XyJ+fG0EKJ61Vqle5wBMl8PBlXzHMDiRvzcCedxpl7IbPf3LGldyt
         1UJetFBXljPWjorsz4u8WBfvcdYufxhWhhAxkfK8TcHWuY/adieBh2nnQIb0mVSOgKeL
         Ta0BQwGi3S+wHy4oxzGyAwSphGmrtMAdjzzzlyS2k3vroumG/VmkVU6m5wkpP23xdF1I
         lRVA==
X-Gm-Message-State: AOJu0YxcBzcdlQuWj7XDiR23Z799TKMoblvy8hIwXTkMN7hA0uLhGSoR
        cXTyXeoetknALTPpluAx1F68yQ==
X-Google-Smtp-Source: AGHT+IE7TogpeCC/K5uuUl78NkURxmB6xAcGOF09QSqED+BJ2qE4ZV0Dxs2vBHRHl4QM+fNIhII6jQ==
X-Received: by 2002:a17:90b:164e:b0:268:10a3:cea8 with SMTP id il14-20020a17090b164e00b0026810a3cea8mr8146677pjb.9.1694461184937;
        Mon, 11 Sep 2023 12:39:44 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d487:5e33:6656:3711])
        by smtp.gmail.com with ESMTPSA id fu8-20020a17090ad18800b00262e485156esm7736543pjb.57.2023.09.11.12.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:39:44 -0700 (PDT)
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
Subject: [PATCH v3 3/4] platform/x86: intel_scu_ipc: Don't override scu in intel_scu_ipc_dev_simple_command()
Date:   Mon, 11 Sep 2023 12:39:35 -0700
Message-ID: <20230911193937.302552-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230911193937.302552-1-swboyd@chromium.org>
References: <20230911193937.302552-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Andy discovered this bug during patch review. The 'scu' argument to this
function shouldn't be overridden by the function itself. It doesn't make
any sense. Looking at the commit history, we see that commit
f57fa18583f5 ("platform/x86: intel_scu_ipc: Introduce new SCU IPC API")
removed the setting of the scu to ipcdev in other functions, but not
this one. That was an oversight. Remove this line so that we stop
overriding the scu instance that is used by this function.

Reported-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Closes: https://lore.kernel.org/r/ZPjdZ3xNmBEBvNiS@smile.fi.intel.com
Cc: Prashant Malani <pmalani@chromium.org>
Fixes: f57fa18583f5 ("platform/x86: intel_scu_ipc: Introduce new SCU IPC API")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 8be1686e22e9..6958265db29d 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -443,7 +443,6 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
 		mutex_unlock(&ipclock);
 		return -ENODEV;
 	}
-	scu = ipcdev;
 	cmdval = sub << 12 | cmd;
 	ipc_command(scu, cmdval);
 	err = intel_scu_ipc_check_status(scu);
-- 
https://chromeos.dev

