Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A159737646E
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783940570; cv=none; b=S5GxfiU6hJamN26m1P17Yc8m7nODA3wNcyECaCu4M4sp0KqO/vwH/aWEb5H/d8WTjSwAqAxsZTA8lBYC5e3cPLg6wm9/XAxRvJM6FBN+O/DviHLirm/AZjF01PF5s/RZMWvvJABWquGEKlHAUKUjm18MA9614jMg5hWHK/PuXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783940570; c=relaxed/simple;
	bh=GH6CWop3wfi/VJkvt4cMc0bNyzCTH1KmyzTlNjCz/68=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IK9rgWXFsLB9ruyvy6xPJOaDPX6Z2eTzc41UsVRTWXQXjtWxUaYR/U8GnwkhhH+PO/HbBLsPwzhAQhHGugbZFY3gh6WrzfbvYyFw4Xp9isC9BwcvO5yV5Bb6RPBxGB/nl7ODkwoCZkHiPN5qtLJuFsTYoyGBp0PmC5sC3ZuDDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=AHazjOTx; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="AHazjOTx"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8487088510aso2736991b3a.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Jul 2026 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1783940567; x=1784545367; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWk91/IxILRwPoM0aUwUrJJrk3OrtAhlG6TmoK3LV2g=;
        b=AHazjOTxZXhs+0eTkazPjKH1+t7SKypGWHx0dKqpGI1DoctrYPpWB8KkXGqoVGqp9y
         4JU951f8j55I4rB5GlouCvpAUZSnXRCz1+X2Lvg1UemKndz5mYQIK2j2n9wq77Pb8IhB
         qcw43pAZAUc5RkcrODQNjhKN8lfu6FqHgRcKyIGPA5tlfK53k46Rhp1jZaaTNRAuBaHj
         lWSFKKAZ4cvD2jU9pjJR64LLRIWkSnsM9tj31LyWYwrY5hFnWf2bSMeKHzNnyiVFJrb1
         OijaweVRePRg0tgX0okuuAddUxy9fujbKEl5HWnDzEDxi1HFStJ9XNTNpA9iuWd2KOWY
         aSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783940567; x=1784545367;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eWk91/IxILRwPoM0aUwUrJJrk3OrtAhlG6TmoK3LV2g=;
        b=Cn9h3ZCH5x/L1R9rNN8JJ16lb9NkZQ08hkBylRmhiwfYZSHramV1WQN47pm17QmU9o
         /ZrRQri8wAKuZu8Wz5r4ydcMa6wPbsXVo2y6OeJGIGFdHlKXIu5DfTSSti4mS1q3Kyog
         0YrVNVtVDXp7I9ZieUq365yywnLSMwUIn0rOW1WueP+MDkoS6XfVaqwHAsjTopgwpcSR
         lVXia37oVp5bUrccreq1FrL7ry2p4r9vyzHaCKzLm903WWop2OlDgbOvnd6epdmI+Yoc
         qAIcXH//pG7PibVEkVlmfAA4XKX7KvsFdhm3OqynvhkOLmYlu5LE+3zgNoIhgjTOLZ4d
         g/Vg==
X-Gm-Message-State: AOJu0Yw+APb7U5jgPYzCKZjuo8PAqtlPsrMU0mAPZ0HAf3PDRtgzVGVE
	HsSn3BcR9keJDlPKEkD1bNcCpOoSlz6z5vJi2Ar28kaHng9DHamrv8OdsqNwQuejg8Q=
X-Gm-Gg: AfdE7clON+pBBVLrLq4swG/sJTgE1NLARpEJEw9Zz8/ish2NZCECssof+P7CCCbu0kZ
	op0AyO/mAYMOGB6XYrYtKlJBjBGJusNAAYTW5eCFWAmJTGWe4A5jEmxcE9eZyQfkY3h9xwB8CLw
	0y00JwdvbGg1SFgjSl3FK9mFVvlmGE/0FZFQ1wUfppP6qZPbB2Zjwa92fUJ1h/jHD4n/zGdIjoU
	n0G3QZSW8TbLlzEcjjAqUjwD2JHlycincol8nPgI1sYZWDndm5IhfIBUgvty3sDci1oeu8rK37C
	i19rgZfQZcJabC6d0uVmgN7E0lNgGJ4QrJHZhPqno4S5SY2vYvek0Xg649cY7xryl2T/fJFYVS3
	b5gjU0hcAwudfm6YtCQk2ZbJ0kRIrLOCvVhVsEkVE/0PMxcC73MjgUw5+TnjZ98NWC8C6vGOa7v
	qu+5lUB0tQVGntL/uHXFO38eUry9YOpQS36FJQx42AcdQWiwYotvbYL3/bSaTb8M9GvL/EP4bSi
	aonkg37djXoO/to8ZqTb6rbjOr/3OCZDN8=
X-Received: by 2002:a05:6a20:7491:b0:3c0:9c1a:893e with SMTP id adf61e73a8af0-3c110f7f4e5mr8654866637.70.1783940566955;
        Mon, 13 Jul 2026 04:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([103.158.43.43])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-311a6115e61sm52249087eec.22.2026.07.13.04.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:02:46 -0700 (PDT)
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Date: Mon, 13 Jul 2026 16:32:25 +0530
Subject: [PATCH 2/2] platform/x86: int1092: Fix info leak in
 parse_package()
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-platx86-v1-2-c8991bff03a0@cse.iitm.ac.in>
References: <20260713-platx86-v1-0-c8991bff03a0@cse.iitm.ac.in>
In-Reply-To: <20260713-platx86-v1-0-c8991bff03a0@cse.iitm.ac.in>
To: Shravan Sudhakar <s.shravan@intel.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Abdun Nihaal <nihaal@cse.iitm.ac.in>, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.13.0

Sashiko reports a possible information leak due to a non-zeroized
memory allocation for device_mode_info. Fix that by switching to use
devm_kcalloc() for allocation.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/patchset/20260710052806.100107-1-nihaal%40cse.iitm.ac.in
Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
---
Newly added in v3
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

