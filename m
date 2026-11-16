Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794861665;
	b=x+RmZlpB3jk6WmpNWLLZ0DQmCP1NYl8s709SbpYd/gLs6JwduxwF0hN05wtderY9vWeb
	 h6xH7ZuDQhgXJcMa1Zzy76P6JhxPyKOTng5b6IyEGil2wkZXta1GWvYwnRLb5go2wmfu7
	 rRWYnll12JZIJ6SppEeDGeN3yvgFYjWPc+nuaZi1XHIokNWe/FwBmqN2/JcVtICSBqNxh
	 zHU60hVfn/9/375/NyWVYJo/b7Qz0AQUb359sC6P2+Bb7+eX2PYONmbRKOiEB+xJWFdU2
	 6laUDctCteQJSIyHPAzB1LXij0WJDnZV77RDSKFpOKqn6PlalOpfu28QSqJSg1PwmXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794861665;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=heu0s5zjpk0XxoTZwlmNXaLWRfZMoSQ9VqcGdYp9bZk=;
	b=V9DEj0c55Z3wJSLkta1oQ61usPVVxEewO03/+bgcNkAxP0j5rhE0Gif6hGHDx68QrJuO
	 TM+lOp5jUaUmU0sHoKsFAtkZmO7j814bLRg9iVDtqcGbgsZwfmVvx5bBwc/cZh78/UmqE
	 DQHsmlHOf51wr9ocP1gz+WvPOR6fRjVwRzbdtxF/IIxAIqn5rYDT+TCnbEqlbvYGO9C7J
	 q42maQJc6H6nu1jnf46QVQQv1Os28FLUtJEXPFEINz1gEGiUSmYillPKipsFyz6Npoyos
	 FCdaMAkIwXtPTmWab4K0hIXvOg+T+MqITo9eCct+vwEhE9UPZcmmVu/DgA2w2TAVADw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="XW/dZMRp";
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABA2606A886
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 20:41:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABA2606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XW/dZMRp
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so1631791a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 12:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794861663; x=1795466463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=heu0s5zjpk0XxoTZwlmNXaLWRfZMoSQ9VqcGdYp9bZk=;
        b=XW/dZMRpYlcTMu3EK5fSAbGYbpIvwUxofNRmsrggNENF52WOYMEOqdSHk+D2OaaOmO
         uFctrmRrGm/RS1XymcFwob3WMbppd53CfcFNnH6j89Gg/MdgXfS4qtYqm4AgXGfWrqXF
         8EQb62+eggNC3Wwj+9lv6sNkyaWsCLW/MJhC+nCNR/uQ6ogG90VnZBaurMlqWLbNxMPM
         lKvmTE1LWUvo8HHxUQFxjQC+wD4rfoFJnh+MP6603Kv2Mzd5FGS2drEa9OyiERLEg+BO
         EpyRgfGjwLikmUBSQkAxNAhITlo2bOJ2QZCWUHQzZxjUleJNZ8gOexj72hz4jnlNvAzH
         X16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794861663; x=1795466463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=heu0s5zjpk0XxoTZwlmNXaLWRfZMoSQ9VqcGdYp9bZk=;
        b=YK/TJPRQ3eTkwRL/fI+wYUbrdQKX4l6JSJkdWXqYgazui0d6GQ+8mQfmI8rPlOtTiP
         HnIToMFQQcpN8zEuh1sygBDLWxmp0jywloKZdyy6DGe4YBlW3Zt6s0TMk2RLr6TAltWu
         ZXr+5lC7wSpLloOAYgw5Lm+Ah47C6QxUZ1CZ9ehP7LaZ6R0aWj8CytmSU7JmPgXlNmnZ
         4t+hSrDGB1NYC4nZoXlF/wXoxQJxBaoNbJHkr2FOhl2MIEKKUJQbrrqrPUy/K30BtFss
         e7ziTrp2EBM/cKBJXI8/MXlHMibrGkhbdaWZSE5RGjw4pOYCGO/AwWbhPDDjGdugaiuj
         oemg==
