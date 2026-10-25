Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900969;
	b=ZdlXIP4KdaHOM9C00ByA4KjyrG97CMtcs6p8HqNXYdAbrYMsNVCgp4ZRdAmxy3v9Q/Fr
	 zkUcQ7bR3aLVMYhO0flkiU4+t9j2Fu/nOC0r4dE9xCOJtQE4/m31PijCwh1RfJKDL6zUD
	 FmAZLYkNnDhODhFykzBAP+cwQ4mSFbxIxYrPXjTzLPYD+F2OmDHLLdrCZq7qPG/BLUo7S
	 8k7+hDMjUR0NnloBzURR5bWZbN/muxp6TiR7ffIhW9v+iPjqQZQBlg5qWY/Oy1WGv57m3
	 ZdS4YN5USs/CPBf5W3jzURToh91wQZDGUd88/N1+9CaY7xUSFtO5spN6d9eq1n5JmDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIWFjWx6bY2aMzP1Dlox6FZiyYw6gduqI5+MEIlEj5E=;
	b=YbV9PMAZw6hRaMC2JDeA1E203PsODqy208hW1xVfD+3V3O8TkfIHhAfWjPk3O0z9/lAk
	 ognI2agmVgj95CG4/g+zbu577QN6r9aOxdmSb/SE+83QuFYe8EQTec2TsUHOHBsIUyvB9
	 +pd7Djm4F2FxKs49NWOW/F2iECuJ+hOt5eDCtZlFv49zdl6V/A1g8N4MArfXNLSnHl0n7
	 BJVIx1clcLvkZJF7p/SNs7mckmZsS/9m1RKld8yU13Fzrlyb9BFW6NwYYwGT+ZLDT9m7g
	 Xo63HV5sZfur7eCDHcST0c94IQFD/8GQcunBAnyREWycCEh8VHm5qQp+aXYLZ0yHuLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDBnovbH;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA87606A31D
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:02:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CA87606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=WDBnovbH
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so3433490c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900968; x=1793505768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIWFjWx6bY2aMzP1Dlox6FZiyYw6gduqI5+MEIlEj5E=;
        b=WDBnovbHpvOpjdqqRAZCqZ/d1ZGckJZx8Ecb+LplBowbPWF38i1otc7fHClqk3vswU
         6p6p2KhpZKXDiP7533kfVkOVMDVmV/JlYmIGBxfwc3YeW/jvJC08/E8XPOCiZeXhc7TI
         Fkk93D9W8429SPchCLu8sJxpRx3ZJaSoPBBAQNOIpmV1LJqggboW65XMg8dchAkLoyl1
         zQKW8WShzk3zOYZ9UEyiIVpANUVK+0RSGiefC6FU64TSO/2uFPFoHgBA8F6cfhXTpqHn
         1ogASV07H0M7oWHiVdWJJiI4Avuq/7XYHbKjP0ntYPUrSd1R4GgA/BNiPG76sK79nXJ0
         EA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900968; x=1793505768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIWFjWx6bY2aMzP1Dlox6FZiyYw6gduqI5+MEIlEj5E=;
        b=l0G7ddI46WQOhZXbQUzpuJr+55jHTPEOx4nd3U3P8eWnDRlwrt4CdFo9M/ysUedoZO
         H61uIwCJ0k10/pHYS2KZPvfflipHNWHT1JZwp2Dw7wcdCY1KEUMe0sEiXKY2sLPCQBnd
         PK+2rPhmI+0QN/dvjGE9fGOPyJvJr3fG/N4wBesom2U1iQoe3AA1GR5tv55EceZ/oJF6
         uh520XVJ6/buEbOwxlqe83P859yhx11mxu+Ey9Y3BZAQD13pGF5RVxyxCDILrKTGqpVw
         kwtvtyrCpO4HNHp0Y5bqkenxgBsY/HVE0WqSpxImD3V294Po/q9gscBojMaYBHzJwdF3
         SZVA==
