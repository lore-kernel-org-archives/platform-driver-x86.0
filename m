Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672667;
	b=srCulFM5yK88zOTeuP/oYQFGXHk1afbgtDcFVHOPfDmXTyfoB7+0oxdVUC4P1WWd2MXU
	 J+HPlGTp8ypLwnPepI4ZoYzvAzXiL1qSk5PeQMf+aoSl27u2EP4oGJX+yj3X0c36rcLIl
	 fjeNeLgFJGQbd8hdCoD9Og1sajbKW93pkyXnHg35O1wp81QtrGTR5OxikkZF0pr4mMAir
	 tvC88DNk4BByQAqRsHcbOxRWanv5Dpg/fYyA+Qhn/KjugKzPdYLpr2GttI0tMR3l9ahCh
	 DD3MzmqnXhZMbdFjzSF6CHXWipseJifnUvpPWeDNAhWI0XoNHRxzJoErmkJalyQPaHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MmSYBT0oM+9e7OOhRP6rlPjvDndoWmXiY3l/U4zXmz0=;
	b=caJUJzojpw1uyRkpEgnNa4/HxCdEvtFpm4nr9qyz4vuHjRIPibtbrZu2xyZipUMwodNV
	 XWWPJL74vgeDnHoTs9MSVb52aFhlGcC2Vb/f9LmY/y7dltjFTPAhka4nxmJWHmcqVVTDN
	 IFHdkndbYYWrShHaiJHOWUwiiASiSQR1SLduLZQHGihp+3MJOdn/vFKyqgdbh1/qev9ly
	 fBVb38b3MhJ5F2gg+t+tkdzGfxv5NtqXOGyJwwpj/e4Rkv620Gfx5foX0CbOomBvKx28H
	 CVAffvWyokxK/kW5vrli1ZaDVqzY6oqqz9n1Slas/4CpTnf4zuD75AFFni9ynE2eSqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUiTkYMN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CB0606A333
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4CB0606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUiTkYMN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-37000e7234bso95225eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672666; x=1795277466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MmSYBT0oM+9e7OOhRP6rlPjvDndoWmXiY3l/U4zXmz0=;
        b=qUiTkYMNIBLLP6fruNVmymNOken5TH+ZMKj5c5qKCKzeNVQPk+UaK2+j3L+Tsv6ICm
         iUKuZU3aJlISkT/LuB0cFXQrpedRFoopgVw6y89nfkdBmJleyM/yS1fXDhyzXYtwFJuc
         7rsC+8GPtcECcw8RNmn8s4e2Mn0wQNQL0xYzsVic78lR6/bNISZKbpLiuIGDvQRCw7Ok
         ONfNaklfm5jAMQq95jt5HLSQih5LyF7q51PHZTucnSBsklZbFZGhLrcriSClBAIFbY5h
         ZYIp5MBvgIrznXz9Z7r8myawp1pmbK7u4khIfnRegOFkmWsBgXWk3/ejyhfyRPWYhGZd
         sScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672666; x=1795277466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MmSYBT0oM+9e7OOhRP6rlPjvDndoWmXiY3l/U4zXmz0=;
        b=zb/fBw2/hbMA+ba3KAyju7cdKE9uOjJbN46QALvvRjo0QnJZNAW0zBOcW1u6fO/BRT
         +g0cCFO4Rnz7KcjRLKFTJ8ZdhDZXsCZfQAsc+ZY6IBJ+xvdld72XtO9wWRkbhBlX6I6J
         Go+CwBFz5LcXs74XWuDcTBkkEQdsd03Uj3FcBeGWQH+P1Hsuuj46W8o1zKTqH+vY2Z5/
         D8iSbBhM6ql4Nlx1ep0ubj7L1xCcIEIxYxtGnBka1eFBuF4iQC9bbyOp2zdcr9f72s1/
         +ReYhYWD2p4zlEZHmbIOxHM4MokrA76yCCBZdPFIi7sMrxaVNeXPziFAse7pHUiZ/MkM
         6thQ==
X-Forwarded-Encrypted: i=1; AL+hErEe6AahsEEJQNOqqkN9aShJY+OmXPSzE5St8BsJv4rbnRSXdeFgSPPGFMIfbJ6i1ZNpqqdOoWsb97hDfRfxRJQYorBW@vger.kernel.org
X-Gm-Message-State: APuU4Z+Adx7fSmISIWFKsVg4ZElvPetE0+HmQBtt/0tgpJpTx+xOPMrF
	0xmcSDX17bD7/FFy5+dOKtrg/KZ3qDP1j2jPXeW3Qnnzfwsq5kBELHI=
