Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0DC441054
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 16:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749109; cv=none; b=s4fj8JMQDXWdF6w5lU+S3R5sbqIQEeyq6k9q9VUjCFXccDAUxyESA3TBdWlBIFowaqj0xZLPsNZ22hqYmKTag9hcUpb0wm6s+MQAeBph6+HgBbqGSZCWbt6FB7GoK/HaM91DV8xyXkqNeYMw6DdLPsTrbBhz4vFXqxxMZ45J5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749109; c=relaxed/simple;
	bh=Y0cK7BKCp0BVUzXPZE31esRFO4IwyFMEtGKpkPOHulE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R31j5u5WcRgIxpr6OWv7JcNpMOTyQKsWD0DWW7rapryONxA+xwz3X7FWgUv3ye6sRnnCeAoxaQP3zsWU/v25NIUCU3bxZTO2icPcMEwoo/boM/7PzuhtroWaXGmAVPs/ewoD9q9rk0rwpVG2/W1fK+FrWal/cqX/rOAZe6W2GGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjbqH4KK; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjbqH4KK"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-664b3831a20so2789936d50.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jun 2026 09:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782749107; x=1783353907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAmHN9ORtdOkkrT0Cmo/4Yb8opmnuy+G2DQa6hkEM8E=;
        b=FjbqH4KKRt4gub2oXlJ6REPZPBpXaS3rThF8j9cPgAQ+mgOWKicnlQw1bSgldNvWOv
         DRNb+odN0DbHxftAQQpzDb+4l2qhyIn+zPPUXyU1YgQsDdI1U2kesRKLihJfQkZa+7KA
         GMHry10YzemckQcglDEZlPmRYhlgTHyDSBIGqsDHVLOcDRaCIEwZqsFY22V1cjTU7Hou
         Ayfag15TwohzrQ9EACobYF0eEnMKH9IrukGwy9L1wIuqDs/WRqWtFagL0LrhxTDryTgb
         j4y1v3Idd+ZHXLc1SS2uBmeBIjAVqU5h4VHK641x1rp9CQCc7iBBaz88S3vaLAKkSYvE
         SlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782749107; x=1783353907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAmHN9ORtdOkkrT0Cmo/4Yb8opmnuy+G2DQa6hkEM8E=;
        b=R9HL1XYXDU/RPIwvZA4IuKAjJ8VuX7TW+3dZaAugxgKGyzqLxULEPMBS8vw3jwE2Xv
         dR4bgtPAHdICm0gv2k6lk/cKAexo/UZC4GYhfhu3yWAVhT8s5Zfijgl/4Hl3XeiG+HOS
         MdbfoxzR0QKPzO6Y2gDYZ9mCirBtwLJtbKUIzCrOWnJ3O6+TihoJPLKEXVS3XzKEjQsf
         zyMj023ATg7XQdOpaKyFeAyC3TycnmLsJM+js9iTzAJyORz3h5Sc31MXnlDTM1VWy2Bj
         8XzxbfVUuz19I6sfGEN4eYDsk3C7fxMX/WFFaviX15XHQYHmAAWgjODwwnry+rzjHJSl
         uetw==
X-Forwarded-Encrypted: i=1; AHgh+RoHvZGIuchPgDTSn6U+9pn3BfS5MdzEDe16TuEzstpCLd1myG5sY7B2+XUqaDdpDq5axMfVsoNJ5a4aUko0oH/R3HJ4@vger.kernel.org
X-Gm-Message-State: AOJu0Yycj+fhunONYNw0JRFzkWEZ5ZbmyWzhAdzzfVmMIRAw81QCOyB3
	Cvr2U5cDsacI0+Np1chPlyuc8616mKjOW3AWvMnXRj0pfImcw2sOTfIg
