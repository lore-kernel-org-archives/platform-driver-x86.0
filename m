Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE1E3E0C7A
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 07:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782718886; cv=none; b=YgPAd5E0UyFh+71Q2qO3SDyAy4XijbMCHGetIFU909QtB26N5S1aaiqrPIolwtdzL/ScAzRopmwBrmu2jlvRC0ALZtOcuDeTc7LyGEI8Ddu8Yq9Vh7HhgD/lui48C9tn7RXGsnamEGAWGBB7GbyypCseVlkcJmc8T8JGFLyFmOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782718886; c=relaxed/simple;
	bh=N4Fj6WY48SFiHJv2SHjjdMtNJfA81IjgI3/w9kXwqL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lAXl9EO2fiTL8NJepCVANIr1HZJP0l8lPXvx0jl6MtHoq3uYU2FuEBJ+nsU9BBkLwdWgoK+xj7wzRiYaMNZb/+mR6bJrT9+QxcRDCk+v5ZI+x955kfVpz6EBCFY+L/PDLeceS5TcMopee9yxqBxHhj7Prka0UdEB8bzzioVM2jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BTzOJuYd; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BTzOJuYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782718884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s+QdmqKNDho30FCCG/pBRWGnl+chqjQBAUDyRCUTKpw=;
	b=BTzOJuYduOsr+RjGJR5PsB6BrGFd2xE+uKrGufcYaENwqSw8TXEMd7YGRrDvhjNhYCSExu
	7Mh2v5GR6VdkNysis6mzPYWuDPL4a0CoTxxTUmK/mTqrdoq6SV5ixtRdcsZpKFCLTks6J3
	WN0Jmdy0GoqVh93soCzrunknZLixcbk=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-xceaFEwhOyGC7NS-nUn0TQ-1; Mon,
 29 Jun 2026 03:41:20 -0400
X-MC-Unique: xceaFEwhOyGC7NS-nUn0TQ-1
X-Mimecast-MFC-AGG-ID: xceaFEwhOyGC7NS-nUn0TQ_1782718878
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2D8EC195606C;
	Mon, 29 Jun 2026 07:41:18 +0000 (UTC)
Received: from hpa-thinkpadx1carbongen12.taipei.com (unknown [10.67.32.110])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 613281956041;
	Mon, 29 Jun 2026 07:41:10 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Serin Yeh <serin.yeh@intel.com>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Damjan Georgievski <gdamjan@gmail.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: computman <anis@talbi.fr>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v6 2/4] media: ipu-bridge: Add Sony IMX471 for Lenovo X1 Carbon G14
Date: Mon, 29 Jun 2026 03:40:24 -0400
Message-ID: <20260629074026.35490-3-hpa@redhat.com>
In-Reply-To: <20260629074026.35490-1-hpa@redhat.com>
References: <20260629074026.35490-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The HID for Sony IMX471 is TBE20A0 on Lenovo X1 Carbon G14.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 2474452b3015..8ddfab357922 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -97,6 +97,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
+	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
+	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
 	/* Toshiba T4KA3 */
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
-- 
2.54.0

