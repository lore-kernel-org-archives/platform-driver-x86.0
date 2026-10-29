Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793316279;
	b=ZdpyoycXg3dBYDg24MLt7+PxeBUQ2avwbY/izvUirPZWlHuoQKnfEXHHuROR89rY3fPW
	 0lZNKs0Zu5qvC7kjmJYyIlh7BpTtDW7bSJpeEoOQ9mdKgLH+PmQvx3Abz3b6pnEWuyeN+
	 kL74NUpaAjhP4Zrb3psEo8m65KbBTy2V8M62C2xRpi5Xi3r4LT0n/dkNXMZZJB2HYjn5s
	 mFuGB8Xt8CaF6/BvNr/q0qHuimlPhj57LK5eW07vxjuqPKjAcOI8YmRWQbWl+xlN9YuZ4
	 wXIiv8s+5E0tORMdP0xIoUM5GnGY4oAcqlvFq1FpX/RC0we7MaxeHIBr69pfaf/9BaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793316279;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J1giJhP2jlFAJ+odKsTYY7ZsUc1xklep2OEBj9NwwwY=;
	b=r+Z2UUkpwe3K6IKodmajI0QE5zTRAFFSDgikxeX4dRIrMM3034XpBN1XAU8ez0/51Rq/
	 QCpVM1WERBWGjq7o/ApXAbHBgPe8Rwje//sM7uFqYM99JpTbjLn8myeZXQwzUlMLVJ17t
	 KSt65JrWflG1Ci/FBf2iQE0MjvnrX1b1EIyD3Trm0JjwELdsof7uUEDosspFz03ce0k+0
	 cM8JjdWDHL+1k0LPG7kca5xbU4kiMGCfM2LOiMb0haVr7Mhath/MoKmwmCutxTqV/aaTW
	 O8mHeb8MwgmMRpAGSX3NETQ17w62Wfr33bmaslNbWnnson5AqJ9CRdYPC2gJBSYRjzw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFTMEgNd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65010606A31A;
	Thu, 29 Oct 2026 23:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JFTMEgNd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793316278;
	b=0U8gIyjjTedpQOMZ4kZPEEwMgjngHh1pd3gaXJVtcZKq7+GcJEp+3bZGn/iqvEJMHsAt
	 e7qM1KHMA8O7aI4K2dkxP6/68jI/IlyDl6NBkkeNw7hhN/IciAULBaTl1GitL/eGdeqcp
	 8s1KcNRhXk3eUADvdnOmuaPsA51/7SmM9V1v0fJZAHG8voiUHmdfgWjeX9+SYaP4NHTSy
	 7NPiwmfI5yZjGkSFYOlKkJfcQMwNAXYptCnxw9iyD6P7WokQxdN2/30uFRA2GnSVgQTlT
	 ZnUKOw080flseTJbkwI9ePmFl0TGWF2NbdQtUex8GbQvEjq5cFI6svYVAHhtNnE+rIw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793316278;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=J1giJhP2jlFAJ+odKsTYY7ZsUc1xklep2OEBj9NwwwY=;
	b=0/lzAieQJytLpPJgnPX6bzSI487jSnrPGyXQ/R5kbR/5ufakV6pw+mnUwW5teN/ac8fP
	 ULk8O+nYuG07dNI40q/hXv0iXr4ERJWmxAK4SzdygedSMR5AZKKOJc0WsVJP2Xh+9Ew/C
	 lSFSJWU/lUtBeAzj+bHiumM0lIQ7RuHxBaYM/n3lOP/j7LuvpdV9VGwZjUhonxJhM8x9d
	 IdcO72BHAHMKrvavhBOmbY9zHQww7A8P54ns0YglA8AO01q/8Fd1d9qNioLebvfKpeskB
	 8hD+4x2xvx6Ni76igBSg/ZUPI88YKFHVNpSlXCs2cYttrBkmyPjH67HkXjo1VWY4v9w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 597741F000C1;
	Thu, 29 Oct 2026 23:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793316278;
	bh=J1giJhP2jlFAJ+odKsTYY7ZsUc1xklep2OEBj9NwwwY=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=JFTMEgNdI9uCRWGJH0o8YP9RExqLz6tlWW95eYKZDFbiA1QYOyPw2ZBJwGbmfpM7Q
	 A7WXTHgUItk4plC3cES00+YM0vhQL5VMF9l1XvfBuSuPoV+J0aT15i8g90UoYvw55/
	 8PKQ7+72SZepGN2zpKCF0pL68E1sX7WqZD00DHVtkdOVA6Feo/H1oAGW9Y7DqQ5dds
	 R+Z5RF/Dl7cGvaBB0FX+TVap524ZQ3u67y4alxhlQXB+foEhsrCtImmq7z9B5aVjrp
	 83xgAuI12DOmQF9Esf+RnR+jjiCiz6TaaF59xeC/wkU1LXtjZI+b01K4DY2HVAg0FB
	 9Pj1AnSJ7gL4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DE9F445A1F;
	Thu, 29 Oct 2026 23:24:37 +0000 (UTC)
