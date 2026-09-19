Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CB3375ADF
	for <platform-driver-x86@vger.kernel.org>; Sat, 19 Sep 2026 06:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798283; cv=none; b=SjUCshzjAJp8MehWEwyq5pV3sLdGy0GLm9tG735c877ryQG0AbiptuxcD2K0Ylfiqa//bUVjfl21W+7HsbZb2k+kcSJoULxnufIi5GRF+10/Hz/Pfdw5y49XkvzOQnBhW34DsR8yyhhutQC+V/bLho9q/8Hn1knP33puwcmZjbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798283; c=relaxed/simple;
	bh=lwcvsGM7dkF7romeMnX3Ds75/0ZlM0UvamxerXT9LbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jc5jQgPzSg2+hMbpVtEVdkIsHhp0Z2Mi/R+KJfWrfA/gmj/IIRgiRvZ6exv5VnVZsVR3SNDvy7vqALY7BuGEUCBlop7UHFjjimAGYAnes0/MJ0rROZnVZDnApifYjRbFsgGwBMMiEkezd3NfRiVvDS4C25mfJaOtsITvjz0m9Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uh6Atq+H; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uh6Atq+H"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso11741125e9.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Sep 2026 23:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789798280; x=1790403080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wzv5spbilUO1qSlslWoXOyl5RLYwHziQsHbiWKOWqZ0=;
        b=Uh6Atq+HTmmPQ8WVekaEkCIekTTuRWPtOpnha3hf2CkpKiIGzivqKtbYwUegyZWNct
         LkFtvu/85nlr2r1+D1steBNiVBU0KW3S8mMmPgl4b7fB+RVVULF9/IK+8BOelZvB/bT1
         U5ZjlUBEaUclJKxwBgm8W1FxCdnHOjaqFEsu0t42jlrXuthmr21q88jHgnstb/n/hfmB
         LSIyuKQz2P/n3BiZINOb63bUHTksrqs72ECXZ5bdrtXqSxqLSGZmEFnDyEfEQVjFyj4c
         GN++ech6YB2l4GtQj1+j7RSoS5keexlycup7R+xjG/w2DmYIngW1mWdFLo2FHMEhg13W
         PHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789798280; x=1790403080;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wzv5spbilUO1qSlslWoXOyl5RLYwHziQsHbiWKOWqZ0=;
        b=eq8mO+2+YDc/7zC8JYu2medeQP/LDrvuQIOmVu0vbe/zfJEPX3gSs1sKyXOtDCEyKI
         IMWt6m4vYic/d4P5mPT09QJlj1XSyl6960MwEdqhnrXNGUftTdlclHevZu9/DNBLjBc9
         eR+zQe+w+mcLjeVaBG3R15RGND49UniZaIYo00m6+QvsqH8fR10lYoii8zk/gfioGcLe
         9HuoxHF+7C7AygFQrP7rjY4+/0mHNIemk9EX7DMobTkgwCxvBDoIIm1BC7Hao0i98FhP
         YdpgRmSlFV1pCBdIpciV5wFplox0xl5+BeoDVl87i2fFFSzQb2PG5KURgneeSQ67DEj6
         cypw==
X-Forwarded-Encrypted: i=1; AKwUvBykGzqP4/XfjR4YHYwzs92670Q4tMH8mz+k/HKtHqeMyJq7MojZnKUnnGTgmijFSayuAwek0q6i74GMeWPGW2uNg8BT@vger.kernel.org
X-Gm-Message-State: AFuF++naXxHtTnKsYMSLRo2L0EEkQu0St3jB4fmNX+Q+NY0jsufQYqVr
	O2a4lGJV/N8CT7cTqrxuBZnaNQCrVtJf4kwIvNrfPWWYPyGGlxF72Dm/
X-Gm-Gg: AYBFou2goX/Qxd7hsm4D8dIHXKCPce5aVm7tK2PBqgTHje0besZ/eaBJ77FOl9c09mB
	3nLFY3S3asEI+j1B8PEs+y/F/ijovk0g6vGzMpyBoOaLh1VQI0bOc+os8YOB38FUd/tMHuiTpbG
	TLbEd6cc3D+wHhyZdn5IsAGimjN+y3BeibB2IJ5wU0pNWplLeDRRklfchDnzN3O4+NnnI8reWR5
	Q+01l7Paknl/dnY3Gk3xCkjB4YgHyvOP6eDYbno2DMkLpdnFTXrh0nJCpOBujSGy4efp6W99Wnj
	97p0D/2HH0odGSzJoCV1nAt2wQ37sART4+P2kJQrtBXOdh7TJ96LkjDWlEIOWQNRdZg9YyOVHLJ
	zoimdqUsjAo/pVwabow+n0m0LTuGFdubCzSyee4apN9WbFVeusHq4oRUvJrk3unvwOtUeUutcXB
	Mb3bkXp5oEzZ4V41OQngYyMQ/oFJHamuB5SN65LBOuZLHdFNhyY2TElAiukV2O5nf1yHOk12lnx
	MokogwdX2S4O5KryVZSLocJbnopEYm31zKNMwAu+cLoCjPrXMiX
X-Received: by 2002:a05:600c:6211:b0:49c:fa20:cbfb with SMTP id 5b1f17b1804b1-49fc5728f84mr58855245e9.18.1789798280343;
        Fri, 18 Sep 2026 23:11:20 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd1026f4sm52016675e9.8.2026.09.18.23.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 23:11:19 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3] platform/x86: hp-bioscfg: remove dead bounds check in audit_log_entries_show
Date: Sat, 19 Sep 2026 11:11:08 +0500
Message-ID: <20260919061108.87240-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
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
Resending v3 2/2 unchanged: the previous attempt reached the list with
a corrupted hunk (header/diffstat didn't match the body), which is
what "patch: **** malformed patch at line 65" was. No content change
from the previous v3, this is a clean re-generation of the same diff.

Changes in v3:
  - Remove the dead inner loop check completely instead of adjusting
    the boundary arithmetic, as noted by Ilpo Järvinen.
  - Remove the redundant else block after break.

Changes in v2:
  - None for this patch; resubmitted as part of the v2 series.

Link: https://lore.kernel.org/r/20260803143037.93105-1-meatuni001@gmail.com [v1]
Link: https://lore.kernel.org/r/20260812111829.172273-1-meatuni001@gmail.com [v2]
---
 .../x86/hp/hp-bioscfg/surestart-attributes.c   | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
index b57e42f..d689ee8 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -90,17 +90,15 @@ static ssize_t audit_log_entries_show(struct kobject *kobj,
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

