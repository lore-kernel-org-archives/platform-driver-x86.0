Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793043594;
	b=UQEAKxAT8ZlW6SfGmSfOucG4piyLXVJ4DiP1FjDwqFoE/vJPd86cbJJfy98GB2gsMf2E
	 45anPwyvxKt0JsJhvHSAHOh8I1YY9YkNcnsu7nmS57ovnJmwg+TgC2oJ92JYRUiD7/R00
	 rVbbv5unLdXLt9tEpShGlqYUwqM50agj9PqQnpaBinh6Fi4lRHKzYHsfNTEZjj1VC0ghJ
	 zKhub7V7orsiFk4lAwGgkZgDhOsGASdd/ScUOo09OigfeHI94ZXUF8q8PSmKK4Ad96/Z2
	 4H6EsUakU8Hf1VAQItrsfWGARN66GQ0pFoQDXMB/O0WvRarm57cHx+yhu1ZdXseSzGQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043594;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jxSe+cXD/pUHaUwPn0oQEU0w9NfI9vncG/+zwvHVgBM=;
	b=t5M1qtrHsM9TLI6LWZUtP7aaVRqkIBdEnhzERJbeo2NiBI++XRlxpTMamz1J0nue374g
	 EuycEo5FEv2Gb8E1PJGm6/OLf0PyZnUOgr2Hq3+U7eRnm1sJWYtepIboyxU58s/N3GC+0
	 cHacaIuI4VrrgqyGb2osgEtqOyfhHMpDhdS9ZYQ1cOkOlq/SM6OS22sOWz8DJ7+mbXdge
	 fNt5xP0ppJa1lnES+BmXtDSlAj1vkEUcVWRuiR7GjL8CBDKROIj4Alv+mGN2ua4p7e0Gy
	 MIhwrNmvEfLAZEPVQpvR7Z7erxcO4dBNd8SKV+xNVAFQCw+dtQlJhw05Fven+YhV2PQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oH08iCpV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4584E606A31A;
	Mon, 26 Oct 2026 19:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oH08iCpV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793043593;
	b=lOkPSyO9RhbDE2aaUh843Ig0QmICdHyOCG3fv8l4CYjZv5tVS4eLgp8THh7NmMbo+xci
	 mua91cYizVrLQxLdX0uISS7ERgWub/JEfKdzsiop0HWdax0MflHSG8uHm4CxGnf6aCcFl
	 /260f7JoflMG9+rYOnKidvrEC+6JhYVMgGsAEuKfeoBkOwuZsjZvr2EyphKBcccZvdTT9
	 EoNfqqx5THZ4n6E8zvEOOG0jbdgI+jEHmfcn8G25edYmv8dSKaf56isGNvzX7unZ2iO22
	 SzgioKCF2vvv1OQOSfO0HQGsyNFRPn2A6XRCpHhWcd62b7VUkwHFzTFVdoGHYBdd3NA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793043593;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jxSe+cXD/pUHaUwPn0oQEU0w9NfI9vncG/+zwvHVgBM=;
	b=JQPP584/v026Ru7mUW4jd8LJ8vcIsmFWzAPU1gfUlYgU95YRG9rDF0ndy+ROfmaJtWS0
	 ZVQGZJ0WjcFOraKT1+1IfcRYzZCDukSJyrYGXb11UoVLSoEo2lJjbhJBcC1RJrzDLcnph
	 x76bnkkejcO4YjZsStm5I4SKS2Cf/qeW17eqWbSyOKt+RCCwQa94m+XYm8GX+4Xz3v8uG
	 xy7+mMali6HxpdiflFf7HFt0tUKaLCAwnZWj/2FkrEB6ps+8SFVGddTCzIG3BNrvDXS1k
	 KLyqVuFv17Epdi7FFPqyfPPVCpTbZPbl2ukqhZwKJRINprRGmnfyvl2nSVXlEDbTnwg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4529A1F01825;
	Mon, 26 Oct 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793043593;
	bh=jxSe+cXD/pUHaUwPn0oQEU0w9NfI9vncG/+zwvHVgBM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=oH08iCpV1/5suzFF3SsC4biD5lQIeCpUdvvD9Pk2xvl8LWXU6dMRttAklMS29vz6+
	 OhhaQMQZznFoTxBrRPAX5ktbIW+ZUuOLvIQtZHQoefChHMSyTKkT3+1o4ncAR4J6Qf
	 NIYUMO5ocCgnCh4fObUrp+/pbE7MVNEqZBKNOxFbvl0mXrwKQOfvYRviBDj41So6DV
	 PExyf5wUibFD4YJwwdHv/wwAl5GZvwOQ3xSUHHefnQQfFkvuDJZRjNAQVQl05yicrr
	 gyYdvtF4zRq1MAwNSZ9b7z58RJjMeqAvsr/cHs2pO8Cj8qcCDNybvjBAe9F3K8X6FO
	 tx2PtPGIGpubQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 98A2F44E60;
	Mon, 26 Oct 2026 19:39:52 +0000 (UTC)
