Received: from mail-pz2-f9.google.com (mail-pz2-f9.google.com [74.125.228.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377F3545D96
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789583926; cv=none; b=Ba4xGzPapWBrE3MYf9mm3r9bPIvJ27kbu/35v3Nvo6jVU1+X+xp2Go++FdvjXXxtHFCzTMH91ZbAKJEEh4mxc3O2rNAb+TbllOn3Xvjasuh895kDlCmLb5/gnpdYYBSDfl7EJvTaAzU/lDOoAojZWuygcP6bab6c/bFnFEIT7r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789583926; c=relaxed/simple;
	bh=gL63a7H40eYnPHpwXj+vmcavoE50KRdYhOSiWJgvpCU=;
	h=From:Date:Subject:MIME-Version:Message-Id:In-Reply-To:References:
	 To:Cc:Content-Type; b=tf+6aclNoOMx3JTTLmCx/fJPbX/EEXh130fCatLW2Kng/iqXoDUAv+Ne76oeKgNEHO59RVoK9iHVRYNQfCrw+vwJcodQrTJWRx62zvX/tdbLp9+LzlaM2ydzBTme5L6RwCHu515CFCFVpGJoQvW1G7GOQ6wyrgCMKzoiuO5bL38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe; spf=none smtp.mailfrom=sne.moe; dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b=Gi2LWAYc; arc=none smtp.client-ip=74.125.228.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sne.moe
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=sne.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sne.moe header.i=@sne.moe header.b="Gi2LWAYc"
Received: by mail-pz2-f9.google.com with SMTP id 41be03b00d2f7-cc15f67b5b4so614274a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 11:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sne.moe; s=google; t=1789583917; x=1790188717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:references:in-reply-to
         :message-id:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XcUk3UaRbOyGEjinqyIXDL6LCWZo9vrOTEoez3yNJSc=;
        b=Gi2LWAYcR4sAMVDAtxtGogwdC9nsQ7Ll02RN68RqWpHSv9Oy5IblBEShO0fJfKDlND
         MVzZhJ7AGlcJHCn+tG58zJaLAOO63rjuk9YHT1pGHFqU6YMcnZHD4Hsd+CJUgQBTIpHv
         IxGT9cMUtr0UAB7BjZGR7s02Ko59PrVAc4cwaEVhwZuZaXo3/lNymdn0UP5euOWUmsCa
         11N+6cwth+q14ck7DdznKai9aD971S9QX9Luofo9U77vlkbflKBUI3ggHwyJVkwj+6Oz
         usgCIYJS9UmrDzWGRJvoibVk69DJtnsSOdbaEsPfDIVqbrWbuCs6Tw5ggPh2HeDwzd+H
         Km4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789583917; x=1790188717;
        h=content-transfer-encoding:content-type:cc:to:references:in-reply-to
         :message-id:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcUk3UaRbOyGEjinqyIXDL6LCWZo9vrOTEoez3yNJSc=;
        b=SwGomDIpM1bj83+nC/H9rMXz3CmfuHugsIrP3m3Yt/klwkYRIytlApRomfHnjpq2KF
         mUMlbwxVc2XW5INDfyPljWwQl4u9vA+fWRDT4AYIMkiik/oZyVLZvAIWHQbNvnkZU5uk
         DAZgB6+MlP96rdfCo1Lf7L+EJ9w1fh2zEFDevD9andP2UxY7uugDkzDjzJAogYuIFEZb
         rolt5ajSnIb6Hipd48j8+4+Z7KY9WKcP0iDSf/zzp5fNFGG5PMYFCLML80pQOa/KTNPG
         q5kCu+8AXbsw/bhbqHZhqzDhao8ScNEwf+gy8ua/oyq+t7UftSrR4ikhN2jadMV5iV+J
         NDdA==
X-Gm-Message-State: AFuF++mYvaavAcXGgjUT8MTNrj43BNbJU7sis4m9kKw9EbexBYZ+2gdl
	NdK3pcn16kgOVnxjr0SVcBwslKsfi/+t52Sxz5Bkb7dIcgUSo1sv5/gWMVT8tJh2hDlpnFypjOl
	6ckfVqW3TwCb/owlMuoVBg3NoqQneHbdARtPqmTOE34WtXBv6SlSAzarh76068FTYsxXce5E=
X-Gm-Gg: AYBFou191wa9jo3onSawG6H4bEHyq4lowTf6iqCZwTm1l+90++intpxMoiJi8u2NhMq
	8DPJvDexJhfEAXDdhXAAwzzEkiElVlsVCpIXT8fQ8f4AXt71KYMIJF+04+RNsBBYixM9HLE9UrU
	U10BUPholxhzRTTxLr8WHiqvegNHQrU5IrSbxL1mqaOlt6IogYoVnsZqMc2CmSKKgunWyizVnOd
	qnAf8ixBG7BlUhkjru3c927Rd23oeCbiAOL4VkaDDNeyiNYF0vQmlTCXnHs7WEXkH6oWq3DALfM
	gp5nQUEnecrQTqmrFHuwsGCYFFq5PmvtP9jRGHId+xqgifazmsdaCvNywqey7X0y54+juElaJdH
	OUvCuIW4m+MVBgrgOwZEDUHUCdJxIIJZjgyG7D4na0vhokwQQXXGhQ+1luLLaHJymTjExHVukZC
	fT5cDXY7D0nlAcIYRkc1KCONAhFQdN8XNfHIVnYd/5PGAz+ZDevGfsjDlC+C7sui8=
X-Received: by 2002:a17:90b:4c49:b0:39b:3510:4af7 with SMTP id 98e67ed59e1d1-39e1e2655f1mr5720832a91.1.1789583917465;
        Wed, 16 Sep 2026 11:38:37 -0700 (PDT)
Received: from [127.0.0.2] ([2403:18c0:1001:3a:74ea:baff:fe97:d2e7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e360aa230sm667330a91.14.2026.09.16.11.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 11:38:36 -0700 (PDT)
From: Asai Neko <sugar@sne.moe>
Date: Thu, 17 Sep 2026 02:38:24 +0800
Subject: [PATCH v2] platform/x86: asus-wmi: don't warn when LPS0 is
 unavailable
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <20260917-asus-wmi-lps0-unavailable-warn-v2-1-aa8e3d73634a@sne.moe>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0Jm7Zi2IZi68h6GRQuDjIFiOlA0h
 LsLeAGXL3n57y8gFJkErtkCkRILD2EDc8qgal14EHK9MRhlCmV1gU4mwbln7F6icAouOe6c7wh
 nFwNadzGe8txbqmEbeUVq+H0E7uWPZfJPqsZ9dTdalnGIn+NB0rv3dyxp1Gh9XTQ+r7Rq7E0Cn
 fuBoFzX9Quti8Wm3AAAAA==
X-Change-ID: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed
In-Reply-To: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
References: <20260916-asus-wmi-lps0-unavailable-warn-v1-1-9bd6fb4c10f9@sne.moe>
To: Corentin Chary <corentin.chary@gmail.com>, 
 "Luke D. Jones" <luke@ljones.dev>, Denis Benato <denis.benato@linux.dev>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Asai Neko <sugar@sne.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2548; i=sugar@sne.moe;
 h=from:subject:message-id; bh=oIpR//feF5h7AD1VSBdYcyg/cFmtxitujGaVDAw2NKc=;
 b=owJ4nJvAy8zAJfZHZ3FlRAEbJ+NptSSGrFWPtGq+rr87j0XbeWvu7uzkKcHzhDqM800aFTvfz
 3z5YdvBqj8dpSwMYlwMsmKKLJ1HugqfvJ734YCLLh/MHFYmkCEMXJwCMBHj2wz/jJnSNhezv7qy
 3JSz+EVng8eCiLxfVSUvtmTI5EUFy4r2MvyP1tGRCJ20YMpsx/IX/0RCasxnRh1Lf5WSe+kXh+b
 zvkB+AFYkSaQ=
X-Developer-Key: i=sugar@sne.moe; a=openpgp;
 fpr=89C48A71E4EB9EF0C0442D0EFC2CA37958700609
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

asus-wmi attempts to register its LPS0 suspend-to-idle callback during
probe. acpi_register_lps0_dev() returns -ENODEV when the LPS0 interface
is unavailable or explicitly disabled, but the driver treats this
expected condition as a registration failure and prints:

  failed to register LPS0 sleep handler in asus-wmi

This occurs on the ASUS ROG STRIX X670E-A GAMING WIFI with BIOS 2704.
The system exposes no PNP0D80 ACPI device and uses deep suspend. The
warning therefore misleadingly suggests a sleep-related malfunction
on a platform where the LPS0 callback is not applicable.

Suppress the warning for -ENODEV while retaining it for other errors.
Leave callback registration and suspend/resume behavior unchanged.

Signed-off-by: Asai Neko <sugar@sne.moe>
---
Avoid the misleading ASUS WMI warning when LPS0 is unavailable.
The diagnosis and rationale are included in the patch commit
message.
---
Changes in v2:
- Fix the missing format specifier for ret reported by kernel test robot.
- Shorten the warning message to keep the format string on one line.
- Report: https://lore.kernel.org/oe-kbuild-all/202609170237.IYNujwsM-lkp@i=
ntel.com/
- Link to v1: https://patch.msgid.link/20260916-asus-wmi-lps0-unavailable-w=
arn-v1-1-9bd6fb4c10f9@sne.moe

To: Corentin Chary <corentin.chary@gmail.com>
To: "Luke D. Jones" <luke@ljones.dev>
To: Denis Benato <denis.benato@linux.dev>
To: Hans de Goede <hansg@kernel.org>
To: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/platform/x86/asus-wmi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wm=
i.c
index a65090429ca7..c2af1f049b67 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -5421,8 +5421,11 @@ static struct acpi_s2idle_dev_ops asus_ally_s2idle_d=
ev_ops =3D {
=20
 static void asus_s2idle_check_register(void)
 {
-	if (acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops))
-		pr_warn("failed to register LPS0 sleep handler in asus-wmi\n");
+	int ret;
+
+	ret =3D acpi_register_lps0_dev(&asus_ally_s2idle_dev_ops);
+	if (ret && ret !=3D -ENODEV)
+		pr_warn("failed to register LPS0 sleep handler: %d\n", ret);
 }
=20
 static void asus_s2idle_check_unregister(void)

---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20260916-asus-wmi-lps0-unavailable-warn-9a72be44b9ed

Best regards,
-- =20
Asai Neko <sugar@sne.moe>


--=20
Asai Neko


