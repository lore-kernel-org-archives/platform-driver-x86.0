Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F592F549F
	for <platform-driver-x86@vger.kernel.org>; Wed,  5 Aug 2026 18:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785955620; cv=none; b=IJk/xFZ56XO9kJDO2KDVhBsSDoL8ik1wq9T3RlwbPLRU7bLcz/H6rI9xqP96z2K4tZyfop0K+QZIG9xlQy7CwBJv2DB87hjXoxHu1BBJTjKrrJRoTKZ8KTffBkNU0DVrk4JRAS0xq1jf8+ipEsq9DR32Db9srhf4BEK7WbfisvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785955620; c=relaxed/simple;
	bh=2iQPFXePZNoaaXW03vXXqDhgzBS3ANvKbMDyQY5JAvw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qRRbFlH80E/J5TezxWPCrTo627ReWKgU3e6sLGbZLVHGYofF0P+klcZoNbqmSefkY/wwZLEyvb49tQ4gemYR4EphPjTIBkFr7R72VwT+St4mPb+DV+2k5fheBKvqQAcniry5OqwPi3y8JBXsrt2qrDtvXJs9V+z+ldS4+LMIagk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=MtJS819c; arc=none smtp.client-ip=195.121.94.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="MtJS819c"
X-KPN-MessageId: 02ed91e6-90fe-11f1-8f54-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 02ed91e6-90fe-11f1-8f54-005056992ed3;
	Wed, 05 Aug 2026 20:46:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=IIjj/z6x7xtjAPVNWpTbYg5ILnrEK0peF0XZuH4PStU=;
	b=MtJS819c+I9TB95S6dNmDypYtQegP/Z2F3H4EtZFuHA9skrFDh1tlk3oEsCZ20IM6KkgpeqIgnX0z
	 aLLp7MmmsqWJBLBD5lvfCiNp91MCTQkjs3/vyxccqf8G7tH7aHnN0r9Lm0OVO4H0SVRfZhjOwYTBXZ
	 JlQfrf9b0kOFkOYg=
X-KPN-MID: 33|BLDZBFwQdpwyTtbmWNgCDV1Y7qLI0EKNR3nWbRnJQHh8aHsAE8vpl3B+c0RK4y5
 5Mm/q2Ibo7TLX1jCGaUWF395PZL2Ri8Rf7yYxUvIgEyM=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|RyYDQAHUeDsy47VBarldkkr0JSzLe0DEIFcMrFhE5uX1R+9brotRfCekCDxwpz+
 VQT5YJKbg2VLWOCFfWlgKqQ==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 02d0066b-90fe-11f1-87fc-00505699b758;
	Wed, 05 Aug 2026 20:46:46 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Armin Wolf <W_Armin@gmx.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v5 0/1] platform/x86: add Acer battery control driver
Date: Wed,  5 Aug 2026 20:46:41 +0200
Message-ID: <20260805184645.24542-1-jelle@vdwaa.nl>
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
 drivers/platform/x86/acer-wmi-battery.c       | 449 ++++++++++++++++++
 4 files changed, 532 insertions(+)
 create mode 100644 Documentation/wmi/devices/acer-wmi-battery.rst
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.55.0

