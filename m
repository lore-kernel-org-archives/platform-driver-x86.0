Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E73515FA
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Oct 2026 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791228577; cv=none; b=bn+V8UyIp5CQsSUVhpN1zWMDteBpkeXJx9Xdla04hBjzI6AoWhELQPzMzJVjw7KUcbMDzPopudoVLH3hzM6oc5RL4ElFLMWCc8ybT3/HjqRycoBVzzlRkwB7Q90rW/SVtLAzQ24KYzp55dsFL5CNQxENOx0Nh4fgBw7+UhKu/9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791228577; c=relaxed/simple;
	bh=rIsOd71Krafq/D6vw5tna6iY17K0sGzjPCrh+X+31Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=okCL1zb3SUDnCnzj117V05YoV2zgvShcT7edsL2ifXjlJLl8ROPoxq8RBys5opRz3EIR35av9s/2VU4WGMfIzOehtB2zkQsrqYfD8cf/AThwm/bcVg/DrEJU528rgjRdOWI4TG7TZ7bV5NhCT1Vhy4DVkrEAIggLRq0ZlWNKMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwcUpB/9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwcUpB/9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2e7131b94eso9762066b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 05 Oct 2026 12:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791228574; x=1791833374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=czIlyJzpn8KHJsUijN0KotZ8hYPTA5Rsz/hQx5pfHR4=;
        b=ZwcUpB/98KQ43Q1x2sr3k1YW0Ll7yM4AYixRFhWwEUNOgKRNJqBck6jTHn8Ws5NjkE
         FgvJEwQwfOYrrl6t1JmffjLP72rTWobt/0/hbbja+pdOzE+6gA3a1UjQ/x5TUigVrxw0
         NajawuzSRc70Ie3I5R4MPrzcLBKcYVfT+Q1avDm64HX7uEpWt0I/6DAKqljZ7jlweViN
         YSKGOFh8MTJSzJrWV9vHNEdgIz86XkfQHE5hssPK4KbHCU8loQumj0jnrTxv2HlgX6P6
         nVjD3juPKq1IuQUYwXWZNyQ0tji8k6o2oJFiOywOVF8wFrit8MxPOksZs8y0jIadEq/q
         oDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791228574; x=1791833374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=czIlyJzpn8KHJsUijN0KotZ8hYPTA5Rsz/hQx5pfHR4=;
        b=JyxVlhMXxQgExXj9+aBlJjdanG4LDJCieRU/JzgwHwW/fAF/ZGuacI8ZkPfxc+ZQ7d
         qdDyocrjng3kcj7OJ59YXL3zNAnpShJLCnkX9b4/qfSUbEgNI/Hy6pDtzdSknh+3DP+S
         nOz87prSTW4NFSdLdo23aQPsOlxMok7VBQhgPp5yx49CMmAFHgAANTrE6DpMLt275BUQ
         th4nXbYd++aihThkcWSPhiZ6EAeo0cvFGkYVJu2SqBsneZib0OOxsXom4k9Cxq0+FBSn
         RYLkBTiYvoIlEF3FiL+YXOa9igMDiMyTmGLqFvCQfBPMeyXx3zBrXUAcqg0NpQBcVoaL
         4KYg==
X-Forwarded-Encrypted: i=1; AKwUvBxR8gKmj7uMlEVBsRH8bLe6uC8w7cjP6iygxeeVamoH75SLoW5DKnb0YLL1ATCtbMEdaaaD3ki+1CyOdNqBz5OLAYTw@vger.kernel.org
X-Gm-Message-State: AFq9FYJxwO+PVbm0+aIOVMPAE7/LFCE4Rz7HVb7WOrqIhwzzQbrtoPZE
	ifB3bok/mioUul70ahdow9HzU4ShUg7BW6Zcq07b8PMmGTl8QEVXuY4vcfzKmlkfilk=
X-Gm-Gg: AYBFou2FAD36AKaZW/P2Q1D25uYPO8l55DanDwt5cypRTnb5qfEUA2cpwB1ggb3LGFT
	MJjr3gSNj6FaU8l3JtFagDO33+Rs1vCqM4XlgVaC6Yt6jLQUsDTOzsTmEYqpwurv9l2ZUfEyu/E
	Nfocui8EjTZVEGmnGCsIfa4a1vJsqkDz/8jo5ARZbvR7VpoGTZgx1afQNhTJZLNFlhO7OLVYa1B
	ch+4WcA2GzMA7P34Y1dLTcDzqU9HTqHMpcOSD4zWtciV1FVUTPlBF5b3TgQB1qxdAkaI2wULUwJ
	sxD2o3MYok9U1dsOBkfZFDlsuwZ6Rp0IT6iHXHOIURN5dUJPnrycxZI7n4DBI/GsIkVpbeVNmQe
	II2Jxe8kvkQNzZ5nRKSyGsGiIqzx8cLL8MCl9oRoTXUNr0tDAzMaRA/XeCUe/5YS9sr2V9I8yEg
	q4WQvBnPnchsAj9hNJayzZQBUppwA184LZNry4NXrmZawjreTEYnwhCRf+y6F+at7sznHxq51+l
	KDwdAUwuwOGzXxrjH6zIXsLzo981HpC8zpLpHus0g==
X-Received: by 2002:a17:907:9728:b0:c2e:3342:40a5 with SMTP id a640c23a62f3a-c31610bededmr46882766b.9.1791228573896;
        Mon, 05 Oct 2026 12:29:33 -0700 (PDT)
Received: from archlinux (h-94-254-63-140.NA.cust.bahnhof.se. [94.254.63.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e5991sm3668208a12.10.2026.10.05.12.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 12:29:33 -0700 (PDT)
From: Mattias Andersson <86.mattias@gmail.com>
To: Alex Hung <alexhung@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Mattias Andersson <86.mattias@gmail.com>
Subject: [PATCH] platform/x86/intel/hid: Enable 5 button array on HP EliteBook x360 1030 G2
Date: Mon,  5 Oct 2026 21:29:15 +0200
Message-ID: <20261005192915.25392-1-86.mattias@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP EliteBook x360 1030 G2 is a 2-in-1 convertible with volume up and
volume down buttons on the side of the chassis. These buttons are reported
through the intel-hid 5 button array, but the array is not enabled by
default on this model, so pressing them produces no input events at all.

Loading the driver with enable_5_button_array=1 makes both buttons work as
KEY_VOLUMEUP and KEY_VOLUMEDOWN. Add the model to button_array_table so the
array is enabled automatically.

Signed-off-by: Mattias Andersson <86.mattias@gmail.com>
---
 drivers/platform/x86/intel/hid.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/intel/hid.c
index acd42e639..6024bf29c 100644
--- a/drivers/platform/x86/intel/hid.c
+++ b/drivers/platform/x86/intel/hid.c
@@ -165,6 +165,13 @@ static const struct dmi_system_id button_array_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "HP ProBook x360 440 G1"),
 		},
 	},
+	{
+		.ident = "HP EliteBook x360 1030 G2",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP EliteBook x360 1030 G2"),
+		},
+	},
 	{ }
 };
 
-- 
2.55.0

