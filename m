Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901049;
	b=AwnUH4yFgvoVdXTRu69JUL+az46XtpQuyrxAe8s80/sA30zALFL/HGAeRprewUipN4Iv
	 sLAkoDW98+fxRM940uAN9Tm4bU5zBYXa1aUQE5bdINwH7sdTOXaIroYn5SCGohNvdtxYg
	 ChjbcDskfQwC8aNwb9PnGPRk4a6kMTWwWa0Npcn39VIPd4lPgMutttUF8F2d2tR1inEPM
	 FY4I5Cmip4+VaIglNaECl22+P03B2JJlxEWHegTmJFg+cuj/Ju6UcRurgKEuHMFVfhyZA
	 i3Sp1i6cwnN2rEsEkb7RB9Qzs3oQ1Xo/Fe2saiMH3EtMI3eIfQxHYbyY2srsbvPSXvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901049;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HlYNTG1YeavwC+hNZqZ9gnXD5hsIPEAX4XNijQPWf9E=;
	b=CXefj6ugJrCby4E5puVjUzd2gof8JtApuWB4bMEFPDc8GQbg0Gx/wfU6+dU+uabfs+JU
	 35ISUByvGqoDyijlARDiTEUE7+L4sO5+vYRRpkNQQ8hXWSGQGPwEwLu7XwtL9ChEb+Aip
	 tZXm+3Qp/AqW+MkQXDSyv3CNmuMYVbZgGqkV+lnDXTYX60B6607f0ANxQCCJtdyR24ZRm
	 sl2wLjVLqzDmzwowkc/6cDH5gaPfL+NgqwLBsj2YRDTB5gOZsaPYtBGGM5sU5l/cB8Hfv
	 j+uzBeY/Q/lmgiKZJKdl0AD4eWKuXBPsg9lvqaJxtT0uvVqSXGllnJKKdGj9e1bdJ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9SKuc6l;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B651606A336
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B651606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=L9SKuc6l
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35829219da8so3698652eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901048; x=1793505848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HlYNTG1YeavwC+hNZqZ9gnXD5hsIPEAX4XNijQPWf9E=;
        b=L9SKuc6l7H2xpZ1V5KZNPlLweEJXM4cfELyqf0EUFa6eSqOjr+QKnsRdDfoyqAgqA2
         rdQcY6UPG1T2QMg6w6WpbXAlsoN8kWZykxClLarrfczhRYFUntL/t8I/giAXuzP2Cf1o
         R6W5/UB9mWrShso0fhqK/jnmBWsRHv1YUiT++MzGr3aT8hVanXIprRbcwlEUv6u376So
         KLJpOiQcPsyxLQ0JCcaKzIFEpLeM6UVYIN4EZpyjm0v/BPinXiXplRQTMBFFz40UjkTP
         i6R04EZZ9aVIgsbQ9nbrobfT1tFwoLFObp6+b/Ml61aJmmthENEB0CpO2Re2o7hZDKq8
         vIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901048; x=1793505848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HlYNTG1YeavwC+hNZqZ9gnXD5hsIPEAX4XNijQPWf9E=;
        b=PzPxzagnG6xf8Pao0msqluL7KXcAPZ/zU3yaC+2vgThY6Yts8DRDouv1IBEmfTW+ja
         4voquzTuqXCMY77LE8ScvpULcddEWssW/uLSWv1ITLGrf3/NlX9gXXVuMbs0iYqv81Ol
         b+Ljs/jVhkPja5Bbj9ZAD96LI697NYVHBFTjj91Tidr8ytPHUJbSG6CueIglzK9AHQT8
         L2qdWdbBwvFcaaC6FY8MoxwfHjFhdy4UKgrmkIUi7d00um4T6d8CV2J2NAAC6TAm5i2Q
         KQgMEa/2z51+51566yLafCHcEgquEwYyfue8gBLwSWTbVDs2ayOyYRfzHHJKYcW6380K
         5L4g==
X-Forwarded-Encrypted: i=1; AKwUvBzFvJaqtKc3zepWjfxsfdcIhvVqdaLV0hDuv6jCbTsd8wy7RMM7sigYk98C2bg4LJczK4aoUzAvS5K33nQ1ZVzhs7Po@vger.kernel.org
X-Gm-Message-State: AFq9FYIvLE4s59V3eT4A7HhlP7dvcHt/hNOvsA9Qz11Fop8dv9juTXJ0
	TC1GXRaojpvW7FG4qE9jtOzOKqxZMDswI5SU9Io5ogyeTtz65trLPtc=
