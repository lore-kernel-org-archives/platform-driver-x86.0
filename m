Received: from smtp-8faa.mail.infomaniak.ch (smtp-8faa.mail.infomaniak.ch [83.166.143.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800D33FDBE7
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781002705; cv=none; b=ky3evHJXwz2crPh4fjeFH+q7P7/HhcsIGegseT9UH+5Nqz2MqJHcbGhpQ0UVRqNfP+2R5z3t3V55ZyZ/avJMdvI5AilcyMFzTQYWpMYjGg5t2ja4n2j/afGR5DTfShCo0tUdVmOt86vMicTzNMVyFUU3YpvG6l/5d9xdKm2Fp/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781002705; c=relaxed/simple;
	bh=iEjA2MjKSCB7UYuBfpm7ZoN6u/xw2LXb42wJfvgR3/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gRSeX2Qlk+GC689cYDNhOUIck8NcUAo2FhaWHK+G3kstxrrv0GCoI8VYAa7jDrt2MFrHmEqxjDNOqHbXH6rB68I3bMVvNG4CxH9nKLaCVNckMo6gKr6fgIVca1Kzwc5ZgIqK7R2rTHJeskHRd9GlfGKnyinfyvbZ4laaeXZLoS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=CWYCE/YA; arc=none smtp.client-ip=83.166.143.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="CWYCE/YA"
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gZQqr1nsWzWXd
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 12:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1781002696;
	bh=Mx0oPR9bcP29fTc5WI0tJYSbBL/td4L1Mh46SbEbR5Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CWYCE/YAfJSabfAwK2Vs8JkewnKkxJ7cZTzfCZ/ETQt/+Z3OhALODM38Tlmgv9Ib3
	 VI5yRjovGEJ3jppdI5v5YwQrOe5r8KEdLioLY5FcnWKmhay+/QYTd4+TlNijXNU/01
	 WsuurcLJ+VrnGig5WozKaV4iEAZYWlJHagfkm6udT5q5VRodRTB6YHDmMaHjxQ7AWe
	 v9j+ZYQW6UNE5fF578JCH13bPxqNGrRUK9kpwPq6Qsm3uub92B0htWqxUbi1K294Gy
	 KoJNyQbY5zWswhaXuSo/G8zbGafEVdiAJhExz94uU8f0LlfmjwXN3wL/w/iZSG2oxg
	 TjEylg1ey3QQQ==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4gZQqq58TczCGM
	for <platform-driver-x86@vger.kernel.org>; Tue,  9 Jun 2026 12:58:15 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Tue, 09 Jun 2026 12:58:14 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>
Cc: Daniel Gibson <daniel@gibson.sh>,
	stable@vger.kernel.org
Subject: [PATCH v5 1/4] platform/x86/amd/pmc: Check for intermediate wakeup in function
Date: Tue,  9 Jun 2026 12:57:53 +0200
Message-ID: <20260609105756.2813669-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260609105756.2813669-1-daniel@gibson.sh>
References: <20260609105756.2813669-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Refactor code introduced by commit 9f5595d5f03f ("pmc: Require at
least 2.5 seconds between HW sleep cycles") to allow adding different
conditions for that delay in an upcoming change.

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
Cc: stable@vger.kernel.org
---
 drivers/platform/x86/amd/pmc/pmc.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/amd/pmc/pmc.c
index cae3fcafd4d7..2b9e5730170a 100644
--- a/drivers/platform/x86/amd/pmc/pmc.c
+++ b/drivers/platform/x86/amd/pmc/pmc.c
@@ -598,6 +598,19 @@ static int amd_pmc_verify_czn_rtc(struct amd_pmc_dev *pdev, u32 *arg)
 	return rc;
 }
 
+static bool amd_pmc_intermediate_wakeup_need_delay(struct amd_pmc_dev *pdev)
+{
+	/*
+	 * Starting a new HW sleep cycle right after waking from one
+	 * can cause electrical problems triggering the over voltage protection.
+	 * That is avoided by delaying the next suspend a bit, see also
+	 * https://lore.kernel.org/all/20250414162446.3853194-1-superm1@kernel.org/
+	 */
+	struct smu_metrics table;
+
+	return get_metrics_table(pdev, &table) == 0 && table.s0i3_last_entry_status;
+}
+
 static void amd_pmc_s2idle_prepare(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
@@ -632,11 +645,9 @@ static void amd_pmc_s2idle_prepare(void)
 static void amd_pmc_s2idle_check(void)
 {
 	struct amd_pmc_dev *pdev = &pmc;
-	struct smu_metrics table;
 	int rc;
 
-	/* Avoid triggering OVP */
-	if (!get_metrics_table(pdev, &table) && table.s0i3_last_entry_status)
+	if (amd_pmc_intermediate_wakeup_need_delay(pdev))
 		msleep(2500);
 
 	/* Dump the IdleMask before we add to the STB */
-- 
2.48.1

