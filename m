Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F45A274FE3
	for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 23:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766793244; cv=none; b=mMgLgKK2ZYbv6lKnN2mXVwYrQNdwjVQSoSL0HU4Lq0B9pN4bUrOIhNB7pqDglpDqxvkz+GhRUYqLzJd1iLmZmqzLpI8TUORYhLu5s0LybKL7jre82PYMPjlOrgtzETZJxuCvib9jIPsCpb8sKohr5dy+7q++mNqnubcPb97MQIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766793244; c=relaxed/simple;
	bh=Hrnazuahv2v9rpFCsMEJC0zgdKheqCVmhgytvsJwNK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsS5Fh5g/K7YsaBuY7ibVcYK0OLnVAGsGxyAwAiNe6wKQ/4QoLSA45D1P+Bn9YQwZRJxKU4dVTqmv/Sb3u6zraAjkkUzWfu/jeJGAg33HEHRIE7f29jxRgX8YYfuTsf7WdTTaYZGKd6DlXstvd71Wks6XdaPeTmoA+eE6Rw+k1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GePis9lF; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GePis9lF"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso6005709b3a.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Dec 2025 15:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766793242; x=1767398042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMAB5C1zkD/DVWLKDv3RV0IL8z1Pp7D3kuyKzpTCHnM=;
        b=GePis9lF1yHS3bY/G6B2v56xmBrly5U9uR8aQpbIjN1lGqGIB3r+bA2em53PW3y+P2
         hdzxsXz+R7/SlomPUwUcY4GBgNoHTGfX3rCkkjQJ0cev6icApLdw8sCM0Os5FQOnPCpO
         tztGn0VFz8QzA+gfqTuosMOBENkAA3O1NU/8cE9XOqNPhUFkx7yH/Dk2tiDz50a52ijb
         1CU9BfqQ+O0ygVk4FUYQFiVfutd0PkYK92BA2Jhv3pXDAGpC85XZtiXAT5DnrQv+fQSB
         eW3371+7oNWmSapTff2t/3e5b9BJVivwdthE2P8BDmuKHczZlYj4YGGM/rRfh4wyAJhS
         +O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766793242; x=1767398042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMAB5C1zkD/DVWLKDv3RV0IL8z1Pp7D3kuyKzpTCHnM=;
        b=LlEY5J1vMJYnf61cAVVEwKXEB6Qx+ZyuxR+Q7Xqfshv31SGgphv1KaXEiBz+E9y1Ot
         nv2uDo5ZGhw0npGjTOIIw+uAj/okxZyBeOhYJdkT63KnIBi+Uf05FIW9z/4xcytepgJX
         rgTMUAQoTDH5QRzjGxb1nZ8iGDCSW9XcP4AiQAg5BP5AULRVapHZiKkCHfBzG/2z/VmO
         3W4T7Ne3KAK+fipNt+4xdCvyJPbTLV3T2ANwkTtOXD59HHOSpDSl8m/vt7ahX1Lh5O5W
         jkLZBCNjFveOU5BpVvQTk1HWiG6EtmJKSIYJsQ4/WEeMj4+6L8ACSflOsSfN3AumArVQ
         zcfA==
X-Forwarded-Encrypted: i=1; AJvYcCU1KfOunJoXDCKK0Vvt/GQI25eU+AC2hZiLpyoDy88ky4tfTYW9W8YLaNFwlnn3PE4ASnIKdUclJlh8p1C271OokT4k@vger.kernel.org
X-Gm-Message-State: AOJu0YyScGDzDHF9Dt4yvMcXwzX9mMPUSiABHtdYUYo09My8Vcn7M0oT
	mfZY8TeDo588TXwrhsZ3gH49A1S4F2/oMARdAGF4qDlxtc0CcV3VDBpJ
