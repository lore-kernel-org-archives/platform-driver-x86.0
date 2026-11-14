Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672684;
	b=WNdY0CoM8lmNguXk5fgWFdNmHL/Fe9UTbOtIBZTCvqh0XLsyfqRLaHXIISWva4xS6fqI
	 eEMlBWIHn46hyuNdv2rKhkLwb6a8zcGBtALZse48SuYCIbq+eoTt9yrrg853i4H4SYL96
	 i26laScxpmDiu5r8AO+uhZGdURqOXnE1oYl9o9qRt6quZxAhQdlfx26TDc6y56pdOlI+y
	 26rrgzCHYJTImyiJnMg0VnMUsAHSV9fHng+79b+WGytEMVB4dXp68U87Az0G+qSGJek+1
	 JulnIj6YtAM9S00WLbEBS0VunAc7rDucj55zzpo4cMoYHlzHBQZ6p3FWHD+AMttkVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kYhEGps0UomI4ThdCaZM/6xhr977LUTH98N7MCn1AQg=;
	b=V63aPFx/TQ3CfvjDTiHep0KFLpPp9OSZir8iIu0OwRgiYt+Crjl9X3GLYGeB9en34z7z
	 o83NESdn0fG6+QrlmbBmRpGFBFrsEiwaavsaYcyf/5c2yCSCc3KB0G8MkYOs7oCXPQnyE
	 ShEm4zn3U0ku8WzhOQ9SlPqezVLnwsu4ctVETXJwhj7olWWcP/9xF3squmfJdQKzZxJ03
	 HHP5EgZli19kSZ0qyEOVT8+D0+ej1KFLni5C6IzV7MsxeD/ZWrtXWGCMDmvnAbTpnprKk
	 0kLQ50jdzlTXCvYk7Me7swHmy2kCYiXTp0NLk4kSsIiAwDxH3XjXVS3qkSBCxgUESsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woZHVd2i;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D824606A333
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D824606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=woZHVd2i
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36f6295304dso1709389eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672683; x=1795277483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kYhEGps0UomI4ThdCaZM/6xhr977LUTH98N7MCn1AQg=;
        b=woZHVd2iT20k8onAr2nEkXQnRJzo+gE+XboKYFuhp+KmzrYT6SgzU1/w8CLaRyxH7W
         MG7hnoPZP1hoTDWDHF7hpqsnitZ7bgNjWJPRhDKjaswZGCPLZJTbE+SgOSioqSU56i8m
         KaPJgYraiHigKrQF2TJpzcvdZ7ubfJ1rUoVZ+CvWKGnTNEhjHVGk2NFp9sE9OBY+umOz
         6R+imaKPsGgejASGmM9w0fbxB3Ec6Z6TOitLqyHmr5StObSyx0wRx3uFLRFJrAg1pEmU
         tEEXbqpH9J7fHogpX2xqUr9KTuElLmDAhnv8DcF4GOeM6dILd93+CZ8fHQyJuMqi91Iq
         HJQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672683; x=1795277483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kYhEGps0UomI4ThdCaZM/6xhr977LUTH98N7MCn1AQg=;
        b=AsZ4fM6pKgr97yi34IeNH9U6u5GOzjYrXnYxXZ3j/ZgPD59/2+tt/mpolywiRGlgJD
         h1WR3QLfCDIBWfwGl9/JN7E67oTvd8VFVSS0r5jYdlShBKaKtqj9kOlLBAhYIZDfgZ1N
         Po8+XcaU21QqT2gXjSZV6ZJ3YB3ZOtf7xZKSFzBvhbRT4RjkTDnLbMGq1cq8QCI4R96j
         9bht/7fsDL2HmgOCYCCafk5OqGMGCBA9UqduTV8Tf64lX/PG29i2Nc603FKuPTfSQGEg
         u9U6iwMbA/hvT+f1AT5RDkn+/JRDnSrDEIESVWFqN1gNO7U3w8kXRMudB5PEl88MNquE
         Ga9Q==
X-Forwarded-Encrypted: i=1; AL+hErGrJnSt8rvDcjX5xft2wYUBkMPytRC4kP1rRVlc/mEIsv/Zv2RppxRxX/QgPM50AF9p43ZMpiVqugRZ+HWOBSyPAOks@vger.kernel.org
X-Gm-Message-State: APuU4Z8GP2ITMPvCeK8G9orNF6U3nR65v6vy8SPWhhM30nx80Cm6eLwf
	qnq9BcLecs1mogmWTn/6Q+5UUOk4Y4OJrvO1U5BCmYhLSTbhloqmPuM=
X-Gm-Gg: AYBFou0c9H5RUuKh7LNxl6zTQ9lb7rwkxfKrWgwPoz1mk9B6aerJA6Wt5C6t9kmI88o
	qQJRNHww4L9HERwPH418mA29kweroDBLPXYXuzaejh7dRDHqlxrARRekVSJrdRmBtAR/Oc7l5I5
	m6ePlxekiBDD7wPwBMLzq/CiibVjyVMBwSh/aMyulKvuBMQuEp8E6TbPZgWIJs5YBRhaloMu8s9
	iFOwiMH0XZPsTgueliIqVKKezm2ECJLifevrbxxfuZb2WL7yM2RY2eBm62W+c90C0NMJCnju35k
	bcKdJvoAA6LzLkkDo4TGtD31mKcBrvwSSL3rBq53Us9TMkIaiGz59ytYu70bC1U8XoNuE6yLo9B
	cOhbv7g97Z2oqwU0N6Dqsod/yvVeYHKSqq4gVFbPhm3iI7u0X0A4uiD67hXkw2GhSIzYuHtb14/
	pjoL0GnYptcx7T8FgB+qcXDXYoHqhvbnXWzBG4aYkPMTYyVG0818oFi6zRhm3+samRA/Hg3P3kb
	K0TCM+aGtU+uTmcQjPJaX7uo8dsVH7rxTBdl24rDA60UDwZpiXZRhPcq3YS/VBc4N96GMoukq4d
	3ddF5TcJPkWkaD2ooX4IS/VEXjUR5Pf0waDicAcTvJGV3EWOd2Y+nvInTmYURQWpYQ==
X-Received: by 2002:a05:693c:8115:b0:36a:1008:5815 with SMTP id 5a478bee46e88-37963372d85mr5904580eec.5.1794672683015;
        Sat, 14 Nov 2026 08:11:23 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:11:22 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
	Sebastian Zygadlo <szgit@icloud.com>,
	Yossef Osman <yossef.osman@proton.me>,
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
Subject: [PATCH v2 12/12] drm/amd/display: Skip panel power savings on eDP links without a panel
Date: Sat, 14 Nov 2026 11:06:36 -0500
Message-ID: <20261114160731.3756-13-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
References: <20261114160731.3756-1-atharvatiwarilinuxdev@gmail.com>
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

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c    | 3 +++
 .../drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c | 1 +
 2 files changed, 4 insertions(+)

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
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index 7ca17f803..d71f5e5da 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -52,6 +52,7 @@ static void setup_test_connector(struct kunit *test,
 	fixture->aconnector->dc_link = fixture->link;
 	fixture->aconnector->base.dev = &fixture->adev->ddev;
 	fixture->link->connector_signal = signal;
+	fixture->link->edp_sink_present = true;
 }
 
 static void setup_test_dm_ddev(struct kunit *test, struct amdgpu_display_manager *dm)
-- 
2.55.0

