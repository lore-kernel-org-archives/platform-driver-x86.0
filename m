Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672629;
	b=wj8/tzn3aEh2GRaBHc6h93kfnKCDIahUYqb4xCymZbY+vLqzxUjySw43w+PY7+CIbQ1V
	 ApQYOOGdnLQw7+fZH4862T7Gs3xtFyvmIDF4edgOcZ8a/TPgpxq0eNAfpjRw6GUvgLNhv
	 tbq6yaIbj71WLLPpOJyHLlqHMkXBzrcOrhTjUteSDoz5h8nGF/kVEmqoHN2GGpp7K5EN2
	 K1zIiMqmTJFi50SwmYlhd4SLyIVkgL2lLnasyQSiOqUAsIobW7F/xRWFBh9VvbdJjTH2k
	 NqjDvxOMmjWQ9fSImG5wYFa1Lf4V+sjXIsmKWuB6+EDEPsTfNWUFP0VW7C6s9QUCIiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sS1w6ypVXjVKbAJDNdl2VMNTbmFYN5LqfnAkQkSsnPU=;
	b=1+EdVQwIR9tztUxH4Od6zHuu4qOWZGYFv/yScbPzYowlCT4kvMXrGK2tjkn7oZZym1Ot
	 oVoRK4r0S7QpWB6Z27EFVcTslKmcp9DXICIKfTcYeZfTe/08JWk+SJQEgVF5HKuIDMsjY
	 ADlX5UxIgMhdvyihn9CfBntf2Tem4HrIUolT9qSHoTeFNr6c/nmKXl9imBSRNeryWl8dC
	 /TAaf5zjyA+NyND19fc+GiWon7q+wGraYlWpP6a8Y9sWXF+ed4mRQfolf20AltEhOuNwg
	 cUAHAeZ8VqSga07GiRucwnpyJ60fUPtuuzREOy1uZMESLxwYaAI7NJ50RGA8SGTH4lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4LiLLZC;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B26606A323
	for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 16:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28B26606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4LiLLZC
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso2581591eec.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2026 08:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672628; x=1795277428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sS1w6ypVXjVKbAJDNdl2VMNTbmFYN5LqfnAkQkSsnPU=;
        b=o4LiLLZCBh1ZHZESPp0KqiHXgbJvc1KMHOxDu3JT4SWVWuXGwcIt99NLQ77HqJNMZ7
         DJfFip7zX3tloMNQQbiyBp5AplUydIZSCwdW5QYp0qBdLHUIxREnB0/NFAwbpym+bRnV
         TqyZNmhNiY5Rvdo75LN8lAUfsL9F+jqu11cLo4vxbJyCbn2C09Im2WacuhFCrBllxQj3
         0Os74uf8sLbSO9agpnUSlxDjd8w0MaPIu7sQadEqEgJNPpJstAdIzTq8F2KP5lKqTOoJ
         zN0pkMt6Mu0cbOrTC5Ei2RxClprh+d6QnWf4YrPq70HOV6bKSamNHFynmsb74AM0PDlW
         BjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672628; x=1795277428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sS1w6ypVXjVKbAJDNdl2VMNTbmFYN5LqfnAkQkSsnPU=;
        b=BfCQsFUuolwxgXD39ktJCoJ0t4jPYqywKro8sdpuSlLufBApAQLxmiwfxXMVcV8Abu
         A8ZOU4n0WgjN8UFUV8H941fM1sMSMOjhDZ1PRyWsvprRG0LydIVrpjY6rKwrJ/V1ZI47
         zBjo9q1k8bKkwHf5TG4ox3i+2Zt4sSj/g8Q8Ii1GOJSZRQS21LMF99gjPZHDZc9LhvGr
         MU154I1y4C80laLWvyB73oNPs86CIBA9HsI4aWXMmornCEB8bPauR8KnyADmIT/lHvtA
         psRN+pLKuIp+X2vVSTOdTnuQuFasJBWT7dMgJBXBmPRJ/J/k8a3f84l7swlP2Nq1E17t
         dixw==
