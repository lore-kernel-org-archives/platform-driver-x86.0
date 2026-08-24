Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2DD395ACF
	for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 22:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787612206; cv=none; b=NATpgMOboEdHR838he6vIS152+IK9LEbAYUa+Dq01/CI8XxdE/Vs1D4rauVbmxwCdgjAm+Od/DXC76bU8R2lR6pUCYGNUMobOBH30QseJJyP1Oe5SiyBfU5ETxGbEdB0Prsd6dr0Cnfb0VJiFiqpZnKsHWjaFFn8KNTrxu6sofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787612206; c=relaxed/simple;
	bh=bZ4mr1I+U3yQOcHz6Hb3G8cgJFdB2crR9bfGO93EcxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1M6gZissVMOOhzksK6NeT/XGWxWg+dsJLJAFoFmDOexiahEa+UCAMnaurnZ4FbUsxyCe7bZUgGTuq29czcyffnUUaynaJ9VqDFp884V0HvNJq4nJfzjaP2V9M/QouCpMX00ZynxzVWhfzsxMV8eL6zjxQBE5zkVig8MdpfqnnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DTD6BGVV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DTD6BGVV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d560775ca2so33238775ad.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2026 15:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787612204; x=1788217004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9Tw605kJhO/LEd8BNi1zuUQuVwSe01S9ZMwxtVDwiw=;
        b=DTD6BGVVBaztfIxvOtHQiNN6sf6RmZxqmXpCGTSejrbPhEBYrRQaeTMdRg3cYndJLY
         2DwThrpbCYCgDlHXvODNrHhLvFgSseTVTeYGwzK4MQwpHmggHg9wauY8SIlpU2OaPmr4
         gou72JIPt3RsOfGrgYZ5qLOfYckuftaigV/ciipdR+mFl8qZd6UoEBakNj8IfEF3v5nh
         WFtnIG8qFAJrK1KLB5yUQbiogLLRhKLpgdyc4vpMyRITtC3RspFAuNz5YTY2LZesGK7E
         ZvRrz0WLXBuINsqcfMWz7/yYxjYEETiIMt2flMLeTKDv5O0PB08Cs1WfCUn3EMb16jz/
         XyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787612204; x=1788217004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/9Tw605kJhO/LEd8BNi1zuUQuVwSe01S9ZMwxtVDwiw=;
        b=s727mjikGmccCLDc8Z7kvezoE90ENWLBeRrzFQ6lQcoq0IUKevlsNJNTQTt0qrCzOB
         uazkoGGRTEQwp/+TPxWsF6Q+08tMGscyZciAjsHq0zRtunD1TgZlH1IdcR4gL/eyI5f2
         EiwMYqyLawivSDPGuq6goqL+aZ1R3rINhofSBT1np2pJJ1WvSygNi2APCnMCFNxN82NO
         Q36Le8ngM4XbIhUF+WPEHAG7cCQwEuVovkMKuFLHraf6ctpmCwjQfof73ushvd5g6CT2
         iZ51NWMk5u9X8026jqmvuWOzb3giZhDmoRplDA6HEOZpyiCrC9EJYFGJ13XK0wcEj4NM
         EOlg==
X-Gm-Message-State: AFuF++lasZJavo2qdFzdOgnG7lJMEII7nGY+GT0OcVTyRltcJNcMKSsV
	xj2ewC85qCKuKmWGsk6QZHsPZRm1XtmWQWp83RMZCGY1jaH4HRJRKRuw
