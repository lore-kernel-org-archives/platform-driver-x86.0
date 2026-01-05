Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776BA30B51E
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Jan 2026 17:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767633117; cv=none; b=JLwA2uL1JrL0DhQqXZlxv0ikUMKndKNo28FqlUZyXX6s99kyFHWubxwxgobapkeY0pLiqQCMSFAiaB63EpVJykodHQi8brmyB6261fPG6LRg0TDEpW7NlTW+Ni2UyAADakoPzPzpUDqYp/XW7aOxTp8+CzGkj9FvkSoxBf4vZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767633117; c=relaxed/simple;
	bh=2wOeH38lR0pGUv03JHANI4BYkJbfw8Ol/EjXecgmPbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9aBR2Mhx47Mm92OcdsqPVuy9goboVBcI+G4G6B8wFt1iU4P1sUDvxsXdjhQ6jYj2qI6wRWFuefBNx5gyYLaIMlsfajdVHMQjUxzZg2IoRhAbiXXYMYKYiAp7uPzr6sRsW/kvy1WBvOF2Oai6KWueUGCOhuvEcNRzGS+q/NusSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=nHhFp3ux; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="nHhFp3ux"
X-KPN-MessageId: 794d072d-ea59-11f0-af3f-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 794d072d-ea59-11f0-af3f-005056994fde;
	Mon, 05 Jan 2026 18:10:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=xajP2DJf0dOMyOv+GStkc23VX7xsNwqmo6s37yWkxLU=;
	b=nHhFp3ux567awDYma+mB51T5M40bVx7F7ycpTOjgxhfJvBTVhyY8cJQhoDiPFBRKEtzaFsMuz91iA
	 9x/MWJ+FRoNL2CKuW9NMSDXEqszqY/efCpF/HUtPfBTKQZoRMYjBuKiv/E0UJLXDOcC8XTZGgQ/ryf
	 YgJTVZ2dk9EBkCUg=
X-KPN-MID: 33|C8LHgjA/m4W2qQpcMoTktORU+AKP6GhYfh8Qbdew/nPeXtLrJlaeDSBhvPC1AjA
 JOTGatDi53qWmfTKR9ELXKA==
X-KPN-VerifiedSender: No
X-CMASSUN: 33|3xhz4MaS0Rgi3pJVDaML6I0JUeAAtUSq9AU16wkG8DoQKcJGC6Pel3zCbWLcCdm
 +BbfqunhLb0eO0FkALeLAeQ==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 78811f8f-ea59-11f0-86cb-005056998788;
	Mon, 05 Jan 2026 18:10:44 +0100 (CET)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH 0/1] add Acer battery control driver
Date: Mon,  5 Jan 2026 18:10:21 +0100
Message-ID: <20260105171024.227758-1-jelle@vdwaa.nl>
X-Mailer: git-send-email 2.52.0
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

 drivers/platform/x86/Kconfig            |  12 +
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/acer-wmi-battery.c | 345 ++++++++++++++++++++++++
 3 files changed, 358 insertions(+)
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.52.0

