Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873316;
	b=TcpVpkA+6YpKh7TbCJcGbh1ZG+Sg8SjRutHZufSHqtglrJxeglEXxUtkIZMJc7wFVJDI
	 DAXg7PgFUTXFF2Rbm5rcH3GmIMUXB45PQv3oAQGSnuZzYbvkjmJvHQ+ClsjkToPglpJZr
	 I7vpE75z+CSmXaQBDBn8lbfcINp7UibxYjTjAKvhlSJMamwYiPo6L4LyUj7StuQSkd5sH
	 6iczmHTj6ZhpgtlETlmMg/LhgpHXEO+3m6eCJzMATa0at78LEOO7h8BAw+jPr1MpHQEnG
	 m1IafyPu9A0OXVoCCW5a3i0rzUohYstCy8MHar9rLv3oH+dT9lLpySW6KLvBqn5GZ1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=uL09m8OWXEiAXxsyimV4tgZ3rBdjALpLuLiBzSZ1ng0=;
	b=Rp6qMsYZGeXEPFzqJt9rZos0KxPuy0EVo/rmAjPsAtTgwuXI/xB5Aa1jIsXE/+RY3AzI
	 UP837v6iAN6nGibKgDhQ4+9+nGaSznR/hdvbi2oECEglwGX5AH2zYx53hEW1Yo5Rrtyj2
	 mSfB2iUzKWceWdRuBsahEJqub1MzmcM4WKxhRx8i0BpMNwXLrYIZdvMnJlammzYkS6KZo
	 H7ry61IxBNOiYv+SlJ9EEnoPfXRe5/veJhrKq5R9W7UhRL+rBqywY9KGhMbDku1DTcl17
	 FLt9HGIzlEUhV3A/Nb/iF9SAu+2aa3HoJNAjrUR7iEv+JKvf9CJ6oIILvcM7C9NtkGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1zqBrNB;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7FA606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E7FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f1zqBrNB
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5272459eec.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873315; x=1795478115; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uL09m8OWXEiAXxsyimV4tgZ3rBdjALpLuLiBzSZ1ng0=;
        b=f1zqBrNB2LvmTzXRI5Bo+zu+OMNsz8tudtnpuSf8CtTMIzHs0sVcL9XGyx5rbUt45A
         qD97yf5pp4QEOIdcgxsbXLTAPCdqnJQpws6Fqy8EbUerylxtCTnUZFzjpfqNpSRMzQv/
         Jdg9FONXctUgV+jsJkpl+8N8q6nI5LOf5svcZB/+hAu2N0H4DXT5ocRF8tr6z4jW2YC6
         KiH2Xy9Cm1PqgPotiI+ksty8QP51NzNXJ0K08WgoHMq2mK44dg6fKiDc4HlA9HGWPb1E
         F0pRyDde44MbqajIAokmfpWfYamh/ImjeCnvtXX646wEvqbqSRawALzBukKlAcz2ELxq
         ZZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873315; x=1795478115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uL09m8OWXEiAXxsyimV4tgZ3rBdjALpLuLiBzSZ1ng0=;
        b=18z4XbLluegOaNCTgDR21fcw9iQbkNRM9uHB2+aSR8e1eCA+vFWT15q3K/LBvQ0NvT
         klqkwfgqMmQ0/tShZxRfE3CUhvYINg1tadTsnzYUXpdv+XMO1c8ovmv1zCEoM9GwDqJe
         W71IiRLPs7JHEzaoEnKYwi6G686kjCyEVJWgeVyJblkNxXyTI/ahxr9rdacOM4kveUZi
         zVnuBT+l59QyfD5YvF7TkQ26LIgDV6xN+eKFvso0+MGVfmkd0eTHwAv3BBmyfJCnxJDA
         5Ac3GX4A0/p24N3BXLoaebJrUGlma/YTQf7mnwPZdQalI1t+P1O9mlD++C9Tc3DN7Jvl
         qwBA==
X-Gm-Message-State: APuU4Z9cQlA0LTOi6Y/7d6huUN8wF0f+IQb0XmQynrVf93YpP135ZTsg
	KWuEvVzfapZbSsRGuOLrRqFLduZNqA3LyHZLjckQfbjM0bf5oKelXkC2
X-Gm-Gg: AYBFou0ZKAPPex9C/je530R2W4TU81Z5ng7fZCjeJEI5bdXUq9pceyMh/LyhRSMsPQ+
	JB3udiTzDtpYYH4vKIsq251x5glxpsbFnOmqtk28GX7HmJaUdkzI3NBJ6Alvv0eAgdbB2o71xIG
	QkcJ5g1xGyFF0jZBgQ5OAmpCgWUDzcGcWFoepLmRNTFC5CVvV9wCAM5+VnjHK5Magf29/V3fRTg
	tk2VBC4dm7NhI+Ver/+E8Sxu/rVtXrLnTRy3Kf+ZiMDDyTW7Q3SA82G56YyDT+Rj6UYTf9lzzuc
	lNFp2Eik24TsLIyqTEiijGkAp0bGSl8/CNtyFw87OehGxA2iC77JMpGzZUxpKv+Gzs1Gbp5MlMx
	MQRtBJ0UW5DdF2TowuCkNmmj0Urk7SNntfsEosqqFBCEcToCeka8ONEsh7D+rKRYzNlmcP/AW8l
	CfyVXAeDkNYxcG4LZPDjiTONMCE7P84Y7MtgUeZKgPQJQs5wBRrxr6evy77X/LVl1+h4uyE62j5
	+jkEHvSsPElEG6ewm+s/a09AI7clcXisn3uukC9gcnXoYlTOqGEfsHGOeH5i+eybxeJqeh/DrJ6
	dZ/zwQMzyW12F278RmerEH6L6ziERNTakohIT85gRtsEoqspaPKg1Way02bCHF3ZjuT307Y12ey
	J6nAGSOLQDinWVgDxhqie9nIUXkAlBWCEApLoBHMtAxoh4S4JciVtAc6PLP5Wdb7EizpDdfBR1t
	aaImo=
X-Received: by 2002:a05:693c:8107:b0:36c:b7b4:407e with SMTP id 5a478bee46e88-37967cdd709mr13154541eec.22.1794873314725;
        Mon, 16 Nov 2026 15:55:14 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 00/16] platform/x86: dell-smbios: Fix call filtering, lifetime and error handling
Date: Mon, 16 Nov 2026 15:54:44 -0800
Message-ID: <cover.1794871007.git.rosenp@gmail.com>
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

 drivers/platform/x86/dell/dell-smbios-base.c | 159 +++++++++++--------
 drivers/platform/x86/dell/dell-smbios-smm.c  |  24 ++-
 drivers/platform/x86/dell/dell-smbios-wmi.c  |  23 ++-
 3 files changed, 134 insertions(+), 72 deletions(-)


base-commit: 2800868f63227c8237d70c41e70d441c919620d6
-- 
2.56.1

