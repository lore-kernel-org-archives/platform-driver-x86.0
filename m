Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAC535B62F
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2026 02:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611072; cv=none; b=WLVnp/KNR9AucqHLwFC+0ZK+Dkb0mJzoohvGubEz5ZE35llxykf4lZeey13gcujrf0UzfKwLoXB4LtOeH0/OzaZ1GURZJgCtf48DILirAVfBw+YDudu9yKRxLdaT1znsT9TnNBcj5DMg/ZBs9NwVRa6pEtVXMI04POxP4oij8I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611072; c=relaxed/simple;
	bh=l9NzN8vgsjpTBOVB467cB8h2Hx8W8Qa+dHS5qri+xLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JPulwnp1YJCOQ6jNCE2n+xgluCjlRU4QIOJFpAwPvBXrlPDAQqb0vOg7Xwh+1BMvlJQU463o/w9U82PK/Bv4SAa8ViZ+iBzxeh4zr2EXCi415F2nSXdAUvWixqEpsIS5puet3KxKKxrfPFQY9/EwsfA+EedUGAfYzIA4Y3rRmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLp3sC5v; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLp3sC5v"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so272405a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 19:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611069; x=1790215869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWM8vu+DSZ/y9z7h/rS6MGJwMOg+ndfjsoSVL5ugywo=;
        b=QLp3sC5v1YLwdBv+OioOQf7ESWwEx3UJ5AmURk/c3zlqgrnMjW/ezKtEI7n+qi8w+i
         nUds0a604uX+ujOalobMzV0lCGrpCjq19D+fCFhXyyPlycGtHs2f1za72a+mOlAJ6kBL
         WNHyFZmNcBV3XDccniynxgkdiTOICMlzxD+IheQVoslLgfqObrLdV67q4/6rTMDDlrlP
         mtq86mcRvw7DHuB+j3DpGXJ9OBrCH7uLsk9HKB6kUcVsUQYoZqnl3etwtXhKtX8SKwVj
         7OFj2RYhDbtHmUcrBFk5J+RtKhTKfaGhGQjW1bnvntSRkHLIh7o/mJPHICjAE8Z2xR8g
         86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611069; x=1790215869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWM8vu+DSZ/y9z7h/rS6MGJwMOg+ndfjsoSVL5ugywo=;
        b=ZwiqItElKoquwzgxpv8+znIqTuH1IiL4km14n7CsbPh4Y6CYz/dMj1sQAvvs6sDEQN
         1/I33rTTw/lmPDsATElxdo+EZrtQqhOeTtkCfdvtginITzh03SdlywtbK/u2HfiSqo6c
         e32b4h0wogTTqVFQ9/Sa7IFxFjGVWLepIRf0Iy4baAwrMdZCPxf2OKC4FwgYSv7zOxJA
         YHlMXcolP1scsqLDdeimEloibWwfoO/OeaRz2eeGrDBEfX372lTaVuUEShEDdR72zQO1
         6EvRCpfOUwxht6L9Ajn6JoIaQv3snDrBNWrBVjrW4on6TpAu3Wgafu+h3AOjl5yMhVWF
         o1sQ==
X-Gm-Message-State: AFuF++kSyFmFNurNJshCHCB8/sSbAEXB+J7dXvi2Rop2ueZmPcSNbwQZ
	uebdVc/U3cTI7H+zuMDpITEhGQbpklQAnjyTpWh+w3TpqkXMxPKtnlz3
X-Gm-Gg: AYBFou35LmAZ+zi3JLsJb3L2DNrKzOVo7qm37VyDSEa3m3xr14AcEtggEcxLqRrJXMv
	52hK9S5AtgilOJRtKZMUMZnDaXMh0cB7KJYRvpYYxIp7fcTcmrpclVrFmc5XZ+TfsCsKokdxIPA
	Bu0nXZDdatBe6+N2FpwolR2yhFUAyrKC3n43XSetKfzfukbmkyECxHWTpEdFGLkWfzg1ivE7Eec
	HKj7zOwgqLKqVE72sK++Upw+dCNOe+MJep6OIIBIyEOaAMHA427Hyw2BPqwrir6OfEzW3QlWB+i
	k6gH8bQhE6n4vCD5T6ziJMSQa6CufwJqUDI0W+xgdTLeBWzTDUyYEilNp/L2R/6zbix4w8KckbP
	1jtq8DsffaTvVSDi0+h9bXeq+RnXrAYR/X/YRwN9bjwrjAKioe65IoUiYpwW4QXt1JFHxnaCxiG
	5GSMDx7BMdqvFfswL5ZDOTqtmLWD/5Z4aLWzQu/kxpUnj75CHZC8sEVzQbAkjRewnlbTpN3IYRq
	qXaC7VZtUDWQUWghLZLQqvqo/4ZnCRh7WCN9i3aB7DGvg==
X-Received: by 2002:a17:90b:56c6:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e2e797eb7mr6073622a91.6.1789611069195;
        Wed, 16 Sep 2026 19:11:09 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36096735sm2341821a91.12.2026.09.16.19.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:11:08 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	bryan.odonoghue@linaro.org,
	W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH 0/2] platform: Enable ACPI WMI and ASUS WMI driver for ARM64
Date: Thu, 17 Sep 2026 10:10:53 +0800
Message-ID: <20260917021055.8029-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables ACPI WMI core support and the ASUS WMI platform
driver on ARM64 architectures.

ACPI WMI is not limited to x86 platforms. Modern ARM64 laptops and
platforms have adopted ACPI WMI to expose vendor-specific features
such as hotkeys and fan control.

To support these devices:
1. Removes the strict 'X86' dependency from CONFIG_ACPI_WMI.
2. Updates the ARM64 platform driver infrastructure to allow
   building the ASUS WMI driver without duplicating source code.

chipang_kao (2):
  platform/wmi: Remove X86 dependency for ACPI_WMI
  platform/arm64: Enable ASUS WMI driver support

 drivers/platform/arm64/Kconfig  | 46 +++++++++++++++++++++++++++++++++
 drivers/platform/arm64/Makefile |  2 ++
 drivers/platform/wmi/Kconfig    |  2 +-
 3 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.43.0

