Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795057312;
	b=Z2DfH32M4P/nfu7Q6+gqsqVpKS1i+XhQTbOLG8sFiJjc2dyfoAeupZghpH6Gvy5JO34p
	 cY5tahech7j3hbrwmVE9kMhVX0uPp2BUXCN9oKfuaudCLxoaG+5lMRh0XeiBY9ZUpuNFH
	 1wuoOgXc9cHJynAMPZtFGoXRvQ1yzaNa8Huh71Vf3Isgp2rfhlVpJC37VcCv3amD8JpsV
	 Nx9BHO6EgaE6SdSDZ8lh4eEW8VyUNwWN1lHWdYoxPM9yylciGZHK4Aj939Bj2bCS1ciHN
	 xorvn7H5fm95GfCKN/yLnxRRm92cCqtvjwMFZkg8cprnq3v6MABS4WgRnuFkL9cb/PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057312;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=aaWMoZtJyFfr3p+YbR9as99+T7BdLeEXt3wkGbMh2E0=;
	b=jsS9QGjnE2O7aep1kIRbRstHPvlyzqKarrVxZB+Hx/85oDobJB3iJikWra4dh74Eerlr
	 hqqsonnTjr5QbG839CWesvrBibJUmT1e6zm2amX4PsZKJitzgrGEdU23rcx+8NPhcV+2x
	 PAhfXUk0j0CsnG8AX7NZenDipbikJx636nxj7NGEi/mPcSQzeTBjKNmlW61W4SndFiyMu
	 5yInBekv5PaYOcC5fkG7lNH/TBlMZah3lz02yf6bIh/GnXXE0j4MdsbsaGjj+X4fESOUF
	 +XAwcp6TmlgmGC+5qTloBQ0HzDuRtsBoZB3Yz1GM4F14QPV6pIoFOvidFQmwXp8+P+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoPvvNBJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5F60A5BDC;
	Thu, 19 Nov 2026 03:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aoPvvNBJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D8F81F000C5;
	Thu, 19 Nov 2026 03:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795057312;
	bh=aaWMoZtJyFfr3p+YbR9as99+T7BdLeEXt3wkGbMh2E0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aoPvvNBJypaAW9j0i3swbhGuWBelROGwHwuSHC7Ffw0Z1U295W+HRsPNKfW4BlNFF
	 4aItVqxo0aTGPiq6TiFKsb7ZDITTDLYQNNtvQrexoieQ4+L8YdbzaxziYfKamDz10J
	 ydPrl10P+ePNZoPrh2ajUwvdcKDlMcVSdykMpw/S7XE950UKaPZxeuxud1HhZamC8m
	 LnWJb11ccNVTAUlPO5AqtRBUpagKLOR2KhEWsSrnK0WADgk//Dm2fFw9kPX7IChLDr
	 LpNZev5Yiksi811gBWdQVboV8lAA+DogXAQi6Od2SVBPZ+o/nbBUauHpu8FQSa7X4x
	 yhYctlSsMvpfA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	Xi Pardee <xi.pardee@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	tfiga@chromium.org
Subject: [PATCH v4 1/3] clocksource: acpi_pm: Add stubs for suspend/resume callback helpers
Date: Thu, 19 Nov 2026 03:01:15 +0000
Message-ID: <20261119030117.3943303-2-tzungbi@kernel.org>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261119030117.3943303-1-tzungbi@kernel.org>
References: <20261119030117.3943303-1-tzungbi@kernel.org>
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

Commit 56bd72e9cd82 ("clocksource: acpi_pm: Add external callback for
suspend/resume") declared acpi_pmtmr_register_suspend_resume_callback()
and acpi_pmtmr_unregister_suspend_resume_callback() only under
CONFIG_X86_PM_TIMER.

Provide static inline stubs in the #else branch so callers can guard
registration with IS_ENABLED(CONFIG_X86_PM_TIMER).

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v4:
- New to the series.
---
 include/linux/acpi_pmtmr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/acpi_pmtmr.h b/include/linux/acpi_pmtmr.h
index cceed294d0b5..94ddc04fe3f1 100644
--- a/include/linux/acpi_pmtmr.h
+++ b/include/linux/acpi_pmtmr.h
@@ -48,6 +48,11 @@ static inline u32 acpi_pm_read_early(void)
 	return 0;
 }
 
+static inline void acpi_pmtmr_register_suspend_resume_callback(void (*cb)(void *data, bool suspend),
+							       void *data) {}
+
+static inline void acpi_pmtmr_unregister_suspend_resume_callback(void) {}
+
 #endif
 
 #endif
-- 
2.56.1.708.g77570a6a1d-goog

