Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A054334B1AC
	for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766517868; cv=none; b=qs5eSoBN1IO6AHDv1/4zbdrGEePtrhlVfANw+EJl74Om+dpvvbq0ZqpSRraQfQaMR0IU3igNad4A1RsSIS5cojCffiQVeEZVCEcoB0misDxUDg/gWA6OHwcqntMV6osXxmEhNWUP4Ev4PtyNgrViwVBTvISBvDH0KUkfh6o8JqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766517868; c=relaxed/simple;
	bh=rjyEWf85YzHLrtYPAFhy72tVlNMvhiXFu+YvwjxGXbw=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qfteJuTCVd4M0UxVMtr38+3nKbx6rw3zVQJkkDdtz0Zte3x+t2OSYBEn7kAkQ/MNyNF52KvSLf5NcaXDuQGtecazbrnTEqPNMokWsTNPZoGQ7jnq1IQD6pP9ETNptHq3fs6D7H/tJ/fhemFpcbxVSkSw2/vJshnMb7R4NDPV4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VaS70/OO; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VaS70/OO"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37b97e59520so44675541fa.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Dec 2025 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766517865; x=1767122665; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=l56PyPTvBksExPgkW9juhbN4bXzt4MS2OYE//VwO+OY=;
        b=VaS70/OOmzstc+PDnSHheuAUhCGZKq4gtrk7mdvh/dUCQBU4MNXqhJ+YQ401vArjw9
         3B/DN0ZoVYHkb7n0vFEdJ4Njr73pr1XoI4jrILt4GeYZaUTwJedbK/laf5WbpXQDFlY7
         ji7HRPr/wuZCy9OcfMgnbONrBBNbXzBTP13GWNGR+6nkFp6roaT5nNkA3EZu7XVR1OGY
         jSsoMfpD1zCDuQ0AtGV809AopnB5e767xEZs/8Vs3i8dcPPn/rnPOOKBUAujuQVtkV8I
         rmkocWnJ0pIC4dFytx5ZL050YrmSYwkhJdQpYHYQuKRvgXrDviqP1hFJQIE4E27N7uGh
         FYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766517865; x=1767122665;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l56PyPTvBksExPgkW9juhbN4bXzt4MS2OYE//VwO+OY=;
        b=p+2ymRSuNc4y55bRUyDZ8A3uGn+vwZlwLuoZC4kHe6PRwQpRokca7qghbM+/lSFqWg
         VVUL/qWFvo9Xx/vr2p8pXbXbdheDiD0AXkBCtVOkEmv3ogCTcM56DzrUmVWMVJzqrhSy
         WSJIXygwP0cUKP6UjfOlT47d477t4StfvoLc5lpB8u1NlF0onSJglMX+oxaGTxpbnzKx
         BCVzGIxXSC8I3Iw67swpWRXn4HnLLmo6JEc/R2ZBXwVIRkXsRjWspqS7aUFoleVz8dWn
         XQYu58ZpZcHGNReePOGjeZpvtSWrRvlW8UemKLVY0xvutW6PU9hKlR9rGnB9oHOFPWKG
         KyJA==
X-Gm-Message-State: AOJu0Yy4dY72kM1nFp606kfQ9U9oLxuDJJHSGBJIpVYGy4cq894KIzDP
	jKjCP3SNZChKnVAe9FI6QM+FuPzgJ1ADtuMfCbXvWpYkxhd6awS4ScQjfZ8Dz/tZ9G0mG3LdDnt
	XxQ8oeaQAyztxFtvYHhZ0BahBzINC1s/Tthz8
X-Gm-Gg: AY/fxX7cKS7CkkZxpELR8ArHuqSpK8oadOEPJXuCsf4Is5NmKmUcBi9wgMKk8tjafxi
	gnoZTRvZcCKmueiCrb99MEPKinEpTIkzi7xK1BVCsI9dFYFvDcrfHqM1vO4MrPTXxU70BhypCE3
	3zlQGbOl7xKnYjeoe0r0ArKY08B28Jr+3vc8+AID12woQi3Llfl7mvciVx8URvhNL7rLJbViI6V
	qYOU+Yr62L8hQIf/n6TqpZmD4aI44I+3tkheIRhpz9OzO+G8CB9KS14K2piTg7wao1AdDw=
X-Google-Smtp-Source: AGHT+IH/6vwWnlwA+2ntbE4BBo5XBjXA037mg+f20SX6cMQDjTN3ZXQ4fmykN3IACIIMo1og8rJowUn2qiDqMDD0GQo=
X-Received: by 2002:a05:651c:507:b0:37f:d484:59b8 with SMTP id
 38308e7fff4ca-3812156a27dmr56195091fa.7.1766517864402; Tue, 23 Dec 2025
 11:24:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:24:21 +0000
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Dec 2025 19:24:21 +0000
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
Date: Tue, 23 Dec 2025 19:24:21 +0000
X-Gm-Features: AQt7F2pon76cn3q1cVXsWOfbABA0VzmPkHryHoTqQJO424NmQQfz6rtksbdtGpM
Message-ID: <CAMEXYWfO-+7H_9rpmgEruuZunGc69Qh8o1ii_fLkbOKS-0fRnQ@mail.gmail.com>
Subject: [PATCH 5/5] platform/x86: think-lmi: Clean up alignment
To: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Benjamin Philip <benjamin.philip495@gmail.com>
Content-Type: text/plain; charset="UTF-8"

