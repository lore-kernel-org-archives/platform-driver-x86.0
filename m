Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E4C43B3F2
	for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 19:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786389020; cv=none; b=A0boK2U6VvwkGNzOt6d4XvotalszzpTw8QPqaV5Z0xYYOIDnK3slt1u30n5LY/tcjVT+DI93u/fkczpCVknnCMb/pAz3Ba4igaWgKez3VxIf03HlK/FA/5iyrvD8HzejIaruXyeWtW/msBwGEQQ0ePsr19+M8ShPfzGZaMu7Vek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786389020; c=relaxed/simple;
	bh=rP2NNXWgCVVP5EISrdmfCNqCWasfQLfPkPIVvsSfTGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dVGrWU4r4j87I+IfujPFRMAzNhx9zwPBa7mrglkdLjNuhX6KerysF1OObtdihnIxOsulncc8AB62F0wZDntX9fRE+qI7jRVCvNUT8HQ9gQxLZoEHqgWRHW0lTD+tShaJtf0qe9M+xdg2FyuRgWqG4Q/9r2KwsrbFhYY5A6bH3hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjpMjtZq; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjpMjtZq"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b3119957f0so1660178e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2026 12:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786389011; x=1786993811; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lUtmuOmDDfQXLgwR5j7FKUowALg4M2TPbCa5zuYY4Vo=;
        b=bjpMjtZqWo948wtRvgmiggNfIN4efu1bitEQBqwid7THxFoepoUS83sAUBTT+cyt1L
         QWg4bPoNPCGpYZeo05+XsIHh07TS+MjYKMji8fOVKC6mNIaGI26cmvXeRYYt8xaqadxR
         XWWoyyQO01vHm4L9oV3k58umWs1AICGHQgrzpLydKWpsG6Hv7z5l+baQVkzat3TcFhVe
         7n/0aSoE0iHFvXKytx2kWkIbdAuHippR+2OCx4NlBFzR2/EQjcpTA5+X3jnPj4XBE4PH
         CP8+6c/FSegoWpfv4UUhI2K3dfWWRAVx6Y6omw2PqWo3W50gOfRZSLKvOkB1jl/10qQz
         p8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786389011; x=1786993811;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lUtmuOmDDfQXLgwR5j7FKUowALg4M2TPbCa5zuYY4Vo=;
        b=g3SVu/QcUt9fGrzkLWUq82Id/2TfcPS9RE6O4oOlDPz+c7c4f5a7EdPYwz19qIRRUw
         zOxy/mfRDfYcH0QVEVR9DM98Ir+pKi60K/xKM1UpotOO3/hUUIOrlAnrr/JREGS/iAMF
         2CRV4SNcVzH1f1maA00HU0BABcdAh2sxoUfW5GpkzlvS+z8Yx5bsW20Zm27qQ0LAXIb4
         ZXKUbNQf7VLkVyumktQNYv0jdhnLx9P2AhZF2XBt+dOl4SuCSZgAX0ZrJJr6P1IlGbBS
         xJVFwtnZq3sw/5uO4nPAJMiemhs3MbVL8VFjCcKthDrTHBKbRWROYNIHVYwFtdzG+kss
         PVvg==
X-Gm-Message-State: AOJu0YwguBxAy6bGAbGMjGuTmSH6g7h+O73h4zDYLhi+ToPBmVynxCjp
	3eae0J1WT2o27Dd8PxrZ9LAJZO5ILzNBhhN3vswc7AqOkZvIiZJkJBlf
