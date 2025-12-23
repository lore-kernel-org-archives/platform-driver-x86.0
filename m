Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7AC034B414
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517859; cv=none; b=hqEWsAYD5bUtL9tgp9bBNmGgJ9BvNKcvvL4LhwiUFAYKMlSLqYSbi62jgb4lj+L50r8G2J+bJ3gOuJjODEGf4wI5nkFlCO5++7GT1w+S884D2Laq6UcsaaezbKt+uoa/MypD3b5IAn9aRKIyoJTofZ4jF4eU4PZ5rt/Juqtiztc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517859; c=relaxed/simple;
	bh=ySYADvvc8y2/n2L7x+HusCwWvM0hvQ8qNqof/iJYVWk=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FgFhurGmrbtUUx/ow/nFSQgt6By1a/Divk/R6rPDjy+GBtoFbCfrxDSzkedHjPmLjSQ7Lz8QpwSoh3kHQrZsLt7fWz+6YVupsYjfc1pYWUet6sClHWR+uevxNnwdVF2Wei6m6gRnaLKY4J0bLy+j8y1MflCTrdm8RblPlInNaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C9wbkCJs; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C9wbkCJs"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38105ad3720so44509751fa.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517855; x=1767122655; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3KTOeOgbJaX0y3CDqxp4/2HWbdCBK3qHQJYC6bNE1E=;
        b=C9wbkCJs/gRfK8FmKH+ql2G2NSuyEMFIux+U8h0gL4mYXCd1VaBFP3HFLKwMfQYyR4
         Al8nIVfeesKeDmFFlXPU9vvrdVYdlTmA6TZ/zQmbtzElKLCXRvNV4uklfBzTXFwS2mdb
         dWBOgpaEmerME3MzijieEVnZZ0DQ36SNlu+z/hl3wCW8cCCAHqsULaeZxqHb9xMeJCMZ
         NPXPHyeNUAEsUKRY7HYyDROkhVo7mZ12JxXeqwI/oBhH0LLBzGY6U7MnPi3Ks9yhBKvg
         4ILTwWa8wvTMZrhAukzbxg8ytehb05gZCtGYIK7gw9+MdTQQlmnrKJwN7C8371tOSAkJ
         m6iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517855; x=1767122655;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3KTOeOgbJaX0y3CDqxp4/2HWbdCBK3qHQJYC6bNE1E=;
        b=eqC3UwiKbo/5zIo6f5tp02DCIkQ4l1oHz25suZ/Y8YarUj/LAB5aKq4EMk9LMtCn0i
         d3ilSwfYu7U57+b6hIDtoN5o1Te0vroMGBUIiA0JU9QEntjx+TzY/KpyXr2tQ435dy/x
         Hcf7hxz/WTp8x0dmoIHeBRiqtYaJOUNPKCz/oBagImWTOFbeCEhvtZu3U2XSX3x2/Qc5
         NRnBdAFDihGUJXUA9o+dv+MNwg9mTis3i5wsLZlxAIIxuN9YQabSK4qjMLpLJOX3TH7I
         gxbGNlTncuvo7SiTZagFeU0dHzOzSensKgdSe4m8i5OjvwTmocEbUlmjDMtMCTgAxaNN
         d/HQ==
X-Gm-Message-State: AOJu0YxIMMckW8Zd17ylAMyEY9iVKevkl6dycAxvI63wqgSW3j4uVvTY
	AgmXflB2Qa2su/+D9bfhqRiKSzDNxxZhGnYswK0WLxft8G5pRL0ru9u9FpMOHmDxOAuP7DqvEjX
	TqUugYlehQGKrw0e8duwpZS84ELgKHze9oWyK
X-Gm-Gg: AY/fxX6mI55oVfHBOYwyqtBsJNTkXD05zsgPYayTaIX6MXmfL5uphNLA0OQLDrYPT/Y
	y3UBM5ZBmGI1fS5YCL64bfvkqOmyKt/ohrAAKBf9pnTpI7KZyEciNGfoNH60/+F+dtRXao7uhcE
	VEb5vpr+7HInhJlKMQ8kA7plH9IFOHniuU6zZlmc+e9LaQgcIyL8lf3pQGo+XDPoHXfeILwV4qm
	NojLD/5HskdJYho3TDfZTjVc2QL60wAAqCtDOTyLpFP5RIW8vXSSOwdb2NFnCWLUNNhfYw=
X-Google-Smtp-Source: AGHT+IGhGCM/EJJBNbkrqk1aVDxnaDT7lHNAVQIkNGmCrWU4+4uGFHCZQUY6buIbRvzaGlQJ1JYl3yNmtUcQ95Ro6pE=
X-Received: by 2002:a2e:a7c1:0:b0:382:4f4b:a9aa with SMTP id
 38308e7fff4ca-3824f4babc9mr5081291fa.34.1766517855315; Tue, 23 Dec 2025
 11:24:15 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:24:14 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:24:14 +0000
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
Date: Tue, 23 Dec 2025 19:24:14 +0000
X-Gm-Features: AQt7F2px6JFqBlrrhNdWQbnWzXmfaAK4a2iVZExig6yFAZHtoi3jt4IAOjqDrIs
Message-ID: <CAMEXYWf_m8PL-ZGAv_1ufLp_1ryQK15ziaO90_OxmMV4VkpTPQ@mail.gmail.com>
Subject: [PATCH 4/5] platform/x86: think-lmi: fix column limit overflow
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This commit handles some column limit overflows (that occur after fixing
their alignment), i.e. the following check:

CHECK: line length of ... exceeds 100 columns

by defining a constant opt, and replacing the offending
expression with opt.

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 31 +++++++++++++++----------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index 1ada4d800383..07ba0d84720a 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -1083,12 +1083,13 @@ static ssize_t type_show(struct kobject *kobj,
struct kobj_attribute *attr,
 }

 static ssize_t current_value_store(struct kobject *kobj,
-		struct kobj_attribute *attr,
-		const char *buf, size_t count)
+				   struct kobj_attribute *attr, const char *buf,
+				   size_t count)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);
 	char *set_str = NULL, *new_setting = NULL;
 	char *auth_str = NULL;
+	const char *opt;
 	int ret;

 	if (!tlmi_priv.can_set_bios_settings)
@@ -1163,10 +1164,11 @@ static ssize_t current_value_store(struct kobject *kobj,
 			ret = tlmi_save_bios_settings("");
 	} else { /* old non-opcode based authentication method (deprecated) */
 		if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
+			opt = encoding_options[tlmi_priv.pwd_admin->encoding];
 			auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
-					tlmi_priv.pwd_admin->password,
-					encoding_options[tlmi_priv.pwd_admin->encoding],
-					tlmi_priv.pwd_admin->kbdlang);
+					     tlmi_priv.pwd_admin->password,
+					     opt,
+					     tlmi_priv.pwd_admin->kbdlang);
 			if (!auth_str) {
 				ret = -ENOMEM;
 				goto out;
@@ -1299,6 +1301,7 @@ static ssize_t save_settings_store(struct
kobject *kobj, struct kobj_attribute *
 				   const char *buf, size_t count)
 {
 	char *auth_str = NULL;
+	const char *opt;
 	int ret = 0;
 	int cmd;

@@ -1347,9 +1350,10 @@ static ssize_t save_settings_store(struct
kobject *kobj, struct kobj_attribute *
 			ret = tlmi_save_bios_settings("");
 		} else { /* old non-opcode based authentication method (deprecated) */
 			if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
+				opt = encoding_options[tlmi_priv.pwd_admin->encoding];
 				auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
 						     tlmi_priv.pwd_admin->password,
-						     encoding_options[tlmi_priv.pwd_admin->encoding],
+						     opt,
 						     tlmi_priv.pwd_admin->kbdlang);
 				if (!auth_str) {
 					ret = -ENOMEM;
@@ -1381,11 +1385,13 @@ static ssize_t save_settings_store(struct
kobject *kobj, struct kobj_attribute *
 static struct kobj_attribute save_settings = __ATTR_RW(save_settings);

 /* ---- Debug interface---------------------------------------------------------
*/
-static ssize_t debug_cmd_store(struct kobject *kobj, struct
kobj_attribute *attr,
-				const char *buf, size_t count)
+static ssize_t debug_cmd_store(struct kobject *kobj,
+			       struct kobj_attribute *attr, const char *buf,
+			       size_t count)
 {
 	char *set_str = NULL, *new_setting = NULL;
 	char *auth_str = NULL;
+	const char *opt;
 	int ret;

 	if (!tlmi_priv.can_debug_cmd)
@@ -1397,10 +1403,11 @@ static ssize_t debug_cmd_store(struct kobject
*kobj, struct kobj_attribute *attr
 		return -ENOMEM;

 	if (tlmi_priv.pwd_admin->pwd_enabled && tlmi_priv.pwd_admin->password[0]) {
+		opt = encoding_options[tlmi_priv.pwd_admin->encoding];
 		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s;",
-				tlmi_priv.pwd_admin->password,
-				encoding_options[tlmi_priv.pwd_admin->encoding],
-				tlmi_priv.pwd_admin->kbdlang);
+				     tlmi_priv.pwd_admin->password,
+				     opt,
+				     tlmi_priv.pwd_admin->kbdlang);
 		if (!auth_str) {
 			ret = -ENOMEM;
 			goto out;
@@ -1775,7 +1782,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
 						ffs(tlmi_priv.pwdcfg.ext.hdd_user_password) - 1;
 			}
 			if (tlmi_priv.pwdcfg.ext.nvme_user_password ||
-					tlmi_priv.pwdcfg.ext.nvme_master_password) {
+			    tlmi_priv.pwdcfg.ext.nvme_master_password) {
 				tlmi_priv.pwd_nvme->pwd_enabled = true;
 				if (tlmi_priv.pwdcfg.ext.nvme_master_password)
 					tlmi_priv.pwd_nvme->index =
-- 
2.52.0
