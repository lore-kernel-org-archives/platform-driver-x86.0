Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FF41A294
	for <platform-driver-x86@vger.kernel.org>; Sat, 29 Nov 2025 00:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764376346; cv=none; b=Uhtuul75C3b5msrA/2/Z284E6yCkYGtHFRew49n4lWCYxgnYj6mIAYN9UqX6QhAlps+1lQLxPMQVptrNGKTgdi852GH1f4HrRNmcLqoaXlkgNtAo6lqeIaeBpQ7P8JnFuT/zuNPsLFrg7pyUQ424EJvIwvCb4mu5EIIooNUg1yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764376346; c=relaxed/simple;
	bh=IuCeBnCA12nf/Fqu5eYQSw4oiYf3AXHYMr3vFYEVRiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O68gZburpIB5S1a0CSqGKq/PPl730QK5K4WjpzE2BH+z/rAX6I/T4QmSItiHNNFX3eo9ApyxU9NLHdeTExki2CYEuM9kjQdy7JogKIISjJw7hl+ormfUwraTIjHlbOh94SEsYJBMoNQVDEMvIlb9HIbs/tbMcbne+cgcAGN+x/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ay5CPxsL; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ay5CPxsL"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e264528aso25562555ad.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Nov 2025 16:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764376344; x=1764981144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQatbXiS4IDF8tyOs0fGlxPqW6GCHi1/Lga4WQU56dE=;
        b=Ay5CPxsLDZtDkM7DFTHBsEvCcPU1/D5R/I1Jz1elHU243BDW12dDboEm+veKI8X4+T
         R5NGs7ceoL7gRqDV1dZojc5nZmSVHtJEJxz2jcGKMwFlxyb2GU9s5SiYnWf5tgpuHLIp
         UEAqXJgJI2zLz6g2J+s6flxPLJ4ErJyD/ZhKavFSV4y5x/DFeLBX+sp7MHC2SrAWdeyo
         sRdLG1uCJg8PjHzM6sYIa5HG0NdomvK2SxY4XAsnglVjWVd6wrTvULw3bgfrkKcdRgNW
         no1JSrsqy99TXvBd84WuGSAAeOZWyQhH9Ahfl3TpLXDaEUGWi+Mc6PglEdckLoJx3xRu
         Ds2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764376344; x=1764981144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CQatbXiS4IDF8tyOs0fGlxPqW6GCHi1/Lga4WQU56dE=;
        b=KonJl+u9dgAjGeO52DLVfxK1KRj7cEFiZy63Ooi1no9/Jr90LWE1sS4vDQJ3kgLLMR
         wvKokw8sNYGo47Gebx6yqLU4pHHOZejbuvBABanmln/isJNeCkm4N/drKD+oFigkeuoU
         CUZO/1y9XKwMyePgITa+SAhywhWniCLUsZL1MndU6ZTqThH7bFLsKV8e+Ztgk8JE5xN/
         iWIGUoFLqKdmgwNjtbtpW/FzIvk8mcUm/45sCs35pUerLrKm8Km+TOd/KkN5xW7HfuWb
         hl9YF1X7Y0ypgxniWFRDMePrSSR+mU1HOmORNMrk+V0W4CRACVbKPmq11t2mkAA8K6hK
         f2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCW0+bdL8erTpNnuR/HTU1VbcGL6Lb93ysM+mkAF12XZj8bDqf+Z7o/FxxNILJwg9IF3Oqa864N2Jor34MG/C9oY3pNC@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvb736mlfXX6tIwZqIG1gXFrqHL/ySKvodxCSj6hRi/zbZnzoo
	WOP8sqqCgv1jF9BA9ZdhMg1q1mVgBOG2lzn+QqnJkTt0OBjfwmDHyaRA
X-Gm-Gg: ASbGncuvE7AU/1LjHidlxmMU3qzNcwWESXAT5LSgOMyecCU63si9wCZZup4NBQeXLRN
	usI1Kz5lwaycNV1eIxj8MtzbQcNVoctXTZX+MFfBkIREDqxLbbPtpr6QRRk4k7FMxTv9hMbaDDf
	FLBd3xNvZx7rXgz/iA24DQzKD3azG3vizCl39eBhOPRjY1rqAG115ke6ndfeZQB1TFE7XCxsfhz
	KfNuGjRBdYxlfEZvwuva/8fkJwXou7rGAWvuDGZ9UVxCh4fWdlEQM9QVZ+B8TLvTcgIGOqLZFAu
	fM1T8Zu1o4JMJ4JDsG/9pLSgptARFf/8QZPAzwWFxYtx/6OqIwHy0OeZ9B8ORRGeF0/PzIH6Mqd
	eBCfvS8RcTkw1WeuX7k0s7+6NQT3Hw4Pdefkuzrsewr0VwOC4aGbTR7uSwA0OiZGEv6eF9PYMLm
	llyEwl+Ua8JjJRcAHlBqEuT4c1YzWX3pyKka68pjiaYWw2Ex2qCBFhxbISViItVUMtmQ==
