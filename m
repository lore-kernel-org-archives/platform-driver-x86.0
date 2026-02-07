Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0D526F2A0
	for <platform-driver-x86@vger.kernel.org>; Sat,  7 Feb 2026 17:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770484611; cv=none; b=s0HrpAv+pQ5yAx7OMYeEWlANhC4kiwN7alBGU9g6h6nX1CSbcl5xlgGjFAhbjG2xF3rUFHC+ez0GuQD6GsAENSnnIg9yvGYS5XH3ZuEhCMtvjVERW3Yy0YggMZIyL9QDP0f1K7Vvs/rOH1Vmyve/RWf3fafMhq0tHg5EemVsgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770484611; c=relaxed/simple;
	bh=0qn80RrvMd49Rd1AazoqaDvABBoAMl70AJysxwOin1s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uloDhwYa6cK4uFME56PC7ErXggxZMALZRqRjtRMI06BV+IHk1+TaFY5qrY1OHj+To9vBMd3Gv5b/fb8FWgEWLrJ+AE4CX0nJIqgxDYIVPCgVAOkdXEGjZVMkbTb4CE/K4ktexyrpFDZfXA8zY6tY6wJAWegAzt8PxookMA4d/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnfJKKHb; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnfJKKHb"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56373f07265so2296327e0c.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Feb 2026 09:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770484609; x=1771089409; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ha3Gbe9vIFbOcg4pmgQ5XVEUYBYzQJq7+aTnsh5eblM=;
        b=JnfJKKHbgwaxbNBJrxO/0pJHFTPuqck+aXNBQzlbL1LzlVpiWOqb0mpU2kHzjrAKuL
         GLd3eodrxHkNXOcfYT0DuV+1cTTyVcA+/wtApdxudtCKxJNBJGOfL5T4jE1chgzeJ9IE
         YpPZwgcASRjgku6C/MmQmupnZFqx8kdB38Uxur4mnPY+E20dJNStQiUNf7bwLToRGsps
         o1LOai6CN6Kd/J3vtXxV31MpEENkIY4AMAmc0DzbrvzKILPKy0QgUGGWWMs/g5Ybpiy7
         p3IdNItMj6/7dl3NMSaV4n0va7FVGi+0j3VyiGBxj3QA1hNLEqXxm4p042wOHKy7ySZg
         /BUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770484609; x=1771089409;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ha3Gbe9vIFbOcg4pmgQ5XVEUYBYzQJq7+aTnsh5eblM=;
        b=OTvqs/SYNnmaTWzkv3Kq7eUk9Dx9P5qbvcdgwFeTgfri/wpmm0IdCwqBur59tEoBfY
         eLHShhmCS82IswGWvNZfzQz9HhkM38I5mgHwUZr0TQoY7zEAslbGL0jbpRi83+1MR6f3
         rbQx4fowAcklbs1d/vrZ1vxtVd6FyoYaMsONyEnjNpdHnx166gAl9C8AhcXbmVUOVFx+
         phEL5F3UPX3zJxUv5hFD/bBodXH8+stZF4Dv/eZIJL8w6tBK3+jHgpRJDRBMo9QR0nYx
         BAaUrE3rJypskCUAM9wop2xYkqfqAz51GjwQQ+H2Aj6esFRLFMCcXEYwn7VeLEcXQSrg
         E/aQ==
X-Gm-Message-State: AOJu0YwrFM4ckCIiIT8RQNsyHDMjDC5ncMGML/LqNrMmNHymyj0cn8mU
	8DPT/2rk6+S1V/qt0OTIhA/FNoLXzy0FHfUavvAp2v0hs0byctVOof9Jpj/X3/a4
X-Gm-Gg: AZuq6aKFshGDNV/A29q5y+oQZ4E1WeVG037h/s9S+H4HGXoaHuoXQ4KVAIhO/xDPq16
	omVzoKclDQd0RrEbAonVMLM7tmfC6cvjWsfIDnsn2XKaZvY8/EnKgIqJhOAnYfnqonQx56nyw3O
	zvx6/QeK7wWPwG7ikTwkMkLrz1bb1+q+gy5HIYaOJE6iZB2tiuL8fu0W5xhSiUvRO1tcCNmjUc3
	Pbz+wiK5x9VkYwLXOfDQ8iI2XYm+mteiih2goG6BtpXBziN6nRPeQU785PNk9ZTzjPTiQ/5HdOK
	PjeDPuf2cwJ+Bfl3HkjoQ1ylrSUtSgxXJisOUqtfvaiz1BJiOYjVq95CJhJLcnbdmmVVwpfzabV
	KHr7E3MpsAl1JrwPFJKvUqSNH63Jj5nFvqIICvCgMqDDKz9Ky0QFOJ5gFirL0tikOZiB1wHPfrT
	Nh8DfPEJlaoVdA