This commit fixes multiple instances of the following checkpatch check:

CHECK: Alignment should match open parenthesis

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/platform/x86/lenovo/think-lmi.c | 75 +++++++++++++------------
 1 file changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c
b/drivers/platform/x86/lenovo/think-lmi.c
index 07ba0d84720a..ccb767c3972e 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -424,7 +424,7 @@ static int tlmi_get_bios_selections(const char
*item, char **value)

 /* ---- Authentication sysfs
--------------------------------------------------------- */
 static ssize_t is_enabled_show(struct kobject *kobj, struct
kobj_attribute *attr,
-					  char *buf)
+			       char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

@@ -513,7 +513,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 		 */
 		if (tlmi_priv.pwd_admin->pwd_enabled &&
strlen(tlmi_priv.pwd_admin->password)) {
 			ret = tlmi_opcode_setting("WmiOpcodePasswordAdmin",
-					tlmi_priv.pwd_admin->password);
+						  tlmi_priv.pwd_admin->password);
 			if (ret)
 				goto out;
 		}
@@ -527,8 +527,8 @@ static ssize_t new_password_store(struct kobject *kobj,
 	} else {
 		/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
 		auth_str = kasprintf(GFP_KERNEL, "%s,%s,%s,%s,%s;",
-				setting->pwd_type, setting->password, new_pwd,
-				encoding_options[setting->encoding], setting->kbdlang);
+				     setting->pwd_type, setting->password, new_pwd,
+				     encoding_options[setting->encoding], setting->kbdlang);
 		if (!auth_str) {
 			ret = -ENOMEM;
 			goto out;
@@ -545,7 +545,7 @@ static ssize_t new_password_store(struct kobject *kobj,
 static struct kobj_attribute auth_new_password = __ATTR_WO(new_password);

 static ssize_t min_password_length_show(struct kobject *kobj, struct
kobj_attribute *attr,
-			 char *buf)
+					char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

@@ -555,16 +555,17 @@ static ssize_t min_password_length_show(struct
kobject *kobj, struct kobj_attrib
 static struct kobj_attribute auth_min_pass_length =
__ATTR_RO(min_password_length);

 static ssize_t max_password_length_show(struct kobject *kobj, struct
kobj_attribute *attr,
-			 char *buf)
+					char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

 	return sysfs_emit(buf, "%d\n", setting->maxlen);
 }
+
 static struct kobj_attribute auth_max_pass_length =
__ATTR_RO(max_password_length);

 static ssize_t mechanism_show(struct kobject *kobj, struct
kobj_attribute *attr,
-			 char *buf)
+			      char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

@@ -601,16 +602,15 @@ static ssize_t encoding_store(struct kobject
*kobj, struct kobj_attribute *attr,
 static struct kobj_attribute auth_encoding = __ATTR_RW(encoding);

 static ssize_t kbdlang_show(struct kobject *kobj, struct kobj_attribute *attr,
-			 char *buf)
+			    char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

 	return sysfs_emit(buf, "%s\n", setting->kbdlang);
 }

-static ssize_t kbdlang_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+static ssize_t kbdlang_store(struct kobject *kobj, struct kobj_attribute *attr,
+			     const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	int length;
@@ -665,16 +665,15 @@ static ssize_t index_store(struct kobject *kobj,
struct kobj_attribute *attr,
 static struct kobj_attribute auth_index = __ATTR_RW(index);

 static ssize_t level_show(struct kobject *kobj, struct kobj_attribute *attr,
-			 char *buf)
+			  char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);

 	return sysfs_emit(buf, "%s\n", level_options[setting->level]);
 }

-static ssize_t level_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+static ssize_t level_store(struct kobject *kobj, struct kobj_attribute *attr,
+			   const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	int i;
@@ -731,8 +730,9 @@ static ssize_t cert_thumbprint(char *buf, const
char *arg, int count)

 static char *thumbtypes[] = {"Md5", "Sha1", "Sha256"};

-static ssize_t certificate_thumbprint_show(struct kobject *kobj,
struct kobj_attribute *attr,
-			 char *buf)
+static ssize_t certificate_thumbprint_show(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *buf)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	unsigned int i;
@@ -764,8 +764,8 @@ static ssize_t certificate_thumbprint_show(struct
kobject *kobj, struct kobj_att
 static struct kobj_attribute auth_cert_thumb =
__ATTR_RO(certificate_thumbprint);

 static ssize_t cert_to_password_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+				      struct kobj_attribute *attr,
+				      const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	char *auth_str, *passwd;
@@ -809,8 +809,8 @@ enum cert_install_mode {
 };

 static ssize_t certificate_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+				 struct kobj_attribute *attr, const char *buf,
+				 size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	enum cert_install_mode install_mode = TLMI_CERT_INSTALL;
@@ -913,8 +913,8 @@ static ssize_t certificate_store(struct kobject *kobj,
 static struct kobj_attribute auth_certificate = __ATTR_WO(certificate);

 static ssize_t signature_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+			       struct kobj_attribute *attr, const char *buf,
+			       size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	char *new_signature;
@@ -940,8 +940,8 @@ static ssize_t signature_store(struct kobject *kobj,
 static struct kobj_attribute auth_signature = __ATTR_WO(signature);

 static ssize_t save_signature_store(struct kobject *kobj,
-				  struct kobj_attribute *attr,
-				  const char *buf, size_t count)
+				    struct kobj_attribute *attr,
+				    const char *buf, size_t count)
 {
 	struct tlmi_pwd_setting *setting = to_tlmi_pwd_setting(kobj);
 	char *new_signature;
@@ -1029,8 +1029,8 @@ static const struct attribute_group auth_attr_group = {
 __ATTRIBUTE_GROUPS(auth_attr);

 /* ---- Attributes sysfs
--------------------------------------------------------- */
-static ssize_t display_name_show(struct kobject *kobj, struct
kobj_attribute *attr,
-		char *buf)
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);

@@ -1069,7 +1069,7 @@ static ssize_t possible_values_show(struct
kobject *kobj, struct kobj_attribute
 }

 static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
-		char *buf)
+			 char *buf)
 {
 	struct tlmi_attr_setting *setting = to_tlmi_attr_setting(kobj);

@@ -1491,15 +1491,15 @@ static int tlmi_sysfs_init(void)
 {
 	int i, ret;

-	tlmi_priv.class_dev = device_create(&firmware_attributes_class,
NULL, MKDEV(0, 0),
-			NULL, "%s", "thinklmi");
+	tlmi_priv.class_dev = device_create(&firmware_attributes_class, NULL,
+					    MKDEV(0, 0), NULL, "%s", "thinklmi");
 	if (IS_ERR(tlmi_priv.class_dev)) {
 		ret = PTR_ERR(tlmi_priv.class_dev);
 		goto fail_class_created;
 	}

 	tlmi_priv.attribute_kset = kset_create_and_add("attributes", NULL,
-			&tlmi_priv.class_dev->kobj);
+						       &tlmi_priv.class_dev->kobj);
 	if (!tlmi_priv.attribute_kset) {
 		ret = -ENOMEM;
 		goto fail_device_created;
@@ -1637,8 +1637,8 @@ static int tlmi_analyze(struct wmi_device *wdev)
 		tlmi_priv.opcode_support = true;

 	if (wmi_has_guid(LENOVO_SET_BIOS_CERT_GUID) &&
-		wmi_has_guid(LENOVO_SET_BIOS_SETTING_CERT_GUID) &&
-		wmi_has_guid(LENOVO_SAVE_BIOS_SETTING_CERT_GUID))
+	    wmi_has_guid(LENOVO_SET_BIOS_SETTING_CERT_GUID) &&
+	    wmi_has_guid(LENOVO_SAVE_BIOS_SETTING_CERT_GUID))
 		tlmi_priv.certificate_support = true;

 	/* ThinkCenter uses different GUIDs for certificate support */
@@ -1693,7 +1693,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
 						       &setting->possible_values);
 			if (ret || !setting->possible_values)
 				pr_info("Error retrieving possible values for %d : %s\n",
-						i, setting->display_name);
+					i, setting->display_name);
 		} else {
 			/*
 			 * Older Thinkstations don't support the bios_selections API.
@@ -1710,8 +1710,9 @@ static int tlmi_analyze(struct wmi_device *wdev)
 					optend = strstr(optstart, "]");
 					if (optend)
 						setting->possible_values =
-							kstrndup(optstart, optend - optstart,
-									GFP_KERNEL);
+							kstrndup(optstart,
+								 optend - optstart,
+								 GFP_KERNEL);
 				}
 				kfree(optitem);
 			}
@@ -1772,7 +1773,7 @@ static int tlmi_analyze(struct wmi_device *wdev)
 		if (tlmi_priv.pwdcfg.core.password_state & TLMI_HDD_PWD) {
 			/* Check if PWD is configured and set index to first drive found */
 			if (tlmi_priv.pwdcfg.ext.hdd_user_password ||
-					tlmi_priv.pwdcfg.ext.hdd_master_password) {
+			    tlmi_priv.pwdcfg.ext.hdd_master_password) {
 				tlmi_priv.pwd_hdd->pwd_enabled = true;
 				if (tlmi_priv.pwdcfg.ext.hdd_master_password)
 					tlmi_priv.pwd_hdd->index =
-- 
2.52.0