X-Google-Smtp-Source: AGHT+IH+tqI7TxrE3Powg5mDCkQtUgWbnSb7QtzYFL6VRXzqfB4juIiEGJZGEy2486ootGZ/7Fn4SQ==
X-Received: by 2002:a17:903:1aaf:b0:296:3f23:b910 with SMTP id d9443c01a7336-29baae45c56mr137888385ad.9.1764376343606;
        Fri, 28 Nov 2025 16:32:23 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb40276sm56054805ad.73.2025.11.28.16.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 16:32:23 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: corbet@lwn.net,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	derekjohn.clark@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v4 1/3] input: trackpoint - Enable doubletap by default on capable devices
Date: Sat, 29 Nov 2025 09:25:31 +0900
Message-ID: <20251129002533.9070-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251129002533.9070-1-vishnuocv@gmail.com>
References: <20251129002533.9070-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable doubletap functionality by default on TrackPoint devices that
support it. The feature is detected using firmware ID pattern matching
(PNP: LEN03xxx) with a deny list of incompatible devices.

This provides immediate doubletap functionality without requiring
userspace configuration. The hardware is enabled during device
detection, while event filtering continues to be handled by the
thinkpad_acpi driver as before.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
Changes in v4:
- Simplified approach: removed all sysfs attributes and user interface
- Enable doubletap by default during device detection
- Removed global variables and complex attribute infrastructure
- Uses minimal firmware ID detection with deny list
- Follows KISS principle as suggested by reviewers

Changes in v3:
- No changes

Changes in v2:
- Improve commit messages
- Sysfs attributes moved to trackpoint.c
- Removed unnecessary comments
- Removed unnecessary debug messages
- Using strstarts() instead of strcmp()
- is_trackpoint_dt_capable() modified
- Removed _BIT suffix and used BIT() define
- Reverse the trackpoint_doubletap_status() logic to return error first
- Removed export functions as a result of the design change
- Changed trackpoint_dev->psmouse to parent_psmouse
- The path of trackpoint.h is not changed
---
 drivers/input/mouse/trackpoint.c | 51 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  5 ++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..67144c27bccd 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -393,6 +393,48 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
 	return 0;
 }
 
+/* List of known incapable device PNP IDs */
+static const char * const dt_incompatible_devices[] = {
+	"LEN0304",
+	"LEN0306",
+	"LEN0317",
+	"LEN031A",
+	"LEN031B",
+	"LEN031C",
+	"LEN031D",
+};
+
+/*
+ * Checks if it's a doubletap capable device
+ * The PNP ID format is "PNP: LEN030d PNP0f13".
+ */
+static bool is_trackpoint_dt_capable(const char *pnp_id)
+{
+	const char *id_start;
+	char id[8];
+	size_t i;
+
+	if (!strstarts(pnp_id, "PNP: LEN03"))
+		return false;
+
+	/* Points to "LEN03xxxx" */
+	id_start = pnp_id + 5;
+	if (sscanf(id_start, "%7s", id) != 1)
+		return false;
+
+	/* Check if it's in the deny list */
+	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
+		if (strcmp(id, dt_incompatible_devices[i]) == 0)
+			return false;
+	}
+	return true;
+}
+
+static int trackpoint_set_doubletap(struct ps2dev *ps2dev, bool enable)
+{
+	return trackpoint_write(ps2dev, TP_DOUBLETAP, enable ? TP_DOUBLETAP_ENABLE : TP_DOUBLETAP_DISABLE);
+}
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -470,6 +512,15 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	/* Enable doubletap by default on capable devices */
+	if (is_trackpoint_dt_capable(ps2dev->serio->firmware_id)) {
+		int error = trackpoint_set_doubletap(ps2dev, true);
+		if (!error)
+			psmouse_info(psmouse, "Doubletap enabled by default!\n");
+		else
+			psmouse_warn(psmouse, "Failed to enable doubletap: %d\n", error);
+	}
+
 	return 0;
 }
 
diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
index eb5412904fe0..3e03cdb39449 100644
--- a/drivers/input/mouse/trackpoint.h
+++ b/drivers/input/mouse/trackpoint.h
@@ -69,6 +69,8 @@
 					/* (how hard it is to drag */
 					/* with Z-axis pressed) */
 
+#define TP_DOUBLETAP		0x58	/* TrackPoint doubletap register */
+
 #define TP_MINDRAG		0x59	/* Minimum amount of force needed */
 					/* to trigger dragging */
 
@@ -110,6 +112,9 @@
 					   external device will be forced to 1 */
 #define TP_MASK_EXT_TAG			0x04
 
+/* Doubletap register values */
+#define TP_DOUBLETAP_ENABLE	0xFF	/* Enable value */
+#define TP_DOUBLETAP_DISABLE	0xFE	/* Disable value */
 
 /* Power on Self Test Results */
 #define TP_POR_SUCCESS		0x3B
-- 
2.51.0

