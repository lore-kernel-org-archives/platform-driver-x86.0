Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6F53D5C26;
	Fri, 28 Aug 2026 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787915574; cv=none; b=oXxqqSr5mv5hVedbhlbcnVkPwyNLxWpaKu8LwFJ9Kt/M2ztqexRM0mS8ZzaGgiMa3XiEIac1mv44mu4J3I8qsipcZML2pBmMXDzy/up6iyWR7zShoGYxWa/2whCkGKVqEMDAVz2WxdieWa545kKwiv8URqWIpUULhmeO9UsG93c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787915574; c=relaxed/simple;
	bh=XRNRnn6ZgGLq0POn1DXj2cJ8HHP1EG+gXtgTYdBgbUk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h3U5YLqJtwIyIdcvm/WgK4csPs0QQgXjPixbvWM/yqoT/BX4mx3oyrfCo0+MrpkX3IxEZCn5PoRMyJMITIvK3zkFKmEs1odK9shhfhhLDDN1XMcLX/pqp2e9HRvkGQo8gEdBR/cylS6SmjgSFfEzD2N75k8G+skEX8flJlcUwgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev; spf=pass smtp.mailfrom=ghoul.dev; dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b=dBfr4OMp; arc=none smtp.client-ip=109.224.244.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghoul.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ghoul.dev header.i=@ghoul.dev header.b="dBfr4OMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ghoul.dev;
	s=protonmail2; t=1787915567; x=1788174767;
	bh=rg8uEe+wufGfVbU5+LcXju5ksUhut0OdZlsoESe3gbg=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=dBfr4OMp6du5FUGptXL1W91y7zv6pfo5tGugkq1dY47Vufjs12T4Po8wiNJZAfYgf
	 EfFnhoH5gNjzkUe+1P0YGReGXRWc6V2tjDkSoy+obeU6u+6mnEmqYBL0weW8LfM6xK
	 JnbV//8mgVNnqTYGZF9R/RfOZxJ/Vk3G+QWfmUN1CaBYEWiI/M7LfZjtynPuBMCjEh
	 xDB9Lwlly40ykLnJemeu5x0pLcpPKwU+h1rOzIAX5BYUM+A95jGchJTESiyBgU/5pK
	 NgSYRFoJfzkaDzSa18nfB6E+KqXZfZiBMDcZ7i/GS5ecJGzF0qpEykmch0WPE6OzCr
	 0sMXXaa6Pv9Sg==
Date: Fri, 28 Aug 2026 11:12:40 +0000
To: =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>
From: Ahmed Yaseen <yaseen@ghoul.dev>
Cc: Mario Limonciello <mario.limonciello@amd.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Ahmed Yaseen <yaseen@ghoul.dev>
Subject: [PATCH 0/2] platform/x86: asus-armoury: fix notifications for grouped attributes
Message-ID: <20260828111232.74443-1-yaseen@ghoul.dev>
Feedback-ID: 177610485:user:proton
X-Pm-Message-ID: 5bc87fb10b586217d12de0de85fab7d755aac6b3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Both fixes are the same mistake: the code identifies an attribute by
attr->attr.name, but callers always pass a current_value attribute, and
that name is always "current_value". sysfs_notify() therefore resolves
nothing, and asus_bios_requires_reboot() never matches.

Patch 1 threads the group name down to the notify calls; patch 2 uses
it for the reboot check, so it needs patch 1.

Ahmed Yaseen (2):
  platform/x86: asus-armoury: fix sysfs_notify() of grouped attributes
  platform/x86: asus-armoury: fix pending_reboot for grouped attributes

 drivers/platform/x86/asus-armoury.c | 23 ++++++++++++-----------
 drivers/platform/x86/asus-armoury.h | 16 +++++++++-------
 2 files changed, 21 insertions(+), 18 deletions(-)


base-commit: e6664f2b33db9b6811eb4cec109f06cb2b4f458d
--=20
2.55.0


