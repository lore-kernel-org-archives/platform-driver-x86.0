Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589A62D6409
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773783026; cv=none; b=YkM6jUAIiz+0SS7Ex8yZJ/Vs6lD8t6yG7oN/wwbVJL2ASNoCPmWuw5kXH3yQaoutnkQ6pAzb3Gkvdp4AB6utXMo17qEcitBcTV2YeOdAwbDl0Wriz2dyviwCDjvEhv/jCsZaPiUbK8IzMmMFjqrG3SVuZT1He9B0ZmJX2T6tDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773783026; c=relaxed/simple;
	bh=GT+RMnUGNW3pg4KIHSqlZkJKvQO2QuJvPHUQ7LFqJUQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=tNicXSeiyspvCpGGLfxikgTdf9EsIPczmtiSd9XZhziibYw9V4GwkvN91anwEwe6rZwMz/qJAvMle3OXsr0mPszyIsbHAUq4YzGztKW8KquwUFSLgECofWbid+1XbNbXMSHilXZEnVaubYqQNhhltIodCEUHZxLN0Lyw0kJvdm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jguk.org; spf=pass smtp.mailfrom=jguk.org; dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b=kFF07n2c; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jguk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jguk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b="kFF07n2c"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b7c2788dso3848937f8f.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Mar 2026 14:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jguk.org; s=google; t=1773783021; x=1774387821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LSPSW+zj8wRFZLpuz0wMsyIBmxuXA+r3ZWc0AIMuGL0=;
        b=kFF07n2cAcYegzUiqM1dyBA8S7jD308h9DY8P3xA5JsnVSph/yJscg/7IWK1R1seCa
         oLLXfo0oQDEBCO4nWNDNbNGpqRKgWSk4+6jqg/ZBwHJrEN2EyXk1fnHGWylcT7wNWljo
         /Z5RREMWyg5PmaszmUR5g+L9SgYlwvL/2FGWl6gPYpiK+p2S/XZW4yHxUAjqOEZaJqbO
         7seevS7jbjcmNOcoKWwQg8wy7/maaXbvCkp4kLlZp8mXkWmN6u/F/6r0o+vP2RDpLpx1
         ERGvvtU8nFaJTkZ92Xq/cj8Odo46j42nE3ZBY0Cc4lywXt0K8HeJ4CQey8C9RJ52Da66
         H9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773783021; x=1774387821;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LSPSW+zj8wRFZLpuz0wMsyIBmxuXA+r3ZWc0AIMuGL0=;
        b=MpLjSs4ozx9M5jGaBkAm6HkEDpExCC4u0lBP7HFaJZm8SnDNQeRwvIyph6w5uU3xP7
         ASj2L+f7yHA2l9vdT86IbQDdz1s0uquFDZDTw/a6V5nhRz7udJgvrGhDgbH8aiuBnw5H
         nNjug2b8hLt0MXVl/wsIgbuagp3f9ShpjgTpK33Js0xhaiSmZcRcPqsbO5SYah2JaAvL
         Uy8Uo/4DBPMw9ShqPZDvaNVLyeQWVZFXDQkEEEt/iCmAGJPrwB5I8fWwvE2ayryjg07L
         Uk9MmDnlYE9M/5u8xvGEmVEWejfy442WUltRTd2OBoHoblRWS0AZ9qnZ/OkxjHBALJMr
         QUgg==
X-Forwarded-Encrypted: i=1; AJvYcCVxcnfR82fy0t0dT0bptOdMn7xEFwfUlZf32EcVttF6nzXfROZg0jwworULkY62oJ4O5Yl7iyQksR66KWGyszjYKtuL@vger.kernel.org
X-Gm-Message-State: AOJu0YwTh90FbaIs9vo/vSXgQOQCpjYaHS5ciylsJqtPvTOsaH5mBVhJ
	nXIKaGEJw+Ip/+dPRnRxcVul9hpqMiTz01ODdCPjcbQmqC/5nhiCvvJiGgbLFFUwWZg=
