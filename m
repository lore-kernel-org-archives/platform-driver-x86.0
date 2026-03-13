Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1097382395
	for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 21:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773435631; cv=none; b=Vf+sLqvwYSsQhua2NcqjvqjKHr9Ba+ZD5TG+ABKJN774/7Bx7Jo1/YHIb8tVCXMyphRlIOmwrC8HV1BRyGcz5BnA8Wgp9D6qdYdC3l4YQEPSt2gdkLEnCCNI7Yr89/UBc1wltYtEBL+wdCumQvQ25KnnDxjfCl+38xttlnEoFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773435631; c=relaxed/simple;
	bh=J+RCJw/ZQMiuo8vlh1WqN+BCQhRNUrd/tDHuGg3jXuo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=slIV9kZT5XYXqarD1R0fJTONZ7KXJU+wWKplLjCCm0KrO/pjl8kljRdPieN+ELONTIICeRFSUWKW57k5Xu1qy3f4H9jObgaK3GgoY3aeGY3W7Pj1ESacWs/K7ehKbjAh1OcrPoSg5S+tn+F+lH9//ZUiX8cGbsMi52pmw4etUWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jguk.org; spf=pass smtp.mailfrom=jguk.org; dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b=jFAkGZhR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jguk.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jguk.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jguk.org header.i=@jguk.org header.b="jFAkGZhR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so30101525e9.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 13 Mar 2026 14:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jguk.org; s=google; t=1773435626; x=1774040426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP5XK+jjrsCG+0OqAJ4kfKNHKLu0MiVvnQktilKm/fg=;
        b=jFAkGZhRF5aN48Ha/jcHwYVpuUDa7spHVK4vvd5Z5uLnxWlNieBKeE+mTl3DieZ4sS
         NIfaoj9rf7CSSsvKffR2bSt3GFHd2oQUZHwbMIfjuAMeS+01jSPWheiYroxzEujd3cHU
         pHhk1JG2PAATrQryp1rRhDe2QLAM4DS9QQrMwPI5NTeTACEyv0t0qURJgi2mYGTAxK24
         B3N5FjYxJEdNza8tfK2pLLJwlJhYyT69lnSeNK/JjFNMOYNy+z81yx93gaNJXEjs/fYE
         iTgdcOygZZR8JwASrZXOMJEz/rKkawQq+km7kiMjHAOHwBJCB9umds/jhNROsVwwk9B7
         qt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773435626; x=1774040426;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lP5XK+jjrsCG+0OqAJ4kfKNHKLu0MiVvnQktilKm/fg=;
        b=ssYZ31MIeso1qi3xWqGAwybjAwvtqQx3PMb1J4/fDGyPF/GzSRMwmqQQRX+rnsF9TW
         b78mROu5WiVUJ+Gh3p1X2cB/oE9tNh2QlDh14zpOuY6v9Sq+nlnDkW3XrjBLsQ+HQ5n5
         ot79nYlDKW+fX/X2Dlt2LnBcqiBvkym2aCThvz4E5NzvE75bZ7jUNdNLqJkVD7JPTe9I
         2wNRqnEtnHNRI3G8CoH+JWPt7WErCEVZ3rsD6IyUe1JuTW7UGUK4H6bUVTaSGrh3hNz5
         nKGd7Q/TfoUj7BA1pQMQukgPe668GHStzzJnLL+khfdFn8fRkrxTH8vMnPwaYeaTenk2
         JgGw==
X-Gm-Message-State: AOJu0YwKWvokcB4Kvd9zl5xZijl6lbmqSszs1WM/5BVgcdyp2ebd9znN
	bG1srzmf0KKV6PtcY0Eow5mRGbTLGUHcu4920iiywOKIflP8jeuUI6hflAUb8Eb0M854SzdTv30
	tAB1l
X-Gm-Gg: ATEYQzyq5IR0Buf5j1B3QQO4A0MdsM1dL4/fQ2D5mMd8l/0GJEauiQqcTWJhJiUBhQj
	m1xmjR/wpB+CuAEi8xw2wGRQ8RH2v0QYWFmTVJ8/HTyvfL3Jwi2v4b/OOEIKZOWQoMkpPKPYIVT
	6khfHUfFyvk0buMtuKwr6K9ZVqBfdSOPOizjtTFhZP0pFUtiGTvBr0P21tRj2VHB9JoZR6RiIXe
	fVlxVC3jXvoYPauXAcDBLddVt+ZkcqYzzi6XcTVmIVxnNFXFDALd74M4ZKZ3FFHcsVhigYP/u3L
	aGouWQuzmOzUo+B3fWTL5aJERz6tnNG8dx8c5XHz+VlfYn+jIspvjRkfzIvafUT/ALi2nOZx7RB
	gE8kWzxULLCX7N8Ne9nd9DY3I2CSUp77PsAt4jvXTtoNuKaM2IoIWMTq1msH8/UnxKXolLZDDWb
	ou9Dy01nSlNVW7kYF5yjjWLNM6UbRTTH3DITAKg889PuVg6y777fJ0whL6HlUSkHkcHBs1NJGWn
	xD8Uw==
X-Received: by 2002:a05:600c:a45:b0:485:4006:960c with SMTP id 5b1f17b1804b1-48556702a7dmr80898065e9.16.1773435626303;
        Fri, 13 Mar 2026 14:00:26 -0700 (PDT)
Received: from [192.168.0.154] (slou-04-b2-v4wan-170873-cust220.vm28.cable.virginm.net. [86.15.56.221])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ac17f2sm298371555e9.6.2026.03.13.14.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 14:00:24 -0700 (PDT)
Message-ID: <56532bb3-c604-484e-9716-edda3758f627@jguk.org>
Date: Fri, 13 Mar 2026 21:00:23 +0000
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jonathan Grant <jg@jguk.org>
Subject: [PATCH]: asus_wmi: Unknown key code 0x6d
To: platform-driver-x86@vger.kernel.org, luke@ljones.dev
Cc: hdegoede@redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Dear Luke D. Jones 

I made the below patch after seeing the following:

asus_wmi: Unknown key code 0x6d

It is just before my laptop overheats and powers off. (eg if I do make -j8)

May I ask if it could be reviewed?

Kind regards
Jonathan


diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7c0915e097ba..06438b4e7a17 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -70,6 +70,7 @@ module_param(fnlock_default, bool, 0444);
 #define NOTIFY_KBD_TTP			0xae
 #define NOTIFY_LID_FLIP			0xfa
 #define NOTIFY_LID_FLIP_ROG		0xbd
+#define NOTIFY_POWER_OFF		0x6d
 
 #define ASUS_WMI_FNLOCK_BIOS_DISABLED	BIT(0)
 
@@ -4596,6 +4597,11 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
 	if (is_display_toggle(code) && asus->driver->quirks->no_display_toggle)
 		return;
 
+	if (code == NOTIFY_POWER_OFF) {
+		pr_info("Power off\n");
+		return;
+	}
+
 	if (!sparse_keymap_report_event(asus->inputdev, code,
 					key_value, autorelease))
 		pr_info("Unknown key code 0x%x\n", code);
