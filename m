Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E06A239799;
	Mon, 13 Jan 2025 13:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736774071; cv=none; b=ggY/2NllfH7ojMGdohF2o1uhookRcONFbkiqXmIb1+OAo4RPBNdzQqF1NHWHlhHDMrD4KN9ECdYq/0rDuiVnRQF+/HVaoH+CzQB8HMlakhMmxZUdvfH3ChqKPRdnv3Ocx6JwCqeYKwIj/xaeopSuT7I2LEGgI1QU8yT/Zorn2cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736774071; c=relaxed/simple;
	bh=/2PZqZ2Q1Ex2bCSurEz+J06diXlNfkvXCvYLzS+lnBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dLdul7TDigl/a1XMFPuD7XljIpWTSMF/GpdLN14xdHOsYIzdajPaJcNmDHjvLi0VK0yybT3YoAmvg1iH3BE0kA4z+5w8g2+QiThIj+/7w9FYi2ytcjgaM3iHMt/g5MccAJSpD4mbwDKPtk4bV/etiosUYUjKdtxL2dlM49Sj3bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjhAZGz8; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjhAZGz8"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2165448243fso87744575ad.1;
        Mon, 13 Jan 2025 05:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736774069; x=1737378869; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFH01bfsE3REKuhcMcn2EtahAaVgk7Obm1EnzRjK+hE=;
        b=BjhAZGz8Dq0c8SyO5sWVFaR/De8sZCw5Jvp5qDvc8Z8B/efXO2KbjdxQAWWexEkiPg
         tpv6W5uIN4iZ81adk8ioek748jFk1SMSnHkqJiZjJzMfUJ4pcy/B5Fo+L0IhkeruSBZB
         gLBuzYXP20uthW1e2UFNlzSzftwwS9crj+sWSclrKxd67iSL8OWHEQB84GgeC7/9rECj
         IYfsEdQnmDAGP8Y/pLfYwYvEmCvdvM9uQP8xn55eH6QJvJhSR2tz8hPRRYDPQjGgRf4c
         Dpu5NPF2K5Uw3YnqYrkR+SQyOjWkXx4yUVCg5RpsDOsyVi3GuW5FHV8x5or/eeG1/9Pl
         DdKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736774069; x=1737378869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFH01bfsE3REKuhcMcn2EtahAaVgk7Obm1EnzRjK+hE=;
        b=XkuJC0LB/eqzU8cl4w2sSHiBL72JpEjT7wj63AwyXcQX9B5SG8xr/LVvYwZwsD5C0Z
         DkbPySt5FXsIHyyTdHgIBZxORBvTD+4F2MGnZQS9+VvSfLInEEwt3p3dq4wB6OVVHlxu
         qzvoqE2R2F7F6PJXIUpJAKf2fzpm0nJ60pX+REEf470q7dIRZKfQi6h4C9UxXIuNqsN9
         oK6BEhcUOeI7FDtw4iOj+pSBDPxJtCOPUIlFagTi53tOxbtbDhauqwujxqJ6GvTl4zm+
         LWDO+Tn2jYyUwXSUMJUJnM29Q/aqopvoPVwSRipsIlznz0tQFT8NA60mOoQLfQJHunDv
         cBFA==
X-Forwarded-Encrypted: i=1; AJvYcCVs2uliq7MrkahpgSx9akDcWssy569WcqRdFEFOsNWEOAZ6BN/pxYY5OrrA2uLZ2S631Ua8seDB55YABOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDmDB6F1JjaUd32J9NWJjI4gZhqt6Y02h632NsANBQjl2c3aOD
	SFdrLrVsoid8uLBB+tjpTauREB0VlQFgAoCPrRPUhO9/jJVBriI5AV3Zr490
X-Gm-Gg: ASbGncufW13m0Le19Ma/Mtox+tFoG774iG2cI2m1Er4jU4vQfQDoFamwLphWKoGvMGf
	+Njqbgg0zfwW9xyROX2glIITmTd6IeBMgom+e3VBV8QUu+4dehXMHEmZPHtwq41Bj/3r3XdW0zD
	cn+XhQamNT3k662H3lo1Vapa0QGk6iuorIeBcrn0o9pwrZijTktycin+aoWR4tpZ8XzdkUo1Nl7
	ITLtMtC8uEvCizHR68gJ46+6gYOlQvHzG7nOwFbaSFZSDdXvzsZ5NviN/2Axg==
X-Google-Smtp-Source: AGHT+IF4pi2dyKDAhIfB4pni06a1bcUMYyIlFxpKUUJDJrDHkodnTIKACqseKfRP18SLAqBfQb9efw==
X-Received: by 2002:a05:6a21:3286:b0:1e1:ce7d:c0cc with SMTP id adf61e73a8af0-1e88d39caaamr35137589637.38.1736774067207;
        Mon, 13 Jan 2025 05:14:27 -0800 (PST)
Received: from [10.113.16.67] ([117.193.77.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm6961209a12.20.2025.01.13.05.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 05:14:26 -0800 (PST)
From: Hridesh MG <hridesh699@gmail.com>
Date: Mon, 13 Jan 2025 18:44:10 +0530
Subject: [PATCH v4 2/5] platform/x86: acer-wmi: use new helper function for
 setting overclocks
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-platform_profile-v4-2-23be0dff19f1@gmail.com>
References: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
In-Reply-To: <20250113-platform_profile-v4-0-23be0dff19f1@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shuah Khan <skhan@linuxfoundation.org>, Hridesh MG <hridesh699@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736774055; l=2397;
 i=hridesh699@gmail.com; s=20241114; h=from:subject:message-id;
 bh=/2PZqZ2Q1Ex2bCSurEz+J06diXlNfkvXCvYLzS+lnBI=;
 b=vZZyGAKAd+jbsUttz/TQrBeGlIFTUuMcuyltbmPbtaPks+QvipRnG6uo5i+CY2bBPTTk5OXwx
 FWIMa5+d6LVACIS8F2r5tiUbHIROuLRkkBRCblgOdTFEZmsdiMMxw80
X-Developer-Key: i=hridesh699@gmail.com; a=ed25519;
 pk=otVQutD5ZTsEpajsGv/haM3pQj0yofkuYrdNcaX5AUE=

Migrate the OC handling in acer_toggle_turbo() to the new helper
function for issuing the SetGamingMiscSetting WMI call.

Reviewed-by: Kurt Borja <kuurtb@gmail.com>
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

