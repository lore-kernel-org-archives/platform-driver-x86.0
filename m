Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E3334A79B
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517840; cv=none; b=PrfHk6snKDvbaJ87KEvm35ge+TSyD95oWVVbRCOKsJ9X/+Tutl1HmXHpqITzUxHqAVz1Uuiwn0NZjO8ATmCJg4f8TcBV5wqseVRj1Qkn5MVL5fXlfuXNBi8iDh3wgU9o7rA3KQpvtDAUFjH1slZmedGpZKE1b1Zqz5BIwkatFok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517840; c=relaxed/simple;
	bh=PDjLoWb+Goab0JJY1HXslrPwRQiSHQMlYcfPKsVPVpI=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BKRkV6CsyTgWBJja0vDE+jKJ+vPwAOFOKSxzDjPqowPZyWLuG+UWgVuZVx2D/ntCU2vtYxv8faMMCSPR+T/9RqBpwc6srjG6CzmOMZgqDCKF9/STQoKs5xM5xLEd5nayFqLPTT0Pb9wTTN5WPS4gfbAB3YH38nSuQ1dbqPFmHGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6GhPQ0b; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6GhPQ0b"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-37a34702a20so35067941fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517836; x=1767122636; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FSV6UuqHlZBkFieIcW60346ekqC5sdDa/YRUCgK7hwE=;
        b=F6GhPQ0bwsSO04IDC5zf+acO9a355HSybS+M9bYm8/BdeD5qZUgtQkYEXTt5vmNelQ
         DeMg9k8K8y0SWShaB86FiDwaEg+askiVPKk+rX3WU1sw+ZC21VFqqP2w56rrc7rz4WGB
         eWsrD+WyQdTXcULFBGTc/FuIRZFd5Zf9jR6hf4YFmNkWPbXPNlSA/6yHA5FFT1Cq67VV
         O4iM8w5NF8KrjmgUdLAuBEdR0DBFR/yu3rcKB/Jo/NsVFaNGSaCLlncgvK/fVXmbMtSW
         5pR06FO3LgXxlOg5b10fW5wH0FdCHULyIZc2zsceFYmvdyVXOmyoBIaq4izkPv9vpvIG
         fhKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517836; x=1767122636;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FSV6UuqHlZBkFieIcW60346ekqC5sdDa/YRUCgK7hwE=;
        b=sH0NuyAmAnl3ikkxQtvW4dLjJReXqb253XOr8gpzDHQf1vVOUdF5Uj+siBUXBekyJi
         HO+miuxIF1OCy6DmdmeJ8+oKxJBIEYqtRo66dArga0SfaGuXj2VGKQlKTs/Z7FahF0YP
         Z21psIh40B0djAMQSqGVeRKkIN/uUiGNpTp0wfkyC3wWT62cgtIjJkd03yjfW/LkJwos
         +N3jJTw3tarxsloBLNlG6tGKPxg1oWVtrdb4jzaqixFcJ3wbq0nXY5uHpEje9MWnN0mg
         ecDTIHzblomwSoiPBeo/0beM5EemwypNdXIO+xU2ANsLXhbIwFUgQdUmJ86UYOnps8v3
         Vl9w==
X-Gm-Message-State: AOJu0Yx/VrTRoyY9d4tEBmSGIXyqKRdOQj5wov3bc7YWUV4U7AQbprup
	DZGdw5nUCiu3Hu1bZM5c17nS+Ku2RoKsauJl2OUmKC1qI8ESiTsBi2APU7NVTkwHPan8EF/+I0H
	dFIiT1lxfCDMbazDiqxkFSS1pJnTOnx5h5QXy
X-Gm-Gg: AY/fxX4icRKIJG1zGz2Z14B6SB/9NDUZr6esEzS3g/YW+XGidSdwBtHhiBmlpZzyNnu
	+N5oQWnqxrq2TGmJPJq2JDkfxBtNRxLyYxAp10IKAXOerSOByHHEKhTZKY/V0MysKMyG/zs47Qh
	MYWWM10bH8y0NC4T+XV/ln7un64V9drnaHQz0/6o9eKUfOcnOl043oRMFhX56RIceCePhIxR5Y9
	x0gAfUp/MFJoL5bNnwG9RorAswy8VtonhxBibdGKZhxfO5ODaHbHmxduOZNubF2hAJUOz4=
X-Google-Smtp-Source: AGHT+IEmMQLP457ERuHoxX54P29gSdhLxMjqrqBR+Kw9dX9ly86Yew/0qQa8PVli746IrLIDwhZPod32DHlVIH48ETA=
X-Received: by 2002:a05:651c:1581:b0:37b:97b8:3ca with SMTP id
 38308e7fff4ca-3812158e08amr46554441fa.10.1766517835816; Tue, 23 Dec 2025
 11:23:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:23:54 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:23:54 +0000
