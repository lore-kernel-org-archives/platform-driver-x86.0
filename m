Received: from d2-2-bhs5.logotherapy.ca (d2-2-bhs5.logotherapy.ca [15.235.45.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62D6372691;
	Wed,  2 Sep 2026 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=15.235.45.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788382090; cv=none; b=iKDwARMHVL0v/a3vEOVGkfXl3Zwx+Ptzgz/dVr7tfvJ6G3WXHUhRqvcNnj7SzZ0S8o1NSVJ+w/1NXB5J0qnYqP14y/VmN83iaqlP53z2zXTyqL/mKBL8SmfwcvhHeYw8WNNQJZ4nnpYfDUEQa7gfWpeJpFDKC2BazpfBwi1/v5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788382090; c=relaxed/simple;
	bh=FKKUWpAj4a654m3ukgZsH5S2SHU9VtRvBsRSPlGvN3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e1DMh0oiPPNZMrDhfO6ild5VYHPcG9at8Yc4R18VrR/1lVUp5tTlcodlANMl5uKPEF9FgMNC1Lm5T7CX/GmV00p3YdlVJ1VpkbZnadzmyx+opyrlSU1TO6w6h689001COMC8JEgdFa0VQ9DvnkR0wDOO3qoZec+qiopBSHoVTh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca; spf=pass smtp.mailfrom=logotherapy.ca; dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b=WWGZfQUI; arc=none smtp.client-ip=15.235.45.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=petermarshall.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logotherapy.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=petermarshall.ca header.i=@petermarshall.ca header.b="WWGZfQUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=petermarshall.ca;
	s=mail; t=1788381990;
	bh=FKKUWpAj4a654m3ukgZsH5S2SHU9VtRvBsRSPlGvN3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WWGZfQUIy1zTuwEwiOi95BIBOlh31tA9WV+KpCb+HUcWaOZHiTwEvUTG0u4q753lz
	 ta0j7xCOLbGg0tFNJ8t1WVB4TTGFOXIZMRMjBPvBifULRU0qe9N7ghy4Fa1+uCvxtO
	 VQuztB7Ohfu8q2fzf0HtkCX5ijigxhwJGdttx8PS/516IzBZ6I32ItgcNoCFhJGJij
	 M4mMll9Sh3AZ/BTu9rZtbiuhEO56JbXBgDtuRAAK5+Yn0FeHdjVwiBWb1aVJBg72YK
	 KKfGL1gvgjbk6MD3hYL0GaS4pzaprKOzSCHYX4tTeHr6tW7cyusUl5C9u409DQdN9a
	 qXXq6lpv94ksQ==
Received: by d2-2-bhs5.logotherapy.ca (Postfix) id 30597223B5;
	Wed, 02 Sep 2026 20:46:30 +0000 (UTC)
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
Subject: [PATCH 4/7] platform/x86: int3472: Add VD55G0 supply GPIO mapping
Date: Wed,  2 Sep 2026 16:45:43 -0400
Message-ID: <20260902204549.657228-5-pm@petermarshall.ca>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902204549.657228-1-pm@petermarshall.ca>
References: <20260902204549.657228-1-pm@petermarshall.ca>
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
index 115bb3757..1dc6a6722 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -164,6 +164,24 @@ static const struct int3472_gpio_map int3472_gpio_map[] = {
 		.con_id = "dvdd",
 		.enable_time_us = 45 * USEC_PER_MSEC,
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
 
 static void int3472_get_con_id_and_polarity(struct int3472_discrete_device *int3472, u8 *type,
-- 
2.55.0

