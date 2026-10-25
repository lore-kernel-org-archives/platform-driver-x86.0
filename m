Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900983;
	b=gIviYJ1lEQnAlsOsmGa6KgWKBjtcxTWicrV4h9aFUeE+Zhmor9p6Mi2Kds+FnnRNZynI
	 fCcGywCj4J+dQm7VeAkBqacOE4vNwcBhvc34eZOIX36thAZ8sJIfTspfCk6aBZT95sKNL
	 bkYCL+j9lXZddkpBF2inYljbPQe1DY3ate4ftEITGPOaerZ/vory46HsrTqnjuPmzK3Ue
	 Y1p4bgjzkcxmOb1ZJSuDEoGwl6G2wIkS65DYXjJqSgt62Qz/vR31aIWMzxqtKSjClRA37
	 8eymP5HlaEWkz9E3VFkg7DtUdjCiKnGwt/fAuFkwfdtmWg+z9tgpbqesGnuIFiQ5+kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=788LSEJ/nQEllvwR1yiw9f56ICCRyDbD8OfNlkBC7CM=;
	b=Ur2CDtbz4bO9Vm0eHJaOA+C0kDQB+seO90f8T1b0xviXE4doVuf/a6Wwqml/dhiD9crC
	 wqBKrmbaSKQuDggP5VAL00OcUQQc1ae2KdK56DXFadhCdSx8nMhholQ1eiNhQbYoQWRqJ
	 ZZy1S6JxNa3wjcFtlLdZhszjcDbBE4gA3naT2+wOkzxCTYaLIjwOfop8eJ5QDWNtlFgAj
	 ZXFgel02hw/3fh6zQSkctQiwRZgICz7vYIJ5ZpcFGEYN46c6kiTYkrgrMH6l5GX/ONb/l
	 bjam79SXfJpH7BfS+bPdJfQ1RZjErIVDPTAjBCGBz7Bu7qbqHfGHhRgw5/Pi964Xxng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ixYEsRnk;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67DD606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C67DD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ixYEsRnk
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-354ba08cfd1so3631175eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900982; x=1793505782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=788LSEJ/nQEllvwR1yiw9f56ICCRyDbD8OfNlkBC7CM=;
        b=ixYEsRnkcf+nLoavUDfr9s9yHU5Gk20w9A4fBE5XOc+c6F+uphlXnEjou9txBIaHPK
         N1pHduhAjECd8wN1ZDfifTirzhtl0RJiOEScOKQ/Yb0hM79ddp6gHUyHS+pOIh5B7pL2
         dJ2C/nOtWz+ZJQFGKwBuJ/XwAiW5aipTEt4fA7/idc+npvPg1Undt2Wwi8wnyEb2B+k6
         QyClQAahO8pmlx6DtjZynEMLHSnCtq95kJKJNKNmMtRYN44vrkXUZhBvW7vA0HkresgR
         ajH6+fk/yUaNVf0QWhXRZCsEoxAL1Q+bKVq49QhEOrnpYZOUIP/FQlRJm/NSwL+5GD4G
         6dVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900982; x=1793505782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=788LSEJ/nQEllvwR1yiw9f56ICCRyDbD8OfNlkBC7CM=;
        b=H96uIbuZw7vw27afvd12Jvry7W/Lwz0jcLh42ciE6WUgaB1Yf3LP0MMvJChXRf2aoA
         sLJ0snAHqq5XBbBF5tuLZGfly7LRitNuseB1fDPOe7qb52qGmPyPvjhXWqlywE7v/2NE
         iK1oYDV6sifMBlIWwUaEkh1BdN/lqEBUZIyAvfN6MBWkJ2Fox9Hp/XbKtEpQrLMPFRQP
         BwMfYkePk31jD22r3m0HuVTgk9pHQV1yIfcmpIYBrGbpoyV2HHsHDWH4TikTWH1K5uRq
         D6Hn4Fk5fgseuUXzwBy5WZHCMwJ3KssQxyeDWxhtmVo8F7F3nR16wNG22Soqggyob6ER
         rchA==