X-Gm-Message-State: APuU4Z8osHe6d5O3+b6BvEfkqZ21hWuv0A1oQ8Fh7hY50C5/hYxSqVip
	A8M3eUgV3w855A2NZPFup/BHXy2RCqNNyssc7qZneloMfuj+xprCwoye
X-Gm-Gg: AZFdTZdldl8RpzWpVxqK4QfuhFb3JADcJXdEBCvhswI4tpAl8a/4hm3aQEq3BLE6NHI
	ZzIjuMAUPEEn6FfgO2hOnsHWHoI2MgaBZvrhAEPWobxARwFLBQTdimFQ61oN8Z7L+saqSZa/flr
	INKp5tmQyN+9WkTO4tqri7RShlPaTKJ3IluJEZ0+MOUsM5A9BfjLuwHJE3/pZiq65imLmzyBvwS
	7E9UFYcHrwOq5qZa+8KZzIhsFCtEDO/6lsA8jX8tHwHwTLflnriXz0VTzZo6HETrghR00zCol/o
	t3e6AjitBL4NM49ix394FsdVrWwEBhOmNYm6ErypJZYwICtguToWnPciE2T3SQNp9pV4fSN8J4o
	vBuXn1NHU4ZWRSACYTx6s3pjrWRj6EgXYT029vdR9u9P1pNLL/1TajRm0kt+JTg4FmZjQsdtzky
	fXOiO40m8Al5Zg3bG5uqAoBu1IsM+KxTAD/EiyXGCXM1037Z33RLZAuAmqj1qaJ/XMspLQBS9wU
	AKmyg3e8oW9NoLRqMqGpDknmeLBOZ0qFRnRcKkIVZpNYvRbPG51Rd7n2Y5YguutyyoNxGTApyER
	rBHoM9qzGDiulzsGwM7i9n/yHqlbDb/eMwbAKIymSua3c0aJY99v73ButW7NmFdyT5pR/LHO2Rc
	JaNk0wWZR1lHJ0GMlWspHhtEMZER4eD3qmZ5nOFz+tKgqR/VIsoIriazYHpXcqlxVGLOgCYPehH
	3F95o=
X-Received: by 2002:a17:90a:c88b:b0:3ae:6fda:78b1 with SMTP id 98e67ed59e1d1-3b1b0b6049emr10406718a91.43.1794861663475;
        Mon, 16 Nov 2026 12:41:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a87202sm3833645ad.58.2026.11.16.12.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:41:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Morton <akpm@osdl.org>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] platform/x86: dell: dcdbas: Suppress bind attributes of the platform driver
Date: Mon, 16 Nov 2026 12:40:50 -0800
Message-ID: <c3e83cad97cd52fe9ee130630ca4d7cae7f7f2de.1794861287.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794861287.git.rosenp@gmail.com>
References: <cover.1794861287.git.rosenp@gmail.com>
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

The dcdbas platform device is created by the module itself and stays
in use for as long as the module is loaded: dell-smbios-smm allocates
its SMI buffers against it through dcdbas_smi_alloc() whether or not
the driver is bound.

Binding the driver again after an unbind also leaks state:
dcdbas_check_wsmt() runs a second time and memremap()s the firmware
SMI buffer again, overwriting bios_buffer and leaking the previous
mapping.

Unbinding or rebinding the device by hand is not useful, so hide the
bind and unbind files.

Fixes: 12c956c4f32e ("firmware: dcdbas: Add support for WSMT ACPI table")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index 69365627fd8f..cd72f8c29a86 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -708,6 +708,7 @@ static void dcdbas_remove(struct platform_device *dev)
 static struct platform_driver dcdbas_driver = {
 	.driver		= {
 		.name	= DRIVER_NAME,
+		.suppress_bind_attrs = true,
 	},
 	.probe		= dcdbas_probe,
 	.remove		= dcdbas_remove,
-- 
2.56.1

