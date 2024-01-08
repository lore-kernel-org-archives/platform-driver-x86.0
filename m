Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC8346531
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bW3VyRsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704722821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G/sVG99YU54QLcGF2oHEJwIneegrn7MhQsKoU1NJ1sE=;
	b=bW3VyRsfZSKC1v9slAj+ldlUmVrI62SJFzjYti1hNFn6IzSXZS1Yxbal/o4W85ojKMnOuX
	j47VnfncZvmAHyyLP6pRQ2dtKFPlOByhdTDmSHSMiSLJDUHaylme2C7qVB3aEGWnVJ3JwG
	KTu7umyJo493xWjYY13ckPalSUWedTI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55--DVPBqnCNLKxQFp6qDH0hA-1; Mon, 08 Jan 2024 09:06:58 -0500
X-MC-Unique: -DVPBqnCNLKxQFp6qDH0hA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C16A868907;
	Mon,  8 Jan 2024 14:06:57 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 604571C060AF;
	Mon,  8 Jan 2024 14:06:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Henry Shi <henryshi2018@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: silicom-platform: Add missing "Description:" for power_cycle sysfs attr
Date: Mon,  8 Jan 2024 15:06:55 +0100
Message-ID: <20240108140655.547261-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

The Documentation/ABI/testing/sysfs-platform-silicom entry
for the power_cycle sysfs attr is missing the "Description:" keyword,
add this.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/ABI/testing/sysfs-platform-silicom | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/ABI/testing/sysfs-platform-silicom b/Documentation/ABI/testing/sysfs-platform-silicom
index 2288b3665d16..4d1cc5bdbcc5 100644
--- a/Documentation/ABI/testing/sysfs-platform-silicom
+++ b/Documentation/ABI/testing/sysfs-platform-silicom
@@ -10,6 +10,7 @@ What:		/sys/devices/platform/silicom-platform/power_cycle
 Date:		November 2023
 KernelVersion:	6.7
 Contact:	Henry Shi <henrys@silicom-usa.com>
+Description:
 		This file allow user to power cycle the platform.
 		Default value is 0; when set to 1, it powers down
 		the platform, waits 5 seconds, then powers on the
-- 
2.43.0

