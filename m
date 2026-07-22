Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DC14334B5;
	Wed, 22 Jul 2026 18:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784745343; cv=pass; b=fQe+HMWo5LLWdeo9frOgoiG7dXyAs39I2nRqWNerv61V6Ea0VgishiFz1So01A5X2QaKX16TqKxjzeWpbyOBlVea7qIQm+aZc3S69bZHKx0MSq1qm+xa9AKg9QU2vwUzBZXqsITsih7VX/zwjcUB6Xn5UCDf/BJMHX5BHv2OEvA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784745343; c=relaxed/simple;
	bh=zy0UTVogOFFDhH9VHuZKYVfPX1xHZCvCFqHXaouM4DA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=o9rXgaU1mUCm6+BRKWKk7NxWuh10aSmRKjHoNEKGbswHoPKmDWGNm4VRy2z+xLaqn8BmvSy618t97AcU0ZUhFzp6akNpqKm7ECC3CDYbBO9SHMHulyvISy9P2k5o5vGa6KdkgWHFhQ4AyA1wPCO2FiWV4swU59qthk64NuRtOfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=fUKPpNEi; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="fUKPpNEi"
ARC-Seal: i=1; a=rsa-sha256; t=1784745325; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RhlBvDWpUYao+vqHsN66Hj0Fh9BAbhxNk04nkG/GLAJS6M1GNvv9A06jyepJNTOEpRWBU+ctN+uz4x/kfgq/sF46ZTZEaI5rRPKyPAxstJeArWqkYGjY16eshNWZdXJ/jwYUhpFkIMkjq7z0+cTl7xSBE5oRamppWF4bmjaDE5A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784745325; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Kpxxq6ZygBt3lSdqtYIUPrbFusG5iUazetUu4YGlUSI=; 
	b=SzN8H8lCLKSclb6ZoDNfW+KyidaBo/dbLwX/zqLihwG+CCRhtXpn97Pobh0VZcnVyU5PFIAaDhhT7IKdPyOmjHWA6DGqBYCm7w8LjJanggTQV8m/nN30hba3D4QXlV5DG1q6SjE/FF0nKgYPTCDrhVqZHMUwE76pIDgxA+80HUM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784745325;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=Kpxxq6ZygBt3lSdqtYIUPrbFusG5iUazetUu4YGlUSI=;
	b=fUKPpNEizIFZnJiPMwYs7ruWRk7dSyRExn5nk2kMbJnBBpJSRLzrCOCz3TVu9bpo
	zdPhEsKiOdJGaDyQR4yTp3rjLIJFS5XQLmTUIiDwxpZO2u+6sShdMxko+8U4xhVS1G6
	GJ92bur1kz99qwAr+ZkPTAKMMhuH+qABtI3hapMp9nmVdguDNnfxlvj2a6ZEVSkh4j4
	v/21JvDsp39o7/90Wl1aXGx68xaLAAUgsFSIH+SaCEdM2PEcOikFOhwk+hgfOCqq5rw
	5Gkuxc+T6HrFO66HAhfZN/9yTnwz5/bDnvmOxwGpPIkIvUwtYsLhzbWWTTWfQqBU+nE
	e0PkWJAScg==
Received: by mx.zohomail.com with SMTPS id 1784745321698533.9484142073169;
	Wed, 22 Jul 2026 11:35:21 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 23 Jul 2026 02:35:08 +0800
Subject: [PATCH] platform/x86: ideadpad-laptop: Fix driver unregistration
 order
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-ideapad-rev-exit-v1-1-bf0d8ac9b5ed@rong.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqEMBBE0atIryegaEC9irjoJKW2C5VEB0G8+
 7TO8kHVvyghChK12UURX0myLorik5GfeBlhJKjJ5cFa+FIJ3jgYHRucspuyLlzFjXeWK9LbFjH
 I+Sa7/u90uBl+fzp03z+Rw/AIdAAAAA==
X-Change-ID: b0d55ec3-ideapad-rev-exit-381b4a9cb5a4
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Philipp Jungkamp <p.jungkamp@gmx.net>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-2f6f2
X-ZohoMailClient: External

There are two drivers in the ideapad-laptop module: a wmi_driver and a
platform_driver. The former is registered before the latter, but the
unregistration order is the same as the init one instead of the reverse.

Fix the driver unregistration order by reversing it.

Fixes: f32e02417614 ("platform/x86: ideapad-laptop: support for more special keys in WMI")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 4fbc904f1fc3..8213524504ee 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -2564,8 +2564,8 @@ module_init(ideapad_laptop_init)
 
 static void __exit ideapad_laptop_exit(void)
 {
-	ideapad_wmi_driver_unregister();
 	platform_driver_unregister(&ideapad_acpi_driver);
+	ideapad_wmi_driver_unregister();
 }
 module_exit(ideapad_laptop_exit)
 

---
base-commit: 248951ddc14de84de3910f9b13f51491a8cd91df
change-id: b0d55ec3-ideapad-rev-exit-381b4a9cb5a4

Thanks,
Rong

