Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CE81F1303;
	Wed,  8 Jan 2025 08:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736325968; cv=none; b=QQ/b564anAOePPOwtbQuk0oSSsavGSbM7P4R+QT6Aj1ESfUS7rLRkNk1IHwpU6Sn0/XsF4KRUGl/AxnDbEtb2is6CMVyOQCgU+54/ElqzRdJob2d8WYOlObtJW3I6r515E1/2nZwxygcL9XWrmMnVyCPZHOeBrLd/eoFevpjW6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736325968; c=relaxed/simple;
	bh=Kl8YH70qBGfCKESe6HmH/rPu+7PEVaQAal6Ek8WZRAc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kLaAlXO5N//7Ua4TxohD3qn5D0SP6i19CbvQWDy+T+spVTjvr9hrPrgnjl0+KLg+1gN1pu0rkZPdhZXGPERlB6vbfKO/qJdixzTImbndWiiezTjJktp6Z839JSJR3Ab8iLdSM+Xx7WVC40nh5VcbdaPwgo3mLvAXlAHucSE3Nbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJSjLPZl; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJSjLPZl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2162c0f6a39so11232765ad.0;
        Wed, 08 Jan 2025 00:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325966; x=1736930766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=va6nRfy08ptRZsQKC4EWXAo51FHwsjlpC0QwYA5fiTY=;
        b=HJSjLPZlWcJPiOyoMZi6rZnkN2bGFOwWLNYvF+0i+vub2xZLy6eqf9yr6uJRFSPMcf
         yfx5zuRQKH1O3GxOtgt45w1Iwx3pc4HdGIFwFCUBnPAQUkjZ9/wzRHd6RueZ5nzLyy9N
         73wpalAwrK3ZnKQQ1LsvhBAYOmkrql5v8udRw086TBrZSM1GGMVyPA8LdXW9odHufoMQ
         qKyfDESVpMJf8++INwTojkZIMLS8J6Yg8bu5mjye+la0jlspDVJ5iHUaQAPvaCDAXlXL
         QHCTr2JWeafTOjTlLrcMi662BzvaodZ7pjDOkStJA9aFr+5HjXjjmhnLhV6c7G3I7hbX
         Ps1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325966; x=1736930766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=va6nRfy08ptRZsQKC4EWXAo51FHwsjlpC0QwYA5fiTY=;
        b=azSpytLSJhzP6CKoHO/Z+8lVD5GqmdLDIsNzb1BkVAYJ4+cE8RefDuu3i88Ckn+eGG
         +Vmrv5DKgb/rILOYNlAni3EksZGZ5CJQmECIei2GXU4rTytET2Y2HslzyzyRegAa2MSt
         ClcSuHKIxa5JS6r2VCmfI362w1ZpzmI06HbIlvs3bXD4TbRG7tBmeYGjR4amhJ/ksgzC
         1Sooy6Ic5E7BPmS5OP09aVZMTiHSh1KvBAePbBgzyH6c8zz3sz+C/IgMlcoXao699NTU
         8XhxFMU1eqhx52axmJjQDCUlYZLQWV37MGlqYMl14HpKmrv1TSgo/bTTMuErAgsnIyD2
         mK6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWNU0i3cRiQH5HQ9bhYyKvduTXlzSyX+F/eSc3bxwaRaC25dvpLvJNiANvqbL3TyYaeeS14YOJLt+2DJB4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEnEnnzW5FkOa31E4D9Ra8j9a2wt0S7vkFomC7xDTH3JpTuZ8q
	q2q5Qz46MRwQk3Hfyuszu6QN6JxGyTMJXSuhqFb7TuXpP7PkNDKvOtKuo5FamVk=
X-Gm-Gg: ASbGnctp7mBryTxW6hmOyyyz5y0WIYOYrQWBpFwMC+cOZi91CC0OE2uoP7NeSwZPPxx
	ULGcrmQVnW6EAZE6JgFu7MfU0zT+z1eyq5A4Um6vqykzKYCcBrjh1J+f9WDhCJHFSz6z4vEAYOA
	sAhKxGtlRZuz9RAsKbmFCczUeudnpLMB8rVYaSjXtdXm504D2YuAFaehBzuur2qR222Y6JwTP1d
	/PfMiUMmpBAcdFUAHKINg+iBLePXi3XeAycabw0jruFR99ACnGyJMTuLpPS/Q==
