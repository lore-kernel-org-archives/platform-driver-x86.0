Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F035934F49F;
	Wed,  5 Aug 2026 18:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785954718; cv=none; b=UYadzVpP0xEeo1m1ttqoGW+6/XXiMqfdc/U9PwleTkE0o3fAUxWPj/CjhF5WR/Ar/SL+qEyW9zipAdkukalvKxcUgepx60kRtNiy+VPUNQeMA0+4bhtqNPnaEzANq+60385fDVEIxEIl4NsGkBNkm2kNOcIm2QXEYdL3ifTrSKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785954718; c=relaxed/simple;
	bh=zqnqbLbVV6qrv+T/Db1XFaPy6nbsEstF5Deg3B4NsM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BkB+vvH5/zouMaz4kA5vAXfKcq/hOvWeWIXHtQct5Ip1C1cEJiyBzwChn+gVQHRU0yenq+hqLRh5nQz6cNXu1dNULml4iWKDi4iruZDnBF0i348MDo149t6WCtLs0Th9rW8FsFkY6/TjPdnWTHyyxe/I4GcV59IzAjNMOuomCEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=j9rzVKWh; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="j9rzVKWh"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6871E83F5A;
	Wed, 05 Aug 2026 20:31:47 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IFnoSSGFRYQr; Wed,  5 Aug 2026 20:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785954706; bh=zqnqbLbVV6qrv+T/Db1XFaPy6nbsEstF5Deg3B4NsM8=;
	h=From:To:Cc:Subject:Date;
	b=j9rzVKWh2VVGQUK2AOyqhgLDbm7+ANMEzXMGsu5yNuEOIWXqujeWmL97sOSC9ysNj
	 +cYy2WuMXdoYG6opKolyZfraBRlxBc8t70ziFFTL1o2RF4T3tXreEAmdEqi0/xxq8b
	 ETMlt+PlTCNv4O0nBuHVsOW65bWpcMr5fvlAm2lBw97sfKdWfTwJ4nmNrP50eOBriu
	 HtxJOccGdOLTcsmd6EbvQukdjonhZe7BdUXT+tyvPX/pCXuqGYDJ6HswleC1R7Ycu4
	 nEn6MEPEkBclCvR8wSzYpLNyLoWXO3Q5ZSdT2gIKyrgDET6Y+S35vLs9xidoE/ZDI7
	 C0nZ2Qrpc2Pdg==
From: Marco Scardovi <scardracs@disroot.org>
To: Corentin Chary <corentin.chary@gmail.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Denis Benato <denis.benato@linux.dev>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 0/3] platform/x86: asus-armoury: Add dgpu_power_state and check in dgpu_disable
Date: Wed,  5 Aug 2026 20:28:05 +0200
Message-ID: <20260805183131.3075-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds support for WMI device ID 0x00120097
(ASUS_WMI_DEVID_DGPU_POWER_STATE) to query the power state level of the
discrete GPU (dGPU) on ASUS ROG laptops, and uses it to prevent disabling
the dGPU while it is in active use.

--- Background & How it Works ---

Modern ASUS ROG firmware provides WMI device ID 0x00120097 in the ACPI DSTS
evaluation method:

If ((IIA0 == 0x00120097))
{
  Return (0x00010000)
}

When queried, DSTS returns:
  - Bit 16 (0x00010000): Presence bit (set when supported by ACPI).
  - Bit 0  (0x00000001): Power state status:
      * 0: D3 cold (off / suspended)
      * 1: D0 (active / powered on)

--- Patch Series Summary ---

- Patch 1/3: Defines ASUS_WMI_DEVID_DGPU_POWER_STATE (0x00120097) in
  include/linux/platform_data/x86/asus-wmi.h.
- Patch 2/3: Registers the read-only sysfs attribute 'dgpu_power_state' in
  drivers/platform/x86/asus-armoury.c under firmware_attributes class.
- Patch 3/3: Consolidates dgpu_disable checks under a single 'if (disable)'
  block and returns -EBUSY if an attempt is made to disable the dGPU while active.

--- Testing ---

Verified on ASUS ROG G614PR hardware:
- Reading 'current_value' returns 0 when the dGPU is suspended in D3 cold,
  and 1 when active in D0.
- Attempting to disable the dGPU while in use returns -EBUSY.

Suggested-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Marco Scardovi <scardracs@disroot.org>

Marco Scardovi (3):
  platform/x86: asus-wmi: Add ASUS_WMI_DEVID_DGPU_POWER_STATE define
  platform/x86: asus-armoury: Add dgpu_power_state attribute
  platform/x86: asus-armoury: Prevent disabling dGPU when in use

 drivers/platform/x86/asus-armoury.c        | 29 ++++++++++++++++------
 include/linux/platform_data/x86/asus-wmi.h |  3 ++-
 2 files changed, 24 insertions(+), 8 deletions(-)

-- 
2.55.0
