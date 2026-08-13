Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8D43B6348
	for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 22:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786659473; cv=none; b=QG/4d2JMsSDai1I3qEBU0unZNfSLLIJzte4EadmKmNWZCSECS1p2YtCl/SOMvlYeazGO8S3ncZSkAo28GN9nQO8j06CCCts/SotbWh+YWhUOtX+5PwYLcsuKv4QHY4FZ11HKOZr72PC7apjV6fprMKb27O2C56skLvp2mb4LOog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786659473; c=relaxed/simple;
	bh=TA2JFuIy/fuSlYx4xuT7o/z/Lw0EPN0pp1ZHO+tJAZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LdpcvK/7BOUJJHoyumdzx7B0WJDdY0TtcgFBTelzSqU35/lE1lkMEeOcJ3vBCaVwcrsNo4g2pnsSPeYFI+lWHh9OHaHe6Kyoz050XuMeUFscrJlst9jJiKTW3dGplEq1Lev114XC0ea+8BN2LvfKgK23lK1jWkzMKhPJJ3WY83g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebgyOAz5; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebgyOAz5"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc891373e0so6583665ad.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Aug 2026 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786659471; x=1787264271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KekC4GuPmwV8Nnpa9b5NSEKgqsHC/WYKFKjjf0H4XNY=;
        b=ebgyOAz5VUfCGqoMeBh7pgGMedLQ7DnTKVQhN4QFK0t/MGiiNMhXa15BPy0Mlq2eBl
         EZcscgNdIpx74lob5ngQteChxT0uxk/UgR9MBvap4aXSeljZgmh/qZ2No9MXQ9/8HSh4
         N2jKvGjKOQWRWOlymp48y1TVszAvqcFYVMO4H6ZMqfbGbQXNabyrh7rwWQKjjVNXvHLK
         AtYh8V94NaaGZlrbeyAu5OTFCIgI0WZzzxTrBjw41IYleoqrL1uhg9Z3IBDNdqTbvK6B
         bYU/1w57Dv6vP34mHOYOgmDeC0wptN2P6CaGjXhhcexqnDvMj1X4PVx/waT2AYwaMesQ
         9mkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786659471; x=1787264271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KekC4GuPmwV8Nnpa9b5NSEKgqsHC/WYKFKjjf0H4XNY=;
        b=jFoIv0uW0wgOu3kyM0aEYEfsZ9dQ3CCk5pyzwIcryD3UDBirvybD0CSaXUfM5rFeeC
         aJ9jL6xgbr/yDiGWg/GSpvmUN/0VU6ZlNEjGPlsL8YZIUFmIpQMkLwteU3ihRDMGjkV2
         tRo66PAmnYT8X9lGxz5s1lFUcFNhi4JqwjZNXK8GFBiE5fraQkleR++/f2tz7ZicIYxW
         cW/I7Z/CwPoMnWIE2EvHi3ZeWafISlF3QsExzCu+5okC94ILA/exCWoM/RtljK4sGdLX
         VfRSx+2+J+pp3PipbDeve9dkTvTSnx79hL63r04n2uPEnvyihfYC0RN+WzNuv5PHg5DJ
         3gvA==
X-Gm-Message-State: AOJu0YwlsahHJZ5wzbxo1vv8BTHggWMSQVZV8MTl/PQteeBsJl1/bCQR
	Lzbw0LCY4uLb8E9lIlre0zVF4vNx+BplKoCatz1rttPJnCrZfaCcveLP
X-Gm-Gg: AR+sD12t5PVDQnsitmEpXLIVtR+8N3C9ksDi3aeWhu9Tok/PqLEQOYW3UubmViwFLE/
	wwGFmSDueFdXuSGvTdPHNYu+TrCtE0J6yfwbbL3PjNtpT/HEdYDKrfj+exJxFyh0rCjrMYbD5gK
	I1RFjJRtbB/0Lfsc3Jnuju4dfm60yNR79gPzNobboVJh3RbOz6m9/H1sBJQKZNOFyV9GBeyC/Im
	xdIcA7ZHTWuuADO7Aa7mdaz52CeOR+VdLoeVSjJFEm6yEes8qg0KcrSORx1LCvEJTqLp96bREi+
	HcRaVEABrQ9BQ5y3UZHa8pUrJz3n4xNwReAe+iCQWwkwwxXLwynM23olBEQQkzbpzsgqgDfmGQd
	uQK7sjEsCGTtBR9bOQDXIX+i391pqhkzmofWUzGPpdfRs0FMrvKsQTsNr68ggbrz1zama2QxYan
	rvA87XIP9k6jNp73mWzkhhU8gZUW0BEpmIDJ7hSHbUVFgw3oQTC0VgzC3otj1K8CkbUfsHjVPEH
	Crxs6ZvkX32M7laqse/4MUMk7VTqw==
