Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672649;
	b=LWK4hmONbhyvw7yCwOgGf7B711hMoV38WYhYFJMU7NPn/QtQq6C8caK7bx8XqiShU7C1
	 QWpfEjArANpX74ierqhlTVJUb8G/olwlJhbhep2O5ekpH3d1KZD6KzvX12hFkKOB03CrF
	 gZtJ9eEwcOG3QdwUxj7GovGrKMus9t9MnsuH68hFAtu1OhmxKoop57LMSGXOPWRiGof8l
	 dpkqCi+PVSd1dEEAG+4IWLOMupgAwQIKExb2boODzlFHsFafwKw53D3QTbi4CQyIkK6WU
	 B/CP9MFo5wEUd/an8HafhE6XZ73jYyVIxq1I0bUXEPC2cnnf/Yx0Im82AgGFJw5dt1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KPSDYqCooXPcCbLVRB9OOYzMNaTmNZPbW1+34+f9KRM=;
	b=tsrDVoFRNeoTJ4nAi0ufE0E/H2to5AHllAUSzb3tOB7gUVAMFVT0S1HBSgi9jd4EehqL
	 vrLc7GuJaQN/YDeJhvU/5dPxAJkJaptCrmb/azYAE1+lCtccwglNwvBLgWUDVpVCogRwJ
	 YYjZsUf8ZBb37UZVshaStMIOZgbGeHIRmCqZbRUO9lDfgk3p5ZvgvSHaaLq8paiFg/OUS
	 CUnI1jODsFORvCcgAmS/Kyatq2C1ZqUmWlWsJHPGEcZmxNCbWTwni12pYFLhmBVPnxwVZ
	 cLX2E5qkJjNGtx77fh+U0FjHAVEqMVye9ZFp3dcHAItQaaSLCJEpv/Qu1v0mS6ZL97Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UI+8X9u1;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460D606A330
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C460D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UI+8X9u1
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso2557816eec.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672648; x=1795277448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPSDYqCooXPcCbLVRB9OOYzMNaTmNZPbW1+34+f9KRM=;
        b=UI+8X9u1K6VpjHdMnY8BtVFWuMOw2NqNYUAUYXDVrOZUKQ/I2nEt+VAnyc5dX+W5d1
         Mddl/IIWkuZh9WdnaqzgenfUuwuCVp/CE1Mef5Pc1hSXmHS9hzNnikBReI0hM8WiKEzM
         Oe5mC78RbP/wKBnN2j+dUxHEvzG9wI/NPe2fh56u22u9KazAlkYyNcE6kEWROzlFv2P1
         P8JNWjX58l8eFhjHw/VwzrliLLCXZwm8KmXeo+KhRMBfTgdcsbLauCnnVypp5FzpRjT8
         gBg99LDPl8pMsgK6CW6AVxP2aDI3T7PjJLaqtYuVD75JLwCRLwWIRYnOc+7S2iJ4FzpC
         dL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672648; x=1795277448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KPSDYqCooXPcCbLVRB9OOYzMNaTmNZPbW1+34+f9KRM=;
        b=0phnPHVUuJ2kovuv+DQZt7C5u6/TxR9ORCypBKyUXblaeBTaTaN3xQ+eTwigS0Lv2l
         2q6GdnNVJxqpnF1JkwwYT+dTR9N1lJ2N0WOaVV58zlorGHbZCJthyfJCW3ufcKPcgnUs
         h8wbzaweG7z5Zo1N6cpDN/4wdJrkDTwjkXaPczdt9XkxeDOYUmdD23qdrLR/wTSRATQP
         hKbauanRT5xBjIwmXfv66JbbUzUxeNlUcUT3+Sy4NIryFaXyBV88OPpSbrVFGdidhz9C
         IPZt6M7WcAjWTqIzfw7hsokYBYe63YVHDPc2qST6yPpfqM9PY3dl4re3K6eZUjH+HNfS
         u7wg==
