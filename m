Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1D21A9F90
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632608; cv=none; b=XLhTxAwmFrcaWPQxG57rgtWAVQH0cP6FrwVPpk5ayCTpXsVnKRbqyNoh9h/2Y/8aX9IhMMu0fcnPf7VmZwmqgwiqKmnloshOTV7QddPJKV5giqHmvchrO3YSkfapzjltrdYp3Qslpk+TVZszDqlirUd6Mxt8CIDSOLC/U8JQEyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632608; c=relaxed/simple;
	bh=wpp8SCNt3PBaPVv4+A2aOAq8RpTIFj3h8vfOWDnfAOk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XOE1IjYjggGnBorWPtgQNK50Jmr0RkuZt6inh7XX/2RSFk+kyzVuIWECwSICU5pY2KVTLQ3wqpb848nA83zeGOVNvVFBymv3TBpOwImvQlBmGlyFbf+RnfIMbj5LfBDeOB03TfQLVxJ2nHA2QoZff/MeGXMXtnbJ2eKGfmkFhHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KucNEHFg; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KucNEHFg"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-905b08b09f5so631408241.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Sep 2025 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758632605; x=1759237405; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F73E6U53H/w94yrFY6Xvg9pWLVLRguXA2GtqyonH3bs=;
        b=KucNEHFgxAPzUB958d5/7VRM8z9+yfFBO+ivjJ8NS7X/uJMqEgMm2ao29k3rA1KwKk
         bLgGsKQUzobnUmTQT2ks6cpzieHN7//7eQAHa2PuGiM2b9kDBgsh741NW6IMLEOOd076
         +yw6gnnqznUDNtO3ulFD93Uk91DtieEI8QKvHuDtO0EwRlKvEu3jQHMJUPVzHGS6aI3i
         B7BBXqI5IXxD3kESgQkCm3by0vvazGXF1R7VuJP1PNF+zHVNEV7QoYkOC+yaEm95RTTq
         2Ji4S3jdrfKZkDwEiI4t4GLFDIqxaCKp0uppamI/VElSp4Ov64/ihkGC/kaG5Kn0efm9
         1Wlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758632605; x=1759237405;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F73E6U53H/w94yrFY6Xvg9pWLVLRguXA2GtqyonH3bs=;
        b=dPEaNVB/bfhJlB10Qa2pu4kGqb0Nh9V2NYCk+/10ipqE1S7216fDnASfNULiY80dTo
         6XyCbi33hUxNZcxb4XR67bgaLQ6HXBxjaqMkerybBxR5YxWGDIQhB0tD8k6ixCZenhaP
         zATFeHToMiUy5iYHMMy64GNSVQVpvY9nya4PNraQWHlhQ+Fsu3YrfpWOOt+Rvxl+mRXP
         hN6b9jXzfE064qptiOeRxCj+lYoJCHHYMEEw+uu8/QUsh63rz1hkEY7KnQe4UxbVeK9+
         rECt7GCa61xx0m8OQkFnVuepD4APk4asetU2CS2RZOHgMoyNdhaBfzuGiVOAEHKEXtdV
         9xCw==
X-Gm-Message-State: AOJu0Yzmf64H8yKJyGzb8+x0mttwDMhNs0rustr6o9U56OXAmYygkanL
	2UWAhao0DquYD69emHeb3/TtKGx3kdks26nTwBf6pn6Mj7sV6RnFi57IOzhwUEmziQ1VsdknFGL
	P0Xc9Zkd53M4hplCwYtjNeWPEwMtxZf8YUIsI
X-Gm-Gg: ASbGncuHbwJUamvyJRkutC6p1GNmAi0UtmZlTWsULYTPvuUGP78TVHwyK8mYq+a1yYH
	I47WGdcGMbQeHWJLFHXHGM9XHVbMruoqJe4L042SXa14t8qUiZS4TkNuH+5hFO8DGWahwKum+gy
	IIWr325s/nB8EDTY6Z+iUxDBmZi9DUSiwoOjBbNsGsh0iN4rrsWPVix01dl81KrYHU3p7H+D7oo
	z5TMK2OYxVxViRiH++yeJFp2/mHdTto0ot6DWIA
X-Google-Smtp-Source: AGHT+IHlUWeOqqFgx2VTsTISGolyzU/GD3Ke+c7xkNJAb4YmxQpA1BUfEB/5oy78QGjTiQvX0lsEGSFbsAtvMLcCcj0=
X-Received: by 2002:a05:6122:82a5:b0:544:9a46:7c85 with SMTP id
 71dfb90a1353d-54bcae5e609mr766920e0c.4.1758632604695; Tue, 23 Sep 2025
 06:03:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: L Lawliet <kmtechnical2006@gmail.com>
Date: Tue, 23 Sep 2025 18:33:13 +0530
X-Gm-Features: AS18NWC4FI2cXc_-rPK5ZCfUi47wB_7ij5HGTYcX4J_DoBYNaluJZ_bZS72Vj38
Message-ID: <CAE_EmHsRBLJauuYJinTaf=Q6MzexHWti2SWeX8DWPmF6FN-aNA@mail.gmail.com>
Subject: [PATCH] alieneware-wmi-wmax: Add AWCC support to Dell G15 5530
To: platform-driver-x86@vger.kernel.org
Cc: kuurtb@gmail.com
Content-Type: text/plain; charset="UTF-8"

From 1dad6e971a889c7936d1a54ab38f146bd23ebbf3 Mon Sep 17 00:00:00 2001
From: tr1x_em <admin@trix.is-a.dev>
Date: Tue, 23 Sep 2025 18:24:58 +0530
Subject: [PATCH] alieneware-wmi-wmax: Add AWCC support to Dell G15 5530

Signed-off-by: tr1x_em <admin@trix.is-a.dev>
---
 alienware-wmi-wmax.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/alienware-wmi-wmax.c b/alienware-wmi-wmax.c
index fd550c8..e7ba590 100644
--- a/alienware-wmi-wmax.c
+++ b/alienware-wmi-wmax.c
@@ -209,6 +209,15 @@ static const struct dmi_system_id
awcc_dmi_table[] __initconst = {
         },
         .driver_data = &g_series_quirks,
     },
+    {
+        .ident = "Dell Inc. G15 5530",
+        .matches =
+            {
+                DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+                DMI_MATCH(DMI_PRODUCT_NAME, "G15 5530"),
+            },
+        .driver_data = &g_series_quirks,
+    },
     {
         .ident = "Dell Inc. G16 7630",
         .matches = {
-- 
2.51.0
