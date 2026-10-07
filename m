Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2F84AFE3D
	for <platform-driver-x86@vger.kernel.org>; Wed,  7 Oct 2026 13:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791380878; cv=none; b=fdWHYxKJ+Z1bZgcGHJbp8Ah498dgF3ox9IqFFYXjf25LkqZ3Jfy48h8d1n0rt0K7aQ+3lsoyEohZgCi4KaZY/IIkpd0f8C+1Ih9eaGWUqVWuFaXqFFa10mtzy9LdZvhh7Zb9okdfUSHoNAXsOu/EzwIbDVyJsRt6onS2MmjYvvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791380878; c=relaxed/simple;
	bh=AD4TAXmybw5qBrGEaCQw6Z7FjcyP4LWybfXWRYdPs6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X14R86cigh44bZzooEHDoM6VlqA4vE2S4fZHWJd5mG/RFU3C7iQIQnfxRwNZd8PBgT8y4BxnSonuTAMKAp4MXVq8anHRkBlQG2Ml2tFlSRpUwXFrGR+lLOP6MHm0TAAXCxzVcDkZjKAuj5ulhXdqamNzw5X49TJuIQ0p/cni7ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqstUFK3; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqstUFK3"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-34c89609923so1910981eec.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Oct 2026 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791380868; x=1791985668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J85O2LckhxsuXE9VLugeLGefrHve4tVD/epH1sMymxU=;
        b=mqstUFK3GplB4fERevWh12mUiTSM4G/zHTddul4PKFJC3RLEc5GlP+yLuLdW92rL0b
         0Qg+ez8GRKtVC0u82V5DuIa9S8ek7h75tSXtklXkBfcxwF58aP1KI9JpuBZ4aghjKN5Y
         BB8azcyBSCd9z71t13apTfvn+LYbOiZh+Ff2uFAQ7ygFlilL7ga/IkDqLciSVvCVvWIU
         PtcY0QlAr+FrTtCkAQTFijiBn6yJndE/rxXeL8Tfa1K7FoKd7i3C0G6kb4t+yfLhcwtx
         y9Wv7YizrLMTLx4aEVxCpjNQjBYq9ou8r7ilnbMbHGgb35Dg+fZHduUG7zxfejt2dX5x
         ZKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791380868; x=1791985668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J85O2LckhxsuXE9VLugeLGefrHve4tVD/epH1sMymxU=;
        b=oCdAwjhCBXoCwQpiGW3S3kIdc1SjIndBpWonrEwJr9XMOZ1HhAuR7+oGZZMRsQDKS/
         /504QZwhMcCQ7LUev9ehAqozTMm3Fy39v9Ah59kiNf+r71loTg+i1s3oiVgEYbW0pdqW
         vU8VsQw5790GOYcKprB8A713YmajlJeqXWsWczrxX3uOiTASAN3uN1AhM0OuEAqBitpV
         /qdXxpwOZZ/QmuPzHSUlVnQKJdbYe23pjIMyWKSVGXWJeck2RYoMFAN7iJ6zsUXS5q1/
         I5WS51rLLBiWwrqj//7ZJlq2d5+pYF6Ay+O7plBLPKLpcZaHPMov1BI0o0orE71JLiRs
         x/xg==
X-Forwarded-Encrypted: i=1; AKwUvByXandUlmfD/5CE1nrpw88/ImG+Ko7F+ZMPBfY0kGR8v8sOVkrhxYCYmmI880NQuplZ+abA+1xgPxOD1OpNxykCcKQL@vger.kernel.org
X-Gm-Message-State: AFuF++m4dGbmPAigZd9KDw1Vku92W8r5A2QvBDYotnfDqS2Ld6c6Wg4o
	qfpUi1MrQFl7xafVJawJD6YGRyp9F+/HKlN7rRDYqqW4ez56P3vkkHZw
X-Gm-Gg: AYBFou2+YLIUHeKw/BfsZQmO4FgcxRaTyUBkSBzZoUxYAh1R4TqTyIeaAqf/MBZLVTc
	hTFYhX8dHyZTUTNq47aCRQ7yNCgrzmrxNddVSj0SWRPCltZsMMVjVXX7nYRwYJ3TRpIAEIFiC4k
	QIS07ciwvsgJrprcWH/0zxZe8yitsTBvPLwRVLMe06XO8zLCSNKEA3iwmuY33B6ma15ptzx6WoS
	tiWd6NcQ+m3lw224bicf6jNNPikVfEMmjtyMe7rGtujXzxhn6umsEnC8Daw6OY5Qnzj4JrqJcea
	14Gp4THVwVsg9RK+OknXHGONQqCbnlgNwakMgP7wwog9Tao44kNx+Zvj/b4kNsgZ1PL10O9kx50
	XaeT6fP9OUwIxN9+riRHuQf6rLu7ujx4GeIhVjhsnEwDR9WrZAEHJP2sInrou10IXEIcO+XvSyz
	UmmWNrPx4PxqAON/B8ws8ek3/15/Ir+J6FsKj5vIcxII2WtzrqpJCBdI+JMSWjgBFIYXkrUqSV3
	GGXhtUpMtsCSyYz5jXIHMjKTCYVv1kYYMJi
X-Received: by 2002:a05:7300:ce02:b0:342:451b:c0cc with SMTP id 5a478bee46e88-3515dd83bcbmr2303371eec.6.1791380867624;
        Wed, 07 Oct 2026 06:47:47 -0700 (PDT)
Received: from fedora ([2a02:6ea0:c803:3091::12])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515aeb5c2esm7304472eec.10.2026.10.07.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 06:47:47 -0700 (PDT)
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
Subject: [PATCH v5 3/9] platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()
Date: Wed,  7 Oct 2026 18:47:05 +0500
Message-ID: <20261007134711.473857-4-meatuni001@gmail.com>
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

validate_password_input() returns the positive INVALID_BIOS_AUTH on
rejection. store_password_instance() skips the store on nonzero ret,
but its final "return ret < 0 ? ret : count" treats the positive value
as success, so userspace sees count instead of an error.

Return -E2BIG for an invalid password length.

Tested on HP EliteBook 840 G2 (Fedora 44, Linux 7.2.7): writing 999
bytes to current_password returned 999 before this change.

Fixes: 8646a3b5ee3a ("platform/x86: hp-bioscfg: passwdobj-attributes")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
Changes in v3:
 drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
index 9b989ef756ea..8018ccb2b439 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/passwdobj-attributes.c
@@ -70,12 +70,13 @@ static int validate_password_input(int instance_id, const char *buf)
 		length--;
 
 	if (length > MAX_PASSWD_SIZE)
-		return INVALID_BIOS_AUTH;
+		return -E2BIG;
 
 	if (password_data->min_password_length > length ||
 	    password_data->max_password_length < length)
-		return INVALID_BIOS_AUTH;
-	return SUCCESS;
+		return -E2BIG;
+
+	return 0;
 }
 
 ATTRIBUTE_N_PROPERTY_SHOW(is_enabled, password);
-- 
2.55.0

