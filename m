Received: from bulk0.mail-out.lima-city.de (bulk0.mail-out.lima-city.de [91.216.248.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4FC8463B82;
	Wed, 12 Aug 2026 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.216.248.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786545761; cv=none; b=ipP4ohQZv3dA4FSMr+5MxM9PSFbIj2YBp9Creeabc35Js+buU8hYxireubJ4oprrb4ElY2nxyPYLRk369SXxpeMo+fvCt8pJ1oPJxUnrKiSh55rEBvlux/RHziPZ0xxBiHhP+CbgaS523TNtV++FLAlSzruCmrm6P9QlTDggWrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786545761; c=relaxed/simple;
	bh=Nhd5BwNT8JgJuZ2WolA1jVTq2wOYamSWOsjVsd/H9Ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dyDyANEVoRNn8R5lJzPJGfvpBVv0l07Ad2y/EtB6Ng5aXkHQrpaxJdzTljgRCZrKVDDF3znjB3zIityHnWRAv1f43TAhNASxGKeXtVqKxBubaBINelW+7nxJdTkliPi1BRVEb7oaHJgYtFUnJb0TzimgmecYsnBniQz/22OZ+XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks; spf=none smtp.mailfrom=deq.rocks; dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.b=H9cY1CVx; arc=none smtp.client-ip=91.216.248.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.b="H9cY1CVx"
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1786545757;
	bh=Nhd5BwNT8JgJuZ2WolA1jVTq2wOYamSWOsjVsd/H9Ns=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H9cY1CVxaRw0oz8NT2qD498sZn0GC1X7bviQIw2c2xI37ftv34mjg9Z1MqCxbKK/E
	 je2sxJt++1H6wg/9DRWOxmRwiyBTA1ktOBq2sxAycspaJMbUKD5Si3xIaYpORzJQcj
	 2iu45Nty0sJs9pY2CW8hmVDpefXhNJilR4XgwDz70jGLhmb/tvnl0sRqmkjUlx+Sp3
	 VUhvH1ihSWYdqCwwWAVBF+YT/34F1JtcjFMWeH3oIm7V81NNqLVsuH6iLjfsF9rAgw
	 mghSOn7GaZvswqTyaxJnDg5PV09Ebsd9Q3JmmS7d+BAu+g/3SPT8RdoB54TPobhcdY
	 SoAU2KqJEODgA==
To: platform-driver-x86@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-sound@vger.kernel.org
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 3/3] ALSA: hda: allow direct complete with a powered-off GPU
Date: Wed, 12 Aug 2026 16:42:21 +0200
Message-ID: <20260812144221.35877-4-dev@deq.rocks>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812144221.35877-1-dev@deq.rocks>
References: <20260812122206.193680-1-dev@deq.rocks>
 <20260812144221.35877-1-dev@deq.rocks>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDA controller normally needs different WAKEEN settings for runtime and
system suspend, so azx_prepare() prevents direct complete. For a switcheroo
audio client whose bound GPU is already runtime suspended and switched off,
however, the controller is physically inaccessible and cannot signal wake
events.

Resuming the HDA function during system suspend also acquires its runtime
PM supplier. This powers the discrete GPU back on only to suspend it again
and can expose failures while restoring an otherwise unused GPU.

Direct complete is allowed when the bound VGA device is both runtime
suspended and reported off by vga_switcheroo. Active GPUs and HDA
controllers without a switcheroo binding retain the existing WAKEEN
transition.

This was tested as part of the MacBookPro15,1 hybrid graphics series on
both the 2018 and 2019 revisions. The discrete GPU remains powered off
across system suspend when it is unused, and suspend and resume complete
successfully.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 sound/hda/controllers/intel.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index 28c55c5..194d962 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -334,9 +334,11 @@ enum {
 #ifdef SUPPORT_VGA_SWITCHEROO
 #define use_vga_switcheroo(chip)	((chip)->use_vga_switcheroo)
 #define needs_eld_notify_link(chip)	((chip)->bus.keep_power)
+static bool azx_vga_is_powered_off(struct azx *chip);
 #else
 #define use_vga_switcheroo(chip)	0
 #define needs_eld_notify_link(chip)	false
+#define azx_vga_is_powered_off(chip)	false
 #endif
 
 static const char * const driver_short_names[] = {
@@ -1025,6 +1027,10 @@ static int azx_prepare(struct device *dev)
 		return 0;
 
 	chip = card->private_data;
+	/* A positive return allows the PM core to use direct complete. */
+	if (azx_vga_is_powered_off(chip))
+		return 1;
+
 	chip->pm_prepared = 1;
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 
@@ -1185,6 +1191,24 @@ static int azx_probe_continue(struct azx *chip);
 #ifdef SUPPORT_VGA_SWITCHEROO
 static struct pci_dev *get_bound_vga(struct pci_dev *pci);
 
+static bool azx_vga_is_powered_off(struct azx *chip)
+{
+	struct pci_dev *pci;
+	bool powered_off = false;
+
+	if (!use_vga_switcheroo(container_of(chip, struct hda_intel, chip)))
+		return false;
+
+	pci = get_bound_vga(chip->pci);
+	if (pci) {
+		powered_off = pm_runtime_suspended(&pci->dev) &&
+			vga_switcheroo_get_client_state(pci) == VGA_SWITCHEROO_OFF;
+		pci_dev_put(pci);
+	}
+
+	return powered_off;
+}
+
 static void azx_vs_set_state(struct pci_dev *pci,
 			     enum vga_switcheroo_state state)
 {
-- 
2.55.0

