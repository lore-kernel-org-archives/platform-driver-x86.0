Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7171434E30
	for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 11:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533527; cv=none; b=Ju0eFLd46ad8LWSz04Xrz/Z26KWbY52aZ6rYJ6VXprxZ/ULMrRSk0di1cAcnoYF6GqR5z171GgUOIyWaYVFVruOa0kbGA5ij4AbgW6zNi1FsDQmt6E/d26GBeRxqOgjK58s57oPXatEU4AEs+lz3djo6nbAa39jSOmhrfxi1VMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533527; c=relaxed/simple;
	bh=r6Cbjl4OVGNVNoYln0kbEziovWGUtHxY0z02La/a0yE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lzR2uDZldB7AhZ6XtGV0IvBOTYNKAV2odM37dEwwFMGXALKyTEVnv2Jqw58jOhS/VSk9q975Ogx16WFRdhKT/p82V/8HGmjvujdYPWwEv8TB4VDehhESLZQiDT1B/QqWs9TBY0+WlrajBy+o7JYM+xaCjNLi/4gWmq7HHcLDsCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UzbaZC71; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UzbaZC71"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe377a217so490739f8f.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Aug 2026 04:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786533522; x=1787138322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PdRDhdZcnRfVrf9wRzs0djvfPZrw61+L7S7NLduJJu4=;
        b=UzbaZC71OTzWsdFtBndbCNf8UETNfC/ScfpZqz/Z0qKGPrAqzPGw7gO8LnVLyHnqiW
         5pYRqLghuVmA8xy9oGb6Z8F/s1cjyej5Zy1UaLmbt1PcHGXAf12QYO2CKQExxqjjffTA
         H7eO/dhrZZAozvNdbvrOLlJlTMouVUvhg9v54yQXG6wVWXmRlLRrMRMhrYOKvERi8q/l
         Op9s2WtGXhjRmeZgSHMti/JyrECACdHsYuaATrnDr21OBr1tAI/Kbxdrx3S4NA7UwVPm
         fl3PJ9AVRqUvd8XZ31FNkzrEcfmKqIB/6JYjEIyaaTzOAkxxKJaDQV0p/ix93xYm3HYx
         JGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786533522; x=1787138322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PdRDhdZcnRfVrf9wRzs0djvfPZrw61+L7S7NLduJJu4=;
        b=RRcCZ2s4sgvcwjkV9waHfukwQqt4L2ghEVDyZ35Q+GgOB+UaQjOsHUUTK9Bj0J+WUl
         mlYapyiWV8Jb8eOduhxKNzD9UOOLONQcXu48S2zu3reGzOKE/iSC/0QR2HEYpWt0JUcU
         Q8jUf+z65AFMWVeTUIXlw+/rfD/0GVtSWhzbrEwClzjRHnK1Fo2aMjCQe7OH7diNZvJe
         HMARsmdUbzcS7auQ852hQQK2OmBWhIx7MPKjJwH99QXFN5oeJP185Xle1E4JJ76KV8FF
         9kvi3i1CjNiZrjUcIhFBvDxMHUf/jxsIC6cejct10nTIADs5tU9M8xB7m/7Som2TrPEN
         rZ/w==
X-Gm-Message-State: AOJu0YyJt5sMCFL1MjhZLu0AP6Rz2/qYsSPvmeH3g1Rr/czJ0wKb+kgc
	P7dARiii1WIhkKfMiAP8ZiWkQ9u7shGDY1so0v7IXK96QD6z6WwNdswJet87kwpM
X-Gm-Gg: AR+sD12PK2i37kxteeN+QNxN39T7oBc3aHodr5dKbtjuDelysCkQiWF+JHQPn5k0hgt
	7ValLVY1ENKppjfEK2ZWJo/VCj2yJOPouEHYgrDPjIQAwZk43lmkO+52Do5rdkw3IKLkdSy3dO/
	/gBkyHnDLRJ5a/SQshdR+P+1hYrqiNJlteixLzgBzLwtEhOeQtkMoUbmFGm7EeYtWvREJc055er
	nRsmsL79SHmfPnFh1jC84TViW6DOA3clv0l3+9pTEnSxNuT0qxFvTvnCqFTmWeUw6e96PClpvd7
	I+HSe0Wwv9AilYyJbHKDT17b2CZavsgxmlalaPNs8cw7eat+mu274EEnZRP6wimMU3TvmiXnaEf
	ksP3qGnpyo9FfRXndAhfhcQAo+OcQryRG6TEqNJ618E3xRSPBWeOasO4MrD6k1KyFMCtD7n97kj
	XN/GI2iZEdGfvVtkGGr6Ehkmsaty4L2tr9WYSgwRCyh60gmeBMdVsAGd7crjX9drRffl+IBCwEa
	6VSpeHA64JaVcqrCNJVeN3JHK5bQpT8gcaVKd3hdQ==
X-Received: by 2002:a05:6000:982:b0:47e:9f16:c0bf with SMTP id ffacd0b85a97d-48152c892c8mr5968232f8f.30.1786533522478;
        Wed, 12 Aug 2026 04:18:42 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d702c9sm6670072f8f.34.2026.08.12.04.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 04:18:42 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: platform-driver-x86@vger.kernel.org
Cc: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 3/9] platform/x86: hp-bioscfg: fix heap OOB read on empty password write
Date: Wed, 12 Aug 2026 16:18:23 +0500
Message-ID: <20260812111829.172273-4-meatuni001@gmail.com>
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

validate_password_input() computes length = strlen(buf) and then
checks buf[length - 1] to strip a trailing newline, without checking
that length is nonzero first. Writing an empty string (a bare '\n')
to current_password or new_password gives length == 0, and
buf[length - 1] reads buf[-1], one byte before the heap allocation
holding the copied input.

KASAN confirms this directly:

  BUG: KASAN: slab-out-of-bounds in store_password_instance.constprop.0+0x223/0x2a0 [hp_bioscfg]
  Read of size 1 at addr ffff88811bd8da9f by task sh/13740
  ...
  store_password_instance.constprop.0+0x223/0x2a0 [hp_bioscfg]
  current_password_store+0x14/0x20 [hp_bioscfg]
  ...
  The buggy address is located 23 bytes to the right of
  allocated 8-byte region [ffff88811bd8da80, ffff88811bd8da88)

Reproduced identically via new_password_store. Execution continues
past the bad read (the garbage byte only affects whether "length" is
decremented by one), so the write completes and returns success; this
is a pure information read past the buffer, not a crash, but it is
still an out-of-bounds access KASAN correctly flags.

Fix by only checking buf[length - 1] when length is nonzero.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 4d79eb8056a5..86fa03a5ee9a 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -66,7 +66,7 @@ static int validate_password_input(int instance_id, const char *buf)
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
 
 	length = strlen(buf);
-	if (buf[length - 1] == '\n')
+	if (length > 0 && buf[length - 1] == '\n')
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-- 
2.55.0

