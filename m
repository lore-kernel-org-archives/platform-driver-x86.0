Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717801353E4
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708115595; cv=none; b=aYSHy5yNIOZxb5rRAqQfqp4QdqQbBMznJUAEAVE4v+35bGfX7i1UP9dTWiXPcUD77rwPvZMPJqA+6/nNC7eijFJwdicZ9jSSVvDJwMnCtpRMXaUlMLWnT8bROyEouXQVuZw44LKIO5vd4ozuBOQP1ucM6Kr5VyN2gKlT0jLAlFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708115595; c=relaxed/simple;
	bh=vjXshanD4szdb1OH1e7o23k0KgH3kLdUkrmhVppYYAw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DPfCoGkb36rbgQ0bG3WHO+AaAV4Xzm3hRZ9ktqlh8kCfVsAVoIQo/qTGVVXsdUMjUTyPYr3cHYe7aBnO/Lfzo6lsYGJKtzal3oxNOXa3Ku4clvS+IGE61d6Q0jzGYahbH3oVbO4LYwL3QvSwq2MJxW5mJtF3iRwsXli9Z5oIais=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pq4nSq64; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pq4nSq64"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708115592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UHTz18sUw0/TxgW7zCIPg4Iiv0ezFTw2ov4UDEMQPBE=;
	b=Pq4nSq64ZJK4P7khdbdRxWpEsZzcS9TAqMul0SkYV+XX3qH7Z753WDkcBwoDjtjWTp3tYm
	neUTeyEiRwdJEPh9/i3lVellnovPJSxBs+nhLg2g9j70uC5SG/nj+xXoumpJlyaXNQT2EI
	UcMDgqNsoyuW1m04CGAHsrmWkbkRGiQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-BuEV5egZNi6JKR4kvlviWQ-1; Fri, 16 Feb 2024 15:33:10 -0500
X-MC-Unique: BuEV5egZNi6JKR4kvlviWQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3A86384AF81;
	Fri, 16 Feb 2024 20:33:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.87])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E3659492BCB;
	Fri, 16 Feb 2024 20:33:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Alexander Kobel <a-kobel@a-kobel.de>,
	regressions@lists.linux.dev,
	Arnold Gozum <arngozum@gmail.com>
Subject: [PATCH] platform/x86: intel-vbtn: Stop calling "VBDL" from notify_handler
Date: Fri, 16 Feb 2024 21:33:00 +0100
Message-ID: <20240216203300.245826-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9

Commit 14c200b7ca46 ("platform/x86: intel-vbtn: Fix missing
tablet-mode-switch events") causes 2 issues on the ThinkPad X1 Tablet Gen2:

1. The ThinkPad will wake up immediately from suspend
2. When put in tablet mode SW_TABLET_MODE reverts to 0 after about 1 second

Both these issues are caused by the "VBDL" ACPI method call added
at the end of the notify_handler.

And it never became entirely clear if this call is even necessary to fix
the issue of missing tablet-mode-switch events on the Dell Inspiron 7352.

Drop the "VBDL" ACPI method call again to fix the 2 issues this is
causing on the ThinkPad X1 Tablet Gen2.

Fixes: 14c200b7ca46 ("platform/x86: intel-vbtn: Fix missing tablet-mode-switch events")
Reported-by: Alexander Kobel <a-kobel@a-kobel.de>
Closes: https://lore.kernel.org/platform-driver-x86/295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de/
Cc: regressions@lists.linux.dev
Cc: Arnold Gozum <arngozum@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/vbtn.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 210b0a81b7ec..084c355c86f5 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -200,9 +200,6 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 	autorelease = val && (!ke_rel || ke_rel->type == KE_IGNORE);
 
 	sparse_keymap_report_event(input_dev, event, val, autorelease);
-
-	/* Some devices need this to report further events */
-	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
 }
 
 /*
-- 
2.43.0

