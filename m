Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692CE388868
	for <platform-driver-x86@vger.kernel.org>; Sat, 23 May 2026 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779536745; cv=none; b=M5UX/B7Smj7Z5AvWvdC8EyshrEtjhwPJUsQ1jC8EPIBCFApdnLsMCQtD/hdMVmq8liPavTCRYfXss85V4W4TePNJgaBM+wXTlfGTMZ5Gh7Do7anq4hVZHuipeyRLvRVbpCxwXDL/LKGYvSLWFknlGO10MJ9cpduoPitD1RXcU44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779536745; c=relaxed/simple;
	bh=++XpE4DxRkMJ6q8Y8KUAHSLoJCNAsNwWWRbIAPuAwMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uPWyl6Pqt6jx3FmWssorEUfJFxXZ5bSQDwMohbuUdxvRryozlxNnZ90BOJmvsUfj1G25/V0S8kwK/VOlGEcCBo6I3W0ky0vJivZZ6c+w1dTKXf4P0dfOHdj7SwFAig6LvZV1Sd+JAFP9y0wORvWvVx/i5YFuPnI4F7l40XmrJ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l/usszjR; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/usszjR"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8b1f2b7f1bcso124118636d6.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 23 May 2026 04:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779536743; x=1780141543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ge3GaYpNMj6fGc6zdoa/x7aqaB3m75rHwBtx6yYd4/U=;
        b=l/usszjRJoh6V9TzW+Sp4QnYeOnfTWVJp2czHen0G4MRn+FdMG6Oj+/RYZ0iOQqLqK
         z/HLMX7SZEHGdNwzEoB5xdKbRGWcGJi9yJOZjkByEr+hEpj1rlLOBod67EbUD7k2GOFF
         QJg+o0jcCBk7x48AwGbpTCS9cMK9aHPiisz1vTpKaWu8mfLouVdtgFDTqWHgD+1v7DUa
         WDN3KSJi05mRiAIHdGLqFxqut0Hpclt+W80Whm3Q7lf9KBFh4zyIa/kKxBBAzTFGpFtU
         j/TqjL2USSgtSAyHM7lSkmKerASMv1VViE/PdhDpJGi6k8Boq+bBNp5VeN6qX1fwuq8B
         cmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779536743; x=1780141543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ge3GaYpNMj6fGc6zdoa/x7aqaB3m75rHwBtx6yYd4/U=;
        b=MoViOuR28M59F9YBAwxT+8cNEutwKyw8HLLRJA7WvF9ezcgBSWGhaq90cNFS6BOpyI
         v2B9seRSi1l91owan+VnDkix1J0ND/jwWIDxLU1ffgo7BrnAB8YKvMuPIvYydPrWqnuP
         hAb9dPEeTUwZg8D2wKk07muxakumaYwAlQ2qMfu3HcfNdfQtTE6WHkQfrgYMZ7oBAhEG
         vm02mk+s1QM+CggRCZ4siIVeon1+NoCMBb2zA5nz5qDACEJewl1EET+Ht1QDIuuAPFRr
         aTyI5YaU4kFzGLcA7aSZXC5i77QrygP9+eukBR+ScG1nSOZrSgNT8/GUoFymkD0wHST3
         gsYg==
X-Forwarded-Encrypted: i=1; AFNElJ9mrPOxnOSqvcOie1NiArwbZwLD8zXZhqlKpIUFE5pgdIspfKlgQgDvoJTOPyNF/lrd24c5V0mL/6FM9L1OH4pP1UZx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Th0XtZEaX+1wZZ5+1maO3naccAWuzF4CPsiy/HkxyBoYtLqj
	S2gwYdrJKn2B6HD9IHqbaYTEH379iX1Zy1h6M/z00poexiyUkwejqp7k
