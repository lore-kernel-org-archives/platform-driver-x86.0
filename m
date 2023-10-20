Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B081C001DF
	for <platform-driver-x86@archiver.kernel.org>; Fri, 20 Oct 2023 17:52:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377934AbjJTRww (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 20 Oct 2023 13:52:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377710AbjJTRwv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Oct 2023 13:52:51 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF09D46
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Oct 2023 10:52:48 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7a6fd18abso14433887b3.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Oct 2023 10:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697824367; x=1698429167; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AtIETOjbkQJj6Htxj0fJlTMZYY9ybPlI+s+bOIC8pu4=;
        b=QmTBrneph128UFo0ZPozYdW+0vcQbPkRAXiUWxievcc2UtTA65geZXYdvGdy1Ye2aA
         yPIew+5poDdTCQVrpwTbrpIY4GN86bd9d9IvPC9hSJukdZw5YQx2N+4thED3OgEgS3wF
         yTbbkw0TeBxXqA+ZSL2M9RpxQM34tFqp4ilOSYEE2j8Qq8C8+zHYvqh5Apk7eUZptBkG
         VVk9gP/aj6/aOyuBKaOmARvrk2+ZwrZEVkjuo0Ya3NB+pr/sfG2/bZZJT44ltSPESOpt
         Z4UbPU1Yhe3fg8ktkxHnj4U/+EwXDCruxdT5HBrJoImVurzUaqc1keJy6hhoqq+Rxysq
         vFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697824367; x=1698429167;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AtIETOjbkQJj6Htxj0fJlTMZYY9ybPlI+s+bOIC8pu4=;
        b=OGa/dn5UwMSPmyNS5xgcJAMmfBZ9dsA2cPlehyVaGOU78t9USFyDWlE7Xs+bDMierB
         3MuZZ973od2+jFt2Wj+XiPmt++Bgg5nuiQ+NOcg5xn1N/stdurjsBiSNgY6QhMcNRoZq
         mN55TNMlFEa4J51ofNjVGdtoA29mUftVuuRJ6/DveBlzzn/7W3MsfsnO4DaSW3XVqcsF
         GTrWSeXOsVChRaTjmB5Pqbvc81w3A8aHDFLci8olWNYo3SFTEC9JwfvVeOm0nfEyZOpV
         OVJCswI2byUYAtI8Z1h8GJqJi8zO4CSlUyQ4QfvalgfKe9pvElLjs8n0U817T+o1YYy8
         IjYg==
X-Gm-Message-State: AOJu0YwbrNiYliJlFlPmrLP2Te94lkQ/oYzgj1gUWNbiw/IPLlHF0A35
        cQSKqBi2ktRegzMODtN4Vrth+gegNEGBHPdUOQ==
X-Google-Smtp-Source: AGHT+IEYHzTPpIEqnJNQkKupZgg+UOt6w27w7zq4nhDyPMSx4obZaZI4NyxKV1YHxs8nDffJAu1jOClviB6Vg7Dpzg==
X-Received: from jstitt-linux1.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:23b5])
 (user=justinstitt job=sendgmr) by 2002:a25:5084:0:b0:d9a:d319:fa9e with SMTP
 id e126-20020a255084000000b00d9ad319fa9emr48789ybb.12.1697824367496; Fri, 20
 Oct 2023 10:52:47 -0700 (PDT)
Date:   Fri, 20 Oct 2023 17:52:43 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGq+MmUC/53NSwqDMBSF4a1Ixr3FKG1iR91HkRLy0EvVhJsQF
 HHvTV1Ch/8ZnG9n0RLayB7VzshmjOiXEvxSMT2qZbCApjRr6qblNe8gJlp02MAQZksRwqSS8zT
 DKu+QRlw+QZm30gFBg1CibU0thXWClctA1uF6cq++9IgxedpOPfPf+ieUOXBQzkjFpbg51z0H7 4fJXrWfWX8cxxdUqE0x6QAAAA==
X-Developer-Key: i=justinstitt@google.com; a=ed25519; pk=tC3hNkJQTpNX/gLKxTNQKDmiQl6QjBNCGKJINqAdJsE=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1697824366; l=4167;
 i=justinstitt@google.com; s=20230717; h=from:subject:message-id;
 bh=IEWFXcfharNOSw9h5QXyYQ0F0PyhdIDYy+kU9BdlLGo=; b=KG9Wfj5pNyAZ1XJPZIdYVUFbz4Ukma8/wGl788PWQAVeEeyVVe1CMIhhOGKuzVpzXzxcMdN04
 I8vcKQ+wklFC79kFNxfcUlHEOhUmCgLmeF7saFIpN0VYQoM2Ai9OBBr
