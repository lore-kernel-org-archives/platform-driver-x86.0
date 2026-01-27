Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C4D22FDEA
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510458; cv=none; b=aZ56IfL5/YDY5XySfGJI8+eC7nIwccY3+xsly/31QuZKwXdxdYGVBlENLnAM3IsFEZFRoFWJcbJYJd8emIvcEh9+3H1px4zsK88/erZeSeNuuvOLQxLPvzkMypF6AQjinMSA5EgqlSSqaEOlzPm+j5Cpk5Z3k3SGT8oBd1TDu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510458; c=relaxed/simple;
	bh=xPVSlWvaet9868GsCY1jJthXsfYn5a7/fBimRT/J9Pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQjXTT77uwoOfN0aj54MtFomjAweeEh6DDu1qKPOPJUG11PzZ2azR+PHaMrQ1+HqnfVIjKyMywhWIEjxYRZNE6wQTQIH5qRjmnNnfzWhPp2uKap3gNBe1FpMACtWke9YYPcdv6YaTJEASLSHAy1vOnJDnoUWoWdaW392EWNXHck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8BUvbNC; arc=none smtp.client-ip=209.85.210.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8BUvbNC"
Received: by mail-pf1-f196.google.com with SMTP id d2e1a72fcca58-81ed3e6b8e3so2634306b3a.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Jan 2026 02:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769510457; x=1770115257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxx+6jRrhPvMg9VlbKNlTg2M9XXacffYRgMnxqmD5m4=;
        b=S8BUvbNC6fJMujm94XxufNP6OjQFaaVvrmBArsfyIJFnRtOK0h1KnJbrnUWX8xbYgI
         7fTCBlqjpw5rUHbJ74creJ85wKvrsJcRx3jsoQ/ehGU3WzCxbNuvaFvD9cmf40AKb2Ba
         9r+3p5X1Q+WrCqwMiET7hwMzidemcUu79aSdKjcDvC6AMz7n4KeOavp+yU7zTv8rwJ8o
         urCDI21HovFCJnwThY1QcfsJmF3yimUI9X4ZN5pA47Jjh1JnzQAa273gP7JmxGLBQdYV
         2xIZIqfr+l24ADML+J7VLzSiC65GQhWIuChWimo9Fvhs++AFFPob3Y+zi74FOvv07EjE
         eA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769510457; x=1770115257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxx+6jRrhPvMg9VlbKNlTg2M9XXacffYRgMnxqmD5m4=;
        b=vm3OsNuS0PceYCcyPBHF7X9AterFD78QJYm27Dh+1uIHn/egaJRP9wcA+KDRu65nRo
         uRojCPAcpR9g4p1XCn6UZvNV+8qc97q6HDcZCi2cE4S67plYD57r85d1AqtymodOMtbQ
         k5uRIJrtLAI22ioATEqH0FyoaIRJ50nskg3bAgnZ+WmfJ0f1iNsAAOdIbbwbtmHSemGC
         zatu/gsg5H9Pj6IYh4U20ExH5fTTb++CSSZ2ktUXJ6rUuEIghyeVfb9Rto2xoF473J0g
         F5cAyPuZ1rrBSUILNWSMtdpu2LODN3IxAErrseP1yPx7k682TDYoN742nI+qswzhQkXq
         7+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW6uVxgWcB/EJJQ/ULCvIpNrG2A8VD5zO256A4UYb6oLolf/p0otVJNgoRID7IomxbO52FNwyqIbkAPXsNyjWV+gbfJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxhhKlAuJ9AJo8AuGIjx0UreMp1rYUVb3JFbVZC/vNr9f0t71Yw
	8Bd+YLPL2gfb6krtO2FKGUVEkUpE6UFOSOzacdT6DQJATIMdz3RIWZq+
X-Gm-Gg: AZuq6aKQhef01JnFPn1RO7us8jF1OFe0sMmoBfa/n5fvqoMaIsxRj45oappgVq7LB78
	D80ipnUVq/BuXuEJHSakwfYvt7FZQhBtzj7ZQGY57M2HRoHTTy4kPNo1Sq3InDlX73mnY6HnDVJ
	WOs65OaMRt7hfdNUl6nsquWKBRV52nplycGtFMEomXrfB/ecajwoCpfmcjTSHDULEZQS6pUkclF
	F2pj4UTYYlrBzKZavHqHn0bNVcPf52QU5RKBve6nAnWiRPWlysSZXI3bq1Q+Iyhi2U/SV+1YWUK
	ha3qy8+6nYUDbk1caAW9WZx4rPOUlbDWRmYKIEcRqhdmgbd3NJrS7dlRk2IQhKHrgOTN67iPaYB
	lCE1hf560oSsqRT6cRRZPnTpsh5D+GustQ/XftfPyDBXO2rucbea2LtbilsUhowTWULj6VZBps/
	/bWAFmNRk+LmqkMAxoy4jChvMd8r17piRopvSzzw==
X-Received: by 2002:a05:6a00:1495:b0:822:abcd:db0f with SMTP id d2e1a72fcca58-823692c3b99mr1577151b3a.52.1769510456609;
        Tue, 27 Jan 2026 02:40:56 -0800 (PST)
Received: from c12-ThinkPad-X1-Carbon-Gen-12 ([2400:2410:5f2b:700:38fe:3edc:7f99:7e99])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82339095c85sm7218907b3a.67.2026.01.27.02.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:40:55 -0800 (PST)
From: Vishnu Sankar <vishnuocv@gmail.com>
To: mpearson-lenovo@squebb.ca,
	dmitry.torokhov@gmail.com,
	hmh@hmh.eng.br,
	hansg@kernel.org,
	corbet@lwn.net,
	derekjohn.clark@gmail.com,
	ilpo.jarvinen@linux.intel.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	vsankar@lenovo.com,
	Vishnu Sankar <vishnuocv@gmail.com>
Subject: [PATCH v6 3/3] Documentation: thinkpad-acpi - Document doubletap_enable attribute
Date: Tue, 27 Jan 2026 19:39:07 +0900
Message-ID: <20260127103907.20269-4-vishnuocv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260127103907.20269-1-vishnuocv@gmail.com>
References: <20260127103907.20269-1-vishnuocv@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the doubletap_enable sysfs attribute for ThinkPad ACPI driver.

Signed-off-by: Vishnu Sankar <vishnuocv@gmail.com>
---
Changes in v6:
- Fix formatting of doubletap_enable sysfs documentation (separate Values list)
---
 .../admin-guide/laptops/thinkpad-acpi.rst     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
index 4ab0fef7d440..9a660724648b 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1521,6 +1521,27 @@ Currently 2 antenna types are supported as mentioned below:
 The property is read-only. If the platform doesn't have support the sysfs
 class is not created.
 
+doubletap_enable
+----------------
+
+sysfs: doubletap_enable
+
+Controls whether TrackPoint doubletap events are filtered out. Doubletap is a
+feature where quickly tapping the TrackPoint twice triggers a special function key event.
+
+The available commands are::
+
+                cat /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 1 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+                echo 0 | sudo tee /sys/devices/platform/thinkpad_acpi/doubletap_enable
+
+Values:
+
+        * 1 - doubletap events are processed (default)
+	* 0 - doubletap events are filtered out (ignored)
+
+	This setting can also be toggled via the Fn+doubletap hotkey.
+
 Auxmac
 ------
 
-- 
2.51.0

