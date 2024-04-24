Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3915ADAE
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961726; cv=none; b=jwx+HA19ejJkhoP6kcpPoA7ReBSILWLmgnNlBfDxaVSlbNK86sIBths8B0q0vmu6wvVoppX2/kZZr+be4JOWgcAIsA21sd9FMOy2dxSOBoIQpTU8EpGYyVmJTsTCD8QNwrnT3DEfpj+MKb/7DNNE9/E+CwQi/G/70hEtQ+QQYrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961726; c=relaxed/simple;
	bh=dPJP4s5BzEfhWH/MXtJbe4WIKQGgX+uu0F+QSok9HWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YJ3nZuXwvJhQL2g7To9K7Z5fA1+UotbqN6v9ynDWO3OPTLgzpHCjp0YJ8/aHX3yEb8vQK9HTq+Q0Kk1PMsCIa4v5KZQaTdqfWe/vfyMhvN9C0Z+Fw/ZuRXbKLXIngNlpbK3Z8l6R2vBHmBYrsJSL3ZbnJm9j1YbWby5RF7shzNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gyw++FD1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gyw++FD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0fFkuOiWKmmmObDpl8hH0nQHtgU6pDtLPCFlXeghcg=;
	b=Gyw++FD16rwQ0wZ0VEo3PZ7FtXjInxOczn4/WeuqgSB6UT7BHx0VIeMSyH5DQ4IFpWDRTb
	D25J7qkWTC0ZN+maOPRvoXEstls/krr3/IyboxB6sJkCIH3CW1s8A/Gy6j7vJSgaEhvZ3Y
	8hqrp8tQ03mGS4YNzYAvNRvFhs1z7AI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-deU6skYlMIaXqDaeGmOkYA-1; Wed, 24 Apr 2024 08:28:40 -0400
X-MC-Unique: deU6skYlMIaXqDaeGmOkYA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CC6E8DCFC4;
	Wed, 24 Apr 2024 12:28:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 28CD5C08EE0;
	Wed, 24 Apr 2024 12:28:39 +0000 (UTC)
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
Subject: [PATCH v2 03/24] platform/x86: thinkpad_acpi: Drop setting send_/ignore_acpi_ev defaults twice
Date: Wed, 24 Apr 2024 14:28:13 +0200
Message-ID: <20240424122834.19801-4-hdegoede@redhat.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

send_acpi_ev and ignore_acpi_ev are already initialized to true and false
respectively by hotkey_notify() before calling the various helpers. Drop
the needless re-initialization from the helpers.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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

