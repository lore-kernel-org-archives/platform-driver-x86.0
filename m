Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E042043AC1
	for <platform-driver-x86@vger.kernel.org>; Mon, 27 May 2024 09:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716801299; cv=none; b=NaA6Htt7Zr8ZZbDqE1a2Yg7I/R4KWoCYHzsgYBmBmzclc0kwN+nsIcEsL/lhf7nBdIMYEU1FBWCJ5FkYplOLtQ2HD0EylvlfGDXW9/1Ip+nTQln0f7nlfTmlsr5GLTtGTVrdpQJtLkn56ZuMSBodwt1iEN0JxeGV21R0wVrP9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716801299; c=relaxed/simple;
	bh=aS4rmBjL2bpb+bpR14hz56d5bcLkLnGqKlGu3OlGm3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRqbaQIvirRvcyCbRjxu+jyXJ5eFD4ieKPKPtOeEQ/o6qeDF3ADpi7kTj79pS+KkHN65fizMV88orgT8hG1fQyLYa361iuVJMbKt6W1n0+0zVoxG+4d8pNkcAPrzpAOsM5x54A3EH/v0G5R6/xJTvqS/GDG++8UxcMxAS67wiwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BSSdJ5Px; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BSSdJ5Px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716801296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gZn9LTGnyhU9iY4qdW91DQMBDJ0IKw5HpGSl0T+HHu0=;
	b=BSSdJ5PxXEDKIMUR+yRpGAV6rFnncvs/jLrzJnjewyT/MRbcJcMonjfOMj4GrOsd8rzmkm
	GwoQrJY05kMQo8FWFsFUz1k6upntnjpMeck9s91NzK8g22gLDAMolcsOv61Y0FFvqGFH5N
	Dj2S6trbjEdHnNOpZTs7TIlNAeBLVmA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-eIkS-itIMXaQSlz-OKmWLw-1; Mon, 27 May 2024 05:14:53 -0400
X-MC-Unique: eIkS-itIMXaQSlz-OKmWLw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A70BB8016FA;
	Mon, 27 May 2024 09:14:52 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.78])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD716200A381;
	Mon, 27 May 2024 09:14:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	hmtheboy154 <buingoc67@gmail.com>,
	Gregor Riepl <onitake@gmail.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: touchscreen_dmi: Add info for the EZpad 6s Pro
Date: Mon, 27 May 2024 11:14:47 +0200
Message-ID: <20240527091447.248849-3-hdegoede@redhat.com>
In-Reply-To: <20240527091447.248849-1-hdegoede@redhat.com>
References: <20240527091447.248849-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

From: hmtheboy154 <buingoc67@gmail.com>

The "EZpad 6s Pro" uses the same touchscreen as the "EZpad 6 Pro B",
unlike the "Ezpad 6 Pro" which has its own touchscreen.

Signed-off-by: hmtheboy154 <buingoc67@gmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
index 6c03e7daadd4..2d9ca2292ea1 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -1404,6 +1404,17 @@ const struct dmi_system_id touchscreen_dmi_table[] = {
 			DMI_MATCH(DMI_BIOS_DATE, "04/24/2018"),
 		},
 	},
+	{
+		/* Jumper EZpad 6s Pro */
+		.driver_data = (void *)&jumper_ezpad_6_pro_b_data,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Jumper"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Ezpad"),
+			/* Above matches are too generic, add bios match */
+			DMI_MATCH(DMI_BIOS_VERSION, "E.WSA116_8.E1.042.bin"),
+			DMI_MATCH(DMI_BIOS_DATE, "01/08/2020"),
+		},
+	},
 	{
 		/* Jumper EZpad 6 m4 */
 		.driver_data = (void *)&jumper_ezpad_6_m4_data,
-- 
2.45.1

