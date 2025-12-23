Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D8279DCC
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517856; cv=none; b=VRqIdoxmJsXuIfIBLA3KXHRWGSlXAPTUf1a7DXmOgescgr4iEGnnUXpU0+6D9y2adr3ta677lijRor51jstHWCQBrWT5mp8/FXSkmBuD5yp6awLImq3/LZgJG39zx3UQqCCpfopuHRCo8B0SEX3sxdBbO/UhZepuqxeNGhLKREw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517856; c=relaxed/simple;
	bh=ytxYq5dumOjUM+zW47/QayeuiSLcWk0I4K5pUD//gP0=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WGV3miJSMLeywHuRw4T4uXNANb/lo4ftXwAtBduYE7/eSYyHgdtitudE0vVnZjFqxDgXLweWbWBZtBKjg0H9b7gEG2d3C3Ojn09RfBIhMnTB2hirWcjfmvIXM+xgOJoSf2BjPY+qca1N6/gjUao4jRRG/bCWFsamf7k5N81pK5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bo+Bq6cF; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bo+Bq6cF"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-37b96cbd875so44828411fa.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517850; x=1767122650; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2wz1QtkrmyGbQChH9BPNFA2K4rppg6qm6bIfWePGFI=;
        b=Bo+Bq6cFwnDbCofk/fH3Fk0llWariS2BeqZHdGcyO61mrJQ+1zoTu+bveK9nz+ITWp
         B7Ozl0/Tr3DdBuCLaxMSd7zuVDSKsWSFYpo2+7ej2Wm7VJV43Ycf1KYl2J/CeVnmnQJ5
         NhM6yn4jzsvEl/K2hqnx96TFCoLyZWViM+ljV6Luc1bg9UREXVsyg5PTGevv7tsfkLQm
         NenK3Uflf+Y9nJuvNz04TB4VlNlhY9MK4jSVpmPnw8ihmCw5NVALRXkdKC+C65tQmfb7
         DM60a3fKnRRdiet4fmBpsn6nYy0GSn6y3yb/bsV4tfkmDWf9BGU4ei5eOMI/EJaGOL8W
         tyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517850; x=1767122650;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2wz1QtkrmyGbQChH9BPNFA2K4rppg6qm6bIfWePGFI=;
        b=Lw9vH8dYk8fAO7qTvxs+MMSPuHpEzYhO9lD3uikWVIGfUovJr8XCEKVPX3Iwvci2f+
         ZVBeaR2x0Wlhx7SYZg4ORC2Zqer3b15n2lf07Ia463vi+6suc2QsmjQg8l5N24LBhRez
         xsy6xL9KMgTb15pgFpidgixcbTSg6pkuX4HW22GTdRJbUOJ4DXlz2WxAKr9NerepSE2u
         TjOLfIpWtjIBRZm805rj+5m7j/cYmPpPDDpJw8Pdk6ehElzvlYgA81zllSvTJhll5fdC
         jIz3rkAZNuSeSmi5tUi3tNh/QlB4Ss2Mh+t+j3PIiElP20bGzmUezs7htbT7agkCfEOd
         QQVQ==
X-Gm-Message-State: AOJu0YytTxnC237TLdplF9GAIjVvqM0OqUDOaAVk8b2SpS5yNueaMDnW
	0Cj3eiBPUcReHBOO2GfjQDt0zjc7GCKfrO79FiVUZxKCGvid5pcUEDA2NSZxJFVvD4CHh437MP5
	MN42FIaNjHZY6WdDQ0AvPYrS+qMXvXFF1sLHS
X-Gm-Gg: AY/fxX7IRer21uOv5pTKROlG8cppY039OjJaMu5pb7weL+1dGKClky59tQTXSr04Ge0
	Hra7pwpcsrvRD5e/oP+g8LoFGPQIPdckpfh8m0xNW/mkNymatvmJ4rfkpgT1uNSmlyesluwBoXL
	tFeMpLk/K/ugk9BbE4A8+TV2NWjk1tFFsCc0FayTnvzgf7+6cjbuO4SljzhoWxaC8DnVph7iCTm
	OsGcBz+TbbPizPUqtHAfQlMv7wEtbkuAZNeumEXnJCKrUM01m4ZXwN3KstBQwJ9ROe4iH+24RHI
	AX+FVA==
