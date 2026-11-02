Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643511;
	b=JcI1DeG9Grbu6EJ8Mbwi60WN2dnFcJN3bgmYKjcoHMWT+xJKlY5oO6wKAvE2WXN4nEcv
	 QlO70UOCMob76fzBbLgy49X5yl4OzYriOmMlREdOt6RAvHUBMfjZia+di5sTD2DzIJ43+
	 DtIn97XsHQBdSUpxkzdLL4zVJPvpxOaI9ZT4AQJrfdNaTpMC1ooFrG4VxOe7HOHaNSS/t
	 ojtrXriAeMkRG9cygY35dsG5TBpCqkRim7MQnCM6J062xSaMu0Inh0YR5p/3ViWjByI/y
	 IjquNiYBPmyzZQJfXqQj3mOHt/EaoEgjY33M61A5HQ/SaS+uSGe4JlycDthgHHNtIkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643511;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NHRs95xsQgjnwOuFrugRmWxAc9XLLQLwb+OYmfFck/4=;
	b=FXR7fVgeXw8BaZAc7E3wqKjhr8LWrch3Vh1XfMD8sSrjHxztlkHOdOZHfZAFCjZ2YH0l
	 +UqAxzMcp4Ms8qWHORrHcvO510fA+Dwt8bxBmou5FGHVEMZnlUTd4f+5GqPM2F78OIblH
	 sBk+NycnA7hBiOHiR1Wn3+0hSdDIlGxyLlDmED1hUUcdmjjSy5SfzjeupQnGL3T9bHhWv
	 BxposMn/OLbGUVCuPUodUQHAaURZYP9hfe5IFGYu6iFI1vD/hglFD9Yvd7QjULo0izuKH
	 g21jyKYPWX8833ySEyLLIBSx3+c5kq/BCz/e8G/ZN0PLgSoXgAyYrFWD++CZhgpeAOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNcbP4a3;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104F3606A327
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Nov 2026 18:18:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 104F3606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BNcbP4a3
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso2377764f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 10:18:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793643509; x=1794248309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NHRs95xsQgjnwOuFrugRmWxAc9XLLQLwb+OYmfFck/4=;
        b=BNcbP4a3nURPwGReohMJlcBk7a+a/QqJYDJigkMRVyIu0fGjRRoEhJMwq/Id8ORSVy
         cuB198sVread6+W+jQ5TzCWxhFtJyV+DI50GNK2tk2WzojkKwvynA2v+0Kby0Py3Hl7S
         OXq1ci1nHxaX+emvJAan4BUEQOxPMv8xlLxdiT7dJRJ/awtbLOlGWv+i28diy5ePqwUn
         pGPdpeiJkkLof9X+5xiIZR8LndVMPlD9VFWDVh/iC7cMWuSKWqtk2usG86ld7PrXMLkY
         24CvM2zC3D4PvnYVmvaznI2ziS+kR8vehsO6akIBvV3pWM6OnY6bcYZErkjDgkZ5wRDN
         wl6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793643509; x=1794248309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NHRs95xsQgjnwOuFrugRmWxAc9XLLQLwb+OYmfFck/4=;
        b=0smvZfs6oHTFqVZxTebTLkXfUh6YMRu/4nEHk7YLST9nXUQ41Fph34PpJIzEGi9YiW
         ytL6mDVf3tl1raLy5hYkQXgU3zkQUzVuZNvyiJ8zVfCQ0gRoWR59DUfsXlwdsQeE7PM0
         MSxyM75TZ9THqej52xomc55xcP/kGgBf1lvgHFL2NUoiSRLk9S9FypmAxL7pfYGY31wP
         GCzTHXyyERlkJSACsiNhbfnXyM/znUFFiihJbdD1fy9rfTCyHkjdWASZsOB7NoTlOzAJ
         LMDqdOBH4/O4d3aO/2mwsDFQwZCJqfFOFh67f+cb+lSehWP2xUVZEjzVSY8K8ZqSqgHO
         PhHw==