X-Gm-Gg: AY/fxX7G8FD/F3uiM76JQ06ZY1HYCJqa9mOd6I0rwbiBZT9372fYCrw/tVyEioQbe0+
	WYOx4gRDlAuEZTf6IAF2vFLinVpb3XLi1LWrcGnO9X9LnOdR0R1hZ6LtUxCGXl/ZR/ljh2FjZ8B
	oOFbEnVLaCWjhk1u1YRo8Yh2ngfW8RpgbqvOEow7VCL2RfGJhmHj2SzVTi/gHTHE+bVe1vakWdY
	+/JHzldAtt7KdEyFKE6E1wLfx4NnmrCP6Qi8i5N+x30JYwLB3sUVHSVyW+YTKXi8YQVg0jBnoG9
	pBewiqlIwA8esd3DifcIiQBGJn7Z9ZLmddr9lRrYGkdN79HdQhAyixVy/8EiAAceZCpn1xOAu+G
	IahAgN+EgyW9gt1qwBRUO2F2KVEiDe9dWM51LiIYSxkHtAsWF+tWOas4k6qiP+asOVgMUaPvvxq
	QgIzqlrkePhUE+FT1kmxpA12Gcwpu8O+gfjXyYBGfp3R+Qtv5jkdXGw2mzQEMRGznsjQ==
X-Google-Smtp-Source: AGHT+IE/jRVZWjbzqOMpIpqznB8AgsA/aJsvshwBSCcVXQGXPfun222sZyDCBMQFidKb3X3DLoILKg==
X-Received: by 2002:a05:6a00:1ca2:b0:7f6:6011:b106 with SMTP id d2e1a72fcca58-7ff648e611emr22680938b3a.19.1766793241725;
        Fri, 26 Dec 2025 15:54:01 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 (softbank221049092147.bbtec.net. [221.49.92.147])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48cea1sm23395216b3a.45.2025.12.26.15.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 15:54:01 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net,
	derekjohn.clark@gmail.com
Cc: mpearson-lenovo@squebb.ca,
	linux-doc@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v5 1/3] input: trackpoint - Enable doubletap by default on capable devices
Date: Sat, 27 Dec 2025 08:50:59 +0900
Message-ID: <20251226235101.106451-2-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251226235101.106451-1-vishnuocv@gmail.com>
References: <20251226235101.106451-1-vishnuocv@gmail.com>
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
Changes in v5:
- Renamed function to trackpoint_is_dt_capable()
- Simplified string comparison without sscanf()
- Removed wrapper function as suggested
- Fixed missing period in comment

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
 drivers/input/mouse/trackpoint.c | 47 ++++++++++++++++++++++++++++++++
 drivers/input/mouse/trackpoint.h |  5 ++++
 2 files changed, 52 insertions(+)

diff --git a/drivers/input/mouse/trackpoint.c b/drivers/input/mouse/trackpoint.c
index 5f6643b69a2c..8319b5bb6ce5 100644
--- a/drivers/input/mouse/trackpoint.c
+++ b/drivers/input/mouse/trackpoint.c
@@ -393,6 +393,45 @@ static int trackpoint_reconnect(struct psmouse *psmouse)
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
+ * Checks if it's a doubletap capable device.
+ * The PNP ID format is "PNP: LEN030d PNP0f13".
+ */
+static bool trackpoint_is_dt_capable(const char *pnp_id)
+{
+	size_t i;
+
+	if (!pnp_id)
+		return false;
+
+	/* Must start with "PNP: LEN03" */
+	if (!strstarts(pnp_id, "PNP: LEN03"))
+		return false;
+
+	/* Ensure enough length before comparing */
+	if (strlen(pnp_id) < 12)
+		return false;
+
+	/* Check deny-list */
+	for (i = 0; i < ARRAY_SIZE(dt_incompatible_devices); i++) {
+		if (!strncmp(pnp_id + 5,
+			     dt_incompatible_devices[i], 7))
+			return false;
+	}
+	return true;
+}
+
 int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 {
 	struct ps2dev *ps2dev = &psmouse->ps2dev;
@@ -470,6 +509,14 @@ int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
 		     psmouse->vendor, firmware_id,
 		     (button_info & 0xf0) >> 4, button_info & 0x0f);
 
+	/* Enable doubletap by default on capable devices */
+	if (trackpoint_is_dt_capable(ps2dev->serio->firmware_id)) {
+		if (trackpoint_write(ps2dev, TP_DOUBLETAP, TP_DOUBLETAP_ENABLE))
+			psmouse_warn(psmouse, "Failed to enable doubletap: %d\n", error);
+		else
+			psmouse_info(psmouse, "Doubletap enabled by default!\n");
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

