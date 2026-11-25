Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795595948;
	b=z4EZnbUKf/vfZNQPVEcMMyXZRS1YNEiZYIAP8Ovo5rh9+6h9E5IE2SNblfi/NJm+t6lZ
	 1lbw0cUEm8gJy7M0qTt/eAtltIhDQMj5ObdKaXKbV0f4VxfJCg3UTfUxcIwStf5zBGW9e
	 vTGQphqlZfPXmW8GnmnUrqhHdTRgDKmbG+PPhTdQWHOx39iMG+tlXS1H1W+AzipZ9ap4w
	 lzKc4DqEjRBacnQm7sCSYMbJmxr9MHB+ZyWHWyqFHioq005T0oAc7MyO2SV/YOG50Zz58
	 zgf1lM2tLUMhMeVW45dCoLlpqql1UW03xGycuZDsVG+9xd5APGHZAsGhuv8rkW+NrJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595948;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qfA2Dw6Bb9D+l4mpSP6ybvAv3Lt3lFerk/3mZjSZ324=;
	b=o1NAdGL+l/OPME+8OKIdfWncHAoq2IYN+BSJEEjmXT2QBkaSUx/x4sI0Y4m+evHXmtN0
	 i++Q8lm2Lsnm89gF8zEAJjCtaIJzJeQ7vf3WdNeNMc6pxHabrqoTR4lcbaMxQ2Zsg1Koc
	 lSoaIX2u7zmNIUmSKAV1UrlpAC4A6OxSA9qPWPgq7hULAMVM/WHCiJDklgKEsNCkSJPxQ
	 avICRiKrCGM+2fa3iMHSPfdTqivcoXOeKyw/ehZpso0vM9FuLtXc86v8vS442R0e1DAzC
	 CFwyVsxEv62J+guIr5fIENaeisOtbfb5KR3qGUWxh7e4zdh8Kr6FUAahfkBpT7q9seQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="M8n/ZIWC";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84018606A31E;
	Wed, 25 Nov 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8n/ZIWC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795595947;
	b=qK57074u+UIxZTm5xnKbKUXrD48AM6SY64uUXy4mxozwIFJH/WDh+7493bxVOZiAcw7t
	 ygI+ewUwEWIGbHK9ZBfDZvUtxtOG0oeth3GC0JSi68Xs0nFE0t3AmckXK30w9b6fr0yB2
	 H6mc61YifsfnyUrs0Ku81HA+IxY1l4yGm6KOxh1I7I0DHYQ1NSybMqQRwgLBu1vI56qbe
	 vpSI+DJELVPytjUeN41k5VnkaaGGcjQOKuJ8yK3AejN50Cz3bB1I7e/CkOwYyL88DKw5A
	 ayzpuk57LkplAM3ib+U1LdN6d09sHI3XPLHXKt08cWWhTb63xzzJL/Dc+eGkuOcBu4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795595947;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=qfA2Dw6Bb9D+l4mpSP6ybvAv3Lt3lFerk/3mZjSZ324=;
	b=nNxqPZobBKWZJgcKgU2vcEfdRsoTfCAblNxM1KTwIF8zXbe8wwbPgGxY/IqcJhalM+TU
	 PgcCbJi6KmoNGek8v74V6h6kksY6ZlKQCRwVOddJZtRCRw5ujvoNqT0THGxuk/i7PHNed
	 /YL72ZHFAHxsnMFQ04KqGj1QUCW3hTyM3ZZYtQtoPoAzELcLGG6L5rDUXHT3wn07EnWha
	 abR08yzHKVj0bsKgbx4V8cYi0isjm0nTyakRAuSLvwE+XSCFvp24AG4UcRWtzdba92ddu
	 SmdwexRQduYE55rbKn5LaKKF+LYu5yhxUGNNCgbPVGpzCL/XJjLtlxOK2imVogEwB9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAA231F000D2;
	Wed, 25 Nov 2026 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595947;
	bh=qfA2Dw6Bb9D+l4mpSP6ybvAv3Lt3lFerk/3mZjSZ324=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=M8n/ZIWCsbtazfxz2HMu/SHEGW53wqsUKdTJNRB43AJ9GbOCXaTMEgbhpQgo8ZanP
	 MJJwkoCK8rSTofjVaRpUSuwF03C3NRTzmGA/Y7cIA7T7wkot0gvkbsaWZ2wfQk5aWd
	 pNje7Od/ZKWae1MiH5HWj98a9wHeHFaTtbMcoBybmOQyE3BXfdsjYcz9j/6yhnrMj6
	 bfxqARmc8m6KtJkJ3uMa9JgCcBYErtcnDg8NcsxlflZoi4BPoZ3velJTrk7p8wpHgt
	 l9oAA9UR1axZKpgLPGl7unYs1DCCkY56/59tvMcJ91J8T0embSOI9R9hks3xbyRCtP
	 h9D8xh+1cM+jg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 276DF4CD45;
	Wed, 25 Nov 2026 08:39:00 +0000 (UTC)
