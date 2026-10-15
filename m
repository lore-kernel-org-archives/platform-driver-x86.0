Received: from mta0.migadu.com (out-120.mta0.migadu.com [91.218.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5826930F7EA
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 22:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102281; cv=none; b=MlAbR9RC+yxyOrLQKZujxgJwgXU3ra5lxSbDCZxuDZ/ZHKpPPmB1C6Zex4gM/VXvyhNlCC/UHMFMIavKCAQT88z8SmwJqA2VHHAke0osY5Rr7w7rs46lKgVtwDj34FipJ0WvkGTnk2XdSYcqMS+kq0pHo/Y7oTac68cXFj5roeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102281; c=relaxed/simple;
	bh=R1tfR9/yrN5LRHZgZviBQJwBqmbhhvpv5YyAbXgiRDo=;
	h=Message-ID:From:Date:Subject:To:Cc; b=X+Q+X27Jltp58NT3BeMJBI4eNtofP2vGrNCcfx7f+6Fl3nEn4OOwNaPSf/x7H07mSiros4ccmn3btESd3XVjPdUQ/8WT9JxU3RcnxJVwQw/7jrIcJPLFRrLTQIkklhW5PQvjL1392K9Yz4UECNRJLKWCUuHjU1VBJC4f/6huhao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev; spf=pass smtp.mailfrom=smmh.dev; dkim=pass (2048-bit key) header.d=smmh.dev header.i=@smmh.dev header.b=ZNGyJQFY; arc=none smtp.client-ip=91.218.175.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smmh.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smmh.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smmh.dev header.i=@smmh.dev header.b="ZNGyJQFY"
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=R1tfR9/yrN5LRHZgZviBQJwBqmbhhvpv5YyAbXgiRDo=;
 c=simple/simple; d=smmh.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792102274; v=1; x=1792707074;
 b=ZNGyJQFYOjRy9oKXPTj1sezbOuFOLSY7ZigNiLeyGpONwD+q4TaM9o+wxpVOLSg83SRtFDwI
 mKJwyZQpSe3p2s0liK2ezfXKt1ZyC5TBcVd9dRwpMSHCcT0qRzPGWByAsVx9nHm2YsdauHsxRAc
 XMF9QpI2enhHYgt8+GMGiK2EDN3bI2wn9De9dRgF4Yr0IKMG/X7QL31YM8v01YWjVmIjYuJNmuh
 xOaqvDAb18yAdm/PZBHGOlnmzIHD88RAxsXTcUhA7uZzxf7ZsoLeIkOzoIE+6bJgpmBRWCc+Mz7
 aWaBE5UjjgY1JoOX4IfgWAqAn+GUZuTy4eO1h2zIWKwJQ==
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 782b3f0c7a015416;
	Thu, 15 Oct 2026 22:11:13 +0000
X-Mizu-Trace-ID: 782b3f0c7a015416
X-Migadu-Flow: FLOW_OUT
Message-ID: <cover.1791672579.git.i@smmh.dev>
From: Seyed Mohammad Mahdi Hosseini <i@smmh.dev>
Date: Fri, 16 Oct 2026 00:10:53 +0200
Subject: [PATCH 0/2] platform/x86: asus-nb-wmi: Ignore events 0xE5 and 0x4F
To: Hans de Goede <hansg@kernel.org>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Corentin Chary <corentin.chary@gmail.com>,
 "Luke D. Jones" <luke@ljones.dev>,
 Denis Benato <denis.benato@linux.dev>,
 platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>

On the ASUS TUF Gaming A15 FA507RF (BIOS FA507RF.306), two WMI events
reach asus-nb-wmi without a keymap entry, so asus-wmi logs
"Unknown key code" for each and reports KEY_UNKNOWN on the "Asus WMI
hotkeys" input device:

- 0xE5 arrives about every 10 seconds, for many hours at a time, while
  the laptop is on AC power, with nobody touching the keyboard. Desktops
  take each KEY_UNKNOWN as user activity, so the lock screen keeps
  waking up. Patch 1 ignores it.

- 0x4F arrives when Fn+Windows is pressed. The firmware toggles the
  Windows key lock by itself; the event only notifies, and nothing in
  the kernel needs to act on it. Patch 2 ignores it.

Both follow the existing KE_IGNORE entries (0xC6, 0xCF, 0x7B).

Patch 1 overlaps with "platform/x86: asus-nb-wmi: Ignore spurious 0xe5
events on GU605MY" by Evgeny Volferts
(https://patchwork.kernel.org/project/platform-driver-x86/patch/20261015163029.107250-1-eugene.wolferz@gmail.com/),
which ignores 0xE5 through a DMI quirk for the ROG Zephyrus G16 GU605MY
only. The same event, at the same period, also shows up on this TUF
FA507RF, and users report it on the TUF F15 FX506HE and the TUF A17
(https://bbs.archlinux.org/viewtopic.php?id=305063) and on a Zenbook
(https://forum.manjaro.org/t/kernel-error-message-0xe5/157745). No ASUS
model maps 0xE5 to a key, so patch 1 ignores it in the shared keymap
for every model, the way 0xCF was handled. If a per-model quirk is
preferred, I can send a version adding the FA507RF to that patch's
quirk instead.

Seyed Mohammad Mahdi Hosseini (2):
  platform/x86: asus-nb-wmi: Ignore unknown event 0xE5
  platform/x86: asus-nb-wmi: Ignore Windows key lock event 0x4F

 drivers/platform/x86/asus-nb-wmi.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.55.0
