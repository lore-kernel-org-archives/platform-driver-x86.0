Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D5C1B5B1
	for <platform-driver-x86@vger.kernel.org>; Sun, 21 Apr 2024 15:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713714360; cv=none; b=VqFd4/0lJ+oWgutQU8vzYlivw0I8CAWg4r2Pqfc3cmE1rhI3gu9oB7DdiZa8e0HxHRFOAhV4waVnTEuaCZUyWBHzuii5M09BVminOK64FkswtrjiEBDxPQOd/zfFF9ucTJtWBTJjY3GayWol+aq8ARNbUVxMh/mlfnAnAeT+bTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713714360; c=relaxed/simple;
	bh=VIM0j5LN8mL2vMrEQJGAo+Rvo5VCIap/f4g7t71+jPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k/uTKQAgTdc+Tvm0B5ZB80JXcEi+uTrdnl38Edk4fnAI5aGV9Im5aIJ+hnLtJgf0JFDbzEcyJ+KHookh3z2+dBy4g6NUjndKxrlo8ubCV9jjbwQe4OTvFBGgjFAFzWMGG4p/8oRK0cpa4+/qs0wxb7Sg9grPQBEBUnkxHz3qVek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z+sGdgIU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z+sGdgIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713714358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E+mzqNt5w3qnJcmko8jwwdLwE5oPIFcZ7M11zY2tmRU=;
	b=Z+sGdgIUuOnqVJyzOKkYaIpX2+WYV4qAZ7jC+7WzIfboVbuY88KUzsaa3qh/Ac7L48pzX9
	cxIb73sY4UheK4vku8YXBoDgSAe8stLOC/7wWAzNPQlFy4LpUtG3ME7ksWMZmTt1qPpFI+
	/57IVnG/jBLNPVSHHjm0x0js/5uR5Rw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-677-HS1oUmW_NnubOSSC2Rz-dA-1; Sun,
 21 Apr 2024 11:45:55 -0400
X-MC-Unique: HS1oUmW_NnubOSSC2Rz-dA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB1203C00098;
	Sun, 21 Apr 2024 15:45:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8D76A40357A7;
	Sun, 21 Apr 2024 15:45:53 +0000 (UTC)
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
Subject: [PATCH 21/24] platform/x86: thinkpad_acpi: Simplify known_ev handling
Date: Sun, 21 Apr 2024 17:45:17 +0200
Message-ID: <20240421154520.37089-22-hdegoede@redhat.com>
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

From: Mark Pearson <mpearson-lenovo@squebb.ca>

Modify how known_ev event is handled in preparation for adding new hkey
event range.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Link: https://lore.kernel.org/r/20240417173124.9953-1-mpearson-lenovo@squebb.ca
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index fc60857b39ec..cd54a2455ac8 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3840,6 +3840,7 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 		}
 
 		send_acpi_ev = true;
+		known_ev = false;
 
 		switch (hkey >> 12) {
 		case 1:
@@ -3863,8 +3864,6 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 				/* FIXME: kick libata if SATA link offline */
 				known_ev = true;
 				break;
-			default:
-				known_ev = false;
 			}
 			break;
 		case 4:
@@ -3887,11 +3886,8 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
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

