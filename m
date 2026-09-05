Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BB8356766;
	Sat,  5 Sep 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788613316; cv=none; b=fzFESLHpjXl4bAU0d6vw2Ndc3RKocxDF++uIQjdHkOkZxJG5faz75iKS38Y0bQ1WNHv5HxsFSxolUjIE/dPBr+EiiuxQvrhzpsKQU4s7kzBihcDVfxbQYnSWSt1b6bK0mSmTNRIxyzpFyEb6DhgSPHtcOYi6RVZbELX5WBaNm4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788613316; c=relaxed/simple;
	bh=6qdpqq9TjBRkgvDvSsLtlR6jvDgmjHBC4VJKoRx08UU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JekzZ8152Mj1DHbP2pu3zenQ+C8knYLfRVb/+/2ZLd9NIVJ0TlusnOp0jcXYPeo2iG2fQut59BKS7UX1LJdFll0NhtxXb1160VEqioWhn7qSBlTVov9SdomWfdF/amiD51rM9I4TzXzSLo1l2jiukifZ90qY2JCclxLyNKmmwK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=duBfEN1/; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="duBfEN1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1788613301; x=1789218101; i=w_armin@gmx.de;
	bh=OdKMYMa5WZ/PlJhgBne3tnqq+/5WAs+gxLrYV4bXLn0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=duBfEN1/XJC8Uy9fysSgEKb5xF7wkGO4gvkpnijGwVph5ezsgYkVHRYTkdvfnpg+
	 zOK5NA7R7uT38MgVlzf7JlmSMla56PJ3zr+u1wne5J8f30EFnV12bwdw6VZL6KuIN
	 YT8WhdvWCR5heI01yxt07HCwWkhVNRv57EH5PU2UddCBN/DhyvYMUE+k4IW2y1TYq
	 han4T/pVtgQOxDgqYJl9eHM/ChsDI3ERGlDGzxl3HAM+G7FF5jDP1V9LiEMh3BTE+
	 +r7SXOZDKSrhwZdHl/cPnt+UZjrQHlWbvF7zozKv9ZQ0lpd3p1KLdmb0vvQsahHKs
	 KkvfZTJ3my+8e+vnyQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1wZbGy33BF-00je6S; Sat, 05
 Sep 2026 15:01:41 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] platform/x86: uniwill-laptop: Lightbar fixes
Date: Sat,  5 Sep 2026 15:01:33 +0200
Message-Id: <20260905130138.6814-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XLFQ8nWTtNsY8+Qfd53TEaLa+dQL/a0hgebg7WpvYDgBxfGa4pf
 45hEV1nhLrJn5St6Y+wDXL8eYeNWgZJKzYUkjR6DHMAnTsXxYoAy1H+iZUc0l2ILkuL/UTZ
 azF3Qo4M7cn1hViSetHdibr+c/M7OnPnvDiwBTc13ei5YufqaxAHq2ogM+r2z4VuSJCED+Y
 1uu5edbnBj50E/3IjamsA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MrnNPzIGBTw=;AHwrOjRPI9loORGoP24HbevZcS9
 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
 WtiUT1pgE9pcd7BqexI4QjhC/odBZNj

This patch series mainly deals with various issues inside the code
responsible for controlling the lightbar on supported devices.

The first patch utilizes the improved multicolor LED API to report
the correct brightness of the lightbar to userspace. The next two
patches fix issues discovered inside the code for controlling
animations, while the fourth patch fixes an issue with the naming
of the LEDs in general. The last patch also adds support for another
variant of the Intel NUC x15 laptop kit.

All patches have been tested on said Intel NUC x15 laptop and appear
to work.

Armin Wolf (5):
  platform/x86: uniwill-laptop: Report correct lightbar brightness
  platform/x86: uniwill-laptop: Implement rainbow animation as trigger
  platform/x86: uniwill-laptop: Fix breathing animation on Intel QC
  platform/x86: uniwill-laptop: Label multicolor LEDs correctly
  platform/x86: uniwill-laptop: Extend support for the Intel NUC x15

 .../ABI/removed/sysfs-driver-uniwill-laptop   |  10 +
 .../ABI/testing/sysfs-driver-uniwill-laptop   |  15 +-
 .../admin-guide/laptops/uniwill-laptop.rst    |   9 +-
 MAINTAINERS                                   |   1 +
 drivers/platform/x86/uniwill/Kconfig          |   1 +
 drivers/platform/x86/uniwill/uniwill-acpi.c   | 225 +++++++++++-------
 6 files changed, 161 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/ABI/removed/sysfs-driver-uniwill-laptop

=2D-=20
2.39.5

