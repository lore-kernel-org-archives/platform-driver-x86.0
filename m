Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC84398F1
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533534; cv=none; b=Td+u5xUa1ZbA+wYIrFlIoerNvhiWlrtAKcjwaV8aZTtdRUJsnrLfx7fHCCvUeeWIXrpG9DjGN2LeaORao5ZqIQhNFltwuz6HB5dL8xgfFE0YXwXrxowv1GUdi+wsbnNHqHtlufaQa7J0p7Tja5qo7zGcPeYAkJ37SsHG84O3Qhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533534; c=relaxed/simple;
	bh=rhV+qOT/cedymAeQ3DQaL+LQcUHG8piPrtIkVunzAvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ftQdmucm9nvyw+G7sXY2u/TuObnpPc1g1a/ndlbpTwtXff7WlUDxUk23N2crJWYi3ZGRy5RBLLi3Lm0oWRZgkdg2rFFmmNaNGrcrcCjtMu1bu9n5XO4xG0YDqimWUnM/a75fc6tg8Wqt+XqoUM1Zx+sSzhirt6BGkgAySuwbkUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=El+bs9Sm; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="El+bs9Sm"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49553515a8bso12057935e9.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533530; x=1787138330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hNoDrCXm49lLgm2lL6InxDz3MAxyPtaZVFbbdYtrWx4=;
        b=El+bs9SmlR5VflEY64GBmIIQXIbymJJyrUbkoKgDXdttek2k9NrNJ5kx/71CgaEPR6
         zssv7Isd40wJNSNdFUzyZ8paFQuvU92g0xbLSrzWkLbQXXAgDwLMdUrouGCms1ZYbbUC
         9vyId+qBqtrq4oyWvlZxNL1dXWW+mZSOOJZ7A7GozfrPKNwW34OD1t517kqocku3bz3Y
         6gvIrWQscbjKJGXINXkx0GwprlqNZOpl5+s7hTX9XK/tuvMWx438UzC1H0DJG8R+TSOO
         FtPCAkP99Y1MULZ0AW/kezwl+VPKSQrAxfgG+sVlIUsyjZe9pv9XAQn/ms6f1xy8nz9C
         t0Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533530; x=1787138330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hNoDrCXm49lLgm2lL6InxDz3MAxyPtaZVFbbdYtrWx4=;
        b=ORtd9FHzchr2r6VIw01ypcPWJGO1C2kQEBXd+OzFvncrrlrv0dkHoxr9TgsylwBBqj
         qW1Z+WttnYEuq17x7tcCHla9kL6gNRS2xcBxsFk5Wcu7vbyYvzjQ7rINByi0tqumpU+P
         6oGl/QYCrFwNYWgjzyGWS+a3a9qraOJTWcouq5rnuUzUTchVBOIyz9crAvXGk+tllzqn
         e+VH0NOgvHv9CAHli5Vj6WD6xiFZTbZjBoC3jtG6fuJ3zwC29LVJPxUIwHA4YQBi9L7m
         /CDqwTvBMgq8/U29R+MHhs004u5fV5xardsqKuKEbrwf0jQxve0bZ6ebLJvycf9YnmiX
         a8wA==
X-Gm-Message-State: AOJu0YwaKo/lhjkweQQm9Zn6c3RcBrS/1CLnPHIcrjyo/4DaxxJe/vQC
	vzbNND0uSjjKmhp2N1chZN870jE8VvN85V6i53hSCJunF4Z/6/zwp6k7gG3cnczk
X-Gm-Gg: AR+sD100uBZZkCsY1j59ue45KAKpMgpuuE3kUc5VR8OqwmPW0//zC543Cfy4qHmWDlB
	NRw6dzEe556bhyr/Q1z0baAgDsgc9xIWUO4x+hwz4X8xq7elBo0BCE6RBGKHjhgDPHoi/7hK1uV
	o+fqA258a7aUp/E+W076QyYlwbUIVsmUOf0FuI0iyxAZTdZ0AytqH5bn86tN5tYH99c8Uq4c/zH
	aUrHvne4Qk1ICXmfu+0kTAxyZYYOxR4aDWdr9CnQ1TSIgOathoNbxgwzXRfQq6ICo0wH8TWr017
	h8UrQzcTWnnqU+IoM8iP7fZqPjIGW9eZXahU7Odm+pLRN7nX6lYr/D2ieUO9P/54paiFy3YcCWS
	+zypWT7fGAYBfuLhIO/zHbBQ+iVIq6CE/ShepvfaOoCu+JsCE2SQXUgdO/q0dpu3Isj47cMrMms
	BF2Y0yuYwkLCYBA+xHoE8KiWSR90fn5Mp1bx8l4+ZOXWsqnSKyu+h6BICBGMAupRP+z9BXFvpW0
	EmhqkbTv+OKVDfLkz5XquyTvUW8GPY32aqaxhxF/A==
X-Received: by 2002:a05:600c:8209:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-4997c139b0bmr62363425e9.12.1786533530450;
        Wed, 12 Aug 2026 04:18:50 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:50 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 6/9] platform/x86: hp-bioscfg: add missing bounds check in PSWD_ENCODINGS loop
Date: Wed, 12 Aug 2026 16:18:26 +0500
Message-ID: <20260812111829.172273-7-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812111829.172273-1-meatuni001@gmail.com>
References: <20260812111829.172273-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PREREQUISITES loop earlier in the same function checks
"elem + reqs" against password_obj_count before indexing the ACPI
package element array:

	if (elem + reqs >= password_obj_count) {
		pr_err("Error elem-objects package is too small\n");
		return -EINVAL;
	}

The PSWD_ENCODINGS loop performs the identical indexing pattern,
password_obj[elem + pos_values], with no equivalent check, causing an
out-of-bounds read of the package element array whenever
encodings_size is larger than the number of elements actually present.

Fix by adding the same bounds check, matching PREREQUISITES.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 86fa03a5ee9a..acb123985ede 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -351,6 +351,11 @@ static int hp_populate_password_elements_from_package(union acpi_object *passwor
 		case PSWD_ENCODINGS:
 			size = min_t(u32, password_data->encodings_size, MAX_ENCODINGS_SIZE);
 			for (pos_values = 0; pos_values < size; pos_values++) {
+				if (elem + pos_values >= password_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
 				ret = hp_convert_hexstr_to_str(password_obj[elem + pos_values].string.pointer,
 							       password_obj[elem + pos_values].string.length,
 							       &str_value, &value_len);
-- 
2.55.0