X-Mailer: b4 0.12.3
Message-ID: <20231020-strncpy-drivers-platform-x86-thinkpad_acpi-c-v1-1-312f2e33034f@google.com>
Subject: [PATCH] platform/x86: thinkpad_acpi: replace deprecated strncpy with memcpy
From:   Justin Stitt <justinstitt@google.com>
To:     Kees Cook <keescook@chromium.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        "=?utf-8?q?Ilpo_J=C3=A4rvinen?=" <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

strncpy() is deprecated for use on NUL-terminated destination strings
[1] and as such we should prefer more robust and less ambiguous
interfaces.

We expect ec_fw_string to be NUL-terminated based on its use with format
strings in thinkpad_acpi.c:
11241 | pr_notice("ThinkPad firmware release %s doesn't match the known patterns\n",
11242 |     ec_fw_string);

Moreover, NUL-padding is not required since ec_fw_string is explicitly
zero-initialized:
11185 | char ec_fw_string[18] = {0};

When carefully copying bytes from one buffer to another in
pre-determined blocks (like what's happening here with dmi_data):

|       static void find_new_ec_fwstr(const struct dmi_header *dm, void *private)
|       {
|       	char *ec_fw_string = (char *) private;
|       	const char *dmi_data = (const char *)dm;
|       	/*
|       	 * ThinkPad Embedded Controller Program Table on newer models
|       	 *
|       	 * Offset |  Name                | Width  | Description
|       	 * ----------------------------------------------------
|       	 *  0x00  | Type                 | BYTE   | 0x8C
|       	 *  0x01  | Length               | BYTE   |
|       	 *  0x02  | Handle               | WORD   | Varies
|       	 *  0x04  | Signature            | BYTEx6 | ASCII for "LENOVO"
|       	 *  0x0A  | OEM struct offset    | BYTE   | 0x0B
|       	 *  0x0B  | OEM struct number    | BYTE   | 0x07, for this structure
|       	 *  0x0C  | OEM struct revision  | BYTE   | 0x01, for this format
|       	 *  0x0D  | ECP version ID       | STR ID |
|       	 *  0x0E  | ECP release date     | STR ID |
|       	 */
|
|       	/* Return if data structure not match */
|       	if (dm->type != 140 || dm->length < 0x0F ||
|       	memcmp(dmi_data + 4, "LENOVO", 6) != 0 ||
|       	dmi_data[0x0A] != 0x0B || dmi_data[0x0B] != 0x07 ||
|       	dmi_data[0x0C] != 0x01)
|       		return;
|
|       	/* fwstr is the first 8byte string  */
|       	strncpy(ec_fw_string, dmi_data + 0x0F, 8);

... we shouldn't be using a C string api. Let's instead use memcpy() as
this more properly relays the intended behavior.

Do note that ec_fw_string will still end up being NUL-terminated since
we are memcpy'ing only 8 bytes into a buffer full of 18 zeroes. There's
still some trailing NUL-bytes there. To ensure this behavior, let's add
a BUILD_BUG_ON checking the length leaves space for at least one
trailing NUL-byte.

Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
Link: https://github.com/KSPP/linux/issues/90
Cc: Kees Cook <keescook@chromium.org>
Signed-off-by: Justin Stitt <justinstitt@google.com>
---
Note: build-tested only.

Found with: $ rg "strncpy\("
---
 drivers/platform/x86/thinkpad_acpi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 41584427dc32..bd9e06f5b860 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -11144,6 +11144,8 @@ static char __init tpacpi_parse_fw_id(const char * const s,
 	return '\0';
 }
 
+#define EC_FW_STRING_LEN 18
+
 static void find_new_ec_fwstr(const struct dmi_header *dm, void *private)
 {
 	char *ec_fw_string = (char *) private;
@@ -11172,7 +11174,8 @@ static void find_new_ec_fwstr(const struct dmi_header *dm, void *private)
 		return;
 
 	/* fwstr is the first 8byte string  */
-	strncpy(ec_fw_string, dmi_data + 0x0F, 8);
+	BUILD_BUG_ON(EC_FW_STRING_LEN <= 8);
+	memcpy(ec_fw_string, dmi_data + 0x0F, 8);
 }
 
 /* returns 0 - probe ok, or < 0 - probe error.
@@ -11182,7 +11185,7 @@ static int __must_check __init get_thinkpad_model_data(
 						struct thinkpad_id_data *tp)
 {
 	const struct dmi_device *dev = NULL;
-	char ec_fw_string[18] = {0};
+	char ec_fw_string[EC_FW_STRING_LEN] = {0};
 	char const *s;
 	char t;
 

---
base-commit: dab3e01664eaddae965699f1fec776609db0ea9d
change-id: 20231019-strncpy-drivers-platform-x86-thinkpad_acpi-c-7a733d087ef7

Best regards,
--
Justin Stitt <justinstitt@google.com>

