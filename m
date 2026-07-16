Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44953F789C
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 09:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195706; cv=none; b=mdVWyNOeJCdy/UgXrYQN07RADemv6Qy+nUi/XqJObghgipLAtP1uV50KNGOc5fYYWgEvQ+ULRpsruA+ktvpKkx3/Mk69aGgJV+08pMEv4T7nk+BA3d4TOrG6RloWmVNudFO9VOjR9okaG5V6AkmpcTQi50lT2NCmK1Gr7c2zRr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195706; c=relaxed/simple;
	bh=frLm7eDrXLzNQdHNEVt/2yfEvwS7Dqt4TOMUJDhPTIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LonzMomah/rSu64l9sXLvawP/0B0MNwJtIdzKxDIakrfpc3PJEgCJ5cJug23w3VgM2R4QqLUKHTdu6oy2Wj6xWAjPNzaA1yMuFdP3t7+Cx0GmQc0QYxOJM4sNgTZ23hY6Bw2LMYHVNvDLWmgLKeTIoq2wYG0CU63vgejfvKXHbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+GEu9J9; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+GEu9J9"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c15b51ba80dso60437966b.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 02:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784195703; x=1784800503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpBD9DlmbjWXiMcbHMb5aTELYylItYcWgKbqrcHcEZc=;
        b=R+GEu9J95vp9yoopKXEG31obVbLBdH70O4gda9GltKngYK2EJLL+qtXCRNAirlb2kG
         zHzxl1ERdC6iEEXN8RUsRzEdh6OxQNQP8O0DAr2i+9Bn5u4GRH8CoNexfnNB/oJg5/3c
         ngRVVTfBoKps2UMPthkBGEgq8PCEprXMp3gxRsyz7kRqaVYC0rcg9Ga+UyL9/ZlkIbVD
         gkp9L4tC8CRCkQ0WYd58EX7LJnhzixWLPGLW3eP0G0BMdT01LU8ZWo9sRskOybI8Q1hF
         jYF/Frgb1rqyRw8tP3QdhRKueM7XoIYVTJVx3rJJVT9WjFbf/C6ytBRrLJ6CTgyGqAFx
         BtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195703; x=1784800503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpBD9DlmbjWXiMcbHMb5aTELYylItYcWgKbqrcHcEZc=;
        b=rax1TCtvXdT/AtIvrmvQsr26wI9JgfdsNE4UfvCuFj9yXrp8MazTZ5BZrq4DT+/rd2
         vUG0hkLb0qyd6ifBBrIBnJBK3Wh0wGCm43rCmMs9WmbyPspoI/eShN21EcONhhshZ5IC
         ms4vEc8kyZzWQ76s4QKeVw4kmB0nVWTQY8tmGWQ5ovHmEFSdNic79Y1SNHRh17fVfdX9
         gVZfGViMcJ2NwGZhV1kj82lhtU0iSmgPYanepBHsv4iTFdl2CQJ9TerhIuczjAg37zPM
         H6OGrK2iu0uYjbXWZvDZgrNMbfKf6mI+eBIsL74AZ5K4Y27BZtECwEe7MZx0BsvRTdV1
         uxHg==
X-Gm-Message-State: AOJu0Yz9RsXl3PNinwXSwv/pYSKWG+oolNv3xvosehQb6JNKYZu3buln
	YX7Z13ZcIoSQKQouqHLOpQr5hzYRink8zp2RiviFCzqkIBzhbHZ113ZZNnXIXXnVL+lu3kGA
X-Gm-Gg: AfdE7cnCs2VFKP5QtX9uHlAddxuYvq2nG400liitPiNUUqnjoqa5c/Tl1yrmg+twBy5
	IWr/8zCDO4q0HG7Xp8VtbkVMedbUHpB9T9mrJnnN+gfAZjOojibKBYiPt71WFCTWBQS3O/GpHQC
	e9wgy+rlpN81ZIiPtgNRSoAc5JWDH6siIuYAUEOZnKTQzgr42v3WkZAIqs9rzn+F8Dqh4zkQTyG
	uC6GyziGmdUZfA9LuuMRPM0ebFNJDYdn4iG+nfc7aQnLjQZMaypFknoAu0tBtUNJ77oLAhlcF3V
	TcexG3sZJ+bLDcg0Qm8C2VFPqjmk8ig2uUhQbNj2UKRNlw5x8aqAB469VJFAKJ+75bH60wywED3
	f82w/hZ/0uj4oQ2cQdm5n1/DDz/rDWX45td0ZP9+47H339LN30irvwuASmrNvxOxUaaJi
X-Received: by 2002:a17:906:ee8c:b0:c15:f4bb:e665 with SMTP id a640c23a62f3a-c161ea8d628mr707638766b.5.1784195702614;
        Thu, 16 Jul 2026 02:55:02 -0700 (PDT)
Received: from fridge ([193.32.127.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744e702sm178454966b.47.2026.07.16.02.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:55:02 -0700 (PDT)
From: Emre Cecanpunar <emreleno@gmail.com>
To: platform-driver-x86@vger.kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: linux-kernel@vger.kernel.org,
	krishna.chomal108@gmail.com,
	radheykalra901@gmail.com,
	edip@medip.dev,
	hello@kursatabayli.dev,
	mjg59@srcf.ucam.org,
	akpm@linux-foundation.org,
	jorge.lopez2@hp.com,
	jes965@nyu.edu,
	mario.limonciello@amd.com,
	julien.robin28@free.fr,
	Emre Cecanpunar <emreleno@gmail.com>
Subject: [PATCH 3/5] platform/x86: hp-wmi: handle errors in the OMEN key event
Date: Thu, 16 Jul 2026 12:54:16 +0300
Message-ID: <80d2021166a4e71453d366012598f5f4ac2f2c34.1784195117.git.emreleno@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1784195117.git.emreleno@gmail.com>
References: <cover.1784195117.git.emreleno@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_wmi_read_int() can return a negative error code, but the
HPWMI_OMEN_KEY handler passes it directly to
sparse_keymap_report_event(). The value is then converted to an unsigned
key code, causing a bogus lookup and a KEY_UNKNOWN input event.

Stop processing the event when reading the key code fails, mirroring the
existing check in the HPWMI_BEZEL_BUTTON handler.

Fixes: f4a31a428d0d ("platform/x86: hp-wmi: Add HP Envy special key support")
Signed-off-by: Emre Cecanpunar <emreleno@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index e226b772ef00..29881749aae6 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -1253,10 +1253,14 @@ static void hp_wmi_notify(union acpi_object *obj, void *context)
 		platform_profile_cycle();
 		break;
 	case HPWMI_OMEN_KEY:
-		if (event_data) /* Only should be true for HP Omen */
+		if (event_data) {
+			/* Only should be true for HP Omen */
 			key_code = event_data;
-		else
+		} else {
 			key_code = hp_wmi_read_int(HPWMI_HOTKEY_QUERY);
+			if (key_code < 0)
+				break;
+		}
 
 		if (!sparse_keymap_report_event(hp_wmi_input_dev,
 						key_code, 1, true))