X-Gm-Gg: AR+sD12DI4K0ZxAfG4Kc6su2m31lzK21RwEycIkQ0EckwqzKOmusiLUdsW0Y/hKwBFC
	M2S8FXiebgYmUkKwQIHR5jGghrCUdR4xeALk4KO0eZESuxjQkjmy+7EYVdxVUjBmjBOxUepIt8B
	Jug9olWMz0Y9242v7n8QUiU02K4gRprarZqkg2Wa3Pj8o/nILnf4rUvwCx9Tygw80SGe9uM897U
	vQCFIo5hZtQFpI6qqLukglE101dLzEYjAmvq2BRjJl/a6PzmLIPqRSk9WJQ9xVUrYt+Iy3Gqnu9
	dSOKtz7jq59s+RV8iSmju1Ux6p3k4KS6/j47pjalrQnwLJI2xu6gEEZUIbi7f3AA2lJWFX1uFkb
	bdMNnFKXcIaheKKGxyxi5F7eguLQiZodm0nJzGB5fSF0bRg44R7guuP/ya6KvPZs2EGPt4fgrx8
	GVzrs/vyQN+Sg8uuyHoxRJRi/zxaquPhlG/C8ixH6x85k7zpIRRAiuA+gy/71sKPTrgzLD73xEM
	M8IM70U
X-Received: by 2002:a05:6512:2083:b0:5ae:be4b:675e with SMTP id 2adb3069b0e04-5b2f4cdc41cmr4271525e87.52.1786389010698;
        Mon, 10 Aug 2026 12:10:10 -0700 (PDT)
Received: from [192.168.243.250] ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055dee63sm2176103e87.43.2026.08.10.12.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:10:10 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Mon, 10 Aug 2026 22:10:02 +0300
Subject: [PATCH] mlxbf-bootctl: fix the build error with FIELD_PREP()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260810-mellanox_fix_implicit_declaration-v1-1-352e647b8f28@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNUQqDMBAFryL73UDUUmyvUkpI1td2S4ySxCKId
 ze1nwPz5q2UEAWJbtVKEV9JMoYC9akiftvwgpK+MDW6ueiu1mqA9zaMi3nKYmSYvLBk04O9jTa
 XtXKtQ6dbdrieqXSmiOIeH/fHn9PsPuD8C9O27VtimfyFAAAA
X-Change-ID: 20260810-mellanox_fix_implicit_declaration-b3be803cbe94
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Vadim Pasternak <vadimp@nvidia.com>, Liming Sun <limings@nvidia.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786389009; l=1417;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=rP2NNXWgCVVP5EISrdmfCNqCWasfQLfPkPIVvsSfTGA=;
 b=E4BPZ3Uy4vPzeqtulr8kJkExp1lewMZLUw1a9xHMQ/lDJBwl97/RAtZ5kWQQ4V68Zk6UqV/yN
 JpbfHdSvr3eCCxAqXIM7fri2IhOmYq70CYYBd6fdwQMXBnKVYvGMptQ
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

rsh_log_store() calls the FIELD_PREP() macro without including the
required header file, resulting a build error:

  CC      drivers/platform/mellanox/mlxbf-bootctl.o
drivers/platform/mellanox/mlxbf-bootctl.c: In function ‘rsh_log_store’:
drivers/platform/mellanox/mlxbf-bootctl.c:429:16: error: implicit declaration of function ‘FIELD_PREP’ [-Wimplicit-function-declaration]
  429 |         data = FIELD_PREP(MLXBF_RSH_LOG_TYPE_MASK, MLXBF_RSH_LOG_TYPE_MSG);
      |                ^~~~~~~~~~

Fix this by including the <linux/bitfield.h> file.

Fixes: e9d1b2d0f7d0 ("mlxbf-bootctl: Add sysfs file for BlueField boot log")
Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/platform/mellanox/mlxbf-bootctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/mellanox/mlxbf-bootctl.c b/drivers/platform/mellanox/mlxbf-bootctl.c
index f67c7f56ab2b..9ddc7fa1a973 100644
--- a/drivers/platform/mellanox/mlxbf-bootctl.c
+++ b/drivers/platform/mellanox/mlxbf-bootctl.c
@@ -10,6 +10,7 @@
 
 #include <linux/acpi.h>
 #include <linux/arm-smccc.h>
+#include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/if_ether.h>
 #include <linux/iopoll.h>

---
base-commit: 36b1d3299d0b6aa51485cc9a79b8d94948d5f3d4
change-id: 20260810-mellanox_fix_implicit_declaration-b3be803cbe94

Best regards,
--  
Nikolay Kulikov <nikolayof23@gmail.com>