X-Received: by 2002:a05:6a21:600e:b0:3cb:b2e6:9032 with SMTP id adf61e73a8af0-3cc71d55f44mr1074965637.8.1786659470553;
        Thu, 13 Aug 2026 15:17:50 -0700 (PDT)
Received: from sonic ([2804:18:167:9e8c:e6b5:fa0:d068:30e3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebc667bfesm11463318eec.2.2026.08.13.15.17.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 15:17:49 -0700 (PDT)
From: Hilgad Montelo <hilgad.montelo@gmail.com>
To: kenneth.t.chan@gmail.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hilgad Montelo <hilgad.montelo@gmail.com>
Subject: [PATCH v2 0/3] platform/x86: panasonic-laptop: CF-33 hotkey fixes
Date: Thu, 13 Aug 2026 19:17:41 -0300
Message-ID: <20260813221744.25668-1-hilgad.montelo@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two non-working buttons on the Panasonic Toughbook
CF-33 Mk1 and an independent bug found along the way, all in
drivers/platform/x86/panasonic-laptop.c.

Patch 1 fixes the bezel Rotation Lock button, which turns out to
signal via raw i8042 scancodes that alias the real Left-GUI key,
rather than via ACPI notify like the driver's other hotkeys.

Patch 2 adds support for the bezel A1/A2 buttons, which are wired to a
second ACPI device (MAT003C/TBTN) that nothing currently binds to.
Found by disassembling the platform's ACPI tables, since these buttons
produced no signal through any of evdev, ACPI notify, WMI, or ACPI GPE
interrupt counters.

Patch 3 fixes a latent off-by-one heap overflow in the existing HKEY
SINF-parsing code, independently triggered by this hardware's exact
SQTY/SINF sizes and caught via UBSan while testing patch 2. It's
unrelated to the CF-33-specific work but is included here since it was
found in the course of it and touches the same file.

Changes in v2:
- Patch 1: fix a bug in panasonic_i8042_filter() found after this
  series was first posted. The filter's scancode switch masked off
  the top bit (data & 0x7f) so a key's make and break codes share a
  case label; that's correct for the volume keys (both make and
  break are meant to be fully swallowed there) but it also made the
  genuine Left-GUI/Meta break code (0xdb) collide with its make code
  (0x5b), since 0xdb & 0x7f == 0x5b too. The filter misidentified
  every real release of the physical Left-GUI/Meta key as a possible
  start of the rotate-lock sequence, silently dropped it, and left
  the kernel's input core believing the key was still held -
  reproducible on hardware as GNOME/Mutter treating every subsequent
  keystroke as a stuck-Super-modified shortcut. Fixed by requiring an
  exact match against the make code before entering the wait state;
  any other byte (i.e. the real break code) now falls through to the
  default path and is replayed untouched, as it always should have
  been.

All three verified on real CF-33 Mk1 hardware, including across a
reboot with the combined patch set installed via DKMS, and v2's fix
specifically verified via raw i8042 event capture on
/dev/input/event3 across five separate Windows-key taps interleaved
with normal typing, confirming clean make/break pairs and no more
stuck-modifier behavior.

Hilgad Montelo (3):
  platform/x86: panasonic-laptop: Handle CF-33 rotation-lock button
  platform/x86: panasonic-laptop: Add driver for CF-33 A1/A2 buttons
    (TBTN)
  platform/x86: panasonic-laptop: Fix sentinel write past pcc->sinf[]

 drivers/platform/x86/panasonic-laptop.c | 264 +++++++++++++++++++++++-
 1 file changed, 261 insertions(+), 3 deletions(-)

-- 
2.53.0

