Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C185B297A53
	for <platform-driver-x86@vger.kernel.org>; Mon, 28 Apr 2025 20:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745870743; cv=none; b=I7OUhK7fcfu9NE11eFI1QGOq7KpWM9pF+LrTtrMrhTQLjRSDYC4H1o9qk08qmwYwP7bYhmkyxxrhy4dlYBUsIjRGu79G0/NSrXMiEe3KZw2nKxG/vv/Sgy9ml42LHk6OAzbi45hM9gGmxyAYwZEtsPJqzudvfwEXt8AUWT0hA1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745870743; c=relaxed/simple;
	bh=Q31fO1bQwb6NRzO8a6EWgAOIn7kc22/ZG29+ar3u5VM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rQS/12XQMwMcHEkzB/4E2HJrCkH4d82UESOkOS+y3AotwuuqxriSWPU0XdvoVQLvborLDd+7ol6+0Qx7N6Es03I0PSiJRnuuUqdp2rQnLv7jYHAfwxIbD1c76z4Elg9LrXUp8oeX+iL2hiQYd9OYpxF/PS6RCfgOOU/46xT1aPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGgzqmok; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGgzqmok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E9E4C4CEE4;
	Mon, 28 Apr 2025 20:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745870743;
	bh=Q31fO1bQwb6NRzO8a6EWgAOIn7kc22/ZG29+ar3u5VM=;
	h=From:To:Cc:Subject:Date:From;
	b=UGgzqmokc1GwLaBSo46vS6abprIxZ5VgPfj4VEwcM2MRwFig2NG6Bw29VHi4oroHp
	 KVIIva6CRHc5U9ZwWeBJ4x85xRvlOnkwE4FXr+ypm1VD5RbPK/E7IEmstfgrZNe9Il
	 PptJCF3y1DoZmjJ0S4ThFIB8u6vEhZPaaQU8GAFAtUiuroQSzBayainRy0abllVVbw
	 p/Ypp+2O8jgp8nURJIHwj1ZYzvDclqRsr/5Qr5D3qgR6TIWo3CrdD/94Gia2HAuADM
	 0QG4wYWqRYIViosLfV/meYSsTbGKACxuNIUEC0qV9UNRUvuy49wCG9QYQkjZr1YL94
	 S90YspRGnVReQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Patil.Reddy@amd.com
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v5] drivers/platform/x86/amd: pmf: Update screen lock actions to KEY_SCREENSAVER
Date: Mon, 28 Apr 2025 15:03:57 -0500
Message-ID: <20250428200456.4094500-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Screen lock actions are ignored by popular desktop environments currently.
This is because `KEY_SCREENLOCK` is not one of the legacy keys that popular
desktop environments listen to by default, `KEY_SCREENSAVER` is.

Adjust the PMF driver to use the correct keycode.

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>
Fixes: 4c92d448e3e61 ("platform/x86/amd/pmf: Use existing input event codes to update system states")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * As Dmitry pointed out that GNOME listens to multiple keys even if not advertised
   it meant there was a bug either in GNOME or the PMF driver.  Turns out it's in the PMF driver!
   Switch key combinations instead of using META+L
---
 drivers/platform/x86/amd/pmf/tee-if.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 7d6404ab9f041..a182a3a6daf11 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -172,7 +172,7 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				amd_pmf_update_uevents(dev, KEY_SUSPEND);
 				break;
 			case 2:
-				amd_pmf_update_uevents(dev, KEY_SCREENLOCK);
+				amd_pmf_update_uevents(dev, KEY_SCREENSAVER);
 				break;
 			default:
 				dev_err(dev->dev, "Invalid PMF policy system state: %d\n", val);
@@ -458,7 +458,7 @@ int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
 	dev->pmf_idev->phys = "amd-pmf/input0";
 
 	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SLEEP);
-	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENLOCK);
+	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SCREENSAVER);
 	input_set_capability(dev->pmf_idev, EV_KEY, KEY_SUSPEND);
 
 	err = input_register_device(dev->pmf_idev);
-- 
2.43.0

