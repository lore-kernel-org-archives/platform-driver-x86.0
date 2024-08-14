Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A189813C673
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Aug 2024 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723662147; cv=none; b=oNFBJO4S9yLPO0PDG/RMVaVvkZjA2Uu40q8+cJRTuZQ5K4aYUb1t7A0EgxBPHuqL9474kGhNYVAKOYVNXus+VtqCakoDeXu4p1AtrJRi5O4EhzG5MFIRaG8Fhu6ftdPoZD+JcAEqAbpsAH/xiIdfsTFR9yABkM6T0NHQyYo+9jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723662147; c=relaxed/simple;
	bh=Xnh2Cto9uxR6JyO/0gR8xiy8P50HYEbg0oHLAFVDbH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R2aQOwIBsK0a1R/lr+oVKJt0Jiiw0O0nTHB/hgx91pkEA7l4+Pq29AsVF0LjIq3DVMQM0oeaQbgVRqrV8rjfEAG8gT4rsf5gZ5ezcKku0pE9gDT4TQWJn52k/jBcIikoSZRCT8uF9FlFOBswdUDphb9pynNGFlgDqZbTLLfo00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DrtyS5eG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DrtyS5eG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723662144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sCzm2W6O4T8GkztKRcrottopCG1C6+IdUKb3GyWFWZU=;
	b=DrtyS5eG8tMKthd5LWppYWIKweOiiAu2BEty7+I1sBpnBGJPk8cafPEc90wqWP3uy1CS7u
	btysnhcCv5g6W+VSr6cAgIgdO3VmOPCmnNSbOvblSpxnLLu/9RJ//LN0dpS9kRYe8+vZmJ
	CF3JvYlPdBV62VqFNsZdNGFr41VSktg=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-191-cu-_gS2zO0SWi46f11Rezw-1; Wed,
 14 Aug 2024 15:02:04 -0400
X-MC-Unique: cu-_gS2zO0SWi46f11Rezw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45D6718EB232;
	Wed, 14 Aug 2024 19:02:03 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.22])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 351A319560AA;
	Wed, 14 Aug 2024 19:02:00 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	dri-devel@lists.freedesktop.org,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/3] ACPI/video / platform/x86: Add backlight=native quirk for Dell OptiPlex 7760 AIO
Date: Wed, 14 Aug 2024 21:01:56 +0200
Message-ID: <20240814190159.15650-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Hi Rafael,

6.10 has a new backlight driver for UART attached backlight controller
boards found in some Dell All in One models.

Now the first AIO has turned up which has not only the DSDT bits for this,
but also an actual controller attached to the UART, yet it is not using
this controller for backlight control (it needs GPU native control).

I did not tie the dell-uart-backlight into acpi_video_get_backlight_type()
yet, so the first 2 patches in this series deal with that and the third
patch adds a DMI quirk to select native backlight control on top.

Backlight control used to work on the Dell OptiPlex 7760 AIO with kernel
6.9 and older, so this is a regression and I would like to see this
series merged as fixes for 6.11.

Rafael, the drivers/platform/x86/dell/dell-uart-backlight.c are small
and isolated. So I believe it is best if you take the entire series,
to avoid conflicts if any other drivers/apci/video_detect.c DMI quirks
show up this cycle.

Regards,

Hans


Hans de Goede (3):
  ACPI: video: Add Dell UART backlight controller detection
  platform/x86: dell-uart-backlight: Use acpi_video_get_backlight_type()
  ACPI: video: Add backlight=native quirk for Dell OptiPlex 7760 AIO

 drivers/acpi/video_detect.c                   | 22 +++++++++++++++++++
 drivers/platform/x86/dell/Kconfig             |  1 +
 .../platform/x86/dell/dell-uart-backlight.c   |  8 +++++++
 include/acpi/video.h                          |  1 +
 4 files changed, 32 insertions(+)

-- 
2.46.0

