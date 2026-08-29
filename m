Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB5B323416
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 07:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787987933; cv=none; b=SRHb7odD0wYJzt+jOvnj//GJFaZEBLNoPgm4azCN82ZTDPWqH0kPrSxRHucRwNeKqIY9ToZKm4l5o7+AeToGT4NXWwg0ei2TbEt3qsp+K6JwAj101VV3/VeIUc5vrzw9j7tL5544Gq2Cjgloz6Y+cqYn5QTwnISWdXzPLg6TQeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787987933; c=relaxed/simple;
	bh=uz3vQj8FYbM4kGyR/T+IybsJavOIJ5kvlHU/+x+Z1EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LiVXv0NEfpo2wuiGFQadBRfs6D3wYTLk23SGACCBur/Ejk8RfWquY5uNjoST/Y8+0B5652h77vgJZ16ifj8xoSE5kfwD1xRmtJY2tIWpQUNK6hsn94XhlPq1yRgWCOj5+BkcLhMPYb4ixdoa+pnd2ty6J3Oh7r+TLnDRSoe+U/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4pj8MRa; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4pj8MRa"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1882846a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Aug 2026 00:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787987932; x=1788592732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztdXvXEqMzZ0Iyqk5KJ2aSAe13KdXybpN8xuCs49paw=;
        b=M4pj8MRaqZYoGds6BkzqaVc9UOcT5iyx7rQje9HLInsDjLTFgyopazUx+XfanRiSOv
         ZCu09rAXuZDt+vjUvLpSg7sHeh9NcdUZFsvjUFnx12qIWvoiuqN7w/5BbOUYb8iTrYEO
         aCT4WJDgOmFn1cQzLkScLIHxKYli5imWRX2KtJ/mnLtjO2QE32XW1zC+nOg2tV4MzTs7
         m2zKitQN+0eHwb2JV90gq2NWjwFBifa5R8qffcjbmJjPrBwu6SofFeqdhWr10MfRUY5m
         gKuXBGAbQiajsBFZve/vnLiZ1b8Nko4vEtkwFSYs8OT99iVruXSD3w0ZUQr+iEShH/Te
         30mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787987932; x=1788592732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztdXvXEqMzZ0Iyqk5KJ2aSAe13KdXybpN8xuCs49paw=;
        b=d/Bnvtxe6ONOiqG4F1fKK0xkd5ai/AZAEPETvxXYyEVp9xryUXSHBx66XM/2yojB0f
         s9R6Ye3XPqQJjhCQYhdY0SX9y1MqqyCFj90731gRzckMZROH9nzPPRh3jknJJep5cdjw
         VEwglt7SyDN9TN09IM9LgBebfCIMIkA/wmFpd7RJS05pU8SImfb9DwwbBOJxXxqFHEmm
         +QAlEFi848xMmEKV1nlMK0EVjJ+J+X40QjgD5banYlNRAl6DejoqOFvBTGa7KSJYXXq1
         mhibqgcwWj7icvl0KF0VKfLjBwF5zpWz6NA422W6w5iGNjoHy6gCf+GbEL0KNMRJ74kO
         aQbw==
X-Gm-Message-State: AFuF++llUCDuTJjk7VREHWY9wfxKTgfXMMWxJxVIiOGLarX4NaXqEYR8
	8qEOI9p3mNWYXcX3xExpMc1CnQEEHkrzEACwMpp3LakiiHqygVBrwx/o
X-Gm-Gg: AR+sD10OTKokEwrKbGwHCLoq3hVozL9A/U+JBBnC88G7xLxmzK0j/bGWqsV572Bod+t
	SjTT3/1a/XFnhArhcVf/nXaOF+CUQw9U3ES8iOFOOqZxpFWornxNXAUxgcF9eXjnybbp4oGZTHZ
	VqR2vY2Ex3TgtmPUj9Fq7CJaSj3EMiAADT+9f5GoeNZphYDLdFrjKEM9m6WVbg+Ew2oYlo8ea9N
	Xw1j/GlNsULc9Pan/cX3FkaaNBjyPj+z+b+GuSs2KkZlPKGiBc9VqzJ+ZN0ph8xOJaXnU33OyBj
	m4r4BiqwyBDUtUpI9afx6cU3Cs9acCeFcziebJqgLrioBw1dZT7UtD8bQzyC7gPcFre5MJlfyzp
	1onQ+sFc06ivl1teDunDO/lzXYNrhMPP+q/VnxWgAl7rHGfO57K5h0cH49+m5xWFubfTaiygKub
	gN8kYybYoySvc7rZJ/6XZAC+a2yvj2HwZZqAtFUZEBle5k/xofAvc6L7/QAA+DgFVbpqtF3TLMw
	mPl5yuUDJMJP5DGLMYyPqci+gMEC8H4g8mI4ARWMFISogKrWG0Gcd+nhpqlKmBnn/nSWqDwFzqN
	V2OlXA==
X-Received: by 2002:a05:6a20:2587:b0:3d0:d933:af97 with SMTP id adf61e73a8af0-3d267b6d040mr18600165637.15.1787987931774;
        Sat, 29 Aug 2026 00:18:51 -0700 (PDT)
Received: from archlinux.tailec59cb.ts.net ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d2e465sm18648545c88.4.2026.08.29.00.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 00:18:51 -0700 (PDT)
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krishna Chomal <krishna.chomal108@gmail.com>,
	Jan Ziobro <ziobrojan79@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add support for Omen 16-am0xxx (8D3F)
Date: Sat, 29 Aug 2026 12:48:43 +0530
Message-ID: <20260829071843.62902-1-krishna.chomal108@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP Omen 16-am0xxx (board ID: 8D3F) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to hp_wmi_feature_boards[] table and
map it to omen_v1_legacy_board_params.

Testing on board 8D3F confirmed that platform profile is registered
successfully and fan RPMs are readable and controllable.

Tested-by: Jan Ziobro <ziobrojan79@gmail.com>
Signed-off-by: Krishna Chomal <krishna.chomal108@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1aca4..4011d2a8afc6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -323,6 +323,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D3F") },
+		.driver_data = (void *)&omen_v1_legacy_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D41") },
 		.driver_data = (void *)&omen_v1_no_ec_board_params,
-- 
2.55.0

