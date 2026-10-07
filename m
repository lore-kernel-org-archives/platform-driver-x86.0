Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51754B514D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380899; cv=none; b=kqhjMX81I9v4HlGGbm+Fq/O8fgZSc2kCrsJvNjyN4rIqxikLUSYqmheFlPBb+O4HRT2djN95vF8KUnwSsSOHSwu9XBdrAYuAyiNFGieijFB7p86xApolcXqWY1pYECuVKyFkUMrGxn1eSUdpsIbrhWB+6Xd8R3n8ITWkaeMPe2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380899; c=relaxed/simple;
	bh=I4PeQi4SmvyrZYhDDUSHgIx+IfnvBhcHBkpar0jUK/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r124sX5WG9LilqDJveQqUZE9HMdCK/1nWTnzvEEtJijjNyW5LBR96wr4CyBoRlQxA/ntsevIEv1gQJ3kEFKJT67yq3ZFbz000LQaxEizD+4vdRt6c/4SvkUsF/6GdnVPwsxzIxmTt4WYkCkcGtcEgWuXKFKSOjEHjgAMleWRRGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KY8YODyU; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KY8YODyU"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3516e7693e9so179476eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380882; x=1791985682; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TOZ68Zqd5ykdIjDqMFf3hngPNxsHC1naKT//wwj0pqw=;
        b=KY8YODyUqIOH6CB81p5ahuVTAWYy7ma6MLfPnyTHm/wykJ8UtkyBD4vXkRgwpe1VHK
         ckVnWcY+6pK8LJKxWW5HUcbYe42KZdTs4XE0MeEbmIMmCBnsy1e1YAecrgLiapmz7UAi
         cDer4XRGS7bUjsRfpMEe9YiENbK3jG3aFp+p81pqH7hhVLqlVpLXRlwKoaSjRqBhUfay
         6L6HjOaGSxvhd6Ds/10GkWquQAs5uBeYGhc//Lezng7/kJGAB4NNRZXkWxXoUNYyHg+U
         ZZKblWCDpokzfaqU+7iVgjJepFEWCLXmFFhhVNWx8hIUa2C1yUeDr0k/V8OIj/a1SEii
         3S5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380882; x=1791985682;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOZ68Zqd5ykdIjDqMFf3hngPNxsHC1naKT//wwj0pqw=;
        b=ytei3ZcjfnHxMiEkx7Q0/SEMhJpJm13eE/HEVWgVftO5Os7mca0oDjhbJANMz8IrV4
         fIHYaeMkj3nraO30DoqFKkdMBFZLhTh4hqrMco+OnNaiaJH2cHiSXM5RFThitn5TQD1F
         UGO9HNnp2Ki9F3d2DMZj3UAkgZZ8/Ql9bdseTaUCsbKQKFgFovbhGFf5YqxaOQeNGZ5Z
         RijbQC5Z/6e1lERjhYRUe/OlWRtb3zIjIFbNFd6HalJuko5V44Kw3wlSZ8+yhMQtlu6P
         FVQU4CNxrRg560BgfCEfkTk8lzQPY5/ELNckMcmqxUJ84+o8dWpa+fEt9mmYid3b897w
         e5iw==
X-Forwarded-Encrypted: i=1; AKwUvBxy6ISomN8h26uqe3C87FKtg8JvlOjb3QJYiaHt8/nqDiyBeRv/VT1jcHXHUM0UKisMvOudxEbSCyH94WIuuZFQU9zp@vger.kernel.org
X-Gm-Message-State: AFq9FYL3pxn9A+0WUP8Vbcj2FWH4Fi3jkxkrIS4pPFzLK0D1aiWgy5sc
	vH8i24Y79tuGMG2lZsXps2IZkv9+o9LhoNDStDsgrFMWOjbG+UOVkVnh
X-Gm-Gg: AYBFou3tgbbB4upPeCe7pmSNSOTQ94AMzGdROkMx6k6DHnl3CopGnNlTLLPus7lQJ/e
	kEuBMzuA/HPnDHC6By+BuU5FwoJqEb8OOGyZxWLQxBS3Xi4NPWtPNYWkqYBzssybd0EBQz93bW+
	HmZQarABJWgdEKeXz3ANRZM3I9GKTVWYHdjOzpZPb6E0UTQFodtyAofxRFSXvvyJk1kC7AqKCGC
	E0P4QgpfKaPI+7xQRVoCi/t85KHxKWRykiFQkWY8OxwFoqB2cayPU1iLJFziQI/j/wT9E9OwQB4
	ULtA8A5Mo7GzfSoLG/f2enAGe9j9z6QxXx9BRJ1+RV/EUct8KzVeRZOqzVL3lwgfHWqjC9RkkXz
	KUtAOlOqWiH80ZASnkBjG1rFvYPjqu+1XZgfGl8EPZsUgfOAyp3A0iIC1jpFO4l/iSGu1ssVq4c
	EwTUMTnz7rGVH43KPZi9oyIwB6PK6OrBpfXpmryBAPlCFowD6EshrTwA8nt9NgcA36gLnhbB2Kb
	sK2Aq2DT67kEZgtHYYP0IYsvXQzOUgGvSrLdw==
X-Received: by 2002:a05:7300:de47:b0:350:c7e7:57a0 with SMTP id 5a478bee46e88-3514530ab4cmr5957045eec.24.1791380881436;
        Wed, 07 Oct 2026 06:48:01 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:48:00 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Jorge Lopez <jorge.lopez2@hp.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v5 6/9] platform/x86: hp-bioscfg: fix heap OOB in hp_enforce_single_line_input()
Date: Wed,  7 Oct 2026 18:47:08 +0500
Message-ID: <20261007134711.473857-7-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The store handlers copy the input with kstrdup(), which stops at the
first NUL, but pass the full write size to
hp_enforce_single_line_input(). With an embedded NUL the copy is
shorter than count, so the helper reads, and can write one byte, past
the allocation.

Writing "A\0" followed by 4093 bytes of "B" to current_password makes
memchr() scan 4093 bytes past a 2-byte copy. On an HP EliteBook 840 G2
running Linux 7.2.7 all 100 such writes fail with -EINVAL although the
input has no newline, so memchr() matched one in the heap. A userspace
replica of the helper under ASan reports a 4095 byte read, 0 bytes
after the 2-byte region, and is clean with this change.

The input is a string, so only scan up to its first NUL.

Fixes: a34fc329b189 ("platform/x86: hp-bioscfg: bioscfg")
Cc: stable@vger.kernel.org
Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 754ab03bfd7b..84d75926d768 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -166,6 +166,8 @@ int hp_enforce_single_line_input(char *buf, size_t count)
 {
 	char *p;
 
+	/* buf is a string, ignore anything after its first NUL */
+	count = strnlen(buf, count);
 	p = memchr(buf, '\n', count);
 
 	if (p == buf + count - 1)
-- 
2.55.0

