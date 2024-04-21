Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10DB199B9
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714334; cv=none; b=Ny9I9RE1upQk397qG8AJkQBc/VVBqkoxdAGh3gdnw2t9gMqvzxtRPH669swB/6XJXOsVa1F4EmGth9g83k1mfB83GpKUhstfW+HiIznq/x0tCLCEYcEdK+J32Kyg5q7fZfyG7scOVK28EY2bHIh28/YgVRVj5tG1gcBMHMS8Uco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714334; c=relaxed/simple;
	bh=mJpJndZ7d3srPJo88KLoRi1BUjgD1MJIP3y9scC85o0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6Y8MkuVsmkOZYTBlm1Efz85wEsBQqWVJhv//KUVRPxRcWzu8jvMU8KkHFh5INQViOwMS2Ktt5XYgjjdiIPP49AOKl59GTy2/Ph9kIHo2NcUbl3AlRXaG9v4hQ1133Ob7ilcRyli7n4En6sddWlL69U0Wx3qLiaNi+hdTFXoO3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTZZlzLS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTZZlzLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y0qVnVFKBsiWn5Z0p4LeyRwTEWmnuB5byJIXi0jc0Ds=;
	b=OTZZlzLSIe4aJ0utGCEfMidaOiCZwdWn9S0O/aE0owX7K/PqUCQenFYTJ0Jg7pkC6zKrPa
	CeOm19x6TjOq8MJYSQhQfkGRncSPqKHam+ZGRI5S5mrKpIfbPPLttSEkzBd4RSpKsUk8+2
	3TK6oSrZDO0AIDyStgy/yRNkxcJV0SI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-1PIY9vrMNl6LJfm_H9e29w-1; Sun,
 21 Apr 2024 11:45:30 -0400
X-MC-Unique: 1PIY9vrMNl6LJfm_H9e29w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D94153C00098;
	Sun, 21 Apr 2024 15:45:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BEDBC402482D;
	Sun, 21 Apr 2024 15:45:28 +0000 (UTC)
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
Subject: [PATCH 02/24] platform/x86: thinkpad_acpi: Provide hotkey_poll_stop_sync() dummy
Date: Sun, 21 Apr 2024 17:44:58 +0200
Message-ID: <20240421154520.37089-3-hdegoede@redhat.com>
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

Provide a hotkey_poll_stop_sync() dummy implementation when
CONFIG_THINKPAD_ACPI_HOTKEY_POLL, so that the #ifdef-ery around
hotkey_poll_stop_sync() can be removed from hotkey_exit().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ba4df8f68c2a..fc5681808c3b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -2575,6 +2575,9 @@ static void hotkey_poll_setup_safe(const bool __unused)
 {
 }
 
+static void hotkey_poll_stop_sync(void)
+{
+}
 #endif /* CONFIG_THINKPAD_ACPI_HOTKEY_POLL */
 
 static int hotkey_inputdev_open(struct input_dev *dev)
@@ -3045,9 +3048,7 @@ static void tpacpi_send_radiosw_update(void)
 static void hotkey_exit(void)
 {
 	mutex_lock(&hotkey_mutex);
-#ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
 	hotkey_poll_stop_sync();
-#endif
 	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
 		   "restoring original HKEY status and mask\n");
 	/* yes, there is a bitwise or below, we want the
-- 
2.44.0