X-Received: by 2002:ac5:c013:0:10b0:567:1660:13d1 with SMTP id 71dfb90a1353d-5671660192emr458295e0c.6.1770484609420;
        Sat, 07 Feb 2026 09:16:49 -0800 (PST)
Received: from [192.168.100.253] ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-567074019ccsm2010770e0c.11.2026.02.07.09.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 09:16:48 -0800 (PST)
From: Kurt Borja <kuurtb@gmail.com>
Date: Sat, 07 Feb 2026 12:16:34 -0500
Subject: [PATCH v2] platform/x86: dell-wmi: Add audio/mic mute key codes
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-mute-keys-v2-1-c55e5471c9c1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03MQQ6CMBCF4auQWVvDDLElrrwHYUHKFCZaMC02E
 sLdrbhx+b+8fBtEDsIRrsUGgZNEmaccdCrAjt00sJI+N1BJukTSyr8WVndeozKu7sjYvkLjIP+
 fgZ28D6tpc48SlzmsB53wu/4UKvFPSahQ1XRhU2tTkbO3wXfyONvZQ7vv+wfBPE1TogAAAA==
X-Change-ID: 20260126-mute-keys-7f8a27cd317f
To: Matthew Garrett <mjg59@srcf.ucam.org>, 
 =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dell.Client.Kernel@dell.com, stable@vger.kernel.org, 
 Olexa Bilaniuk <obilaniu@gmail.com>, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361; i=kuurtb@gmail.com;
 h=from:subject:message-id; bh=0qn80RrvMd49Rd1AazoqaDvABBoAMl70AJysxwOin1s=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDJntxZVPP8rYnfx04X/lift220y+tczYZ7TW05fb5osOu
 +WcQg7tjlIWBjEuBlkxRZb2hEXfHkXlvfU7EHofZg4rE8gQBi5OAZjIrzOMDLPSjn38dSpuc9nZ
 5QKLqra/VX61XmqdVoxYefuDG/v1ZwozMuywmvd+jd3S61WXDLif/0hYZ6Z1Towz9PcF24Vf7zs
 dusYHAA==
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A

Add audio/mic mute key codes found in Alienware m18 r1 AMD.

Cc: stable@vger.kernel.org
Tested-by: Olexa Bilaniuk <obilaniu@gmail.com>
Suggested-by: Olexa Bilaniuk <obilaniu@gmail.com>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
v2:
  - Put the codes in the correct order
  - Add comment above keycodes
  - Mention the specific model that uses these keycodes in commit
    message

v1: https://lore.kernel.org/r/20260201-mute-keys-v1-1-825e786732fc@gmail.com
---
 drivers/platform/x86/dell/dell-wmi-base.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/platform/x86/dell/dell-wmi-base.c b/drivers/platform/x86/dell/dell-wmi-base.c
index 28076929d6af..907f1da01c8d 100644
--- a/drivers/platform/x86/dell/dell-wmi-base.c
+++ b/drivers/platform/x86/dell/dell-wmi-base.c
@@ -80,6 +80,12 @@ static const struct dmi_system_id dell_wmi_smbios_list[] __initconst = {
 static const struct key_entry dell_wmi_keymap_type_0000[] = {
 	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
 
+	/* Audio mute toggle */
+	{ KE_KEY,    0x0109, { KEY_MUTE } },
+
+	/* Mic mute toggle */
+	{ KE_KEY,    0x0150, { KEY_MICMUTE } },
+
 	/* Meta key lock */
 	{ KE_IGNORE, 0xe000, { KEY_RIGHTMETA } },
 

---
base-commit: 008bec8ffe6e7746588d1e12c5b3865fa478fc91
change-id: 20260126-mute-keys-7f8a27cd317f

-- 
Thanks, 
 ~ Kurt

