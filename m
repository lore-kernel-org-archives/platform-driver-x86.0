Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD43BD63B;
	Sun,  6 Sep 2026 17:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788716856; cv=none; b=nHMiAg6tuKt8i6u3EXsuHfLO4tyb9H4S8vFt38aYetr7dEDg/f/rm4cQtELLkW83LW4deV7iVhEKPzyaUU2sta+nAurimrAvw0ISoR6vlgVGEHBu/aUzGn4A73DKgLCP1mwvYR7nX+/jAnRIRnDTYP+HrPk3afcBAI6WCQgwDTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788716856; c=relaxed/simple;
	bh=29F5tbL6kgkEhpqitluVtdOuXYQ1dEvRA+KpVI2DYwQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YboCSWC3WaD8KoxGNDr9F4BW3KBHqEmM1aqOkznTuBvFSybsgLjpFS1fSFuysU0P1baVR4WaX3GHIH2xhZS/EcFoDEqq12DgAO2Qo4+ozIiIceBDNwi62CD7UhJYSqFVimdxayiZnnsMrUjsljIAYNgbHbLOrKDFbM6xDSpiOBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2i4Qim5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2i4Qim5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 026A4C2BCFB;
	Sun,  6 Sep 2026 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788716856;
	bh=29F5tbL6kgkEhpqitluVtdOuXYQ1dEvRA+KpVI2DYwQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=C2i4Qim5bnBRVzu1wDunDsvstjE13kbRML1urV6nO2hKGYH30fymB8y+y+p7BcJNy
	 3hq5cSLxGffV5tlsnGMN/TguSlRE3OiIanrk4CZv6v9tc9ptyTM4CcFWG2iKSIW/At
	 YBFRQOpFsVVyBJQN1f91B8806UIx8lC6NyWnrqG3a7vbvAN4089vhJfYXcoYa8S5w0
	 l6sWGiN82fb1fsdGJfmFbMvc+7EPEwCSv16bClhUjGvL4AAAzXpdr2N5/q4EaQ8hUH
	 2NLqvKil/eIRSTf0y2Pu5sc7ra4LAhrs6ahbOWjCVu/8CHMfuIUiiDeUAuwWbDuSkW
	 C4fg9Xa2ml6sA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0502C79F9E;
	Sun,  6 Sep 2026 17:47:35 +0000 (UTC)
From: Murat Bayraktar via B4 Relay <devnull+bob65536.proton.me@kernel.org>
Date: Sun, 06 Sep 2026 13:47:30 -0400
Subject: [PATCH] platform/x86/amd/pmc: Add HP Laptop 14-fq1xxx to s2idle
 quirk list
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-hp-887c-s2idle-quirk-v1-1-e470e36fb01d@proton.me>
X-B4-Tracking: v=1; b=H4sIADGnnWoC/yXMQQ6CQAxA0auQrm0yTEhhvIpxIaVAwQBOhZgQ7
 u4oy7f4fweTqGJwzXaIsqnpPCXklwy4f0ydoDbJ4J0nFxxhv2BVlYzmtXkKvlaNIwYuWs8UqKY
 SUrpEafXz397up22tB+H37wXH8QWp16JYeAAAAA==
X-Change-ID: 20260906-hp-887c-s2idle-quirk-9c4f2c696b67
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Murat Bayraktar <bob65536@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788716854; l=1443;
 i=bob65536@proton.me; s=20260906; h=from:subject:message-id;
 bh=m1+r1CYTcytXaBi2k5cjuAqrOc0NFoUMObOpHPYA82w=;
 b=iHBnWR/J7U7biRBOpAFUnQFRSgyDw7jv0o3dKyOp4RyakPBoBLQYvkXxWAg3QETckCq9MfJzK
 vqPXr+zSt+QCp8dEH/r/CfS5cp6tnTggy4CGoABmpp7BjUrDGqa9V0A
X-Developer-Key: i=bob65536@proton.me; a=ed25519;
 pk=G9C/pqrSzls8L2+wxehgU1yWaNjJcafp6o6nWqNnG7o=
X-Endpoint-Received: by B4 Relay for bob65536@proton.me/20260906 with
 auth_id=1009
X-Original-From: Murat Bayraktar <bob65536@proton.me>
Reply-To: bob65536@proton.me

From: Murat Bayraktar <bob65536@proton.me>

The HP Laptop 14-fq1xxx (board 887C, BIOS F.38) takes about 10.2
seconds in noirq device resume from s2idle. Its firmware uses the NVMe
SMI path already handled by amd_pmc_skip_nvme_smi_handler().

Add the system to fwbug_list with the combined Cezanne quirk so the
existing spurious 8042 workaround remains enabled. This reduced noirq
device resume from 10195/10242 ms to 27 ms in testing.

Signed-off-by: Murat Bayraktar <bob65536@proton.me>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 09a30f3..e662b12 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -280,6 +280,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "83N1"),
 		}
 	},
+	{
+		.ident = "HP Laptop 14-fq1xxx",
+		.driver_data = &quirk_s2idle_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Laptop 14-fq1xxx"),
+			DMI_MATCH(DMI_BOARD_NAME, "887C"),
+		}
+	},
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/2684 */
 	{
 		.ident = "HP Laptop 15s-eq2xxx",

---
base-commit: 1fc5a74b108fc90951890ec513ac81869f5eaff1
change-id: 20260906-hp-887c-s2idle-quirk-9c4f2c696b67

Best regards,
--  
Murat Bayraktar <bob65536@proton.me>


