Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3018A48422B
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 19:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080314; cv=none; b=YlMB9ZwKwHCdBuIhsI6AV5lFxgVMIATZvMC+ul+HmhBjusUc6tHKwfbYEOZRJSKDDQu3To7xd/01qKAMmZyWQiJhei67X5JIzfmvg6yT9qmOmgX9ZHivnZ0f2GDQrReap05LCuIpz9YgGRtxfGymqPwC8/OfF56HQQHdtpTUP+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080314; c=relaxed/simple;
	bh=9Q5eGR71QZ3FJ3qEs4Sx5aEi6jeXzBGzd9U+NtEODO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqwUAupNndIYKLdkTxgVwGMWLKGblS1urgQsYe0u6072dCRYWkEG/dENYExhWfr5KBbSmgkK0c84AEq0Kh8nnYqdr9upzeG4f++b3UcOoRKN91VtKBr+uglmIk7pVtn+D0e1IeqeWZDF5+kTa+7J98IUswQciDgHyKS4QEidcWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kal4Nwrj; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kal4Nwrj"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15cb6f5c12so25547566b.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787080310; x=1787685110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=73lLASQPtBYGFw7DMYZ0GmbUquwvaiOv1unAL4Q7bq8=;
        b=kal4NwrjvV58EH2gWR+tjOeU5UG5eOg4VwBd/JqPCE+wPsYjCujvFCLA/7uhnEvMjO
         JsrluKJ8wdCSO8TWpqqt1fkUCylZca2sAcGAkbgosioXd0T3Tf9aFKhujD1n69EUdgat
         RKLaa5hvaZHqWXC75bdg6igySZCcugKYyKjo7FdznxCG+HzIKIozFXGxuwKvBEauO0eQ
         wvGhQuCL+FnoWuVTOOXbxPgzd/I0hzWt3b1f3Ha9RTxMo5EJim9IxhUKu8cClG8k5IYT
         KFtjwvz6P3IRvb5/V/rbLd3dm9CSxK1ttHQUPSgjXRu/q04dmP5rjeDEYzekHCNSCaC9
         uRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080310; x=1787685110;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=73lLASQPtBYGFw7DMYZ0GmbUquwvaiOv1unAL4Q7bq8=;
        b=max4X5di4JeY3FoRTA+/sFZ7JnYDkK++1Gk/235q61Jb//vBMk+3SRsxGCxoWmqpJd
         X+gtUemVJC2KpWxnqs/llVhYjQH0DCEeqfswssN1vjL6AN4KHq5gCHxa2dQIK9osauDU
         So8xlT5+By7AvgGWTxuULd5BAqJ7JKOrwrZtVNlg04/fM2mgTFvjrfDRYagteP4BLITy
         7gDjBkzOF7qhw+xDBVo8Emh2u9ZBwa9avir2GY+rBcQOXwop4qsx+B1qQH9QwwNOUlZt
         LZ+nZKQblxPoC2GghwoshIIxFtB2WjIq9AaId/ZLbjUxMCn5w3VhHZrtsliMjAOGQktN
         gJlg==
X-Gm-Message-State: AOJu0YxXcYfRyVSUImOaC12JlkWe6+NiixZzWZ8rSK/dtcLUmnntbFKn
	GKE9ybiv8XXE3n9Kf2FGou/oreyuau4XnN6KVzL1sA2Ux+5vi640ZN0oYqTOMEZ9teztWw==
