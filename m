Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B347F134B5
	for <platform-driver-x86@vger.kernel.org>; Sun,  7 Jan 2024 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZU4alR2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704636204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9XcEZtVlWJbYKm9+7v5nWl09Pma1pqjIHTzB6rryUDo=;
	b=ZU4alR2TnMGwK4Xu6BvxHHDeFAMddmc6gRkw3xIE9Pueh68TVIyzf6BWVbtDBlCByOqdqi
	N0J4mUjMVXaMzo4LUD7YtHvTlEQcIlf4WJ7xAt8KS0L4UbczKN6xEGMVo2Jjph0IrXxF/r
	xPYH6ISCjCAWdosFTh+uuL66sAcOHp8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-481-NHmGhWL_Nla_Ore9s13tEg-1; Sun,
 07 Jan 2024 09:03:18 -0500
X-MC-Unique: NHmGhWL_Nla_Ore9s13tEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEE5738149A2;
	Sun,  7 Jan 2024 14:03:17 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 074A52026D6F;
	Sun,  7 Jan 2024 14:03:15 +0000 (UTC)
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
Subject: [PATCH v2 2/5] platform/x86: pmc_atom: Annotate d3_sts register bit defines
Date: Sun,  7 Jan 2024 15:03:07 +0100
Message-ID: <20240107140310.46512-3-hdegoede@redhat.com>
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

The include/linux/platform_data/x86/pmc_atom.h d3_sts register bit defines
are named after how these bits are used on Bay Trail devices.

On Cherry Trail (CHT) devices some of these bits have a different meaning
according to the datasheet.

At a comment to the defines for bits which have a different meaning
on Cherry Trail devices.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 include/linux/platform_data/x86/pmc_atom.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/linux/platform_data/x86/pmc_atom.h b/include/linux/platform_data/x86/pmc_atom.h
index 557622ef0390..161e4bc1c9ee 100644
--- a/include/linux/platform_data/x86/pmc_atom.h
+++ b/include/linux/platform_data/x86/pmc_atom.h
@@ -117,14 +117,14 @@
 #define	BIT_SCC_SDIO		BIT(9)
 #define	BIT_SCC_SDCARD		BIT(10)
 #define	BIT_SCC_MIPI		BIT(11)
-#define	BIT_HDA			BIT(12)
+#define	BIT_HDA			BIT(12) /* CHT datasheet: reserved */
 #define	BIT_LPE			BIT(13)
 #define	BIT_OTG			BIT(14)
-#define	BIT_USH			BIT(15)
-#define	BIT_GBE			BIT(16)
-#define	BIT_SATA		BIT(17)
-#define	BIT_USB_EHCI		BIT(18)
-#define	BIT_SEC			BIT(19)
+#define	BIT_USH			BIT(15) /* CHT datasheet: reserved */
+#define	BIT_GBE			BIT(16) /* CHT datasheet: reserved */
+#define	BIT_SATA		BIT(17) /* CHT datasheet: reserved */
+#define	BIT_USB_EHCI		BIT(18) /* CHT datasheet: XHCI!    */
+#define	BIT_SEC			BIT(19) /* BYT datasheet: reserved */
 #define	BIT_PCIE_PORT0		BIT(20)
 #define	BIT_PCIE_PORT1		BIT(21)
 #define	BIT_PCIE_PORT2		BIT(22)
-- 
2.43.0

