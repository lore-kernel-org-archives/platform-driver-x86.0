Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334361119A
	for <platform-driver-x86@vger.kernel.org>; Sat, 16 Nov 2024 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731771955; cv=none; b=pB7zg19wloWvYn0KnWHxPUoKFrpAlwgeMi43AoVhBRRYriN9KiONzx0Mo6dHcaxsfT66TqGvtF2/QmNYg1ndf7zd0gM9kZJlFiUP6fLhzxuOhfy3AsNL1AnMn/nTN0XXp/zZ1lhWxHtgX+rVpGd+5F22DPHeqqTbAmRrxR1aScc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731771955; c=relaxed/simple;
	bh=JlGqbbFzbhB6TCX2ukSodHYLKK4oiAPDVrfDDmNutRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iPaz+ojLpeSGVKAETtEP5bH9kCtAjfN3arN1BetlC9c2SQAojat6POJ+witDyChSZ+iTkNuctz7lXEnjja6sRYY953LplfNx93aBC8yHNSuvOgmCHf8LBRDC9U8Js06RY7+AgNSZMIp1ktsWmv0/SmOE/KxTb1Vt4uUpRAhUVks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NaPj3LsJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NaPj3LsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731771952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=m+XfKEbabVWqOejOq61Pez69tIeWrlWkFzpz8e7jS5w=;
	b=NaPj3LsJbLJZEcqwrpcRH5I0VGdj7mP27mZZWFCWTpAg1wPISUeZz7z4mpvjjv8C9ZPplu
	S0GS36HBHd9EJibyYe+mj5BIpEiM6Mh6KWo+hd9ok8v5i64J1HQCjdqHZN6QlWcval/12g
	Va9xOEEhJnFH0QC99VqCsi7Ti0Q8RZc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-620-gzM82ttZOiWJebvsqtHy1g-1; Sat,
 16 Nov 2024 10:45:50 -0500
X-MC-Unique: gzM82ttZOiWJebvsqtHy1g-1
X-Mimecast-MFC-AGG-ID: gzM82ttZOiWJebvsqtHy1g
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 64BAE1956089;
	Sat, 16 Nov 2024 15:45:49 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.52])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C2893003B71;
	Sat, 16 Nov 2024 15:45:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2] platform/x86: p2sb: Cache correct PCI bar for P2SB on Gemini Lake
Date: Sat, 16 Nov 2024 16:45:46 +0100
Message-ID: <20241116154546.85761-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Gemini Lake (Goldmont Plus) is an Apollo Lake (Goldmont) derived design and
as such has the P2SB at device.function 13.0, rather then at the default
31.1, just like Apollo Lake.

At a mapping to P2SB_DEVFN_GOLDMONT to p2sb_cpu_ids[] for Goldmont Plus,
so that the correct PCI bar gets cached.

This fixes P2SB unhiding not working on these devices, which fixes
SPI support for the bootrom SPI controller not working.

Fixes: 2841631a0365 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
Reviewed-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- Fix commit message: Drop no longer applicable Denverton from Subject and
  s/Gemine/Gemini/
---
 drivers/platform/x86/p2sb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/p2sb.c b/drivers/platform/x86/p2sb.c
index 31f38309b389..d51eb0db0626 100644
--- a/drivers/platform/x86/p2sb.c
+++ b/drivers/platform/x86/p2sb.c
@@ -25,6 +25,7 @@
 
 static const struct x86_cpu_id p2sb_cpu_ids[] = {
 	X86_MATCH_VFM(INTEL_ATOM_GOLDMONT, P2SB_DEVFN_GOLDMONT),
+	X86_MATCH_VFM(INTEL_ATOM_GOLDMONT_PLUS, P2SB_DEVFN_GOLDMONT),
 	{}
 };
 
-- 
2.47.0

