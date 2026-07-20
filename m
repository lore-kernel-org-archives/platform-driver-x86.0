Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A03CAA5F
	for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 20:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580288; cv=pass; b=fpT/S3g0xTt80gtg5N8IdK/F8GZN4ZbCSb4S32W5MPgav/RaWQPgI7LXZpQg4/0eYc3tZNBuDVBcGpv34F0SEJcv/6CaW1fy0k0Xh9vfh+ow4kocGJTvt7rD2YvE+FFNsxZTvC+YGhXPkBiP/oW2u1uDjyTiFlpG6E8531Jh39s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580288; c=relaxed/simple;
	bh=f96MBVVHBQ7qTKt/Gh7FAOaUVu3gdzRcdBjBu5Z8cYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E6bO+d2dlV5NjIWAKUrxfS/jia2Svwz50JC1sFCwF+3VWylbopeMVvR9a6gbrxQGtaekRC6HzEZqNprD0qlGylWmo7L7+kcEy+AvSZco+ewbPJQKODJN73NbVgQMyjgAObjbd5rTQ0HiE+D3OZdxlP2WFHKR0jfV0tECT12ykGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rJwXiKtj; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rJwXiKtj"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so4117546b3a.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jul 2026 13:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784580287; cv=none;
        d=google.com; s=arc-20260327;
        b=ceAJQtM2g9OI/Vp947zDFTjUfK/POu0i32loajTcgoL0dzhCjmVNx2eM8ir8XcskGe
         TNshOqyBpTKbqwVU0iKsSRPuU8q7bvQAglLMxQ2Yrj7P4hDtxtSijkOfEeRj1xftT/oL
         Vt3xk4C/l1WlDWKjbwR2nYnH97/64TAfx/4oveyzQpFZpAyawiiib/xGmu9AYFZWoL87
         J++jwba4YBYnAbEoVQlddXBNYG8uYghzYWYtjVIbnO5oHe9NT4wcpDtbR4TA1jZFjWiB
         PGVn9E4RS0wykKG6YCabrw3Zs5x1s2DWYqyd28LjZjqL994swA58OBuSRHiQwliAt45l
         IVMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f96MBVVHBQ7qTKt/Gh7FAOaUVu3gdzRcdBjBu5Z8cYY=;
        fh=Uhs313XOzA1qsyQ+Kp5PggvIULSXh/TBYqsn3jGlOuM=;
        b=U8OeBPB2rx+fX5XF6+bc4RkWhZw/MpscS7VnGC4eEtNeHcReXNpoGObbxwWuvzhzDj
         Dl5tEBcsL9hzcKNVz/csGs+H9Y4MXuFfbR+7n/0352Y6rnGrOKWW5Mvxii3wOBskfXrX
         4HSK/AZh7AhdZ/cAspVdc4d+fEVDcWLwhpeCHsmvSumFAoPxXA7ZOp2xZV7FQhRQxgSh
         b9DPb/xyBpTOQf5G2nq7mWzqPjnjrLdF2J3l8BXEXOq3vfq2oRBFyY9YOPPRkb1ImO6L
         XU9zCXJp8ECY4RPT5dFX63sN8B4fXfUYgM0shpMNLvIhuXKVKvXBvXYdgP/MsEI/9Cdg
         cOzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784580287; x=1785185087; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f96MBVVHBQ7qTKt/Gh7FAOaUVu3gdzRcdBjBu5Z8cYY=;
        b=rJwXiKtjwFJqvdu61eMDctPFyN8DSS5zFabADO3SEvCAyVVMuXGvw7kMO9/cG0Unl/
         LhN6R63Iu2q6edaF+nadeHVVqP68G0RI1PFYTxTYL7IaovvyioMjKjb6BQLC5XjC7Zwm
         ka8gAn2yYSzVefqHf5MBjthrpFR6/87DoxLcg8YOM2bFEnnIuxuxct29chWXPWf+yZIY
         lXueAV7f0LSuHha23egg+NlQQGRZQqEgV1d7zPwIlJK8k0aaDrzuCGXZld+npNq606fH
         MGSJYIEM3a6AeNeN/vUyTh7Ovw/qr+JeHQ2Hp8kRkkYRXvaQly/+/jR5zr4VORk3n1gb
         g6iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580287; x=1785185087;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f96MBVVHBQ7qTKt/Gh7FAOaUVu3gdzRcdBjBu5Z8cYY=;
        b=B2yOt4hGXTbzkB7+SY9RJ/0lo/GtmPw9YOK2IamvZc/etk7d0VfJM/uRQSBsieKtBQ
         VShVd6fxI0kHitukcqWeJj2cc/LTpfQM7ju27DVhk6rSyH2hGqvmxmf3iuwcuRRgtfkr
         z2YTgPJGUMRd/Vfsv7Sg18YTl5K7boyrOdiiAf4sZKI33qVcz3cD/cpZZQW7Goe/5Tyg
         +6kO2JyQeaHdjWJ6SZI3InqDo2VaIX/bV7/NHno2a8PlX2nQ9OqkfCJMvAvVov+RmXP5
         7HEmPVQavaccjS+WhaykIt0XiYo5Av71p7Rey6lTBK5/2Iafk7lqX2lx8Ryj1KYxnI1d
         pHzg==
