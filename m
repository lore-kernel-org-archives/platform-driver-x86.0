Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEB340A59
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 18:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081378; cv=none; b=lnS04wcytestoc8NxWLXfh+EULBKy4tOzUkf2Etf8dOHTKQUyC8ZEkZv4yYVwyuQf7Tfdz2xFTOtWy3mI3YLC+cu/2+j6PNYVEbzjSCOOmH2bwSSElCk+jWvK/IkK4ti0AGgN5zMceRVt1IXWuYrVQKQjmqHADa1MS07AUC+sdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081378; c=relaxed/simple;
	bh=H26KtmV0xxR0Zr8EfuVPIBjLSqL/Ad6L7dRE8j/b8H8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MONWdx3OOyeYo7RM1PR05Ov0toY0fZ7nBBql+Pco9ggG9JNZaplUvaKlHb6g3hW+Wggwfp23CZby2AfYUvfwc5oWsnjuWgE5oytAD7b+8DmyKuu74HnFdc5Qvw3BYEOAGf3QBKzzwyvELHko8nB94oUvlIJ03FPNDWl0hHrIeik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jqv+oKOx; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jqv+oKOx"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773081375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L5jNODmQy9mkmOk+oUoiy8ir61z+51EuzDobPIPmzNw=;
	b=jqv+oKOx4aQaBWKgU5s7xvCYPjn1ISWu6TVeD3EQK5cwLq+hQ9iHuMlSPzUVvwitKpzQOn
	ehsTZTfc6Glg+5QczgHK55zZCEF1xxewuF0krPpDd7zbZMy7ki0Egr/lYWIlaiVr/jVnwX
	VeBKyBEPTUAyK/FQZxial09hLp5hu1A=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 1/2] platform/x86: asus-armoury: add support for GA503QM
Date: Mon,  9 Mar 2026 19:35:57 +0100
Message-ID: <20260309183559.433555-2-denis.benato@linux.dev>
In-Reply-To: <20260309183559.433555-1-denis.benato@linux.dev>
References: <20260309183559.433555-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add TDP data for laptop model GA503QM.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
---
 drivers/platform/x86/asus-armoury.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.h b/drivers/platform/x86/asus-armoury.h
index 6e9703bd5017..6565dd4c36c5 100644
--- a/drivers/platform/x86/asus-armoury.h
+++ b/drivers/platform/x86/asus-armoury.h
@@ -1051,6 +1051,20 @@ static const struct dmi_system_id power_limits[] = {
 			.requires_fan_curve = true,
 		},
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "GA503QM"),
+		},
+		.driver_data = &(struct power_data) {
+			.ac_data = &(struct power_limits) {
+				.ppt_pl1_spl_min = 15,
+				.ppt_pl1_spl_def = 35,
+				.ppt_pl1_spl_max = 80,
+				.ppt_pl2_sppt_min = 65,
+				.ppt_pl2_sppt_max = 80,
+			},
+		},
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "GA503QR"),
-- 
2.53.0