From: the-catman via B4 Relay <devnull+thecatman12.proton.me@kernel.org>
Date: Wed, 25 Nov 2026 10:39:00 +0200
Subject: [PATCH] platform/x86: hp-wmi: Add support for HP OMEN 16-ae0xxx
 (8CC0)
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261125-master-v1-1-e1d881b3b9d6@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBCF4auYWZcE0EHwKsbFOI4tC7UF2zQx3
 r2kLr+Xl/+ALClKhq46IMkn5ritBeZWAT9ovYuKUzFYbZ0xFtVCeZek2nacfe1YkBjK+Zlkjt9
 /qB8uJ3m9S2+/Rhgpi+JtWeLeVc6wnogD2jHU2nvfhNpNGpkltOiQkH2guYHhPH9WGe7dpAAAA
 A==
X-Change-ID: 20261125-master-77bf836ce5ac
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 the-catman <thecatman12@proton.me>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795595939; l=2098;
 i=thecatman12@proton.me; s=20261125; h=from:subject:message-id;
 bh=M0yFpvmo2x5mUnBrp9FOVjlBIXzYzVqyJCYqNxofh8c=;
 b=65A/lvkz+js5Gg3beosykTNyR3Ezg/8o30lRw64I7BgvJAbFbG0IRJBylL04uuRt0TOhQK1s0
 TqV2K+kTh2tC/7Wgmsc80rd1llV/Sz51l6eHwfDEGVcOGONyhFsgy6d
X-Developer-Key: i=thecatman12@proton.me; a=ed25519;
 pk=JZyk9fkPTWRMiA5uAyXbspvMRf6+lV/HhmhAgXXUfNs=
X-Endpoint-Received: by B4 Relay for thecatman12@proton.me/20261125 with
 auth_id=1635
X-Original-From: the-catman <thecatman12@proton.me>
Reply-To: thecatman12@proton.me
Content-Transfer-Encoding: 7bit

From: the-catman <thecatman12@proton.me>

The HP OMEN 16-ae0xxx (board ID 8CC0) has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile (similar to HP Omen 16-wf1xxx, board ID 8C78).

Without an entry, the driver falls back to the generic HP thermal
profile path, whose query fails on this board
("hp_wmi: query 0x4c returned error 0x6"), so no platform profile is
registered and the EC can't be switched out of its default mode from
Linux.

Add the DMI board name to the hp_wmi_feature_boards[] table and map it
to omen_v1_board_params.

Tested on an HP OMEN 16-ae0xxx (i7-14700HX, RTX 4070 Laptop GPU,
BIOS F.14): the platform profile registers with low-power, balanced
and performance, the profile read back from the EC matches the
selected one, fan RPMs are readable, and switching profiles changes
the CPU power limits programmed by the firmware (MSR PL1/PL2 of
55/130 W in low-power and balanced, 130/130 W in performance).

Signed-off-by: the-catman <thecatman12@proton.me>
---
Tested on Ubuntu's 7.0.0-44 kernel with the equivalent pre-rework entry
(victus_s_thermal_profile_boards[] -> omen_v1_thermal_params), which
matches what omen_v1_board_params selects in for-next.
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 16cfac5..376e8a1 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -325,6 +325,10 @@ static const struct dmi_system_id hp_wmi_feature_boards[] __initconst = {
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8C9C") },
 		.driver_data = (void *)&victus_s_board_params,
 	},
+	{
+		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8CC0") },
+		.driver_data = (void *)&omen_v1_board_params,
+	},
 	{
 		.matches = { DMI_MATCH(DMI_BOARD_NAME, "8D26") },
 		.driver_data = (void *)&omen_v1_legacy_board_params,

---
base-commit: 61c0dac952b9308884936d05cce97565a5c89af4
change-id: 20261125-master-77bf836ce5ac

Best regards,
-- 
the-catman <thecatman12@proton.me>