X-Forwarded-Encrypted: i=1; AKwUvBwU/V2Mb3ncxJY/0mK0fKJ/Hmq0+wY7uUTIrQ9e3bZ2VnjYOAE1FrRU7ZJuzY13oq+wYgsy9wbA48T+vrT4J/lxO7WQ@vger.kernel.org
X-Gm-Message-State: AFq9FYK1rFSi/L9S3ZEGB6bNEoFQfgpaBZIFB1jq+Yy6G5JHs6MsNRMP
	gczQQqOwO7KUFN5tZVbe3L+KFQ5OAeuLPfxVbBrfvp929Nqqp7Oj2c8=
X-Gm-Gg: AYBFou2eppHXAMw4q5jewWr6WR4Gn7R5NCGPYQyDespl/G+8Y7DCLlMXKbUPx+lSOV+
	45CF+gPfaWg20OdJFF5juwf56micilU9wjioGos5Pb0bgO5N5Sl1vUXf3p/yIy/bTjrKEAzbv3q
	DTLOYgP+3lyyDLAo3b4SIoUaz6ZqW5uf1THwg7jeiOpQyXaWpAp0O8tLr/ebPKiXilV7Og21nSy
	pu4Obvw4qgbDSmagxD62Dq0gw/je2gMYW3bYFcEfdkmOXOj0CJy2wMmhDGh0W4eMwSrE0hB8UCu
	VDRrLlzxcKh+x7fXuSdZ4K6DYHCh1CLDd4sIpZGuZybvw6tGEmxLJ1cL5sUHfA4FW78P8JvVYFc
	PiSkDtqWiLNO1nc6twB2nl3axwPXiA5Q7m61O+8rltRjr58c0gceHoz1AbaPREqPagwXJZXLI5x
	+v362j5r6/srdj6CQMbOzUasKVm/3mQiLR8C1J+uhKmTkU/tvzW9pXtEaLbzVUs1kvwA9fb3h5o
	jugvgMYi9g5oWi7LiFlaLsznDLzC7OERn9yFqwTjfDhnxeXn3JR9vYlWJztGXjs3r4CbAfSazy3
	zz1BkxreDw7EwwU=
X-Received: by 2002:a05:701a:ca05:b0:14c:1f57:3e86 with SMTP id a92af1059eb24-1993f3f1d75mr5747943c88.47.1792900981958;
        Sat, 24 Oct 2026 21:03:01 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:01 -0700 (PDT)
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
Subject: [PATCH 07/13] platform/apple-gmux: Add check to detect FSS
Date: Sat, 24 Oct 2026 23:59:43 -0400
Message-ID: <20261025040046.1602-8-atharvatiwarilinuxdev@gmail.com>
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

On MMIO macs, there is feature called FSS, we assume its
a display syncing technology between internal links
(for example 5K iMacs).

We detect it and then warn the user about it, if its broken/unavailable.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 2 ++
 include/linux/apple-gmux.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index 6a9580f27..dda281f2f 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -1224,6 +1224,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	else if (boot_gpu == 1)
 		gmux_switchto(VGA_SWITCHEROO_DIS);
 
+	if (type == APPLE_GMUX_TYPE_MMIO && gmux_read8(gmux_data, GMUX_PORT_FSS) & 1)
+		pr_warn("FSS Failure, display tearing expected\n");
 	/*
 	 * Retina MacBook Pros cannot switch the panel's AUX separately
 	 * and need eDP pre-calibration. They are distinguishable from
diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index 206d97ffd..a4fa84500 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -22,6 +22,7 @@
 #define GMUX_PORT_VERSION_RELEASE	0x06
 #define GMUX_PORT_SWITCH_DISPLAY	0x10
 #define GMUX_PORT_SWITCH_GET_DISPLAY	0x11
+#define GMUX_PORT_FSS			0x12
 #define GMUX_PORT_INTERRUPT_ENABLE	0x14
 #define GMUX_PORT_INTERRUPT_STATUS	0x16
 #define GMUX_PORT_SWITCH_DDC		0x28
-- 
2.55.0

