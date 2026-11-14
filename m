Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672595;
	b=S4i9pfA4MXJURt4L5qFLC668uNA9UdA5yFqwmnUlmlB6tbJ6ax+PDQZYlMFlOnbMnSl6
	 JOoTOkqlF1TQlrd/21x9fQ47vKYGy23nJOip1uaCOYXf2cW/guTFtVgk9tgp3xxBOC4Dg
	 RKu2XaDNw79sait1nXu+QGsE/5WRNTipY5qYMg58VgiMq6jXxpAGA0ghf+y7lAB6HSz22
	 Lvq8HsvBS1E46hRyZSFJ/s0ipYZYdrNs0jVcmQqODLIMCbxb02uOaRYj2Rrm5c5dA3Cee
	 hSBxTvehLZUF0UmrUQaeNsX6g5gmdJS3qTWgYUeqybBq7yGWcnh48CKJlTKmrFZlA7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Jd91Zwd/kmiwKW4+PLimd5fenaYkPvHETCW1wh847os=;
	b=aplGp46XO25Tky7yILv58fHwpm6hKqGYdyhfSQ3g287hut2ZKOA4YO7SzvNHyYxlYBjk
	 B+9orUOx/IVn1yDhLSSzv06JZK3vx13k5h2aiN2FP7xI16u96rP2BKWqI4nMVbPEkzd6d
	 EF2qXgwFG/FThYxkiUhmFo9GnA4eC65watOxs3WdmRtwf+EWPQb+W3LEK6ibvqnkG2l23
	 KaEsYDXygPo89GjVFWa3cEhpo9vFBVmz6NO41v3KmEiqQwBknxNhqUdPYNRwRrme/YIVN
	 idm/9zAIgDoxq8Y/u0JxP9SJUARNodyQ8cMBdYTOVkTZmTQuv65dSI4vj/noQqYEY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixFnXvAr;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9517A606A323
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9517A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ixFnXvAr
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2135528eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672594; x=1795277394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jd91Zwd/kmiwKW4+PLimd5fenaYkPvHETCW1wh847os=;
        b=ixFnXvArZqS0nOjkIjfV31W+fUV9CVbdsukSilj8mL0nf75pnBQfkYbbeUnXS03uL1
         Ll0LVzsyivFQOIFTeOnzIrR9vhpgzYAlP3qGhyWVaAN5CGvBoC4vvKT07oI/FOtGKjqa
         UnrgtZ7bUQ3PU2yRRzK7NRoy4zWxkcESr2g8jVXu7/vguPSHcbCGX6vWkmF8/zG2e/Bs
         3WM2TlqMOJWqQOv0HQyB0xH84McuETFZLEXaTfc+U6c4hfIOPGNVzrjRw+bRdfqtBB7t
         cMMbxqGDDQcRSxEDoiO1AkMBt5b3kW6Yl3ZWJdBfA9Z1bB4eecyLwrwQJAaAHVWbxcAj
         nZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672594; x=1795277394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jd91Zwd/kmiwKW4+PLimd5fenaYkPvHETCW1wh847os=;
        b=sysmFguJNeeuEH+Xj7295LJDwN1/ES61ff3x2T3g5sxhf2B5DJlivH6wU/HCFEcxr2
         //tSga4IhP76ngZ5XWlFETvQZ2+2WaF33JKXYVAg3cvBdg9wNXx5EL5Qaj26gXz9ugOn
         PiJiC38HLRwWJr/deYg2pc7UPhQl8or8ECrUqisLyO0lGfouGz1bi1jRbKv6RTki6lVJ
         TeF6NC6OGSfU0BvbmQxxrQ97ntDNtnXcd+V84sIueRIMPK2nvugY22pJFtIa9dX8H/o6
         QvYzSpI3JYz+mVP8gggGEJiToCWbImQbkLlJFMxw3TyypSZ+CxljK80NXrC78fprX+gt
         Cu1w==
X-Forwarded-Encrypted: i=1; AL+hErGBcO98dAJdfhxLhQ3vk5qVQzk/X6iCD57IZJto5185lfPPiSVRBoOZYEWfWTNGUczVMmK3QBr/72ZAHmgspI6ChgPm@vger.kernel.org
X-Gm-Message-State: APuU4Z+8cKpN0+yns+mxos6AIYkn0pD1YpKrDH4N6a7mkq3smhqnFWPi
	levgPb0PA7fD1b07x7zOl6n2wdpc2i+CiI8wIDGE2B7blCMiUsKAjFM=
X-Gm-Gg: AYBFou2T2p4RsVGzFBG4xiIY3PoICdO/VPamYzfomVOpq0E5AS5SZvG1pwTeUenJFxi
	641v8AaMrfNTgCyhQZO4TcYqGl/s6EMQW2RaUVsAk4bwNvt3VaOvEMA8UFEZ8uc17+xe0fymnV1
	ReyYFroUfM8M8Oj4tMJfmxwajmYWx3MIkVDgXiap+JeA3cHZQNgG1q81D/pJIQ16AVKn9Du8PD6
	PV9Bf5OZTB9pf7VcEF0R0r7FntNtmTKw8I6GsX0gAeqdrTcLouUb/iaf9NPPmfSceKhKlU7erXC
	GIGNW5d865MAONgT7rTVQGefZtZ3clqNbIBln0IveAvUw2kqhfp7XzAiKa16YzTkA+ppffcbMqm
	DIH8bguqxDMeM5YChD3okgdgCOzeJvRnjb4fH5omFVOsHL6KYKn7/8Pc7y/FRcIjBAOzqMK5lyb
	55e6bbex0VCH2vFwES/FAWW9Kvn+QXAGkF/NiDRowN31n3ufGv3MlNyuObVYek9abg1EX587Z76
	7I5cKJUFJqhe2M0TWTerYdRjhzlImmnJ3zkRNVF7Lph0ty5jCbw4yV3MAT/xJ6MShDysqUYtane
	pgZ/c7Mp9SM8RoLj4ElSbgufD4yyrDbFSpWW2ZcNYvBqmuD7/azGsP2Ah/quScPuktNqHyFQKnk
	NL6zPVOfH998=
X-Received: by 2002:a05:7301:4d16:b0:36a:1d6a:596b with SMTP id 5a478bee46e88-379675feb32mr5897107eec.29.1794672593531;
        Sat, 14 Nov 2026 08:09:53 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:09:53 -0800 (PST)
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
Subject: [PATCH v2 07/12] platform/apple-gmux: Add documentation about iMacs
Date: Sat, 14 Nov 2026 11:06:31 -0500
Message-ID: <20261114160731.3756-8-atharvatiwarilinuxdev@gmail.com>
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

Add documentation about iMacs

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/platform/x86/apple-gmux.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index a1b7a4709..4f5c98445 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -444,6 +444,11 @@ static const struct backlight_ops gmux_bl_ops = {
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

