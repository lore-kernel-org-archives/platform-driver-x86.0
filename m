Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D9961ABEDE
	for <platform-driver-x86@vger.kernel.org>; Sun,  6 Sep 2026 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788694874; cv=none; b=hkOxtYRdbMAoLyN6D7xczkBLX6Yu5ym0M2nt7Y07ermTyZFaC5tNJsUJRd8pLhKWqKxSV+AEVo71zzzgGt+1UE5pkHVnF8i+3bSGzfOdH7/vYKrCQnF68hqArro6lFvnSUS+XO+SA6IXw4VSxO8meptLJkJPEhpvE/6NDYWFw8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788694874; c=relaxed/simple;
	bh=a/9X27I5hcCNycwF0MkmxYJE89NXKl+pDTaTjG9gB2o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hByxKsiVozC/kPx/ZjMW/VTaNTbQ5SCnKkrVibpW4/oiaXhykqMkhKZDjPF4hIHv0KPFOCpcuiiwpaoJovspdu6Aknfw8+cTMzlYtpsI9Pwu8X9jeVHpkpJ0W/6UGaqbn14mbTOq2GeJfEKnF5Dz3cvF04d9RFVyFeIpXID6bpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=hssskNx4; arc=none smtp.client-ip=195.121.94.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="hssskNx4"
X-KPN-MessageId: d4a2f856-a9e7-11f1-a5a2-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id d4a2f856-a9e7-11f1-a5a2-005056994fde;
	Sun, 06 Sep 2026 13:40:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=7zG5E+Yceq/QPbtik96UNC0ilmQWinAPjuKpnkcIvpY=;
	b=hssskNx4g8JE0OzCannnXqBSTP/IloN65xt0dzjgCotzw4+LAe914OzrMpezUNRyC/iYXq2ekwFcz
	 VcK13RW85/N6BSl0JUt9F+8XRSBM+pS3mlgDPt52aM8+O6+ntoCY4NUMmxVq06UXKOzCTC5oWNH1IW
	 6Osq1HAmQ4YVoZOE=
X-KPN-MID: 33|+qdaNTlqWcpu/TsbFgSuZrrwylsPLwEa6U0CcZQ82RC9BnfIIDwbfh0bZKldPAL
 AMNTDT6j1+wy6FqcSHcsds0S4aSCVW244vnnqBqD2Crw=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|27TZWjZYhqpmuFsQvuQMxWT65nWfY5V2Y8a5BhfKXpy0Jl1pBcmMjvJ1gEH+dNp
 jXffIfmn7VNhK+5BMnPmzRQ==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id d481ea55-a9e7-11f1-8ddc-00505699d6e5;
	Sun, 06 Sep 2026 13:40:59 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Armin Wolf <W_Armin@gmx.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v7 0/1] platform/x86: add Acer battery control driver
Date: Sun,  6 Sep 2026 13:40:54 +0200
Message-ID: <20260906114057.712529-1-jelle@vdwaa.nl>
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
 drivers/platform/x86/acer-wmi-battery.c       | 454 ++++++++++++++++++
 4 files changed, 537 insertions(+)
 create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.55.0

