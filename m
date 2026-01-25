Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D323BB4A
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Jan 2026 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769365495; cv=none; b=nmgwMlApLcyf+N5gUVhRwXFRFbdQEzjU59b2lJag6zMmoB9DVZ0YMieDCUgXS9qoCal1m22i24aqLBlMfkVDcA7//bGelwz0iGCyFgO2uLF7pqt7FDruYHQqhehIaRgYXG2J2oLK9FlDma0OXmMQLyaj30xArT87GrP8kVNLgHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769365495; c=relaxed/simple;
	bh=aZlrAfkkcgqZxIR+efQAgbncpik2v/m/m+QUI6m4sWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kT1+fO1lEWFLEHdBvasLrgg/tJgao9NJ+Xno8n5WTyObEI139UclPTieHguV6HDuvEsw7/NCpqO/4CFcOmUeOhwuyYWaSBxKszDs/Ime6sWXjnnO6POTUPld0cL3g3T672MJcz0/Exd27jM+zFZ3j3lCVF8PvIuzeqZzjwwcT1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl; spf=fail smtp.mailfrom=vdwaa.nl; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=VgFGNmvZ; arc=none smtp.client-ip=195.121.94.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vdwaa.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="VgFGNmvZ"
X-KPN-MessageId: 1e85aec0-fa1b-11f0-8fef-005056999439
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 1e85aec0-fa1b-11f0-8fef-005056999439;
	Sun, 25 Jan 2026 19:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=dsOf/MvqnGg6cRlL8+KgKZV+/mvoZa/UqoO6OEm+438=;
	b=VgFGNmvZCrJ53pyj/t3zBqxNivx2fLSuXHXnvBylDFuIuTIyOev8/21+whzrebCjGjmqPOXzZKRez
	 BBXDbp9UG03Qu+dwdy5TWmTJQAwlwmXoRkP4ynSsOKEkCcgBDrQuh17x2OeOZTMhJDJMKFohlwwnTj
	 T3IXSmfNzwuOBYl8=
X-KPN-MID: 33|LpkUkVEunTIFISOfBQsFOlEfc7+NvrKUfClq/3YJP69dkcIwBsRQyX1ccaj7tPr
 bFvFAlb1KJz0VkUJEewhokOkqAjjQs/tRZFWNjufpCg4=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|t3wh28IDHB/XLLW2d8KvWkeuiExrbCQOOsz/bDTEeWYjb/Cm+dnzfcVPUdUY/mF
 XiKLIrRwWwdXhtdqGl5Sc6Q==
Received: from natrium (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 1f136d13-fa1b-11f0-86cd-005056998788;
	Sun, 25 Jan 2026 19:24:44 +0100 (CET)
From: Jelle van der Waa <jelle@vdwaa.nl>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	Frederik Harwath <frederik@harwath.name>
Subject: [PATCH v2 0/1] add Acer battery control driver 
Date: Sun, 25 Jan 2026 19:23:11 +0100
Message-ID: <20260125182314.735668-1-jelle@vdwaa.nl>
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

Jelle van der Waa (1):
  platform/x86: add Acer battery control driver

 drivers/platform/x86/Kconfig            |  11 +
 drivers/platform/x86/Makefile           |   1 +
 drivers/platform/x86/acer-wmi-battery.c | 355 ++++++++++++++++++++++++
 3 files changed, 367 insertions(+)
 create mode 100644 drivers/platform/x86/acer-wmi-battery.c

-- 
2.52.0

