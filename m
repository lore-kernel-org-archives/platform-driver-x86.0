Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348634;
	b=lt02qNnpTgcllOdDBJ9WC+R1RU5WFjsvgV/im99SIpA6KJMbyqfGYdnP4XmQHyle3Tnv
	 utkFGwNwW/l5Uk5fd6WGH9VPHTJcB6wZ37S5GofR2nSSb+DtaJ72X6nWf65cop/wFQOCz
	 ScT8u7x2wmuRimu7FGzeP5VufH/AVBNhXWHLR5iTH87PEkLN6HxnfMiPIyOqs2YnfqVdI
	 HnUJjz7wlWLhOdpO5MnMd9RKHj7Izy50elawyqlq7vtvcMQCLieLl3b+5UwvWt3C+L06K
	 FNVRpvIh1aEzG02JQZz53pYnfodeHvRYFEY5672C7VHb03KlQydbHyukoiW9Sz1Nmcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348634;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bqzCmvhaNWcuJ+bM11VMKpyipTAsKmtuL9+xfzPfDz0=;
	b=2vmsC53+QpgZ5onG6OlgKK4dWXQXoPFzHVeuca+OrK4QHu6mCFQUMcYU0zPxt05sx5Ch
	 TTEtiuGadtNfy8dmQ/lBrc/E2uEpnehbPhmWzvO7C1CLAAXTUQl4R1BQ0FY8YCS0jV6KK
	 9j4yzboRnkuJykizBjOBsLlylWsD0WSxWsUo2voGGGVFyElvSa1uAqTbBnfbNJBdU2fQD
	 Bysw6Hy+nHu/gW2RpuuRJ2nOVO8ezJS6syVsMfYYKv4X/681JIofZ/y9+Hwm8eoxG+fmS
	 DlZxdTqamVgUah2oRzmsiqRc5f/oEDyQjZHbsxPlutNbegEdZNBfnPx9xMMWOCYMvZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZj5rMI;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F11A606A31A
	for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 08:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F11A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LpZj5rMI
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so762659eec.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Oct 2026 01:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348633; x=1793953433; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bqzCmvhaNWcuJ+bM11VMKpyipTAsKmtuL9+xfzPfDz0=;
        b=LpZj5rMIFJPAg5A8Z1AM6kCvG0hisKEA3dzYDFsL4EiASeL7Pqw3FwXZKLJ3nj/Etd
         gPmLPNQPcQuyBfeUFvKYkGqrj5JO6UUMgRjAMJM3d35diccuohJAjaBbtr3elkzcaVfV
         Rp+dXhyhP3ramHiTHQHd6+YgVbp3myCWT4ykkrWUKK/JdYEwqZcMJs1c6gQD9CYoO96r
         FjE5vU2D0t3mBj0quPr2u4J9SgU5ZUb8Pdw4vpf+ZcP/qdoYzCwlAZPGJWtrodZic0I/
         h1m91pzAqK5q+b/wKAzK9iDqeenqqrzZoKrLjEQ5mGSwJGU4+NwAm8sqitKBX9bCLumK
         kQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348633; x=1793953433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bqzCmvhaNWcuJ+bM11VMKpyipTAsKmtuL9+xfzPfDz0=;
        b=SD3SsQDsd9FW7GSCVPet67a6rTAyTuW7P0a1kSrTFmqpNUpiFIFbx6j6vOGZnvwGaZ
         Ivuewg8le9jQJdfeS0gGQOxY0WOeW3Pr6ZZ1xbL0IK73IVwmtjU5bOvHTJ1ojibXw7So
         wPZrWe+Zu1T+izB1R+J2/pGOaB4KU9vf6szLS8dTSG1tf9pkojGAY2ksLuBaSH7+JFkk
         ypF7ds64kQXrLGOvD/1hZzNGHy6oKa4Jt2MRpmFwVxJpgVUG6Qqaz83GT3RohTuRceFn
         E2739OVaZn0+HCAHfNGj0Nowv1ZxNSdzUMqe5vlLekxUoMVH8XRrz2lHwhfGFbCJDrHQ
         q3vQ==
