Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4E933FE0A
	for <platform-driver-x86@vger.kernel.org>; Sun, 13 Sep 2026 14:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789310199; cv=none; b=WgTFqsSNLv+LLD0e5V/cbq+58g/4IaqRXpJsnlLd7cZxfoolic96f/OGjPIAxvXoTVO8gqYoLvBZBBvS9NPIJXPPywLdgfh6kAbYq9CRcpTGtrKlcJ/I9GwyPRNcWmfu9SVlsRQDZv8nWLmMYnyZUkfb+sN0bJWoIqly3edOsdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789310199; c=relaxed/simple;
	bh=39MY7lTgfH2IVoffB813TimexRCzbP3mfLd34N+xWeo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ukx5LdaxsYEtZkzWpWaQHUsiWXdwjzMn80og5e7bNDu20l38hzIYgDTS/S8xlAWyIj8bEOewjvp5SiwkPPkvhlR37zJ3iIoouw1c1z+uq5Wcw02vHzDgkKUNvaPibH8e/jRzRwB/L5MKQqLZ57mSNaEg8bL+UhpAPtRm6YZStUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=NQujMS53; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="NQujMS53"
X-KPN-MessageId: 5a18bcd4-af80-11f1-8f57-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 5a18bcd4-af80-11f1-8f57-005056992ed3;
	Sun, 13 Sep 2026 16:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=YjvTOtiaKf/+KCoQqCtlDBTgqVAAIPmJClhWq/zmzdw=;
	b=NQujMS53rltPv/HVKt4s9OSOjJzRm9a2yqUsipSNtj6NEQRXm+YkCT31QbkB1UknMltdeYLdcnzvj
	 g4DAFeqIG0mcqJSHgEFD3QPASRp6VE9mC1L6Z6/1EpT6GMSBeEdSzx/Y2BEl3OsKEiJq9u2vsvcw8y
	 mgpIh2EqTl0tGytM=
X-KPN-MID: 33|AXXN+n67jNDmvnd/418m0Trwv5DdwB8zWYI8tfJUDNV30XccLha8YCyeKNNX2JI
 /5SbPg4YdkP7DjKDk1pKPkg==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|SEKdmEM+UICtr/bU7klFZnZm0j3E7egeef3zRI01TnqDxsUXQaENvqYWkf2vApK
 x+5dGJUgjatRiTVBJD/yeXQ==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 59fa0283-af80-11f1-8ddf-00505699d6e5;
	Sun, 13 Sep 2026 16:35:22 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Armin Wolf <W_Armin@gmx.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v8 0/1] platform/x86: add Acer battery control driver
Date: Sun, 13 Sep 2026 16:35:16 +0200
Message-ID: <20260913143521.1190506-1-jelle@vdwaa.nl>
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

Jelle van der Waa (1):
  platform/x86: add Acer battery control driver

 .../wmi/devices/acer-wmi-battery.rst          |  70 +++
 drivers/platform/x86/Kconfig                  |  12 +
 drivers/platform/x86/Makefile                 |   1 +
 drivers/platform/x86/acer-wmi-battery.c       | 457 ++++++++++++++++++
 4 files changed, 540 insertions(+)
 create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.55.0

