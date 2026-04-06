Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEB039BFF0
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506445; cv=none; b=JvmECU4NA2twhP03xAOTKEK0kF/lW9/XWAiryaIMqVqkC3hwLwhUfa4iudVgEDbgZQbYzN7xDIZ0I+T6y9ng0ZrrtENJ0VpkEgdJBztQXBX9noYoSKV+mRYkLyUtA/pQly2CBIhkHIhTiQdkEmnrlTDgnmxpONuEw3BwHB9CMKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506445; c=relaxed/simple;
	bh=QpvEj1emH+D7uyjHFu5brDKzkv5iOsNgAWo3QDRZ4T0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TyZRqtA89UddkuF1fG8KmPSLByBZhXO8psN3fw3mcVQSbFCxaq94lA/ok9yPKs5Rlyurkxg0iunchwzGxgzK5ctfajiLe35PMvdZfTrH+BqIne2SB8HKAMYqllxclxMWi4UZ1uqN7Wf853nzRHjF14bGusQuUsPqCGFma5JJTGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PB9uVzGY; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PB9uVzGY"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c0b72dac7so1571724c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506444; x=1776111244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hj5KeLYeiV8K9ipCUKl33iACfT1+nJcLiRAjRSTKr8k=;
        b=PB9uVzGYA6vJaXCeU0dy9dKynpZCyKgtvtBDZw8hD+PfdYLZl5zxKlKDWkYFeV3Zol
         rvZ+l14i/o/F1wJy8i2C1JgQfIMwXQe2aDS2velbLC1x2iG31grWZmO6qlpqm/kmfsof
         cF+NalFxSEoSKGuCvBRjmTQ8iqYOJOAZEm406kXQYEcxYL0P0+cAkuBGpMz6pG2Ze8DW
         WGqFXZ1iMW21AUBOgcYh9RrJWDKnhASs759bbq35sY/xN7uLmUaTi532bemPBXRrsczI
         SQjVDtSgTo2lsXzKb5WsmRn2Tjp80Md18KAfKTynDp2N+T0gajmijdCjueeb2af3Xdqn
         EcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506444; x=1776111244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hj5KeLYeiV8K9ipCUKl33iACfT1+nJcLiRAjRSTKr8k=;
        b=RZxiMvvzwPJwrtyLUIkn5fXZoYXt9uOezJ1bsX7NhetO1ovrEPH+Sl8uuUvT/pqbal
         Rz7argid5+IRE9U4S0IjtnFdi8J01RwUJevkw2pLjc5BLuSqNptjY4fITeZWVIR83u+N
         Ttwov3xFS3FotcOQUTRykTk8x0VhoqX0yuh5z61QuC0tLfeBVP84fl9X8WyHWe+9KxaD
         Sw5u1tOt1H9i2l2lgWJsIbZJIHTQIOuTUS/JXqoSO33VdmhXxTN9FXHDcYLRoB83oPiO
         hjQXHn67wa6ulzjd7H1ewyGngIHQ32qO1QZIqaEe/blpt++l9xeUHIpr8/TJDbXK6Q2b
         A1eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyHD17p7dGz1YBFnmYpncYNaRR25m37CJCLQBJbOFEdbZzJ6DZKCTjgDXksoV0lSiXNP7NnUX21dPp2donAJ+2Nizu@vger.kernel.org
X-Gm-Message-State: AOJu0YzjTrHvY6ycWxFgxThoSfxu7iDU/LOsgWgCNiP7I/Zi0/AEJBbr
	mbM2PolMfWLyVcvJIEdkAl1IDtK28PzGjgKBC10r526QBK9Zx3fsWVyKwxznzA==
X-Gm-Gg: AeBDieuLnjweX5vOuS4aCEXHCy4hPtBCmnYOG4Y6MIimZM/qvb/HqX+JivGyhx81UA7
	RFGf/UX2b6GCzaLo3lTKXejKWNxPvjZlcUDjW8XKXyR3EooPzz9rCoPIbD6RwXqq7SGRFeFk2wN
	PR1JIVHgFZZgxqwJlk4jO2ACmw9FT5d30lmjfYEN1T169AUrWJst0NTzeqssDsErvFsQCqhphLb
	g69cUGFd9DbDoJT7mE9RqRn8QhYMgPbZ6FCFNCFAUHJwHWMkRp6OfqotCt+SBk/qLy6kGtyuwtl
	fix+i+mzy1niJqGf2gUeeChgbO4wMJF+xljs9dwN6nDd24942qnV7DbS68nzoBHCSNu7Fu+P/YZ
	7UWj0JsxxZXI2Z9jF0yLJf/sBQOsXjm9SCfInNmoj9Q/XCb3Oop3zTKRuB9b7EQGRvEBvzqBqTw
	pkImK4rtHRkVAicOEzkCoQNk4mks03ZLdYJvTS1d0gNg9s2IygM6xkX9bizvR+38vmUDr4+o+ik
	mME
X-Received: by 2002:a05:7022:f30f:b0:12c:43:839b with SMTP id a92af1059eb24-12c00438781mr2653107c88.35.1775506443579;
        Mon, 06 Apr 2026 13:14:03 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:03 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v8 01/16] platform/x86: lenovo-wmi-helpers: Fix memory leak in lwmi_dev_evaluate_int()
Date: Mon,  6 Apr 2026 20:13:45 +0000
Message-ID: <20260406201400.438221-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

lwmi_dev_evaluate_int() leaks output.pointer when retval == NULL (found
by sashiko.dev [1]).

Fix it by moving `ret_obj = output.pointer' outside of the `if (retval)'
block so that it is always freed by the __free cleanup callback.

No functional change intended.

Fixes: e521d16e76cd ("platform/x86: Add lenovo-wmi-helpers")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-helpers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-helpers.c b/drivers/platform/x86/lenovo/wmi-helpers.c
index 7379defac500..018d7642e2bd 100644
--- a/drivers/platform/x86/lenovo/wmi-helpers.c
+++ b/drivers/platform/x86/lenovo/wmi-helpers.c
@@ -46,7 +46,6 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 			  unsigned char *buf, size_t size, u32 *retval)
 {
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *ret_obj __free(kfree) = NULL;
 	struct acpi_buffer input = { size, buf };
 	acpi_status status;
 
@@ -55,8 +54,9 @@ int lwmi_dev_evaluate_int(struct wmi_device *wdev, u8 instance, u32 method_id,
 	if (ACPI_FAILURE(status))
 		return -EIO;
 
+	union acpi_object *ret_obj __free(kfree) = output.pointer;
+
 	if (retval) {
-		ret_obj = output.pointer;
 		if (!ret_obj)
 			return -ENODATA;
 
-- 
2.53.0