X-Gm-Message-State: AFq9FYLtcnvbsajZctsAv+YspQ/p8YKGE6GOjFk4NmVKMQas1hBmr1Jw
	mXOxdkRsgoQ7fy+l2UGuxm8/V2utjhxCSB54IiFdqBYTne0wRRYKHpL3
X-Gm-Gg: AYBFou2QqT15vgg097+UqUdW/mw3F/aMNA2CA9RNAD29uplmDzNIYNRvPq6CrlD+PBk
	gplJumPsXPspD4kvjIcsPvYCi9+9NF2baYTRbVb2p6NJUZthItoHUveGZWzD9r+pfUMmUUpqUGn
	vZiXNSGXHik3BuQp3b0kcoh2KoEpq8GOh+VBoaXE9eGO014DWweWWfMs6/6kZkgM15YZwTu9ALc
	A+3lHGNCVf52aOU81mLmhDygY8DZolQwsrUMLHiNox45qpkgzeOQx4JDcXq+qgthLEZUjrTp34s
	uV967xli3/B8ulFzhPTUdwcjJ+pfMz6lP3c03QLrEXBvhMMoLx02ayc6uB7EVUCrU6zXqyVXSTR
	kDof1I0Rd8xNoIgatLo1DldbCeOQsKG2W14ohApGX0y2nDLS0iETFONgehIeAvhRkIi+K0fBA9l
	yQfdNO3ojevuW/hbvwckpAs9HgOC0nzaGHaRqNCYHKfeVb81KsgVXElaTSTAzynvjImww85EvTN
	VQJH0JqDP3shESKZScLreB+31Ncg4jd7L3mHTAetxgiD4hwROA7PqdA8shEyYf/tKg2LSsxnHtR
	ULFio8/dGaQYxdya+KitiqFvPDY8riRRiDsASGo6EjtFKwS9gow7ah5wwGA7P/SqmA==
X-Received: by 2002:a05:693c:4159:20b0:351:29c8:643 with SMTP id 5a478bee46e88-36a423a8b7fmr2874253eec.18.1793348633406;
        Fri, 30 Oct 2026 01:23:53 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:53 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 3/8] platform/x86: pmt_crashlog: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:57 +0530
Message-ID: <20261030082303.284271-4-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex lifecycle is
managed by devres.  This removes the need for the manual
mutex_destroy() call in pmt_crashlog_remove().

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/pmt/crashlog.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/crashlog.c b/drivers/platform/x86/intel/pmt/crashlog.c
index d7018b495217..1071320ce6be 100644
--- a/drivers/platform/x86/intel/pmt/crashlog.c
+++ b/drivers/platform/x86/intel/pmt/crashlog.c
@@ -591,13 +591,16 @@ static int pmt_crashlog_pre_decode(struct intel_vsec_device *ivdev,
 	struct crashlog_entry *crashlog;
 	u32 version;
 	u32 type;
+	int ret;
 
 	if (!pmt_crashlog_supported(entry, &type, &version))
 		return 1;
 
 	/* initialize the crashlog struct */
 	crashlog = container_of(entry, struct crashlog_entry, entry);
-	mutex_init(&crashlog->control_mutex);
+	ret = devm_mutex_init(&ivdev->auxdev.dev, &crashlog->control_mutex);
+	if (ret)
+		return ret;
 
 	crashlog->info = select_crashlog_info(type, version);
 	entry->attr_grp = crashlog->info->attr_grp;
@@ -641,7 +644,6 @@ static void pmt_crashlog_remove(struct auxiliary_device *auxdev)
 		struct crashlog_entry *crashlog = &priv->entry[i];
 
 		intel_pmt_dev_destroy(&crashlog->entry, &pmt_crashlog_ns);
-		mutex_destroy(&crashlog->control_mutex);
 	}
 }
 
-- 
2.43.0

