Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900928;
	b=jtbE8dn/8tFzAwfJJiQwwBXy14xy7fgfVNYEYOLqvxiM6NNBO3njv6v1ULcfqE3pp0Xd
	 yLjBjJI6QMza9y6SRpon4dpfQuXYJkFqaV8rewb8TLDghbNOHVkyilBinACVlQxGEiQMq
	 OtgMTsX2pBFQW5Ib7gFXxK+MpLm5BjZVAF94i8izpeW6UoA2AbeD60WSuWwfL0eyiJvdy
	 uG7CehjAnVXaeqDIj5RAGtgqceixxJ3bFQhwyaF9pdhL+yuaQyrk5EIlQCnRWKf7MK1/7
	 aa/dz+ga/x4ZdmHORJMtgcD0WLcdfQOWXBrCXAPHmwDmJsOpUWiUaiNgezxy6ciM7OQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900928;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VU2DAJ/OjJ6m6U2gn3WXwMpKFJKrCfikczSVMn3jkTE=;
	b=vpkQ0AcwMOUPOZKnL/u3b468MBoRFiAWJQL0kOFiCRHOiJlabI/JUh0rGvTxBp26BsQY
	 2cgYuurlIt5547DmosQG3snynoiBsRs+rScx2/cfveXuPRDVJGnW3BGi1OQbhHcxGUD6D
	 ytUprO9guXawWVTI+5DhvwUDeVYbEqRn3v+QsKq5HATyEeQsGPzttvcC0HyxyEpnMInb6
	 SioOKxQ8iF/AjUQirDpCYQK8OLf4G4VxcIqGj12KYJGjjBOvBUEzbTs+4B4HbH/wDk6vd
	 mlP/Q5YQG8KcesWi0Lt3Ss1JrcRZMzvN3ggNpaZuPT+oBhXvVgunvp7BFm93VvOIyBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmWNbLuv;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA91C606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA91C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bmWNbLuv
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-156cbe59524so1141021c88.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900927; x=1793505727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VU2DAJ/OjJ6m6U2gn3WXwMpKFJKrCfikczSVMn3jkTE=;
        b=bmWNbLuvN2IDDdStDByH+gvUY+b+HqEseTNkYtWYn9bthVjAv4m3AguUnxqYJoFX32
         VHQmNIAOYfKzpQw+7bxpzscBmUWHXcO2ebVGN9J3xLssF26lgSWX738roEJ9xaSsspvr
         aAomizoTdnldXnuN8HE1NkPZMUCI2v6yZjUUtS3ZAfSwxcbVNIQM5UBRSTgHIhVXKcjz
         l45RqVv2VQVoLODFAPEJemCyqCVCpzl/FZL++8hCz/q7btLV4L8SS3MHKuv5sodKD710
         tzj4KLClvVq30cqBzhWmEL8lLKkH4kGyvdxtdcK/xLvpjFRB2sOMSn22Rm3YT0B/48VF
         8kgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900927; x=1793505727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VU2DAJ/OjJ6m6U2gn3WXwMpKFJKrCfikczSVMn3jkTE=;
        b=VckvHfeOJcE/qYyG3VErmNLCiUp4TcSzJ7C2y8qM7+Fo4n/NMJyaZ9q/UV3X8DJ6UY
         VKdXHloHCyxzGgJiRdvy0rjmdGYw3pDFY/rNr7PNIlQCXzBRwn0t1rmJ9sqVElS+nBvT
         T8UUuVO81yz5qkSkd9nMtlPlXipuQSLjRN1+b6mL7n0vGK5rGGIYO4y4gd1aAW9aXxTE
         3KV57XesjEcXfft5XtvyfTqXXrRPNkmUKplH6LKXqBUi1kzpdibxp5Kw44eHPl6Hh53c
         nrDXCC/E5ja6+46htVgtroeAC9X6w/cLU3CuLJHe46jfWEH3HB9FnWYSiMLQ3SqBEdJd
         F5JQ==
