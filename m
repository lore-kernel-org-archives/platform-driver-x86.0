Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0590E419315
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767476; cv=none; b=jwVOJGMCbbe5L3B5F5+WtnbaMAVzV5Za9g4OuQuGmbtNOC46a8idxyoBNsfSpPjcBVg88wnyxFDAk0IwMxaEjBoWAFdPZR6tMxokdSLSEg0qQpsh3cW5cxUYmE4JWRgttbmSJgnNEia6Y2H1l3k9E3PkkFXhxKSwG2ctafESrqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767476; c=relaxed/simple;
	bh=ZqVUWs3x1BgozxV3FrsSk7Lzh34dxSnwsmeX8ZrIYuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d2K/k/NiCBh4XFItvaJWH9+YGZX0g52GevEIQaU5cr+48Z4dQsXCwVq+MoJLUUaCVhrIl96psGWL2DHkH+UGcKyTwYv5/7+XOAwKUtQ4a21w+OAcZVeVHnla9WGbTCNn9jtDTwO1jwKyKCks9dGvVlMBcoGF52e3FRoOnGewrfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crzuaqhD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crzuaqhD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4956869750eso13723165e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767472; x=1786372272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGNNvpeBB2xFe8o+eAG+ITw+sBusoz0y2d8gJ/h4GCc=;
        b=crzuaqhD32tZylx5ndKwb6IvjJedmiZyrqlIP1NEQd0Q2lhDGUq34CcdY0i+LD7TdO
         HHlZ9I98cXfpHCGcVy0YqK13gDli1Hl1ObqaMxcztzMAVS2LRBQM5uskuNKJHRLp8j3W
         xCpovROFnXhsW172TcDfbR2shveaZc+U91lRkAtOO4I1JTTvJVC9oEA8ZHKdXFxo+JkI
         4cezzWvEfb/fq69sa09DQaQ6vSvL9rkYZgk9GUNvUHL1GkTiGzruofIqlHKhgnaaH+qW
         sd7sZCzVk/KbWWf4YQu/cFcTz6Bl1rO2bo1YuyoMUawUUC08AH3IZaAJ8W0YCdxTngAn
         LJLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767472; x=1786372272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGNNvpeBB2xFe8o+eAG+ITw+sBusoz0y2d8gJ/h4GCc=;
        b=RKrY8Ztz+PboIn5z0bPrTL06xP1QAHhkvuaoR1gsjgPaXR8ge9SoPBoFxoaLVTztx0
         Tfnfn3tXdl05CSvfDuwrc9Fbu8vw4kTnzfzq6UOiZtU5vTBq7B7M9y2V+FivCd1s+E3m
         iyljp8c5NG/68J6PMbAwkINmpnSiBaHdNKUZoCCOUZLcIY1pZSX7Iah7yu6dhgJodE57
         uGAHKnGBLmCuGrL4aSEiTnTNxfnYdqyEyfZ153jJOwCmtwzHU122bjFOkWU3/L7AEXpA
         ku1bm9BY5pYgWHVYgnlS5GXyNn+m7lWM+y547rTxO5mzVxWCFYBZOC0AmcX2LfsxI/bX
         Jx5Q==
X-Gm-Message-State: AOJu0Yzn72a67gqR0eVh1Um7qUtUBOVTdy6H2Fesp5R8vh8wX0qOD6VE
	cFJ667lY1ZGcZcLB+6e4YtNUEgFr54xJZuHr8jjjr23ku5p/JyMbZwVbEx1NntMptx0=
X-Gm-Gg: AR+sD13AK0qSjSdVsT35Ewe97fRX3xpQ62a5m8Gex6LUI90IZkt7IX4uXx+JYZIQK12
	6zhD43jJ7OtGfiT4NMvEDtawfiyLYMv3iKpRINAswLFVjqa9z+A7LpVRNFuff5HoHO4uX9lh65c
	XKIMMEYYOG7gM3uKkSQRwwUt3NVotutMHyfNvdt26FeVi84j1pNx2TKokdnJDtcreTvmTCyYQw0
	KoMSdlvozelPKYEKxnheTZEhU/MPwHAcW6ZPrMgvV5Ebq9QC294Sc0eOr4GncxtGy6qKtZbxrz7
	f9AptsZX6IIarAb/N9nxMyKPBUNtYtNM8Qf2oHFs5MmUphDcX/c3Zgy29De8CwUwR/z2VfzAuc4
	A54aLuD1CbBqolH3eZ158I/MTrOywN+aaeQld7sxyo2obomTrN/yO5SheBJ+CiYnm1BjqsXRr27
	7L4+MQdmVlbc/buGMzSM4HEXnfBoiLDWne4he/iQmzVWIi7ZAK1aaJY7Upw3gTR5URBdHX8oK+j
	DcERru07AhqYAYLNUPDxLxkRFcnmlDKT26opAcIpg==
X-Received: by 2002:a05:600c:a47:b0:498:1371:6612 with SMTP id 5b1f17b1804b1-49813716987mr143983415e9.6.1785767472196;
        Mon, 03 Aug 2026 07:31:12 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:31:11 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 08/13] platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
Date: Mon,  3 Aug 2026 19:30:31 +0500
Message-ID: <20260803143037.93105-9-meatuni001@gmail.com>
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

The ACPI_TYPE_STRING case explicitly skips the string conversion for
elem == ORD_LIST_ELEMENTS:

	if (elem != PREREQUISITES && elem != ORD_LIST_ELEMENTS) {
		ret = hp_convert_hexstr_to_str(..., &str_value, &value_len);
		if (ret)
			continue;
	}

so by the time the ORD_LIST_ELEMENTS case in the eloc switch runs,
str_value is NULL (it was freed and reset to NULL at the end of the
previous iteration). That case then does:

	ret = hp_convert_hexstr_to_str(str_value, value_len, &tmpstr, &tmp_len);

hp_convert_hexstr_to_str() rejects a NULL input with -EINVAL, which
sends this function to exit_list, and exit_list unconditionally
returns 0. The net effect is that any ordered-list attribute with
elements present silently ends up with an empty elements list, with no
error surfaced anywhere.

Fix by converting the current element directly, order_obj[elem], the
same way the PREREQUISITES case already handles its own array
elements, instead of reusing the unrelated str_value/value_len left
over from earlier processing.

Fixes: 4b2672ec71a3 ("platform/x86: hp-bioscfg: order-list-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
index f09489a085c8..704c69c18146 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/order-list-attributes.c
@@ -261,7 +261,9 @@ static int hp_populate_ordered_list_elements_from_package(union acpi_object *ord
 			 * Ordered list data is stored in hex and comma separated format
 			 * Convert the data and split it to show each element
 			 */
-			ret = hp_convert_hexstr_to_str(str_value, value_len, &tmpstr, &tmp_len);
+			ret = hp_convert_hexstr_to_str(order_obj[elem].string.pointer,
+						       order_obj[elem].string.length,
+						       &tmpstr, &tmp_len);
 			if (ret)
 				goto exit_list;
 
-- 
2.55.0

