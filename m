Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3374D411A0B
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767482; cv=none; b=MHmUo3Y5vIi9N0q/9t+x1gOOFR5Ss9QCDXBMUb/F3VmCv2s4MSQRVQ1x6+U2PdDIInFENU79331prrXAQlM6b+PEyWiwlUGYYuhVOjG70HDgyZkMpynV9eT3IUx0Nv+C9PoOoJKDAzR+EZxxkekIfegK5bsFKhDbw2BiCVoKLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767482; c=relaxed/simple;
	bh=aPETE3o1r0HQZA9wDBA5bpXSmM050p/rQxyZ/Pt3L2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5HLfgU1P8z/zLQBqWfzQfnDtPo7y+jEY+oVtU+QyTqNScajVT0n3sFypG7BXhGPDlIniNZCMqeb9TygkEsft8Jb/2ywGPevSh9oIFC93p0GCIgMzzmeYMw4nW85ocnS1ZhFJGwmOGdFYTDBaH05b7vYy2/ayynY8Op9J/qxqjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SO9oVCpM; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SO9oVCpM"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-493f6de72faso15546575e9.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767477; x=1786372277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I5CCpAh+m8Fx6ANrpP0jbYMsqCo/QP0tlHJ61+yZOVU=;
        b=SO9oVCpMeQguxxIa7MiRXp4c3nPHW255XH42M41WT9dEgHK3ATVNKn5ZmPCoyJ8uXq
         Y1AmMfEDRq9UcFMCoTga5OlmQD9nJKP+ClvI3BMP+8w9wdzmdi29qx1u9bOUXg8eNlOi
         bKGIVHgM9XyAwbELlpROyPAOlIVghdxEV7LYqsvzdLivbdSImmzSX2Jg+oj6S1lBCM6Z
         uE+ma7uVFXOk/dm1agvyrjCEU5uf8vYONW5//HjfEUZTOXv6a77qS632FoQE+UyrzlEg
         i7oAfQoijAUj/mKVo2wyRPKTJZDv4qtGqVJvgmHrvUE/oQayHhW27n1S2J8KXMW1P1NA
         rA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767477; x=1786372277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I5CCpAh+m8Fx6ANrpP0jbYMsqCo/QP0tlHJ61+yZOVU=;
        b=D1TABAneK+lQeKtsx0wEb0VzTOxuL0xklRuS3cOkeB7qEBTPh3fQQoiSoCT3BtpjXt
         QSNZrx3tGPJUIj1M+W4eBS8xaGnuPbD3t23MkO1O4ut6gWZpWP6kw1FrLTy1hX8/yUdw
         OhU6xloURWiL16w4a0Bd65ycDCWf2RX3awRUIxtd9lw4hSuHzYIpYiBgtNz2CAXxtMz1
         f31sVwBjZj75fjSlIuBXoSRgl94yrq+A/QYyVPPW+BeDaiWaW684NsU9uOF8y5VmlIDC
         1dWKzeY+PGaBJR7YZTQUF98ae/5ms63Tq5O/wCuVOcI9ZmU7EKQF+cQBQVNoJPREQCmG
         GfxQ==
X-Gm-Message-State: AOJu0YwIbVgQeJAuEILKWE4l6ljB3W1ONjY2ogLh+BcC6s0++4c7ah8i
	x70WNAr24S1Xg8bl0EFkGKBM+cDIDTSPErKwXWKPMtVaqchX0fqIcEISV9ms1V/v4R0=
X-Gm-Gg: AR+sD12IgK90CkVaAL/Q9xi/OQKh2zBjWDOLueKx2pJZluWoekIjRrf7xMJJdH0hCaR
	zY083tliVtc3L8jLvOCyoQpIHbc2QxKHdTm/TlUok9R4JFTfjWsI7JcyBSD+NQus/d9aAmrrJEc
	uL9ZxCjIFqH8zTK7Pe0YDJqskMDtfr5CvDTb05VEJ9bcuZmvPpUHtef4zaWzSK5uET0V1edfs9x
	4qyjB2LF1FXMJxDrxMNn2rHUgAWtMXcodzalog8gHSaSBgnMHhZAc/G5rAIovFQ9xmgdf3h1zzA
	KdUgVDYkTjH4VoLrBFj4rjgT43E12Yo/prg70JaiH5DcGZrYxFenj9+IL2pOswKyXllc7YWqZlV
	hMKXJ8VEW0tPHBEt+a8o5R/jP+c9wzIFBrKK0GflS9jVaJymLiKzv4tYxYqxnG1jeGthuJH39Wb
	YDXdFIg6p6EceJipxLnYda8CSuOM5HoormIyRN/VYinZcwJ0tLkQNeoVtH41Yuu3nj89D/z9l5G
	P9KXb7y5KfHqdikXeiHtLRzBbquJPw4eUFw9+vlYA==
X-Received: by 2002:a05:600c:46c3:b0:494:1f7:8057 with SMTP id 5b1f17b1804b1-4980eb8d081mr174789585e9.1.1785767476532;
        Mon, 03 Aug 2026 07:31:16 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:15 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 09/13] platform/x86: hp-bioscfg: advance elem past consumed array elements in enum-attributes
Date: Mon,  3 Aug 2026 19:30:32 +0500
Message-ID: <20260803143037.93105-10-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803143037.93105-1-meatuni001@gmail.com>
References: <20260803143037.93105-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The outer parsing loop advances "elem" (the index into the ACPI
package's element array) by exactly one per iteration:

	for (elem = 1, eloc = 1; elem < enum_obj_count; elem++, eloc++) {

but the PREREQUISITES and ENUM_POSSIBLE_VALUES cases each consume
"size" consecutive elements (elem, elem + 1, ..., elem + size - 1) to
populate an array, without adjusting "elem" to account for the extra
elements consumed beyond the first. The next outer iteration then
re-reads a leftover element from the array just consumed instead of
the next real property, and the type check against
expected_enum_types[eloc] fails on that stale element, aborting the
parse with -EIO.

This produces exactly the failure visible in dmesg on the test
hardware, on every boot:

  Error expected type 2 for elem 13, but got type 1 instead
  hp_bioscfg: Returned error 0x3, "Invalid command value/Feature not
  supported"

Note: this exact message string is shared by more than one file in
this driver (see the companion patches to int-attributes.c,
string-attributes.c, order-list-attributes.c, and
passwdobj-attributes.c in this series, which fix the identical
pattern), so this dmesg line cannot be attributed to this file alone
without further instrumentation; it is included here as evidence that
this class of bug is live and reachable on real hardware, not as
proof this specific instance is the one firing.

Fix by advancing "elem" by (size - 1) after each of the two loops, so
the outer loop's own "elem++" lands on the correct next element.
"eloc" is intentionally left alone, it indexes the logical property
schema (expected_enum_types[]), not the physical element array, and
each of PREREQUISITES/ENUM_POSSIBLE_VALUES is still exactly one
logical property regardless of how many physical elements it spans.

Fixes: 6b2770bfd6f9 ("platform/x86: hp-bioscfg: enum-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
index af4d1920d488..43beb639051e 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -227,6 +227,8 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += size - 1;
 			break;
 
 		case SECURITY_LEVEL:
@@ -280,6 +282,8 @@ static int hp_populate_enumeration_elements_from_package(union acpi_object *enum
 				kfree(str_value);
 				str_value = NULL;
 			}
+			if (size)
+				elem += (size < MAX_VALUES_SIZE ? size : MAX_VALUES_SIZE) - 1;
 			break;
 		default:
 			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
-- 
2.55.0