X-Gm-Gg: AYBFou1qm8wBLr1Mrxr4pkN2avFaZ9Z6gDhiXtmftxew35WGBTLrlmVA8lLu5jkrpoq
	6kwAdr28tGb+TuGMHXiyMW5mLFO69Nm987fppRS2C+5wKfFq0UKCdZNRVApdkJCFVtpRfkUW5+5
	Ulrd1qPtygN8PWi8XRy3Cw8neevsSXz0S6Q3xS2IV2Yp6sxYJOcGEoJ0oWa2eN5HReMdHvtPpsg
	wlMXpjAqROVdU9geMVn8evgTIs8nC7/S0d25GkPQVlbSlcVtd+Sgn7iPabFhsrLGrM6IUPXgsSY
	ZufOqYPRk0p4POzEtJygyGkPOAK9Df2q4FMNNST0DMe38rccLUTUsm97WpXnF7jbmYuh6ATVKZF
	WaAyoLqJgaRQ0FZQ2mous7ri7iw+ZyLv7lAoFzTsI9o7kqbmD7iZWeInCHnpSowDRFlgGlsQu63
	OP2WZaUF9qzVQJJKHjDLULh1UyWPmZgTcAtVev3R3ehpcq4Qt+1iahjTlNwhzm3sipAkTxsVtUc
	syCmIi1XKLzhsREgI8zXuOTJTwNzzS8/rBF8GeInO3oVDkCMJQApxdWCcsZ8X7TcSLCreez/wO4
	UkjzsAYC4q1IFXFQW8v+EJKsA4S6xJmGNSWvTHoQXcLZ8WV+oDFjvb/+50hvhBA/yw==
X-Received: by 2002:a05:7022:5f14:b0:146:5f73:d45b with SMTP id a92af1059eb24-1994cb430a1mr4374141c88.3.1792901048032;
        Sat, 24 Oct 2026 21:04:08 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:04:07 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Kenneth Feng <kenneth.feng@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 12/13] drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
Date: Sat, 24 Oct 2026 23:59:48 -0400
Message-ID: <20261025040046.1602-13-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
References: <20261025040046.1602-1-atharvatiwarilinuxdev@gmail.com>
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

From: Andre Eikmeyer <dev@deq.rocks>

Plugging or unplugging the charger raises an ACPI AC event. The handler
sent the new power source to the SMU without a runtime PM reference, so
with GMUX keeping the GPU off every SMU message spun on skipped register
reads for seconds. A runtime resume racing with that left the SMU
firmware unable to start on MacBookPro15,1 and the GPU in runtime PM
error state. Record the power source only and let the resume apply it.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 808be6c42..b64f0b681 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -30,6 +30,7 @@
 #include "amd_pcie.h"
 #include "amdgpu_display.h"
 #include "hwmgr.h"
+#include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include "amdgpu_smu.h"
 
@@ -498,20 +499,26 @@ int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_device *adev,
 
 void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
 {
+	int active = 0;
+
 	if (adev->pm.dpm_enabled) {
 		mutex_lock(&adev->pm.mutex);
+		active = adev->pm.rpm_mode == AMDGPU_RUNPM_GMUX ?
+				pm_runtime_get_if_active(adev->dev) : 1;
+
 		if (power_supply_is_system_supplied() > 0)
 			adev->pm.ac_power = true;
 		else
 			adev->pm.ac_power = false;
 
-		if (adev->powerplay.pp_funcs &&
-		    adev->powerplay.pp_funcs->notify_ac_dc)
-			amdgpu_dpm_notify_ac_dc(adev);
-
-		if (is_support_sw_smu(adev))
-			smu_set_ac_dc(adev->powerplay.pp_handle, true);
+		if (active) {
+			if (adev->powerplay.pp_funcs &&
+			    adev->powerplay.pp_funcs->notify_ac_dc)
+				amdgpu_dpm_notify_ac_dc(adev);
 
+			if (is_support_sw_smu(adev))
+				smu_set_ac_dc(adev->powerplay.pp_handle, true);
+		}
 		mutex_unlock(&adev->pm.mutex);
 	}
 }
-- 
2.55.0

