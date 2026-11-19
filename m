Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057311;
	b=reRg0yn7AhyAcWY9bNjSDoRvlffZg6bddwzUYZlSOyyUxfbuyWQTl8ZpIfIcykLxZHS3
	 M7aqVJprGTax7jj/Lk8koZNzkekFn6ijyqUB0V8TJxeWn0SS3xsIyOyt2PrZnwY4JGdQP
	 mhl569aZ/pbX34gHsLL1f3f3qUN9fMSlM+uC4e5l/CgcHa8b7ytd5PBnyeJwPjlCg/zA/
	 yQ1oVqHdlgksHrxkUlFH+ZXZjoxxNKxkaKHz6N5xJxDJeeIZ48qwq4vsuTeZMjioRoROP
	 VrEm43Q4lbCSmLnkp6GtTy3yg2RDGetgq6UoF1y5lE+d06AE1H4SK3PFEbEQ4vnvAIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057311;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QvO6yGjZ9/fmweWYCuIJqau6sBu2ggK9RUamBt4bpcw=;
	b=YCfuSwZheUUP2J2WTfD1cyAQC5j4v2ICOBHYyzznT4VBzQDLE6e57Djud/VcPs0c8bri
	 gECb//YnOaeQd9+fSGPmwCLR/myjg5Vxe+zWFqdCRepq9gLTKYlilv88Or92dh+fPFX4I
	 lV2fmTZcj/bDjqkbly4LIS1KTj9a/8035PYCGFXIrgcCBE9K76BCiXEZzaRK0NX4GDw5h
	 4ZRK9In5TB6xXAJnXZD6odcoHTEzYUd9TgEFuoJwbdU3hg7YKFlJJI7Lw9OhYTUyNP5St
	 sobuDAC7YfZOb9eCHu/Had/rWJ4XEDLx4ZpkDMnofBNtUFoMyX2qyJl4Xy8P5K+uXPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QngWw7le;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FD360A5BD5;
	Thu, 19 Nov 2026 03:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QngWw7le
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999AB1F000C6;
	Thu, 19 Nov 2026 03:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795057310;
	bh=QvO6yGjZ9/fmweWYCuIJqau6sBu2ggK9RUamBt4bpcw=;
	h=From:To:Cc:Subject:Date;
	b=QngWw7leZ17zTMN1DfCaj9D7bVrCMk7fhE4maRgS6HFE0YdqM9CIEFTTrGuTzfGFa
	 CAZyWifKF8UTweSHT34UWdwe0dOI8h8GrqfejX54TdWkroKeXoWU+JMYqFpMw/hqz6
	 bUa0jp0AdEmdIlQN7IZVK+2wkP9+6QGe7P25vw55AxBRitA8qqmuiMovRwmMVIzLrX
	 mRdCL4bHqqPllhhY/PKdl4C6yr+QrpqAgvXdf1ZtqiGQJNexbVeBNc/3B/iDxos4t3
	 z2WHqfgYVEnaJ5pHDUwfx6zIhV7wuJ1mbZLwHvCPAy+PVEZuhnR4pX65A3dTkVf+39
	 Y9n5fmk7q2ibA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	tfiga@chromium.org
Subject: [PATCH v4 0/3] platform/x86/intel/pmc: Disable ACPI PM timer during suspend on PTL
Date: Thu, 19 Nov 2026 03:01:14 +0000
Message-ID: <20261119030117.3943303-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
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

When the ACPI PM timer is enabled by firmware on Panther Lake to drive
the wdat_wdt hardware watchdog, leaving it running during s2idle blocks
S0i2.2 entry (keeping the SoC in S0i2.1).

This series adds lockless support in intel_pmc_core to disable the ACPI
PM timer during suspend and restore it on resume if it was previously
enabled:

- Patch 1 adds static inline stubs for the acpi_pm suspend/resume
  callback helpers when CONFIG_X86_PM_TIMER is disabled.

- Patch 2 adds generic opt-in support in intel_pmc_core via
  struct pmc_reg_map.

- Patch 3 opts Panther Lake in.

Note on testing: Runtime s2idle testing was performed with
CONFIG_X86_PM_TIMER=n (TSC clocksource).  The CONFIG_X86_PM_TIMER=y path
has only been compile-tested.

Regarding Wildcat Lake (WCL): I'm not sure whether WCL needs the same
fix and don't have WCL hardware to verify it, so this series keeps the
opt-in scoped to Panther Lake.  With Patch 2 in place, WCL can easily
opt in via wcl_pcdn_reg_map if needed.

---
v4:
- Split into a 3-patch series.
- Hook acpi_pmtmr_register_suspend_resume_callback() when
  CONFIG_X86_PM_TIMER=y to preserve ordering vs. the acpi_pm clocksource.
- Include S0i2.1/S0i2.2 residency evidence in Patch 3.

v3: https://lore.kernel.org/all/20261112032040.930597-1-tzungbi@kernel.org
- Rebase to next-20261111.

v2: https://lore.kernel.org/all/20261016075416.3139759-1-tzungbi@kernel.org
- Include <linux/bits.h> for BIT().
- Rename ptl_set_acpi_pm_timer_on_suspend() -> ptl_set_acpi_pm_timer().
- Update register values on separate lines.

v1: https://lore.kernel.org/all/20261015035712.3604634-1-tzungbi@kernel.org

Tzung-Bi Shih (3):
  clocksource: acpi_pm: Add stubs for suspend/resume callback helpers
  platform/x86/intel/pmc: Support disabling ACPI PM timer during suspend
  platform/x86/intel/pmc: Disable ACPI PM timer during suspend on
    Panther Lake

 drivers/platform/x86/intel/pmc/core.c | 49 +++++++++++++++++++++++++++
 drivers/platform/x86/intel/pmc/core.h | 11 ++++++
 drivers/platform/x86/intel/pmc/ptl.c  |  2 ++
 include/linux/acpi_pmtmr.h            |  5 +++
 4 files changed, 67 insertions(+)

-- 
2.56.1.708.g77570a6a1d-goog

