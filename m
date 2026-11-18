Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975946;
	b=pMfr+YSt7WTZpj1H9yBnSyg5CpcECrv+SxN2v6tA71/YM+WweCaNKH7P2ZUNh4I2GZSY
	 9snLbx/tiebdPy1cosFS/0K8n2KDJ49TjXvD8Ipf+bzilTE0IOHseM26ygDnnKzf3JyMs
	 /WKE4AvJzyg+yv7oo3Z9Wa82xfrYPMrcsabCJmViqdz1mYYUx1/cLXBkRxULVhRDCotsO
	 KqV60b0C9aSpr57sfL4KwElhx02ZrsntcIlf/dDYLgqri8v1UPX7IJfAOCEJeMYmoKXrv
	 RAQ+gjFG8p1LEOzKtH1hK+fl0n03DxaahHRcx+0GZ1JUaVDOH0DNbYHd3re0jOXxP2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975946;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Zh4vAArBhLb0ta8dNyLSApnPR+DcxZGFY4YNGl0nkXg=;
	b=Cyow+xNxIlbvi7+SDVrCZR5QGD7fcS8N5ll/mzsfMd5QC0ZHKGlmDt7YuCiFlOnOyfq8
	 e1nFa5HnaMyvkk2C/Y7qhrYawrTJ7bbE4+2WJ6vmmcAVzd6FYe3YRFG11/P6OE4Vxy4mS
	 AO1HixvPc3m2lOACrcFjKbY7YUQB7TIC0LX3HJpDAxw466gyfU0TMCxJBA9vXohZV6ZMB
	 B3T1tPqEKRzpFPLbguPv5Fg5IO13y2oavO1Dh9LIw6Xkiqf27WTFUazykLuUoYC7ft0rC
	 gS3AeYfhmREDdqAb3SyMf088wVpqtFEt9TCNuy2Ao0XiqwZVoZ0B5tbQI46WjhuvLfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pu6swxVu;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9C5606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pu6swxVu
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc147d86bebso300493a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975945; x=1795580745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zh4vAArBhLb0ta8dNyLSApnPR+DcxZGFY4YNGl0nkXg=;
        b=pu6swxVum+ojaLLTaZHUnSmDTqTuyomcXvhqLiaNjGJAYaDGl3HDyFGAvy/MqibZ5g
         sTr65M04aoTVEo/FsQSe2yZn5Rv+rNvbIVRRlvj3zG2jlAzgSz4yAJAWGgYdT0KWPjba
         G/ZRiSu9IBov8va092gCX5rkDmUOnJf1/nh8m53/c34DECnEzAXCvxjpZ4FoaXMIZDI9
         ao2Fdi/QcnF5RLR9CVXbScBK9YrstznP9i2fz/8hNdOZH2/lP1mEssvYplJTYmLlaLLE
         V96YD0lg1IEq6UPj5mXB2PKX6s058BJDpMd9snEP6KFjTQMuAb4WeoynE3xwvcn1cfsY
         zODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975945; x=1795580745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zh4vAArBhLb0ta8dNyLSApnPR+DcxZGFY4YNGl0nkXg=;
        b=npcpYt3UqU6EX6m4FvtoUso/VN+cao6lWjiRPF+dJXP3CuI/94nOsDlOPaymlA8J1O
         RdlgNjMx69quqv7lKa6+TtIB2OrFfYJlr83hvLEnedo3MYso05SYXXWcGBm29lUjQ8UR
         5VKV8LmYd5uPuCC8Bsg+7cBJ5u876/6TxgcRShEA2rj1cY7spmAMg8I+TjnIn6Nq5g0t
         fBjlt6hLlEVEZ9GUlQlG3KsEsK937tRB+XCY1uOdeBMaCwMX4oGKBQF4QuxvWqTshhD8
         li2w36TdqGScQFxw0GLpWHEEq3DUWcLuZth1Wm79H7gxj2UQMDWQhPEYUd5/X5PVUYIw
         HxAg==
X-Gm-Message-State: APuU4Z9EmEkc2gbjZqksEbIL0UVowL6PiGpS8iIjxIipbuMrofryI7hE
	5mLbSDWN2NIIvlh2m5BiWvHI3NweYevvhY2P6ns2+JVlC+QE31Agd6Oi5JQSiA==
