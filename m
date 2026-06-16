Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BD4137BE7A
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jun 2026 01:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781574136; cv=none; b=WhKXsWdbY5mwFTmlypBTLkZyBB58qLG18OicrMF8oepjdT6fJ0S7wkv1IGBfdEQekKlG5FnGLG1Er8q5R/AXod4pUkg0W3DpkVYlHP9ROkdFmlxbzphJZ1SsXvRiV6/el5cdJnhNRvMzWESs1qKj4ffYStAs2wQBUbURNqX4HBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781574136; c=relaxed/simple;
	bh=jUsFl8/ce5V8oanHSv+yON6yr6+pMKzOijIrCgJm4fI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DMEL4RGSS1p5Od8O9J8eY3Sgczs2D/0pDIt7TafW2AtLtynoTOpUFoS+WOGNRa6JGvHVd3QRLiAnFknnKqbKc3PFQFU2+1Ggz13+c7xF0gu3xgJfLZoXceJeqY9Li7ClwpTxGtySVQ71/yi6qQQyca9HWTvKbqL+Ndz/1V6dO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnPm/j/L; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnPm/j/L"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490ace40f4bso37404105e9.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jun 2026 18:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781574133; x=1782178933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n8i62Eun9tJYzRtpRscONfgjNKYvwBB4pkq+CxP5Cmc=;
        b=cnPm/j/LMPTq9HqdDm2fEF8OS4uJjl9CUtPaIwP92PozvUj1r6K76GrVHe3TgCEAhL
         lspC3U7u9HNvT0gf3qdRtm63LZdTLnU/jShkoinfBqjinnwoMbMvzfJDNtQOh2SjdS1D
         q94DYHiukSwRdHjhPhIpwnqws09ewiFuKPv2WWlQkhemalp6Ot5ArURSZXFl7EtmCfJa
         dU9sgVEQVOQsyYwcRL5u9iLS1ieLgEk8vgyC3Q4/U1OEbyxkjNLSuuv/2a0hkcxpwmGz
         ner+4QmKVYjAYzSPyT1Ew7+i6It4u8HmAHsZwROWpGvOxPZksQ1Di7J0z0Q64LSutXl7
         sYUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781574133; x=1782178933;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8i62Eun9tJYzRtpRscONfgjNKYvwBB4pkq+CxP5Cmc=;
        b=MXcp161ggCHM4e8e60owN9PhUTBWA/1rUoub9kmjDIIvCPLtNz+P0MdzLQEaXJWMwE
         18TkXxfDi27QrR5xYiAdarXAK/DtlXk4iAoKsvSUhyFJesUmiBVLSKFnkm6OPmJyJF75
         A8Qywk4Q/gKuJG4vvFjJQoYNN7gY+bruVq0fpjkOM+JjzmS+9C15gxL7Zwwhq3A7ICUu
         l4BtvqeioERZeaRL/+CkE8go3YdzbcnpP+VUC05+fur7A9jOfYa2M9+4M2c0b/2j/T3n
         iCmxS/fjFqeUxEJ9zMKTppiJHXLQp+lQSUHrBbA5Astm9kTiIEqg/ap+wrHtP2dmsai5
         Lx/g==
X-Gm-Message-State: AOJu0YxZwwr3gOsfr5PKMmd6hopViJMuBZmIzDod171VHMQQ+TF0IDyh
	vtFEFq2moN8ugOeoNvBKeE2Z6Z+w9gg5ays9GIqu4IzSAv/wvFRkLDxd
X-Gm-Gg: Acq92OEPmdm5hOabJz081GsGWA88szjqCdrhraCCV75zNB5Tfl3xik4JPZs2oRJsysj
	VKSsw5/pevt6uTSPqT2/XbY86C6ksImC9DeZvPkzgir0WI9MCjsPpf7MNly0fLIah20V4XfIDbQ
	ypA2S8zmxA6bpJ6Saay9m7lxCLjkVcWKQPbSfTpRkdnH3TSSlpH/mdgrixEBSE3P0njKXcKC4X2
	MEHRJWDRjr789x4+SXl/fqlyF4pngI+zXGn7xgzRkGRGkTYMEGBEHcis3VAKXPjhLqw5osK6ois
	bHsgTnSl0OKpoOogEiI3IfYwWRN6ATWtV4FbDeGnWny40Rgic7Fp8O/n1xtoGtlI8B9VTX5s+P3
	6ZAmqJMJihyhBCZ6ioPERzHNw0qGuUwsnnsJOroGfZNRTRBuqJAWDavmFbr2yZiBeXi211Kdz3N
	t8kyYPi5U8DfRLNz+nQyj2foeoOdZXVje5UUvjdcDwiULqeL1km2cSszWVL6qaKVDySyMzY/jRY
	DxpTheO5U9ovmPTt9tuAhmhuI0pKpkU
X-Received: by 2002:a05:600c:154b:b0:490:d38c:7836 with SMTP id 5b1f17b1804b1-4922005e579mr172735635e9.3.1781574132689;
        Mon, 15 Jun 2026 18:42:12 -0700 (PDT)
Received: from localhost.localdomain (tmo-080-6.customers.d1-online.com. [80.187.80.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f726sm37231938f8f.15.2026.06.15.18.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 18:42:12 -0700 (PDT)
From: Lauri Sarap <lauri.aardla@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lauri Sarap <lauri.aardla@gmail.com>
Subject: [PATCH] platform/x86: hp-wmi: Add fan control support for OMEN 8C4D
Date: Tue, 16 Jun 2026 03:41:58 +0200
Message-ID: <20260616014158.816064-1-lauri.aardla@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HP OMEN Transcend 16-u1xxx with board ID 8C4D uses the
Victus S fan control path with OMEN v1 thermal profile parameters.

Manual fan control has been tested through the hwmon pwm interface. The
legacy OMEN profile path exposes controls but does not change fan speed
on this board; the Victus S table with omen_v1_thermal_params provides
working fan RPM changes.

Assisted-by: Codex:GPT-5
Signed-off-by: Lauri Sarap <lauri.aardla@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index d1cc6e7d1..ffe229ec0 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -221,6 +221,10 @@ static const struct dmi_system_id victus_s_thermal_profile_boards[] __initconst
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8BD5") },
 		.driver_data = (void *)&victus_s_thermal_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C4D") },
+		.driver_data = (void *)&omen_v1_thermal_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C76") },
 		.driver_data = (void *)&omen_v1_thermal_params,

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0