X-Gm-Gg: AfdE7cmQ8qZm4QMiToZJ65CLHtselRK8Qs3WvfBD15ZH6D7gk5htK7l/sdN7OIRm6W/
	0lPOFOvvY2N50/LgnI7OsvYxWqzb+6+pBv1M98Lzcf8bi68q2OQKXNRoiB2UqGeQzJ5bbHWzMRY
	QVZJCfs1XzeWAgtqEVlFXc3qn2zA4p3xuUy4Wp9zUuxAke1BXsGRGD/UxTTlj6sq8Bk6GIpvYli
	Jj0RtdzIvn1vb3ZFOmmLXI6Pv5tuWEp250fJZsomABBnQBqFfR5HKc7lKK8GQcPEANqBlO+HaoH
	26SnYK0TZULGYNedakAp4gmSvBtMvnOy9rs3vaLDuJDyNXEFOzQU5IuYolxgDdK3PKFJY+8HVm3
	m2QHi4IW5URor3bxA6Mb/Xlm1Df70gnN1FFz79rA0zRTbANaWgeI/puZ8+/shCmdPAEosmPssBW
	GZ2K4alAFT+aMoSWjpGeU/CLnh6A==
X-Received: by 2002:a05:690e:1541:20b0:664:caf6:c041 with SMTP id 956f58d0204a3-664f9797449mr224140d50.19.1782749106794;
        Mon, 29 Jun 2026 09:05:06 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6649bec9ea2sm5335364d50.20.2026.06.29.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:05:06 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: "David E . Box" <david.e.box@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yousef Alhouseen <alhouseenyousef@gmail.com>
Subject: [PATCH] platform/x86/intel/vsec: free ACPI discovery data on early errors
Date: Mon, 29 Jun 2026 18:04:15 +0200
Message-ID: <20260629160415.29280-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel_vsec_add_dev() may attach an ACPI discovery table copy to the
intel_vsec_device before passing ownership to intel_vsec_add_aux(). The
normal auxiliary-device release path frees that copy, but the earliest
intel_vsec_add_aux() failures free only the outer structure directly.

Route those direct frees through a common helper so acpi_disc is
released consistently on the parent, xarray, and ID allocation failure
paths.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
---
 drivers/platform/x86/intel/vsec.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
index 3ae4557b32b4..5ab2215fdd7f 100644
--- a/drivers/platform/x86/intel/vsec.c
+++ b/drivers/platform/x86/intel/vsec.c
@@ -103,6 +103,12 @@ static void intel_vsec_remove_aux(void *data)
 	auxiliary_device_uninit(data);
 }
 
+static void intel_vsec_dev_free(struct intel_vsec_device *intel_vsec_dev)
+{
+	kfree(intel_vsec_dev->acpi_disc);
+	kfree(intel_vsec_dev);
+}
+
 static void intel_vsec_dev_release(struct device *dev)
 {
 	struct intel_vsec_device *intel_vsec_dev = dev_to_ivdev(dev);
@@ -111,8 +117,7 @@ static void intel_vsec_dev_release(struct device *dev)
 
 	ida_free(intel_vsec_dev->ida, intel_vsec_dev->auxdev.id);
 
-	kfree(intel_vsec_dev->acpi_disc);
-	kfree(intel_vsec_dev);
+	intel_vsec_dev_free(intel_vsec_dev);
 }
 
 static const struct vsec_feature_dependency *
@@ -218,20 +223,22 @@ int intel_vsec_add_aux(struct device *parent,
 	struct auxiliary_device *auxdev = &intel_vsec_dev->auxdev;
 	int ret, id;
 
-	if (!parent)
+	if (!parent) {
+		intel_vsec_dev_free(intel_vsec_dev);
 		return -EINVAL;
+	}
 
 	ret = xa_alloc(&auxdev_array, &intel_vsec_dev->id, intel_vsec_dev,
 		       PMT_XA_LIMIT, GFP_KERNEL);
 	if (ret < 0) {
-		kfree(intel_vsec_dev);
+		intel_vsec_dev_free(intel_vsec_dev);
 		return ret;
 	}
 
 	id = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
 	if (id < 0) {
 		xa_erase(&auxdev_array, intel_vsec_dev->id);
-		kfree(intel_vsec_dev);
+		intel_vsec_dev_free(intel_vsec_dev);
 		return id;
 	}
 
-- 
2.54.0

