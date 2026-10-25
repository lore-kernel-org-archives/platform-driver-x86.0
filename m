Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792901036;
	b=nUZwdYo6i67+1X2lt8E2YQCtJuU5ezDJek1MDQRNQVBeih/Yv7t8jaNkh0BjLiLl6V7a
	 ff+BnC385tQotvekKQnl9V8uzvipiuHaLjd70QGs0x1OuFDlAB0UC+KLSIBwupWwUKqrl
	 Hdn6YM+XhRPWE9lYjv1jhV/XLuBfUQF/0ISEUIsa5KGy8BTsqYJ1hwccoxrNzQe0Iq20T
	 zCcg0ecWctawOoNu5OQsDO2oAj6Qi52JX6Ow1IEMLfBf40DuG5ncUblIMvq7czVHla0fr
	 bcnN70xGc2nO1crammeoaClb6M/V3dqny0lAQIF24msqsZCEqvyfvmbS7HOTzVWVS5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792901036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LMc3CYZEKLGD01XMea94oTj/yeGbugpGFxEInSpf2Xs=;
	b=lF1/HeIXIuPVWBD1dyQl58oYAvpDF84FpiqbPSk5SXm7Qb/ToekN1R5tAg7br8VxedKr
	 yHRkiWCVJgPys9J2quCC+J+7V0hbyPkI2W5gqPfBF83Hckih3ls5iQslXrTSsv1nPwmz7
	 +HatzQvnFwoGnrXdm83LEvbBfpKH0rgamkRRe89H+htsPO+v6tq8/aHcKwy5D2xOZY3AD
	 NN4n2meOI1ULzujxu6gFvbIIwfAf1QyXIUFRcb4zeJ9c/KGUGy5Y0r4d1ijttvV2OL52D
	 bgyCa5Ii/npJD6HjYQdv4v+b2xyVLOZmxol61gQcGBx0jWPncjbJlbpgREzAcCqCJ4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QGd5I5HD;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC35606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 25 Oct 2026 04:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EC35606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QGd5I5HD
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14fd9dafb0dso1649912c88.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792901035; x=1793505835; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMc3CYZEKLGD01XMea94oTj/yeGbugpGFxEInSpf2Xs=;
        b=QGd5I5HD1H6NCJpr1gY99R+GQwI6Lfi+gl5HpCwWAv7ACSrLI2nAAUBsMTb9LuViuk
         CKo6SoydrgyqUkwKqPO1rB721LH++KcE22039XwYe1Dj7/KseV8NmC25+4rM4Pdk6NI8
         bhbtA7jVr4ZkW8BW91pBWT32vYkJOHAfyvXNtD90krp0XOg6y6bUCPq8ze7VWB5+h/Pg
         VbwQfQ1zp3/PfT5eUU77bvySFBo3G9MbRfeDd6d/zugYHvQITfiC52z+vYEKXYk74uOI
         HQMc2Q+kTvsu+YNcMfLBBgxA43Xgbgh3ALGtcYt8UWVH9fLmO1IFckuKGxtK4K0cGYn3
         hFcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792901035; x=1793505835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMc3CYZEKLGD01XMea94oTj/yeGbugpGFxEInSpf2Xs=;
        b=fVvY8S603/n/vIFPIu/DyK17Kc7TmskZAB0NXg+BpvEr3Ctj5Oy6RZU9/Mis8uwfs/
         H/EOuZHkyy3BrNCiB+v1p+WaVHXDVWzv49zkve1/Z1AKpHCsjc6+pxaRIMvnzzD6fpH5
         oZu2bE8mcBEa93kWCNW/fv0KsWDJt4PZoON1DjjatsUi3d05K7/V49UqyUSuNT1j44pq
         XtgjtT7T5Vxv1dWDvF2jkfPXtgLaSno5AtWpIDfwNa6vbUCSfHDmvafVON0Wclom8yRT
         fvEvkaxpIrVAP7ctBKSCy4f8GonTGaWl3rn2gtwA+OnauYm0ayCoCxh2a4RXR7RWqbqv
         xQgA==
X-Forwarded-Encrypted: i=1; AKwUvBxPPUJ/7W+yizAcevWsF0TcnRl2Su7hvp/w40IoblKk73ExAZ3dUlUr58VBPY16Rl2bXEIM1WWRDOVgBGJZ0kn1b8Ng@vger.kernel.org
X-Gm-Message-State: AFq9FYKgtv0gX4G04YVAqS1xV0461jn9UFmE0nosWDFoMPM1vdriBJl7
	L6E5YhXKf07YJyIyx5YPdB6pMMltqMX2dR7ulnH+2AH1v+TfTU6zX+E=
