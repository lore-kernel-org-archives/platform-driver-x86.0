Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7DC22CBE6
	for <platform-driver-x86@vger.kernel.org>; Sun, 11 May 2025 11:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746963087; cv=none; b=dRX+k7nxCNJ77VT3N5mL7bBzwbJ4k18kBcR9LUeQ7doMZTAF1S/pNVbdYsfRzQo9EgxrNLtXBUy4GQORNXyk3Vn+k5YobzowS/pCk9ElPjCd/lkIbm+l8SR7qfn5sTqwuiJhKN/mVwwlF0rKEfLUGCjQSor6vbV96Wl2DYC3Fmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746963087; c=relaxed/simple;
	bh=/5EXUWr1FFm8Pz1haStJZpYnubw7kfH4l+N8XpDrm14=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FQSzpLJpahr972jDFUCKiBmrt85Xw4Z40FvQ8z4VX27X1tVaNrC9Zf4/cMT+qUMmRC2ZNuOZ+KSbhQOZvqRMXTbmdyIQfnJSfkhyuCX9n29YgFJMmNoPEvp2lp/Zxr0NjNae0eabeJsRK1ItcHyCxJm22N9aLibH8be9fNcXZMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=bQ35mech; arc=none smtp.client-ip=195.121.94.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="bQ35mech"
X-KPN-MessageId: c0e1ae70-2e5b-11f0-beb8-005056992ed3
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id c0e1ae70-2e5b-11f0-beb8-005056992ed3;
	Sun, 11 May 2025 13:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=4Ffmh2RXhvAPXueWF/TIKxmU4Dgg8hZL2FyQMqVGZLA=;
	b=bQ35mechY0SNCw3CnCVg7BbexfSSg7aAUX95cabzmUOZ/dee0Vks59Dz/mKIDbVL8DhTZXUsyZrj7
	 Pk4jX6WRM/OwtHomjV4/QFOJQeEn1l6s9z2elTh5UvEkjuBnDZjDKmZB7f4BW5I3o4Fz0spW40uQMf
	 eJZI6pdC25MOYZ70=
X-KPN-MID: 33|+3ZpXR6Y+wbL+npkpKSCtkAaFTA+wcYdbbjigcmwGYri5gk3uWZ/+h5PbJI6lQ8
 BMkZZiJBDqBBb7FtlYT0vj+CY2TfFMtWd0DNH/EjCNUk=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|p298wQe8HhNczjlNPdzreiVW4osuOCI6F+x+yMeYf6eN1ttVdcJ/Fk2T6x+nqX/
 nXgxa8R2vlSniXjc08bMVRw==
Received: from localhost.localdomain (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id 4ed5df02-2e5b-11f0-afcf-005056998788;
	Sun, 11 May 2025 13:30:14 +0200 (CEST)
From: Jelle van der Waa <jvanderw@redhat.com>
To: Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/1] platform/x86: ideapad: Expose charge_types
Date: Sun, 11 May 2025 13:30:08 +0200
Message-ID: <20250511113012.9251-1-jvanderw@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jelle van der Waa <jvanderwaa@redhat.com>

This patch depends on one commit in the for-next branch of the power-supply tree [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-power-supply.git/commit/?h=for-next&id=c1f7375a246e5f810191a6c3031d2fa2b80e9f5e

Jelle van der Waa (1):
  platform/x86: ideapad: Expose charge_types

 .../ABI/testing/sysfs-platform-ideapad-laptop |   2 +
 drivers/platform/x86/ideapad-laptop.c         | 126 +++++++++++++++++-
 2 files changed, 125 insertions(+), 3 deletions(-)

-- 
2.49.0

