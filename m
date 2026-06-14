Received: from scc-mailout-kit-02.scc.kit.edu (scc-mailout-kit-02.scc.kit.edu [129.13.231.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6122494D8;
	Sun, 14 Jun 2026 20:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.13.231.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781469996; cv=none; b=KRiU4UteByKiZArR/tNGy55U25vnl+7lakiPgAuLQDAYvY9j0yqLhVVKUOm5bBwI1O5ZvcXEUUjjZ4UQjastRucgauqDYyqpxR7TIZWoZysKGQoJhRqup6eCyV1fuwca2IKkp4Bcja0vGFuPPzmQeLmCjDkGb5k8/YWqF8asOEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781469996; c=relaxed/simple;
	bh=11+6m9zepG8NeImjnMigDwCY4Ow8GaCwqG7hc+D93lY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cDqknklR17tqi6AN7VEgdfnvx2kMYP39ruqFZc4rfFklpMgaqQEENGQdzigxL/8uKfgxy4JBl6zVu1lbAya/zzIHSfAW5hMk4JCgYDfsCJhVqR27k9mwoA1rlpUS92jDJ1SgwqOdAspWVTe5a+1hal0qlHDV3KWrgk+BSfsHmMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu; spf=pass smtp.mailfrom=student.kit.edu; dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=YeFK7DJR; dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b=JMvJ50tx; arc=none smtp.client-ip=129.13.231.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.kit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="YeFK7DJR";
	dkim=permerror (0-bit key) header.d=student.kit.edu header.i=@student.kit.edu header.b="JMvJ50tx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=20/RSuiWfquUy1acdGcykqbXfJS9kVuFLuoBIM4tl1I=; b=YeFK7DJR1Uh7F4RsIwPHWccelG
	etMMetPwWv/lEiJ3CX8kX76+kKvdnbFgXcpiOl8Z9jhNZAQrYxGleIyt7e//jzeUtqHHCxY96KbrP
	vjIliPP0HAHuyXaW0wMd32+roUZioi1xIdCnanmZ3UVUv6wMYZsVy888NCtUB4tG0jQOR1bpyuuJS
	+Xd31dtZqNRQKgtU/Z6q12wDovtSe1NxS8cEadH4FRr3OqgT296JPNDyB8r4aHYwIRvOaSTUI5fSF
	znEb89qOff1V7O9sPE1eghTiWwfC8tXSA+iEMBFqBnHbehOn2NVAcxlyM/X8+MvjsbHCLUAYQbeK1
	8P/WEy2g==;
DKIM-Signature: v=1; a=ed25519-sha256; q=dns/txt; c=relaxed/relaxed;
	d=student.kit.edu; s=kit2ed25519; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=20/RSuiWfquUy1acdGcykqbXfJS9kVuFLuoBIM4tl1I=; b=JMvJ50txx+ZRAk4OOJYAEO5gs/
	HrkrCHegGETFTSBTdk8Eso14Zc+/XPr981W4i8tejV0sWZE5FmgFl0eJl7Ag==;
Received: from kit-msx-52.kit.edu ([2a00:1398:9:f612::152])
	by scc-mailout-kit-02.scc.kit.edu with esmtps (TLS1.2:ECDHE_SECP384R1__RSA_SHA256__AES_256_GCM:256)
	(envelope-from <julian.haarmann@student.kit.edu>)
	id 1wYrWu-00000002hgd-1hG4;
	Sun, 14 Jun 2026 22:34:04 +0200
Received: from fedora.fritz.box (2001:16b8:cbe3:bd00:f6a2:257a:ebc1:2a01) by
 smtp.kit.edu (2a00:1398:9:f612::106) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 14 Jun 2026 22:34:01 +0200
From: Julian Haarmann <julian.haarmann@student.kit.edu>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J . Clark"
	<derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <platform-driver-x86@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	Julian Haarmann <julian.haarmann@student.kit.edu>
Subject: [PATCH v2] platform/x86: lenovo/ymc: Only match lower byte in WMI lid switch query response
Date: Sun, 14 Jun 2026 22:30:26 +0200
Message-ID: <20260614203235.235724-1-julian.haarmann@student.kit.edu>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On newer Lenovo Yoga devices like the "Yoga 9 2-in-1 14IPH11 - Type 83SE",
the hinge switch WMI query returns extra data in the upper bits
(e.g. 0x50001 laptop mode, 0x50002 tablet mode, ect.).

The driver previously checked for exact matches (0x01 laptop, 0x02 tablet,
ect.) causing newer switches to not work.

Mask the WMI query result to only match the lower byte and ignore upper
bits.

Signed-off-by: Julian Haarmann <julian.haarmann@student.kit.edu>
---
Changes in v2:
- Replaced raw bit mask with GENMASK() and FIELD_GET().

 drivers/platform/x86/lenovo/ymc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
index 1b73a55f1b89..015e046b0fce 100644
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -8,6 +8,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/bits.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
@@ -20,6 +22,8 @@
 #define LENOVO_YMC_QUERY_INSTANCE 0
 #define LENOVO_YMC_QUERY_METHOD 0x01
 
+#define LENOVO_YMC_STATE_MASK GENMASK(7, 0)
+
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading on boards without a convertible DMI chassis-type");
@@ -85,7 +89,9 @@ static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
 			"WMI event data is not an integer\n");
 		goto free_obj;
 	}
-	code = obj->integer.value;
+
+	/* strip upper bits (e.g. 0x50000) on newer devices */
+	code = FIELD_GET(LENOVO_YMC_STATE_MASK, obj->integer.value);
 
 	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
 		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
-- 
2.54.0

