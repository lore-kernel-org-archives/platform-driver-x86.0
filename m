Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601AE3B83F9
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 15:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206112; cv=none; b=lFL5KzXNpmJ3e37GFbc3876HZfupX7VY7o/MBBAagIaeQL3tPvFO6h/t1cxH5QrVOF4WcP7IARm4/TSqs3+U8TEo3os4jJQ60C6avVHkdTGPxK5/dXEW/gIC9IxfUPf0wiqvig0THKb2pKFDid0ICIWR/CK0CA1U8q6aREd3ykg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206112; c=relaxed/simple;
	bh=0qxlwSEBtbUX5Mbiayq3T5AjFL3tkdr15qOZWNv57Z4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eFAl/xR5ehQ0TMg/S6havWDzOCwjWkqfi5Kzle6HjO6V9LrwM+BQjNrXWkqv5B9TCkGGvjnjZnKhs7DzHFVoO0rlN2wSyyMlrfRb+yduW2KBKV/NlwM6THvdlSawp1ft2Z2oTvjHUwV3mhAvtWax6FEtBCsnpqRmJbqH/I4rgkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NjHknIqx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NjHknIqx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso32325325e9.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2026 08:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779206108; x=1779810908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmoB9de73/KDDkoDtBGgd593icpTpub6hzqFGag/CKY=;
        b=NjHknIqxlwJ1odXiWcfYs9Jz4Y9oBbetVEif7mH1mkBBF0kngxzTs/oi0euC+3FpRt
         RCP8aziMmjXs/r5nUeFDMFLX5QGkMKAxLU0HT0olu5/2Aj5wPCoh3tTp6UIt3/wqbXmw
         GatvlJ/w+qU7Z8D77iwMRXfUJTYsSQu+azkzyp2TyFxnDVRWujMoDQrOmFYUSoAPKUF6
         zQx3WbW66D9J47hQCY5j++DrlF9NUyJ+OlTayfFLAOyTT37ka5MBfti1ZHAX1HEsJ0PL
         xWb+Hypcw4VtsU4cT8EJdM5Tk2j4rd/gPkcL9KXwvns7o0WLARi1cgw31ehYONKeelUa
         jWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206108; x=1779810908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmoB9de73/KDDkoDtBGgd593icpTpub6hzqFGag/CKY=;
        b=Dw0yee+FcDwJNjjUbJH3iBGzivXHC7Kvz3VjL9e6+tDi1qq1F5HrXLQci0fOiTsq6V
         4l7X1gl/hbWyMmgcet+SpvQRiThz6Y1FPTxoouFPrJ6Q//juyGV1HybFPQ969mqc9I5p
         3FSK2NplyC4NJhcCEyYAGpXW/VVLW3wsOW92vz47hkqab9r8gwQNOfh7P9Xq2c4UWarr
         burOMf0uLWDaW0V+hroQ/ITb+enVVvNg4/vcuiJm62iYhM2x3XYNWvZ4PtC2jyGztlF/
         DHEbdZO6vnmfQhj+bXwJ4oSe+QQEyvUPuoDwgaIuyVT5MCxYC+msBWLR9qIJndHRAKB1
         F2hQ==
X-Gm-Message-State: AOJu0YxnspVlgjWJqRWQYulk5p54vvqRmHxg03PzAKDOdgjU+JEEQosr
	dGqWw7TLdLD0Lro0MmRhGUiDaTdAEZX6SWkQlw5pGsrzfF3ZNadE+OY5NBg/8bqaftM=
X-Gm-Gg: Acq92OHOOE4dkdS6i0GTYv+t4wFLC8aefWK9E6wAI4T8vOUbs/7PDIlYbBaX87zYKZj
	+oF8a2u3EqC8ue4/9jVXaR/lPZIv3Jm5+56u9hme+2USQBLtK0r1Py6QBjpIaupMvwOeOevuGc+
	ZrelHVetvHNScKEGsBM7RXTqkL5kPcb70ltXMcNwWPgobrBIRaRZ+A6k0FPjYpgqHhc6jOnqnSj
	EGzzd8TLVhp4QHVBi8Gjlz1ZBFdvm8+janoN3BXYKFF9HsTmd6jnKWHxucdu3M61rsDJPgOTzFz
	fIvOVJwO/UO4tzyRWHG8H2/fuWihCyef+vqL1D3NopiBFpr0sh86LMTpgEtdQBD/yBXFnRQw3bX
	VSCPu1VmylH4uPtIWiY5A05RP4APkFbwEMVcA6eN63jA3ez/fn96wqNtw4CGetr0OKV3qOb0E7G
	SK83LBQMc4G+dy1iu6Fzj5/idqvBw6DBVuTP9AI3ZaYwMaSNqMw9HE9PYjb6nkfRGckMBrL6U=
X-Received: by 2002:a05:600c:a11c:b0:48f:e230:8cac with SMTP id 5b1f17b1804b1-48fe662a1cbmr231983635e9.32.1779206107539;
        Tue, 19 May 2026 08:55:07 -0700 (PDT)
Received: from fedora.dev.gazprombank.ru (yeal.ru. [94.103.95.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe582d0sm133723775e9.18.2026.05.19.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 08:55:07 -0700 (PDT)
From: Alexander Egorov <begeebe@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	lkml@antheas.dev,
	derekjohn.clark@gmail.com,
	samsagax@gmail.com
Subject: [PATCH v3] platform/x86: oxpec: add support for OneXPlayer Super X
Date: Tue, 19 May 2026 18:51:24 +0300
Message-ID: <20260519155124.3240359-1-begeebe@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260330101028.876277-1-begeebe@gmail.com>
References: <20260330101028.876277-1-begeebe@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

OneXPlayer Super X identifies itself via DMI as:

  board vendor: ONE-NETBOOK
  board name:   ONEXPLAYER SUPER X
  product name: ONEXPLAYER SUPER X

Current mainline oxpec does not contain a matching DMI entry for this
system, so the in-tree driver is not auto-loaded.

The tested Super X fan, PWM, turbo-toggle, and battery charge-control EC
layout matches the existing ONEXPLAYER G1 A handling.

Add a DMI match for OneXPlayer Super X and reuse the oxp_g1_a board data.

Reviewed-by: Derek J Clark <derekjohn.clark@gmail.com>
Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>
Signed-off-by: Alexander Egorov <begeebe@gmail.com>
---
Changes in v3:
- Reuse oxp_g1_a instead of adding a dedicated oxp_superx board id.
- Add Derek's Reviewed-by tag.
- Add Antheas' Reviewed-by tag.
- Use consistent submitter identity.

 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index 6d4a53a..99c0dfc 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -205,6 +205,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)oxp_g1_a,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "ONEXPLAYER SUPER X"),
+		},
+		.driver_data = (void *)oxp_g1_a,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "ONE-NETBOOK"),
-- 
2.54.0
