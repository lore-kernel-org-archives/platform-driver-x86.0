Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4ECC2E1C7C;
	Wed, 18 Feb 2026 21:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771451373; cv=none; b=A+PRMFks6vF1ZGgg8ljNEWyxul90alg5IDd7EKs+fIgRKdQDJoDS/6ATfIvZ0EM+I/TjrsUyd82nsvF9EqTAQDF4PYIv3FiLv10NBvRwK+KRSA/9KCcEVLQoZbnXbXg6H0OnBOx3szhoep9RPdc8LIUMhPOaWpymoPlEq3W79Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771451373; c=relaxed/simple;
	bh=+lXG4tKvNUeD1hSV3cRSE0tJ+5kMILwAqKoXCQCxIVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZ0cAFBS4/vXlSJbmW6ZsCuc36XSiZU5KQeI5KLfEhMEE45SrJiD8rDe7ilRPdHDLSmJ0FMSiHQESlLOKpRVYOrm2/6IW5ofN5LJjtKDmGciS8qFbToyoeNvPoDFFej+Aq4HOOgos98EEdlui1Xe/oYuFQ7IufL3nvQdu8cUvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NEpcCA4r; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NEpcCA4r"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 3F6E25E5FD;
	Wed, 18 Feb 2026 23:49:26 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id D7C765E64A;
	Wed, 18 Feb 2026 23:49:25 +0200 (EET)
Received: from antheas-z13 (unknown [IPv6:2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 9AD841FEE40;
	Wed, 18 Feb 2026 23:49:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1771451365;
	bh=QrLC+Md7KDJEJ01wYLesZqDfTi2x8JY02ELZ41k/+yk=; h=From:To:Subject;
	b=NEpcCA4rNMHeyeuXA+878/wnxYX4FWHKgdeA0gj+wCsZ1Mn27Ura2SJWPBVSszxbx
	 oS/qZQi6uJkKnibOZWnOPfSVfwOq/tG14V2LcP3kmzEpEMSd6/4Dn4wq4hR6aholAy
	 kb4AVx5IVmUcWPDX1wwPBfIz7txhjQXv9Azldj5kBDzuf0FqS9NnGj3j+AuzIbKLZf
	 wu/VbtKPcMvu0+Eer9aQnB7HN4JoZJud+7nEMb07qk6DoUVMx0RVwHTUJ4RGzwN0H6
	 wvOcEbyuRTY2CIj9JASiO7N5T+zF1oGnSYpH4jK5/7n7rjADqMcmapzsC/yXLAIV8i
	 SsSzd0QIv+Xyg==
Authentication-Results: linux3247.grserver.gr;
	spf=pass (sender IP is 2a05:f6c5:43c3:0:378a:d3f6:f8b0:bed1) smtp.mailfrom=lkml@antheas.dev smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 4/4] platform/x86: oxpec: Add support for Aokzoe A2 Pro
Date: Wed, 18 Feb 2026 22:49:05 +0100
Message-ID: <20260218214919.449636-5-lkml@antheas.dev>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260218214919.449636-1-lkml@antheas.dev>
References: <20260218214919.449636-1-lkml@antheas.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177145136508.2900533.9002376200518087113@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

This is an older device that the driver is missing the quirk for.
Same behavior as the AOKZOE A1 devices.

Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/platform/x86/oxpec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/x86/oxpec.c b/drivers/platform/x86/oxpec.c
index d6ef8dbf568e..6d4a53a2ed60 100644
--- a/drivers/platform/x86/oxpec.c
+++ b/drivers/platform/x86/oxpec.c
@@ -114,6 +114,13 @@ static const struct dmi_system_id dmi_table[] = {
 		},
 		.driver_data = (void *)aok_zoe_a1,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "AOKZOE A2 Pro"),
+		},
+		.driver_data = (void *)aok_zoe_a1,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "AOKZOE"),
-- 
2.52.0