X-Gm-Gg: AZFdTZc30tBgm1R2whSMdLXNU3wNsOk8sr9wARH5vSRw1wp1fWiVsqDdaaAOHnmBbGV
	SbVHE1kAIgILynHyY/8Om3F0PT2LpVVZXjolGWidAX4XLLnT1hHVMVE69xMxyDgc3c2aVyKR1sN
	RZAzsk6mdVuPEVB5gbkRQ+Susxq3YbC76XSRYBe69yaKyHCvG3kyE1ZQj2pv6HKxAWxlgbQU+p5
	x0AXSlYfUz1j2EnOFZdOh3KbOkPMSF0oUeDuEF6NdG6TZmEoUsaj2yGpfbDsTpL0UwZ5ttrdLid
	9Yw08nz4m9Ch6Mg7n2Y18uv98zfEqsb89RE1SxlKi6P6Gek6kGHjkIxOfwWpqDu3jZv4QH3LiF3
	pIvaoDTcALbg0vZR64c60E2ZdPv0awqzXjtu1XNJCiDrX6riHfPViDCm+Q5/5EJv9Pd/oeU7K8H
	gXJXYKGhKlcfwMa2GY8Syenkhe3jFnmZPBJ3APp6mzUYXXLukdA8xgTQdSFwXfrmMF9oxlZm5fd
	J7KRXcU3XBjeOhLJPvshxCqA9sARGmBGioUEkdU65zQuqtRG3WKqe1TQvu8CS0XFy6JWsemGlYP
	i2mnesjrEDuhBlwuhTpbZR7gTv607pxfBy6UwNnzPQPA2P8wQX4r8TYcBQzGQYs29GTB3bH6U9i
	Zh/1NQtdRZvZ/eL3DMFPL4Fo9LwhGgIPcHq/BYqMwHvyKai9Wl9iV74YaI2Za2/PDXFMEeTS1Ie
	nnCw==
X-Received: by 2002:a17:902:ce89:b0:2e9:6333:fba8 with SMTP id d9443c01a7336-2eff740e7a2mr10281945ad.16.1794975944699;
        Tue, 17 Nov 2026 20:25:44 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:44 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 00/16] platform/x86: dell-smbios: Fix call filtering, lifetime and error handling
Date: Tue, 17 Nov 2026 20:25:22 -0800
Message-ID: <cover.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes for the dell-smbios dispatcher and its SMM and WMI backends.

Patch 1 is security relevant: /dev/wmi/dell-smbios is mode 0444, and the
WSMT tokens are whitelisted without a capability for both reads and
writes, so any local user can write to the WSMT token location and
change the BIOS setting. Patch 2 closes the related gap where tokens
sharing a location were filtered by whichever came first. Both were
found by code review; I have no WSMT-capable machine to reproduce them on.

Patches 3-11 fix a use-after-free when the dell-smbios.1 device is
unbound, an empty token sysfs group, use of an unpopulated SMI port,
unchecked SMI and registration errors, and a WMI buffer size underflow.

Patches 1-11 carry Fixes: tags and come first so they can be applied
on their own. Patches 12-16 are hardening and cleanups for the next
merge window: they stop unprivileged users from flooding the log,
restrict the token sysfs files by mode, and tidy up the rest.

These patches were developed with the help of an AI coding assistant
(Claude Opus 5.5): it reviewed the drivers, found the issues and drafted
the fixes and changelogs. I reviewed every change and I am responsible
for them.

All patches build cleanly with W=1.

Tested on a Dell Precision M4800 running v7.2.15, using the equivalent
backports built as out-of-tree modules:
 - token sysfs files are 0400; unprivileged reads fail, root reads work
 - unprivileged non-whitelisted token reads through /dev/wmi/dell-smbios
   are rejected, and 503 rejected calls logged 10 lines; root calls work
 - dell-laptop, dell-pc and dell-wmi work on top, and three unload/reload
   cycles of the whole stack are clean
The WSMT write fix (patch 1) could not be exercised: this machine has no
WSMT tokens. Its seven 0xDA structures all report SMI port 0xb2.


Changes in v2:
- Patch 3: don't leak token_entries when kasprintf() or
  sysfs_create_group() fails; fall through to its kfree() and return
  ret from a single exit
- v1: https://lore.kernel.org/platform-driver-x86/cover.1794871007.git.rosenp@gmail.com/

Rosen Penev (16):
  platform/x86: dell-smbios: Only allow unprivileged reads of
    whitelisted tokens
  platform/x86: dell-smbios: Filter every token at the requested
    location
  platform/x86: dell-smbios: Return the real error from
    build_tokens_sysfs()
  platform/x86: dell-smbios: Skip 0xDA structures without tokens
  platform/x86: dell-smbios: Use dev_driver_string() in debug messages
  platform/x86: dell-smbios-smm: Use the first 0xDA structure with an
    SMI port
  platform/x86: dell-smbios-smm: Propagate SMI request errors
  platform/x86: dell-smbios-smm: Clear platform_device when it is
    released
  platform/x86: dell-smbios-wmi: Don't unregister a driver that failed
    to register
  platform/x86: dell-smbios-wmi: Reject buffer sizes too small for a
    call
  platform/x86: dell-smbios: Don't tie dispatcher entries to the device
    driver
  platform/x86: dell-smbios-smm: Set the WSMT test call after clearing
    the buffer
  platform/x86: dell-smbios-wmi: Don't let unprivileged users flood the
    log
  platform/x86: dell-smbios: Suppress bind attributes of the platform
    driver
  platform/x86: dell-smbios: Restrict token sysfs files with their mode
  platform/x86: dell-smbios: Drop smbios_mutex from module exit

 drivers/platform/x86/dell/dell-smbios-base.c | 162 +++++++++++--------
 drivers/platform/x86/dell/dell-smbios-smm.c  |  24 ++-
 drivers/platform/x86/dell/dell-smbios-wmi.c  |  23 ++-
 3 files changed, 136 insertions(+), 73 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.1