X-Gm-Gg: ATEYQzxEgQMgQ5aN4WNTAokEj3x7KnOXYSOoExK9qazYpXN7T1Z2SAM2vLoaQwUNdpV
	vHP+afLcL1AyiNlrnf79xlZ7p51o/mB4//DYfBGtERAtHsU4sHToMSK7//UcVayi2weeGk718EC
	PlmjZAROByFRV39e7E9lQw2bFaYy5F3Y+U+CGUyS6Wj+eJr3Ou+joiEqnBiLAwS+WLG4DYzjqeY
	7VB1VPp0fqU8+AyMRw4I9hGeYdPCO65qAb1l250KSK8WuO8sLkzWh9ehE8gwl/F3BPqXNdlt3zy
	o3pYfzYDD9NJY/u6MKdw71SbgCj/RQ8sd5sBIA8WrTy78KWoDHjPs+4qdpoz6lHxKvfBUnbmhhS
	Mll7rX3U8+Bh7yDGAkgXmOaQEI39MQIfQ0I8UXsEvux834AeqKgA1o06vhXtaSk1E5lB+PyU4WQ
	4r0CBwAGgIAN/iddsFZK5El1Yfl3+0jCBr+ysrH9tS7imfE3izGrMFIPz/3GytxiyVLGjOV9e70
	80LokassSjdl5Yg
X-Received: by 2002:a5d:588a:0:b0:439:ca9b:1f61 with SMTP id ffacd0b85a97d-43b527aa30cmr1462604f8f.17.1773783021167;
        Tue, 17 Mar 2026 14:30:21 -0700 (PDT)
Received: from [192.168.0.154] (slou-04-b2-v4wan-170873-cust220.vm28.cable.virginm.net. [86.15.56.221])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b5184961csm2438198f8f.6.2026.03.17.14.30.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 14:30:19 -0700 (PDT)
Message-ID: <09b38ae4-bb6a-4df1-a679-deca52edda88@jguk.org>
Date: Tue, 17 Mar 2026 21:30:18 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jonathan Grant <jg@jguk.org>
Subject: [PATCH v3] platform/x86: asus-wmi: log thermal notification event
To: Mario Limonciello <mario.limonciello@amd.com>,
 platform-driver-x86@vger.kernel.org, luke@ljones.dev
Cc: linux-kernel@vger.kernel.org
References: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
 <50cc3d4b-5e5a-422c-9abd-556488710988@amd.com>
 <94dbe1e1-d706-47aa-abf5-f5d76aacf017@jguk.org>
 <7f2f4b15-2fad-4784-a524-7f92f6b21a94@amd.com>
Content-Language: en-GB
In-Reply-To: <7f2f4b15-2fad-4784-a524-7f92f6b21a94@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

From 4eb1a89ef5b481a8bd85bd68735b879e4ed6cb27 Mon Sep 17 00:00:00 2001
From: Jonathan Grant <jg@jguk.org>
Date: Sat, 14 Mar 2026 02:11:09 +0000
Subject: [PATCH] platform/x86: asus-wmi: log thermal notification event

Print a diagnostic message when the ASUS WMI interface receives event 0x6d.
This event was observed shortly before thermal shutdown on an ASUS N56VB under
heavy system load. The message helps diagnose unexpected thermal power-offs.

Signed-off-by: Jonathan Grant <jg@jguk.org>
---
v3:
 - do not change unrelated whitespace
 - address -Wdangling-else by adding braces

 drivers/platform/x86/asus-wmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7c0915e097ba..3bdd92baac57 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_THERMAL			0x6d
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -4597,8 +4598,14 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 		return;
 
 	if (!sparse_keymap_report_event(asus->inputdev, code,
-					key_value, autorelease))
-		pr_info("Unknown key code 0x%x\n", code);
+					key_value, autorelease)) {
+		if (code == NOTIFY_THERMAL) {
+			pr_info("Thermal state change\n");
+		}
+		else {
+			pr_info("Unknown key code 0x%x\n", code);
+		}
+	}
 }
 
 static void asus_wmi_notify(union acpi_object *obj, void *context)
-- 
2.43.0
