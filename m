Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED6D15B102
	for <platform-driver-x86@vger.kernel.org>; Wed, 24 Apr 2024 12:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713961755; cv=none; b=DEE/DXJEn2PIRRh5LXqq9ih/p7WfsWLeA0CXBiAHTxi6Fqw03sEBW3z10ndF8Uzn6q//FClmuR/1V0EzEYTxAX8aXHD74UWcXnj9MN+gugo3bP0s1N5RB3Y02DYrNZygiLpTOWUBMi+gL4VkoVMACzRJm4jID6vByhwGWokq6L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713961755; c=relaxed/simple;
	bh=8F4wt4CScjweZm4YonZqwggxbtI9cNvPvuDXvYQBdZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m1dt9QMR1L27RBxRTnaDJHKq31H3UokVO+L6eFzewItjhuSk8pvPdgeaZn9cYnnFVVbXYzb7aDdukDMzYSOnec9+PPCxMRX5xKhlIkBwiFsJ2+Icpupxl/iP/GgJn3XoqRY6GrTiZJJ+tYKlGtXbsnAE25d+jmJaWOXdDJXOtOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jJU7DTta; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jJU7DTta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713961753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODEE8uab+7y14MTrzin7BjbgUbVRVvKejJ6ig3O4HCQ=;
	b=jJU7DTtaTu1ugHr5/DYA03ngUNq/sg3xEi7979/6QkD/bCKZAk2BiyPXaIqGOik+010b3r
	i2L33G6yuHvhIGx+QAXkBsQnBt4JVpr/2+eMfsovXyrExiGcfIraliXARhOyM0npgqFfCg
	RTvU7H3Py8usElo9p9wylgWUUv1GuVw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-CKYZo1chOcG9Fu0UrBp7rA-1; Wed, 24 Apr 2024 08:29:10 -0400
X-MC-Unique: CKYZo1chOcG9Fu0UrBp7rA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 98534104B503;
	Wed, 24 Apr 2024 12:29:08 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 73C79C13FA7;
	Wed, 24 Apr 2024 12:29:06 +0000 (UTC)
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
Subject: [PATCH v2 23/24] platform/x86: thinkpad_acpi: Support for system debug info hotkey
Date: Wed, 24 Apr 2024 14:28:33 +0200
Message-ID: <20240424122834.19801-24-hdegoede@redhat.com>
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

New Lenovo platforms are adding the FN+N key to generate system debug
details that support can use for collecting important details on any
customer cases for Windows.
Add the infrastructure so we can do the same on Linux by sending
a KEY_VENDOR keycode to userspace.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
Link: https://lore.kernel.org/r/20240417173124.9953-3-mpearson-lenovo@squebb.ca
[hdegoede@redhat.com: Adjust for switch to sparse-keymap keymaps]
Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b6d6466215e1..7a27cbca6980 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3271,6 +3271,7 @@ static const struct key_entry keymap_lenovo[] __initconst = {
 	 * after switching to sparse keymap support. The mappings above use translated
 	 * scancodes to preserve uAPI compatibility, see tpacpi_input_send_key().
 	 */
+	{ KE_KEY, 0x131d, { KEY_VENDOR } }, /* System debug info, similar to old ThinkPad key */
 	{ KE_KEY, TP_HKEY_EV_TRACK_DOUBLETAP /* 0x8036 */, { KEY_PROG4 } },
 	{ KE_END }
 };
-- 
2.44.0

