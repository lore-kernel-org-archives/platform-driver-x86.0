Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2305541226
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 13:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dPCylrb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704718967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CTzeLq5UY/1OvWIJuxseZGoQrZ+HB1rfwOl+DYaY4U=;
	b=dPCylrb8v1DNleuseze7//CZPv+AKrOqCXakgM3NsNt60cVTSSHPHbmyU4p2UCI+d49Bui
	tk4T6T2MXHI/NY4MSVSutYwgte2zHL2ytvgnLHZ8x1/nMv9HuvOnrVoZ5gTYywCuQf2syG
	ojJMA9I4MASCyHThOtRH5P1CvIwFyPQ=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-284-n7nOq_g9OM2RfuHrkU3yzg-1; Mon,
 08 Jan 2024 08:02:46 -0500
X-MC-Unique: n7nOq_g9OM2RfuHrkU3yzg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D017C3806704;
	Mon,  8 Jan 2024 13:02:45 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4386D502C;
	Mon,  8 Jan 2024 13:02:43 +0000 (UTC)
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
Subject: [PATCH v3 1/5] clk: x86: Move clk-pmc-atom register defines to include/linux/platform_data/x86/pmc_atom.h
Date: Mon,  8 Jan 2024 14:02:34 +0100
Message-ID: <20240108130238.540794-2-hdegoede@redhat.com>
In-Reply-To: <20240108130238.540794-1-hdegoede@redhat.com>
References: <20240108130238.540794-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Move the register defines for the Atom (Bay Trail, Cherry Trail) PMC
clocks to include/linux/platform_data/x86/pmc_atom.h.

This is a preparation patch to extend the S0i3 readiness checks
in drivers/platform/x86/pmc_atom.c with checking that the PMC
clocks are off on suspend entry.

Note these are added to include/linux/platform_data/x86/pmc_atom.h rather
then to include/linux/platform_data/x86/clk-pmc-atom.h because the former
already has all the other Atom PMC register defines.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- This is a new patch in v2 of this series
---
 drivers/clk/x86/clk-pmc-atom.c             | 13 +------------
 include/linux/platform_data/x86/pmc_atom.h | 13 +++++++++++++
 2 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/x86/clk-pmc-atom.c b/drivers/clk/x86/clk-pmc-atom.c
index 2974dd0ec6f4..5ec9255e33fa 100644
--- a/drivers/clk/x86/clk-pmc-atom.c
+++ b/drivers/clk/x86/clk-pmc-atom.c
@@ -11,23 +11,12 @@
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/platform_data/x86/clk-pmc-atom.h>
+#include <linux/platform_data/x86/pmc_atom.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
 #define PLT_CLK_NAME_BASE	"pmc_plt_clk"
 
-#define PMC_CLK_CTL_OFFSET		0x60
-#define PMC_CLK_CTL_SIZE		4
-#define PMC_CLK_NUM			6
-#define PMC_CLK_CTL_GATED_ON_D3		0x0
-#define PMC_CLK_CTL_FORCE_ON		0x1
-#define PMC_CLK_CTL_FORCE_OFF		0x2
-#define PMC_CLK_CTL_RESERVED		0x3
-#define PMC_MASK_CLK_CTL		GENMASK(1, 0)
-#define PMC_MASK_CLK_FREQ		BIT(2)
-#define PMC_CLK_FREQ_XTAL		(0 << 2)	/* 25 MHz */
-#define PMC_CLK_FREQ_PLL		(1 << 2)	/* 19.2 MHz */
-
 struct clk_plt_fixed {
 	struct clk_hw *clk;
 	struct clk_lookup *lookup;
diff --git a/include/linux/platform_data/x86/pmc_atom.h b/include/linux/platform_data/x86/pmc_atom.h
index b8a701c77fd0..557622ef0390 100644
--- a/include/linux/platform_data/x86/pmc_atom.h
+++ b/include/linux/platform_data/x86/pmc_atom.h
@@ -43,6 +43,19 @@
 				BIT_ORED_DEDICATED_IRQ_GPSC | \
 				BIT_SHARED_IRQ_GPSS)
 
+/* External clk generator settings */
+#define PMC_CLK_CTL_OFFSET		0x60
+#define PMC_CLK_CTL_SIZE		4
+#define PMC_CLK_NUM			6
+#define PMC_CLK_CTL_GATED_ON_D3		0x0
+#define PMC_CLK_CTL_FORCE_ON		0x1
+#define PMC_CLK_CTL_FORCE_OFF		0x2
+#define PMC_CLK_CTL_RESERVED		0x3
+#define PMC_MASK_CLK_CTL		GENMASK(1, 0)
+#define PMC_MASK_CLK_FREQ		BIT(2)
+#define PMC_CLK_FREQ_XTAL		(0 << 2)	/* 25 MHz */
+#define PMC_CLK_FREQ_PLL		(1 << 2)	/* 19.2 MHz */
+
 /* The timers accumulate time spent in sleep state */
 #define	PMC_S0IR_TMR		0x80
 #define	PMC_S0I1_TMR		0x84
-- 
2.43.0

