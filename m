Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413D33DDB08
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786874928; cv=none; b=RdHfnGMiRc1NdsSWUc4kpBpytcCT8YhM8wLg4HXvKV7kZir97aCOShY18Oy1bYREeLW8MvfPUJ23S13KgLahFqsjs4ARegusJOHehwunkrPYLiyScG9drYTnbJAHPQrFG7ei0mWXvC8+L563dFIFp6+heobA01mGMMCV6B3jVPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786874928; c=relaxed/simple;
	bh=fCV+2yJC4cZrnJl1H1PmJvR+PHD59988Urbd1y2vbjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H88UDKtw0aoI0nqhMfvEd3ICVgaQumGOhelFnSbBGQuDxD5EkqehDARZprTSAC/SSSWY7g3/33y85r7N/sOai8LL7T10o3CIafQMuMuw6u7+DO/8b9+L4aGHVzhvfICdCrRiSbTeigSKKxHGfIpN7ZmFasE2LdyH/fPALOtbVH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lu0I311u; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lu0I311u"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1838287b3a.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 03:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786874926; x=1787479726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFReB0FpblksjxyfEVt8Xa+UaQs+LIPFGRM0Eqvgr6U=;
        b=Lu0I311uxi4mzqh304sqCdK8l2FNSPasnHM54PrpnG304smdSliwYD6knYJZB22mmK
         N65x6/KwCVS/GweMfk6TChM2l9v3wHBqjQCeoiaJWgSzDNoTKSSITAoXwu2FYB0XrknL
         jsW/gFMtxJS0kHVmyNzqeWtFCpM4TC+5pyX2CRiZlUupLsLSOOITyHR3Q2sjU0ldLP0t
         dG1a1B0e396rbs5yI/+kk+2jV+a1Pwr4qRNw2mCP2UlARMR2o9NG2tc0MXEEANoPQo52
         wJLyk6R9QJ83QbVWcjTD219+svfpy4i0Y8ekoZCP3ZuXjCZBNLdXJPbs1PrtSL3RB7Ls
         RlZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786874926; x=1787479726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFReB0FpblksjxyfEVt8Xa+UaQs+LIPFGRM0Eqvgr6U=;
        b=OEbgtqzT9Hu6F7Hfr5gNHe/vgJ53Z8O+XqGPHHYRCysDwqcQBr1fmVOALoQQPunkVe
         cj+Ph55cAS6+/snlS4qpzKNMygUIanurJ9Bg/Ept2s2ng3y/K7g+hXtbCbvwhrr3e8Kk
         TeBooMx/O1zYO9OwJpi7k0n+hHpMeC6wR1+IMAmpkHZmlnPF1ui03/xn/ll1NFUgYgvB
         LkVyRUJPQNJVIXYpxp/qFe9NQ3MF/5KLyykpUaW4zp4ENrTFspVL9CVv4i2ulLHGDK9h
         85Be7z33KHNGS5Z4Fk6lBZdzRaHrGNFPY0vuTqzaIypikwpS7VDbeLIvsvBqPSN5HACw
         tVMw==
X-Forwarded-Encrypted: i=1; AHgh+RrIGlJXL+VbRnvmGFmyRL5ZUS2b/LN4QC6XwQvtsPEr1C0lyTz1EeTZ6kDqr93psJmnYGAyBZ9XMVb2VMkv8zR/RvHB@vger.kernel.org
X-Gm-Message-State: AOJu0YwgbqOdUK59zP28kb4ecfNkC+GBt4OT+bPhQijTPdj2ba8XNbdz
	MbDEwsg48loPfrLA+vHoosRw0d0HBoGYu6VYFXuu/CQyz0uQWgMgz54+
X-Gm-Gg: AR+sD12tDa4K3HxLOyoIansGlo8vcDLcLs7NlGeVGJ5QU/iw8mx60zfrQ48VvJpErQ7
	/ArJuL0rCMtyUoj2QqAFiE0EqAyrbsOxCW16OrlZ+vxtwdfrMor7VD+0MUMXdebtETma2bN7gn6
	8MlSt3pWlKHzrStq9a1Ex68s342GwpEesZfuc26MFAotDrwgXb2JuhXqsE+lNVyAXBis4mji0mp
	XwAS4TdUxQ+MduGHrekW4j7146PRWchULK3/M8pGAxp/KPnrPsU3tQ90XE/NS80qYBUlTPy/8rL
	q9JFhs62myZA6B/F8luXzKxrF2KnjE0OBJ9oFpdM8in7Y76De8NAY35fL3/CSUGVPJhtVKWoxyU
	3j/w3Gi4lPcKHUx41qPbF4v2uLRNmCAAs08ouTY8xnXsRl1qVMHhhhcT5VFeIvlFvPsYvbS3VTy
	jLSSJokmi2F6xao466Dju4Zcu02/NIxHCg6tS/HNB82NuIww==
X-Received: by 2002:a05:6a00:4286:b0:84e:831:9a1a with SMTP id d2e1a72fcca58-84fde223da7mr17657069b3a.21.1786874926588;
        Sun, 16 Aug 2026 03:08:46 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d01f15dsm1759601b3a.20.2026.08.16.03.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 03:08:46 -0700 (PDT)
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
	wolf109909@outlook.com,
	rahulbheda131313@gmail.com
Subject: [PATCH v5 3/6] platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
Date: Sun, 16 Aug 2026 18:08:10 +0800
Message-ID: <20260816100813.300450-4-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816100813.300450-1-qby140326@gmail.com>
References: <20260816100813.300450-1-qby140326@gmail.com>
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
index 8b6476881de6..81dad2b65f4f 100644
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

