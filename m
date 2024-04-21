Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4583C17BA2
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714344; cv=none; b=hWujksxIJNZ8WI5wCQFvqrgWDuizZ19c0dMyC05R/4DJs9/KGChyukweLsK3N/Etj0v1nc2tq4kdfm7+7SYrCzGH9p4P4Z+aggEaUZgyVhoNiXg+6Oea117C6bnIBo2h5Mag4XSW54hyD6kQzI33AiI2FDYskBz/OzkNr1dKzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714344; c=relaxed/simple;
	bh=8c4dQWJTMNm8tij1yVZNP3a3xbcM+4p2UVOulti9tKA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qs4xA1EXOaXqFHT58DjRoKWXRFJyn3p+ofPMR9dCllnU5QmDFQ2KCNid/3neiGuQE+xR4VFK9sMgCnlM3gdzfoMiPHjS4Ecj30qqE269BD/w9SdfvDx/16udGbPqRncNOCG7FTMWvjuDr6YwZHBEZISloK/Qtu3ZgY3wdqN7rBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i6Yyu72p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i6Yyu72p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714339;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OsjauILosSwsdrban+b3pKebhm2tdkEwIbD6csXmSwY=;
	b=i6Yyu72paswUC7HqJowds6j4Xsk9Gkz+KbgOrvG+imB65z+etF9EEDTzusdOi4XVFuFYMt
	Mk+Qex8+kPqgjc4RNFHfDammG08m1QAeK4f9l56+6o/N1yUFMqYelPAdkPSrcdeZIGmNuZ
	LYOEpD+SYix4RNMKNC2GrjtGpd5hAV8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-_lPldDwnN8-4IWetk47L4Q-1; Sun, 21 Apr 2024 11:45:32 -0400
X-MC-Unique: _lPldDwnN8-4IWetk47L4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2CCE789A245;
	Sun, 21 Apr 2024 15:45:31 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12BF040357A7;
	Sun, 21 Apr 2024 15:45:29 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	Nitin Joshi <njoshi1@lenovo.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 03/24] platform/x86: thinkpad_acpi: Drop setting send_/ignore_acpi_ev defaults twice
Date: Sun, 21 Apr 2024 17:44:59 +0200
Message-ID: <20240421154520.37089-4-hdegoede@redhat.com>
In-Reply-To: <20240421154520.37089-1-hdegoede@redhat.com>
References: <20240421154520.37089-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2

send_acpi_ev, ignore_acpi_ev are already initialized to true resp. false by
hotkey_notify() before calling the various helpers. Drop the needless
re-initialization from the helpers.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fc5681808c3b..007223fded30 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3754,14 +3754,12 @@ static bool hotkey_notify_extended_hotkey(const u32 hkey)
 	return false;
 }
 
+/* 0x1000-0x1FFF: key presses */
 static bool hotkey_notify_hotkey(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
 {
-	/* 0x1000-0x1FFF: key presses */
 	unsigned int scancode = hkey & 0xfff;
-	*send_acpi_ev = true;
-	*ignore_acpi_ev = false;
 
 	/*
 	 * Original events are in the 0x10XX range, the adaptive keyboard
@@ -3794,14 +3792,11 @@ static bool hotkey_notify_hotkey(const u32 hkey,
 	return false;
 }
 
+/* 0x2000-0x2FFF: Wakeup reason */
 static bool hotkey_notify_wakeup(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
 {
-	/* 0x2000-0x2FFF: Wakeup reason */
-	*send_acpi_ev = true;
-	*ignore_acpi_ev = false;
-
 	switch (hkey) {
 	case TP_HKEY_EV_WKUP_S3_UNDOCK: /* suspend, undock */
 	case TP_HKEY_EV_WKUP_S4_UNDOCK: /* hibernation, undock */
@@ -3834,14 +3829,11 @@ static bool hotkey_notify_wakeup(const u32 hkey,
 	return true;
 }
 
+/* 0x4000-0x4FFF: dock-related events */
 static bool hotkey_notify_dockevent(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
 {
-	/* 0x4000-0x4FFF: dock-related events */
-	*send_acpi_ev = true;
-	*ignore_acpi_ev = false;
-
 	switch (hkey) {
 	case TP_HKEY_EV_UNDOCK_ACK:
 		/* ACPI undock operation completed after wakeup */
@@ -3879,14 +3871,11 @@ static bool hotkey_notify_dockevent(const u32 hkey,
 	}
 }
 
+/* 0x5000-0x5FFF: human interface helpers */
 static bool hotkey_notify_usrevent(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
 {
-	/* 0x5000-0x5FFF: human interface helpers */
-	*send_acpi_ev = true;
-	*ignore_acpi_ev = false;
-
 	switch (hkey) {
 	case TP_HKEY_EV_PEN_INSERTED:  /* X61t: tablet pen inserted into bay */
 	case TP_HKEY_EV_PEN_REMOVED:   /* X61t: tablet pen removed from bay */
@@ -3914,14 +3903,11 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 static void thermal_dump_all_sensors(void);
 static void palmsensor_refresh(void);
 
+/* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
 static bool hotkey_notify_6xxx(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
 {
-	/* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
-	*send_acpi_ev = true;
-	*ignore_acpi_ev = false;
-
 	switch (hkey) {
 	case TP_HKEY_EV_THM_TABLE_CHANGED:
 		pr_debug("EC reports: Thermal Table has changed\n");
-- 
2.44.0

