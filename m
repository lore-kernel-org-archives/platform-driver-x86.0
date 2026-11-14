Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672523;
	b=dxztM0vVeWOuoZwtNRBW/GIwz8sbXdeBXr3Ho+hmO+WjFnXh3O0Y2reUdQTZwMdcfHEf
	 uqgjrl3FsYsG0VkAhZc/FpEiOjICqCs5PubqnyDVZnA7mL5cPSTh8BvoWAP82xBc5gUcW
	 nCNTld8mAZ7mbvgIelpe62ByxS+8a+6t/dDVLRkKTQo/vjP+TeuyR5qwEQJizrOzTqudS
	 54iDo5Uo6C7soJxHsi4NeS75RqHsRWE5e3zqV55HhZKzTv/NCs2O8mvpM9yB9ImWE59O1
	 GGe9W17j5vVRC2UY1+kSe0XtWEKCh9TzobHe6J8kmCQXrnfox0dCJOTO1Rg9e9e3VJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672523;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GtGLStqV/9gomKNOwdwCe8z1kLFSUJF9rkzKgx7PnnM=;
	b=hvtBc1QWsc4ut5TwMgX3iaEW7ptTkVYqKzrJcmEHJKkb//wYGIwsbNcO0NxE8kIlEDGQ
	 aOSxWyHLrZ2zhpu3BSguBce7FYscbRzVePYmUCDOJjBHEiiS+tlUlxzFdiR/YNB4TfRfg
	 baiikAh6FdDsyFriVfQguyUycZiyvQyQF6fcgKoikYKnnGTtRcOgFd58OMgKKRFZgX/35
	 v2QVIpA7saggjs4lKNOOYv5Oxkw1a3PQUw8sO08J0ug8xXsRUyam7m9+XUhScjf8HRk6z
	 90h9sOKK54aBPLzLjnZtLKkYoxVsIFDzThFq5J0Pk9FjREjzsbBR4W4x8pDzNByG+pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQ9EnJaI;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683D9606A329
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 683D9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQ9EnJaI
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so2125967c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672523; x=1795277323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GtGLStqV/9gomKNOwdwCe8z1kLFSUJF9rkzKgx7PnnM=;
        b=HQ9EnJaIDbGCQLLrWh1x4Y+4/qC6R6Pt+OvJELUSA3/kN4jBG9tUAtlgaoBP2sm9Bw
         GGVF/86fKe2E9k5OtSbY1OZJjMrhxDGe9+iCphB6lbfbfnnOg0/wqcgqI3INundPAkjY
         Cdmx7sBVoWCJudVknh1qXoKJ5JOwkY/z+nWhcPdXiYpX9483M0vlycNm9QlfT6mkBb0Q
         iW3lTiNY7Jh0EKRVGAdb4C4h9mL4z14yajflj9ljl1F5hgR/Br8XlfugfG5IW2HOxs6x
         UtcP+LdZZ9xVIoq+NYKBUYC9KQAlh05PBRVzFJgfazeMQFpYe6LMfL604LzEke9q7gVg
         MtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672523; x=1795277323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GtGLStqV/9gomKNOwdwCe8z1kLFSUJF9rkzKgx7PnnM=;
        b=dBBLsMNVxcX0vmdXUTDPnp7mbi5gRlAr7mnHnv6zD8mCBEAA28mQH6Utlp29A+8BwI
         J+JCh1Wm8p+Y0muw8pFbZlO6dQuQyNJjxKEXjXdpGKcHUKFTU6RYsFZXf03oN2PjNC2D
         /9+/FR+RNm9SM82X96D7Q/J7ClWUKiLVYrrHBQcfroRdDc1a+Z8zSnAw+9kgGetPRFoB
         wGxI52UaCmnRH6H0Eb28W1GaQf6+v7rmyzwKjCuiE0jr1CPstEzCEBzQumgveZ4d18rh
         Uy6LC0rr2xbbZQos+4ATwHeRS3XNMMiLOvGgxmTPnGX8mD+myVZjjf/W4WJv1juOdEtW
         RkRQ==
X-Forwarded-Encrypted: i=1; AL+hErEvlXHYwOa5O1H7ALPC5gwwpWUrkLt1+x9TkBwynfE/TDcX73mJxkeZSdXMGQsFNyGetnrQ7O/DEzKHqeQ0v3dXk1Zn@vger.kernel.org
X-Gm-Message-State: APuU4Z+VLFuytSLk/NDWc5hYNRnxHS9G2EWBPb5HNjBVTbaRBIsh1SH1
	q3Cneu0o4ysTGd+rLbK5tv1bp6ejGcrYFXntv0LLs6lZNOTYKsw2khI=
