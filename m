Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F2B18ED9
	for <platform-driver-x86@vger.kernel.org>; Tue, 16 Jan 2024 10:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="csSHuFK6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705402275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oJBjDZ8uIIyTgppqQCnaprhjA6WpnkFf8m0rTkVhny0=;
	b=csSHuFK6T917cYFgJugMWFzCQtn62YT4DWUnlTuzGiLdKQj7MV9LCqpJFtMOVKtceWLbTz
	x3qHGwEJRFkXOUNLJexfDKREcfc4VbGepIj7GkvuwHZ2mI7msDbVlMOjm3O5we8HzFlYsP
	vjzkMeMk8qRPLQU4IVkJh2glb3MQRxk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-1-xHaGoQMyP8K2B96BHdVAaQ-1; Tue,
 16 Jan 2024 05:51:11 -0500
X-MC-Unique: xHaGoQMyP8K2B96BHdVAaQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEB603814582;
	Tue, 16 Jan 2024 10:51:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.195.53])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0C7B82166B31;
	Tue, 16 Jan 2024 10:51:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>
Subject: [PATCH] MAINTAINERS: remove defunct acpi4asus project info from asus notebooks section
Date: Tue, 16 Jan 2024 11:51:01 +0100
Message-ID: <20240116105101.32458-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

The acpi4asus project appears to be defunct, according to:
https://sourceforge.net/p/acpi4asus/mailman/acpi4asus-user/
the last posts to the list were done in May 2020 and even then
they were mostly spam.

And the http://acpi4asus.sf.net website still talks about 2.6.x kernels.

Drop the defunct mailing-list and update the W: entry to point to
the new up2date https://asus-linux.org/ site.

Cc: Corentin Chary <corentin.chary@gmail.com>
Cc: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f230a2fcfe89..80eda624fc1b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3159,10 +3159,9 @@ F:	drivers/hwmon/asus-ec-sensors.c
 ASUS NOTEBOOKS AND EEEPC ACPI/WMI EXTRAS DRIVERS
 M:	Corentin Chary <corentin.chary@gmail.com>
 M:	Luke D. Jones <luke@ljones.dev>
-L:	acpi4asus-user@lists.sourceforge.net
 L:	platform-driver-x86@vger.kernel.org
 S:	Maintained
-W:	http://acpi4asus.sf.net
+W:	https://asus-linux.org/
 F:	drivers/platform/x86/asus*.c
 F:	drivers/platform/x86/eeepc*.c
 
-- 
2.43.0

