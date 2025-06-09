Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846D2517A4
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 10:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464546; cv=none; b=Nt3SjYHdmSUb+C8nhSnCI9XLMTbDUb+ey2fpSdVC1GjEThnA4JjoqYypfruynYRU4QufJdlRRdyvySO1fyDYUTYLz2sSu8bn1FKYkUw1IL/vN/PsQycrmK3oNB9CbeB7LZzrsfaLxBL9/eszHPzJVHbK0tS4CaZYWVjQXigpyAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464546; c=relaxed/simple;
	bh=0Fc6cDFUObMf+Q4kriqQdKo/9JgtnJCCVRFIswhGqco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DK6EMfUio//md/ZCNrCybAUJynI+m4Gu1HHsqGNQvYIgGD+1OCekLwS+YlyMEsedy0H6RUnFcmCbkYVTDLruVK1PxKoGSSiz/A9OvaoXRV7bgzROumseETFuhgC6LsvAotz80UpAldQS9tPu8b6mPcIhlOMTI/bQvoayNzT41KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DNqAPfD+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DNqAPfD+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749464543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W+5YRGlYAwgP1pxdrADvOt5Mp9LsFZd7mcyef4W3XmE=;
	b=DNqAPfD+RPow/68LINyi/ikK9F3BN62nW1slJ0WrkrDSXaVncsmx3X97qccU4jNhrs64Jc
	Ng9mFrM0RgjucdRIkV6Zv8dOH+TYYEMx2U/sp2Iu2AHJDb2MX+xpL0CrpuoTaA3AhYQO0z
	hldW4+2OpQGuQSIqM1ys6oJcWKBHSXM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-146-FStkp3j-P8K1sDHxDiyV9g-1; Mon,
 09 Jun 2025 06:22:20 -0400
X-MC-Unique: FStkp3j-P8K1sDHxDiyV9g-1
X-Mimecast-MFC-AGG-ID: FStkp3j-P8K1sDHxDiyV9g_1749464539
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 290E418002B3;
	Mon,  9 Jun 2025 10:22:19 +0000 (UTC)
Received: from carbon.redhat.com (unknown [10.44.32.119])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 66ABE30001B1;
	Mon,  9 Jun 2025 10:22:15 +0000 (UTC)
From: Jelle van der Waa <jvanderwaa@redhat.com>
To: Jonathan Woithe <jwoithe@just42.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] platform/x86: clamp charge thresholds on fujitsu
Date: Mon,  9 Jun 2025 12:21:12 +0200
Message-ID: <20250609102115.36936-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

For userspace programs it is not know what the valid charge control
threshold values are, clamping them to the nearest supported threshold
makes the API easier to use for power management daemons such as UPower.

Jelle van der Waa (2):
  platform/x86: fujitsu: use unsigned int for kstrtounit
  platform/x86: fujitsu: clamp charge_control_end_threshold values to 50

 drivers/platform/x86/fujitsu-laptop.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.49.0