X-Gm-Gg: AYBFou1xjokar+hC629MIkobk4R+Y6gSEo0UVdJASKk37j16as6zqHeo3Gjetx6NajT
	fCzC8BzHlfsay4PzqOetJMpQcoqDEFVMbvae4shM6aqZmOlRxDDQroVRPub1Zr4gRU+CdN+7vne
	ckslqj+EM9biAcU3tG14+6s+QK4HXw39KIOIc7bvuqn9eOCOjpWgXiIQhJF5N+zDV1+pKP8rA6M
	86Nj2/EqFDkXKNe2s+o5i/sPCHU+vJt4+RZf9xWDjA7A2u9vek31zWMNBu9q8Wwn4TN5yNLI+HS
	iI5jXYjabCjZxof7nOS6IHIVFluI3LnmU74Vkv3KP8uiu6ZxUxGpF2NMUoknJ4wptdUvulQDFXP
	VePbtuLQmy7lwEWqLqIcKkHu84B3y8VWs1S2ygZPPmP8Qg/zVUCaQJPiW7W+M8GGWE2YkLv4nB8
	8SSoHdF2ZIjG95wKGELmbar8sxHW+InACE9iWjRNpX7QGCGS1QIJyuM7sfkrSJc0TLlZPR7Mk4/
	aOTBLYkGAEYO9E94AwrueYFtIBKeq+uHsx6J0URXFPWGnimw3MTyl5Q2gS1/LoP63wYzaKPuomq
	TaMhp7n5Udit5k8=
X-Received: by 2002:a05:7023:885:b0:16e:6e3:9a9f with SMTP id a92af1059eb24-1993639e6efmr6212921c88.34.1792901035199;
        Sat, 24 Oct 2026 21:03:55 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.221.76.40])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a32ff780sm11635283c88.22.2026.10.24.21.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 21:03:54 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Andre Eikmeyer <dev@deq.rocks>,
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
	Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	linux-pci@vger.kernel.org (open list:PCI SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
	platform-driver-x86@vger.kernel.org (open list:X86 PLATFORM DRIVERS)
Subject: [PATCH 11/13] drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
Date: Sat, 24 Oct 2026 23:59:47 -0400
Message-ID: <20261025040046.1602-12-atharvatiwarilinuxdev@gmail.com>
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

fwupd reads /dev/drm_dp_aux* while the GPU is runtime suspended. The AUX
device holds no runtime PM reference, so the transfer touched registers of
the powered off GPU and caused a CPU CATTER.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7261317d4..b099bf520 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -24,6 +24,7 @@
  *
  */
 
+#include <linux/pm_runtime.h>
 #include <linux/vmalloc.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
@@ -111,6 +112,20 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	ddc = TO_DM_AUX(aux)->ddc_service;
+	adev = ddc->ctx->driver_context;
+
+	/*
+	 * User space reaches this through the drm_dp_aux_dev character device
+	 * without a runtime PM reference. Refuse the transfer while GMUX keeps
+	 * the GPU powered off, a register access then hangs the PEG link.
+	 */
+	pm_runtime_get_noresume(adev->dev);
+	if (READ_ONCE(adev->gmux_off)) {
+		pm_runtime_put_noidle(adev->dev);
+		return -EBUSY;
+	}
+
 	payload.address = msg->address;
 	payload.data = msg->buffer;
 	payload.length = msg->size;
@@ -126,13 +141,13 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 	result = dc_link_aux_transfer_raw(TO_DM_AUX(aux)->ddc_service, &payload,
 				      &operation_result);
 
+	pm_runtime_put_autosuspend(adev->dev);
+
 	/*
 	 * w/a on certain intel platform where hpd is unexpected to pull low during
 	 * 1st sideband message transaction by return AUX_RET_ERROR_HPD_DISCON
 	 * aux transaction is succuess in such case, therefore bypass the error
 	 */
-	ddc = TO_DM_AUX(aux)->ddc_service;
-	adev = ddc->ctx->driver_context;
 	if (adev->dm.aux_hpd_discon_quirk) {
 		if (msg->address == DP_SIDEBAND_MSG_DOWN_REQ_BASE &&
 			operation_result == AUX_RET_ERROR_HPD_DISCON) {
-- 
2.55.0

