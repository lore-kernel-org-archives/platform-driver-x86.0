Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF6F52D2D1
	for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790689538; cv=none; b=O0eV92ZKVJUrQu0DO04loLfmcgI/apTZscNYSF0jFDQ4U1bGTsYBrlgzpLPeRbcFG77wfsttwxiBGh9ii5K3HcMa8GoNOB6q/nfZXQZZvjDPfiYIcNGpblO7hz6mGADdjtrXgEwRdNldPhgm0sgvqbSJzISGyRSYxQWeFIrZP1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790689538; c=relaxed/simple;
	bh=S4Houg1rUsqdLENp0bnscNw2E/ZkMSvd4UqZ3bxJeqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EaOEIhmcTdbelvf7A3jqmkgp1hEt0dcrPw2qSFM8/dLei77mzhoh0xbrwNng4lsUOFkmIOqyHli9dy9UB0zk4FEeqqDZZx4R78LQViW3xaWKBcCKZ5rcXbupIsqB5kZRx7vIumtNekoZ1YZdQxXx7yxDqqj0dXgNalDEu3EVh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bw8AHUIn; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bw8AHUIn"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4aa0f1a94so1431098a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Sep 2026 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790689536; x=1791294336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kbOv+6PrlEjIifh30wu1d3jM35f4SUdUb1t8Ec+wrNY=;
        b=bw8AHUInPCxe4eHxU2aQz8npBFwrVUfk3DknmzfZZxhQiV/hxPqCa+nROZwvBjo1sb
         5+vx01ve899vITBnumnc9PsTKDGXF5zpYwg3fap5Wxl+2iiImv4ooRsmjjz0tvMSwa3j
         tc9I+4iFOIsn6laHHqs/sK287YFEG7CySJdXaYZrLH7WGSnFuIbU58Jiwx3foW9c3ZzU
         rPVd4mcWWuQwcCmXTf2lb4LGWDA20MUCE+XPLc955Lt/Yr/F7LSlD6tGpX+l5x8oAcGS
         IPp7xahs+0OsLRh7r9Sm6IU7GPWB+p5HcgEYnr+YvROWx+ZW7a5LmIMfwqMwsrNQ+kc6
         yR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790689536; x=1791294336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kbOv+6PrlEjIifh30wu1d3jM35f4SUdUb1t8Ec+wrNY=;
        b=HnSOGbqBCh91sGmNpQJZbwrB1GFsO4oojEPpuv/jSJxj+buMaI1OqNyNyF8/Y4ROr9
         lLQ682Qm6G/mAlQQ4HgvQ0CMIWDADkNAyvmnUT2NH/UGuHWPD2MAcl7jlpWO3x4ucrPR
         SXjLaxArPH5ypcGm7b0c9CzGnqmEhYItHTTDqX9dkpoxJDZQ/EXRKY5idk6EHxvC53NV
         cLt+7h0MUwLbK/mWix8Cde3alYL93NbAEYMPGkni5oxNJKOaZrDgqW7JklYfbsNz9cp4
         9CX1vpcG6NHoyOn/oDjgWgj4VgrI+3p5bdq5AKUWwxI2hkCAcHhUKBL86nzGJ9sLDoEK
         0Nwg==
X-Forwarded-Encrypted: i=1; AKwUvBxjqjUBDlnxu0w+lBQZ/iV5uRWC3EAbyKtpU53tD7n/nWeIAk51RKVTs3lC6c5osewnac2/6rX5zkAmyoCs5WK0EWw9@vger.kernel.org
X-Gm-Message-State: AFuF++nzuJb7aOqkYmlabv3SAtYryo4IZKnswYvE9FWE+5vSHl2FV+pQ
	TFxn3YHkB2hsCbWsYg4LdfIyuB+4PgIEl7/gEUEQ81YudcyaLQKrBf0n