From: Benjamin Philip <benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
References: <CAMEXYWcY-7Kn8V1EwZ=fUPFWDwnAHEuferY9Ap0zO6xfmXx4JQ@mail.gmail.com>
 <20251223191932.946794-1-benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 23 Dec 2025 19:23:54 +0000
X-Gm-Features: AQt7F2qpjW8wgR3wuQ9o1DlpxHaN1Oan_G1aMXyTOy9yBS2sdbo4yhCD8R5ECbA
Message-ID: <CAMEXYWdFn05=kx-NYejm4nznbKQahHUJJDesc_W1OKk_X3OOgg@mail.gmail.com>
Subject: [PATCH 2/5] platform/x86: think-lmi: Remove unnecessary parens
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This commit removes any unnecessary parentheses as flagged by
checkpatch in the following check:

CHECK: Unnecessary parentheses around '...'

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index 540b472b1bf3..1fac8986d077 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -440,7 +440,7 @@ static ssize_t current_password_store(struct kobject *kobj,

 	pwdlen = strlen(buf);
 	/* pwdlen == 0 is allowed to clear the password */
-	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen)))
+	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen))
 		return -EINVAL;

 	strscpy(setting->password, buf, setting->maxlen);
@@ -476,7 +476,7 @@ static ssize_t new_password_store(struct kobject *kobj,

 	pwdlen = strlen(new_pwd);
 	/* pwdlen == 0 is allowed to clear the password */
-	if (pwdlen && ((pwdlen < setting->minlen) || (pwdlen > setting->maxlen))) {
+	if (pwdlen && (pwdlen < setting->minlen || pwdlen > setting->maxlen)) {
 		ret = -EINVAL;
 		goto out;
 	}
@@ -859,7 +859,7 @@ static ssize_t certificate_store(struct kobject *kobj,
 			signature = setting->signature;
 	} else { /* Cert install */
 		/* Check if SMC and SVC already installed */
-		if ((setting == tlmi_priv.pwd_system) &&
tlmi_priv.pwd_admin->cert_installed) {
+		if (setting == tlmi_priv.pwd_system && tlmi_priv.pwd_admin->cert_installed) {
 			/* This gets treated as a cert update */
 			install_mode = TLMI_CERT_UPDATE;
 			signature = tlmi_priv.pwd_admin->signature;
@@ -881,7 +881,7 @@ static ssize_t certificate_store(struct kobject *kobj,
 	} else {
 		/* This is a fresh install */
 		/* To set admin cert, a password must be enabled */
-		if ((setting == tlmi_priv.pwd_admin) &&
+		if (setting == tlmi_priv.pwd_admin &&
 		    (!setting->pwd_enabled || !setting->password[0])) {
 			kfree(new_cert);
 			return -EACCES;
@@ -965,13 +965,13 @@ static ssize_t save_signature_store(struct kobject *kobj,
 static struct kobj_attribute auth_save_signature = __ATTR_WO(save_signature);

 static umode_t auth_attr_is_visible(struct kobject *kobj,
-					     struct attribute *attr, int n)
+				    struct attribute *attr, int n)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

 	/* We only want to display level and index settings on HDD/NVMe */
 	if (attr == &auth_index.attr || attr == &auth_level.attr) {
-		if ((setting == tlmi_priv.pwd_hdd) || (setting == tlmi_priv.pwd_nvme))
+		if (setting == tlmi_priv.pwd_hdd || setting == tlmi_priv.pwd_nvme)
 			return attr->mode;
 		return 0;
 	}
@@ -985,8 +985,8 @@ static umode_t auth_attr_is_visible(struct kobject *kobj,
 		if (tlmi_priv.certificate_support) {
 			if (setting == tlmi_priv.pwd_admin)
 				return attr->mode;
-			if ((tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT) &&
-			    (setting == tlmi_priv.pwd_system))
+			if (tlmi_priv.pwdcfg.core.password_mode >= TLMI_PWDCFG_MODE_MULTICERT &&
+			    setting == tlmi_priv.pwd_system)
 				return attr->mode;
 		}
 		return 0;
@@ -1216,13 +1216,13 @@ static struct kobj_attribute attr_current_val
= __ATTR_RW_MODE(current_value, 06

 static struct kobj_attribute attr_type = __ATTR_RO(type);

-static umode_t attr_is_visible(struct kobject *kobj,
-					     struct attribute *attr, int n)
+static umode_t attr_is_visible(struct kobject *kobj, struct attribute *attr,
+			       int n)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);

 	/* We don't want to display possible_values attributes if not available */
-	if ((attr == &attr_possible_values.attr) && (!setting->possible_values))
+	if (attr == &attr_possible_values.attr && !setting->possible_values)
 		return 0;

 	return attr->mode;
-- 
2.52.0