X-Gm-Gg: AYBFou1YZdXGoczoPxuDboeJeF3oJLAFQrnfuVfs7EaRRo4pEwZq7NmA9vjJ7jSSEPk
	PeorE592lxiHKjD3+jZiTivZB0R4cfkvAFp5LF+b8vCIL9EAhNsPaxWK1cz9WuRP2thHwtF3hAp
	/brVgw4jU6UDC1qB3E9VP6+nEZx+6l1HwUugRLUjGzkqdcwlCjUCp1hcro8tHe6a9e8vnGqGhFR
	rlnmNh8TxgwREavw5TUgnj79l2q8ESZJHygjeq0KfaOZenAGGThsRGsb6o4icGifoyonxUHXQeL
	tJVIptPp/k14AYzM3SDuDF/YBi7tdoAm6lnxrcEGM7nnhlx7795L1Imb9TnxsLTxSF0O4y+hQje
	ZD2i6XiD/aDLyuOG+vFOkCwu+Ycqk+U9FHiqZ6U5E0+/kSE0M5dmULtp6vAsnwWJ2oLmg4npJy7
	aR3deyQpCdHOZ66/uxcq6MDP+lF+oOXAtZCWNfvKrIHPNWCY6dy7IvZpS3RS/R0+dxh1bGkeAXQ
	IA5fPzAaX88CUAcnCEHKYPOVM6lb/eCjEgw0jNhA/HeOzNl7iNSFv4tMMKh/jZYpswu1ZwOpxeq
	rQAfvRNGboLjbuyZXB4t1r6GB7ZKs3ypoRANitY+V4Zofh/Oe0G6m15urDKg7MiuDA==
X-Received: by 2002:a05:7300:cc9e:b0:372:2ed7:8f89 with SMTP id 5a478bee46e88-3796702a36amr5694460eec.34.1794672665837;
        Sat, 14 Nov 2026 08:11:05 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:11:05 -0800 (PST)
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
Subject: [PATCH v2 11/12] drm/amdgpu: Skip AC/DC notification while the GPU is runtime suspended
Date: Sat, 14 Nov 2026 11:06:35 -0500
Message-ID: <20261114160731.3756-12-atharvatiwarilinuxdev@gmail.com>
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

Plugging or unplugging the charger raises an ACPI AC event. The handler
sent the new power source to the SMU without a runtime PM reference, so
with GMUX keeping the GPU off every SMU message spun on skipped register
reads for seconds. A runtime resume racing with that left the SMU
firmware unable to start on MacBookPro15,1 and the GPU in runtime PM
error state. Record the power source only and let the resume apply it.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 drivers/gpu/drm/amd/pm/amdgpu_dpm.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
index 808be6c42..3c6dde386 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm.c
@@ -30,6 +30,7 @@
 #include "amd_pcie.h"
 #include "amdgpu_display.h"
 #include "hwmgr.h"
+#include <linux/pm_runtime.h>
 #include <linux/power_supply.h>
 #include "amdgpu_smu.h"
 
@@ -498,19 +499,27 @@ int amdgpu_dpm_smu_i2c_bus_access(struct amdgpu_device *adev,
 
 void amdgpu_pm_acpi_event_handler(struct amdgpu_device *adev)
 {
+	int active = 0;
+
 	if (adev->pm.dpm_enabled) {
 		mutex_lock(&adev->pm.mutex);
+		active = pm_runtime_get_if_active(adev->dev);
+
 		if (power_supply_is_system_supplied() > 0)
 			adev->pm.ac_power = true;
 		else
 			adev->pm.ac_power = false;
 
-		if (adev->powerplay.pp_funcs &&
-		    adev->powerplay.pp_funcs->notify_ac_dc)
-			amdgpu_dpm_notify_ac_dc(adev);
+		if (active > 0) {
+			if (adev->powerplay.pp_funcs &&
+			    adev->powerplay.pp_funcs->notify_ac_dc)
+				amdgpu_dpm_notify_ac_dc(adev);
 
-		if (is_support_sw_smu(adev))
-			smu_set_ac_dc(adev->powerplay.pp_handle, true);
+			if (is_support_sw_smu(adev))
+				smu_set_ac_dc(adev->powerplay.pp_handle, true);
+
+			pm_runtime_put(adev->dev);
+		}
 
 		mutex_unlock(&adev->pm.mutex);
 	}
-- 
2.55.0