X-Gm-Gg: AYBFou0sUkSnqbMNwh73MRbcsb8UAVAoa69Ga01hgP1P/UX2hjLP6SkV2sHhrHlqxbL
	BArEiTP1B5KBVoTv5S9tKCyH9nS0jCzzxm5KzOZfVBtKlY6QocED+ERK0/i//e2F6Ss1E0kFkHj
	kBQSBuDVI713H3Tqh7vNcy+oPvQfu75xxvkMqBah+AatinuL1ImPFVsgJOwQfNCRAYJffZjyb4O
	YWudPNrxe8XvOrhBctjXQwjO2r30WW1BmgU4L3pkaraVZD0kZJvbOYXUDPdbkK2DJM8J7MBtlFN
	rK/If4GUhixU+N8PLXwoZJQG6NBfKE1/L/tb23uHdMGeLeoGMFOk5dJkgJcz6RZy5nfgYm+PKO7
	h7DIQOxMsWxgbJVPRUKspD1jtpGnm1jZ+aFGP8QcFjvjX8JUaqGGy6nTp4o0KRFBHnv2WNPUeRl
	U9UuVDVisn+JUoltD9QPL3YacktrvYMV30poQBuG1tO3Gwi+9RNM3A
X-Received: by 2002:a05:6a21:501:b0:3dd:a196:9076 with SMTP id adf61e73a8af0-3de0e95a387mr15675678637.64.1790689535516;
        Tue, 29 Sep 2026 06:45:35 -0700 (PDT)
Received: from qby-nixos-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd736csm919555b3a.8.2026.09.29.06.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:45:34 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>
Subject: [PATCH v6 0/5] Merge redmi-wmi into bitland-mifs-wmi
Date: Tue, 29 Sep 2026 13:44:58 +0000
Message-ID: <20260929134503.17249-1-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series consolidates the standalone 'redmi-wmi' driver into the
'bitland-mifs-wmi' driver to eliminate code duplication and centralize
the maintenance of overlapping ACPI WMI event streams.

Bitland is the ODM manufacturer for various Xiaomi Redmibook models. Both
platforms share the exact same keyboard event stream WMI GUID
(46C93E13-EE9B-4262-8488-563BCA757FEF). While redmi-wmi previously parsed
the 4-byte payload as a bulk u32 scancode, bitland-mifs-wmi deconstructed
it into discrete type/id/value fields.

Redmi operations were not contained in this patch series, future reverse
engineering is required.

This series introduce a newly reported mic-mute hotkey definition for Redmibooks
and dropped the previous redmi-wmi driver.

I don't have a Redmi or other Bitland device. So I cannot work on the
real device.

Features are working properly on my device (Lecoo Bellator N176).

I leave the future reverse engineering work to the community.

I apologize for not participating in kernel development over the past month.
Sorry for the late reply.

v6:
Drop the wrong Redmi ops

v5:
Correct Xiaomi DMI vendor name

v4:
Map PLATFORM_PROFILE_PERFORMANCE to wmi performance mode if the device
doesn't support full-speed mode.

Mingyou Chen (5):
  MAINTAINERS: Add maintainer entry of bitland-mifs-wmi driver
  platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into
    the bitland driver
  platform/x86: bitland-mifs-wmi: Add Redmi mic-mute key entries
  platform/x86: redmi-wmi: Drop redmi-wmi driver
  platform/x86: bitland-mifs-wmi: Add per-machine ops table

 MAINTAINERS                             |   5 +-
 drivers/platform/x86/Kconfig            |  12 --
 drivers/platform/x86/Makefile           |   1 -
 drivers/platform/x86/bitland-mifs-wmi.c | 251 ++++++++++++++++++------
 drivers/platform/x86/redmi-wmi.c        | 154 ---------------
 5 files changed, 189 insertions(+), 234 deletions(-)
 delete mode 100644 drivers/platform/x86/redmi-wmi.c


base-commit: fe5030c8cc7156223f48530e9b49aa87c0305bcd
-- 
2.55.0

