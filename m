Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B4D8484
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 16:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dCqoSd2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704040417;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=543pdg4531ECC9zNmaAP/X0vwyC4F12wBQA0D68vE0k=;
	b=dCqoSd2TzdaAzMqnh4NLH20RNGy0sGwyVRGyIo7fdY1/shECGYorFZIXw9QMnJNWMt24Q7
	ziBes2b59AigBTX8FdFwyS5RkC8ak49y52Khs0ehszrsP5UYKWUifkwhbSoe5samHuwqgS
	34hzijJ8Ey8kY3sost9XhjqO4/rCTHc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-zORWLyCdMGa31qFs5Gb_BA-1; Sun,
 31 Dec 2023 11:33:33 -0500
X-MC-Unique: zORWLyCdMGa31qFs5Gb_BA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F23F81C07540;
	Sun, 31 Dec 2023 16:33:32 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42A73C15968;
	Sun, 31 Dec 2023 16:33:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 3/4] platform/x86: pmc_atom: Check state of PMC clocks on s2idle
Date: Sun, 31 Dec 2023 17:33:21 +0100
Message-ID: <20231231163322.9492-4-hdegoede@redhat.com>
In-Reply-To: <20231231163322.9492-1-hdegoede@redhat.com>
References: <20231231163322.9492-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Extend the s2idle check with checking that none of the PMC clocks
is in the forced on state. If one of the clocks is in forced on
state then S0i3 cannot be reached.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/pmc_atom.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index e14d489fa6f9..375010ef61ae 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -20,6 +20,14 @@
 #include <linux/seq_file.h>
 #include <linux/suspend.h>
 
+#define PMC_CLK_CTL_OFFSET		0x60
+#define PMC_CLK_NUM			6
+#define PMC_CLK_CTL_GATED_ON_D3		0x0
+#define PMC_CLK_CTL_FORCE_ON		0x1
+#define PMC_CLK_CTL_FORCE_OFF		0x2
+#define PMC_CLK_CTL_RESERVED		0x3
+#define PMC_MASK_CLK_CTL		GENMASK(1, 0)
+
 struct pmc_bit_map {
 	const char *name;
 	u32 bit_mask;
@@ -477,6 +485,7 @@ static void pmc_s2idle_check(void)
 	u32 func_dis, func_dis_2;
 	u32 d3_sts_0, d3_sts_1;
 	u32 false_pos_sts_0, false_pos_sts_1;
+	int i;
 
 	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
 	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
@@ -504,6 +513,16 @@ static void pmc_s2idle_check(void)
 
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
+		pr_err("pmc_atom: clk %d is ON prior to freeze (ctl %08x)\n", i, ctl);
+	}
 }
 
 static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
-- 
2.43.0

