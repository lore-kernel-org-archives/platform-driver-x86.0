Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE311E89C
	for <platform-driver-x86@vger.kernel.org>; Tue, 10 Feb 2026 00:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770681671; cv=none; b=M5z6fBpBKcc4i0DI2V0MXnCoG2kMcZqsiM8Tg051Y7u/m8FcU9Wo9vw9CpZH/BtJDIo1z/yIDnhLmijqCbuMeUnAU/yIGrV8fqgPv8jGCVEgjwP2YLS0ATuWX3OsdIQhzqkfwwTNIbyUEwvz8dtc9Y2f7lsctF4G+HdcDSO7Pmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770681671; c=relaxed/simple;
	bh=swnMOuokBgdfc8xuwFWJzIUkyKnARUrXll2N6kNyugY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZO9HiNk1I/nPEHQVSfOlrG3+cxTHoZAHdjl5TjUyC6kKGUDoVxXZip8MXucbQNm2c+fMJACSAg+cFGV7W4/SLuY1HXOQfXbmg4KRIYFPwUjpjKB0md6liBMYrAYWeQs6siTnKvpn3XYEiVBdKA75F9fJmHye2YOW0E4xt0t7ut0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=FpnH0X1g; arc=none smtp.client-ip=109.224.244.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="FpnH0X1g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1770681658; x=1770940858;
	bh=Zrg0+Of9LG4+hPfONAJEGlVfjk4ItTHSgygsTs9+1VQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FpnH0X1gDP+2vUIwnUTq4JbiIBCWIUFEcujyTtuEZ1TzXkE0D36Yx0cQOPq7Dk/Ld
	 HS4Z1JWvTJ0gm2vpJxi6yf3pJ0c5rneRITOB9NJdNtxqC7MK5lOhBeqj50GOLKWZdf
	 W/cWmVnkDR2lzADabj7Eu8jYb6ivZ79LJdIQN5lDo+PXrMc/0VK0klgMg9nc9eoUVO
	 210IgQdrcKSal0uhXLIiGNU09+kwWJBIlZf2OpeCguS17yrxptb+M35z8d+andt5QC
	 tXdViMopVD2mhM9ybL9dKTKEhiyTTV6nj3oXkTMCcy2jtRXYpl1gvOAQ5vzeYV2ayx
	 P+CCxU5JVW5zg==
Date: Tue, 10 Feb 2026 00:00:52 +0000
To: Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Victor Lattaro Volpini <victorlattaro@proton.me>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Victor Lattaro Volpini <victorlattaro@proton.me>
Subject: [PATCH] platform/x86: hp-wmi: Add Victus 16-d0xxx support
Message-ID: <20260210000048.250280-1-victorlattaro@proton.me>
Feedback-ID: 124909426:user:proton
X-Pm-Message-ID: a93cef06e0225a84e2849016587fd8d24402def1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch enables Victus thermal profile support for the HP
Victus 16-d0xxx. It does so by adding model's DMI board name 88F8 to
victus_thermal_profile_boards.

Tested on a Victus 16-d0xxx:
  - Victus thermal profile choices available (quiet, balanced, performance)
    instead of the default ones (cool, quiet, balanced, performance);
  - Profile switching works correctly;
  - About 4% increase in FPS using benchmark Cyberpunk 2077 on
  performance profile;
  - No noticeable regressions.

Signed-off-by: Victor Lattaro Volpini <victorlattaro@proton.me>
---
 drivers/platform/x86/hp/hp-wmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-=
wmi.c
index f4ea1ea05997..837c7024be9e 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -93,9 +93,9 @@ static const char * const omen_timed_thermal_profile_boar=
ds[] =3D {
 =09"8BAD",
 };
=20
-/* DMI Board names of Victus 16-d1xxx laptops */
+/* DMI Board names of Victus 16-d laptops */
 static const char * const victus_thermal_profile_boards[] =3D {
-=09"8A25",
+=09"88F8", "8A25",
 };
=20
 /* DMI Board names of Victus 16-r and Victus 16-s laptops */
--=20
2.43.0


