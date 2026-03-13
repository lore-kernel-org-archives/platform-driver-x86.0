Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29886242D70
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 00:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363243; cv=none; b=s3JfrRxqj+4C7iyFL1rD0C6cry8eLuTUP2QIpWVTN27nY1DrhJXprXd+sEtvtd2bsg7lOWplHp78RUjRT0vz6mvjikLm0tQGht/tC5w0eoiundoXqaYTviC27eJex4abUORUUsGCGFVHJcsW2BdpcFtJWov455yp5dl8OCBjvd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363243; c=relaxed/simple;
	bh=ajDEqv8hccJ6wqzUi2qyP8xwaYFhf+HDqnYwiD2xsvY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MtBh4RwV58WfbXhi93SRbdA69+EOrUlc0VaSC466GAWqJoFk5SI98d7nxqtAZQh4dFRKM9Q/DxdDgEiv6k84pT/jQ1KVHx4sg3oGSBd2d27OIvQAvc1CDGuoE7jFzvF1LvdZ0+9IWbV4AOqyfFqxWtE9D4j+ilLMrzXttuchBpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=suePiG96; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="suePiG96"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773363230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IqPE1rybtLTJeZyQwal8dhsSAhOOb5wP74xvx7JCAt4=;
	b=suePiG96VvSvY6fQbI6qfpWdSWhMQPpUEgKOkNYdO06vA123EAUGrBoTePQj9MKa6SAAzX
	0kEZQJ8//xK3cZlCPVlune9dfC/cC5IxVQ70MH6YnBsMSaJF1CzIbHKklkA1WRNZXUi4I8
	pzXaiJOKEIuLHZ3x9HzWrO3OEjNRl9Y=
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: ilpo.jarvinen@linux.intel.com,
	Hans de Goede <hansg@kernel.org>,
	Denis Benato <denis.benato@linux.dev>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH] platform/x86: asus-armoury: add support for GZ302EA and GZ302EAC
Date: Thu, 12 Mar 2026 17:49:39 -0700
Message-ID: <20260313004939.4103835-1-matthew.schwartz@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for tablet models GZ302EA and GZ302EAC.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 208f6fe16168c..c8ef8a68ffcd0 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1518,6 +1518,35 @@ static const struct dmi_system_id power_limits[] = {
 			},
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GZ302EA"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 60,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 32,
+				.ppt_pl2_sppt_def = 75,
+				.ppt_pl2_sppt_max = 92,
+				.ppt_pl3_fppt_min = 45,
+				.ppt_pl3_fppt_def = 86,
+				.ppt_pl3_fppt_max = 93,
+			},
+			.dc_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 28,
+				.ppt_pl1_spl_def = 45,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 32,
+				.ppt_pl2_sppt_def = 52,
+				.ppt_pl2_sppt_max = 92,
+				.ppt_pl3_fppt_min = 45,
+				.ppt_pl3_fppt_def = 71,
+				.ppt_pl3_fppt_max = 93,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "G513I"),
-- 
2.53.0