X-Forwarded-Encrypted: i=1; AL+hErF7VpMcNTj+012rAGKvooyMse8l+KAeIhSLihecsnE3iwWkB8JOno9QVt8gFoJvFen+n+10nxcAKpNVtKgw9B4oteTb@vger.kernel.org
X-Gm-Message-State: APuU4Z/43ZgOU020ND6qJxYchN3qA7B65vo/Yg31zJRypoO5Cl1s/4sc
	3mdW7RpSSHFdovNXm45GvwfeQPm/Kzn9O8mvi7aKUYch7L8IP9tAB7w=
X-Gm-Gg: AYBFou12R8zJ5ofhfg+bU4zeWCUTQeZ9erL2+QLDxbT0WQ6+uO2lb1DseSYheZ54d2p
	DXwNbkfEhv1AAE7499ztXvowPRxXc3cv9ZsulE+Rblt+hjjdRutqo7FccIUcEm/eiZfSE+UGhAo
	cJjrPg/R6K5qGXedFAJxDrc4XMYc72WzV4oCu2aVyCcEXvWtwc2HI8gg1F+rWc5m7R3PaJzpU7/
	slGP2uYrg13OD1jcAHDuDCsAN7WgEPv40YzYR32qTxzkvTPGJGvlY2TZX1JDe71rppa0jBTjTEm
	bNSOkhxGD1RiRB+6NCpebrPZRT+Jw8R9n7uDqdv5/1j/sb2SGRIBbADo3Ar07UIRNeodZC2LJup
	Se0WFeqrbspvOru2r3pi5AMdWShQjOZaTokKgAQfRbfrcWdvaFlUk9ehNsKg/Cx5Yn7pweqiu3k
	7nDzd1uT3m6tDYF08i+1zLMhP7gJ7h5U5T0ESD12M0K+cBTthztiIJqXzwScfQvnH/SMWdc/gJE
	mZ2t+6ngn74lviFkSDSXcJq/HE9QQueWq74O2p5B2ylNmiuaonUr7I4lMZdm1YazgUw7WL888Ma
	sSdnAwCNtGcegnjMZZG7H1PHaVegMLzN+WpgGcJ9icn64Fg5EzhzcbRkGrIK/fp2OA==
X-Received: by 2002:a05:7301:5401:b0:35c:8b96:94d9 with SMTP id 5a478bee46e88-37966f31fddmr5041718eec.19.1794672647666;
        Sat, 14 Nov 2026 08:10:47 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:10:47 -0800 (PST)
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
Subject: [PATCH v2 10/12] drm/amd/display: Refuse DP AUX while GMUX keeps the GPU off
Date: Sat, 14 Nov 2026 11:06:34 -0500
Message-ID: <20261114160731.3756-11-atharvatiwarilinuxdev@gmail.com>
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

fwupd reads /dev/drm_dp_aux* while the GPU is runtime suspended. The AUX
device holds no runtime PM reference, so the transfer touched registers of
the powered off GPU and caused a CPU CATTER.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 7261317d4..0d11a9443 100644
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
+	 * check if the gpu is active or not.
+	 */
+	if (adev->dev) {
+		pm_runtime_get_noresume(adev->dev);
+		if (!READ_ONCE(adev->runpm_active)) {
+			pm_runtime_put_noidle(adev->dev);
+			return -EBUSY;
+		}
+	}
 	payload.address = msg->address;
 	payload.data = msg->buffer;
 	payload.length = msg->size;
@@ -126,13 +141,13 @@ STATIC_IFN_KUNIT ssize_t dm_dp_aux_transfer(struct drm_dp_aux *aux,
 	result = dc_link_aux_transfer_raw(TO_DM_AUX(aux)->ddc_service, &payload,
 				      &operation_result);
 
+	if (adev->dev)
+		pm_runtime_put_autosuspend(adev->dev);
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

