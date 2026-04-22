Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952E3C0636
	for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776854567; cv=none; b=GMPZ01xRKLRkFRlIRrkfy/jvWGWeUMULnWWJ7m2uxTpd6dZVn86u2H/xRdOP5Fs7C1s5CKrNv7I4Enq5F66aGegom7+EBi3d2LUVlXzJ6QSJyFmErKI1HVUR/F3QBrhSgLxxej5HEwNhq6Nk+inoH1qy7IQkCaRhcXIuOhD8pzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776854567; c=relaxed/simple;
	bh=nVoN2jvwCuM34Ln0MbOO6ruG4cmf5xyO0e0Y7H57HGM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t8eISpKNSJhlAjkq397askFk5z6w/14iuft4Xk+6BBwluL1YBN3RIp6tWrqm6WxraPwBCIAPZvBhnQCQBlCQwqFYICNXOuKHSIa5gnJH2vSFaNFXYYcywDbYRQ0UQL0aMC5lxDz1SWaPH6urJzAo7VFbKY90my/7Rhaa6fDUbGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sx+nZUv3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sx+nZUv3"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b941762394aso721133766b.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Apr 2026 03:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776854564; x=1777459364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VlNzo1eBMowqDfFElEr+Uc5k30IlaG2soSobSy7sGxQ=;
        b=Sx+nZUv3AL/F1GqTQWq1cshoyCO0Ly+L3Akw0KPoVKmm+8viAeEVPTHq6gE7G45d2J
         DhsluVdsxgzWPPMGq+ezg/76Wb+Q1Q0tbfeJ2nDYRWrSEkgme4Og/DTnu6rMwB99oa1r
         FsUZgcEL+LkEyd7OOvmUPpO00+FzDqpewsLVkiiltMQsWcjdPGXAOYATU+ByROosvP2E
         mT2ly4ZKOHnOBiZOic7E7MoeUgTU8pQACkEPAGKg7QxLe+e50FmevgrZMtDY5Rh+aYcw
         6+meXRHbiXRrNNZ9WLeYvCVOknVTA7a/GVYFVu1Gi4bkuyV5bz9W/LBda+d6ZgKFZuU9
         AIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776854564; x=1777459364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlNzo1eBMowqDfFElEr+Uc5k30IlaG2soSobSy7sGxQ=;
        b=ZbXO7367m4nQW+3r+bMszFFNDp2fAm3WaQ9Mb4AZRuUpMTRLxoJTXz38GDnw/LhbC+
         zSlNfXhhykhXsSh7aizvKGM5ORcGsUDM7ZtigBIoZ9Yk+rvfTyCVewIrIzEhq7GL1suA
         sFp/9AsAfg8uxjT82PLmjh7AKE8CBRfgTMsODY7Jl58bXOQ1FfcmjhIITLNU2qFV5s7B
         rBwol97PA+SA5BJlu3RBYjgb81uwrp7MCYjH7uxyEREYlZ2Q8cRP9yJ5kOLVx5JJptoe
         vg7/bKa5DQyxmapceohsbxJJtBcCbA55AZzWGQ50queYp12iiyGA0Te+PwFgh+Jz788i
         Vk6Q==
X-Forwarded-Encrypted: i=1; AFNElJ/NvkbPLbPLkJiADDIWlYhsroweu8ONiVrJPvxG6n7BjD7e0Ue/1mv/DGhxzeq/cCBI5kgqIYZXbsyVBfJ956sjmfqo@vger.kernel.org
X-Gm-Message-State: AOJu0YyBMRHI8uLBkCiCBnC8bT9/VMsC9bZsjzV8ahhFrFHyT/HhUBM2
	CQTs0cEdT556Cl6Q/6G1pL5Q6uAKZ7cM3+2qtotxe2FeIYhjnAd/Lku7+sXMAI6s
X-Gm-Gg: AeBDieumpIEtVjQSX8j0L7VlV5eqiA/wAePGpLFJnNgsC5HxRKAD1VjG8SSWR9/BccF
	23+mJoMiSjXV1C8zKaSrNHRhKMU8xtRcbC2J+KC53btT4ZU1uL614gg689d4BoZdjdxlMxo9HoF
	VRvaNPV5axGgkshokrccHtEwn1WB1ZKML1QLW9cHvjBECBmJ9Y0E8ZD7REJqjDjfkyY+tg0IWBE
	4UZgkzwkna+/exfEGU4Kj54hbCuW99B3Ueh4UYiM0tuSOGIDisPxg/pMPsOigDMZ/TzXb8OPgk8
	Xes6tJZWx68Ir9MJvrojyPbQFECJdfcuJxSuqHhCrluBYUY0PwGDap36liPnw/winDs0BiPHMsI
	UdUMTRCcGNcwwR1Rba6xyG4h49BxKTPhKybmHPc4V0kcJL8OxMV31gBXuRCJJTPgq9pd7e+hm1r
	q0y0bux6XMlx4SLrEReTxU5QUNA1POSpCqKb5wagBvXewTrQpkrlgwCCjlgcDe3YsS8Bvcf9+8D
	OmBIF0=
X-Received: by 2002:a17:907:c1f:b0:ba5:85fb:d0de with SMTP id a640c23a62f3a-ba585fc891amr982035266b.3.1776854563788;
        Wed, 22 Apr 2026 03:42:43 -0700 (PDT)
Received: from Bors-School.home (154-125-146-85.ftth.glasoperator.nl. [85.146.125.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451210e1bsm530742566b.3.2026.04.22.03.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 03:42:43 -0700 (PDT)
From: Borys Turko <turkoborys@gmail.com>
To: Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Borys Turko <turkoborys@gmail.com>
Subject: [PATCH] platform/x86: ideapad-laptop: remap "Star with S" key to KEY_DASHBOARD
Date: Wed, 22 Apr 2026 12:42:27 +0200
Message-ID: <20260422104227.19969-1-turkoborys@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The customizable Lenovo hotkey ("Star with S") on the Lenovo 82EY is
currently mapped to KEY_FAVORITES. However, KEY_FAVORITES is primarily
handled as a browser-specific action (Add to Favorites) and is not
consistently recognized as a system-wide hotkey by modern desktop
environments.

Testing on the Cinnamon desktop environment shows that KEY_FAVORITES
is not captured for system mapping, and it fails to trigger any action
in modern web browsers.

Remapping this key to KEY_DASHBOARD allows it to be treated as a
system-level event. This change enables users to map the key to
system functions (such as a dashboard or launcher) through their
desktop environment's keyboard settings.

Tested on Lenovo 82EY with evtest and Cinnamon DE.

Signed-off-by: Borys Turko <turkoborys@gmail.com>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1..3a5b5a478 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -1333,7 +1333,7 @@ static const struct key_entry ideapad_keymap[] = {
 	/* Esc (handled by the firmware) */
 	{ KE_IGNORE,	0x03 | IDEAPAD_WMI_KEY },
 	/* Customizable Lenovo Hotkey ("star" with 'S' inside) */
-	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
+	{ KE_KEY,	0x01 | IDEAPAD_WMI_KEY, { KEY_DASHBOARD } },
 	{ KE_KEY,	0x04 | IDEAPAD_WMI_KEY, { KEY_SELECTIVE_SCREENSHOT } },
 	/* Lenovo Support */
 	{ KE_KEY,	0x07 | IDEAPAD_WMI_KEY, { KEY_HELP } },
-- 
2.54.0

