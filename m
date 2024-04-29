Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1523746
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 09:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714383297; cv=none; b=DArFlpqgfSsOykkCZGmpRM2A2rxHxTs9+6l9by7Dalz+VVhhdMb5SDvfJz60moZeGXY2oYEUx8ddrd7OV8Nec8qo5ZfLiOOWiEIxEz/jv+CbefcNGd+gk5RN6khH9ikVKcx/w7mlGl8m6vQ3kH6kQrSnkvrIRbzcyQFWvGWU24g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714383297; c=relaxed/simple;
	bh=ezFcxwp+d+duqWZi777J4lQ0K2u72plV6bHlnJSYsp4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YCWWYpVyXIoLZJjNl4nd6LVndP4jwMB+mTBSC8zsP6SwVt6p18lD27rbRCAc537QgXQTJLxZMFfPuKk0pJwK/rgI7d5LFYcPfCOz+9ZTZsHilXJbjHp/w5BqM+TPsEGSb+0w8UIxl3YuMMzA2Pb9fPlOj3YoC8wvdw721eVqFng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dYWxceBm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dYWxceBm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714383295;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PWOfyN0AZT5xjlefCdeOTabP34rb25a0FGS9XROQGJE=;
	b=dYWxceBmzJS7o9Xi/xecEN+EQ9Ak84BBYipb0ryl/EINtWxyNbJoShnXUb6e91l1mQigvz
	snY2UMH1xhtbxQTWcCvOYT4oJ5LD/4vCl6+O3aUu1MeNQX6GYIEnRnpew6MeVRvwtgTFyC
	EomXJBOKQhL1YKWcEOwvEpuwNdhmklk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-t5gEyIl5OEGcWpbnMUzf3w-1; Mon,
 29 Apr 2024 05:34:50 -0400
X-MC-Unique: t5gEyIl5OEGcWpbnMUzf3w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E2A21C3F0E5;
	Mon, 29 Apr 2024 09:34:50 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.219])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34B441C060D1;
	Mon, 29 Apr 2024 09:34:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Use false to set acpi_send_ev to false
Date: Mon, 29 Apr 2024 11:34:46 +0200
Message-ID: <20240429093446.130322-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

acpi_send_ev is a bool and everywhere else true/false is used
to set it. Replace the one instance using 0 with false.

Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 7e2288009063..e2e6c4d3dff7 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3912,7 +3912,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 			if (tp_features.hotkey_wlsw &&
 					hkey == TP_HKEY_EV_RFKILL_CHANGED) {
 				tpacpi_send_radiosw_update();
-				send_acpi_ev = 0;
+				send_acpi_ev = false;
 				known_ev = true;
 			}
 			break;
-- 
2.44.0

