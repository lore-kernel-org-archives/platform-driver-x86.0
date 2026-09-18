Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678541A91C
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 17:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753786; cv=none; b=Sbe73aFbJ4Hb7C07QUFcl0VnmpTmBCzZSXsaocIEv08a84QwWIOn/lGUaLvoAnGh1hmHK2O2qfOKdpug7k/zyf0kKOjw6Tb29R23IZlbIsJjeJnRPpXR+/3DWxF5cD6sN7MYjr+hjgnJO5DyUBh7cdpPMLYDBkEvO+1xK+/ced8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753786; c=relaxed/simple;
	bh=rx5LkplJ1EvqZTQ7W+ZQsFaH6OOcHwtKXdefdtsmBUE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mq6pG/t97ecItw2hgbatum5XOqvRNK+XYLNL0jDc6pJXezSO1oqfsRxi4epPEFL0aMLpCmVGDBwPJJMdQU2ph8yr8mX/AzgKm5KDVz81S/9i6ei/jVpArMORKKjfnoJ6uAn6SLApSAyfoNpCxrO2CastjA4CkrPv8ER9ZWsHUz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0XJEFK/; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0XJEFK/"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso12913215e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 10:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789753780; x=1790358580; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rf57LZWJDeznNOpWRkZKVbNmugLZiKtRUaT/BkCx1UU=;
        b=g0XJEFK/efTJ8a4/LgR9pUiNWQzcauMf0X9etTtrAbI7UG8Dk9aFHLCibh5fGT+hrI
         ncPJCB4I4xHVA73fu+3UdoxC3WpksLlFeeMvsPDmhPXvrbKq3V01jEZchv6UD0Ab8SmV
         RQHDi44vBWD/MoW+NCd3WIL3GjtJYV/vVVlBTxsRq8TnrlhO4isWCi4v9GXzTGj5iQbM
         MQDY0Yn0TTNgmF6xAithFypU3b+Rw1ezKKhW0R1M+PdLOqCO97ArP0KQaLNpdT5W6kl/
         Yh7VaAiND9JhbU93XWDf6qKjcwMdTiX1MOIOc2EnwsAbEqVd+4lIcyf+1qhphfd6ZJt8
         Xc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789753780; x=1790358580;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rf57LZWJDeznNOpWRkZKVbNmugLZiKtRUaT/BkCx1UU=;
        b=xNUVGAhDGWixjq4lq1CSCqzDOV4Z+pyqqIJDaFmKvpoaJRjttZlRQ+y6Qh8KPduuhl
         d7R+Gm0UB58pqQqA94/FzF/EdkyibW/ItRAfVQP2VDLxtA+PWOJfkssFwTEcU8LcVu5+
         MTuv36/fyKHf0jAiqxjFZQWFLvRIlXyVr0/jgrOTdRlEcWDJTSlvCSfzS6sAv761LRMZ
         ucdN7OfWf3AatkWcOVCcTQMHTTULUtpAXi9uZRe/2Z7fSSzgXIutYk79euKEhIkFzEva
         p3ereZeIjkPrnsADOpUR0rZ/O+m2Bg3NVLgG8n2z5l64lYehTSEduYYSKaOoD4ukZKHY
         2FQQ==
X-Gm-Message-State: AFuF++ljjt3B9+7ubRQF7VG2t0sTRYB7b+zNzqCkFwaGblspG/POotrw
	zW+5StDSV6pmXYP+7K9DqYu3Ca5rnL2Sl6jXBxTiQGUo+/hMP6HgLkw9
X-Gm-Gg: AYBFou3rePIyNNgXeicGVUTstTNar8Wsf1freZMbtIr83BK6RJVYXHrlsq8HFJEKDLB
	a/ibZqv4YgPdnKvZfZu6ubOeMR4YyJ2bO+yk9JUKjmHvvee7zTUOuJ7q0TvADbL1sJKFPcPHas5
	OKaT8lJtgcoxsdQmWbz7JPzUWJ8dX+nIitPYQH5NBPh4G7joxUMx7mkIstT0lGOJP64l/NRNMeL
	JBUKQlbNWe7hUrOEFsPKi4EL/60O7Yjn16DWm93+UocvVpVcy6484a7jRqqWidiS2hHE0fijt4F
	JHYIKgJJW0UhYWBHPp4NNWoAixJf9f19JYgJOrR6zfU+OJIoKQSzfChzJT2vimXIW4olORmUVCl
	vxk0fkeGoQ6AvEZ1SKyTftAFYY0EVM3AmvKQrhA6Il+M/RfJxgEGgz+C1tyqW2FWjz8F0TawB6E
	aM9yKMDK2VYXdBGPSmO0vsqjzYLqyFR1SuJbIjtSMwwgchi7GGhk3lhSgCXUTiJG6b6Liy8APTd
	8awOLd1tWqgfvtMDEKmH91lUTGg
X-Received: by 2002:a05:600c:46c5:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fc566e635mr43987565e9.7.1789753779992;
        Fri, 18 Sep 2026 10:49:39 -0700 (PDT)
Received: from [192.168.1.7] ([185.69.144.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd07bba7sm9867425e9.9.2026.09.18.10.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 10:49:39 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Subject: [PATCH v2 0/3] SSAM registry fixes for Surface Pro 11
Date: Fri, 18 Sep 2026 18:49:28 +0100
Message-Id: <20260918-surface-pro-11-aggregator-registry-fixes-v2-0-c4ed9335814a@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/52OQQ6CMBBFr0K6dkw7BgVX3sOwKGVaaoSSKRAJ4
 e4WvIGrycv8efNXEYk9RXHPVsE0++hDnwBPmTCt7h2BbxILlHiVBZYQJ7baEAwcQCnQzjE5PQa
 GNH0ceQHrPxRB1VJdLEp7K1Ak3cB0LJLtWf04TvWLzLj790SbzgMvR5dZ7bk/3s4KJFBtc2N02
 aDMH67T/n02oRPVtm1faELms/IAAAA=
X-Change-ID: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782
To: Maximilian Luz <luzmaximilian@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789753778; l=1192;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=rx5LkplJ1EvqZTQ7W+ZQsFaH6OOcHwtKXdefdtsmBUE=;
 b=qB0xedgPhrEDDJm5cy3JrKD+NGTw5ixnu4k1sAug5ydIeYnL0G4Ekjdo5DQ7evd6anTNETL/e
 dAOT9IYUC0DBjPLiLd4Ig+lZyFrA51AhQGX99YSXppQWrpTpc+sH/16
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

This series brings a handful of important fixes to the Surface
System Aggregator Module client device registry for the Surface Pro 11
(Qualcomm X1):

 - An unneeded driver was removed, silencing a dmesg error.
 - Tablet mode detection fixed by replacing KIP with POS driver.
 - Performance profile and fan support added.

Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Changes in v2:
- Added Fixes tags to patches 1 and 2 (Ilpo Järvinen).
- Link to v1: https://patch.msgid.link/20260829-surface-pro-11-aggregator-registry-fixes-v1-0-ebf5cca9d205@gmail.com

---
Dale Whinham (3):
      platform/surface: aggregator_registry: Remove sensors device for Surface Pro 11
      platform/surface: aggregator_registry: Fix tablet-mode detection on Surface Pro 11
      platform/surface: aggregator_registry: Add performance profile and fan support for Surface Pro 11

 drivers/platform/surface/surface_aggregator_registry.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 3eaac948bf4505bc7e3b12d3ccf4ad900e5df082
change-id: 20260829-surface-pro-11-aggregator-registry-fixes-1b013f20f782

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