From: Carlos Baiget Orts via B4 Relay <devnull+asinfreedom.gmail.com@kernel.org>
Date: Fri, 30 Oct 2026 00:24:33 +0100
Subject: [PATCH] platform/x86/amd/pmc: Add LG Ultra PC 16U70Q to quirks
 list
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
Message-Id: <20261030-lg-16u70q-quirk-v1-1-946f25fea731@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNL3Zx0XUOzUnODQt3C0syibN20xFQLM5OUJBMDUxMloK6CotS0zAq
 widGxtbUAe9FBKGEAAAA=
X-Change-ID: 20261029-lg-16u70q-quirk-fae864db4054
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Carlos Baiget Orts <asinfreedom@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793316277; l=1794;
 i=asinfreedom@gmail.com; s=20261029; h=from:subject:message-id;
 bh=2scvI5X0yKGdqQL9IjH/N2UwRjmOVAOBN1ZYC7tkAKQ=;
 b=3OXXkpx5QIs0LOCthtkmrsEfTnOQv1xwWaAlTW+w0xglQw1x5LgxRtli1vgJa5FesMFhDd70W
 ngTCrZuBp1ND6QIBtNuqwJhFjT+BOc4so4i7/3eKuDbrGEA1J0nSP4W
X-Developer-Key: i=asinfreedom@gmail.com; a=ed25519;
 pk=aOfyH/lp+7onSrl00TdpSmziKWxCLG6uwG7m69lGXHI=
X-Endpoint-Received: by B4 Relay for asinfreedom@gmail.com/20261029 with
 auth_id=1359
X-Original-From: Carlos Baiget Orts <asinfreedom@gmail.com>
Reply-To: asinfreedom@gmail.com
Content-Transfer-Encoding: 7bit

From: Carlos Baiget Orts <asinfreedom@gmail.com>

The LG Ultra PC 16U70Q (Ryzen 7 5825U) spends ~5 seconds in the noirq
resume phase on every s2idle resume. This is the same NVMe SMI handler
issue seen on other Cezanne systems. Skipping it with s2idle_bug_mmio
brings it down to ~32 ms.

As on the other Cezanne systems, the entry must also keep the spurious
IRQ1 (8042) wakeup workaround. Otherwise the system wakes up immediately
from s2idle, so use quirk_s2idle_spurious_8042.

Link: https://gitlab.freedesktop.org/drm/amd/-/issues/6021
Cc: Mario Limonciello <mario.limonciello@amd.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Carlos Baiget Orts <asinfreedom@gmail.com>
---
Tested on the 16U70Q (BIOS L2UG0160) with a locally built amd_pmc
carrying this entry: noirq resume drops from ~5.2 s to ~32 ms, and
s2idle no longer wakes up immediately from spurious IRQ1 events.
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index fed6c51879..ca188d815c 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -386,6 +386,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
 		}
 	},
+	/* https://gitlab.freedesktop.org/drm/amd/-/issues/6021 */
+	{
+		.ident = "LG Ultra PC 16U70Q",
+		.driver_data = &quirk_s2idle_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "16U70Q"),
+		}
+	},
 	{}
 };
 

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261029-lg-16u70q-quirk-fae864db4054

Best regards,
-- 
Carlos Baiget Orts <asinfreedom@gmail.com>