X-Gm-Gg: AR+sD11Cf1k3fLzDxXjKASYHMTGgY7mF7gcCQqjjWruUPRUoOAE1Pk5Ksg/wcZyqqU9
	kbH+f2o19dYevgb3wQjyCgeDLl6mmU3Efs6i6D4mYV3PCCtlVB0JHskAbcZnkwd6PHx4fzdXVX0
	J0dMX28E0wY4feXfNaFe7iTJyWg/Jj1cWfwx6hdOAGHVQNCGS25vt9UpfT9pT2Lxz3Ab+aBcWG9
	mYe5C2i0rPhqhCmLa/CaE4EF11nXrzez6NBb6lfcMuzCu4walncqUUzAGnCTe3OxgPHQdBuPCtJ
	9auad7CTL7EHl0FgItMhNR0jOm54E2rO5mHmwpN59lBaoGmJY9iovJegClSZXNoWBswLNPMBSOF
	ETfJv37JWLpizOIkrZXvwBPDqjWAcTF1eRtYRQez23LiSh924XFbGu4iHfAOoxqe1AinG3mGfmU
	dYm6YoAqRBSQ5dqLGj0/jBTKc/uOebYLjJbrfk3z52n/rhtxN0suh+PdcBEFYqQpwFS5lrrGslx
	hnhWvrGO7eaiRWDRxJVjUa3rCiu0NSAAe76H8V33ZOMom2VKGKw
X-Received: by 2002:a17:90b:39ab:b0:393:19a3:4e5 with SMTP id 98e67ed59e1d1-395df686f1dmr38241564a91.16.1787612204546;
        Mon, 24 Aug 2026 15:56:44 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328272232besm1527287eec.21.2026.08.24.15.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 15:56:44 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 1/2] platform/x86: hp-bioscfg: fix OOB read in hp_get_integer_from_buffer() on unaligned input
Date: Tue, 25 Aug 2026 03:56:09 +0500
Message-ID: <20260824225610.18471-2-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260824225610.18471-1-meatuni001@gmail.com>
References: <20260824225610.18471-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hp_get_integer_from_buffer() aligns the read pointer before dereferencing
it:

  int *ptr = PTR_ALIGN((int *)*buffer, sizeof(int));

When *buffer is not 4-byte aligned, PTR_ALIGN() advances ptr forward by
1-3 bytes to reach the next aligned address. The bounds check that
follows does not account for that advance:

  if (*buffer_size < sizeof(int))
          return -EINVAL;

This only confirms 4 bytes remain from the original *buffer, not from
the aligned ptr. If *buffer is unaligned and *buffer_size is between 4
and (pad + 3) bytes, *(ptr++) reads up to 3 bytes past the end of the
buffer.

*buffer_size is also under-decremented on every call, aligned or not:

  *buffer_size -= sizeof(int);

*buffer is advanced to the aligned, post-read position, but
*buffer_size only accounts for the 4 bytes of the integer itself, not
the alignment padding skipped to reach it. Each unaligned read leaves
*buffer_size overstating the true remaining space by the pad amount,
an error that compounds across repeated calls against the same buffer
(hp_get_common_data_from_buffer() calls this in a sequence), making
later bounds checks against *buffer_size progressively less reliable.

Compute the padding explicitly, check for it, and account for it when
advancing *buffer_size, so the pointer and the remaining-length count
stay consistent with each other.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 0edc6e7cfa9a..32b99a862082 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -39,14 +39,18 @@ struct kobj_attribute common_display_langcode =
 int hp_get_integer_from_buffer(u8 **buffer, u32 *buffer_size, u32 *integer)
 {
 	int *ptr = PTR_ALIGN((int *)*buffer, sizeof(int));
+	u32 pad = (u8 *)ptr - *buffer;
 
-	/* Ensure there is enough space remaining to read the integer */
-	if (*buffer_size < sizeof(int))
+	/*
+	 * Ensure there is enough space remaining to read the integer,
+	 * including any padding PTR_ALIGN() introduced to reach it.
+	 */
+	if (*buffer_size < pad + sizeof(int))
 		return -EINVAL;
 
 	*integer = *(ptr++);
 	*buffer = (u8 *)ptr;
-	*buffer_size -= sizeof(int);
+	*buffer_size -= pad + sizeof(int);
 
 	return 0;
 }
-- 
2.55.0

