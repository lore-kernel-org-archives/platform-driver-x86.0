Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD8B3D66
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714346; cv=none; b=oc/yL0Gk3ys6i/Tmie6OzT1sUwFekUpYfn0Ml0yghlOSOdQ4bF1jciS4Rzs829IwZtuPpS0yrVG1f5hgC/EhKQhpH74RqopNQfzpiF1HFS6MNULOECHLMJ7lBj7QQuJAG4m1dsE5EFVyhouQLAwIAKwRGg/YXjgSHGzlNvtfjW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714346; c=relaxed/simple;
	bh=TT0Hb4ckh71B/QhiAmSAbRxTPO7eteHfRuonPx48xTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rdd0wDJR7GLTfw9A5mU614pmUSe/gbQdOw1yRH5cMUiyadhSH1XfYDkLixtYz86GzXx1gGrsqpB4XXVt+EwOnscFE5zHRSjSz2gOYte+F1gQR5cUj1SmydRyvG6bdaVdZ3iwUsZtmRyWZ5uyeZgr9mu2VI7AveE96ZeCa6X58RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OnPPoZMZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OnPPoZMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fH73mViXUfNxIV1pRapEZgtBfnl/WLLZGPX+GWvZVdI=;
	b=OnPPoZMZD/UsdScopmzbOeBvqhdEvBeOP2hV8K1BLLtqCAomlLwMFFhjmG8pCx0eRShS0x
	qssmVOtEMoDnwpUwKX71fkHNnO1/h1iXZDxg+ESspKidnsuyLMmwhjLkRuPhNTVDTZgz6x
	+lwg0p+USPgy57rtcfNILZghhodYJ+o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-537-JtxrlvIkPDeICssB1M6jwQ-1; Sun, 21 Apr 2024 11:45:39 -0400
X-MC-Unique: JtxrlvIkPDeICssB1M6jwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFA338884A0;
	Sun, 21 Apr 2024 15:45:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D4EB640357A7;
	Sun, 21 Apr 2024 15:45:37 +0000 (UTC)
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
Subject: [PATCH 09/24] platform/x86: thinkpad_acpi: Move special original hotkeys handling out of switch-case
Date: Sun, 21 Apr 2024 17:45:05 +0200
Message-ID: <20240421154520.37089-10-hdegoede@redhat.com>
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

Move the special handling (send_acpi_ev = false, hotkey_source_mask check)
for original hotkeys out of the switch-case in hotkey_notify_hotkey().
This is a preparation patch for further refactoring.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index e8d30f4af126..f7dacd2c338a 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3744,6 +3744,15 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 {
 	unsigned int scancode = hkey - TP_HKEY_EV_ORIG_KEY_START;
 
+	/* Never send ACPI netlink events for original hotkeys (hkey: 0x1001 - 0x1020) */
+	if (hkey >= TP_HKEY_EV_ORIG_KEY_START && hkey <= TP_HKEY_EV_ORIG_KEY_END) {
+		*send_acpi_ev = false;
+
+		/* Original hotkeys may be polled from NVRAM instead */
+		if (hotkey_source_mask & (1 << scancode))
+			return true;
+	}
+
 	/*
 	 * Original events are in the 0x10XX range, the adaptive keyboard
 	 * found in 2014 X1 Carbon emits events are of 0x11XX. In 2017
@@ -3753,10 +3762,7 @@ static bool hotkey_notify_hotkey(const u32 hkey, bool *send_acpi_ev)
 	case 0:
 		if (hkey >= TP_HKEY_EV_ORIG_KEY_START &&
 		    hkey <= TP_HKEY_EV_ORIG_KEY_END) {
-			if (!(hotkey_source_mask & (1 << scancode)))
-				tpacpi_input_send_key_masked(scancode);
-
-			*send_acpi_ev = false;
+			tpacpi_input_send_key_masked(scancode);
 			return true;
 		}
 		break;
-- 
2.44.0

