Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134F23644A4;
	Fri, 17 Apr 2026 05:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776402571; cv=none; b=qgoy1/XS0e6GM5N/nhgHN/ZSrwMhVi986IupbKtsj3KmZs2oo0YII8P27fZPKoIuqqqYvLDV+hm78JouH5mNnKIRp11FQqAuhsMuCNRtHQxiDgfJVeRS9RAe5Jh7ztls8OUGfLrYVYTurU0cCqEcA5lxAwhhfhDHj6YewKV0acE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776402571; c=relaxed/simple;
	bh=dkNi0LYagWoT5n76MSiyfX35Vskv8i6yh73Rko5fuOs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DYrnd0zH8kqQCkuN/tdf7On1Ao1TGDIU4I5Oxg9ng/6iSGxZlvg+krEsY8LoCSPdatnyCzK61y7w9mTj1yUquOjQJQJuFuIW8KlTIJPcn0+9ZUSjztQnEchpwbSS2j6Zb2223cuaja2A3qfrr3ZtO6IEXLyYi0i6wbVgBzq2Gnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=VsO/sOQY; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="VsO/sOQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1776402561; x=1777007361; i=w_armin@gmx.de;
	bh=nzRTAVwj4YDSYDGR14lCPK0XPMO7QPVUX09z+YtBldE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VsO/sOQYUT50vKLVSSVuEBJGoZ2lfkdv7yav+0WoLNTejznXKMr+F6wlI95HoUi4
	 XerjCRFqQYQTJsgbwVjgNjdAUpmRr6r/rXjvNuPqIBAMd4Vj44YF54KCyrzcXIj14
	 THZVi2ubL8zCeNuhfxt2BuJ73OS1E7GWXXvzIGZKjnQ1eR75u2/2TceVnGklW7YTV
	 5NYW3sc4EooNX2qBjCJtjlo9bN2Iw5Etpuq1nx7ieLS7j8Qn7lZHaYYpr7oby8DUT
	 LAjBlCugIafBkhUDqa/9G3ANHG75o6dcIHK+6eg186Y15HLeYQ7N7zO/rIiUchvIV
	 iYRY7eLsPtUifLfrqQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mi2Jt-1viPVQ16Mj-00kqLz; Fri, 17
 Apr 2026 07:09:21 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] platform/x86: uniwill-laptop: Charging-related improvements
Date: Fri, 17 Apr 2026 07:09:05 +0200
Message-Id: <20260417050912.5582-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:N1aJDCCb7RC5tlFT9njTfKqoSzS/FQg/YH0Kf2rJLwa1a9uGT/i
 GpB5M9pf1d52R/iNJINTt4LrS30AcbjfJuYmNMigtuezkPM89Eq9I10aauEnS0WsFEmd/oO
 IR1ipn/BdAcZvumFHgDbUNjgKDYsFgWSOA1Isk9Uvwl4Ifq4KzJ5koUuMRMfoL98DqivF08
 O+zptVoauzHvx9/s2RWlg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:YzZbusWXROg=;1D+oJtRUPu7SfM06yLVHyHIPPf6
 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
 298qxQpyKsjdwknQLS9xxM3oe/1oXNlg4eRM=

This patch series contains various charging-related improvements
for the uniwill-laptop driver. The first two patches fix some minor
issues inside the charging threshold code, while the third patch
fixes an issue inside the module initialization code. The next two
patches contain some preparations for the last patch. Said patch
introduces support for controlling the charging modes available
on many Uniwill-based devices not sold by Intel.

All patches have been tested on a Tuxedo InfinityBook Pro 15 Gen10 AMD
and work just fine.

I know that this series is too late for kernel 7.1, but i decided to
send it anyway to give any reviewers/testers some additional time.

Changes since v1:
- add Reviewed-by tags
- fix spelling errors
- split third patch into two separate patches
- restructure code for battery initialization

Armin Wolf (7):
  platform/x86: uniwill-laptop: Properly initialize charging threshold
  platform/x86: uniwill-laptop: Accept charging threshold of 0
  platform/x86: uniwill-laptop: Fix behavior of "force" module param
  platform/x86: uniwill-laptop: Do not enable the charging limit even
    when forced
  platform/x86: uniwill-laptop: Rework FN lock/super key suspend
    handling
  platform/x86: uniwill-laptop: Mark EC_ADDR_OEM_4 as volatile
  platform/x86: uniwill-laptop: Add support for battery charge modes

 .../admin-guide/laptops/uniwill-laptop.rst    |  25 +-
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 430 ++++++++++++++----
 drivers/platform/x86/uniwill/uniwill-wmi.c    |   5 +-
 3 files changed, 371 insertions(+), 89 deletions(-)

=2D-=20
2.39.5

