Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792900995;
	b=5GNbST41QRu/N7eOval7SO5lV0GDFBSsR0t4+m+YfKrA5X3Ce2UWZHq9lh1iziJJDevT
	 x3vFrdY67G8X2MxnKKkNJI7EbSAFNshzR4sBUIO29QcrN7pXVuyRlBFKojrKhPdqNYfkc
	 wt0iKYAw7/q/gKbhHZmZm83fviehkBPimjJuLYujvtJ4fqQEKtH5FbnDm1VcdNzUTO4j7
	 9eSujKsEhv+damKrMw1PCIe4PhHvV5/XPadYGQDslLwKX68TU37Q4kGNlBj+ZuEO+WjmD
	 i4cTXFaJvgyoDwqbMNSXbWUFUMAe7CVlpkPaqjrqzhIfY2TNZBpCu+9gBEbZMfNK59A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792900995;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8otCCaRP0Tpt6gI7v9Cl/9PTuNgaCX14b6WSefLzu7E=;
	b=MwfBEXN0CTY8sE2c6lN4BRnBmKcd/IkShSnwxhxDgza4FS01Koe2WxGPt/NArvuqgXJs
	 csQ8bM7dA709Ag6a1SPAzjkVawARfjMbfQtHVFlMeFVVFPEHSOcZ5A/QnL3BcXFpIQs9o
	 c2S4to4uX3DEsGq6yCX73jpEy4nCdSPCMjU1SbYxlqeagm9pc6978fqkf/Zr6qK/be4k7
	 SG0+cdpWeKW8iyHkORJ+6/WlDbC2Uj42SOFQH2yryiSjKD+OoWUIChZYHPCrGLuQ2Q84v
	 3XBwE4L3BewKD7a3nihdVoBBL9OsBvYvdtFNj2e85rw94Xeud96y5nk6lv25lRREivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EenkfJyi;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7399F606A326
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7399F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EenkfJyi
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so3301632eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792900995; x=1793505795; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8otCCaRP0Tpt6gI7v9Cl/9PTuNgaCX14b6WSefLzu7E=;
        b=EenkfJyiA3/VYe8HyQgDdOUHVOSNvWURr4ZBMWVcbQxClz1YEQgD9UiU5XUYDA2tKT
         45lTtDdSuNDI98h9aBuzgrXcZfNiYFkrTMvq6ajLGJkUTxy9+I51Ll5FW4DrQwC28XCE
         wyzFDNqjxnZCenhfS1ADboNBN8F5gflbHP74HY7jZh9+ZXf0F9ggpDi3w5pui0VfJkQ+
         N1knlotoTJJ+8g6mlRaum/eiz6z49DYGn3LXkDn4YnqM1LM/FXYHo3GAZrDguQqt54JI
         fIJK1YaJCW8PtVvjGMWufuV0/pQDdxNBBbwq0ob7lmEpomX8xUyweUqymMPr7WsvljTg
         74kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792900995; x=1793505795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8otCCaRP0Tpt6gI7v9Cl/9PTuNgaCX14b6WSefLzu7E=;
        b=HpsNi9OxTYxl4k0MEfEh9qHSHPhu+hrgIIvqGwZEzK8uQtNXKz9WQzesOTn/BmB4rD
         6bSOt4QCv8K0/CtbYOC2Zka2e8OxuDSX0v+jzz2Nk5CttnC12fhDPv/OuiC//hJL7H8V
         R8kVRTazt/cJIcfE5zviC9A8ORlxfmhU6Qdc+2JDcnPgcSoMxvA71P2Fq8xV7Fh/CV3G
         JWTsRt+UcxhTB3wRYIytOyhTPE4sNm+jWcA8Ja6FZt8kB+Y+r463cDQaA2wS7B17+xcL
         nlBRe1oD7ZQiCLepbQgtDH7zfe02d6xXenHHAHAR13O2IVHZl2BMaI4e3NgX5+9aJMt3
         P+4w==
X-Forwarded-Encrypted: i=1; AKwUvBxxL9lxu6HZu+2nyhH1+PDa1elTHhQohy2LCcuzOoMlAYoY/RrW15mFTMtuzGQYgh7yIvSRoHWpbEPkku1hBpeRIkVe@vger.kernel.org
X-Gm-Message-State: AFq9FYKMAhm86dVrDUodjUTcqP0YPurxsnYsU42AVMs6g/WqPqWtitQ4
	6oi4KbC2gCOdWneLxpkYZhoSM3aonDMpOx3JUaJRaBfNmNB4NFJ7AN4=
X-Gm-Gg: AYBFou1PUdYqeRrcRuIvKtHKLnK2saWJsd/afDWxmQSt70m+QS1XkZUiC8np97ORnOM
	bGyqLj3IgCw2KtsnsXVTC+l02/jR7V7sYp/YlgZ4Q8KZV4QXm6QKxY4UmrtAkLHgGgyJlEdUwRM
	3G3p2k7aOrTj4W35jz6MbSmZPBfw2Og8T76nkZe6M1aTBx/5JGSDeoPwdm52x08Ojxy7GXx6Ium
	luCy/PI/GXPIDlESM5tGQ45mkXKPoxIXwpPLovFEcljkS+DsxeEhk3/LzfSU7+iimwTWazFn5Fi
	eZTounuEsymtEaIM/ROSTh9MEI4jDONaw6oHKsTQ4kg215VZBjJJpPT9ta17HiZSGC93fwiG4NN
	O+vneJJmy36dMRVVqkjqCxuzBn/ypW7AkyAIyd1hHhz4jHscaVK/P8pBcY+c6tVb/t3N36Xp0BU
	hRh4VU35e35Vz6l8agsbOjzjiPZo/xBgK8xY3KwF4ZYL3Cvf8/4opOxtCWVhrSSRP6TmbhwkVtk
	FBp3/mc67HLqG10P52ULy1btUe0pqH27qcvms5UBnYxPypBhFPkvuAZWl8FMM3CxCUc8vco96Fm
	SGi2wmw7TMYY2jo=
X-Received: by 2002:a05:7022:297:20b0:196:82a:b80f with SMTP id a92af1059eb24-199374f3409mr4222106c88.45.1792900994550;
        Sat, 24 Oct 2026 21:03:14 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:14 -0700 (PDT)
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
Subject: [PATCH 08/13] platform/apple-gmux: Add documentation about iMacs
Date: Sat, 24 Oct 2026 23:59:44 -0400
Message-ID: <20261025040046.1602-9-atharvatiwarilinuxdev@gmail.com>
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

Add documentation about iMacs

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index dda281f2f..9f0e9ecbf 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -453,6 +453,11 @@ static const struct backlight_ops gmux_bl_ops = {
  * switch the panel and the external DP connector and allocates a framebuffer
  * for the selected GPU.
  *
+ * There is iGPU present on iMac's aswell, and we can enable it using apple-set-os.
+ * But there arent any display lines going from the iGPU to the display. iGPU is only
+ * used for offloading then, it makes sense as iMac's display are massive (4K or 5K).
+ * A integrated GPU won't be able to handle that.
+ *
  * .. _US 8,687,007 B2: https://pimg-fpiw.uspto.gov/fdd/07/870/086/0.pdf
  * .. _NXP CBTL06141:   https://www.nxp.com/documents/data_sheet/CBTL06141.pdf
  * .. _NXP CBTL06142:   https://www.nxp.com/documents/data_sheet/CBTL06141.pdf
-- 
2.55.0