X-Forwarded-Encrypted: i=1; AKwUvBx0Wq/P3LwiWbFI/v8rV2XjxJj0Z/jbZIgVASqJjPUVTfuU86Am1O0WfUGgd5BLdCcf6vtvXK5ujqbyGKFfH025Jsaj@vger.kernel.org
X-Gm-Message-State: AFq9FYI6hYSv1RbsDJ/uV1ARZmhiHQy33JZB47kjQjCyrCtVU34ApTdj
	1GuhCb40SGqIb6rhdtm33AMugb3C8EyOaNo6jKWl3vPukz+jTeq1Rq4=
X-Gm-Gg: AYBFou2WQGhKjdFS1Z0wx2OReynXeqquTk3vjUwM10GixYKKZsjllGobeYX+cRrL0iG
	OgGc8uRqMc5ntpWjb8OnLQnOPhi72+3lFyJo65JDYb4UNY0zmZpGQK234VLSf6+bW3Ea7WqCCnX
	vqRDHqiwHvYSI5+HTPz+dsR/gY3VG3x9I1d2tJkow4Am6TsW2bfawi+f//9ebMvPzsfYaCtnaNS
	Gd76F2DdRGz6XsAxoSDyT1tfJeAAcFK5XU1LSr57UcSizR2ZAAhznJkyM42sfmT0cn0GrTxUj89
	yViJTZTQbuvRbf51gNIta1W0S7Lk70fqx3CVOtU7Ee3n9+NQgIcGAdFXhmcPjur0767LCgPfM8K
	ix05GsuD2cx8Q0vUfbwzddH8f8TcjIgQdx0yIMMJ09PcivfEBS12Pm6w9g9CL0iZcSqNL5xhRmI
	u/7K4xZv3wJcFwPtJo4uBL9BAZFZZ/pr0h//7GhttOLN9v25noF4nWLgvVhlWbYL1+Q5qS47lm7
	G893/NhWrdv00nGA7IA3sdc+FkZ3Hc6kNkY8EE62Xs8ufxCzvMAD0XBScLIyCyNba5+8u5fhMLb
	KMecBhQTJz3SE80r
X-Received: by 2002:a05:701a:ca0b:b0:17d:7b45:f91f with SMTP id a92af1059eb24-1993580fcd2mr5442774c88.32.1792900968114;
        Sat, 24 Oct 2026 21:02:48 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:47 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andre Eikmeyer <dev@deq.rocks>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 06/13] platform/apple-gmux: Add parameter to configure boot gpu
Date: Sat, 24 Oct 2026 23:59:42 -0400
Message-ID: <20261025040046.1602-7-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently on Indexed and MMIO systems, the system can't change
GPU's on runtime, as the display is not trained on the secondary
GPU, to combat this, we add a module parameter to configure the boot
GPU, so users can change to iGPU or dGPU via reboot.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 637b3b216..6a9580f27 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -109,6 +109,10 @@ struct apple_gmux_config {
 	char *name;
 };
 
+static int boot_gpu = -1;
+module_param(boot_gpu, int, 0);
+MODULE_PARM_DESC(boot_gpu, "Configure the boot gpu (-1 = auto, 0 = iGPU, 1 = dGPU)");
+
 #define GMUX_INTERRUPT_ENABLE		0xff
 #define GMUX_INTERRUPT_DISABLE		0x00
 
@@ -1215,6 +1219,11 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	gmux_enable_interrupts(gmux_data, 1);
 	gmux_read_switch_state(gmux_data);
 
+	if (boot_gpu == 0)
+		gmux_switchto(VGA_SWITCHEROO_IGD);
+	else if (boot_gpu == 1)
+		gmux_switchto(VGA_SWITCHEROO_DIS);
+
 	/*
 	 * Retina MacBook Pros cannot switch the panel's AUX separately
 	 * and need eDP pre-calibration. They are distinguishable from
-- 
2.55.0

