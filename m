Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD024B04B6
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380885; cv=none; b=SUN3j7H55EltmVMzDNjAtyumgMwMYcSboZD+OUrNCLqjTgrABYkQCzbyXSC51rSd+YvWuXsbw+Y/fY8royOeTn9oPiAvKhx/9Uf++DnGhJixODxuB2A/ESvD5vrfONrqaCSmv81/dx+ZiY7HGt8oto9f+Pb60Ckrzx7v+hD/FNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380885; c=relaxed/simple;
	bh=onzGCFTh+2rNXII7iXfF1revtsH+T4ZuDUAmpOR8U0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s05freOmVSImmGG5bBa3dZn64NwHBFO0R+IxVGv+jtIZBUGzXEdLueHu566NZBEh5K8vTf41Ll6TDEFNtJK1Up1nGzBLarMVPzU9+Q1ARgRToXe4eWqOZmr1BNA3WclxSu6jRvYnFSuUud1BKTOzm9bujw3vv0Zm5Ma0vvfd3Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+aIvdJx; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+aIvdJx"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34c4a0868b6so3640367eec.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380872; x=1791985672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sui9Al/keQRn9LzsJhep5PKyFrhoL0LEL3YQX5XZ59A=;
        b=B+aIvdJxw0B7pPyEQAT8Ii4hOkyralIs9Zx+j6asPBAYpckl2n1vost6S+3VS6j37j
         cpqtOEQVZzgM/3aqBZd6Ekk0yfP/MRkqQTNlpn7FLnj7VtOXaCbnN255MCh8ystFcKHV
         P3kD6So7R0aTn9k00rtSw/je8POxJLwdbKYTuxt7aNpZ2ncvskTdcaAAmvLogfczOQPB
         4upeKAFoDFwWaffT5k1wzjTcUBc61RhyitaLgBoz7w8o8BkfBnUOP4jffVfr1+WOu2mr
         Q2d6E4Yz5JgEprlZ/yaL5xWeTcGFU6sL15m9GAGYWytHXPHtHS8VH3I7DH+Jo3Fz6cAs
         520w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380872; x=1791985672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sui9Al/keQRn9LzsJhep5PKyFrhoL0LEL3YQX5XZ59A=;
        b=1ggskygBglhAsRCNrRVUUfdM87RV1M6H5BEYNPCEwL0Ehfwvg78dkmFEGee1NmAHAG
         AyCua0nAE+9xa8rYHtjKt3hr8j7WnQhCx/kfPGfzUXCKQz8SNs+Lb1soCPmxGsvBK+gv
         IGcTXiHD2Z6+pdKJMuPD2atdh2dybz6GwEHHZzy6YHA9FY8wamAAqNSrCvheT8eMY2V/
         e/hdTlTkw033nlXjuan5ciGdcPPhjD+9UQ3zoXZL4DyLnheZ13riNo9jvpdOMBlZIkRx
         nr9HYWlT5U9ah2W9v9vzvAe72uzYfhVya1ajryH78Jj1WdodMh387OrUAetwSWmAM0nY
         MFMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwcjxqpENAK/+QHdDblLtZgJPZBDMRudSrizhlM2KAl8P6eHCBGbpySeMd7+jxwOlHfUdXsQUvhYtqBpn8VLuqULrTG@vger.kernel.org
X-Gm-Message-State: AFq9FYJWqdY2kqQCag9sKFirb6uT4prmTmD3HCiKPr8C2FDVUyl4k2XP
	c8PnyYx4x82e7qaQ8KQcpHNGrBy8s3XfCNGwvzhER/K8zUPcVvx2/0jX
X-Gm-Gg: AYBFou3O/Pesnt3woTrCIFqK0fXmfoU9vxOgWdicU1JmKHJ8UdvW+k2f4uszmJTqLs4
	/GhxKVJHz9+S9xxDyF/GQuRC74ubFBr2ShVDeOF1AE7iSxWuu7hxDSBFrDQDLdEeYwR6yYFGbMq
	wB2/sGP6QXj91a81WbXsMlJTfIkrZ3HsTGzLP8mqHx+Udxp9V32m6T2AQIZce/pfym1ui7vKkTM
	1faG3FYjQBTHyBp9NJC3zfjnXxCH0sGbg2W+BW0/lJaadEDTJ1U9oLvXFV5P+GRNGZQufY94+wb
	aOwBlCVs6MGOHbOWjPtUvBijy2oe2UrKEiGfDFEnuiqT6TC/PcvhrlZOn5wBEX6HeqUuL2lB/vc
	1J0BpxAcfiFW2nfs0fzmtSXEKwjVKKXSGKrjX65TUc5OgBVa04AQknfkNYy60PUIOzjRCsmoy8T
	+zuFOgW2VAcj9eQHcLz7Tz6Z332jz9Exelw/PtkYB22OqqbpkdZS3AWXnib3jf1dAwtO5oVJRqG
	Oql5GCm6tukCkzCxcRadx5Ii+9Aq5r0hlt1
X-Received: by 2002:a05:693c:6089:b0:351:4746:49d7 with SMTP id 5a478bee46e88-3515de434dfmr2404250eec.5.1791380872216;
        Wed, 07 Oct 2026 06:47:52 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:51 -0700 (PDT)
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
Subject: [PATCH v5 4/9] platform/x86: hp-bioscfg: allow clearing current_password
Date: Wed,  7 Oct 2026 18:47:06 +0500
Message-ID: <20261007134711.473857-5-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261007134711.473857-1-meatuni001@gmail.com>
References: <20261007134711.473857-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ABI documents echo "" > current_password as the way to end a
session, but validate_password_input() rejects an empty string when
min_password_length is nonzero, so the password stays cached.

Skip the length check for an empty current_password so the write
clears it.

Compile tested only.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v5:
 .../platform/x86/hp/hp-bioscfg/passwdobj-attributes.c    | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 8018ccb2b439..96172342d4a0 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -60,7 +60,8 @@ int hp_get_password_instance_for_type(const char *name)
 	return -EINVAL;
 }
 
-static int validate_password_input(int instance_id, const char *buf)
+static int validate_password_input(int instance_id, const char *buf,
+				   bool is_current)
 {
 	int length;
 	struct password_data *password_data = &bioscfg_drv.password_data[instance_id];
@@ -69,6 +70,10 @@ static int validate_password_input(int instance_id, const char *buf)
 	if (length > 0 && buf[length - 1] == '\n')
 		length--;
 
+	/* An empty current_password clears the session password */
+	if (is_current && !length)
+		return 0;
+
 	if (length > MAX_PASSWD_SIZE)
 		return -E2BIG;
 
@@ -97,7 +102,7 @@ static int store_password_instance(struct kobject *kobj, const char *buf,
 		id = get_password_instance_id(kobj);
 
 		if (id >= 0)
-			ret = validate_password_input(id, buf_cp);
+			ret = validate_password_input(id, buf_cp, is_current);
 	}
 
 	if (!ret) {
-- 
2.55.0

