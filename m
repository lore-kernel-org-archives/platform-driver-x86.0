Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873325;
	b=GSNcGCs/4S0g/XKJ0jFHQQGMsL4LMjouSgbsFr59MpPhgMIQa4lweAgtrJCab9drDGJ9
	 Ig6v3BfF0eBf3md/mpM8Qe1S6rTthJohg/pgtOq3UZqF6oxmjyBDr86wIG88sawoY7gE2
	 EsiYUaI44TU/HTFKEexZVoCMjSrirsh2RupCuOXxxX/h93w24eMojcZRCQK0G/sDVe4gy
	 FWGItbk0vD3WPFZRheIAJeGMln5jgij8JVpygo9SzjZ5KxIxGDocSbAfAOa8d6VzIPsT9
	 /IwcsfpqSeDXLS4+13nko0ILQUnIzG9ZySYn+Tv30YZvDhVgvU54sBSlaL1scTyo91Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=72zm22Pn0JKcmzodgQZ3NziVcP6R5c+3EZPIh+JzB6I=;
	b=kZsF9YMESVMaegbjdtzmB8OeTcNWq4xaSuxZgAo3yhlOYE97kShKhA926cHpUq5S7AQq
	 OuP1aPlGxfbtTjqQnTnezmgOLN89kUSgYhmphtn1KZANdwQ+2JT9qAqZ29hlUxS+iavcU
	 O33Nja54n45WsdII6CR9RnjRopcMjxeZVECD2iyHUx5co/OyIHXKlDLyE1xAFJXs+ETqc
	 qhJiwJAEVjs+UbawmYO+LspwB/c7HEFqeQaKlHx0xrRib+xk4kwmwvKx4J1NaymJm1MYF
	 klSIsWKnW3alKJwfUUG1MO51ZR0YqNRdKEuP5cYHCPPX9qbNsp1yOvVJ09H3PVp57tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEkv5dkS;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498F1606A31C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 23:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 498F1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EEkv5dkS
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-380b40312e2so2143895eec.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Nov 2026 15:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794873324; x=1795478124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72zm22Pn0JKcmzodgQZ3NziVcP6R5c+3EZPIh+JzB6I=;
        b=EEkv5dkS6Do9RqODPLjUAMjUKGjtC9fUYkWyGondM9oD+aymEHlAvGtZ7UYuF7bNSw
         EJoKA8NOFUYlAWGdvjen/MsXhTTiGRncRt9rBdYaHExcyuGeqgNsscFF+AMlaciUMJug
         LQY8avTyV6LIhqkOagxxJwcx6T4uoGVIfRk/8VIxZG1e/QOXewChouq/aTjviFiQQNCJ
         ZN8pEnUc8bG3c0hYDjLtSkW6Mz6WlQa9myYq40uqnDe8XlUyHAEdAlF+aSjqWGTUCjrc
         rP5xRt81t1SVl7bGpBs4FS8ElI93afWLtDzF/n3lNy2alavuxTj285Zyi7J4GY3ePMg1
         2q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873324; x=1795478124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=72zm22Pn0JKcmzodgQZ3NziVcP6R5c+3EZPIh+JzB6I=;
        b=bDW8K1F3G/6sQDfAOLDafuDtAqvz6aI9Gm3tntGJH23Adov0aKYaNBJ0Rbak8TS0Lv
         AOYbb5GSAY8r0kMhm3iOmcb2DqoDGgg5mvgVILWWh0oOnD8KEnVvzUeX2bS4SY9lF7XR
         YbpaxFOYOsyzzvFrQrYzg/MX4COoTZ2tk/ILlQ++YyAIvyPka3a4YdjIkK/+88dFLvN/
         HUYu4Thb5u/BnTzULyVpGJ69dlAahMUIylKSFrGb5HX6ALHaPcjlnawrwIsF9D4MnMnB
         71PzA2V9UbWSFTQjShyGT1yrqpaabTf0+QG1Q6JDJWvYhkvCYyMn17vvBvtoYrWOIW0a
         JhOg==
X-Gm-Message-State: APuU4Z9cNB40d4mXNOpF0BSyEvvCLYQwqb2nyqJ+4doJLR2VmmZ7Cb/A
	Ga/10YrcVPK1ogwIGMe+32S/yrDMc72X+S5BX9lBGhoN/mTcHOXbNEIj
