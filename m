Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D984C3CA4B5;
	Tue, 28 Jul 2026 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785223150; cv=none; b=XDoCCi5pQJG7D+mI0nVW5kUhPxLFooF8WHxgj6cOLWek5fod+SpUFoALMom5KELmdEkOOniYjCPTq46dgM8T2FXDVcAX7UI9O1461s9msyFNo7ALzjc8gHy5GOIwnWl33u9IO02MZ81SVG5yW2yldwA9QlajKbN+wdxW208wjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785223150; c=relaxed/simple;
	bh=0viELelOxu4PmfgwVXnXnBJUcW7fQO8M7mFRU10cXXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jgr+JlnTUkpsQWjjA2kGgShc6TxID212LSoHmsF9vr2G5mTO0l00C/u5Md1vq3SMrjNmUL5a1m7VNv5sHQGdYSmaioWUyRaEeAj4gDhnPkMxMAv88x7TUTPDLavXUUKKWymhiv1MiZ51FA7zH2KK2fHGp3DgMJL+ghREDUXeMGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=WApuNuM+; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="WApuNuM+"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 307BE84A91;
	Tue, 28 Jul 2026 09:18:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hA5TpzkqYfQM; Tue, 28 Jul 2026 09:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1785223138; bh=0viELelOxu4PmfgwVXnXnBJUcW7fQO8M7mFRU10cXXg=;
	h=From:To:Cc:Subject:Date;
	b=WApuNuM+/PPHlH+4cE2hn5X4mAGu2b3SCwGSp7OJC7Wz2oS4o+d0tDexbrG4KKjAv
	 5wb9FHjIa2+MUx4EyPuPVYTviXkzrdEV9nyC328cWtuygdKO9HsWOkLOnx9jFAEZtw
	 IxpN/1INKYw3uEfz0HvCsQl15MKZIPyXnRNBnQssEDAxJOrc+eTpzSBXLauvlaJM4s
	 5VYs3sPtGJ5GVkohH94+JzJER3KIInTb53Sr0ixXJulEbS55P+otbQJw9IZ+Ai6dI2
	 IUAEpjq64cicTcNO4KQsOZ88ecHjiADBh1KTreABBfGYZEHEL6HcXQYBSQYR/Ee7s6
	 N7fq3HLPsFZMQ==
From: Marco Scardovi <scardracs@disroot.org>
To: platform-driver-x86@vger.kernel.org
Cc: luke@ljones.dev,
	ilpo.jarvinen@linux.intel.com,
	hansg@kernel.org,
	corentin.chary@gmail.com,
	denis.benato@linux.dev,
	linux-kernel@vger.kernel.org,
	Marco Scardovi <scardracs@disroot.org>
Subject: [PATCH 0/2] platform/x86: asus-armoury: add Whisper Mode support
Date: Tue, 28 Jul 2026 09:18:37 +0200
Message-ID: <20260728071843.130492-1-scardracs@disroot.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series introduces support for ASUS WMI Whisper Mode hardware controls
in the asus-wmi header and asus-armoury driver.

Background & Findings:
----------------------
After talking with Denis and thanks to NeuroMarshal reverse engineering and
firmware trace analysis on modern ASUS laptops, three specific WMI Device IDs
were identified that manage acoustic profiles and thermal regulation under
ASUS Whisper Mode:

1. ASUS_WMI_DEVID_WHISPER_MODE (0x0012007A):
   - Controls the BIOS-level Whisper Mode acoustic profile toggle (read/write boolean).
2. ASUS_WMI_DEVID_WHISPER_ENABLE (0x00090022):
   - Enables or disables Dynamic Whisper acoustic regulation (read/write boolean).
3. ASUS_WMI_DEVID_WHISPER_STATUS (0x00090023):
   - Reports status and allows runtime control over Dynamic Whisper state (read/write boolean).

Series Overview:
----------------
- Patch 1/2: Adds WMI Device ID macro definitions to
  include/linux/platform_data/x86/asus-wmi.h.
- Patch 2/2: Exposes whisper_mode, whisper_enable, and whisper_status sysfs
  attribute groups in drivers/platform/x86/asus-armoury.c.

Safety & Compatibility:
-----------------------
All newly introduced attributes are probed via armoury_has_devstate() before
sysfs registration. On devices where these WMI methods are not implemented by
firmware, the sysfs nodes are gracefully omitted without impacting existing
attributes or functionality.

Validation:
-----------
- Build verification against linux-next cleanly with zero warnings or errors.
- Coding style and formatting verified via git diff --check.

Note:
-----------
Unfortunately, due to it being missing on my laptop, I'm not able to verify
if the WhisperMode works as intended. The values are the same reported by
NeuroMarshal on his reverse engineering of Armoury Crate [1] so they *should*
work.

[1] https://github.com/NeuroMarshal/armoury-linux-probe

Marco Scardovi (2):
  platform/x86: asus-wmi: add Whisper Mode WMI device ID defines
  platform/x86: asus-armoury: add Whisper Mode attributes

 drivers/platform/x86/asus-armoury.c        | 14 ++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  5 +++++
 2 files changed, 19 insertions(+)

-- 
2.55.0
