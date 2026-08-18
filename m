Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB87E2D061C
	for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 19:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080317; cv=none; b=jleK9Ker66ut6e2t75/kK3LER5FQinw5rf3A3rS1ugd4KEf9gkAhoATlC1QKovAUAztuq0f1Jd/Dyt684cB4pWCX6R+H8YmYqO6su8TDgwpdeSvtuxzCKZjppYtZg9olPYwaM5jCFvIbAbJOrmHhmnoSZpvFHCwfOisNyAMbw+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080317; c=relaxed/simple;
	bh=prE0cxZeAxUrFNCwuGQT3qOCxUJi84Egaqgt5CsozWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rkTcb/0Jfp5kFxBNp6C5B1XLgvjx8xYG3yGVb3GEJNaiOr7kx2PVMUlv7Yg1KEgXCrZm2G8gfkPJFED7l8Kz2ihJv9nzxJVuL8sNGEJxLOh7xcorRObKt8sDGlBnq3mN7gTA+6LHzO6K4uPbFGg7Z1AhB9sudzISWCGcb2+1B3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fYgjWFln; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fYgjWFln"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a3819e8be8so243090a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Aug 2026 12:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787080314; x=1787685114; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CXD7tc6oMBFEmd9i6wgkKuOD03Mu31Lz4UBhvt5Ho/Q=;
        b=fYgjWFlnQeLQuMHfOq7WtkXNwV3pEcfK9oUDZDgqwkiXpUM4uJl/fI32jGYMw+gO2X
         14Tr4HVN/9zeBEB2eEJ+JYx3Crf0MJ7kI/vyEMwAmJb3yXv36pL6O/yRO9/YNMPKH5lm
         CzonU0d+HYAK2srMK48GTqYIVkiNAQUJHE0+qAc6j9cOp+mmZjG7i+PXD1WymsZZSyKJ
         opTmOrUxr5nlSZA6lmcCDZZq/7OSX3ipzJ5RyGi0THrIDl9IE6n81vW0PwGS2+kvoiXQ
         jHXK60TgLS0Ycigs6jDu62WiqkTNGQ+JEclEis3eL8GwFzil4457KTUweuhdmK/KaEyM
         zO1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787080314; x=1787685114;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CXD7tc6oMBFEmd9i6wgkKuOD03Mu31Lz4UBhvt5Ho/Q=;
        b=qiF4Q9ZD2uQCIvqousIsUj5uKUGsaxf6aFjoh3gM27bxZkTGJa8U0rIYcvNTXn8Ejg
         fNMcZ4jgPJz56/Gsas61gb0WVrHVcMir/HiGJ07AKnbn1RmImnx5OX29a8Zeen3AlKnF
         pKzgAtDC9GjbV1HyhKGHd6/BRiJHuvdsHyr/sk6IcfgbpikmvMbmYgADbt4TRgV3MmAd
         sAS6Bfl6iRFFfmQozTlq0DLkC95h5U7tSYNYhLTeAvkzUKxGSDk7pwCIvoOOtvTlpUFE
         UwTBu2JhSwTnerA22Hw4KWM6yTCCdNVoWuA1CWQq3jbCLVnUDhkt+y5IjN6xVaQboFUe
         hOjg==
X-Gm-Message-State: AOJu0YwUh4q2MWrhpQN5CJ5z1Ec3zP7zNRQOwNiHhwtMgIYxvZsqsnz8
	su8Od+ZzixOMCPWld0aPe/ddZDJYYIdgh0vbPKqjzuLvP6ilInRCJ0sJAjKKOBNvQn7nkg==
X-Gm-Gg: AR+sD10lrp8gIEINlrI0GGnyi5RJI9C92GRziprXuCsOLHGAcFq7bLRQ5cMfNCjrU7Z
	J9OcHDVS7uh43fOUjdbk2HtfZj+A030jfHnnD3sZQYxpkVfqU7/VXMP//53WY72aPChFvkepBNN
	4tO2l7YDEWEZsRo1+8EwUlNDgZcNAFr0QjU0U38GeXcx4T0dbI2l9qhS16ipDH5YzfpAf9oQSDG
	NsRM0cVxXGqNC1rsfi0/RDIf4DlL5KoiIcbJAnEHW4dmN4ESo2ekShOKHKGPKrXefO/5OmnLehT
	K3lambdk0bOzPTjzx/+4fLOsOAk8c7oVvCanIsghK/vj2bsnrvJfjUm8JiN1NgArivfSFOuNlnV
	K+SpCWBAEDcE5zaihX4CoKNOfiG3EUy/iVWIwuP+ecUrpVvoCS9uqgTaW8zZ/ubdbFwGwRx//LY
	IJPvIGQ4css1FNbYRM+exyrq8uNoQ4Ua5M4zqa9KWuN6/dP+08JFhSmeDObLJqa4TU97ilgwsN3
	t1JDdpj4OvylXGoV1d5ig==
X-Received: by 2002:a05:6402:24cd:b0:6a0:9ce5:3f5c with SMTP id 4fb4d7f45d1cf-6a3e3c986f2mr4530938a12.7.1787080314075;
        Tue, 18 Aug 2026 12:11:54 -0700 (PDT)
Received: from fedora ([2a00:7c80:0:3b5::11])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8531694sm2291552a12.11.2026.08.18.12.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 12:11:53 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 2/2] platform/x86: hp-bioscfg: remove dead bounds check in audit_log_entries_show
Date: Wed, 19 Aug 2026 00:11:08 +0500
Message-ID: <20260818191120.38556-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818191120.38556-1-meatuni001@gmail.com>
References: <20260818191120.38556-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

audit_log_entries_show() checks "count * LOG_ENTRY_SIZE > PAGE_SIZE"
prior to entering the loop. Because "count" is already bounded to fit
within PAGE_SIZE, the inner loop check "(LOG_ENTRY_SIZE * i) > PAGE_SIZE"
can never be reached and is dead code.

Remove the redundant inner bounds check and eliminate the unnecessary
"else" block after "break" to clean up the loop control flow.

Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
  - Remove the dead inner loop check completely instead of adjusting
    the boundary arithmetic, as noted by Ilpo Järvinen.
  - Remove the redundant else block after break.

Changes in v2:
  - None for this patch; resubmitted as part of the v2 series.

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [v1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [v2]
---
 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
index b57e42f29282..3b20757a3e74 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -93,15 +93,12 @@ static ssize_t audit_log_entries_show(struct kobject *kobj,
 					   HPWMI_SURESTART,
 					   audit_log_buffer, 1, 128);
 
-		if (ret < 0 || (LOG_ENTRY_SIZE * i) > PAGE_SIZE) {
-			/*
-			 * Encountered a failure while reading
-			 * individual logs. Only a partial list of
-			 * audit log will be returned.
-			 */
+		/*
+		 * Encountered a failure while reading individual logs.
+		 * Only a partial list of audit log will be returned.
+		 */
+		if (ret < 0)
 			break;
-		} else {
-			memcpy(buf, audit_log_buffer, LOG_ENTRY_SIZE);
-			buf += LOG_ENTRY_SIZE;
-		}
+
+		memcpy(buf, audit_log_buffer, LOG_ENTRY_SIZE);
+		buf += LOG_ENTRY_SIZE;
 	}
 
 	return i * LOG_ENTRY_SIZE;
-- 
2.43.0