From: Nicola Nicodemo via B4 Relay <devnull+nicola084.gmail.com@kernel.org>
Date: Mon, 26 Oct 2026 20:39:52 +0100
Subject: [PATCH] platform/x86: samsung-galaxybook: Accept performance mode
 set without success code
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261026-galaxybook-perfmode-set-v1-1-9524f21a08d1@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOw7CMBCE4atEW7OSbRGQuAqisJ1xWB5x5A0oK
 MrdY6CY4ivmX0hRBEqnZqGCt6jkocLuGopXP/Rg6arJGXewddz7h58/Iec7jyjpmTuwYuIYbNi
 beDSuTVTfY0GS+Vc+X/7WV7ghTt8cresG7NnKunsAAAA=
X-Change-ID: 20261026-galaxybook-perfmode-set-cb1b40c7025f
To: Joshua Grisham <josh@joshuagrisham.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nicola Nicodemo <nicola084@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793043592; l=6032;
 i=nicola084@gmail.com; s=20261026; h=from:subject:message-id;
 bh=Hmna7VLOcgJWMb26qFyvn/juzCuSuN+yBlxqdXfTQfw=;
 b=FHlK2zB3pS3B3ImsB7xjU6aHHWeIsChyP1WlBpMUJVc4UjcXGR559kU3Rakr7fyawpgYGXWua
 ONRSg5xNqjeClm4xofPBynS7nLq6guTzWSYGBIjuTUz1nUI7aJ69cgM
X-Developer-Key: i=nicola084@gmail.com; a=ed25519;
 pk=qxnxpsv7febRPhFBBsg97s3+9R0jmexxirZUqtaQFPQ=
X-Endpoint-Received: by B4 Relay for nicola084@gmail.com/20261026 with
 auth_id=1329
X-Original-From: Nicola Nicodemo <nicola084@gmail.com>
Reply-To: nicola084@gmail.com
Content-Transfer-Encoding: 7bit

From: Nicola Nicodemo <nicola084@gmail.com>

On the Galaxy Book (NP750XDA, SAM0428) the performance mode SET call
applies the new mode, but the firmware never writes the 0xaa success
code to RFLG in its response. The relevant part of the DSDT
(\_SB.SCAI.CSXI -> HIPF) is:

    Case (0x02)     /* GET */
    {
        IOB0 = BEST
        RFLG = 0xAA
    }
    Case (0x03)     /* SET */
    {
        PRVM = BEST
        BEST = IOB0
        Switch (BEST)
        {
            ... /* update EC and DPTF state, no RFLG */
        }
    }

The platform profile probe ends by setting the balanced mode, so the
missing success code makes the probe fail, platform profile
registration fails and, as that error is fatal, the whole driver fails
to probe:

    acpi SAM0428:00: failed to execute CSXI; device did not respond with success code 0xaa
    samsung-galaxybook SAM0428:00: platform_profile probe failed
    samsung-galaxybook SAM0428:00: error -ENXIO: failed to initialize platform profile

This also takes down the features that work fine on this device: the
battery charge control end threshold and the power_on_lid_open and
block_recording firmware attributes.

When the SET response has no success code, read the mode back with GET
and treat the SET as successful if the mode was applied. To do this
without logging an error on every mode change, split the evaluation of
the ACPI method out of galaxybook_acpi_method() into
galaxybook_acpi_evaluate(), which does not check the response codes.

With this change the driver probes on the NP750XDA, the low-power,
quiet, balanced and performance profiles can be selected and read back,
and the battery threshold and firmware attributes work.

Fixes: 56f529ce4370 ("platform/x86: samsung-galaxybook: Add samsung-galaxybook driver")
Signed-off-by: Nicola Nicodemo <nicola084@gmail.com>
---
Tested on a Galaxy Book NP750XDA (BIOS P22CFD.047.240905.HQ, 09/05/2024).
---
 drivers/platform/x86/samsung-galaxybook.c | 75 +++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/samsung-galaxybook.c b/drivers/platform/x86/samsung-galaxybook.c