X-Gm-Message-State: AOJu0YyFnh7/6VrXHv0zOeeciALk7r39tpstgJf0c8YYRY9xsKgOtgnT
	tJeBGrIzAs7GKLzAQN5yBVUI5eIO+0bVfPypqeMBU2ahL49TmWNrOhhyhZeCs39ocdyARux8BWW
	QQvD/01x4Lmkmdp/Q9riyUiSfYtcIRxkfzOnW
X-Gm-Gg: AfdE7ckHYA4M/ZDrRt0U8uGn1ZL8/Lp65gPOoMoHCJ+2BIo9XpBJqM5P0pIerTimLur
	NCToPCaQJvysro+Lb3tus06wDnSVArsw2XzCX+BJL2DJsA3OIJ94+wBm/WUGZL6FT12t3buGAWx
	a7gb5wH5pwrolybxtPqaX/KVfp3hazVS+EyVcm4Yp6MnmPrWQntqtPLOMdueVWUYlhMPIm2VUAm
	/2d6xVpVTP3Gs9wB7nS2oqvNYVdeB4R1If6vjJmNyCHkopZnNL/2weVG+96xtOj/X8SsZAWmvG3
	P9ElaMrBYin+IBEUY3g=
X-Received: by 2002:a05:6a00:1a8b:b0:847:888f:9b0f with SMTP id
 d2e1a72fcca58-84c285a4109mr14301405b3a.15.1784580286566; Mon, 20 Jul 2026
 13:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPr_SFPsWx2Fv-jewUO+NoYqPfJwSrmniTkR5J=9DCNWnUwkEw@mail.gmail.com>
In-Reply-To: <CAPr_SFPsWx2Fv-jewUO+NoYqPfJwSrmniTkR5J=9DCNWnUwkEw@mail.gmail.com>
From: =?UTF-8?B?0JDQvdC00YDQtdC5INCi0LjRiNC40L0=?= <nightfilebox@gmail.com>
Date: Mon, 20 Jul 2026 23:44:34 +0300
X-Gm-Features: AUfX_mw5ec_VUab8RyfCRr0uA6p78cOz5NQnTZADeV4vYuxgk8p1eTUsd9f97r8
Message-ID: <CAPr_SFODyj5O_5suq2m+vvWswe+-QqBSWYHGVSjFE4HJYo+V1Q@mail.gmail.com>
Subject: Re: ideapad-laptop: duplicate KEY_MICMUTE events (ACPI VPC bit 8 +
 WMI 0x3e) on ThinkBook 16 G7 ARP
To: platform-driver-x86@vger.kernel.org
Cc: kepanhc@gmail.com, hansg@kernel.org, ilpo.jarvinen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

Hi,

On a Lenovo ThinkBook 16 G7 ARP (Ryzen AI, CachyOS/Arch, kernel
7.1.3-2-cachyos), pressing the physical mic-mute key (Fn+F4) toggles
the microphone mute twice, effectively cancelling itself (two
notifications appear in the desktop: "microphone muted" immediately
followed by "microphone unmuted").

Looking at drivers/platform/x86/lenovo/ideapad-laptop.c, I believe
this is because the same physical keypress is reported through two
independent, non-deduplicated paths that both map to KEY_MICMUTE:

1. Legacy ACPI VPC notify, bit 8:
case 8: ... ideapad_input_report(priv, bit);
-> keymap: { KE_KEY, 8, { KEY_MICMUTE } }

2. WMI event 0x3e:
{ KE_KEY, 0x3e | IDEAPAD_WMI_KEY, { KEY_MICMUTE } },
(comment: "Specific to some newer models")

`ideapad_acpi_notify()` and `ideapad_wmi_notify()` are called
independently with no shared debounce/dedup state, so on this model
the firmware appears to fire both notifications for a single physical
press.

evtest output on "Ideapad extra buttons" confirms two distinct
scancodes arriving ~1-2ms apart for one physical press:
Event: ..., type 4 (EV_MSC), code 4 (MSC_SCAN), value 08
Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 1
Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 0
Event: ..., type 4 (EV_MSC), code 4 (MSC_SCAN), value 13e <- 0x100(WMI) | 0x3e
Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 1
Event: ..., type 1 (EV_KEY), code 248 (KEY_MICMUTE), value 0

Separately, the AT Translated Set 2 keyboard on this laptop also
appears to have a related firmware issue: KEY_VOLUMEUP/KEY_VOLUMEDOWN
release events are sometimes delayed by several seconds, causing
volume to run away to 0%/100% via autorepeat before release finally
arrives (this part I've worked around locally via the existing atkbd
force_release sysfs mechanism with scancodes 174,176 - not a
kernel-side issue, just documenting for context in case it's related
to the same buggy EC).

System info:
dmidecode -s system-version: ThinkBook 16 G7 ARP
dmidecode -s baseboard-product-name: LNVNB161216
BIOS version: P6CN34WW
kernel: 7.1.3-2-cachyos

Would something like a jiffies-based debounce between the two report
paths (similar to the approach used in hid-plantronics.c for a
comparable "duplicate volume key press" issue) be an acceptable fix,
or is there a preferred way to detect/disable one of the two reporting
channels for affected models?
Happy to test patches or provide more logs (full evtest dump, acpi
dump, etc.) if useful.

Thanks, Andrey Tishin.
