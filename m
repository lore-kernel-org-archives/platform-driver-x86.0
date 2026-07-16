Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF9A3F8246
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 09:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195704; cv=none; b=greK7STydRiE4yK0dmfP250GNMz/zMb98H3sxbL+CD1ctFWQfBG0xOg5yV9IQ5O6r5n4AwReF70FrL07NN1qk03oeE3lYl1iOIdpiAzgiPsktuzG7AF4uc9ji4QjUrK/Gfy1Y1L/rJy/5XvQWLXG2/9Z10flYnET1mNeuE7PExA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195704; c=relaxed/simple;
	bh=B/x2cE1aRmdbsUkUvPEg+6pLW7mDIwNEmNTYtJ+ShRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uc8qTp5PE2fCgTUIaRcJ/i9qT3JN8G9/ofHUSHOJEX/t94nor2A7DU+OblPiPqu8KXJ0KoQzCQ2jmHkFXakCqK8l+Bwna6ud1AIFxSTdUYsZNkvGZysNXVhoGb3MgQaE0qa1y6mfVbQKcFTqSfXHKsU3JoGPAp+nODdOm5OnWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mUflKkIH; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mUflKkIH"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15fc4707f5so62442866b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 02:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195699; x=1784800499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZR0fiEoMrT3fcHztK+7LRjThoe5LZhnQH2vt6jvnUM=;
        b=mUflKkIH3i0CHcsmy8g/vTLyxsY4qA+Yz8le+CPTx8Z4xZ0Hf4ywXaPWrU8gRFecrh
         mIUB20L+kFWVSmvuqQKcFuC2GVEX77x1cro7mmCtoMAWY6SSWd2tAvOx3Xq505Lu+qfQ
         +8Ub/6bJE0iq5g/nLPDgeS0YCSIRd6GdRmLqxHr0WSrTixiWIA8IIcAZg47bBsSxJCtk
         AeCF29zEKP+XGMJvOxmktXJzoB0cPYUt93n9diTFd5IPjomCGUzYST5Mcvf89A1PwFC8
         bz/EtZHpoH7sqlbKSbvPlhZusbwGbga/XArcGw08eb6UncszeZPKQV5lAOlHlTbItNUZ
         VOBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195699; x=1784800499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ZR0fiEoMrT3fcHztK+7LRjThoe5LZhnQH2vt6jvnUM=;
        b=luvQ+ceNC5zXgi0Uqek/DVbsmpfNegCkpbMK4rp44o3M8aO88osDtPm1rimtTxTYC4
         /Y1qOIe3SHhUOXJCfxPlyUMuYv7izvbM77/BqrN2+R+YbabjPYG2a8yGO/EAB56skqAT
         BI1Pr8pKfY2GA20O1Hvz3xplAa/YzNPkFGckaoq7MofYULcqeCjRdTfL+mkrsD0+zKlR
         gYEfX4HUL3GchwJmM8M55QF0nprjVQy7641lV4LlI6nwY0cGl0s7nig6bEJCFWdmoVDY
         AIUBXP1HmGzWfT5mbm9u4ksfNijltTQKMeVP3cMrAXCVX3PenyyRfLySKPP1bjKZcZN5
         kM5A==
X-Gm-Message-State: AOJu0YyD2DI0RSV98wHPxA219ESr602AF/5KriTataqjO3xhFPKk68Dr
	nG+XAjxw9qZGnj8lnD/fZuQvwfkAI/MnLGK53bB5fmNjBvtX2e/paWyGqiQpMaFb832vuLbl
X-Gm-Gg: AfdE7cm3kPYPSxMxSnFXFeX2wiqabvwgIpM2TP/8MBTST6TghsRKi8WjNbQcrzF1rUS
	IZYB2tiZ/CIyzVeLHqyGVbZsQQdH+noxwetg/616jYG5XoQEtjWhSZIH3mDxW7MzloKpaiNdvzC
	IULBbZVhPyG1rAxftNgWsxphAy5HoPf9uf5V1Omm6GbGkNxg9+o34mMbgbg0kxNRjFYDWcCqFzC
	htkYxVzd5LRmbbewaURuBqDqAT7VSQlk74dYFxa884tWjmZ4WT6Ecz0BrYmv3HuL/NldbQg0LpQ
	3o9ug5rPs7FEgWjG7/Ps7mIKuzMxYx/9bv+JPWfBv6VR/pnQiCVjZdmkxUFJQ0CGvZNPhsicxt+
	Yy8bdpPA/GTBTW5DvZcyFHFCXo4ulf6LTwAk0R0H2WInBoNInVzlJeSAY8BkqI1EXL0IN
X-Received: by 2002:a17:907:1ca9:b0:c15:b4d3:c0b8 with SMTP id a640c23a62f3a-c161f35ab38mr707393066b.8.1784195698668;
        Thu, 16 Jul 2026 02:54:58 -0700 (PDT)
Received: from fridge ([193.32.127.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e702sm178454966b.47.2026.07.16.02.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:54:58 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	edip@medip.dev,
	hello@kursatabayli.dev,
	mjg59@srcf.ucam.org,
	akpm@linux-foundation.org,
	jorge.lopez2@hp.com,
	jes965@nyu.edu,
	mario.limonciello@amd.com,
	julien.robin28@free.fr,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 1/5] platform/x86: hp-wmi: validate WMI response header size
Date: Thu, 16 Jul 2026 12:54:14 +0300
Message-ID: <dd9b30907b64b97b5e0ffb8f3e7440070192ce9c.1784195117.git.emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
References: <cover.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_perform_query() reads struct bios_return without checking that
the firmware response buffer is large enough to contain it. A truncated
response can therefore cause an out-of-bounds read.

Reject responses shorter than the mandatory header before accessing its
fields or calculating the payload offset.

Fixes: 62ec30d45ecb ("misc: add HP WMI laptop extras driver")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 5353d997d272..205a6020e9c5 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -670,6 +670,11 @@ static int hp_wmi_perform_query(int query, enum hp_wmi_command command,
 		ret = -EINVAL;
 		goto out_free;
 	}
+	if (obj->buffer.length < sizeof(*bios_return)) {
+		pr_warn("query 0x%x returned a short buffer\n", query);
+		ret = -EINVAL;
+		goto out_free;
+	}
 
 	bios_return = (struct bios_return *)obj->buffer.pointer;
 	ret = bios_return->return_code;
