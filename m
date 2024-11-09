Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6408A2BB09
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 Nov 2024 22:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731189949; cv=none; b=Pv7xIIzOzmsXNhjescEDMHVEZdqyS8y8ycghIYnCYor+fwkaSVmh5hutLP2ceYsB2rYZ3TIm4c5KPb1CJBoCmxS44cQs3Ca0gCV+daS3vLJEEnSUsdIP46f8ZCTlrruVv+l12MG6LCtOC7bGtfumhWgc31FX4NY5gYq5W3wdBc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731189949; c=relaxed/simple;
	bh=biHV/Ll00mkNITGUdH/5E5F1eEHIcSQTnd/15CLH0l4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kR1az7ej77BQ5atE2ppy3CoCgwVqvDaGgzG/F2oguGqddwanBUjmEcvpU35Gcm6OKwL5v3ytwITI6NKImPjxaRvEsQEaPu8S9l27glW4XwmUYXb/ACkcHaAS8768+lKz0CPpFqNbTDZmqclMQdCuaZ26AHQkDNtmn0s4e9GCAHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Oqyn+Xb3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Oqyn+Xb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731189946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8rq6wn0Uko6Y4F7C0fexeD3oHDCfjYfNo9Y3KfR7J5s=;
	b=Oqyn+Xb3S0cjQZ6yQs5l8jSsa426xDzztE+K6myhPUg2qKoA/zk1RbFzrojGhabqK7OhYm
	LDHZdIeOgFZtu48eVQf02TtaL0rp9aXcqVSoB+S1YVqiKmRMVa/ujxIlspzZLS0M1NNb2R
	FdYlIYg+Z4GX3B+nMVm91SSoYFX3Xb4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-B2mfH7lOPfezZcY1y9pfcQ-1; Sat,
 09 Nov 2024 17:05:42 -0500
X-MC-Unique: B2mfH7lOPfezZcY1y9pfcQ-1
X-Mimecast-MFC-AGG-ID: B2mfH7lOPfezZcY1y9pfcQ
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 911F3195604F;
	Sat,  9 Nov 2024 22:05:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.21])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F29301956056;
	Sat,  9 Nov 2024 22:05:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/5] platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU ATLA 10
Date: Sat,  9 Nov 2024 23:05:25 +0100
Message-ID: <20241109220530.83394-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Hi All,

Here is a patch-series for adding Bluetooth support for the Vexia EDU ATLA
10 tablet to x86-android-tablets.

Due to the LPSS UARTs being enumerated through PCI rather then through
ACPI, this is somewhat involved. Just like how this special case needed
some extra work for instantiating the various i2c-clients.

Regards,

Hans


Hans de Goede (5):
  platform/x86: serdev_helpers: Add get_serdev_controller_from_parent()
    helper
  platform/x86: x86-android-tablets: Add missing __init to
    get_i2c_adap_by_*()
  platform/x86: x86-android-tablets: Change x86_instantiate_serdev()
    prototype
  platform/x86: x86-android-tablets: Add support for getting
    serdev-controller by PCI parent
  platform/x86: x86-android-tablets: Add Bluetooth support for Vexia EDU
    ATLA 10

 drivers/platform/x86/serdev_helpers.h         | 60 +++++++++++--------
 .../platform/x86/x86-android-tablets/core.c   | 31 +++++++---
 .../platform/x86/x86-android-tablets/other.c  | 12 +++-
 .../x86-android-tablets/x86-android-tablets.h |  6 +-
 4 files changed, 74 insertions(+), 35 deletions(-)

-- 
2.47.0

