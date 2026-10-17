Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A1B287518;
	Sat, 17 Oct 2026 08:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226038; cv=none; b=iiNQGbxKichvUW82acR9zwmxJWeymJc/ptvk5PHal+eFNi0qUKRz3lFh+KJurUK1ekHdJaTZATSragxKcjPEJ2tNyds2mrVSXxpPGOzzChT3jga/MS5u5fsb6mGvixuPcY+A2gnOLcU3BgkjRD2naXclN8l+yQc7hE4aC7/O0qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226038; c=relaxed/simple;
	bh=zdwjwUOYKQcqskKHgQtyDGupzcTZjIvYeMVDWx/tHkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fNDDsWusJ+6mvDfTENUOx8C/FHPd7EKXzHIo5IczuDc6ioEg9rjURXzdiAzZYNPZm/dGHMZimyChia9Xm+qxDRuRrCAGjLDJbzCc6tUeNa1SNguGOskVuiOZMWpIQc7OR3IqFvuPGGI1KKyN2IllVm4ADeUlXn5JdslOYynrKcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JvBov5Qf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JvBov5Qf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8ED67C2BCFC;
	Sat, 17 Oct 2026 08:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792226038;
	bh=zdwjwUOYKQcqskKHgQtyDGupzcTZjIvYeMVDWx/tHkI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JvBov5Qft0h0lxNb06a6XwHMi4XL6cVgo3g7uQObB36+6Nj7aAjHZGnbL4k3bhIxu
	 NRYeo9bYhwlK9ZYhU1erTJ9/gCCadF2TFsn07Hz9A2l2OMrE9gDR4xHaDloM9En2RX
	 ujolUbjxa9QOCZ3Rhw8kgBgXxip5Yx13993YBoQxnTk786d1IHJ7X9QplygWXL3SOn
	 g3hyVMIXHyQZZEnCjH5823+2WT+3TMp6LY5UMSj+/PdnTJ3bPN9nqKXwbK9GRF3tpi
	 Jf2PTtH+DyX2SzwmuFJZpkR7xCFYVNFW+g3uVspM97G+fDioebM9XEdpOQKY5VLyvp
	 xq9Z4pdGUFAkw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB8FCCA462;
	Sat, 17 Oct 2026 08:33:58 +0000 (UTC)
From: Dennis Nilsson via B4 Relay <devnull+kontakt.dennisnilsson.se@kernel.org>
Date: Sat, 17 Oct 2026 10:33:58 +0200
Subject: [PATCH 1/2] platform/x86: acer-wmi: Cycle platform profile on mode
 key 0x4
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-acer-nitro-an16-41-v1-1-c2e7a0ee7303@dennisnilsson.se>
References: <20261017-acer-nitro-an16-41-v1-0-c2e7a0ee7303@dennisnilsson.se>
In-Reply-To: <20261017-acer-nitro-an16-41-v1-0-c2e7a0ee7303@dennisnilsson.se>
To: "Lee, Chun-Yi" <jlee@suse.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dennis Nilsson <kontakt@dennisnilsson.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792226037; l=1804;
 i=kontakt@dennisnilsson.se; s=20261017; h=from:subject:message-id;
 bh=IKfoWUiW8BtIqNPpH5+ZHEtvsC/Ig0XEGWOdoucxonY=;
 b=PDl14wE1D+0LmKY37Xqfgodrjx6ws+PvCeO6lM6vpGqRMZkf7NBEJvUoqjBp2yggprqQNtdUd
 SUEbwUIVMaCDYk1zDFf6GcUp4II86R7J4+7zSU+4AlB9Lre5fylEbtX
X-Developer-Key: i=kontakt@dennisnilsson.se; a=ed25519;
 pk=H+jadpTa8sEscQhkbeWZC2woL8j7NYwN5m1YCjkHJRQ=
X-Endpoint-Received: by B4 Relay for kontakt@dennisnilsson.se/20261017 with
 auth_id=1223
X-Original-From: Dennis Nilsson <kontakt@dennisnilsson.se>
Reply-To: kontakt@dennisnilsson.se

From: Dennis Nilsson <kontakt@dennisnilsson.se>

On some Nitro models using the Predator Sense v4 interface, such as the
Nitro AN16-41, the mode key raises WMID_GAMING_TURBO_KEY_EVENT with
key_num 0x4 instead of 0x5. The driver routes key_num 0x4 to
acer_toggle_turbo(), which returns immediately on machines without
ACER_CAP_TURBO_LED because WMID_gaming_get_u64() rejects the missing
capability, so the key press is silently dropped.

Only toggle turbo for key_num 0x4 when the turbo LED capability is
present, and cycle the platform profile otherwise. Machines with the
turbo quirk keep their current behaviour, and on every other machine
key_num 0x4 was previously a no-op.

Tested on an Acer Nitro AN16-41 (BIOS V1.03), where the mode key sends
the event payload 07 04 01 00 and now cycles the platform profile.

Assisted-by: LLM
Signed-off-by: Dennis Nilsson <kontakt@dennisnilsson.se>
---
 drivers/platform/x86/acer-wmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 9e3758c57..323179c43 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -2564,8 +2564,13 @@ static void acer_wmi_notify(union acpi_object *obj, void *context)
 		acer_kbd_dock_event(&return_value);
 		break;
 	case WMID_GAMING_TURBO_KEY_EVENT:
-		if (return_value.key_num == 0x4)
-			acer_toggle_turbo();
+		if (return_value.key_num == 0x4) {
+			/* Models without a turbo button report their mode key as 0x4 */
+			if (has_cap(ACER_CAP_TURBO_LED))
+				acer_toggle_turbo();
+			else if (has_cap(ACER_CAP_PLATFORM_PROFILE))
+				acer_thermal_profile_change();
+		}
 		if (return_value.key_num == 0x5 && has_cap(ACER_CAP_PLATFORM_PROFILE))
 			acer_thermal_profile_change();
 		break;

-- 
2.53.0


