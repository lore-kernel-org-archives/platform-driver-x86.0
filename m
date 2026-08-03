Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EC930FF30
	for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2026 14:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767455; cv=none; b=DFd/BnrxNpbeiHCTfEL0GTszjXypJO3Dw746TEwN9+mTLO56vLG09Z0lNwdaEpMpcTXLWcNrOlTgqfXKndtBGQLy1WCackT/QWrT0+l4m6jU7+N9KguQ1aBJAgQPwlIuSfD8OnHIGkmM0qRCKKbckEDOdr1i9rYvr7Yg8YKN2y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767455; c=relaxed/simple;
	bh=Q0pW4+satZfIqKx0mBryuqZBjn2UN7dJ4LdA64/mtGg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dWMbz4ZwB/C0uvxv4OR7/9DkylXQrOGrmWcutRE59HcobyKtH/cvmDwRPD9K5i35DHbeO0C6ymGuEUodzHd4yjokKvcnJXakgXJ7Yo2aICkn2IbUypB9ODUsLGRsn17/PXtrzGpTbRjCpDkQF1Xz1MpFdO1+MgZyzWB4SmmDiLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPDu+n6J; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPDu+n6J"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49558ce01afso17149335e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2026 07:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767449; x=1786372249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RnLNKI0WhTuw3EJr1fdqDAe3jF7MiaCdXfP1m9k0dKE=;
        b=XPDu+n6JBihBJgjt2FYsMCLXTFBM5LFfQ+yzFU7LfBHwfspN4ZH3fKSt2UtWODxp7e
         pEFA6OCOGYUVDreKHTp0RrwFZp5loEta9xUuykKHK3Q/MMvicaza9aSFQTSfDcxjZNiY
         n0PNsklKCDBwJOl/5f/1pDl5LzAx59tgX0BYTDGjEwSPKtVtcZcDY+oyCmMCyUatL0Ps
         ruG1HBmg1OuvTMlo3yA4dHT8nCERCIYxe3vD8YSnta2WKIE7JiPRzPRYmlM5a9uYA4yN
         rc2cJWkPUf9eTscEbdI4BJ57b6T2oNzUDe7h5g8Vcae/82srIoPTd/bLAN6NYq1bQZn5
         ToaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767449; x=1786372249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RnLNKI0WhTuw3EJr1fdqDAe3jF7MiaCdXfP1m9k0dKE=;
        b=JXCLvg0i6cbQU6nJlvkkh/qiGMDxsEEQPZr9Fc2QeynwiDHk7PY7OTCrUULQj8PkGg
         gBzrBpf4L4XGIvEtiTtTwRtzBO0JpWzbuDUInVugn8zGV77L30eIwjIGT2JxMZLxHDaI
         dQS+chkSI6iLCqmYTiHkl4xdxGo0XLpvb4/2Mx7wFvkObuN/wPXw6zxvlw8ZVEg57njz
         9nXkfUqxICFUEriSmZ/ryN01pmHUG+14hDLMPWu+5xvJh/Teea3R4h/1lzTmw79/f9+T
         s0jqx4Mb/JrqYe6JA4yGVuX3+51tW+nvoC46OdxxoDkybTcQ+GLOETHRo31gM//2b+f6
         v7Gw==
X-Gm-Message-State: AOJu0Yz0ZMCo4svise8pNBQ6H1tvOtnmCwcxAMTw7OSVTitoY4N4bGKt
	IK92GledKNZes3f7x1kRuhhwUdIJfOe8Ipb+wiuLG8zYW7GfMw7//LnZSCIi0YKfjq8=
X-Gm-Gg: AR+sD10YkrEJXFS4u3tdsEkVWt194H1YZGKZB/GGjmIvibhaPAalhGj3C0ejYB5n/0y
	BIhWEIOGMdfC94v5Qnu6jQrkHpoTLdtRjmiegB7zbR7JIxH+JiJHDt16Ky/Z1GiHn+JhXJOv6AY
	2ayUN0NB8RCVd5kza/Id0En0TcQjp6mix76H6cPWpAfJuZDrnQYXRar04i2MZiO8xXN3+noqZrY
	uH+riq1pM4A5BuFJ423D5y6T/2mHxJC+FCKaPBy+YzunSdkWc5KAGf73ki+AcaTpf4pKVgHX1ob
	6YR9lvGpC6PAYsj88OUG3iJMubQ0C+P/HfFmiwDX7EfH0Zl7eUgpW1iPZqupaaHLRk3+iAOtyV2
	UaYmXjXR06HXf9wMm8PH7Ug8e2iydmf/Twk0Q4i6kJu4qMvqccD4QZWU62+++tzFHE8APFYcH4A
	9X2fjnPwe7xSGBkZ6uG2lEeESNH0AAQ2HAIIVU3v4vYbZ4xLITapkEZlzlqMWhwtdusp4J+HKFr
	BExh8puXf/Eln2LjeXxo+405Ow54Pg7Xj3ND4LWEg==