X-Google-Smtp-Source: AGHT+IH0q4kPIlCsDAqItmaecksfKpLuZRkLFC0t2p19OyKa/jdpSIpPLqv0x3YyXmvJW7k931phxg==
X-Received: by 2002:a05:6a00:3a04:b0:728:f21b:ce4c with SMTP id d2e1a72fcca58-72d2169f582mr3582460b3a.5.1736325965770;
        Wed, 08 Jan 2025 00:46:05 -0800 (PST)
Received: from [10.113.16.67] ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c18fsm36150152b3a.184.2025.01.08.00.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:46:05 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Wed, 08 Jan 2025 14:15:24 +0530
Subject: [PATCH v3 2/5] platform/x86: acer-wmi: use new helper function for
 setting overclocks
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-platform_profile-v3-2-ec3658d9be9c@gmail.com>
References: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
In-Reply-To: <20250108-platform_profile-v3-0-ec3658d9be9c@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736325951; l=2353;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=Kl8YH70qBGfCKESe6HmH/rPu+7PEVaQAal6Ek8WZRAc=;
 b=6F5gqWaBZKev3KTA0ioUz30QOSUJEnkOarSvOQ/Ei+6iyRmCSzXNE2f+6DSBzzuDY0uCABWNc
 C8c91f74DWgBFwQfcDHNBarPj5FpyKwaoEf9+cQxFDRlzleo/ZQa/3W
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Migrate the OC handling in acer_toggle_turbo() to the new helper
function for issuing the SetGamingMiscSetting WMI call.

Signed-off-by: Hridesh MG <hridesh699@gmail.com>
---
 drivers/platform/x86/acer-wmi.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 97eabb0ec42781a27e6a00ce0df4c8a815c1b817..f662e3740408f70e1e921a90fe75ce441fd239d0 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -119,7 +119,14 @@ enum acer_wmi_predator_v4_sensor_id {
 	ACER_WMID_SENSOR_GPU_TEMPERATURE	= 0x0A,
 };
 
+enum acer_wmi_predator_v4_oc {
+	ACER_WMID_OC_NORMAL			= 0x0000,
+	ACER_WMID_OC_TURBO			= 0x0002,
+};
+
 enum acer_wmi_gaming_misc_setting {
+	ACER_WMID_MISC_SETTING_OC_1			= 0x0005,
+	ACER_WMID_MISC_SETTING_OC_2			= 0x0007,
 	ACER_WMID_MISC_SETTING_PLATFORM_PROFILE		= 0x000B,
 };
 
@@ -1530,9 +1537,6 @@ static acpi_status WMID_gaming_set_u64(u64 value, u32 cap)
 	case ACER_CAP_TURBO_FAN:
 		method_id = ACER_WMID_SET_GAMING_FAN_BEHAVIOR;
 		break;
-	case ACER_CAP_TURBO_OC:
-		method_id = ACER_WMID_SET_GAMING_MISC_SETTING_METHODID;
-		break;
 	default:
 		return AE_BAD_PARAMETER;
 	}
@@ -1891,8 +1895,12 @@ static int acer_toggle_turbo(void)
 		WMID_gaming_set_fan_mode(0x1);
 
 		/* Set OC to normal */
-		WMID_gaming_set_u64(0x5, ACER_CAP_TURBO_OC);
-		WMID_gaming_set_u64(0x7, ACER_CAP_TURBO_OC);
+		if (has_cap(ACER_CAP_TURBO_OC)) {
+			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_1,
+						     ACER_WMID_OC_NORMAL);
+			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_2,
+						     ACER_WMID_OC_NORMAL);
+		}
 	} else {
 		/* Turn on turbo led */
 		WMID_gaming_set_u64(0x10001, ACER_CAP_TURBO_LED);
@@ -1901,8 +1909,12 @@ static int acer_toggle_turbo(void)
 		WMID_gaming_set_fan_mode(0x2);
 
 		/* Set OC to turbo mode */
-		WMID_gaming_set_u64(0x205, ACER_CAP_TURBO_OC);
-		WMID_gaming_set_u64(0x207, ACER_CAP_TURBO_OC);
+		if (has_cap(ACER_CAP_TURBO_OC)) {
+			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_1,
+						     ACER_WMID_OC_TURBO);
+			WMID_gaming_set_misc_setting(ACER_WMID_MISC_SETTING_OC_2,
+						     ACER_WMID_OC_TURBO);
+		}
 	}
 	return turbo_led_state;
 }

-- 
2.47.1