X-Forwarded-Encrypted: i=1; AKwUvBx9gfo52Tlt7SzHbb+iHtdSMPtnA8boYDB8NwKVGdSGq3ZZesj6y81Z56hqDQZwpO9fZnR9C8/A3+zzeA5+bg2CScXz@vger.kernel.org
X-Gm-Message-State: APuU4Z99PxYlUA5X8qNbCh9OGVfFXhByPeu6V1prkNL4f0cOQ5Z6vyPQ
	/snRYt1YoWloH3Ux26QMJ/8bf+c4GHT/7uhzPNEYQ7kIVb4f7U+KQpo=
X-Gm-Gg: AYBFou0WbTYEx6xCFrNgTZzp2jYiL8xRn9ZR0ULOi+jbhQXBnPQfIHx+d+vRVSQ0iUa
	1QGDlLWvGdOoJOl56RmbzBrJgY0YulI8q/di0qwx4cFMHq3ZvkpMeCD/a1eqCg9R6Lto+4qVEj5
	2ANSIPA1Frh6cFpkgxLUJmhbfHJ4928G9snVEfI2X7qvCQ3JSXVQu64lG7krYjs+HR8pzXETvGb
	z1OnfWY71KEErfXJLM8XKrKu5Lc+ZGPT2IIKLebZzQabijSbuVpb+uOHkcipzTsH4A5WwHvLQem
	8Ew4eKlOWZjrjnSDvPdk2HvLnJ9J0yG05Gw9u1I53t8byLS9ZahVhkneNrJNdKMpciqEgsqvOca
	oJJ0tX8pzLvjAEm6W1FpdNaTaMc+d714+rxLCPv9W2+A9AC/Mc7cc6fVFRPB8YJ7TuOxSM6rI1f
	b7+jFYj0BqgQRA5DlcK0V6R0/TmNijLE/skO449cy8PAiTBYeHnNm/HFH8NMpxSG2tqL4lwCRjH
	s5Qu4X9gYJxw+pNAtWrKjyjK2hSaWx60ILigBxnN1hRtjzQ8PVRDXSWex2nGk2ZJxzMSRaBmAci
	bHqbT+qHmvE=
X-Received: by 2002:a5d:5e8c:0:b0:48e:5c9b:f12c with SMTP id ffacd0b85a97d-48e6e2d4c32mr27465476f8f.16.1793643509167;
        Mon, 02 Nov 2026 10:18:29 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71baa1b3sm20326986f8f.56.2026.11.02.10.18.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 10:18:28 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH] platform/x86: toshiba_acpi: validate ACPI object type in tci_raw()
Date: Mon,  2 Nov 2026 18:18:27 +0000
Message-ID: <20261102181827.1989460-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tci_raw() calls acpi_evaluate_object() and uses the returned buffer as
an ACPI_TYPE_PACKAGE without checking its type field. If the ACPI method
returns a different object type, accessing package.count and
package.elements interprets whatever data the union holds as a package
descriptor.

Add a type check before accessing the package fields. Return AE_TYPE
when the result is not a package, when the package has more elements
than TCI_WORDS, or when any element is not an ACPI_TYPE_INTEGER.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 drivers/platform/x86/toshiba_acpi.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index a0b8060836d01..4ccc8f51c3a5b 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -342,9 +342,20 @@ static acpi_status tci_raw(struct toshiba_acpi_dev *dev,
 	status = acpi_evaluate_object(dev->acpi_dev->handle,
 				      (char *)dev->method_hci, &params,
 				      &results);
-	if ((status == AE_OK) && (out_objs->package.count <= TCI_WORDS)) {
-		for (i = 0; i < out_objs->package.count; ++i)
-			out[i] = out_objs->package.elements[i].integer.value;
+	if (status == AE_OK) {
+		if (out_objs->type == ACPI_TYPE_PACKAGE &&
+		    out_objs->package.count <= TCI_WORDS) {
+			for (i = 0; i < out_objs->package.count; ++i) {
+				if (out_objs->package.elements[i].type !=
+				    ACPI_TYPE_INTEGER) {
+					status = AE_TYPE;
+					break;
+				}
+				out[i] = out_objs->package.elements[i].integer.value;
+			}
+		} else {
+			status = AE_TYPE;
+		}
 	}
 
 	return status;
-- 
2.47.3