X-Received: by 2002:a05:600c:c055:b0:498:702:8b81 with SMTP id 5b1f17b1804b1-4980c67639cmr143886565e9.16.1785767449156;
        Mon, 03 Aug 2026 07:30:49 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b98284sm236575295e9.12.2026.08.03.07.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:30:48 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	meatuni001@gmail.com
Subject: [PATCH 00/13] platform/x86: hp-bioscfg: fix multiple memory safety bugs and parsing errors
Date: Mon,  3 Aug 2026 19:30:23 +0500
Message-ID: <20260803143037.93105-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes several bugs in the hp-bioscfg driver:

1. Memory safety issues (patches 1-6):
   - Off-by-one NUL terminator write in hp_get_string_from_buffer()
   - Heap OOB read in sk_store()/kek_store() when passing original count
     instead of trimmed length to hp_wmi_perform_query()
   - Heap OOB read on empty password write in validate_password_input()
   - 16-byte heap overflow in hp_calculate_security_buffer() for empty
     authentication tokens
   - Off-by-one heap OOB write in audit_log_entries_show() when more
     than 256 log entries are reported
   - Missing bounds check in the PSWD_ENCODINGS parsing loop

2. Logic bugs (patches 7-8):
   - new_password_store() incorrectly passing is_current=true, causing
     writes to land in current_password instead
   - ORD_LIST_ELEMENTS case using a stale NULL str_value pointer
     instead of converting the current ACPI element directly

3. ACPI package element index tracking (patches 9-13):
   - Five attribute-type parsers (enum, int, string, order-list, passwd)
     all share the same defect: multi-element array cases
     (PREREQUISITES, ENUM_POSSIBLE_VALUES, PSWD_ENCODINGS) consume
     "size" consecutive elements but the outer loop only advances by
     one, causing the next iteration to misread a leftover array entry
     as the next property and abort with -EIO

Tested on HP EliteBook 840 G2 (BIOS M71 Ver. 01.31), kernel 7.2.0-rc5+,
with CONFIG_KASAN_GENERIC=y and CONFIG_SLUB_DEBUG=y.

This series applies on top of:
  commit ea4d8f8ba283 ("platform/x86: hp-bioscfg: fix
  slab-out-of-bounds write in hp_convert_hexstr_to_str")

Muhammad Bilal (13):
  platform/x86: hp-bioscfg: fix off-by-one write in
    hp_get_string_from_buffer
  platform/x86: hp-bioscfg: fix heap OOB read in sk_store and kek_store
  platform/x86: hp-bioscfg: fix heap OOB read on empty password write
  platform/x86: hp-bioscfg: fix 16-byte heap overflow for empty auth
    token
  platform/x86: hp-bioscfg: fix off-by-one heap OOB write in
    audit_log_entries_show
  platform/x86: hp-bioscfg: add missing bounds check in PSWD_ENCODINGS
    loop
  platform/x86: hp-bioscfg: fix new_password_store overwriting
    current_password
  platform/x86: hp-bioscfg: fix ORD_LIST_ELEMENTS never being parsed
  platform/x86: hp-bioscfg: advance elem past consumed array elements in
    enum-attributes
  platform/x86: hp-bioscfg: advance elem past consumed array elements in
    int-attributes
  platform/x86: hp-bioscfg: advance elem past consumed array elements in
    string-attributes
  platform/x86: hp-bioscfg: advance elem past consumed array elements in
    order-list-attributes
  platform/x86: hp-bioscfg: advance elem past consumed array elements in
    passwdobj-attributes

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c        |  2 +-
 .../platform/x86/hp/hp-bioscfg/enum-attributes.c    |  4 ++++
 drivers/platform/x86/hp/hp-bioscfg/int-attributes.c |  2 ++
 .../x86/hp/hp-bioscfg/order-list-attributes.c       |  6 +++++-
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c        | 13 +++++++++++--
 .../platform/x86/hp/hp-bioscfg/spmobj-attributes.c  |  6 +++---
 .../platform/x86/hp/hp-bioscfg/string-attributes.c  |  2 ++
 .../x86/hp/hp-bioscfg/surestart-attributes.c        |  2 +-
 8 files changed, 29 insertions(+), 8 deletions(-)

-- 
2.55.0

