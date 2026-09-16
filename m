Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DECC3D0C07
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 17:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580918; cv=none; b=ZDcgIBzhOuMIhrU4nhDqMTVtZr1tCSSz8BpcObN89UUSKsaZLWVT8kgxCyV3/ol0zGUvpJovAV6cGedAxgyvPtGtVhuvAr60gYbwlVfkitUhmPS86scfzfbzA2iKtOdKXKM8W2ZExGmWfUB2oZa08d6WJep2QV43uVH1J6b2ags=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580918; c=relaxed/simple;
	bh=+vIwzo4msujugsXFCGy5QX5SHs48k4fQUJ7xFketJDo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdCwLIcIYLX+zdfgDlBI4ePEPQyrxIsAXuR72/GE7l7XqjZH0pe+5wTID9ONlHWna7enx7U7ajGFiYqG8RYI1pwnmqAU7hFcCLl804l9eVjeJG2Msw/qnnSgznyEqN5MMG0cck4FjSIBwkljD3+WsVY7pW716oW2ys+Mm9aKh7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CLFbC/L4; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CLFbC/L4"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d9004a1ac0so9156135ad.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2026 10:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580912; x=1790185712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ciw62Au4z3cCL9AXn9xKBi9eQI9V21YCaEIEbyMxkvg=;
        b=CLFbC/L4GkshXKRiw3qFCOnuiMhpPTdln72fCI8bSjmTBMT+TlGk1AEcxZbHm7oOG7
         A+YoegdPAlbNbiA/Wj1fBPyaTf9kkzt3CyVIhqRmugYGmLLaFqUOvEc5lZ23/blRs6wG
         htMcIHdJClDUJ5U8v4+eD9ls78J2+BGc/tdiPg6lsPP1qY/JDL+HCC3JrrMReUC37wRM
         sosUjlvZOmWI1S2KOhn9TBExlxjYUs2qx3ngg70wXqfEcSt3lfLBCfIB3iAQ9F1MRKRG
         4rklX2vq0l9HFks5NOZO1I3DFK+J13fCbX62OjAk3Xp9Jnu/1d1BOyXrQ5Dae7DTrjhG
         et5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580912; x=1790185712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ciw62Au4z3cCL9AXn9xKBi9eQI9V21YCaEIEbyMxkvg=;
        b=m8UHnN3v0/OWlCNQLye8aBgLxiRiBCd3+Wght7EZSnxtqWxd/1xrqAoM2icDuBlhIt
         4wG4bVYDFGcbFmo37evk91RP6YwHC0eMhwmSdUncCwTno8ofMH8BJFunvU5JIPZsdsLN
         lR4+RDNJrv71TC3dDCIHl24rbRrEhswUneKH21DOOV0jjWeVJ2bBmUcQy3ojM1xPDl6Q
         HJGiVohVIJrpTcpfi7kE5QALVYj7fOZ46qsKYYIu8IodcyeAfM5SIcvvsFtHJRyq5PQ8
         W6gddW1A7fOF1Z//iFJfgQfuI7dkuKj8BMRh5L4rMPcFANQQp6hltYaUZ89EGv102894
         WfVg==
X-Gm-Message-State: AFuF++ltXCFbYL23r9tJX1+7hkDXPhEe1i8YDsQobxWyRDNBuRWBgBw5
	aTPXyTGrCzS65G67aLzjdNFH9dD7LPjXfG7Sxi3e7QnheXDVL0F6DVUZ
X-Gm-Gg: AYBFou2XRyoqFdi6wjucVZMfAEoUvRde6wcPuU7SWO/uqvENa3LAdjg2DyML7NoLfKJ
	tYBGWmklsBnn4eo9vz9ck1LPszkWwoQtw4y4OR6hjE4mK7HwJJOFFU3bRDYqAXGOClyoFjiekzM
	P/MC4HwZAf/hPYkxgX24c5/fQVQ0rUKtPUp45EBty7pWxoe4piJgbxZPm2HiPfNxrShKqXQdcdA
	2RLmP+0u1eFZTbwL9tvxRy9uWTwbl3Kd08nsOUMG6gpDZ9pYMr9g10Ynr+bXTs4ZLkGgZKCqpGU
	O0c1hgudZHeFnza2rpvNcMQ/n/Dpc5aLh2XS1DemfmTEaMJQ15NYDosRz/oucVc7db+uJZ2leSr
	i9Y6GsJbt1buhBUsCqfBfpYW8tn6fwoXXynY1DutwvSBoETJuw+Nb+rmSFuN47S2S+ImwrOhFFU
	0/ypHh9pIGtZO77R6XG0PdtmxjOizsnchIepOXntnVFG2W4KU1StWi5TxYFpTKc1chED2K57Ekv
	cTK
X-Received: by 2002:a17:902:e54d:b0:2dd:76b1:3509 with SMTP id d9443c01a7336-2dd8e4109f0mr73936685ad.14.1789580911662;
        Wed, 16 Sep 2026 10:48:31 -0700 (PDT)
Received: from arch ([2401:4900:ccd2:8875:9d19:1309:9e6d:8926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89edef89sm15916075ad.49.2026.09.16.10.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:48:31 -0700 (PDT)
From: Daasaradhi Mannava <daasaradhimannava@gmail.com>
To: Nikita Kravets <teackot@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daasaradhi Mannava <daasaradhimannava@gmail.com>
Subject: [PATCH] platform/x86: msi-ec: Report valid charge thresholds when unset
Date: Wed, 16 Sep 2026 17:48:12 +0000
Message-ID: <20260916174812.11496-1-daasaradhimannava@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The charge thresholds are computed by subtracting a fixed offset from
the raw EC value. When no charge limit has been set, the EC can hold a
value below range_min (0x80 on an MSI GL65 Leopard 9SCXK), and reading
the sysfs attributes returns nonsense:

  charge_control_start_threshold: -10
  charge_control_end_threshold:   0

Both attributes are documented to be within 0 - 100, and an end
threshold of 0 wrongly suggests that charging is disabled.

The store path already rejects values outside range_min..range_max.
Apply the same range to the show path and report the maximum threshold
for any value outside of it.

Tested on an MSI GL65 Leopard 9SCXK (EC firmware 16U8EMS2.100) with
the EC holding 0x80: the attributes now read 90 and 100.

Fixes: 392cacf2aa10 ("platform/x86: Add new msi-ec driver")
Assisted-by: LLM
Signed-off-by: Daasaradhi Mannava <daasaradhimannava@gmail.com>
---
 drivers/platform/x86/msi-ec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/x86/msi-ec.c b/drivers/platform/x86/msi-ec.c
index 566dfc73c..1762551e0 100644
--- a/drivers/platform/x86/msi-ec.c
+++ b/drivers/platform/x86/msi-ec.c
@@ -1279,6 +1279,15 @@ static ssize_t charge_control_threshold_show(u8 offset,
 	if (result < 0)
 		return result;
 
+	/*
+	 * The EC may hold an out-of-range value (e.g. 0x80) when no charge
+	 * limit has been set. Report the maximum threshold instead of a
+	 * meaningless (possibly negative) percentage.
+	 */
+	if (rdata < conf.charge_control.range_min ||
+	    rdata > conf.charge_control.range_max)
+		rdata = conf.charge_control.range_max;
+
 	return sysfs_emit(buf, "%i\n", rdata - offset);
 }
 
-- 
2.55.0

