Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672581;
	b=YiQZJPhtuFt4EOdCaIoky9Kox9xtSwJSFCLM9rUZZMfTsh7LsvkttgPFC5N40JSRATSx
	 RQ6A+O2FizA+FjyFQNXbsSGPauwD0oOfOtJTHCrPzRqdy71sbAkUFqzQUGfPVtX3kXOSC
	 YhIIMq9VU/GNax+R+cDvYMjiEqg1J6bJaJMapfs5ZYshU8wI3xy19/RCAtujGgXbbD/tA
	 NQLS9ag6GbKt3eDrZh5WuWa9Nf+DO4Btf7OGqqwGFBcpyYoYuj0lJ21sTJg53CNBZ856M
	 LlFoLsY7tiBvB+QO9CWphuwX20tCkXa/rU5fvpFIqS/NXkczh/yJFT0v/1M8kjKfm8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Ir5z9ASuMHPvYC0aOx9GZ500HHk9wmpAKRwADGNQH8=;
	b=Nv4+EN+1I52XOW5IHCjXnXH16p7PslANGjoOaQfK9exoPh6kiFrTzyfF8qtVPHDC/13C
	 pWwU0pjkBLHkbdiKXpk2k6Ev5tBG12ICtFIUmXiQByZRXsYnqOJsRVV02rJu0jO9ZtGhH
	 i/29vbaLF7c4so+KsfmRqsjlPhJmfnE1yeBjTuNCUJY5aykDhqZ0UsrC8hdMzbx9Z0gZG
	 lGCVwXJ7yZFxiacJeu+Sa1ROy16wuAeH4jf/jcFuPaB6rdYJZaxNaULP/7ZPPt1KIDExs
	 Q0fbdkHVKrd26xi3WjbmxYrQO8201N+7Pn956CZEpx/uhyVrhSy4VIqLjx9WashEFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIm9AAin;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BCA606A32D
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86BCA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uIm9AAin
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37986eb6fa2so1680937eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672580; x=1795277380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ir5z9ASuMHPvYC0aOx9GZ500HHk9wmpAKRwADGNQH8=;
        b=uIm9AAin37f1DmnmWI/WA9iNizuoMxHTH/ZK/2yI5YNDPtU4tz+Hz3DhfXXM9tWIR4
         NusOf9ieQA4sgvFT38yKJChg1gqwaKl66YD+dkdgfbGZgPcN7xPZ6ZU7vCfUcA5H7DUT
         yH/b7JTtmoCxMMWAFWXI8hcf9C3Enq/IEJzM+OPQ3AU4tp+GTLbSMCCoWL/NC5mv2ENq
         Ag/GKZrZnJFu3qLClJ3MiEVjZc2D8+EYHNTCER2NauyOsYT6wHTVDVPNM0g5B6vhE7R8
         JZJ9xXI77qfuRh/U4Q0WYCg6Eerd6b8o/9MxSpnIvt24SHTVopZmnlqaZkm8kJ1XNv9O
         2caA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672580; x=1795277380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ir5z9ASuMHPvYC0aOx9GZ500HHk9wmpAKRwADGNQH8=;
        b=MQAmLfnZbW8Ep4L2hgSOsPNFyrJs/tnR7rpJvw2DatJ3/vjk3/dUXoYXRj74Z6l3iL
         h0lmglT9AJWDtLV9ku1GFyRRO7WU0yLKq4XvVib4u6I3gifWI5VApowUmlWQy25UmK9W
         CFnpJKMZfuDIwyMNUvpLJ/WiJ5vNhSYx8RxzY1plBWJenUiJFy0uaun2u+SzjHavPWH6
         y2Uf86sRBE5zzE2qQ2D2N2DOS4cbNLaUwPhXkqgyutcDs7cb7LxggoHmQC/bkTXps0Tm
         V4wzo3rF9vjEH4I4YaG4SiW8fMVLLySzOGAvscK6WkWwhvytSNit60dv9CHpj9HKv88+
         /bPA==
X-Forwarded-Encrypted: i=1; AL+hErGgAbRVARj5QeTdAcEWLNp9QW2kwBIOWc17N1dHTZRodb+yO6Vfjohg09R8UIaIZs68TPt/6gIeLngl2d6g9YG+6oje@vger.kernel.org
X-Gm-Message-State: APuU4Z/JADUDtIdbKvn7H/oOw+IUwLHiQAK64b+mNlAC0tBCBtbXYW5u
	hPzERC+rj3SCKgW+zrasjN+JuWCcunXFYGfCmg182Bm1XSZ4y+0Zkq4=
X-Gm-Gg: AYBFou0+lGp8B9SBHzcI7H6Qn87eDClrZtBT13xw7tQadXiFqQUwQ0nRXBjv6R2gfpI
	FfT4mDORvADoVBhT9pUXOp/sKd0ht7KvVf/VIuO/G6s4w3qEFm2EulCTRbmGFNHdp/ZZiE5WQfM
	eTv5NZbEbGN4fgD6UEsxDxdCDawTlQZD/tgKvFH0Z6JOqlQWNKrOgZQgoXXvlAuO0zcR7Gs4pAM
	xTLYI4sasX62bqWbf5rvha3EPYwEmkIw0NQwKdE7s3XzoF+OBRzbRU8VZuc7+g5NHVtsKMVRtpl
	QpNqTVuRdPRA0w4EyoMq0W0oN/ZXXC9SnkBMkEsUZwIUxyI/EeDxfBg+lS0nxOhrwWI5wKZW0qR
	PT+56joCCsKm6rnDTLnYcOA5E6WN4bbC99mWvtYllQDOP/rSzvJYpRNaKkseVK2l0sBUTE1l8Ue
	Fz1hIx23h6QCj3RTLT4jiNBWPJo1qBblMxCZTxO5tjyzaKvt3G6zP+sNqTjJ7F59Zafd+tIaJLb
	0Wmz0/HmdnOlMKOmMz+4NpvlAz8Qf0xKkJVhJWF98hkhXLPkLrSbWWOQn3LP4xff4Q9TbVP7zfl
	HL8EffD7EokRnFqF7E3Tb1YH2gpicn7Q2y+OVZ1bRSX6jILNB+PSUlkID+w8FW7rNXY=
X-Received: by 2002:a05:701b:4648:b0:19b:1202:77f8 with SMTP id a92af1059eb24-1b503192303mr5750642c88.32.1794672579670;
        Sat, 14 Nov 2026 08:09:39 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:09:39 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
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
Subject: [PATCH v2 06/12] platform/apple-gmux: Add check to detect FSS
Date: Sat, 14 Nov 2026 11:06:30 -0500
Message-ID: <20261114160731.3756-7-atharvatiwarilinuxdev@gmail.com>
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

On MMIO macs, there is feature called FSS, we assume its
a display syncing technology between internal links
(for example 5K iMacs).

We detect it and then warn the user about it, if its broken/unavailable.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 2 ++
 include/linux/apple-gmux.h        | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index c4a953b5b..a1b7a4709 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -1196,6 +1196,8 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	gmux_enable_interrupts(gmux_data, 1);
 	gmux_read_switch_state(gmux_data);
 
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