X-Forwarded-Encrypted: i=1; AKwUvBydye0O+j2jjQ8v6o9pzUSRB9qlBudx2L/mB2u1qtC4Nmt26eijzw/r9j3X7+wgMuBTlWsHr31QX9WgCLFR1QJ4KvAx@vger.kernel.org
X-Gm-Message-State: AFq9FYKPPcajW8kC9SghMMwEHBRww/OsRKwHNAgkAq2zqijrg1oSYbYJ
	O+RJRWVhc9WLQbTHTa1hP/COxBEhMEf69bHvUjuwFrNCvkH57a3KFLM=
X-Gm-Gg: AYBFou2hjLNG9qTR4Zj1xGz9mb9fnHwUNzqi4QPwxK63JWXr602RW1xTEzlvrlqPX3w
	3MalxbRVrxUAuWAzDviK8BFh4j0Fkozb0SD/gfdXFY+QANDr+wrzLqHz7sVUZwD6sZAJh0BKxFI
	w+HyT+gH7Ce8N/Z5A0a/g11nUTJe+gU9t4js8nPa9TyBS1dmMsVYXQv7naP9BURDjtJGybyDW8K
	dLbkA1ca/sf9bhQnHGeh46vyOpvlQejIFcMaNjxQHOks80HPeJJNSqfNh+6kjVWoa8PaCehmou8
	uZwGymDi4CsB47ttrD3YQmuVPzUj7gQz0KLW+YFJbGWqyKEhUNdd2i8QZBsv7FX84wygP5AlPmJ
	7BvJ16MergTcplJad7zs1l1U6AJPiiqdjojlR08v/NG0toSH/PUfh4ZlkYfP19wadI4klaPBfO2
	YFO02Y+jHJ8xFuKeAjOOmRbOtJoSt502VAQ85omFU+i7q05Mi8xPcHYzqj4T2hFYFhtITxjsupD
	wAg1csAkn6H73EN1CgTrDVPBg6oXRkbtokBwGfDXXajgZB+zFOmNZHq1Lrf5uRewhM8xnXsXydJ
	/jKelEjnwVOM6ig=
X-Received: by 2002:a05:7022:3d83:b0:194:23e7:b526 with SMTP id a92af1059eb24-19937024792mr4822317c88.27.1792900926860;
        Sat, 24 Oct 2026 21:02:06 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:02:06 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
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
Subject: [PATCH 03/13] platform/apple-gmux: Fix MMIO interface
Date: Sat, 24 Oct 2026 23:59:39 -0400
Message-ID: <20261025040046.1602-4-atharvatiwarilinuxdev@gmail.com>
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

This patch brings a lot of fixes to MMIO interface such as:
1. Using 1ms waits instead of 100us.
2. Checking if Timed out before reading and writing
3. Adding missing wait before gmux_mmio_write32

Co-developed-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 59 ++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 24 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 4e8786a5e..076ed7ba6 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -237,8 +237,8 @@ static int gmux_mmio_wait(struct apple_gmux_data *gmux_data)
 	u8 gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
 
 	while (i && gwr) {
+		fsleep(1000);
 		gwr = ioread8(gmux_data->iomem_base + GMUX_MMIO_COMMAND_SEND);
-		udelay(100);
 		i--;
 	}
 
@@ -250,12 +250,14 @@ static u8 gmux_mmio_read8(struct apple_gmux_data *gmux_data, int port)
 	u8 val;
 
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
+		if (!gmux_mmio_wait(gmux_data))
+			return 0;
+		val = ioread8(gmux_data->iomem_base);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 
 	return val;
@@ -265,14 +267,17 @@ static void gmux_mmio_write8(struct apple_gmux_data *gmux_data, int port,
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
 
@@ -281,12 +286,16 @@ static u32 gmux_mmio_read32(struct apple_gmux_data *gmux_data, int port)
 	u32 val;
 
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
+		if (!gmux_mmio_wait(gmux_data))
+			return 0;
+
+		val = ioread32be(gmux_data->iomem_base);
+	}
 	mutex_unlock(&gmux_data->index_lock);
 
 	return val;
@@ -296,11 +305,13 @@ static void gmux_mmio_write32(struct apple_gmux_data *gmux_data, int port,
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