X-Google-Smtp-Source: AGHT+IEEGYGEeljB1FPaBLu3wRjlyXq/Y7VzSElMupYoOp8z8/S9m1pS1SJoewIIzXL8xmdMCFqLXk6xb5T2Si7cLt8=
X-Received: by 2002:a05:651c:b12:b0:37f:825c:dcc4 with SMTP id
 38308e7fff4ca-38121687cebmr45110391fa.35.1766517850057; Tue, 23 Dec 2025
 11:24:10 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 11:24:09 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 11:24:09 -0800
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
Date: Tue, 23 Dec 2025 11:24:09 -0800
X-Gm-Features: AQt7F2pi2TrRdIWsoWP-UTz2ZHLDj1b6QeZ1IJWWrXkB8qv-EX1kkbtANMpo3hc
Message-ID: <CAMEXYWcuZXx285npcPB3q0Umit2bAwmFzo1sBPLYnyhoUT0EnQ@mail.gmail.com>
Subject: [PATCH 3/5] platform/x86: think-lmi: Clean up misc checks
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This commit cleans up the following checks:

- CHECK: braces {} should be used on all arms of this statement
- CHECK: Please use a blank line after function/struct/union/enum
  declarations
- CHECK: Prefer kzalloc(sizeof(*new_pwd)...) over
  kzalloc(sizeof(struct tlmi_pwd_setting)...)
- CHECK: spaces preferred around that '/' (ctx:VxV)
- CHECK: Unbalanced braces around else statement

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 32 +++++++++++++------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index 1fac8986d077..1ada4d800383 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -223,14 +223,16 @@ static const struct tlmi_err_codes tlmi_errs[] = {
 	{"Set Certificate operation failed with status:Certificate too
large.", -EFBIG},
 };

-static const char * const encoding_options[] = {
+static const char *const encoding_options[] = {
 	[TLMI_ENCODING_ASCII] = "ascii",
 	[TLMI_ENCODING_SCANCODE] = "scancode",
 };
-static const char * const level_options[] = {
+
+static const char *const level_options[] = {
 	[TLMI_LEVEL_USER] = "user",
 	[TLMI_LEVEL_MASTER] = "master",
 };
+
 static struct think_lmi tlmi_priv;
 static DEFINE_MUTEX(tlmi_mutex);

@@ -249,7 +251,7 @@ static int tlmi_errstr_to_err(const char *errstr)
 {
 	int i;

-	for (i = 0; i < sizeof(tlmi_errs)/sizeof(struct tlmi_err_codes); i++) {
+	for (i = 0; i < sizeof(tlmi_errs) / sizeof(struct tlmi_err_codes); i++) {
 		if (!strcmp(tlmi_errs[i].err_str, errstr))
 			return tlmi_errs[i].err_code;
 	}
@@ -570,19 +572,19 @@ static ssize_t mechanism_show(struct kobject
*kobj, struct kobj_attribute *attr,
 		return sysfs_emit(buf, "certificate\n");
 	return sysfs_emit(buf, "password\n");
 }
+
 static struct kobj_attribute auth_mechanism = __ATTR_RO(mechanism);

 static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
-			 char *buf)
+			     char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

 	return sysfs_emit(buf, "%s\n", encoding_options[setting->encoding]);
 }

-static ssize_t encoding_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+static ssize_t encoding_store(struct kobject *kobj, struct
kobj_attribute *attr,
+			      const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	int i;
@@ -632,19 +634,19 @@ static ssize_t role_show(struct kobject *kobj,
struct kobj_attribute *attr,

 	return sysfs_emit(buf, "%s\n", setting->role);
 }
+
 static struct kobj_attribute auth_role = __ATTR_RO(role);

 static ssize_t index_show(struct kobject *kobj, struct kobj_attribute *attr,
-			 char *buf)
+			  char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

 	return sysfs_emit(buf, "%d\n", setting->index);
 }

-static ssize_t index_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+static ssize_t index_store(struct kobject *kobj, struct kobj_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	int err, val;
@@ -1047,9 +1049,9 @@ static ssize_t current_value_show(struct kobject
*kobj, struct kobj_attribute *a

 	/* validate and split from `item,value` -> `value` */
 	value = strpbrk(item, ",");
-	if (!value || value == item || !strlen(value + 1))
+	if (!value || value == item || !strlen(value + 1)) {
 		ret = -EINVAL;
-	else {
+	} else {
 		/* On Workstations remove the Options part after the value */
 		strreplace(value, ';', '\0');
 		ret = sysfs_emit(buf, "%s\n", value + 1);
@@ -1585,11 +1587,11 @@ static int tlmi_sysfs_init(void)

 /* ---- Base Driver -------------------------------------------------------- */
 static struct tlmi_pwd_setting *tlmi_create_auth(const char *pwd_type,
-			    const char *pwd_role)
+						 const char *pwd_role)
 {
 	struct tlmi_pwd_setting *new_pwd;

-	new_pwd = kzalloc(sizeof(struct tlmi_pwd_setting), GFP_KERNEL);
+	new_pwd = kzalloc(sizeof(*new_pwd), GFP_KERNEL);
 	if (!new_pwd)
 		return NULL;

-- 
2.52.0
