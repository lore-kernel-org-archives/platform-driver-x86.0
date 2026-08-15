Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17AF41BA69
	for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 13:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786800386; cv=none; b=q3hxFsbwzMduEKUqcEVRimEVBkMmhqSpe17UCuyXeH2oLccJa/TAyL4AJbP2Nb7Q4xJcUlGuwszY0p04mTfNyrF6ITrTTKCVw0udhjFQuBPk5J2rVP6CgDPEHmki6GtH+iITiuUff2w8V5FnEKLKvbzHWKEVun4qH8N5ZZVqzF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786800386; c=relaxed/simple;
	bh=AJSa9Tqjmqi9/yxYOv9ccBJllSdCdY7tgSJDVtXbgn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QtdsPIzss6DwyEEnSDvHleOWYiqdDSQWMvx7lthtqwk/88PnIPTI+4GwPkXHMlrENdWS0tfkHYfcBZ/uRNa5Uj59jfSwRh6THAxumGNJXA6UJha6X3a+GcGglYIzePUo9MYYsrs+8KA51TDNU+0WXCDXDTdUKAARjVsP+Np9AHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VDLlRzB6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VDLlRzB6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccf2360620so19933935ad.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 06:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786800384; x=1787405184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S41r0oHYGLnRHn4fgbBbAuO/lenK3JLT8nieyB3u8mM=;
        b=VDLlRzB6OJovd/FvWjCun+vLbnoOWb8ul+w9YrAZhZE94DYV1JCPL6nTrj7K5eqIHV
         fYZeApJFu5LHOfctn26M6B0g7BVXxP5M+CNd9k5SILVAKeibzyhQ+vL1xPRtnax4uQD8
         dZiZ7pXQj4zhJ3t2xdWPe37lmEXsszKQU5xlnsUx3Tg1rTi2P9gcW2uXIb61M7x7c17x
         Os159ihMLLte1lKj8n9kXOPWO0A8lQZhpzVtXugLbIJW6rvpb1aBxAkKMTe6D2WIWYW0
         Kz092cGPzEsJ+nHKrewcKP0Onk3X3woDvnM6o1ijxalBaUR1iUHl13Dw8AwB8M+DUpZr
         qHVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786800384; x=1787405184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S41r0oHYGLnRHn4fgbBbAuO/lenK3JLT8nieyB3u8mM=;
        b=owPxq2kI/hYeKOsFNlBLM9AWPpFraukEoNs8le3X0cTpyTMENHwFusXFAG91/XYHGd
         sQvAJwSkh/J2mOgTgHCVLvamNpR1VLJMiJETwHaAiEI/Y3rVnQ+OUsU/YPZ3wQV3EF8b
         Za1EtqE7a6TwHt6R28euA3iTcbUQAk6tXFcE4s57WcJP/NOC+E1aIsjrQepFZVRlGZtB
         bCDqjQeJl1+eeP+w3D922u7fuULjngB2eK7MuMLmMixCPcDM/XOjRsK/A3b3Ea9d2wSx
         3T1RNqbSEoC7pLNeD86swhh44VsuHFaFKx5yT6BI8xba1CKLsBReysv7kYHENOy39NHO
         tTHw==
X-Forwarded-Encrypted: i=1; AHgh+RrNT3ErXF5idhMqOH1LoH+lnal2KXnfIVXTvtz6Ijlmeo2cuT97iHT9moiR/6sa/ik8+FZ5NrM5zc3YocE42KGwHu3P@vger.kernel.org
X-Gm-Message-State: AOJu0YwRZ/t5EdLu2yWzZmZMBcemxoqW2kwiuhx5uR2SqKasPB+cmtb8
	TEQvRzvvLmHU/7l52dkujNQPGS5/QnadME9LRx2KI4FB7LnS3Nl/rRgG
X-Gm-Gg: AR+sD12vk9KSPHdbetDbob6Sm41WuzRO+c6RRpyQZ/O9+6CeBresYW1rUixlObn2Fns
	Wrs7/ghjrlVEs+hQLh8++j+eKSgyRCt3WIew+Lwa7PNQ+eHVUINJ8QU0p1updQSifEXTA35Hdgw
	yQ3qzhmLFC3UYrKJFuXWdHuxPU9u/bNAywlMh/kIQOowdM+w6T35jq+i9/AI7BbrnnS6v25thTp
	nGAy279Rc+aYRPZxG2LHCUQjClMJ61eHTRcCUcN7gFqfZ+O5VAApRYDQx1c+2GZFDj4AAbdN/Ai
	5W8YOvSGq2g9H9DN1h6I69mi7QzOO1xi63S6KZtC2ZxLCBneuSI8fwkao6fBu9PP7FVxuGke2/t
	NduZDpppeOHSlA3MgSIYqEP4GxTbVhr47utZtViCqjQVKSM2j3kYMiaiSlj4hsqHH25BW4Kt32A
	PuojWOFp+zabCja21n58VeDaSSYjUQ74wPaV8=
X-Received: by 2002:a17:902:da82:b0:2cc:777f:d67c with SMTP id d9443c01a7336-2d3b0d5ed01mr130292845ad.13.1786800384339;
        Sat, 15 Aug 2026 06:26:24 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aebc81a6sm19433245ad.72.2026.08.15.06.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 06:26:23 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v3 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Sat, 15 Aug 2026 21:25:44 +0800
Message-ID: <20260815132547.29022-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815132547.29022-1-qby140326@gmail.com>
References: <20260815132547.29022-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing Redmibook mic-mute hotkey definitions to the shared
sparse keymap table:
- 0x00002101 (Fn-lock disabled state)
- 0x00012101 (Fn-lock enabled state)

Reported-by: Nika Krasnova <nika@nikableh.moe>
Link:
https://lore.kernel.org/platform-driver-x86/20260531123345.237521-1-nika@nikableh.moe/
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index 677e08430473..179e72516c71 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -628,6 +628,10 @@ static const struct key_entry bitland_mifs_wmi_keymap[] = {
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVIDEOMODE } },
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
 
+	/* Mic-mute key */
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 0, 0), { KEY_MICMUTE } },
+	{ KE_KEY,    BI_HOTKEY_CODE(0x21, 1, 0), { KEY_MICMUTE } },
+
 	/* AI button has code for each position */
 	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
 
-- 
2.55.0

