Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94D382360
	for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 22:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777587377; cv=none; b=SCerJzLG5zqjeyq7rhxQqWTmHLkoqmKct4wXfLt6Kddq1zcoZFcx+xupO11o7uWhZFLgYpbNrbWy5Q5XxlLAtoJxNUdeWIKZuI6or1kW/i6S7SK3OphwzOqY8JtqSJkecP8qWy/EolYE5IdoJJ0rdQMJMOKr0Q6wzOtyjmt99CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777587377; c=relaxed/simple;
	bh=KIoMyWKvhjgZMM30/KFdKVEMyY27M/KUH7AVPeHarE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S+kbb3cMKNqAendDAnV8ZkXAvqIdfr3Pt2blYpD4fMH3djmUtQ8tHszy4dkvuR+ahcZ7S1fUoKxNs3jrKElMVDbpGjz00yqt3fWb/KJ4jAoI9llrw1rQZbZJJc1+ZEJwQOMsbZ2+j3NSatPRBAMjyCEg0EJBaMqcAXA2IZ/62og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw1jZazi; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw1jZazi"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8ef45a6d9dfso152301185a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 30 Apr 2026 15:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777587375; x=1778192175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0Rsfg16xdotslJA1zN20XDN16KykAdChmHnTzqvbpY=;
        b=Pw1jZazi9tPyqdTSFzFpnn9SQOvt7m9MwiqmVUBqpZCTvbP1NfMiNVWsUUoQgSpm29
         ocJTViGezNkFzTFDuHigWoYsXEZpVFf8vU5j5zpjlXAT1e2JtlpKiObaP7QEyBqVY6+t
         N3IUDxa7FlS99JfRN8z5chzGKLWKo8L5YAVl9VlCG2++whC2vBwIE0dOaRagrw8Xy2+h
         uqEPqcXbb0ho0SK6hvSGjp1/DEP8O64ms6jsWbSQhpEuV9tV3xvIa4AADQXmBCRXL+Mv
         i7eGglEfASgz9PQVv102VnqGOUfcKFeGiM1l9kAAIEZHz0xLGmAMUrCW7tvK1eH78ud6
         7owQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777587375; x=1778192175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0Rsfg16xdotslJA1zN20XDN16KykAdChmHnTzqvbpY=;
        b=FYzfkPVUdoePNdvPePgwTyIOi5kNPVRx/RzgC4XBIWkc6XChtowJSWSd7zoltDhVTg
         YKFzWGndIg4Kkwux6htUbm1axFpB86BrnADrSZeo7GGqMehmEZ4qs/hxMLvJu+6TATnA
         KsiiQKzU730hfxSWj79GGNCudHGVmVqkNJrBef7neRDBKyMubM4mVlUJegcfG8YMuFR5
         QFfQjHcmh8tOni7JV7MKWKLvk9IHS0y9+LHqN7bp1OCXCFe1QvvNuNS3ZJlkFOgUFx06
         djnhLQTL2JkmwCkGZQjt5Nd9/N4Y35whJq4WmV6cb1EqJIXLx/KG8T34KaWG9xcbGZ0y
         PiLA==
X-Gm-Message-State: AOJu0YzxTUbZjFpBYZIMmYPtlyI9tEb+0/uoWtQ6a9dJoGNwwAmswGbs
	+204HeZ0af+xQ/AD6V5ZLZjR978N+hUUa3YmRYX/QGbdIofBYYN9tcT7ngbBlfEX
