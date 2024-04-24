Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 995FE15B124
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961753; cv=none; b=KDaCbM/utq/FI48iivtqVChUbdmVwSEB6repGs797ukdtdwJ/4/SgtZeZ/s5Hf23+tuP8QkOU/uyEUohn4WdR5aoj/NS5rLFh2D5PdSLFVduKcsoczaGKq/ibHCyzq3n1tmcWaCdtvaHivYw/yczNWqRFVjlO+uEYICfR/Tonvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961753; c=relaxed/simple;
	bh=vOjoq/roCoxmO8XCQVeyMhBXfBl1s+l5EpYFse9Rq5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t79Zjlwq3I9gG7i4xMufL0YmJLXDoOyUTuwHxu/VmjGJz2P/J719CTNleu/NpbK1bS1QJ/AlxBzn3w3aGtZ9t/FlBYDu6vS+myKXLwQNPXe0tSpRSeJ8cePMQfxY+Pe65oyijs7xLG5xFwLo73qEofQ5Sk/nr4KUwUbjERlfUMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RULsvoiN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RULsvoiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cym5WjcMs7MZ4p5+J12E2bFnsgfE/Skvw8UYabQ1Chk=;
	b=RULsvoiNAfy2V/IyAXJYnxtUjiy6Sx25Sjgt+UKTEaX9TxZK4TOg8io6sKhXxHSPTT5MqL
	hQ9aulPkKuD1ik3gIaq7AWlwRI1XwxPVyp0/qk2aF4a4OJL0sH94GyVbjaqmn5WyGgsxe3
	+mVKIRrPFufpzH8TmKdFmkGYVNvQcps=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-VakC0mSvPkSNpbD63ISJZA-1; Wed, 24 Apr 2024 08:29:05 -0400
X-MC-Unique: VakC0mSvPkSNpbD63ISJZA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2D6218065AE;
	Wed, 24 Apr 2024 12:29:04 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BE563C13FA3;
	Wed, 24 Apr 2024 12:29:03 +0000 (UTC)
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
Subject: [PATCH v2 21/24] platform/x86: thinkpad_acpi: Simplify known_ev handling
Date: Wed, 24 Apr 2024 14:28:31 +0200
Message-ID: <20240424122834.19801-22-hdegoede@redhat.com>
In-Reply-To: <20240424122834.19801-1-hdegoede@redhat.com>
References: <20240424122834.19801-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

From: Mark Pearson <mpearson-lenovo@squebb.ca>

Modify how known_ev event is handled in preparation for adding new hkey
event range.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Link: https://lore.kernel.org/r/20240417173124.9953-1-mpearson-lenovo@squebb.ca
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 469ff6a39d18..a53b00fecf1a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3845,6 +3845,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 		}
 
 		send_acpi_ev = true;
+		known_ev = false;
 
 		switch (hkey >> 12) {
 		case 1:
@@ -3868,8 +3869,6 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 				/* FIXME: kick libata if SATA link offline */
 				known_ev = true;
 				break;
-			default:
-				known_ev = false;
 			}
 			break;
 		case 4:
@@ -3892,11 +3891,8 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 				tpacpi_send_radiosw_update();
 				send_acpi_ev = 0;
 				known_ev = true;
-				break;
 			}
-			fallthrough;	/* to default */
-		default:
-			known_ev = false;
+			break;
 		}
 		if (!known_ev) {
 			pr_notice("unhandled HKEY event 0x%04x\n", hkey);
-- 
2.44.0

