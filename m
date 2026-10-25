Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901063;
	b=nzJzEboMvHALQQ9fodoIcysYCluFhujsa6NMSA+IqomQWr03VQGDV8XpK8JREJIKrT63
	 E7GCGE9ZVZH+eRHIu5Data47k60pSUtTSTLVYpkIC4jZMaLuGSjZ30WOCwVsH46dM59KP
	 Xp78nxfdVU5GG2MQAnadni5qA1b+2lzA4/erLK7q04ItwvA3LoeXhV3dGlpjgYtW9tj11
	 Z53PMKNLQ10u7ogCb9knX3kxRz428lxRBffUtBXsuFTeJT3jqv5QdloL5ZoZgtouCJSC1
	 jgXyaDMuMBctLWdYqJltmpUv8ZSEdKacxPgCjFKVivuBYDduu6FManKaP4azuO19pwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vQs/9/+ieViMtOkwrXjmCA1Fgb4ppa6TVTluwiw88qI=;
	b=l9sLQuHXS4c3E3JJRC1irFJYj4EtouCFDPnnvoLNXc7GMhfm+ZVGVgyHb+A5ESIAyVa0
	 aakSxbu/P4u27I8QFRum4LjAHsEqTCu6xEVIYCOUuYBuGt4P/J/5DyGlqRe20ty/LXjrt
	 KCyz/zEIubNA/eAvc9SbNCqfj33gXvALlqEjsiGXRm5+25ntf2+2YrwpRhF/M0wFD2g9b
	 s7vThYO+HVaGfj5R6knD2aaSPmXi78h0tuLeKQYx/xFNvFaC2b/8q6L4DWEkAyNDZZYUH
	 /A5VyXtnl1728gp5C6FDx+kNCEo6GkaocVmyKlTQlozLn3dt2pO0cqBEC2XOzLFbSsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuEuwjrk;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEB8606A31B
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BEB8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZuEuwjrk
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-156cbe59622so1286172c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901061; x=1793505861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQs/9/+ieViMtOkwrXjmCA1Fgb4ppa6TVTluwiw88qI=;
        b=ZuEuwjrkFboCQLGl7BO2g51vb3rO2T1Zq3HL+L1LrQF3k84K+22gz01pRvMt+zTJxV
         QLj00NAcQInG23OG0LnXkT+0JNGBlWdTvDOZYFtmAE10mrF0MRPo/VnWzTYBOkkc7zC9
         5UEPAePmilbPJZUKVmor0JbEDyEC8DNOm+7ejcDgJEJ5bg5KOisbWji+jXiT6KBk71XN
         c4xV0sVi9yvbLXChvhUBKDEam0m5AMjGV+0whDwCqrLhWT3CHDV0GDraYk4eHa2W5JEW
         8GczFoOp7CcbUxJ6PPG3JTreoi0qckGqavfgY/uvkl1kj3h0/wF7wKeNj/h3TmWcFTMC
         rk1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901061; x=1793505861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQs/9/+ieViMtOkwrXjmCA1Fgb4ppa6TVTluwiw88qI=;
        b=S/oSA0GlHWI1nwBNNOajFpQ9sv4oJDBeI39cinHFqIa+KNfSGUwnMv1cbXeIHYv1Sj
         YQ7RnR+IWLZ6wHc8yU/nZN9FujsgReyKNMPH4dbgiHNBQYbct9v/6WtQn6ZnxoLiIWX6
         A6bIH3BrJ2Nx6qLP9xMumtG10CL2Ha/3gOH8/+sKMQI3K53awea8vCB5Bz3c52KemJ6O
         WUID4flNmg6qiBeW0voHjnvGZh1Xc5N6Gngo6FaAUTShBQ1xMAzABHJUk/L6cOyUCiy2
         yUTS57gAXTX3pwdC4pmkpm92mZqOhvJaiRCzpSGk+2Ebj5z5PATuIo6Z/L0KGNowGJr2
         6Rdw==
X-Forwarded-Encrypted: i=1; AKwUvBwujOUYbYx2rQwkzO7BNuJl4/1G86BPvTBuVJJTQHocRjJ4rqvsXsqiBIOs88MYqnB4ROoJw6ju/n6Drfcl8btrQo0q@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9jVowivTPL35097oHHUqheBZ56c9u+FbpbEYI/ScEUnvIH8Yq
	X77tpEd11k1RosK25G36jyXKeq6z83LzKKMaQXeDJmAT2rkVoYg/spk=
X-Gm-Gg: AYBFou2NzYqICiTjmkolsNo5x6BdYb6s1A+4lMEcOYPsrIoO/z0PY7M5gR9LCL1f8GH
	zLm83rd5Xeb797g5R5iLkH9plW86ihQO33jPIq3vuXAghhFYJuFBWniVJ8EP9xewIpNb+NxjIcb
	ybVM2O6SAJ0uUbeAbTz8om1w4KpOecX40zc74vV1ON/Y+dpbivN/rxz8Iu0ve0WLCyBeV0eRM5b
	rCrhMgFFyG+CdPPTCT6mjDx8W+RuymaelozVs0foZQKpFTshp+q8KsYfivnLAyyTwBH7jUl0GJu
	qzKhASLEDo8Mx/4iW/ZyIxrIn2PRCjnV68kJdwqnIsOdMaFLq5sijw56DNWpV8dwoom8FGsNTBt
	F5qQhqf8/0UERzEyEGDsOdM0i2xnoySc6X+BV2/uOkgPjJEkP6Ui9FznhP7gY4w/jF/IZdIdeAt
	npMWSqY5LnrPsxk+FaW5ezKuOG8O3SGvwGEnV+mDovRoGm1opTQs0Q5zpbtwXrpNKzqX7XTLQ6m
	lKU2+dDDXPs2VYKmCsMtfhjuURnyIYxrp1sr6Ru7UeN55j7z+NrgWLtelAHR1uD9Z4yyhNRmYrS
	LIbvo3s4A25skK2gl6y/9En0UqEvZCReITAHVFU+B0EQEQCF6J56XSexjTjS5U14tGHGodCgyJH
	qjFR2VemxF7g=
X-Received: by 2002:a05:7022:7e0a:b0:15b:afce:62c2 with SMTP id a92af1059eb24-19936e39a84mr5336469c88.41.1792901061085;
        Sat, 24 Oct 2026 21:04:21 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:04:20 -0700 (PDT)
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
Subject: [PATCH 13/13] drm/amd/display: Skip panel power savings on eDP links without a panel
Date: Sat, 24 Oct 2026 23:59:49 -0400
Message-ID: <20261025040046.1602-14-atharvatiwarilinuxdev@gmail.com>
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

When GMUX routes the internal panel to the integrated GPU, the eDP link
of the AMD GPU has no sink. It still exposed panel_power_savings, and
tuned writes it on every switch between AC and battery. Each write sends
a hotplug event and the following connector probe runtime resumes the
GPU that GMUX had powered off. Only create the attribute when the link
has a panel.

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 703d0617d..c8fbd2167 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -761,6 +761,9 @@ amdgpu_dm_should_create_sysfs(struct amdgpu_dm_connector *amdgpu_dm_connector)
 	if (amdgpu_dm_connector->base.connector_type != DRM_MODE_CONNECTOR_eDP)
 		return false;
 
+	if (!amdgpu_dm_connector->dc_link->edp_sink_present)
+		return false;
+
 	if (link->panel_type != PANEL_TYPE_LCD && !link->panel_config.cacp.cacp_supported)
 		return false;
 
-- 
2.55.0