X-Gm-Gg: AYBFou2MGI0LnjzHKYQJlgp+AP/umF6K9HbLld9im6/wqcRvPJNBbgloJnENG7ujoTi
	GkwFxoi9X+AHB6Ch4wgPlAtEOyT25sKoi7swMGBuX8HcUemCO9VYYFgG/gzNh8uXvaoTN2K0zno
	qygH72nzZ7gOzswsD/piMOtd/k80ioQX/r/jsJCKEjudqrl2TDuop8217KgZqW4uOUVMAafuV2B
	ZzPQIY0idcivzZBvpCDaAlC2zOKw1mUctEsU/G3JYmwRx4+NlATBhbYr3jnSFjuQ2+nudifZ0EK
	eZyEGULICWCbCuEZmiq2UyT2wx6WQ9jTV4lH4KGuHVmKp9X2cx2U+8kHdgWyX5nH6GfoquZ6EOq
	3V/BmpKYarUomoAqob5kCM4TYp1W+yj//1rz4ykOXEnVU7nht2Csfpw8jHV3YTKCZipNVYkGbVn
	8tFUL6k9JvuodUwXhVIkpvLFx3aAPXuBWDTeVxl9lPyLFx8Pm+BbKlSSL3WKXM3+/GBxQIdVVgT
	/QjhB8SysTzsulK7dMFbSxfQfL1Bx4eiArlSOxgr7196A+NcTQdjeRA5g1vUvDnx7jC9/80jwVW
	7buNmlqmtYOwlhdWuSPdDEDj3Ow74ZZY8Gl8dE9zi+UyUOz3vZW6KGPhQlcD6+y+LoGxJ8rrcF5
	FYjaV8v+Aaqg=
X-Received: by 2002:a05:7022:1081:b0:154:e9d2:d741 with SMTP id a92af1059eb24-1b503112e3amr4894890c88.8.1794672522574;
        Sat, 14 Nov 2026 08:08:42 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:08:42 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
	Andre Eikmeyer <dev@deq.rocks>,
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
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH v2 03/12] platform/apple-gmux: Fix MMIO interface
Date: Sat, 14 Nov 2026 11:06:27 -0500
Message-ID: <20261114160731.3756-4-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

This patch brings a lot of fixes to MMIO interface such as:
1. Using 1ms waits instead of 100us.
2. Checking if Timed out before reading and writing
3. Adding missing wait before gmux_mmio_write32

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 60 +++++++++++++++++--------------
 1 file changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 34e94f2b2..9625551e5 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -235,8 +235,8 @@ static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
 	u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 
 	while (i && gwr) {
+		fsleep(1000);
 		gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-		udelay(100);
 		i--;
 	}
 
@@ -245,15 +245,16 @@ static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
 
 static u8 gmux_mmio_read8(struct apple_gmux_data *gmux_data, int port)
 {
-	u8 val;
+	u8 val = 0;
 
 	mutex_lock(&gmux_data->index_lock);
-	gmux_mmio_wait(gmux_data);
-	iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_READ | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-	gmux_mmio_wait(gmux_data);
-	val = ioread8(gmux_data->iomem_base);
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_READ | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+		if (gmux_mmio_wait(gmux_data))
+			val = ioread8(gmux_data->iomem_base);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 
 	return val;
@@ -263,28 +264,33 @@ static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
 			      u8 val)
 {
 	mutex_lock(&gmux_data->index_lock);
-	gmux_mmio_wait(gmux_data);
-	iowrite8(val, gmux_data->iomem_base);
 
-	iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_WRITE | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite8(val, gmux_data->iomem_base);
 
-	gmux_mmio_wait(gmux_data);
+		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+
+		/* We already wrote the value there is no point to check if timeout */
+		gmux_mmio_wait(gmux_data);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 }
 
 static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
 {
-	u32 val;
+	u32 val = 0;
 
 	mutex_lock(&gmux_data->index_lock);
-	gmux_mmio_wait(gmux_data);
-	iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_READ | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-	gmux_mmio_wait(gmux_data);
-	val = ioread32be(gmux_data->iomem_base);
+
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite8((port & 0xff), gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_READ | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+		if (gmux_mmio_wait(gmux_data))
+			val = ioread32be(gmux_data->iomem_base);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 
 	return val;
@@ -294,11 +300,13 @@ static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
 			       u32 val)
 {
 	mutex_lock(&gmux_data->index_lock);
-	iowrite32be(val, gmux_data->iomem_base);
-	iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
-	iowrite8(GMUX_MMIO_WRITE | sizeof(val),
-		gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-	gmux_mmio_wait(gmux_data);
+	if (gmux_mmio_wait(gmux_data)) {
+		iowrite32be(val, gmux_data->iomem_base);
+		iowrite8(port & 0xff, gmux_data->iomem_base + GMUX_MMIO_PORT_SELECT);
+		iowrite8(GMUX_MMIO_WRITE | sizeof(val),
+			gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
+		gmux_mmio_wait(gmux_data);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 }
 
-- 
2.55.0

