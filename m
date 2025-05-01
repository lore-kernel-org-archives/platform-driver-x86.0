Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DC42DC76A
	for <platform-driver-x86@vger.kernel.org>; Thu,  1 May 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746105440; cv=none; b=a34/ZML2CMgGpzVhKqIurpxQty4TLIi1NXhK8sx+vhTdBkbng3K6XeUnOim4S6y1rGg0IPr9aPMZFIqghA+Ny4X3eYY4gxSn8PcDq8R69nbxB1dxPVvI3tnR3ueqffElPVOc1+SRjLTlLjfOXzWlIw5bEKXqul9XmWSBbCEKmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746105440; c=relaxed/simple;
	bh=S2Gyxck8VK6XmFpvojNKV7u+OdLNpNUtdNtFmISF0ws=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cIrhAmvxSRrmAvg7xii5rcWtsRZmIMkREY+AqisZjJGBJgBD0ZCVHRuFP2z0ZT4WR5y8OodD1Hi2KUVyXSy8S+Ql1wOjjw3BSp+kAmClCb5b+VjEC+9OJjx7zM4Jvl7Nq9yx0CZQ3Tazm19kghxrt3SVQswem1eiNEDy+I0Q5G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PLYIOK2Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PLYIOK2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746105437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QQqf2hL6D59v0dHWwpzH3+qhwNKdonWLfoZHmjiyvQw=;
	b=PLYIOK2YmtukVt9LXdLyfPRl6VVpbVgJjuObJR/R/G4KdwaC9ho8bRNgJPETVlRq5zD5f8
	ST9VoxxJ/SUpESu7V9VeWytFM1SipAhD7WVulRSDLnBZUkf5HJbbM9ZV8X9Abo4cDCH2U0
	573rC65RBWz04QTYRvyfn2VeS3fvKSo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-nEbogn8_Pt6VzjiprwG67w-1; Thu,
 01 May 2025 09:17:13 -0400
X-MC-Unique: nEbogn8_Pt6VzjiprwG67w-1
X-Mimecast-MFC-AGG-ID: nEbogn8_Pt6VzjiprwG67w_1746105432
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4E9FB1800980;
	Thu,  1 May 2025 13:17:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.44.32.142])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 32BAB195608D;
	Thu,  1 May 2025 13:17:08 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	AceLan Kao <acelan.kao@canonical.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	acpi4asus-user@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/1] platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection
Date: Thu,  1 May 2025 15:17:01 +0200
Message-ID: <20250501131702.103360-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi All,

Here is a patch which fixes:
https://bugzilla.kernel.org/show_bug.cgi?id=219786

The patch itself is trivial enough and seems obviously correct to me, but
the code it fixes was first introduced in 2012 and we've been doing
the wrong thing when setting rfkill state on some Asus laptops ever since.

rfkill has always been a bit finicky on Asus laptops, so I must admit
that I'm worried about this causing regressions (or maybe the fixed issue
was the root cause of some of our issues?

So I think we should try to get this into 6.15, but not backport it
for a while to see if this does not cause regressions.

Regards,

Hans


Hans de Goede (1):
  platform/x86: asus-wmi: Fix wlan_ctrl_by_user detection

 drivers/platform/x86/asus-wmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.49.0

