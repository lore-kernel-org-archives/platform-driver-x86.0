Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDAA26059D
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Feb 2026 04:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770007071; cv=none; b=LfSYgD0OBbq23IL4H2yLIitZ/MYVjclyjfxkMyINglnJ3CvXhCR1sKAJYClaILDQuv0iEF7gr7JgIL85TXfszZPfeTnhH42Ywj1U3UdFrMoTIcxg23n2jiTPqS+GN2zKvLa78lMMVmHj1jgJbDFyygwrzkdX2dMN6Bq+scxJnYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770007071; c=relaxed/simple;
	bh=SMul7Ue7pVJUIaVvSQDUhube/LVKiEJKTatjF53Wseg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VLpkuq23gvA+yCEhwoyeSL3mjvp4/NedZRm4UEBkKN9KC/hryTkEE2AV1ipdq666e1TGX5G7Gb4Y0s1ek7ZDA+5dLT1izCNtz4X4dHU6aL30x2rV8motr/WNMNw9TRwVuxYlWugJKzDu7Y8+7RdE5W+VtB4AfUoXmSvMPSQ8dUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqs5rDBA; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqs5rDBA"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso2394616241.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 01 Feb 2026 20:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770007068; x=1770611868; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AIbmx9IfBuJ7bRGyJfUQEL9l0O2sIDuG9wDyiySCy8o=;
        b=dqs5rDBA3M291lCrpQ2lwFNAWobtX9W4Igi3npnBccHmti7OpEsvdbujLy/SKgFEpn
         Lv8JBAU03CSzl3E2NLocAxFVUpVtbYhrNwuN1MAdRn9RKFdnM5jYPqegJHFNYBEdphzf
         bT9708WnYVyL8/bhJn9a7dMAVSFc/8IqQ8SP++R5xc9wLSMAUpuioVeL5hQm6NNTQyzZ
         Fsasa9TkeLA3KX8FkVqrHZIoiAdeHzI4krPl8G5oX8S3uf/AT+1yDobm0lnAoKAif9M1
         KArmBhiN/QBkT580TkStO2nD6d/VAiWTB7fo1NwL+AlQ+KFaI13ZqO0v1OxqylL1T/tu
         35wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770007068; x=1770611868;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIbmx9IfBuJ7bRGyJfUQEL9l0O2sIDuG9wDyiySCy8o=;
        b=jeobFTZSHANyyK609pOAnZN+8uRWahl94LXxXt5+EdFn57z0tyzmsCbeFn9G8X+iKs
         M3hBYG7Gwf9nLrvm61BI2qUWkxzhqPQDcFD/FEgJ1Yj1qMxhtrSqqlCfXLGxvYa9nHdZ
         FqkeWWF+I+jUnqHn7aoU0K2U3L2sQKNTJNyx5b2lIjtVnvVI0xpAeUgm8nkQwx/R0Vh4
         ESPcM/ABF0l+FRmFKtlrfBHJEpcqClEmX0BdTd4O098IF93mP6dc7tjq2MuXyZQF3K02
         jNqYhfuafTkjKukohbEvN5SCDoPRlcQMNLLb9cVlawfoeL9rdksPkFfIKr2ZFSHeYyi7
         edzg==
X-Gm-Message-State: AOJu0YzXrvXNK8PBV/1X0tEs0kNn/+3U5o/zc8GB4a1+zucnPyKSF5jX
	tKW7XV6iel9DJ6C5U01owWqCewGE/+eBiJkLOuEdKgWnrYEWKBryQ5en
X-Gm-Gg: AZuq6aJ1eqvct4oUk17pcMhjq/cNaYpnA0wbjMbCAunLQduIp0aaXzplaDz+7Mtk7Gm
	cECi9f33df66b9ywqcjA1ztPE/cjYJUD9hszvkw9fL0Ui/K7L6D46fcH+CuPP7GVcIbCjoBKN0Z
	LY0laGUkUaf5ev94Ymsvt5rko1ecolTUjdRbQvpZX/qMOYSopqgYE8FHO8PMKlcNz4VCSwCuXG5
	Ikk3cbr5EanZA/jrYHe36piEihv94Vpjs4+RfTI8VfbQTZjOHlsIvahkXVKyWNYWxQoh6l3SQ4F
	l0onJ07PilZ87C9ucaJVmKqYZz/xnWR1sLofkbC3Ppar+fetgh9XSziKq+YPoIFvzCkFguBEpgi
	ydvF2HC5scfN4tRae0mhWehxENbcDelNHvP5jVYiBjRVnk/t5gqy0FE+1sfcONLTgrRruHPtMp2
	fVzc7Br0LCrQNem6/nAREvot8=
X-Received: by 2002:a05:6102:6c5:b0:5f5:11d5:70fc with SMTP id ada2fe7eead31-5f8e2471030mr4401133137.2.1770007068610;
        Sun, 01 Feb 2026 20:37:48 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9487241762fsm4379654241.7.2026.02.01.20.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 20:37:48 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sun, 01 Feb 2026 23:37:37 -0500
Subject: [PATCH] platform/x86: dell-wmi: Add audio/mic mute key codes
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-mute-keys-v1-1-825e786732fc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMz3dzSklTd7NTKYl3zNItEI/PkFGND8zQloPqCotS0zAqwWdGxtbU
 ASQoXkFsAAAA=
X-Change-ID: 20260126-mute-keys-7f8a27cd317f
To: Matthew Garrett <mjg59@srcf.ucam.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Olexa Bilaniuk <obilaniu@gmail.com>, 
 Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1080; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=SMul7Ue7pVJUIaVvSQDUhube/LVKiEJKTatjF53Wseg=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJkNWuIGtn/2qPTNatBnn6CS9bmC7+w9/doJx4Q/vwqr2
 J6+3eVvRykLgxgXg6yYIkt7wqJvj6Ly3vodCL0PM4eVCWQIAxenAEzEzIOR4cuRL05HzdnWXEuv
 5o9nbbKYvu1NYda2g2oFAl/03M7Ps2Rk+O945uFrR7lW7vPNFSLeN1eu3cIXxqi7Rb382SfXze+
 T+QA=
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add audio/mic mute key codes found in some Alienware devices.

Cc: stable@vger.kernel.org
Tested-by: Olexa Bilaniuk <obilaniu@gmail.com>
Suggested-by: Olexa Bilaniuk <obilaniu@gmail.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 drivers/platform/x86/dell/dell-wmi-base.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 28076929d6af..62cf28d1fe19 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -86,6 +86,9 @@ static const struct key_entry dell_wmi_keymap_type_0000[] = {
 	/* Meta key unlock */
 	{ KE_IGNORE, 0xe001, { KEY_RIGHTMETA } },
 
+	{ KE_KEY,    0x0109, { KEY_MUTE } },
+	{ KE_KEY,    0x0150, { KEY_MICMUTE } },
+
 	/* Key code is followed by brightness level */
 	{ KE_KEY,    0xe005, { KEY_BRIGHTNESSDOWN } },
 	{ KE_KEY,    0xe006, { KEY_BRIGHTNESSUP } },

---
base-commit: 008bec8ffe6e7746588d1e12c5b3865fa478fc91
change-id: 20260126-mute-keys-7f8a27cd317f

-- 
 ~ Kurt

