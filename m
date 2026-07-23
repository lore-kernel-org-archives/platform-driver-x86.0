Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF9D4968F8
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 12:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810693; cv=none; b=BMDTqkfhHf9oGI7u72c0F6i8/gwyKvze8TYmw5bq3+8+ITv5lLnZpanBhWMavWlMZ4aBbsYZZHOIr/9JLshYbNPg335i89jwqqI8GzmM2k5fQGhA7qopD7LCJ0vF9v7vk61stJy0DSdOjpLrwBHv9eXw2/IQTnjMocW3K9KAvjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810693; c=relaxed/simple;
	bh=Xig7WGnnLktfSt85EJ7ZIzdmITHXE3yWx24ihdGcLcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PC0pjkoBE5KVjG/9dOBk4DPLRjAV5WGa9UXpyUaxNEXwMim2k3wo/d54t+GTlH9Qigkh/xShKjAOitmfNxXEtvcRZ4rXCQ+Zk/Ie66d+c+qroB5hSCNebUZu1h73RCImU8Okvr1MOOm0qDF3StXV0ES9wgqtYCWNsqelBCpU0ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=tU0wcZ9M; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="tU0wcZ9M"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e08baf860so618799a91.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2026 05:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1784810690; x=1785415490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lN+WRJy/Gb9/DDf5BT/PAkv7b2aSSNr6Bp0UfhvwTgY=;
        b=tU0wcZ9MlmzZTb0tUzlIgVol25l0VBk3VuJH7HtsYs8t2J7xJDU15NJobjCk/NSfqu
         05LPKNQoy61y0eTlMOIF9CNXZDGaa9anG1oh8tDvr+FZ9PDBx0cLEBDYk/9j2op9zeQc
         E2XVodfMFl5oxMKhZtJOT46mStwpzn64WV3HcYz0LdaJ/iJk+YqQ8yLIlRbtmiM/wlRN
         ROA6qTV7f0r9FzNDWxbQ8V4I1krpO3MAf/LYK2t74Z0CIizuFULxPQn0OiXciL01+c4B
         AN+JOESBmd31dN049nQvWXH4+92sURc8sF3uijODtk/vz5NZjW8sxCZocjcdMGwczSA6
         xOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784810690; x=1785415490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN+WRJy/Gb9/DDf5BT/PAkv7b2aSSNr6Bp0UfhvwTgY=;
        b=NNmXcCOx+Zq0sVOlk3uW6g+7oc/+8MBqHUBP6UvmSelMQMKZagoSgp6hDcXZkJM442
         kqOoU+tc8q/M45ZwBMG6n5rYaeU0fc+PuYzdJEvI19dTnkCa0xtdidDltDtKxkP60LNh
         cpsaxWRArMTJV2DjKPpNWFysijt1EhRmosWvo3rkm2peF5gKODt6ZZkGyjdjbA+Tlz7N
         a/uj0CTWCl/UU9W7b1QBh1M+z7XWUIHJWD0Bvifck3kRhQdxJ+BvThqqqIR+1fmM7x5F
         UW8w16E6lvcLdQy4gG6qytVHxa3eqSSgQCHC497oPdCIiecuQj70UGiDuoCGdrwYBVRj
         dI/A==
X-Gm-Message-State: AOJu0Yxrvrft1DekxeurylbHN8fLNih5EQW2lHRBDIiLr9tDckmaYXGd
	eo6GO1f3pjB94xcR+d092eSQx1mzPhmAjFCzLSlj/sDgPkZP5zp7/Vr2BWxwXOZVCczUWB/iDnm
	hiqCJtAw=
X-Gm-Gg: AR+sD13yoHgWYdn2aAfN5uboifng1qT17h76cR2fanGKRCPKtTUZ8Gv0Mqcyqk1vgxx
	THkZYXkYNlWwIeHTBPMeFj8Y3Z0s7piKgyHSA+d74fKI092tRChJIs2CQIaEuB/Hjmxn+Ms4Nk8
	YLbg5VUIbHgYNMpLi0cHszdbM45qknfCBixKvmF3P67m/H95yttVM9EsCt2BfYmeSgb4dVa94ll
	Ku+kFS5cEJKrbVutiMU0/fQRiZQi8C/7klg8TsOF8tFmRt16WqKoocx67xiu1iO4ETKIIfgdnBe
	el/0FRgioxhL8YGxYwEBHNyBwczq8NynU8MPeWVAY6c5CAj0+ZWSAKzUdfVy9WCybydQvGAq6sG
	9IZrjvAoiXaEyCMnSc5JFOhckvKTtXxUoHpfljauIUWVBtDc6+Dyms7vewj/TkyUKe7wm9NUFAn
	w9CXuKdMweYy7sgTECyS6j9UpLyGI5rjx+w5j0eNJQac1x5JvCIMS8wbu7nS3mWsRzwFjeapiMj
	/JcP2bd7SvWcSOZne3IoNTo
X-Received: by 2002:a17:90b:5603:b0:38e:7eb:d07b with SMTP id 98e67ed59e1d1-38ec6622023mr3288256a91.34.1784810690513;
        Thu, 23 Jul 2026 05:44:50 -0700 (PDT)
Received: from [127.0.1.1] ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-13d1300401fsm21663197c88.3.2026.07.23.05.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:44:50 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Thu, 23 Jul 2026 18:14:16 +0530
Subject: [PATCH v4 2/2] platform/x86: int1092: Fix info leak in
 parse_package()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260723-platx86-v4-2-93b4a178b595@cse.iitm.ac.in>
References: <20260723-platx86-v4-0-93b4a178b595@cse.iitm.ac.in>
In-Reply-To: <20260723-platx86-v4-0-93b4a178b595@cse.iitm.ac.in>
To: Shravan Sudhakar <s.shravan@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0

Sashiko reports a possible information leak that can occur as follows:
- In parse_package(), memory allocated for data->device_mode_info is not
  zeroized initially as it is allocated with devm_kmalloc_array()
- In the for loop after the allocation, a malformed ACPI package
  provided by firmware can cause some fields in data->device_mode_info
  to remain uninitialized
- Later in update_sar_data(), the uninitialized fields gets copied to
  the fields of context->sar_data, which can be exposed to userspace
  through sysfs attribute read (intc_data_show())

Fix the leak by switching to use devm_kcalloc() for allocation.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260710052806.100107-1-nihaal%40cse.iitm.ac.in
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Newly added in v3

v3->v4:
- Updated the commit message with the information leak path as suggested
  by Ilpo Järvinen.
---
 drivers/platform/x86/intel/int1092/intel_sar.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/platform/x86/intel/int1092/intel_sar.c
index 7263114f0b3d..f506155f35d4 100644
--- a/drivers/platform/x86/intel/int1092/intel_sar.c
+++ b/drivers/platform/x86/intel/int1092/intel_sar.c
@@ -91,10 +91,10 @@ static acpi_status parse_package(struct wwan_sar_context *context, union acpi_ob
 	    item->package.count <= data->total_dev_mode)
 		return AE_ERROR;
 
-	data->device_mode_info = devm_kmalloc_array(&context->sar_device->dev,
-						    data->total_dev_mode,
-						    sizeof(*data->device_mode_info),
-						    GFP_KERNEL);
+	data->device_mode_info = devm_kcalloc(&context->sar_device->dev,
+					      data->total_dev_mode,
+					      sizeof(*data->device_mode_info),
+					      GFP_KERNEL);
 	if (!data->device_mode_info)
 		return AE_ERROR;
 

-- 
2.43.0