X-Forwarded-Encrypted: i=1; AL+hErGlwtEkXs0UXkbLw0aKdc0PaBg59hxTte0U+SUN4XbUXoCRasYGuzv4MHvPdixPv57ocDalyWSCFlDb2OvkgWIeOu5m@vger.kernel.org
X-Gm-Message-State: APuU4Z8ok8wCS7iYbCvU/z2lamL0AAsWLerlcK2hAXHFr0rdMWKhm2t5
	be1inOAz5MYoc2OsebZhZGefKsiNCYredHo00Pd2QxpfhC/vIIkvsWQ=
X-Gm-Gg: AYBFou2eDr/ZU8q52i4jG2hpB9w7HXg2s3/Z5V72JTNEQh7uyUK9v1Jp5fbZ19gLP7E
	1M6JHQPox9b2c8rSySAyyTOpgykGJmolo2aLELcLOMCRVT/52/PTsdt56CWhyiNaNsDNt+XZiT/
	TpfhEBsIqyShT38fFFdYkAiYfOx+pS8RI6WKxhbLXVogc4eLz4bXktIzNkz1bUzuOkzdTfQIvjl
	nOqTjgypPUJNVEVJUUDXbxTHx0Cf2+sWsrVR78JekRDiB8CdR8DAxggABr2YztljeAspcM7LsNI
	twgJL91ktIB+3FKcCvJ5NCyXdFTfO4qdD2Z73ygqswrtSS8UGCSTYvSAVxBNr5RUEbnf9p6pz1m
	bpcfhSHvT4x6J3eJTyodZgOiZpDVKqPYbSC5CGUk2Ye7cvturk8Mc8dYi5T7vvmQLkpIgznhdu4
	Gsj79TVwhH5fyCVf3eARoJYCeLimAF3sU6QlRgOeadZsR/fCbmyrK1CWnjMfxQCzw24OudxiAs9
	qSMaFx07jRGHxIs8Qt6a+PUyQoWAGqkVxVheY4nONV6jXyoTSS4HpbsWsg0yNQKuCp1/TPhy6om
	6mrufxxeOQn4e+OiSrJeM/F46z9WfnGQZzXxYaruTmmB65qDhrA=
X-Received: by 2002:a05:7301:d812:b0:373:d25b:8cf0 with SMTP id 5a478bee46e88-379681cc558mr5747473eec.29.1794672627992;
        Sat, 14 Nov 2026 08:10:27 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.202.127.108])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm17567582eec.29.2026.11.14.08.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:10:27 -0800 (PST)
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
Subject: [PATCH v2 09/12] drm/amdgpu: Catch register access while GMUX keeps the GPU off
Date: Sat, 14 Nov 2026 11:06:33 -0500
Message-ID: <20261114160731.3756-10-atharvatiwarilinuxdev@gmail.com>
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

As mentioned previous any access to the GPU when the GMUX has
shut off the rails results in a CPU CATTER, skip and report
any register access after the GPU was runtime suspended for GMUX power-off.

