Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA4B36DA00
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 19:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786562615; cv=none; b=RWHkFPj2xWjRxfYjkdZlXJ55OU0Znaz/mCgQ4seRczOTIaIxhLK/pwHolmGRbWe2/LC4+v+vnxtnR+Y9+7HsmrUfSVTTMGId8HJ9Xw2P5NGTWn+MkqGQQ6L1kkC6Z/otnh2zTO3IsReqjkDoDpOZsrW+z5y0DoJ78afbuNKOjao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786562615; c=relaxed/simple;
	bh=Le5W8B5V+QN+Shsh/OUoXKHzloQLQlMbDyGKUbr6Cos=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r9GuUiI5FFo6U5v/N6NG0hwAtwqIjSBGViUo7QkYaeVCg+hRsOgy1siVB5EnJCTBN7kHH5IDydLXRr2AhmlZJUeDcs0adSJH1tV8NUj8ebDGQJ+pgLIPy3imNv+IOn27uXNhRgKOeK4v78AVcwXJXDDpqydTWxKcW0Sd9/WmbAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=G+wnCmqU; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="G+wnCmqU"
X-KPN-MessageId: 47dcc4a8-9683-11f1-8f54-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 47dcc4a8-9683-11f1-8f54-005056992ed3;
	Wed, 12 Aug 2026 21:23:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=uo+LCIsCuI+HULZ+sXbvq7tUUq6lpAHy1ZsEDQeWWG8=;
	b=G+wnCmqUAbLO65sHG1br5sfoBFD/7UA/dsOl9RDW1jU9/Uq0C3OAOQ/RDxtk6yHjUnyqEYAnkvWIk
	 QOAZy3JjAvPvnjtwL+sgP1DU0Cl0mbc5yTFhiRjL4VGY1MUDYDKZa4tGfRHMegAwtDgfkWGflXakTT
	 xq2yrPSNQ6pmDNIY=
X-KPN-MID: 33|YTKSbdSh+npohN+MU1AhyYFX0YteVInReQxRMCTYrAy920k2lf/4Upj+YiluYAz
 S7OH4TM4avwaZKSCALwGUjqUqnr1b5UMyZjc6XtddDUo=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|VKG6OjepEL2XVi4nm8giARf8wh5oAld+VUoYrMJOcwnnAeUQ4uGLq2ZMJGkZISh
 zdGaIkWTYtFMD21lfZgLqKA==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 47c013da-9683-11f1-8097-005056998788;
	Wed, 12 Aug 2026 21:23:21 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Armin Wolf <W_Armin@gmx.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v6 0/1] platform/x86: add Acer battery control driver 
Date: Wed, 12 Aug 2026 21:23:14 +0200
Message-ID: <20260812192319.276246-1-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch upstreams a part of the out of tree acer wmi battery
specifically the battery charge control and battery temperature. [1]
On my Acer Aspire A315-510P battery calibration did not work as expected
so for now this is left out.

[1] https://github.com/frederik-h/acer-wmi-battery

Jelle van der Waa (1):
  platform/x86: add Acer battery control driver

 .../wmi/devices/acer-wmi-battery.rst          |  70 +++
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/acer-wmi-battery.c       | 448 ++++++++++++++++++
 4 files changed, 531 insertions(+)
 create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.55.0

