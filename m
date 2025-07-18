Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443B14503B
	for <platform-driver-x86@vger.kernel.org>; Fri, 18 Jul 2025 17:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752859393; cv=none; b=TlT9DtbmK2fKn2UYuDAwRcYdmZk6XVWpp+pTLQEJ7lW2zBoGyCihrUvj8XIuvwYpTP0oq5TZvVtDQ/X1kIv7qd+9N/vuJdcZSHxKixgwJSfatXdaXaH1cgisuR/WWGdqAmhfp7Mue/wNyU62z5fnSwnv1sJqY9pzaI01kFkEQPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752859393; c=relaxed/simple;
	bh=61uS+YocZ7O4wcAEP0ZpUyQ1lzytDBage/uvGG2iIfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gLGfeVPlbpos+HbigshJaPvtKz+fj2yjzuYsu6aQqT2jh1ITF9dFQZwuxgQNA34sU3rdOceVbNbPGOVRvjwr2cHfJs77EbWcU3NnYfPutow6RKO2ucUFCPfhn4/+3LuIW0ZK+c9YMxJo05M5/mc55+guaRmfXO0MB9UbtToHzqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tC6bmtlI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tC6bmtlI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D2B3C4CEEB;
	Fri, 18 Jul 2025 17:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752859392;
	bh=61uS+YocZ7O4wcAEP0ZpUyQ1lzytDBage/uvGG2iIfk=;
	h=From:To:Cc:Subject:Date:From;
	b=tC6bmtlIYZ3T07kxz5e689dnLU9Rolqh/FtkHARLrY3LH7ip3eC8dv2mvzFsRoXnw
	 QLPyEBTeEsSvKqy3G2ElF4IuWBqoCom2+L2p6XwkJaP+iwhAWlfU14N45YVkMlpqSh
	 8HENcFwd2+P1hntNrWXkVvb7CNnw06VJ6ej+WlrEo/PDurmFW5M5ibyeMljm7zoYMp
	 oqqGkw07k9jF0j/MkzyyWEeM35lIsrLvP0kqp5yFMqrLJrtyd4hk0RcgTY01iM9/dC
	 8hEJZTnB1GrJ4X4HRQRsVDA9AId6ouVfPinHbFDwl6DaoxAAa65+MXA1fnPqotOjuL
	 0/P9QtbsPX2AA==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	Shyam-sundar.S-k@amd.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Adam Berglund <adam.f.berglund@hotmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86/amd: pmc: Add Lenovo Yoga 6 13ALC6 to pmc quirk list
Date: Fri, 18 Jul 2025 12:23:05 -0500
Message-ID: <20250718172307.1928744-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

The Lenovo Yoga 6 13ACL6 82ND has a similar BIOS problem as other Lenovo
laptops from that vintage that causes a rather long resume from suspend.

Add it to the quirk list that manipulates the scratch register to avoid
the issue.

Reported-by: Adam Berglund <adam.f.berglund@hotmail.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4434
Tested-by: Adam Berglund <adam.f.berglund@hotmail.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 131f10b683088..ded4c84f5ed14 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -190,6 +190,15 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "82XQ"),
 		}
 	},
+	/* https://gitlab.freedesktop.org/drm/amd/-/issues/4434 */
+	{
+		.ident = "Lenovo Yoga 6 13ALC6",
+		.driver_data = &quirk_s2idle_bug,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82ND"),
+		}
+	},
 	/* https://gitlab.freedesktop.org/drm/amd/-/issues/2684 */
 	{
 		.ident = "HP Laptop 15s-eq2xxx",
-- 
2.43.0

