Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624221D5CDD
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Jun 2025 20:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749674036; cv=none; b=rt9MUvoGT+8tKue9NckZsvoKnEp6MnoobxmLI8pDcrW16x3fF3MWOLBora/4f/uZk2WMRQwzCLMsOlmxH4cFS3M+kptjoWlNQ9Eex/Bazzd0NQIWUeGSS30E0neiDU9GtHbd8MvL+o2Y0/V3nSaobEA2G7J7sgE+9ZOT33KYHWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749674036; c=relaxed/simple;
	bh=CIZgi5tIugxd9hYHjYWBoNnApYUUTSBBrtACPh8UTNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j5Lh4hMsZ2a569GKHF9Ok6At4rtz7z5+nUnOgHg4vugvp9c2AAlyiyoiMHRXqhRCzNTIXxoMCbUnP5ftuzdr8ocSlxBpYS9e+Bo/JmCyHc4ETSvPXoBM/ha3eTGFIuO3kiEpck85BdoMVSRqXE28g3DbvvQ3YjlDNG3cu9uMaoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nolq+eF6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nolq+eF6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE34C4CEE3;
	Wed, 11 Jun 2025 20:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749674036;
	bh=CIZgi5tIugxd9hYHjYWBoNnApYUUTSBBrtACPh8UTNE=;
	h=From:To:Cc:Subject:Date:From;
	b=Nolq+eF6zBpF4etUd1XCAsc8DM5hXV1qlmzO/njtvCRZ/1+b8L3wFBIvQAIZ8LC4y
	 EnRVGfTkjpVpG+ixboWgKsz53qiUjUJmqiBdkLz9aOB/lwRuOasamjpcwYAGKaEEAk
	 wIHABwAdoJPj4yJI1spY02jJSEj41KCDKnH38Z0A0oBafMkgrHb01uMtPOjj3Tpe3C
	 S/tl4T6dyq0o9GhdNMDIjcBd/piSZ3LMW4d3RIR3bV0ohHgqKnhmDI6xJNxwaYw5SZ
	 l550TjVkZDZO0oK4DVHZ031bR/sfY1EH1iZ6Za/zn8RhbJP6itBlpkm2xrQljJr69H
	 vymCFZK2c/lBQ==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: Raoul <ein4rth@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd/pmc: Add PCSpecialist Lafite Pro V 14M to 8042 quirks list
Date: Wed, 11 Jun 2025 15:33:40 -0500
Message-ID: <20250611203341.3733478-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Every other s2idle cycle fails to reach hardware sleep when keyboard
wakeup is enabled.  This appears to be an EC bug, but the vendor
refuses to fix it.

It was confirmed that turning off i8042 wakeup avoids ths issue
(albeit keyboard wakeup is disabled).  Take the lesser of two evils
and add it to the i8042 quirk list.

Reported-by: Raoul <ein4rth@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220116
Tested-by: Raoul <ein4rth@gmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 6648fe0dce537..131f10b683088 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -225,6 +225,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "WUJIE14-GX4HRXL"),
 		}
 	},
+	/* https://bugzilla.kernel.org/show_bug.cgi?id=220116 */
+	{
+		.ident = "PCSpecialist Lafite Pro V 14M",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "PCSpecialist"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lafite Pro V 14M"),
+		}
+	},
 	{}
 };
 
-- 
2.43.0

