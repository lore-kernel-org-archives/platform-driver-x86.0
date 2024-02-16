Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B24828E23
	for <platform-driver-x86@vger.kernel.org>; Fri, 16 Feb 2024 16:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708099552; cv=none; b=AOAqY5YeBDdtF3yWTbnSYwG2jJ3AobEmS9GYoY7SbFCEKhHoGGj5kHkxvU5wrktkvpDi3fR6EWrIyf32On3gaIMuhycX7DOZxt5D++wZo4As/00e4Ic1Xt+m9v0JJYIjIr58EpCsOeFsLeAi4IrsaNe/NSPzEtjuA4y7OHN+9pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708099552; c=relaxed/simple;
	bh=C9MhUklpNm/EMn5tvs+cacjcLp2sqwXxyvsFi5KXK1o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HUVb3Qv2GQW49PBxMqbgGpwh8AfnnDHqzM6phepJtAuP5yeMHvrYFG1MUymGLDI3p5HvC+extjJGiQ05Qnbd119Y2WPbNon5sa//ZoSB2Tqq/ogponERfQjlGk7EuGk1vHilXazVyaPWHHq14EpEUSFhuS0Rc0lgb3wx00kN5a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cehEG82E; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cehEG82E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708099549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KUorjmauqTP01m9r8DcdmwR8ytx/nR0G/P2LHdDZiwg=;
	b=cehEG82ES19wiQzQvLz74Lw8wmLN8sV1zZbnoatnnrIb2g5lfn2isetI1i79fzlbNYd/HR
	FhiudRN+fD6r9bj+YSQZ3H86edMdW04/Ih+N4wvfTviXq+cnduLkxnPVzVdYwwqKoYtrkh
	6Dsz/gi0yNRBQJP/gdVoYYUyt8oLQEA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-Xl8D5-EkNNWqX9CgUTZWZg-1; Fri, 16 Feb 2024 11:05:46 -0500
X-MC-Unique: Xl8D5-EkNNWqX9CgUTZWZg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8768E86F129;
	Fri, 16 Feb 2024 16:05:45 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.39.192.108])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5AE25492BE2;
	Fri, 16 Feb 2024 16:05:40 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	linux-leds@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v2 0/3] KTD2026 indicator LED for X86 Xiaomi Pad2
Date: Sat, 17 Feb 2024 00:05:23 +0800
Message-ID: <20240216160526.235594-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

The v2 patch includes:
1. Typo and style fixes.
2. The patch 0003 skips all the regulator setup for Xiaomi pad2 since
   KTD2026 on Xiaomi pad2 is already powered by BP25890RTWR. So, the
   sleep can be removed when removing the module.

Kate Hsuan (3):
  platform: x86-android-tablets: other: Add swnode for Xiaomi pad2
    indicator LED
  leds: rgb: leds-ktd202x: Get device properties through fwnode to
    support ACPI
  leds: rgb: leds-ktd202x: Skip requlator settings for Xiaomi pad2

 drivers/leds/rgb/Kconfig                      |  1 -
 drivers/leds/rgb/leds-ktd202x.c               | 73 +++++++++++-----
 .../platform/x86/x86-android-tablets/other.c  | 85 +++++++++++++++++++
 .../x86/x86-android-tablets/shared-psy-info.h |  2 +
 4 files changed, 141 insertions(+), 20 deletions(-)

-- 
2.43.1