X-Gm-Gg: Acq92OFui73NkeIHCYzkpMr0lUg2fNy/3Xh43AFKgQRJkTOjt5wj4omOBMRXn+4fVWz
	RdsZ1GhsQ4vi/6aEjwYT+n+g6sOqBfktJJk+JRDPk0qoh0Fiyb9/aOCnnhkbLWkyHvw1MNtEfFN
	a9D7LBMDfk3vs6c2fmOBGrSX/TAFrb9KIkiP3v/0TqlV1NRoqqpwI0zJ1NPw6dGWazD9Eutf2x4
	/oA2JdfB7ieZLMzDmaDdwhK6FNp6TwpM0xlcZioQLzwhQsbNJIhpYwCeSLAhTwqpTUyV+OsMT9S
	TU0n5PLABfOrVnzbujBqAxJdAIMhKoOVOhHRr8LeBHnuzZWCMg905rB1c5pDsM4PJaoMHy2Zy1T
	IzaG0QHSqnPALlN0UR0Xxl4hAsC/5qHwf37jRZdfKlKXaDUTLQFChwKhTpVoJUqK0lgvsrStFuJ
	0Fsr7pyG8ZJD3ZsiE/pR3LjDaxVLFWl3GXSBcOK3QZ9Nb4v8mfgdw55U/sLiKAL+kJYSmYdMl2l
	FqJLof1xTzydDeJrt/uZZTabAXeRkroNBF9il5/cQ==
X-Received: by 2002:a05:6214:486:b0:8bd:3440:c024 with SMTP id 6a1803df08f44-8cc6e37fa1emr162893276d6.15.1779536743411;
        Sat, 23 May 2026 04:45:43 -0700 (PDT)
Received: from mobile5 (c-68-48-65-54.hsd1.mi.comcast.net. [68.48.65.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80dcd813sm45294056d6.10.2026.05.23.04.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 04:45:43 -0700 (PDT)
From: Mike Bommarito <michael.bommarito@gmail.com>
To: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
	David E Box <david.e.box@intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86/intel/pmc: rate-limit LTR scale-factor warning
Date: Sat, 23 May 2026 07:45:17 -0400
Message-ID: <20260523114517.101305-1-michael.bommarito@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

convert_ltr_scale() emits an unconditional pr_warn() whenever an LTR row
encoded by hardware has a scale-factor field of 6 or 7 (reserved values
per the PCIe LTR ECN).  The function is called twice per LTR row (snoop
+ non-snoop) by pmc_core_ltr_show(), which is invoked on every read of
/sys/kernel/debug/pmc_core/ltr_show as well as during certain platform
driver activity.

On a Meteor Lake laptop with an Intel AX210 Wi-Fi card, this produces
4-12 "Invalid LTR scale factor." lines per second in dmesg, with no
context to help identify which PMC IP / row carries the bad value.

Switch to pr_warn_once() so the warning still flags the spec violation
once per boot, and include the offending scale value in the message.
Identifying the originating LTR row would require restructuring the
caller's loop to perform the validity check itself; that is left as a
separate change.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Mike Bommarito <michael.bommarito@gmail.com>
---
Tested on Framework Laptop 13 (Intel Core Ultra 5 125H, BIOS 3.06)
running Linux 7.1-rc4 with this patch applied, across multiple boots
over three days.

Excerpt from /var/log/kern.log spanning the kernel switch:

    2026-05-21T08:05:07 mobile5 kernel: intel_pmc_core: Invalid LTR scale factor.
    2026-05-21T08:07:07 mobile5 kernel: message repeated 9 times: [ intel_pmc_core: Invalid LTR scale factor.]
    2026-05-21T10:19:58 mobile5 kernel: intel_pmc_core: Invalid LTR scale factor 7 (only 0-5 are valid per PCIe spec)

The first two lines are stock 7.1-rc4 (10 unrate-limited firings inside
a 2-minute window, no scale value in the message).  The third line is
the patched kernel (single firing per boot, scale value present).

 drivers/platform/x86/intel/pmc/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
index d91e1ab842d6..e5cb70ba5707 100644
--- a/drivers/platform/x86/intel/pmc/core.c
+++ b/drivers/platform/x86/intel/pmc/core.c
@@ -623,7 +623,8 @@ static u32 convert_ltr_scale(u32 val)
 	 * ----------------------------------------------
 	 */
 	if (val > 5) {
-		pr_warn("Invalid LTR scale factor.\n");
+		pr_warn_once("Invalid LTR scale factor %u (only 0-5 are valid per PCIe spec)\n",
+			     val);
 		return 0;
 	}
 
-- 
2.53.0

