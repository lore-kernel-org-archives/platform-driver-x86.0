Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8AF67DA6C
	for <platform-driver-x86@vger.kernel.org>; Fri, 25 Jul 2025 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753480388; cv=none; b=U2HuvXvXih1a0DGXscy3/RmNyg0w6w9briYao2igu8AsWBkIu/fVS4g2sc8qAXqP625/4OhxV+j9qPdutQryzbqcLPmxEWRIApQcI/AeM3kUKwRiGZBEvGs0qUz5GEXkUPWXv/C3vffUd2PqsKTHEOyclqoPMbmf1V3/XaHvx+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753480388; c=relaxed/simple;
	bh=qNiMwMpt7FHGx0mN57Wp9GBU9aANU5xIGTKmi7XvDeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vCfffQrCEiibZXCxry7dAWTAKX6nJ6Lk0VkhNm7567qRMC0aPsewtzfqqgrbnMSgq14rV2ogQNy3m9nQj8bUiFk9xIXA6WJY7HLkLceBP77IPYp3+ZYlVsYNVpbx2xGrK3ODB4b+X276I83il994CLoY6qxzg1aEcdzTA5DDkPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tgq48WrG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tgq48WrG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25786C4CEF4;
	Fri, 25 Jul 2025 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753480388;
	bh=qNiMwMpt7FHGx0mN57Wp9GBU9aANU5xIGTKmi7XvDeQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tgq48WrGKgIB2YRAu/Oac0k5/OkQUSQzl6imbG3R09nhstjKYRhzhSHAFTlx8VJW/
	 MYoPppLcB+BgOKrQgGWSPCXzli4kqy6SVACNaEG02bfGUVbxnM7ddKhXbUT6sC2ULq
	 suzSLbWFbER63CqXI20w7LozUAdLqFGD8x1Pp5jA+zP7Dqle913z2jtslKPpz0zQNX
	 dlqEhVwMYuq1osikFjmquXXBd3upXvH3nYVTe5yMfNveJUiOSsM3nWFvqiheClOBun
	 2YwAEzXo+6w7AKkY3Z6rsPO90ccjZYkRMFMj2dj6CmA3SGCWCfE7hKCxlhlhEtOFWG
	 g/Dmy00MMxBUg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hansg@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v2 1/3] platform/x86: int3472: Convert int3472_gpio_map to use C99 initializers
Date: Fri, 25 Jul 2025 23:52:57 +0200
Message-ID: <20250725215259.402796-2-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250725215259.402796-1-hansg@kernel.org>
References: <20250725215259.402796-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert int3472_gpio_map to use C99 initializers to make it clearer which
struct field is set to which value.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/platform/x86/intel/int3472/discrete.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 4c0aed6e626f..4ffd7330e9ea 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -142,10 +142,18 @@ struct int3472_gpio_map {
 };
 
 static const struct int3472_gpio_map int3472_gpio_map[] = {
-	/* mt9m114 designs declare a powerdown pin which controls the regulators */
-	{ "INT33F0", INT3472_GPIO_TYPE_POWERDOWN, INT3472_GPIO_TYPE_POWER_ENABLE, false, "vdd" },
-	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
-	{ "INT347E", INT3472_GPIO_TYPE_RESET, INT3472_GPIO_TYPE_RESET, false, "enable" },
+	{	/* mt9m114 designs declare a powerdown pin which controls the regulators */
+		.hid = "INT33F0",
+		.type_from = INT3472_GPIO_TYPE_POWERDOWN,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vdd",
+	},
+	{	/* ov7251 driver / DT-bindings expect "enable" as con_id for reset */
+		.hid = "INT347E",
+		.type_from = INT3472_GPIO_TYPE_RESET,
+		.type_to = INT3472_GPIO_TYPE_RESET,
+		.con_id = "enable"
+	},
 };
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-- 
2.49.0

