Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A293B71D8
	for <platform-driver-x86@vger.kernel.org>; Thu, 10 Sep 2026 04:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789015522; cv=none; b=nh4uI1ZUi6tOpVSXoceh1hVwXLeOz+VdJAo9UXLt9+oHocM6bey++zggqthm7C30vMWDY9NzIrtWP1YDlckh9pDXto0BbiRTmPu5MP75P2j3KlyLG+MYc/z84ZaDCHc1y8CIVlMQMOhfVp0T0HF7wqSCFHOCMQr5ZBShBqQIP/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789015522; c=relaxed/simple;
	bh=641/hAQ3PQ7EATgNp7+c16jNxnhK3Q/BjlKPdFMsvys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANcpequBI8OjH9c95ggoIYdG3Ob9L5ZSHyahFeKVT5DVKT+VbcDMcK6BB3K03YZAuv35A35j4inv996FJSYtMH8sgaYK5kIQwG7N5ogJxtffNoSP0tRpiEOZz4ibdTbwgbz6GLFRXqXrYkt4YDGHJ0eg+3smPxql9hEYmEHjF0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rtMo+DDa; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rtMo+DDa"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469d249c4so566316b3a.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Sep 2026 21:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789015520; x=1789620320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsQHftUl3QWGyxTvNBlAfPqa3Ul/K9RQ61lU4+ghrd0=;
        b=rtMo+DDadpTU3bnib53DglY803p98uG2u4i2Sx1yECg32bUo7F5r0aFLogMRFz/mhu
         cWD3dhHCViWRwAxHUtEGzOpk/b2wsYc8MoxqrpiU36MKFwHg2djPjhJzFjtGiuR2iNSc
         nDX8MiEAxTSdzguodSob898ZRiIY9Obspv/PO8AB9uoGKJ54D2H4+K8Ezanl46BhhnsP
         pyGPam8D6VTCfmfXB1ruNUhVJKk3gcOOZX6aMM0AHkf/FPOMQOPk1H9hLcGHeDix7riL
         t4Igipw5mvOiZHEHjeUFNK+i9/m2pcldlmE1gBooMyeCUS+l4RAsnOEk1BAabFER+Ixl
         0I6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789015520; x=1789620320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsQHftUl3QWGyxTvNBlAfPqa3Ul/K9RQ61lU4+ghrd0=;
        b=ONR2QyqsMqRg3b9kpalamzes/nPEFS1AhWGxwHyW92T+YPLnpypbiYzuXdTjMFT8gI
         VfR2PArBgtYIrjPO16ulQ4kn+6G+Gkv5yY6hOEI98CXXYOdgsW7Pp6RRFS8YRFyaALXL
         Tm/Itgnci4ahYYl96RnEpnkmnoZPe9rpF6o3pjsVF5xYjWcXrIPkwwTiS3Ork0EIW2b0
         HFvE/KCcGEGmS3e+BdbKHklvZ6kdxXzZvL1jG5fRSYTlAzSOMI5iF3moRzT29ckdUIMZ
         RxWw98poMG8MDUfERSVVg6/y+/ksd/cNasa7jz1p4bLFy7y2k9tuAHhtHhX36+rsFzoS
         gUIA==
X-Forwarded-Encrypted: i=1; AKwUvByqC14JZfaG4qdW5uY6v0QJrAqmv9lDMkdjy9gDgi4DqS1MJyj5IxGYAKzJtOng4rEi9iPx5zPrcOOMk7CgwuCx71iH@vger.kernel.org
X-Gm-Message-State: AFuF++mHjArdinXPRbofxCXFsPH4AndyWXpwhP+3ejWK7z7Hk9JzhuCL
	g95qcmVGL4e88K2YuPKCOR+9IG4vAuqmuz7bjvLMMjRCYAitYoEPaAqj
X-Gm-Gg: AYBFou33TdQG+okyxBUAcs2rjcKiJCTFdFKOrwqwrip0Hnjv9xykgQqYslNkDZQE9aS
	3xJUeJZxSWoMOsG0ZWjB5Q0rmeZufz/Ep8FPjzXPrjWaZLC9k/8w5+FEH9Mat3XCOclQUrD9fW1
	9WQXmxxbG0hQXdpkVj+D0n3pez2QMOg8FMyS3aBMhrTjHGclgErGBGmRCKmqRDamRjvHjBuYrg+
	j9Xx9albgiwIuIKPSQYstNbYGCKlrVz1+PWJi50pbgWGjM3ptEMolWe78i0wW9rAYFxEnWZSLv/
	VCbSG6B1Tvd1YqkJtXBmCwOYMLgOjX9nNTYNXm03qJGeMmjosc+5kVCMbNZTZzwK+ihtcNrlIXn
	FXg/bSkvAF9mhJf7Td1T6otBwj2YbgURQV+rAB74Ha/lwEjpXWrrWYAzAx2yIAgRrvtLCOeHL4d
	FxKG28IKcK+GFhLb+yyxmdQqyGc4e5avOEtCayRSEOk7URdTeL2vKU/Qbgvka1YInEMHgw6HYKI
	IVqoYNixit3/WZOjePVas0p7Q==
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr8921235637.14.1789015519940;
        Wed, 09 Sep 2026 21:45:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435648esm58731485c88.5.2026.09.09.21.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 21:45:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	luke@ljones.dev,
	denis.benato@linux.dev,
	W_Armin@gmx.de,
	eric.piel@tremplin-utc.net,
	kenneth.t.chan@gmail.com,
	jlee@suse.com,
	srinivas.pandruvada@linux.intel.com,
	mpearson-lenovo@squebb.ca,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] platform/x86: panasonic-laptop: Fix typo in the file history comment
Date: Thu, 10 Sep 2026 10:14:41 +0530
Message-ID: <ffc97dd04a02c81d433d031581d9a17c703bcbb3.1789015364.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789015364.git.hemanth.selam@gmail.com>
References: <cover.1789015364.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve" in the v0.4 entry.  Comment only, no
functional change.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Reviewed-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/panasonic-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 19d194ff37ca..a3597344edef 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -107,7 +107,7 @@
  *
  *	Jul.25, 2004	Hiroshi Miura <miura@da-cha.org>
  *		- v0.4  first post version
- *		        add function to retrive SIFR
+ *		        add function to retrieve SIFR
  *
  *	Jul.24, 2004	Hiroshi Miura <miura@da-cha.org>
  *		- v0.3  get proper status of hotkey
-- 
2.48.1

