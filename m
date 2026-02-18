Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E4827CCF2;
	Wed, 18 Feb 2026 00:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771375876; cv=none; b=q0/ujpgjcSMVWDZiNOQCihLoElAXvpE2qZ2/f4nmKyXsW6sS3vbqnMW21Uv+tTVQyz+t59z1A8LBe6WazbzYp8dIu9a6fd4diiWqTXJbYER6ue23xSW5g/+ctYIhxzZgoSA9mJgmAYCyqOTMdpgztbCJcOlLfY6GTpnryqARFBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771375876; c=relaxed/simple;
	bh=ObXh5AEOUzkdNQ9P7IhnCn2mxjTXn2eO//KwwY1mnyU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sE+A0kHCAoUGdSCGK5ufteQPAA0aU7wXGlsCZTtDt4HvQjHg5G0SCs34DovBjTkxhbIJdBB95zCikuIZJ/5WMJzthDVD1v7en4pxNWRLOll7b3oGeP9dQsB4golpmV6e9pnu03FTqKnZ9/WHAKjosb+MIG2NKXh+MuMWmqz+tiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FPVo/3+6; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FPVo/3+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1771375871; x=1771980671; i=w_armin@gmx.de;
	bh=c35sHtFk896LRmru1C45VcR7NTytu6kczMKAnJg8wwk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=FPVo/3+6NPwgaWBGO7EBKKdJ6l+8JFQsMQnq/mdB4ix5A3x9K5o36OYa1cUfhxVg
	 VZff4pLmcXVk79qwRZKGpKL7atokX4nGl8yWap4EOBcbftc6nAMXTijoN0Mt6En0O
	 mjDx7KBSp603CteoDgpxs2JrQ6GPP3jk/J8L68KnXuHIFs4D7qfxic/JtYV852eQ5
	 IMLUYNAnrAwkvSLJ8/2z2xE/YJJjUBB8ARAVuX+d5NVN6+mqxnjomA5ff/KOlBNit
	 ZB54YY3VB1oFtxmnWVgrPRFmbWMcIyKs3J2REIK1STq79Z1bTgcRQ1K3CySVFJJh5
	 /SFZcs6y9f55jZ3YPQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([93.202.242.224]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MqJmF-1vOBED3Bdj-00ZfoX; Wed, 18 Feb 2026 01:51:11 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/4] uniwill-laptop: Input-related improvements
Date: Wed, 18 Feb 2026 01:50:57 +0100
Message-Id: <20260218005101.73680-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k9HtO7+LNFUCc44pXw8D6w2ICSIl1CXXA3nfIDzeT/mTfAr1Gmk
 QWo2CJH7u/HGX06s51q2jcDZUDEUp8YvAZ2YssxpdnqXlNgu+EUemSOXBmpzzEuAeboBB8L
 UxIMaIogp4rXW3CxraVp2YLHsj82NiDgArpRGxTtcyy/JrkYkAFBoszLYbe7SMU8qOSkdED
 E5yXXHLdOyH2LogsYCTJg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nH2fb8Ra8Ak=;vGuNBrVrrHZqOvp8MFhychOZUet
 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
 4FDfnZOQ=

This patch series contains a set of input-related improvements
for the uniwill-laptop driver. The first patch renames the
"fn_lock_toggle_enable" and "super_key_toggle_enable" sysfs attributes
after it was discovered that the underlying hardware works differently
than previously thought. This technically breaks user space
applications using those sysfs attributes, but AFAIK no such users
currently exist.

The next two patches fix a potential crash and an issue with the fn
lock status not being updated when using a key combination. The
remaining patch ensurea that when the users changes the fn lock
status using a key combination, a poll notification is being issued
on the appropriate sysfs attr.

Tested on a TUXEDO InfinityBook Pro 15 Gen 10 AMD (whitelist entry
comes next).

Changes since v3:
- drop last patch, because it turned out that all super key events
  are also send by the EC when the super key is enabled/disabled
  using the sysfs attribute

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

Armin Wolf (4):
  platform/x86: uniwill-laptop: Rename FN lock and super key lock attrs
  platform/x86: uniwill-laptop: Fix crash on unexpected battery event
  platform/x86: uniwill-laptop: Mark FN lock status as being volatile
  platform/x86: uniwill-laptop: Handle FN lock event

 .../ABI/testing/sysfs-driver-uniwill-laptop   |  10 +-
 .../admin-guide/laptops/uniwill-laptop.rst    |   2 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 110 ++++++++++++------
 drivers/platform/x86/uniwill/uniwill-wmi.h    |   6 +-
 4 files changed, 84 insertions(+), 44 deletions(-)

=2D-=20
2.39.5