Tested-by: Sebastian Zygadlo <szgit@icloud.com>
Tested-by: Yossef Osman <yossef.osman@proton.me>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  5 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  5 ++++
 .../gpu/drm/amd/amdgpu/amdgpu_reg_access.c    | 24 +++++++++++++++++++
 4 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 6fd607587..9938ae48f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -881,6 +881,7 @@ struct amdgpu_device {
 	/* enable runtime pm on the device */
 	bool                            in_runpm;
 	bool                            has_pr3;
+	bool                            runpm_active;
 
 	bool                            ucode_sysfs_en;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index ac336594b..ed205352f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -947,6 +947,10 @@ bool amdgpu_device_skip_hw_access(struct amdgpu_device *adev)
 	if (adev->no_hw_access)
 		return true;
 
+	if (unlikely(!READ_ONCE(adev->runpm_active))) {
+		WARN_RATELIMIT(1, "%s: register access while powered off\n", dev_name(adev->dev));
+		return true;
+	}
 #ifdef CONFIG_LOCKDEP
 	/*
 	 * This is a bit complicated to understand, so worth a comment. What we assert
@@ -2029,6 +2033,7 @@ static int amdgpu_device_ip_early_init(struct amdgpu_device *adev)
 	int i, r;
 
 	amdgpu_device_enable_virtual_display(adev);
+	adev->runpm_active = true;
 
 	if (amdgpu_sriov_vf(adev)) {
 		/*
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 3978ed284..d1b0c6c73 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2935,6 +2935,9 @@ static int amdgpu_pmops_runtime_suspend(struct device *dev)
 		amdgpu_device_baco_enter(adev);
 	}
 
+	if (adev->pm.rpm_mode == AMDGPU_RUNPM_GMUX)
+		WRITE_ONCE(adev->runpm_active, false);
+
 	dev_dbg(&pdev->dev, "asic/device is runtime suspended\n");
 
 	return 0;
@@ -2963,6 +2966,8 @@ static int amdgpu_pmops_runtime_resume(struct device *dev)
 	if (adev->pm.rpm_mode == AMDGPU_RUNPM_NONE)
 		return -EINVAL;
 
+	WRITE_ONCE(adev->runpm_active, true);
+
 	/* Avoids registers access if device is physically gone */
 	if (!pci_device_is_present(adev->pdev))
 		adev->no_hw_access = true;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
index 7468855c1..64eba8a97 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reg_access.c
@@ -594,6 +594,9 @@ u32 amdgpu_device_indirect_rreg(struct amdgpu_device *adev, u32 reg_addr)
 	void __iomem *pcie_data_offset;
 	u32 r;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -617,6 +620,9 @@ u32 amdgpu_device_indirect_rreg_ext(struct amdgpu_device *adev, u64 reg_addr)
 	void __iomem *pcie_index_hi_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	if (unlikely(!adev->nbio.funcs)) {
 		pcie_index = AMDGPU_PCIE_INDEX_FALLBACK;
 		pcie_data = AMDGPU_PCIE_DATA_FALLBACK;
@@ -677,6 +683,9 @@ u64 amdgpu_device_indirect_rreg64(struct amdgpu_device *adev, u32 reg_addr)
 	void __iomem *pcie_data_offset;
 	u64 r;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -706,6 +715,9 @@ u64 amdgpu_device_indirect_rreg64_ext(struct amdgpu_device *adev, u64 reg_addr)
 	void __iomem *pcie_data_offset;
 	u64 r;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return 0;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 	if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offset))
@@ -762,6 +774,9 @@ void amdgpu_device_indirect_wreg(struct amdgpu_device *adev, u32 reg_addr,
 	void __iomem *pcie_index_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -784,6 +799,9 @@ void amdgpu_device_indirect_wreg_ext(struct amdgpu_device *adev, u64 reg_addr,
 	void __iomem *pcie_index_hi_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 	if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offset))
@@ -832,6 +850,9 @@ void amdgpu_device_indirect_wreg64(struct amdgpu_device *adev, u32 reg_addr,
 	void __iomem *pcie_index_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 
@@ -861,6 +882,9 @@ void amdgpu_device_indirect_wreg64_ext(struct amdgpu_device *adev, u64 reg_addr,
 	void __iomem *pcie_index_hi_offset;
 	void __iomem *pcie_data_offset;
 
+	if (amdgpu_device_skip_hw_access(adev))
+		return;
+
 	pcie_index = adev->nbio.funcs->get_pcie_index_offset(adev);
 	pcie_data = adev->nbio.funcs->get_pcie_data_offset(adev);
 	if ((reg_addr >> 32) && (adev->nbio.funcs->get_pcie_index_hi_offset))
-- 
2.55.0