X-Gm-Gg: AeBDievdJ6PlB93CNdFdSdNx+Rzpv2aSitb/yJw5//z1x85elVq+w1PraaeJPXW/J9/
	/3nFgmHXALpkUIAGxgTRvfPduPrZvZoZtg4A7b7YRmmOtTBLXH8FC27lj8myjFLYZGcMQ3wYJVo
	bV0nDwhQzxxcoInYDIZYK39vldWKRNDEuC7mNo9EtH8oD908hOnEgGpXJP+Ix+bV7f3yQSDy+L4
	Vm3HhDdb5QmwntEwUJL+9MBERpYhDJUF0U5P/BY6rXpl92iOkXeexDrNfDz+4L9kARG9JoUudfw
	RryHEKoPRANTjYS8lwlM/YqAE8lYLuGOn/HOz8AB7Mc2+BxlKB85NvEts5mu822VYU6JaCrzt9/
	cLQwGC6AK5ld5t1u8EwcUbTi10JJAJZQiXT9im16d2098AHOX5MDAv7ca3UxlOKL9sWXBelWlnV
	dlPMueD81MROolihZwrEMXofFqDBYgQrkN21TWX6/kkz7NwWksVXB/ihorK8ZW/DThHdDdg9XFu
	W8b3V2YQt0qhrgd87f+VmU61Avq0AL5U+KY+Ti9seMzSh/BFQZCW2Qn
X-Received: by 2002:a05:620a:31a4:b0:8ee:a1d:baf1 with SMTP id af79cd13be357-8fa8922aa56mr779761685a.42.1777587374557;
        Thu, 30 Apr 2026 15:16:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fbf3f20c99sm37649485a.45.2026.04.30.15.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 15:16:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: Kenneth Chan <kenneth.t.chan@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] platform/x86: panasonic-laptop: simplify allocation of sinf
Date: Thu, 30 Apr 2026 15:15:55 -0700
Message-ID: <20260430221555.83351-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change to a flexible array member to allocate once instead of twice.

Use __counted_by for extra runtime analysis. Move the counting
variable assignment to right after allocation as done by
kzalloc_flex for GCC 15 and above.

Remove + 1 to allocation. It's already done in the previous line.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: Rephrased.
 v2: Rebased.
 drivers/platform/x86/panasonic-laptop.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 1337f7c49805..2fe8ff0d32a8 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -246,11 +246,11 @@ struct pcc_acpi {
 	int			ac_brightness;
 	int			dc_brightness;
 	int			current_brightness;
-	u32			*sinf;
 	struct acpi_device	*device;
 	struct input_dev	*input_dev;
 	struct backlight_device	*backlight;
 	struct platform_device	*platform;
+	u32			sinf[] __counted_by(num_sifr);
 };

 /*
@@ -1003,21 +1003,15 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	 */
 	num_sifr++;

-	pcc = kzalloc_obj(struct pcc_acpi);
+	pcc = kzalloc_flex(*pcc, sinf, num_sifr);
 	if (!pcc) {
 		pr_err("Couldn't allocate mem for pcc");
 		return -ENOMEM;
 	}

-	pcc->sinf = kcalloc(num_sifr + 1, sizeof(u32), GFP_KERNEL);
-	if (!pcc->sinf) {
-		result = -ENOMEM;
-		goto out_hotkey;
-	}
-
+	pcc->num_sifr = num_sifr;
 	pcc->device = device;
 	pcc->handle = device->handle;
-	pcc->num_sifr = num_sifr;
 	device->driver_data = pcc;
 	strscpy(acpi_device_name(device), ACPI_PCC_DEVICE_NAME);
 	strscpy(acpi_device_class(device), ACPI_PCC_CLASS);
@@ -1025,7 +1019,7 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	result = acpi_pcc_init_input(pcc);
 	if (result) {
 		pr_err("Error installing keyinput handler\n");
-		goto out_sinf;
+		goto out_hotkey;
 	}

 	if (!acpi_pcc_retrieve_biosdata(pcc)) {
@@ -1106,10 +1100,8 @@ static int acpi_pcc_hotkey_probe(struct platform_device *pdev)
 	backlight_device_unregister(pcc->backlight);
 out_input:
 	input_unregister_device(pcc->input_dev);
-out_sinf:
-	device->driver_data = NULL;
-	kfree(pcc->sinf);
 out_hotkey:
+	device->driver_data = NULL;
 	kfree(pcc);

 	return result;
@@ -1139,7 +1131,6 @@ static void acpi_pcc_hotkey_remove(struct platform_device *pdev)

 	device->driver_data = NULL;

-	kfree(pcc->sinf);
 	kfree(pcc);
 }

--
2.54.0

