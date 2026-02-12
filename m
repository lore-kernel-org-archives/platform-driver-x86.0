Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369331A0712;
	Thu, 12 Feb 2026 17:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770918247; cv=none; b=kNeWZbBIfMDhMES2hPvt4Qkggs3Zt0MwZ7VPJwjv81wOLIMjZeJHip/Zor5ccGrIXoLGMgSyYwv1+XFrPUlEdTdmK3ex+FcLaS++TPeBgxdKUYsMLrGQscE4aBB0nJ35V5pegB7gchD1/qqgeyQ70xX2HpijF/49/WCjnOfqGKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770918247; c=relaxed/simple;
	bh=W848fVBUxUkD9+dH9sWyhyR2rWNENOZj0V386kT5Rgs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q33IGSJdhtTiq3Oow5FP1StLsr+kEOVcu7czwAK5jjP09/bxFlGBRPjJhzIUWr0UOhQ7j2MWIyJY+GEiUPwkuc/ZlX0aeZENmvq3YLiM+adB75ws/1QJCXM3OkbwdekzXN76oB4juhC5PuQlplFkvSerDSt57EFc549CHxp7R+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=a3kvKyz6; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="a3kvKyz6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1770918238; x=1771523038; i=w_armin@gmx.de;
	bh=l98+Z051oQ056JRu0RQelak9UkPme9dahWdqJ0EbmQA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=a3kvKyz6VhdAcFELGSYnUCBmDMoqfJIkGMXXb/FiwEvQrvOyvT2HRx5hjLoMcFdQ
	 IrJHyNJ80bFkm+cP1WE8AH0msahIbIvNqFCDz4eZuYjoLLvdwfnZTw+yk4RvwHnKg
	 +23MZ/oFsj2m+tYUSpPqtAYyNcMkQMUP0HyZslSD4Uy6kdBAyzgh0koX8K/x4RZHc
	 xKaUOyfk1p0FREWJzqetqRV9oHdMTDwnITOwoWfG+Tiew6r64tA0QkZNyyUtv5ezW
	 GTlAWCjDDstRtR1IpPSrdNkGdc3prnPdNopuv5NLizD3nWuF1yjBb8UOALIj7hkVG
	 VT/3akZVdmnRJ6LCMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgNh1-1vILy52i8F-00baZx; Thu, 12 Feb 2026 18:43:58 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] uniwill-laptop: Input-related improvements
Date: Thu, 12 Feb 2026 18:43:50 +0100
Message-Id: <20260212174355.23965-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:AIhq6U82Sdb4JffxUyrYlEcL8IAf/3eUJNrBH07LH6GDZ1hhso3
 EW6ixM6fEUU9xxseBYgQIa9QXoC0KDx981k3/ejMuGC6gZIDilBpzzahAyz5hSxvLuta6JU
 +0Cmr+GLCPTkiIj3mhnLGJr6m2kFezkL0vUvNwbH7FD79t8RkyWZwLkSi5AXVAF5DV9VWJ2
 8jJTgVyNyAXek9z5jOkrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7/4zSjthx+Q=;570FEC3bdJKxjIK91qMLTUYyQKO
 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
 u3fJ4bSdKXzuXxM3IDVfEgUcXdJuz

This patch series contains a set of input-related improvements
for the uniwill-laptop driver. The first patch renames the
"fn_lock_toggle_enable" and "super_key_toggle_enable" sysfs attributes
after it was discovered that the underlying hardware works differently
than previously thought. This technically breaks user space
applications using those sysfs attributes, but AFAIK no such users
currently exist.

The next two patches fix a potential crash and an issue with the fn
lock status not being updated when using a key combination. The
remaining patches ensure that when the users changes the fn lock
status or enables/disables the super key using a key combination, a
poll notification is being issued on the appropriate sysfs attr.

Tested on a TUXEDO InfinityBook Pro 15 Gen 10 AMD (whitelist entry
comes next).

Changes since v2:
- rename UNIWILL_OSD_SUPER_KEY_LOCK_CHANGED
- do no use UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and
  UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE events for triggering
  the poll notification

Changes since v1:
- update admin-guide for uniwill laptops
- rename UNIWILL_OSD_SUPER_KEY_LOCK_ENABLE and
  UNIWILL_OSD_SUPER_KEY_LOCK_DISABLE
- fix small issue in commit description of patch 5

Armin Wolf (5):
  platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
  platform/x86: uniwill-laptop: Fix crash on unexpected battery event
  platform/x86: uniwill-laptop: Mark FN lock status as being volatile
  platform/x86: uniwill-laptop: Handle FN lock event
  platform/x86: uniwill-laptop: Handle super key changed event

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  10 +-
 .../admin-guide/laptops/uniwill-laptop.rst    |   2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 118 ++++++++++++------
 drivers/platform/x86/uniwill/uniwill-wmi.h    |   6 +-
 4 files changed, 91 insertions(+), 45 deletions(-)

=2D-=20
2.39.5

