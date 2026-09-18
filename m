Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9A33A0B05;
	Fri, 18 Sep 2026 22:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769975; cv=none; b=H2BgzdKWRj0tR7vq9Fo8ah7xdQTHWjzdbVy6s7U3NaSWGqNEuUk0bPJM6io5UiksVaUAM/NTzKUotcgZgHF39ZlDWyRJKemDOjdZ/pkaRjZWihnELuRZoGKj9s8zctZXG/+vOc8TdV7VQ2KxE1B/atJOk2IfSkO5NWj0suvAxPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769975; c=relaxed/simple;
	bh=iM0b13Pm/6j4QmyfBom3/JZ6Sw6yeHqLevfAyVswzcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dlsn4cvuhtVyiBVryLPPBVm34+cSq7WnI22Bmp5xNmcDFiONCXRSNWwDHOJdWL1pcvCHHKeW35R6sLvF02Qb2a+nK180S3vgNJS+Oqe6euDXVWDMFIISkFw5v1dVs5gty6nMe58WyYL9GQ3HA3s7eWaV3uxNQxjFXK1egth3ymU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=e+IWBoOZ; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="e+IWBoOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1789769892;
	bh=iM0b13Pm/6j4QmyfBom3/JZ6Sw6yeHqLevfAyVswzcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e+IWBoOZ6fgxGC3kKfNe3Ler1FR0WftIQzdCJllhlprVCN193JNOuzdVVVyGLqmE7
	 7EOtUmyhfdlT/pM3Va766HL3/08OUCbhC2FdHCv5XgV9tPsg0FHEeVKClL7UEXe67C
	 3peyv7esqvp8hs9FpLLrnNmmhZ9Xhv0VcPDIam7EuQl1nU9Fdu6HjNXM9BFjNepPtl
	 vYIwFc0Im+sHEI/GAuMBDlZ8aV0+rzVVqAY+anyVqbabu7UfaTNNCLgytboe3xhTyY
	 Ee+jaJKsxXpsY8iBowFsm/lmK1qWZMGX5zCCfGV4t3g4kN1pwEXsu2ZxHOzJNCS9dA
	 yNq6mZ1K9CIxg==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id A73B820123;
	Fri, 18 Sep 2026 22:18:11 +0000 (UTC)
From: Peter Marshall <pm@petermarshall.ca>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 04/11] platform/x86: int3472: Add VD55G0 supply GPIO mapping
Date: Fri, 18 Sep 2026 18:16:58 -0400
Message-ID: <20260918221705.323510-5-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918221705.323510-1-pm@petermarshall.ca>
References: <20260918221705.323510-1-pm@petermarshall.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vd55g sensor drivers / DT bindings expect non-standard supply names.
Add a mapping to enable them.

Signed-off-by: Peter Marshall <pm@petermarshall.ca>
---
 drivers/platform/x86/intel/int3472/discrete.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index b48cf1b7fd5f..bf145ee0869b 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -198,6 +198,24 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "vana",
 		.enable_time_us = GPIO_REGULATOR_ENABLE_TIME,
 	},
+	{
+		.hid = "SMO55F0",
+		.type_from = INT3472_GPIO_TYPE_HANDSHAKE,
+		.type_to = INT3472_GPIO_TYPE_HANDSHAKE,
+		.con_id = "vcore",
+	},
+	{
+		.hid = "SMO55F0",
+		.type_from = INT3472_GPIO_TYPE_DOVDD,
+		.type_to = INT3472_GPIO_TYPE_DOVDD,
+		.con_id = "vddio",
+	},
+	{
+		.hid = "SMO55F0",
+		.type_from = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.type_to = INT3472_GPIO_TYPE_POWER_ENABLE,
+		.con_id = "vana",
+	},
 };
 
 static bool int3472_gpio_map_hids_match(struct acpi_device *adev,
-- 
2.55.0

