Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84FB1F16B
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 May 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125586; cv=none; b=OPAoasUyj9YDb5b5r1tr+q+RacEHCQgJLj+nfTcb/HyDsmrVRS5tmB7ln5Xg8imsgjgCs7SBB/kUSuCJRWOh2eZ4wEHP4nJ40rJlES5rn1QE79vb7NibxiaUl0W31SlMgzWJa5Dz6hBoGvHvaMbWJI3+fqNuuSynCYrXSq4Jq+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125586; c=relaxed/simple;
	bh=azDXF5gy4kxP7i6feo2Dd0RpIXQcFAyR1BUM6fxRY54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POV6MeTrnbKdoGPToRB6z5m6nwVECOQhTYmJAf53Ntq8dFo3+quD/OtEmLxbt6c8Z+3qPXsfVh3ocKemQAJInhR9fwomiNkXnG+DwZlUsa5CqK/SGpBXC0SBglDhFIozks79HKAHciBsC6qSUDyasmya5dbGeJObCrA1anAYRsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=fail smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b=bjI43QYu; arc=none smtp.client-ip=195.121.94.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=kpnmail.nl header.i=@kpnmail.nl header.b="bjI43QYu"
X-KPN-MessageId: c43e5ad6-2fd5-11f0-8ec8-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.5])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id c43e5ad6-2fd5-11f0-8ec8-005056994fde;
	Tue, 13 May 2025 10:39:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kpnmail.nl; s=kpnmail01;
	h=mime-version:message-id:date:subject:to:from;
	bh=hWwVmCiZEZ0qJsimjJ5NhwCBs4qi3v0jihbbATiZXIk=;
	b=bjI43QYuBqFDDvjrgRa1NPNW5k9VqBtlNqOeB+toUDHuOPryL9f3FK92zDw0Lmvad+auRY1dexXIX
	 9ele3g5R9aL57+hmy5VS5UXcnsDuUMZs9ftuJqJJIIUzXMQEQPsTwniUjeY9EUHxjB9CsCTnWa6glq
	 J1/D2QBKjqlONOJw=
X-KPN-MID: 33|JFFgwECineRuhPzshVuBXu8tRX9i22kSkwnhFkioGZ/tXLoUSlNlp/bahs4BB/e
 0+i3h5AhWmrdXs/f/Q6gS7D7WSbPqnyRad6swaDd8k7I=
X-KPN-VerifiedSender: No
X-CMASSUN: 33|5oHaElPPWU0YLniFg9l9BpE4WWie8J5NdvM6RRV9VBFjjMmZwK8OcjHEevOcUxZ
 d/5tESQvdpvuQiclPkgGqZg==
Received: from localhost.localdomain (77-171-66-179.fixed.kpn.net [77.171.66.179])
	by smtp.kpnmail.nl (Halon) with ESMTPSA
	id a751ed6f-2fd5-11f0-9dc1-00505699b758;
	Tue, 13 May 2025 10:38:33 +0200 (CEST)
From: Jelle van der Waa <jvanderw@redhat.com>
To: Ike Panhc <ikepanhc@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jelle van der Waa <jvanderwaa@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/1] platform/x86: ideapad: Expose charge_types
Date: Tue, 13 May 2025 10:38:13 +0200
Message-ID: <20250513083816.461771-1-jvanderw@redhat.com>
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

 .../obsolete/sysfs-platform-ideapad-laptop    |   8 ++
 .../ABI/testing/sysfs-platform-ideapad-laptop |   9 --
 drivers/platform/x86/Kconfig                  |   1 +
 drivers/platform/x86/ideapad-laptop.c         | 110 +++++++++++++++++-
 4 files changed, 116 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop

-- 
2.49.0

