Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9592914389F
	for <platform-driver-x86@vger.kernel.org>; Thu, 14 Nov 2024 19:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731613002; cv=none; b=bHO2WOUeUd5ovJ44ryMRQvEa+WG6uTRq8XhinAq4DoVkxeadVfvhE6HC8RKu7qG1SAmgfEOAAoOjl3pmzu012t/Cv4Y5JyIK5awAd49QP5zuCsVuql0keippLyDlZRDBx9N5uPhBMLT12egZ6wCOh/aL/VvO8V9lQvjnvyEh2vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731613002; c=relaxed/simple;
	bh=X2jgT2ClZRTGv7kqQlvXFv3RcmNiahWcCNbKBnmw2o4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oKdx4+ueKWViZZua6rGkqupfAvLQjQXKKpEHLmxjOkkbTDAFQbDCMzHL1icg/sV7zCv3Soi9ZVOL5VGT3MXNNXH0cqOfiYx0A1ouyWz1EXmnbBX6t4cGFXph4pzMysFmzToUASUx+uRyrohHXMZE8+N9hTwsbhRhOFtMxYyS+c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3qIi2Dq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3qIi2Dq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731612999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5W8qzFm64NAeETz4MuKFCTO324GqAGwc7V7mo1NrlDs=;
	b=C3qIi2DqLI0rQwjcFMjjVWTP5XjvU4lUBMv8k190438CkIFponKGml8vOatS8LZm5ul/ez
	RaVpJrBecVRp5yvugYQMCFe4iVHuaHRV5/B3GJXfVaKmrlGWuDVq/SD74gLmXss3wWdYcJ
	UsGqfDpqC1kp1BffpCmFp0LoF+ohbUc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-576-5m_KTqv1OHu2zIn0I03WUw-1; Thu,
 14 Nov 2024 14:36:36 -0500
X-MC-Unique: 5m_KTqv1OHu2zIn0I03WUw-1
X-Mimecast-MFC-AGG-ID: 5m_KTqv1OHu2zIn0I03WUw
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3048E1955DCF;
	Thu, 14 Nov 2024 19:36:35 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.193.206])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C03F71956054;
	Thu, 14 Nov 2024 19:36:33 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: p2sb: Cache correct PCI bar for P2SB on Denverton and Gemini Lake
Date: Thu, 14 Nov 2024 20:36:32 +0100
Message-ID: <20241114193632.110062-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

Gemine Lake (Goldmont Plus) is an Apollo Lake (Goldmont) derived design and
as such has the P2SB at device.function 13.0, rather then at the default
31.1, just like Apollo Lake.

At a mapping to P2SB_DEVFN_GOLDMONT to p2sb_cpu_ids[] for Goldmont Plus,
so that the correct PCI bar gets cached.

This fixes P2SB unhiding not working on these devices, which fixes
SPI support for the bootrom SPI controller not working.

Fixes: 2841631a0365 ("platform/x86: p2sb: Allow p2sb_bar() calls during PCI device probe")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
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

