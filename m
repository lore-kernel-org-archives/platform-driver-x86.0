Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DED3A8E6
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Feb 2024 12:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707739578; cv=none; b=M7bhPb/aqvlCgao+0L+UqALliMBb1fJ/+S1AvGXb6Z3slNOV35vaNolPOjL5z0i1Ai9sFI9bDqHDpjNe9r6VI1/8fmsuO4zkY/ny7SFIeQ7GDK5jtzrH1PCyddpBBPuH7EzufXlyjdliw+8QapZcXVE9VRMlLYgpoJY0/ogZn/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707739578; c=relaxed/simple;
	bh=JPMfAhLQtXamR2eYwkeKus44on3KhNDZgIwfWHoQnA8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jo5szFstzjwri3sXPpD7sPKgctSpBeQab9Y7Kl4SDZr1jqBsys/tm931GQZNbyBVqkMoh6RApPUfmar9pzyeoj7Epv0MZDt9iF8LkFQQpcfwu21sPI8/5mAkjnom8OVvbLwQaMyZ0rfsjs3yXgcR8owC1kqzsSbJjJhAKp15x64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V246k5nr; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V246k5nr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707739575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jQ5hzbVLwAjoyLMlmYgy12hOG+Md+J1TqW/TpvUnVMM=;
	b=V246k5nrpng9fGQ8r3BP28VRKmUdSLHE1+2ioCyb8YwU/NEvJDzNaMwGIQCi1PlH7rwdya
	cVxUQULQZay4+WF/4+SGuxNWAR5V1/X59XkHdNLR0cVTby9Pdln6TBp9gAgZMfgSJmKdOd
	2+luwaIkzz9vmkXayJYJ7X3tLFrZ/Ao=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-NhsyUd63M7SIkOZXfgfxkw-1; Mon,
 12 Feb 2024 07:06:11 -0500
X-MC-Unique: NhsyUd63M7SIkOZXfgfxkw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B7B23811F49;
	Mon, 12 Feb 2024 12:06:11 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.82])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A5E544015472;
	Mon, 12 Feb 2024 12:06:10 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: touchscreen_dmi: Consolidate Goodix upside-down touchscreen data
Date: Mon, 12 Feb 2024 13:06:08 +0100
Message-ID: <20240212120608.30469-2-hdegoede@redhat.com>
In-Reply-To: <20240212120608.30469-1-hdegoede@redhat.com>
References: <20240212120608.30469-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

Now that prefix matches for ACPI names are supported, the ts_dmi_data
structs for "GDIX1001:00" and "GDIX1001:01" can be consolidated into
a single match matching on "GDIX1001".

For consistency also change gdix1002_00_upside_down_data to match.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 969477c83e56..975cf24ae359 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -415,18 +415,13 @@ static const struct property_entry gdix1001_upside_down_props[] = {
 	{ }
 };
 
-static const struct ts_dmi_data gdix1001_00_upside_down_data = {
-	.acpi_name	= "GDIX1001:00",
+static const struct ts_dmi_data gdix1001_upside_down_data = {
+	.acpi_name	= "GDIX1001",
 	.properties	= gdix1001_upside_down_props,
 };
 
-static const struct ts_dmi_data gdix1001_01_upside_down_data = {
-	.acpi_name	= "GDIX1001:01",
-	.properties	= gdix1001_upside_down_props,
-};
-
-static const struct ts_dmi_data gdix1002_00_upside_down_data = {
-	.acpi_name	= "GDIX1002:00",
+static const struct ts_dmi_data gdix1002_upside_down_data = {
+	.acpi_name	= "GDIX1002",
 	.properties	= gdix1001_upside_down_props,
 };
 
@@ -1412,7 +1407,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	},
 	{
 		/* Juno Tablet */
-		.driver_data = (void *)&gdix1002_00_upside_down_data,
+		.driver_data = (void *)&gdix1002_upside_down_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
 			/* Both product- and board-name being "Default string" is somewhat rare */
@@ -1658,7 +1653,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	},
 	{
 		/* Teclast X89 (Android version / BIOS) */
-		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.driver_data = (void *)&gdix1001_upside_down_data,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "WISKY"),
 			DMI_MATCH(DMI_BOARD_NAME, "3G062i"),
@@ -1666,7 +1661,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	},
 	{
 		/* Teclast X89 (Windows version / BIOS) */
-		.driver_data = (void *)&gdix1001_01_upside_down_data,
+		.driver_data = (void *)&gdix1001_upside_down_data,
 		.matches = {
 			/* tPAD is too generic, also match on bios date */
 			DMI_MATCH(DMI_BOARD_VENDOR, "TECLAST"),
@@ -1684,7 +1679,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	},
 	{
 		/* Teclast X98 Pro */
-		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.driver_data = (void *)&gdix1001_upside_down_data,
 		.matches = {
 			/*
 			 * Only match BIOS date, because the manufacturers
@@ -1788,7 +1783,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	},
 	{
 		/* "WinBook TW100" */
-		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.driver_data = (void *)&gdix1001_upside_down_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "TW100")
@@ -1796,7 +1791,7 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 	},
 	{
 		/* WinBook TW700 */
-		.driver_data = (void *)&gdix1001_00_upside_down_data,
+		.driver_data = (void *)&gdix1001_upside_down_data,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "WinBook"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "TW700")
-- 
2.43.0

