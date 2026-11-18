Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975953;
	b=rKTlge+o9mGYkF3uNut82eX5P6O1ZLPOuzGB21cwRPSEVBkKwYverRJVcjUc3ZZ9xiXv
	 v/PmWFUSX93taTHqRxCzfb7AowlUNL+Mo3BudoKx6IBNav4gqKk8UWFmCEw6v65wb1PLz
	 NhjHlp7btAtHO4xcnZDxHkLPtWq8f6cWSpiCgY4NTVKOgDjKB1+rHiOCXTB24WFcUD4xE
	 T8StjTgdnWOpgpWyCM8elbjIld2zfk72YimZHFk8FKAk/WnJN+sBjSf3rQkmDqpdyBOPl
	 HNxrRz05zMfLVOQGCZKeRc+S3hJ5H26y7aMsVfrDGf1k0rO3Zz203kGQT06KMztnKLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=72zm22Pn0JKcmzodgQZ3NziVcP6R5c+3EZPIh+JzB6I=;
	b=V/B+ncUWvUl4S8G8RY+rzrJiBcT7uiEfOQHFXTUYJZI9vbnN9dXbRiXe+IRpWorfDUEB
	 VrV+fqjTuglWNQtT0MrI4sR4KTNc/6my9ZIaVqZ2waRilAD1RHScVM+mFNxdIuFKeAwL0
	 ghS9Vwg5QznPI9BWr9vKWjyZZrRXz2jb2Tk2XNeHkTECJ1liYIo7/HA279YFv/ct6utTc
	 Ty380vzCg5NZAbr5y+dvk4Uec8QnLXcKFAW702twBxeZcjI0LxmuqGeav/bthGkkdOAsf
	 SOCsoBkDpyQATTx6WDrDJ/CbbvU7jMGe+ELbxaOrURjBsMrJlTyMWB+l/fZ7aHJNTnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLZwMeQG;
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D1B606A31C
	for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2026 04:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77D1B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLZwMeQG
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e987a2ba0cso3602105ad.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Nov 2026 20:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975953; x=1795580753; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=72zm22Pn0JKcmzodgQZ3NziVcP6R5c+3EZPIh+JzB6I=;
        b=RLZwMeQGLbxtOywbAl9FEnL6T5zKybffdmnFRr3YQ/XkoTPJx2kegGPWk7bBLgOfPc
         wcpdOcnMJHqiuz2GqjfmdXln0NTnOuBvkTH29FKL9f4qqsl+DEtDXx7r6BusMIOs1Sv1
         IwamUv8v0ZGfREnAiNAE0+92Oxf9m7xVhudLFl0K9LuTUkgZofl4yqo6n2BD3a5IK+JK
         gpwa5BX6ZvXlR/VhU7rrBvtJn27zID7XvjQeYiEMjT/XeRwRG5YwQBRBo0C4pKfUqDGS
         1TBG3FGs/lteNIPmI976a/Ws8y/M6aVlVU1rTmdJ43cG1BfWjCclor1AsvSRdQ9EmQEB
         C6gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975953; x=1795580753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=72zm22Pn0JKcmzodgQZ3NziVcP6R5c+3EZPIh+JzB6I=;
        b=b8wDk8q2UgoET3JTa1jluRAvE6VnRCij2vhCPNp4bCt3PAIYWIop+Vb6voLZAusmkb
         9ymyavRGcs/JbrdLTEalD6xjRb/UceJ3prrhBqqBuoI8r3fiUvU8FDdF6WNcBbL1/Nol
         hg5kKArSM/TB5t7o5CClKeto8wS/LM80PcPcnoMctIk9kAGcGzJxg2/Infi8MdEVMu5f
         iqjp+oEZ/oWmDyIC9GdpwagWDOl1pjd38IlBy5Bzw92biRI+46GOr3sUUam+/xS+EeFf
         rggGEbscZabBcEafWIV5f397Q/YXiYpgdQrdpIXWKH4ifq2HQ/Hq5clkeKy4MgViES1t
         JNZw==
X-Gm-Message-State: APuU4Z+4EN9n6YWVbQRHBU2mRfyBZj23f7SN9vf9A6MDDu5DnsptGxcR
	ywf/MCeUBaEEy/DqqcaXNFNWK/Co31lD5hZlUZzFTbRxs6K1J3wUGLqw
X-Gm-Gg: AZFdTZdTmNm3k84/FPxi594PZSRaytRfhQuYZZ+48gSBFdC5sDhNYI3bn83LbMvu1tB
	QLigz9dsda0v0kXcjaoGnEPEKyMOOOHKvCh7+jYM6ZLxgRB32LuA0/p3CQdDO2+Lpev8yXk8UXb
	8BWArMWhxjWzbrxeM5VCTnND2wxgdZrZc0bxH789cbMr5VFn2d2am8YeRgfNvrE6ZtYQLRQzigK
	nCAtQDi1Lt24ToDD6LBR85iq+T3f9VwgQspYFjAsvw+lDX8c6ryK4+aHB/4IQV2SOZGtKTZz39x
	I6/cZGtDGpi6CES12/oAtZ7s0OT4o0ojBUNvn7Qqjtums7VYFMSCeN/eS/wsgaWWh8EUIzEYLcm
	I/Jzju4aIpEtpZMTIGIaSkA8bfi3FwYp+5TYFtQCI9vUbsXhTobiQw5h41OZUEm/nszzPPV9yw6
	NqxXKJBQLrb56kWnOyM96gAa6bZqRpXwEtHcCZphcqX4L5atJLDSojfme9pzxHJKM/ckoZb0wgR
	XMECp/9NanZgk5fhiYGKDOKvxbN03dmNvEMicIW6cP8Jyc2gthQ9fpAes2fp91qGA7yfDwn9xuz
	d72zZNdUX/HOX/9hpPsceJD0qQz+ZXSR4BfqxhD8ndsrHwUdzqE3zx4JLpFU4vpJUhiM15vkRsw
	mDBjk/Lz/eXRdOxvmZ6zekNiXuEJd8Wz+21pZVOZnrTMoOzc9SpQNY79S8kXF3JTrwaAXYuaVzb
	mU6A==
X-Received: by 2002:a17:902:cf4c:b0:2ed:2810:7cc5 with SMTP id d9443c01a7336-2eff754e7d5mr13638405ad.56.1794975952898;
        Tue, 17 Nov 2026 20:25:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61b7b32sm6052975ad.41.2026.11.17.20.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:25:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Edward O'Callaghan" <quasisec@google.com>,
	Mario Limonciello <mario.limonciello@dell.com>,
	"Darren Hart (VMware)" <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org,
	Dell.Client.Kernel@dell.com
Subject: [PATCH v2 07/16] platform/x86: dell-smbios-smm: Propagate SMI request errors
Date: Tue, 17 Nov 2026 20:25:29 -0800
Message-ID: <d8d4fe3d336573237f4ff7bfa358c001f2b1eb47.1794975827.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794975827.git.rosenp@gmail.com>
References: <cover.1794975827.git.rosenp@gmail.com>
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

