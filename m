Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA4A1D3584
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Nov 2024 20:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730750938; cv=none; b=lAa4cXNBtwADCIzuvrOiyIlUmiAhAl4DCiTWloLSyFrokKhQ3+UeEzRdb+vZPonjZx99YPBCptXgaBUKxhkSmBY6ORdBb12abOy1SelOftP5So5j0j18OIcKpFCIS+jxnLdo2/VgXgtEd4XEOtK8mur3cvfalYm33FhVaEKunrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730750938; c=relaxed/simple;
	bh=l/Qx0sEJ7w/piQy59ZC+YPMXDaInrZS9g7u5DNYHHzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FxpteE87agvpN3RQZTt4wCC5UwrtBNqY0w+TmqpfUAHSwp/45OxC0B2wHjE6L1tyi3gIxa6vxz5ncKTQIKNXifuI3QPfqH6pKDJzxMq1ORF2muRTyaVNqmJ3n+Ike5dU60el7DGnJCYbhrwFhC/vSRDtpbuCPSrv9u1QFZXF+p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ibeXdgBj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ibeXdgBj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730750935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4TzQyP2OdStKw7hGJFijbK/KyZZ0HUyyFmf9saFuYpk=;
	b=ibeXdgBjBt/rW7I7LI0pn679cnMRlacdznrDGYMn3FPiBBOksaF17wa58eiDkra7pqtZsp
	ydycsDDYmTRCUFWhKmp0raD+ZdTBZx509l9/fyXEhEFwBoEuHSw97s8nnbBEtLFiTvGj/7
	b3AsXZ1m7D4/P6S56ddt2A1uU3Q5Cyo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-124-CMr8VVHPMC6IeEK2jBFdsw-1; Mon,
 04 Nov 2024 15:08:52 -0500
X-MC-Unique: CMr8VVHPMC6IeEK2jBFdsw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4B2519560A3;
	Mon,  4 Nov 2024 20:08:50 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.64])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 627121955F42;
	Mon,  4 Nov 2024 20:08:49 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/3] platform/x86: x86-android-tablets: Add support for Vexia EDU ATLA 10 tablet
Date: Mon,  4 Nov 2024 21:08:45 +0100
Message-ID: <20241104200848.58693-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

Hi All,

Here is v2 of my patch series to add support for the Vexia EDU ATLA 10
tablet.

Changes in v2:
- Add get_i2c_adap_by_handle() and get_i2c_adap_by_pci_parent()
  helpers as suggested by Andy

Regards,

Hans


Hans de Goede (3):
  platform/x86: x86-android-tablets: Add get_i2c_adap_by_handle() helper
  platform/x86: x86-android-tablets: Add support for getting i2c_adapter
    by PCI parent devname()
  platform/x86: x86-android-tablets: Add support for Vexia EDU ATLA 10
    tablet

 .../platform/x86/x86-android-tablets/Kconfig  |   1 +
 .../platform/x86/x86-android-tablets/core.c   |  60 ++++++-
 .../platform/x86/x86-android-tablets/dmi.c    |  20 +++
 .../platform/x86/x86-android-tablets/other.c  | 165 ++++++++++++++++++
 .../x86-android-tablets/x86-android-tablets.h |   2 +
 5 files changed, 239 insertions(+), 9 deletions(-)

-- 
2.47.0