X-Gm-Gg: AZFdTZdmPwgIr8OizDqLyYli1OPi0SyG3YnjHjTV+96VhlC5odH9CRd4ZYxYiH52lTR
	27z4Vu7dqMWFNPGavs/nUz5c81OouY8N5WGuST8Sxjf7izEBnsVQj49VsgdmpJmiHh/G9VVwx2G
	aH7+cgp21n6MYtmK7Kb/8oZ1xMBVD5XDSKLVOWAl85v9rqdecy5A5xJu8fdjHOjVfqCVVFDUBN/
	Qaj6WaQIHZpNsMM3NOF+na4PxswJCKW7EBX3LAj3r8cT6lB1KyP8zuWXEFX9dKH7UReUDzE9ngl
	TkvEjUC9jsHkgRHSGv8sUiDurIv1dh5ABiFycxyjMnu5rgxUT7n7fAvqW8zsD+otC/ki4M504bo
	DZ3lbWBgE6ivvZLoRAVQQzf+JBNjfSTGq3wt9KRz3Z+m++7vPYj7JGWTanX1C9bB+rI9BRGRusW
	RDnGdLC+b0qUnno1iiL4tl+hwHhCRieiPeqLwQ+OQ7zo4cxKxmoGT+4p54R4JGh6nFy7NLYiGAz
	TD7m1qEMehNALZWmlubGPSGNHXewTy0KVVMnPCnRb0i39NvnXfrY4Uw46r1Bw88R5sO8BZrJVss
	1s2vI4/FcIbx1VK+6hKTeCtF7en8Xfeziu2fIVcMy7k7EjPpaRQkgg1axhwz7XDseQ93l9aAz4W
	LTOqpS0tvDqNJxHV4OppFg877xNdTxxWf1KU1RxYnQ7OxGyEvhmi9ik3VOuvNCb2/+d1Os/bUBn
	15rw==
X-Received: by 2002:a05:693c:895a:20b0:369:f97f:72c1 with SMTP id 5a478bee46e88-3796721d051mr11614721eec.36.1794873324186;
        Mon, 16 Nov 2026 15:55:24 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3797f98b9b2sm35426939eec.6.2026.11.16.15.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:55:23 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>,
	Mario Limonciello <mario.limonciello@dell.com>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH 07/16] platform/x86: dell-smbios-smm: Propagate SMI request errors
Date: Mon, 16 Nov 2026 15:54:51 -0800
Message-ID: <796f34670c321c0de6fa2029a649ed828d15006b.1794871007.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794871007.git.rosenp@gmail.com>
References: <cover.1794871007.git.rosenp@gmail.com>
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

dell_smbios_smm_call() ignores the return value of dcdbas_smi_request()
and always returns 0. If the SMI was never raised, the caller gets its
own input buffer back and treats output[0] as the firmware's answer.

Return the error, and only copy the buffer back when the SMI ran.

Fixes: 549b4930f057 ("platform/x86: dell-smbios: Introduce dispatcher for SMM calls")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dell-smbios-smm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-smbios-smm.c b/drivers/platform/x86/dell/dell-smbios-smm.c
index 843e379b2286..8c297732f351 100644
--- a/drivers/platform/x86/dell/dell-smbios-smm.c
+++ b/drivers/platform/x86/dell/dell-smbios-smm.c
@@ -60,6 +60,7 @@ static int dell_smbios_smm_call(struct device *dev, struct calling_interface_buf
 {
 	struct smi_cmd command;
 	size_t size;
+	int ret;
 
 	size = sizeof(struct calling_interface_buffer);
 	command.magic = SMI_CMD_MAGIC;
@@ -70,10 +71,11 @@ static int dell_smbios_smm_call(struct device *dev, struct calling_interface_buf
 
 	mutex_lock(&smm_mutex);
 	memcpy(buffer, input, size);
-	dcdbas_smi_request(&command);
-	memcpy(input, buffer, size);
+	ret = dcdbas_smi_request(&command);
+	if (!ret)
+		memcpy(input, buffer, size);
 	mutex_unlock(&smm_mutex);
-	return 0;
+	return ret;
 }
 
 /* When enabled this indicates that SMM won't work */
-- 
2.56.1

