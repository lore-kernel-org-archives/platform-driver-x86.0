Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C63A3826
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 15:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773675257; cv=none; b=q16SuhKgaBKTsrhJ69xGcS8kCSKhAVuHXukGR0FIERIZPDBNeeRsVydYb4TPS1d4GWP8vvXGWGdrY9hptpphPMBl+tJUkKZIYF+0htOXnkF5L167DG9Olr+O6rTZi/t5j4+f69lhltIxd9rmL7bt2Bddjf+oeWBQuseGfNlNfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773675257; c=relaxed/simple;
	bh=y/ZLibchuQj7YlYLpkVr+2Z0sBYMwEjJK8GbheI4gus=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rWoqoBBQKI4R30NlNJzrTVjHuPYY2ALkfNu8jnrVYEQXtjGVxgLIAMfOc2iTKwG274Qn4pJHpo6uFF1VZ9vyWf/NGaGNnq8In4I3vqRhdzcNr7pkoU9ENZPwnvTtGq8p2gQULs13tnsIqFXbiARlHAUAc+IKGpsWszk+yzlKQL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NE1l/chP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NE1l/chP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso2496470a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Mar 2026 08:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773675255; x=1774280055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=31hFqWE+7CsGeugLW57EQWcnO71gJWH1yfQQssYWeNc=;
        b=NE1l/chPmhzwOJQgiGj91utWJOlMAk5TcyxjNy8ZPysExemvpKgWgelSrAF/Gi14Mh
         vn48JDCFPWGKM/rxTboQDQHOmQUvNbdxUOQtRK0Nn4uINcosJ1ifvl5DvhRQiR6UAtfv
         upI/A8GAFthL+Cv/JuCDFUH6Kn6SbyiKdoK1wfLo84HpomMc7YXxtmTYc3IyE/+P6uth
         bZO3rmNfBfls0YGsBPDTDKZscprb8P1tCu/1EQNSe6LZP6a+HNL//5fjhhTJvqfPm1wG
         7WF6W9GT/vUzafNZO5FHo7AwDF+6KoQWLZaLUJ8S9duk4dUhGHrVB0vtimVxvpXOC5en
         hbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773675255; x=1774280055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31hFqWE+7CsGeugLW57EQWcnO71gJWH1yfQQssYWeNc=;
        b=m7ytObCGzJx7rBW90rStGrKrVNN+76AEsLN/6qd7B2S5h13UNYjPZP9XkgFjZKIgxj
         AS+cgq80qJ/UgFWhIjQOBHIQpyQPDtuaNgMAP23y4vMnE3EV3kO+E2jP7eUrHEHhKn12
         tC0wq9XRZLzcj08KMmzbUPnOMbIIqPajLx7g8DPnzLT2LHSqM5rI+A+UbaooJI7SO8J4
         +AyoLst8IALQBe4SeZ4RhYc1epx44CWJYDYy9lcgHA03IRuwTrHPZiHNcHtRo32VXpgq
         lxp3pmcGrtF3oSMKY9TkX+sEu3RvE+G36ifnp0sLF2Zvid9HBZCyUaB+urp3XvAsoGx7
         e3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVPwWGwhE0U/LamVMk5x5Y55vPJAytG+piV3gRGp/64FmRXeAg7KnHl0u+jkOxYA96vBNzvw2pmtgui8eWZ79NTBdUX@vger.kernel.org
X-Gm-Message-State: AOJu0YxVuLwgM2m1aP+wYQihmmc0MC0AVZSOTjRoOak9LQU3LfNLv+JW
	WMIPSq7bArDyTjq3z/5sIfs5phCKfM1Eg/v32wEjxb9yvQRDVrdB51k=
X-Gm-Gg: ATEYQzxaF4C3lj24nvE54xVv7TINMrtQtr4oFkbqrziRwb6vocy90caMq3XUIzQ2sXI
	JAk7Kxda8UF/pfGmXRAW1EYB/eTnk0GJxKFWKUDK2O3w/+8K+c+yjOLC5gqqcYDLAVXFkGDRt4C
	LHPTKMQswv6qjLO1+nD5IKqVk/74v3wcq1Rwh7jnYs9RjOBoEc8LtrrQ6G6PoGLH59k3qKnV+4E
	Za5Y3qxchUmYT4xKpB7WqRbC/A+l//tIneQu2MZ27BdBrgyasVFFHfgrBJx7R5bSliExdEUloOG
	+kjrNo4R3+pMeYKUs5N2sIqZ/m58RMSVlIXmGTyw1LazPbIEG9uA8Hpo44ok72lV/pc5UF0vpOK
	L0P1A1E1oOG5R0gPDhZJYKgBBfsrJd5Uw5LQIGCcJzIJtB9f+5lgOZSbvK4n88lqxjU5tXAvs5z
	RXqnGnh8t5XWlUKl3qm/j3lL+GQ0Sc3OSsuCl+jL3CwZt+9J5sw3CQmdBkSS43X4Y=
X-Received: by 2002:a17:90b:2ccb:b0:35b:947d:9fca with SMTP id 98e67ed59e1d1-35b947da15amr4932335a91.19.1773675255126;
        Mon, 16 Mar 2026 08:34:15 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([171.61.163.197])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35badb906c6sm2685a91.9.2026.03.16.08.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 08:34:14 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 0/2] Save Brightness on Macs
Date: Mon, 16 Mar 2026 21:03:45 +0530
Message-ID: <20260316153407.1781-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, when a Mac is rebooted, the display brightness does not reflect
the level used during the previous boot. Instead, the brightness is
reset to the value last stored by macOS, causing the system to
ignore any changes made since that time.

We fix this by writing the brightness value to efivar 'backlight-level'
at shutdown only, when it is changed since the last boot.

Changes in v4:
- Fixed build error, when apple-gmux is compiled without
  apple-brightness.
- Fix grammatical errors.
Changes in v3:
- Fixed a bug, in which apple_brightness_shutdown is still called on
  non-supported devices.
Changes in v2:
- Saved the brightness only when it is different than the previous boot.

Link to v3:
https://lore.kernel.org/all/20260315222020.24341-1-atharvatiwarilinuxdev@gmail.com/
Link to v2:
https://lore.kernel.org/all/20260315215302.24087-1-atharvatiwarilinuxdev@gmail.com/
Link to v1:
https://lore.kernel.org/all/20260206125641.12983-1-atharvatiwarilinuxdev@gmail.com/


Atharva Tiwari (2):
  efi: Save Brightness using EFI on Macs
  platform/apple-gmux: use apple_brightness to save brightness to EFI

 drivers/firmware/efi/Kconfig                  | 10 +++
 drivers/firmware/efi/Makefile                 |  1 +
 drivers/firmware/efi/apple-brightness.c       | 67 +++++++++++++++++++
 drivers/platform/x86/apple-gmux.c             | 21 ++++++
 .../linux/platform_data/apple-brightness.h    | 20 ++++++
 5 files changed, 119 insertions(+)
 create mode 100644 drivers/firmware/efi/apple-brightness.c
 create mode 100644 include/linux/platform_data/apple-brightness.h

-- 
2.43.0