index 99f72b204..8134fcfc6 100644
--- a/drivers/platform/x86/samsung-galaxybook.c
+++ b/drivers/platform/x86/samsung-galaxybook.c
@@ -220,8 +220,12 @@ static const guid_t performance_mode_guid =
  * ACPI method handling
  */
 
-static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
-				  struct sawb *buf, size_t len)
+/*
+ * Evaluate the method and copy its response into buf without checking the
+ * response codes; most callers want galaxybook_acpi_method() instead.
+ */
+static int galaxybook_acpi_evaluate(struct samsung_galaxybook *galaxybook, acpi_string method,
+				    struct sawb *buf, size_t len)
 {
 	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object in_obj, *out_obj;
@@ -254,20 +258,6 @@ static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_st
 		err = -EPROTO;
 		goto out_free;
 	}
-	if (out_obj->buffer.pointer[GB_SAWB_RFLG_POS] != GB_RFLG_SUCCESS) {
-		dev_err(&galaxybook->acpi->dev,
-			"failed to execute %s; device did not respond with success code 0x%x\n",
-			method, GB_RFLG_SUCCESS);
-		err = -ENXIO;
-		goto out_free;
-	}
-	if (out_obj->buffer.pointer[GB_SAWB_GB_GUNM_POS] == GB_GUNM_FAIL) {
-		dev_err(&galaxybook->acpi->dev,
-			"failed to execute %s; device responded with failure code 0x%x\n",
-			method, GB_GUNM_FAIL);
-		err = -ENXIO;
-		goto out_free;
-	}
 
 	memcpy(buf, out_obj->buffer.pointer, len);
 	err = 0;
@@ -277,6 +267,31 @@ out_free:
 	return err;
 }
 
+static int galaxybook_acpi_method(struct samsung_galaxybook *galaxybook, acpi_string method,
+				  struct sawb *buf, size_t len)
+{
+	int err;
+
+	err = galaxybook_acpi_evaluate(galaxybook, method, buf, len);
+	if (err)
+		return err;
+
+	if (buf->rflg != GB_RFLG_SUCCESS) {
+		dev_err(&galaxybook->acpi->dev,
+			"failed to execute %s; device did not respond with success code 0x%x\n",
+			method, GB_RFLG_SUCCESS);
+		return -ENXIO;
+	}
+	if (buf->gunm == GB_GUNM_FAIL) {
+		dev_err(&galaxybook->acpi->dev,
+			"failed to execute %s; device responded with failure code 0x%x\n",
+			method, GB_GUNM_FAIL);
+		return -ENXIO;
+	}
+
+	return 0;
+}
+
 static int galaxybook_enable_acpi_feature(struct samsung_galaxybook *galaxybook, const u16 sasb)
 {
 	struct sawb buf = {};
@@ -581,6 +596,8 @@ static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybook,
 				     const u8 performance_mode)
 {
 	struct sawb buf = {};
+	u8 current_mode;
+	int err;
 
 	buf.safn = GB_SAFN;
 	buf.sasb = GB_SASB_PERFORMANCE_MODE;
@@ -589,8 +606,30 @@ static int performance_mode_acpi_set(struct samsung_galaxybook *galaxybook,
 	buf.subn = GB_SUBN_PERFORMANCE_MODE_SET;
 	buf.iob0 = performance_mode;
 
-	return galaxybook_acpi_method(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
-				      &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+	err = galaxybook_acpi_evaluate(galaxybook, GB_ACPI_METHOD_PERFORMANCE_MODE,
+				       &buf, GB_SAWB_LEN_PERFORMANCE_MODE);
+	if (err)
+		return err;
+
+	if (buf.rflg == GB_RFLG_SUCCESS)
+		return 0;
+
+	/*
+	 * Some devices (e.g. Galaxy Book 750XDA) apply the new performance mode
+	 * but never set the success code in their response, so read the mode
+	 * back to check whether it was applied.
+	 */
+	err = performance_mode_acpi_get(galaxybook, &current_mode);
+	if (err)
+		return err;
+
+	if (current_mode != performance_mode) {
+		dev_err(&galaxybook->platform->dev,
+			"failed to set performance mode 0x%x\n", performance_mode);
+		return -ENXIO;
+	}
+
+	return 0;
 }
 
 static int get_performance_mode_profile(struct samsung_galaxybook *galaxybook,

---
base-commit: 9d3475065167197742b0882aff21cf8e78393277
change-id: 20261026-galaxybook-perfmode-set-cb1b40c7025f

Best regards,
--  
Nicola Nicodemo <nicola084@gmail.com>


