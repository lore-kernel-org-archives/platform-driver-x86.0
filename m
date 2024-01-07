Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1816134A0
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jan 2024 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D/C7922U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704636216;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V9K+PJO1zO9GBDzPPOHPKwdtWBmxo+YlFT6zJHmwLoY=;
	b=D/C7922Uvahfh9EsYB86KkXKAR4ZwHt9sVU4RsJGPVHvWKTN+7ma4MdVTMRpNBy3Gcvyiw
	HhL/WJO1WCtAXn3lbtkxvp9iyWKpbL4OWWSlQyOZCSyNtViL/Ov0w45EgLkhy9QlrCoYl9
	0mXaMOey5DqYYUP+/tMIGO2IlXFup8o=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-Pj9yQcOmNgOv4pR0rqpF_A-1; Sun,
 07 Jan 2024 09:03:22 -0500
X-MC-Unique: Pj9yQcOmNgOv4pR0rqpF_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D78201C05122;
	Sun,  7 Jan 2024 14:03:21 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 124662026D66;
	Sun,  7 Jan 2024 14:03:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 4/5] platform/x86: pmc_atom: Check state of PMC clocks on s2idle
Date: Sun,  7 Jan 2024 15:03:09 +0100
Message-ID: <20240107140310.46512-5-hdegoede@redhat.com>
In-Reply-To: <20240107140310.46512-1-hdegoede@redhat.com>
References: <20240107140310.46512-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

Extend the s2idle check with checking that none of the PMC clocks
is in the forced-on state. If one of the clocks is in forced on
state then S0i3 cannot be reached.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Drop the PMC_CLK_* defines these are defined in
  include/linux/platform_data/x86/pmc_atom.h now
- Drop duplicated "pmc_atom: " prefix from pr_err() message
---
 drivers/platform/x86/pmc_atom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 81ad66117365..d04f635c4075 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -477,6 +477,7 @@ static void pmc_s2idle_check(void)
 	u32 func_dis, func_dis_2;
 	u32 d3_sts_0, d3_sts_1;
 	u32 false_pos_sts_0, false_pos_sts_1;
+	int i;
 
 	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
 	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
@@ -504,6 +505,16 @@ static void pmc_s2idle_check(void)
 
 	/* High part */
 	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
+
+	/* Check PMC clocks */
+	for (i = 0; i < PMC_CLK_NUM; i++) {
+		u32 ctl = pmc_reg_read(pmc, PMC_CLK_CTL_OFFSET + 4 * i);
+
+		if ((ctl & PMC_MASK_CLK_CTL) != PMC_CLK_CTL_FORCE_ON)
+			continue;
+
+		pr_err("clock %d is ON prior to freeze (ctl 0x%08x)\n", i, ctl);
+	}
 }
 
 static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
-- 
2.43.0

