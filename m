Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F972194C96
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 May 2026 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780218318; cv=none; b=DfjRLtaIekZq1nL7ipDyPuU73Kv1h9+qK2rtZ0xVTHDANKlssxudN9fD5V2wevWFhWmYaQyfwa7D33AOGNMpy37cRtWrBMjDMaeIA1uyXZIevQURmh2QmuSU/TWaItnwYwbqAhmHkjB1fe4RwYgUSOK9+soJ8IFYs6NjwIQDpKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780218318; c=relaxed/simple;
	bh=2wDdFIejrQqOLytLfS5/L0vH+Pwm6Ylv3DxLEJir0gA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sH1IDfQbpjiHt1pewOIEukojfBhKS/f87/nKFx+OjpdIGVFjvVnUjl7gaq7cwdAhc62koG2NlK1sKTNtNSwpGMmV51Zui0FnbJ8TIAnMEB4qyX6JkJ1sV+kK9vUAOTwDjg5P4uG3k7noV9U4K5CoKcbambLTsGeqRHUvZqKf7HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=qIlg3/Zn; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="qIlg3/Zn"
X-KPN-MessageId: d1fcc9aa-5ccf-11f1-8ff7-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.6])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id d1fcc9aa-5ccf-11f1-8ff7-005056999439;
	Sun, 31 May 2026 11:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=/Om7+liyOc5eVoFUY8ssoHQ2EpC6dFCqc35g3ISsGbI=;
	b=qIlg3/ZnjpCxk/LivInfFt2cwVQ5HKRLl9hE/8C82c3154Y4GdRoQmrNt1SWVitFK7Su8mZO2UcXW
	 CHWoX/KmgXcoY4Ta0KOAdITyREljocMFlZoQpXSeevYMzBo3pienHfgVA0UTCb9iIomXxGVsFlLYOR
	 /64M2MJGb/F+YeLY=
X-KPN-MID: 33|68zsNw82rtKTCHzNLn01WTaHLykaXuGrX8hpuOpE+w2sR9/3YsSn1M4W29pwz/f
 10m221Ac1kt/7eDDPOxoeH4mK5g446sl6032rTEXUc9k=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|KwCuiAYaUSllnTS15jZT3pYj+xgdKsqpesjipNKzIs7c18gfRpyP0W3V/O0Qag/
 RgNDLpx27nPE6PnpKxPT3sA==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id d1e765d9-5ccf-11f1-bffc-00505699772e;
	Sun, 31 May 2026 11:05:07 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v4 0/1] platform/x86: add Acer battery control driver
Date: Sun, 31 May 2026 11:05:02 +0200
Message-ID: <20260531090505.156394-1-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.54.0
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

Jelle van der Waa (1):
  platform/x86: add Acer battery control driver

 drivers/platform/x86/Kconfig            |  12 +
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/acer-wmi-battery.c | 445 ++++++++++++++++++++++++
 3 files changed, 458 insertions(+)
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.54.0

