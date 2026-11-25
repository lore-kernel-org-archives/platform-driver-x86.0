Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648309;
	b=sAyLFFaCBSpB/yrgU95XwY8OiKfD6KmUCnbocx8yJodb4GWdVkXg+w5Qk8ivtrf32iOn
	 ZmgMX1sy29ijN8YelojoXn3ifX+VgpRRJhLN0jWpcdqbX4cFMn5E9GuHyTn8lPpxYF5/2
	 9gd2lCknmvOWJHLYNYmIKq78pbmAXXF6UMiKUZmp494GQjGd+1ih+u3YNsbLZUUw2aATs
	 iOThwsLP/qrPd0FQKDieOIEHDv0QO4lGce5FmM5/ciBtdsueJ6eSH7PhDFbRXkZBlafx4
	 z6KITWE1EThifyvrO+YbdYIwMPql2IWwJeyb+yMYZkJQOng7/fe+DrfkmWW4oRyv9TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648309;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=8dwyi/LNt/sZRH2hpB60uP+84f591kldBMUUJKPT3OA=;
	b=I+b3VAuPyLLcqpj8sXPVUnLEu8Nnco6k3VgTWYCxW84sdp7OD09IQdJidY5QE2POw1fX
	 T5UsbACef2qjWwLewJeE7s43ZXjcFP+bVKAZos4qKyUEIzsOw28jrnII1iJyHhDQcJ3w9
	 ofedTjuWEtb28nOV12FIxTuwmPuVo9BvAi2cGc0DQrKfUx0iMy2zapCN0XWWLprTKf4tj
	 R2mfooLmajLYQMY6w5tSf6rqFlvDLImtMY3aOWZxnnsgM4VFwUVYBS/oNS75Ba16bOV0x
	 2PZNS5IYq4JgsWDSS09qTTHKS24k50dlAGsZM6wJ/CnAxsODITLp10t/IqCqt4ut/Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng7WexnC;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3D606A321
	for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 23:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8D3D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ng7WexnC
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386b8f2f671so3359291eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 Nov 2026 15:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795648308; x=1796253108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8dwyi/LNt/sZRH2hpB60uP+84f591kldBMUUJKPT3OA=;
        b=Ng7WexnC5pJR0T86OUNpKT4/gXrdC8uA4+4p8dh+tmy5ZuuzXv0XTG0CODcSnopUrz
         zR4ztAg6b4ymVurdbXh2xDkuLAE7u+JPzt4RXsdn0BPHAurAUrJ92IQN/8VwdnXVdSqv
         HxNei9t3/FGN02wFtfdauJUuQhaK4pOWtTlZhXOuNm/jMvZVn1ikZcjCXwsNMwFK3Hen
         noqc7MZNi4k09AfEBDAT9o76Z1W7jXXPiqkrY1zYvaBqBx4El5dcCHpG4MDKPPh8hFO0
         2+x6NgSfss2P7yjJy7eG/e4Og90TI0kvHwEdOHzBg7TgMhIAGc/adSmbwmSwOCp9Tqcw
         DMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795648308; x=1796253108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8dwyi/LNt/sZRH2hpB60uP+84f591kldBMUUJKPT3OA=;
        b=NYvbPtUwI7NmAy1sWMVIuYmeabxJA9kaTOZF6iOJ5F33rSczH557Nx6y7WGSlG+NI3
         iXHkhtVQKz9oEcec1ifWYBx6u4z1AhmhFqhKSLcRfLcBYHTGi94mZaw6BhSDt0SgclPp
         HBL0f5X8CPjSXoKIwLZ7JupAj8o5gtZ2qv7p+04r9G5kK/KLB73DqRvtWQS29RiVbrfe
         cLNyAF1PpjJ+3yO6A7HntcezWfhwCztzOwmT1MvuddJrvUbKPXJzOfXMnVksc26KlRmA
         taAsyjD4l67itJnannxHy4AYuiuSMvHsM9OSBnglmHcXvFK3HL9dolos2VmC2qJvDn52
         39dw==
X-Gm-Message-State: APuU4Z9TzmA45phtGf78uWv5fQSj4Gd+MuLLkZkvoOhV8ZRU0+AWtHRU
	+nNVh8I3CNU40sefzi3ojKdC1uqF+BfLXwwKWwrOIzbJiS9i7gC0Ggfa
X-Gm-Gg: AZFdTZcnBB1nEXa9m+uhUtL3lZQNTb+4U1GmI60eer585f7w5camAkPUn/gSD5jxq9C
	2z9pQKjHA0irKeuyVS6LHKzWUGY1Rg6NIKmvJypGBclpbUZk8F+mxWN4cuf7m2OqTVAc9Jk9AaV
	03i0XsDhXaff6pdNIW65WSYT+l+YGgwZxbH5etL+j7GcoYjRU1rgjavhtLO5/y54MVlrVJoMwJy
	lcP3fkicWyi9uVtUlRVp6M97r8oKPnQvvljrFMUT9Q2+jzfDUDRFxsu3JUO4H1+tGAT807lH5Tz
	fnWdq6awyfR2Fa21yGvHJUn3ibxgeaFNAS1+EiVK6DME7w5fnUkoFtdRim8kCCBJeIyIOturQOA
	4xMOXwNA/RceAo0FG7KGEuOr8C/QL+qp4VtUUDpvnhSrBRywMcHvmqGzh1V0BxdaFazepKNcdoV
	5PWuTbcHkvvMQsFrDEDT/LPdYCjgkBkEdotS07jnY6/ktIUmlJITOb1L6WhBJgrwRA81mq1AcbD
	FMflZkJ4uZpX2EmTTKbsz2CePN8BDmToFY/wwkdfA4sVtS1T/5c408YVfq6hV4Z70lM741Pb5Gs
	lrS3rt79SOrfPmoq7zc8+BMWsRY/oY1v8sMK8Jnw0jCWmGdMFFXLNrfld9JdKx7bIvEazOBYoxi
	dg39MfaPh1jfBmnmnBg==
X-Received: by 2002:a05:7300:6da7:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-3856c9a302amr2180408eec.2.1795648307648;
        Wed, 25 Nov 2026 15:11:47 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f528:8797:fe51:9f7e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm64430145eec.26.2026.11.25.15.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 15:11:46 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 25 Nov 2026 15:11:21 -0800
Subject: [PATCH 8/8] platform/x86: thinkpad_acpi: drop redundant input
 device parent assignment
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-thinkpad-acpi-hotkey-poll-v1-8-6dee57519c2e@gmail.com>
References: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
In-Reply-To: <20261125-thinkpad-acpi-hotkey-poll-v1-0-6dee57519c2e@gmail.com>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, Rong Zhang <i@rong.moe>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, 
 ibm-acpi-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Drop the manual tpacpi_inputdev->dev.parent assignment in
tpacpi_pdriver_probe(), as devm_input_allocate_device(&pdev->dev)
already sets the parent device.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 898d919d697a..e809ed417e0c 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -12245,7 +12245,6 @@ static int __init tpacpi_pdriver_probe(struct platform_device *pdev)
 	tpacpi_inputdev->id.vendor = thinkpad_id.vendor;
 	tpacpi_inputdev->id.product = TPACPI_HKEY_INPUT_PRODUCT;
 	tpacpi_inputdev->id.version = TPACPI_HKEY_INPUT_VERSION;
-	tpacpi_inputdev->dev.parent = &tpacpi_pdev->dev;
 
 	/* Init subdriver dependencies */
 	tpacpi_detect_brightness_capabilities();

-- 
2.56.1.839.g22a8290db9-goog

