Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3D329A9E9
	for <platform-driver-x86@vger.kernel.org>; Sun, 10 May 2026 18:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439091; cv=none; b=YyBCiXND2JQr4DCjo2QSBzWp+e940ezF82K+ZyMFCCg9HYxeaUYr9E3G5TLEcFSOvFlfZgKTFVUOQ0SbV/zmtJIQBucUp8Z3heWtUrrLUx2A2VUtLLjEI9m/pJZlLw6oeiYvOjNGM1hxxQByYyAzl7naCoAAZzoCfpfVFHKVnKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439091; c=relaxed/simple;
	bh=ulosimzwip23eIWrxOFRnzlpU7hJarm4Do2INUxjLZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RREibU0L5uLK/WpPIM6Mis8xGlD7qTRYd+YjD/k1Dc38EKiPuWCNgcjFtbjk5K/iBVsq2Hhre6s+F11i8MKUYG9JiIZLl5nZpybDdQJZhmxwHqhS5lsmxmuDgX7SEGDTzYN7+p360184AbMlIVS84Zf/4X0FnpV+Z1CD6UuN11w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=Sl/D9Oha; arc=none smtp.client-ip=195.121.94.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="Sl/D9Oha"
X-KPN-MessageId: 17b3e1bc-4ca1-11f1-89ea-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 17b3e1bc-4ca1-11f1-89ea-00505699b430;
	Sun, 10 May 2026 20:50:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=tWYoIwfJG8Cug6XJNfFepgzUtHskY34cFBg2zoFh4YA=;
	b=Sl/D9Ohaw+YKpn/WuUdxz81D3nWuL3es5f0/4NtAmx7+9jXOynUw1LWjMXVzbhp2fHIOZhNkGOdE2
	 zeD79AajKQ/h0bZ5Acci1WZmGStWf5wZS8WPhGuCy9pniCA1pOX+/C6gRTj2u5+Ah2UlBs1Am0DVgK
	 B78aOyo/xYPbPL2g=
X-KPN-MID: 33|XSxMzrE3r/KFgpmJ4oseqYqBG2qkd0R1qBvBu7zQJC2h2hJ9U5S8m1PHQ2Sycka
 9qeHSc6hDGqLrb5mEsF1xGANSSXwOCNZdEx0EZk9ldlI=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|yGQYmyxVNWDRLJ9UwXqSgmBdj136/FqG+zSSFJ9dyEUSKFN4Dz8Sj/gQVCUdBtL
 JgqWn0VahvOAuXKzW7Z2EAw==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 17967cd2-4ca1-11f1-9c0c-00505699d6e5;
	Sun, 10 May 2026 20:50:19 +0200 (CEST)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v3 0/1] platform/x86: add Acer battery control driver
Date: Sun, 10 May 2026 20:50:09 +0200
Message-ID: <20260510185017.316935-1-jelle@vdwaa.nl>
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
 drivers/platform/x86/acer-wmi-battery.c | 347 ++++++++++++++++++++++++
 3 files changed, 360 insertions(+)
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.54.0