X-Gm-Gg: AR+sD10iCiwlofOZFf3yjEBVU9hE9yQut7Daef8OIG3tF+XaFwNnamlUOiYa+V7/JwQ
	eyQl3Syl+jg09T501YUKVzFMNYw0y84V6bWPFzHujh1xigfmd5waQ5w33m/Jv/KDxraQe+I0Tkm
	+uNkNjPaUfLmf5SsuU0Ki1NzKG3HWqmtgT+PioopnJogy8q/i/Wg+AlwasJY/4gzVX7ry9xvKDl
	s7cAYL7vABuuw0pFzJzOzklx5lB+zSznyoEkTr5I0L86+nwwXwfKy3bw+fvSMsxhjrzf6hxUqOm
	BSsoIgVRflK9i1nHN7DrxOAtb4mQc7wlC5YvXUwX7iXdhbye/bcfU/R54tTgAx3hFX8zLc5e8Ny
	E5bqraDwnBs3TgDKBKEMg/9hQGOtodMQsDmAXN9WnNn/xqrrgAsltLSjTMIro+oFE9HZWmzq4BG
	13g7RW4LH1+4Q4UcmJRStrbjc+/Wyg5VNVEDO5I7HiyaismT6r3yPysE5GnqciGE9cRdiIDeuvx
	R/uyUKx6VtZB+XsusPjgg==
X-Received: by 2002:a17:907:94c7:b0:c21:f41:e192 with SMTP id a640c23a62f3a-c222a0ee20bmr31270166b.26.1787080310180;
        Tue, 18 Aug 2026 12:11:50 -0700 (PDT)
Received: from fedora ([2a00:7c80:0:3b5::11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8531694sm2291552a12.11.2026.08.18.12.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:11:49 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	Josh Snyder <josh@code406.com>
Subject: [PATCH v3 1/2] platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth token
Date: Wed, 19 Aug 2026 00:11:07 +0500
Message-ID: <20260818191120.38556-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191120.38556-1-meatuni001@gmail.com>
References: <20260818191120.38556-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

hp_calculate_security_buffer() special-cases an empty authentication
string and returns a fixed 4 bytes (sizeof(u16) * 2). But
hp_populate_security_buffer() does not special-case that same input:
for any authentication string that does not start with BEAM_PREFIX,
including the empty string, it always builds "UTF_PREFIX +
authentication" and converts the result to UTF-16, writing a 2-byte
length header plus 2 bytes per character of "<utf-16/>" (9 characters),
20 bytes total, regardless of how long "authentication" itself is.

The caller, hp_set_attribute(), sizes its kmalloc() buffer using
hp_calculate_security_buffer()'s return value, so for an empty
authentication token it allocates 4 bytes for the security area but
hp_populate_security_buffer() then writes 20 bytes into it, causing a
16-byte heap buffer overflow.

The authentication token used here is the current admin/setup
password, which is an empty string by default until one is
configured. Any write to a writable BIOS attribute while no admin
password has been set reaches this path.

Fix by removing the special-case early return for an empty string in
hp_calculate_security_buffer(). The generic calculation that follows
already accounts for the UTF_PREFIX correctly, which naturally yields
the same 20 bytes that hp_populate_security_buffer() writes for an empty
string, avoiding duplicate logic for special cases.

Fixes: b2715aa2e135 ("platform/x86: hp-bioscfg: spmobj-attributes")
Reported-by: Josh Snyder <josh@code406.com>
Closes: https://lore.kernel.org/platform-driver-x86/20260402-hp-bioscfg-overflow-v1-1-6985f8c9e67c@code406.com/
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
  - Remove the special-case return entirely instead of adjusting its
    formula, avoiding code duplication as suggested by Ilpo Järvinen.
  - Credit Josh Snyder who previously noted this approach.

Changes in v2:
  - None for this patch; resubmitted as part of the v2 series.

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [v1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [v2]
---
 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
index 4d94e48c1a4c..136585141e6e 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -47,10 +47,6 @@ size_t hp_calculate_security_buffer(const char *authentication)
 	if (!authentication)
 		return sizeof(u16) * 2;
 
-	authlen = strlen(authentication);
-	if (!authlen)
-		return sizeof(u16) * 2;
-
 	authlen = strlen(authentication);
 	size = sizeof(u16) + authlen * sizeof(u16);
 	if (!strstarts(authentication, BEAM_PREFIX))
-- 
2.43.0
