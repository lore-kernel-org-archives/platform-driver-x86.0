Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A58B4A4856
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380865; cv=none; b=L+7dQCR2e7FPl4m1+HjLy0pegr9mpzVL8Nt7rmGEo3TW+7VUymNha9CYmdtMsnV/eNSgx8MEHTldxCVlrSISTuoMbkcosc02p6z1eb8RSSETHy4TiWJu7hqE1bnRFRcY/uVJ7DCq5s9nd0Mtcef++cMjxQlJUv13w3NEbUpPno8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380865; c=relaxed/simple;
	bh=ClkXeauB6TZwgoDJxAC3EspeBxlldN1oDp0dORabP58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RDkaQpI1yJsMk7stu8jEK7dTGyk/XcDibrk4YoU0pnJ3ltb0x1S/PZuLASKGR16w4+65Usfewpkfoc+dENSOUAmMjvknh4oFDunfZzfkRRktEnMUDCfjeiKsDvFoi0jRBwbB1e3i8DMpGN5Mtu3lbNE5GRJELHZ6Mho6ozFFngk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f7rhcbyv; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f7rhcbyv"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3516f981835so156152eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380854; x=1791985654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7Pu1XSlwQ74T15/trFdlLLwSkUqfKBFVvVva015Ihg=;
        b=f7rhcbyvbe19T8MTgEwtZG2kyg10TbhWALDxDB8IOzK2DXkUelynXq9iHS/Rm/X7vU
         oQK8cVzRvVPCBr63EaIsDe7J5rF163s2xh1qzPPT/YBPvTnSf5pCtYBHeKzBQOXv7UcA
         +6WynUgnD2oaTN3IIUgyxAeOlYxd0aPX2QO8T5YQYvzLvsW/c8DcpbELV3maSVP//ZnY
         8HclxssV6zTEna73rCbvNYZ6tInrht7QmwjpWrQ/xLitKfUYDzLrdsQLCOvq7Zhvd+i8
         sPrQIjUvGMKEM8RLkFEcL1sH09dKXd3okM1lFSSIQC8mf+dZ+3UKMsaY4RhEo2xFMfjX
         jong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380854; x=1791985654;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y7Pu1XSlwQ74T15/trFdlLLwSkUqfKBFVvVva015Ihg=;
        b=F7xNOgM7WV4sYL4AcEm4cBLyEbSPolj+Ihz74uA74f+dgHUiPK759RFkXlytuWWPOW
         3fAY4vzD9+yaveV/Tn/6CiKhwiyP0KZOE33PzsrzUSTTZXXW4KdNvKwcEqatvDNP75PL
         J2Nb9iYga6mvIkBu6rx9I3kr0Ek273Z6mK1VNI3AvmNM4BQk2FbesK7NSoTq16MbxNP0
         vFV/UpfhGrRS603ODFZfrsguB+mab9wYOxB61EVPB0y1HgQ06x6J77SE8vwpCCBsffxL
         UnAhDH8Ul3lnmlXym1UT2zPEo1aqWQ3vK8y9JyCuU6qKMv51khKzGRcjdookqho2p8qB
         AhSg==
X-Forwarded-Encrypted: i=1; AKwUvBwnFP25zVaQWrw4Icp8c9RmKKvYRstapSTWWmTd1Re4EGHwaGy4NCSzB8UxMHft9Eg1L02ERNJNnXQRyeGKdNcx/del@vger.kernel.org
X-Gm-Message-State: AFq9FYLwt5wznPsjn0V0u7vyHNUDZdg+zypyvYakAlBuIb8YuLFEgtPr
	MfN14GeN7Eogr/J94Wm5UrPogAeDGE/uYtJySrMDN+eqyZybk1mD7W6p
X-Gm-Gg: AYBFou1NWlkGQ9i+CZ4IOvD/+lJJIOerkjwFLS9oM1CgVBF4bqEqbSvsUH4bpwIogsz
	ho1ZKpVWJ1xdTswt1rWmyJxiLnNkHViKSE4yOeutDzYFnQ3lyiCJY0CQJm5HQjST9RFg1Df/vTG
	LMU1H75E28rCQ7CZo8Utykv1rO8E9VnhrMPv1Lipqp2aYMv+0I/akIFb4QO3cnsKhOK/HLckhL8
	v5UwWj2zdc+wbRhzgI3vfg2Zq+BEV4Kc5rpKaubChX3Y0gYXeZJ2sFPEUVG7V/LIiViUC+iKiHn
	ndxYWjw1GBEo7l5r+FmhxaoHXmma1aKek8cT7TnQ+y6viOU6BU7oZPQ/npiJd42tvnjwJwdWqZO
	0cI0x7PMlx0/C92fij6YGu0yCsiB58gqITX5qUoTxVt5kiPSnVjtjTxoRGleeuxjYCeSYrd+Eir
	CpjHqXU+tCJ/yZiP9XD+wMbYktx8z0le3XzvuteCOq2qNuiXhJofXxfb/YJ4BGw210upSV1dF44
	QTXO4SbP5QljTXaYsB7n8DAkkKSEFTi6IFfbv2nweSNSKg=
X-Received: by 2002:a05:693c:809a:b0:351:6b56:6627 with SMTP id 5a478bee46e88-3516b65a983mr865808eec.40.1791380853762;
        Wed, 07 Oct 2026 06:47:33 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:33 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v5 0/9] platform/x86: hp-bioscfg: buffer handling fixes
Date: Wed,  7 Oct 2026 18:47:02 +0500
Message-ID: <20261007134711.473857-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Buffer handling fixes for hp-bioscfg.

Patches 1-2 fix hp_get_string_from_buffer(), 3-5 the password
handling, 6 the single line input check, 7-9 SPM and integer parsing.

Changes in v5:
 - Fix the multi-line comment style in patch 1 (Andy)
 - Reword the changelog of patch 4 (Ilpo)
 - Limit the scan in hp_enforce_single_line_input() to the string
   instead of copying the input past its first NUL in patch 6 (Ilpo)
 - Include array_size.h in patch 7 (Ilpo)
 - Copy the token with kstrndup() in patch 8 (Ilpo)

Changes in v4:
 - Add patches 4-9

Changes in v3:
 - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
   and declarations (Andy)
 - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
 - Drop a blank line in the declarations in patch 1 (Andy)

Changes in v2:
 - Split the hp_get_string_from_buffer() fix in two (Ilpo)
 - Drop the lib/string_helpers patch, use @only of string_escape_mem()
   instead (Andy)
 - Add patch 3

Muhammad Bilal (9):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
  platform/x86: hp-bioscfg: allow clearing current_password
  platform/x86: hp-bioscfg: fix off-by-one in password length check
  platform/x86: hp-bioscfg: fix heap OOB in
    hp_enforce_single_line_input()
  platform/x86: hp-bioscfg: validate SPM state returned by firmware
  platform/x86: hp-bioscfg: NUL-terminate the SPM auth token
  platform/x86: hp-bioscfg: fix oops on short integer attribute buffer

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 82 ++++++-------------
 .../x86/hp/hp-bioscfg/int-attributes.c        |  7 +-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  | 18 ++--
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     |  9 +-
 4 files changed, 53 insertions(+), 63 deletions(-)

-- 
2.55.0

