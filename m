Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFEF19E7FA
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 19:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731613101; cv=none; b=f84vjDuFvrjaWkmjQU32snaCZAGaDRP6i9xB7Ex2rRRY97GmauZ0ZUUvKSRRuYekjr96H1m+YF7qmUfqgtJBb9YHlhj8PohIP7Pv6xjm9iPcIJPHJMD6+gAMZR9nboVOcLtoznjDi6J+D0V2gjz+b9hR2wbaqpQlg+bQvJti/d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731613101; c=relaxed/simple;
	bh=XjXURwoUOFJqMUW6rlmwmTJUeKMb9ng3iLKYslKONrM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfV608tglahLfc/4ntN93Fy/d6/NuLRGNKVgkwEYEQvB87WWz/RjW6RodguC8fgAxlfATT1OBwUaF+zUWQEIl3GSCLz1LE1Zj0aaaDJkwcttvp+3Yfzpt8ZqaoJy6LSNRMF7JMHzIMv9d7aRftnTyvuv7CckFUjytLgy6lcZ4lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWP2Szib; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWP2Szib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731613098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9ATl3LxwYGTf5J9B56kV8EqX+bUnDhpEOb9CzAEaDNQ=;
	b=YWP2SzibroFFk3aZlj5x/t0xONDNOAPj3Uxa8+Tj4mSPOxeo3L+7ezl3Fw2t33V0Uz7uWX
	2IHQwFsKvOj1ajzzU41r1XY36Ujoht7tJ4xqS7Qs6o19WoByaQF/8vfqJ/KjhmE5GaLloW
	3xgCGFEx/RIWm8nCIAGGJ/IGyWS04Lw=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-paEuPnQ7N1iCu-iLCLrYQA-1; Thu,
 14 Nov 2024 14:38:13 -0500
X-MC-Unique: paEuPnQ7N1iCu-iLCLrYQA-1
X-Mimecast-MFC-AGG-ID: paEuPnQ7N1iCu-iLCLrYQA
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 314AD1955D4D;
	Thu, 14 Nov 2024 19:38:12 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.206])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6F7B91956089;
	Thu, 14 Nov 2024 19:38:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Lee Jones <lee@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: lpc_ich: Add another Gemini Lake ISA bridge PCI device-id
Date: Thu, 14 Nov 2024 20:38:08 +0100
Message-ID: <20241114193808.110132-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

On N4100 / N4120 Gemini Lake SoCs the ISA bridge PCI device-id is 31e8
rather the 3197 found on e.g. the N4000 / N4020.

While at fix the existing GLK PCI-id table entry breaking the table
being sorted by device-id.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/lpc_ich.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index f14901660147..4b7d0cb9340f 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -834,8 +834,9 @@ static const struct pci_device_id lpc_ich_ids[] = {
 	{ PCI_VDEVICE(INTEL, 0x2917), LPC_ICH9ME},
 	{ PCI_VDEVICE(INTEL, 0x2918), LPC_ICH9},
 	{ PCI_VDEVICE(INTEL, 0x2919), LPC_ICH9M},
-	{ PCI_VDEVICE(INTEL, 0x3197), LPC_GLK},
 	{ PCI_VDEVICE(INTEL, 0x2b9c), LPC_COUGARMOUNTAIN},
+	{ PCI_VDEVICE(INTEL, 0x3197), LPC_GLK},
+	{ PCI_VDEVICE(INTEL, 0x31e8), LPC_GLK},
 	{ PCI_VDEVICE(INTEL, 0x3a14), LPC_ICH10DO},
 	{ PCI_VDEVICE(INTEL, 0x3a16), LPC_ICH10R},
 	{ PCI_VDEVICE(INTEL, 0x3a18), LPC_ICH10},
-- 
2.47.0

