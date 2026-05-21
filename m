Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15AFF315D5D
	for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2026 01:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327999; cv=none; b=PhA8cBUYEYW4R5+zIuLSGH4P1tBWPDLNv7GBxyaRmrwRByQvKtObVHaMwLh7u/9a3MkbHqzVVwiILj1BIuh13Ff1uEc2igD+xd1oJ9+dosQqEZMKQgvpzl/yN/FhDeazAQGJcE+OaoL1oZ3LwJR8rH3IBhyhpkGMzr4BMiNz0b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327999; c=relaxed/simple;
	bh=K1oLwk3RTb4DmrtSS1Kd+fkh9y8M6HVo8S/ImeLc6e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMpYMmZ5/1LZgTDofWuf8avCNHX1O6df4Bk/lCjWZDLk2XJXQzAvkwTUjJjgtQ78iitYArSfqtib9PqXG3nvcrjBat+H/zT8QtjjayP9PdhL9LzGskjjgYKJS35C6Azv5CCWseHbeScSARq3RW3aaftSCdXLUk7ZdF/y963T/NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kpy5/Zed; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kpy5/Zed"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7c52e49d978so56250237b3.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 May 2026 18:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779327987; x=1779932787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSOZPwggBd/tZaFmjqTfCM6sLL5sYIwg3J4tTfp4kIg=;
        b=kpy5/ZedTgdZuR3lB0USPng3wrpgkfLdCCC4EJMoFzaBrs3ZFhdezS8jMXR57qa912
         azZG9wFMOGxzKWsmVaJXK7BrqJwYCTAEM3jHnLaM2I1wyCdQ2tw2MBRhylzK7HWiC8kP
         Zk6npQiX15570gVgpbRYLnaCbd9wx0soeAQvWI32XkIZcvoB62EBpWCuJuM6GGxkdG8w
         UdA/A9ZTE33z2FtAS5X9QfT25VUCGVwbkGzvB0gjq08yuyvTtr4AOETOaHD0uFrduaZ3
         QTTsr1xoPQ3PTqAyeRnNLPGcOwdLKbPNeoGHwVXEMQ9Th0P2AwPKO6Lxnvk5gN0NNqHR
         wRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779327987; x=1779932787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JSOZPwggBd/tZaFmjqTfCM6sLL5sYIwg3J4tTfp4kIg=;
        b=VVGCVJQrhmG9G/mx8S9qEPGNzFhMrSBOgbNOJjXJyu7b2NsgMis0lDYnGO7XIqyf/4
         GuDzou+J6zEUWTOS+KenQEKVjmvD8gIjPvY4BsE3qU3yglVCE/k3RZ+oD8RACPIlVjkh
         tzBwb3BLxlrH5RaCDxZND1k+WAj+SorebaQXjI6Y532b6fpLWMrRas2+4wkxHwfisenC
         2bnD5LQNmTOs59yGxxjs91HZNRVpsA08vnme0V8U1bt38F+vfqWZEfWUYsBb/3gPpatJ
         b5yumYoBsztVQki++o2TYMvRC0AwplfvYnJWb5i6yJ0gIprG2ex8ANUOEfEqkBQDa05x
         Hqag==
X-Gm-Message-State: AOJu0YytU/AS9QIk/zrvL91xGf4/8pBzFDaKZMsLuO35AY8ta1j5W/WG
	xSxzJ+rqFQSE0hlxNEZ5o91FqlmipV96mVVEpzdtTTp0l31XJuqsIXyzmZikCA==
X-Gm-Gg: Acq92OFLrFLSeyITDifLrHZ7256K0s5aLKYZKlJUwcRfSbKfN5WVtTSCZoe+61oDUsH
	ArOQ8HmFiOuQCmQCtbLINMO1B0eNzI1W5OI/7fd253MQEHvzbPbAZubTshlIp3BamKX8oRQg9Uq
	+GGfoHGrRUzM8PPzr7blRLpVwsCQbv8DFSulnlL4yiO4NMcH13ymJSg6sZqpnmczzfZSdBbBK2N
	ow/1ZbIiNm1INA7K0acfiicY1v7m2rxi2bc02mhhuYpkiWl2dG29Bio3KV4R4C+gNLA5ddB7WU/
	00AwPjQNVp5zXGTLPaUmN5LMLEKT9UzMNXqApsaJOgAIjIwqx1nzxs6/bEqrAp64+9iIw3MGJvU
	3S+nwjdlBvDt+pVRPfv6LnFCTAdikXhe86DcqVbT1JBLaLbaNwkDmCnQUfFjYWVV7LdB5TtcndI
	z2IT3SV8LFtVZzYgGnk0sbXihy7ZnQSXWu763r8yADG+Ht4d0GPJgKq5q1jKYH5WGFzb3d+imIC
	IYDAxkdnENOVe9v5Vg23to8T4qhoWyuZGA=
X-Received: by 2002:a05:690c:4b0c:b0:7bf:ff7:ea72 with SMTP id 00721157ae682-7d20d020f3dmr10604927b3.34.1779327986944;
        Wed, 20 May 2026 18:46:26 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cd0bfdc094sm56652417b3.32.2026.05.20.18.46.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:46:26 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be|_ptr)?\b)
Subject: [PATCHv2] platform/x86/intel/tpmi/plr: allocate die_info with plr
Date: Wed, 20 May 2026 18:46:08 -0700
Message-ID: <20260521014608.1356671-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplifies allocations slightly.

Add __counted_by for extra runtime analysis.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: Rebase.
 drivers/platform/x86/intel/plr_tpmi.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/intel/plr_tpmi.c b/drivers/platform/x86/intel/plr_tpmi.c
index 8faecc311038..66220fadf670 100644
--- a/drivers/platform/x86/intel/plr_tpmi.c
+++ b/drivers/platform/x86/intel/plr_tpmi.c
@@ -58,11 +58,11 @@ struct tpmi_plr_die {
 
 struct tpmi_plr {
 	struct dentry *dbgfs_dir;
-	struct tpmi_plr_die *die_info;
 	int num_dies;
 	struct auxiliary_device *auxdev;
 	struct notifier_block nb;
 	struct mutex lock;	/* Protect access to dbgfs_dir */
+	struct tpmi_plr_die die_info[] __counted_by(num_dies);
 };
 
 static const char * const plr_coarse_reasons[] = {
@@ -305,7 +305,7 @@ static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxilia
 	if (!num_resources)
 		return -EINVAL;
 
-	plr = devm_kzalloc(&auxdev->dev, sizeof(*plr), GFP_KERNEL);
+	plr = devm_kzalloc(&auxdev->dev, struct_size(plr, die_info, num_resources), GFP_KERNEL);
 	if (!plr)
 		return -ENOMEM;
 
@@ -315,13 +315,6 @@ static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxilia
 
 	intel_plr_register_notifier(&plr->nb);
 
-	plr->die_info = devm_kcalloc(&auxdev->dev, num_resources, sizeof(*plr->die_info),
-				     GFP_KERNEL);
-	if (!plr->die_info) {
-		err = -ENOMEM;
-		goto err_notify;
-	}
-
 	plr->num_dies = num_resources;
 	plr->dbgfs_dir = debugfs_create_dir("plr", dentry);
 	plr->auxdev = auxdev;
@@ -361,7 +354,6 @@ static int intel_plr_probe(struct auxiliary_device *auxdev, const struct auxilia
 
 err:
 	debugfs_remove_recursive(plr->dbgfs_dir);
-err_notify:
 	intel_plr_unregister_notifier(&plr->nb);
 
 	return err;
-- 
2.54.0

