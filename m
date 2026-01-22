Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165E2360749
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097335; cv=none; b=QqTH9nuZ9+fyaBpvq9BEkyRzu+AJZzAb/pUi7QNvyTsjL9Dr9Zb2aQcicbJNquOFh83AuoSsRGhZx2HGrGZgwH4Aj3HuBujRfIMf6QDo4UqTeAGT6gmQLVv9Z8zG0MRbVZrK7h6NbJy2l+1o2Ku4U7eBDsCLQSvFRCvMpUmKfQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097335; c=relaxed/simple;
	bh=9BDtGVLm/YNavfQzhSMk9a18TtGw89Iu8RHa4FY/yvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYXzczUbifNvl4UrhALXchGcFjk9hI23vpsnhDDU6SIxwrkzUJwRM4mI0Jb98oCRCRjXjovbvVrHYgree3/63qDTFCdMGkCnjEDZE1QZwRhrx4hW6J8GZDh3HgNV4qON78eLhrBiP7UggSgX8CS45QZv5QiTUVq5rzTVgJjPWD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ss1uVZj7; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ss1uVZj7"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2b6b0500e06so1520473eec.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Jan 2026 07:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769097328; x=1769702128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pq4VY/0urpQ2UO/GnbuvVu8bQyR50a/yUYGs16zTipM=;
        b=Ss1uVZj7KFP5VpFPeNbgCmoVJyEcQ2bAaPJa/GFIsmZ1y6+feW72vh4Okh25tgezlZ
         8S09KB0wduIbkEvoktIjlRPiXxMwOB05mfGWJ36rI5oa5Z6TU9LvxgnDScu5KZUmwp8o
         mlfo0OK3jhvLK1EjEJA/p/+IvRK/1YL628odLheVIc0brQlv84o2cHQwDRzDT5QCrA+h
         RdUeZC5K9TxVvrugouTVK4/MhUEjlaOIK0iDtNP2vEZdH87WnIAq4s0UHTq+YzhmYc1t
         zdNhEnKyY2pKgyytGhB3alhPG/MnrLR3Z/tN6Eg58z2tP4lI5SeW9hrSF1t/KJpQHf3z
         eNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097328; x=1769702128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pq4VY/0urpQ2UO/GnbuvVu8bQyR50a/yUYGs16zTipM=;
        b=nBGna9GqzA6iQDQwbVAk/3IJAjkif1St7UatmW4xVzhQfWRYAaFlVrxNLD7xtL4zHl
         wJNOWHwubINCq4d2A+td1J8OHeB0q70au465dZcZCOwBQhiaXhyY9pf09fSDRdSEo466
         AQ6vGKK1ysHLKzvjLEOV4x3PEUboJXTSK5qGMDpvGZtTibkGv+ZjyNbBbMCRAtWJMZiW
         7SO/VwhKPxWz1hlexGhxLaZzUOn0XzTK3wPtYN5qe+0vyADBoVL4N17DZY4EpdTKQcj1
         qY3chCq0ugzsZK54UYOCvEAvs7SD/7Ld7fPZ40eCQg/PgPd5mBO2SY5SPRuYSysBiXwP
         7ywg==
X-Forwarded-Encrypted: i=1; AJvYcCXijrs2ueApQfueqrHjDL3ayHBNIkLD1qcwkx73yXMZsQc83MIMhA0EGoepd5WSACWOv3hzHUTxgD7QYB8tgTdKSrze@vger.kernel.org
X-Gm-Message-State: AOJu0YweU5skwpHJXIaZmsW/KcVJQM3UDXsDqiVMIV0d7O7NrIO1dwZW
	tXzdfLmUH0+ibNZoPHflJAE/EeIcgpkKdFPgnnwk14Q9Pxzz2T062IhF
X-Gm-Gg: AZuq6aI4JyBgRZM4mnIZoNjiwmT/GZm3nCEEA8PYREwA14UpLCdWHP9MC/yreM15mLU
	r0ccRlwUwe5UN1aIaRaPZx5QTlyFOb+Oe7WKLJpkqL7a8iyeciAfVCGBEH71yZLoxm1+8HqkQjI
	f9XEo0B8cRUx5pe0qD3IscWqXo/TzFWUYC/P5hogOoVvNrNRnPQ0D4DfmTNvfOgZ/mD7d+f5geu
	30QDuabWGs8KJcdLCy1dilySDfIr0Gu+w2dTgBmXrVwUFO56IgCWsOKZwXkr8GXNIz90oVcNlUn
	GMIg+5+42CwdkVhfe0LrdX0rujpjApatB3Ve5bFJwISTJfpuJEK8fxCYEAX2qa2xsKHf1+AU0Bd
	bSG75cRD45m0BsnOC+lhowMH/5FFBtxh0As129Swa8lYPeYybXGyVuEDBuXW8neG0gZ1IOgEl2X
	WOuSAN02wiKgV0tKEp+n2rTV+WiQK80PEwLVLkkAggzLSI1kqSsK/1VgT6p3d+wd0=
X-Received: by 2002:a05:7300:1496:b0:2b7:1ef:5862 with SMTP id 5a478bee46e88-2b701ef630amr5208031eec.4.1769097327956;
        Thu, 22 Jan 2026 07:55:27 -0800 (PST)
Received: from gongqi-WUJIE-Series.. ([38.90.16.207])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm28935599eec.32.2026.01.22.07.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:55:27 -0800 (PST)
From: gongqi <550230171hxy@gmail.com>
To: rafael@kernel.org,
	dmitry.torokhov@gmail.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-acpi@vger.kernel.org,
	linux-input@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	550230171hxy@gmail.com
Subject: [PATCH v2 4/4] ALSA: hda/conexant: Add headset mic fix for MECHREVO Wujie 15X Pro
Date: Thu, 22 Jan 2026 23:55:01 +0800
Message-ID: <20260122155501.376199-5-550230171hxy@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122155501.376199-1-550230171hxy@gmail.com>
References: <20260122155501.376199-1-550230171hxy@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The headset microphone on the MECHREVO Wujie 15X Pro requires the
CXT_FIXUP_HEADSET_MIC quirk to function properly. Add the PCI SSID
(0x1d05:0x3012) to the quirk table.

Signed-off-by: gongqi <550230171hxy@gmail.com>
---
 sound/hda/codecs/conexant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5fcbc1312c697..2384e64eada36 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -1123,6 +1123,7 @@ static const struct hda_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK_VENDOR(0x17aa, "Thinkpad/Ideapad", CXT_FIXUP_LENOVO_XPAD_ACPI),
 	SND_PCI_QUIRK(0x1c06, 0x2011, "Lemote A1004", CXT_PINCFG_LEMOTE_A1004),
 	SND_PCI_QUIRK(0x1c06, 0x2012, "Lemote A1205", CXT_PINCFG_LEMOTE_A1205),
+	SND_PCI_QUIRK(0x1d05, 0x3012, "MECHREVO Wujie 15X Pro", CXT_FIXUP_HEADSET_MIC),
 	HDA_CODEC_QUIRK(0x2782, 0x12c3, "Sirius Gen1", CXT_PINCFG_TOP_SPEAKER),
 	HDA_CODEC_QUIRK(0x2782, 0x12c5, "Sirius Gen2", CXT_PINCFG_TOP_SPEAKER),
 	{}
-- 
2.43.0

