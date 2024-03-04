Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FF63E462
	for <platform-driver-x86@vger.kernel.org>; Mon,  4 Mar 2024 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709559845; cv=none; b=DeojlXvEawL1HHxQtXWFBv6saI0jrALFyqkUsueIPk4kvScq2PxOIcMJsO2pg4QjMSsNdspaD9n84HKSIIx1cWaZoB7MQ0pJwaElmDPhwzQ9t+erozzuV4HwQiSVuBvX1vgdWLWaSsWRJ3nCJruBdhQjiRUNjMYb37xfXrvYYcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709559845; c=relaxed/simple;
	bh=ktdUYWZ2OEv+ZLLGv/CfmlXwdXaVhybnRKXhOhoRvno=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=onf2J0BptD3U4eXq5wz+MtQHD/s/oXLnZiqgTvyyOqW67aNPRqH0sgWgkiy8v6K6B2VR1nD502uAH+2q+OdBQj/vhLhIetyjLvIyIlGCoBREoiSylieJD6tDTU66T4//+FkNBX5NmcUibrwCxzRcmBbKuejRZjpb+cJy6vuTmkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GIS+Z2Dm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GIS+Z2Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709559842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=plGAajtE42pngWWzxM225uxzxmsJXDSdv3XUKaR8+SY=;
	b=GIS+Z2DmjA/tfTASqVy5rS6OoOqRPxDda/xXX1xJmK8csmSq5RZKyw092TB4DgGA1enq6Z
	bhcEpO8QmkiokJTyWy9vFqNlD2xJXMNqktCSPzTXLtAGOxyaLa6aOx7i8CwmHMHlQYdAZD
	jTEkuPthvEcx6hP+bOKzJThDVgV0bZA=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-lDJnU867MC2l4-bHG6I3bg-1; Mon,
 04 Mar 2024 08:43:59 -0500
X-MC-Unique: lDJnU867MC2l4-bHG6I3bg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 998C428AC1C3;
	Mon,  4 Mar 2024 13:43:58 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.195.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD091492BE2;
	Mon,  4 Mar 2024 13:43:56 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	danilrybakov249@gmail.com,
	Lukas Wunner <lukas@wunner.de>,
	Klara Modin <klarasmodin@gmail.com>,
	linux-pci@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [RFC 0/1] platform/x86: p2sb: On Goldmont only cache P2SB and SPI devfn BAR
Date: Mon,  4 Mar 2024 14:43:54 +0100
Message-ID: <20240304134356.305375-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

Hi All,

Here is an alternative approach to fixing the p2sb_bar() caching
causing problems on an ASUS VivoBook D540NV-GQ065T.

This is untested, which is why this is marked as RFC. If this works
I believe that this is a better approach then the approach from:

"[PATCH v3] platform/x86: p2sb: Defer P2SB device scan when P2SB
device has func 0"

Regards,

Hans


Hans de Goede (1):
  platform/x86: p2sb: On Goldmont only cache P2SB and SPI devfn BAR

 drivers/platform/x86/p2sb.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

-- 
2.44.0

