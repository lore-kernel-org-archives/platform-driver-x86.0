Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EAF39C638
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Apr 2026 20:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506447; cv=none; b=Wvc7eATv7pSnYQiwcXityReJfBbcFCZc3XP4J2dx6/xt2XUvHgxRN1tGL2lDFkmnqFMpGAZuDRQDNXMsG4+T95InL/vfOlhySem6iKa9urjDWLzdZO1TIbYFX1eZDQEC9s0APiDaPnLhRvROWv7y5ZDQ8/vTiXhgBplCOB7yxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506447; c=relaxed/simple;
	bh=A5nBMBkWkafHNY7USWwQbGA1Gg3Rjn8l3CkT7z4RWhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPVwICMvL6rNmftqVURSN/mk1ISTvOXapHqsv4mU9HB+iE+r5jsXbD0SBewpXdjC1lxkMes/kr0Z9tycujOPnx+MJV0Nyn8fQTMzYbqIJUj3Y29lv9inx7Yacxmramn4fA3P8D/0C1K7FYWAU9PnctV4p3pJs6T2dkJlSM0l55U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYqpV1Z0; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYqpV1Z0"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1271195d2a7so9286216c88.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2026 13:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775506445; x=1776111245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2sfsoM3eXXD/i3TYQHRzXUhUiniPGPfrTop9I4lCjo=;
        b=NYqpV1Z0VZog+MsPIJfogi+iN5OKCVUNF08wCZjx3SuwuKNIfPPI4CJjj87jt1yMY1
         RIUXB6gg+2y8/MMVxHZgegsWDN4y2i0kpzGABhzTWwzltiUIOOyNCZav3dwizLpQNTPh
         wzL5U2NstNyM7UHZNp4I8K1k/02RNq+SJY2unl/louZrW8RpHSRyY6dtU5YvUWqIpZeF
         LEPCRuUbYduWe7fvWViPdg6FoKNwSA6OGiMf7s6E5JPs0GnzRWeiwmeUCrFMPysLnrly
         lrgunZVPn4CXszLNqvKoH/L8Wwze7f6oRpEwMbFfgnQk+glcqhwqPoLgN8K+kWgcVxSb
         wgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775506445; x=1776111245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2sfsoM3eXXD/i3TYQHRzXUhUiniPGPfrTop9I4lCjo=;
        b=N3cM/cipaPqZvlAiMf09WOOWP0tmOFAWmCWtHY0e8FgGXoHqeBTHUPnXTt2WDOqK26
         cH371KEfMwpKBXAY6zeaBS8gYbRTHhgfwRJxBCyboW1/K8Pb1IqwnscIrn8bPx2WRAxc
         tSC/rEL7Gt7I4TOUMubeyzgbBwza/OtgPNJ7mCe64sOpmhjQxKsWaKV/aeIXooSA3QLF
         HCTNssQsNNH6SSPRTXsdYKN7BVAFgGYE/HBYEBkeQefysaWTc3v92ehc/Ux+9XFmg3rm
         jaMX7AtV/vLJcpbPTI++QQ9KZhk+MJvqvF5Mx5usMonmQvngrZfYb4OtlBDVci5GgokV
         b3Og==
X-Forwarded-Encrypted: i=1; AJvYcCW/n46kI+NA3Xso2jrhmG5LY/5TdINOdsFj3CrFz+SMl4cTXJSJU5PXT63NZfvzXWVzVjuDyMOY6zQuP8AvhuBslWIO@vger.kernel.org
X-Gm-Message-State: AOJu0YymAcLGii7qEut0DtdiUgy0CB3V9bxcl45cdS6ujJfjqrP3Q7j+
	k1T1RFgWzyPyHhM549B7Mtba4Ppnf2F2XrtaPvDeYJUSt6qIS8CueK01
X-Gm-Gg: AeBDievyZTiHMqr/3saeTazWKqlKferQ6j3qHDMKP0jNFvu2XI1VTgYpR4SplBIetEH
	5hH1KiNEGh1HnRC92goMhztE4C5kogrxbLkfwTVzYBADkwlvttVO7XQJP8DdruGCAH+izbhQbAq
	amwFvJp1F9eXMD8lujVscXvNQlqAHuiDk8InXolJJCE9bhVnUp9uJZLcg2kXYcvXSMpRQqt3bpG
	W/fbpzrlQzY9v6JN2bqEnJZFbjW+Dy5G0R//lWPoy1yD37LfsUpyIfFMDwOn+sHa1V3JbCvLVVp
	06kDVqeEXkr7sIsFoS+z2qGoAe4uMpjc4PwGH825sG5y2ohQBF3HGMx3WJIavk+kWPlus5NLNfj
	dsKFF28k9u9xfIGlhGpNVD98pcXNYhto9zxgHMC3XY85d/oExGg2VLaFyBxHhoG4vz9zZ4lyRAf
	98mE7nL+hWFc1U7GNWweFB+DRElCaGqG2KEVNDg6fIaRhZlO9zECyDMTbu0JhzX2LB+kVxzcVat
	4gD
X-Received: by 2002:a05:7022:1603:b0:12b:ec96:c936 with SMTP id a92af1059eb24-12bfb70bfe6mr6740371c88.14.1775506444895;
        Mon, 06 Apr 2026 13:14:04 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm17022333c88.0.2026.04.06.13.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 13:14:04 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>,
	Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Rong Zhang <i@rong.moe>,
	Kurt Borja <kuurtb@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v8 03/16] platform/x86: lenovo-wmi-other: Balance component bind and unbind
Date: Mon,  6 Apr 2026 20:13:47 +0000
Message-ID: <20260406201400.438221-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406201400.438221-1-derekjohn.clark@gmail.com>
References: <20260406201400.438221-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rong Zhang <i@rong.moe>

When lwmi_om_master_bind() fails, the master device's components are
left bound, with the aggregate device destroyed due to the failure
(found by sashiko.dev [1]).

Balance calls to component_bind_all() and component_unbind_all() when an
error is propagated to the component framework.

No functional change intended.

Fixes: edc4b183b794 ("platform/x86: Add Lenovo Other Mode WMI Driver")
Cc: stable@vger.kernel.org
Link: https://sashiko.dev/#/patchset/20260331181208.421552-1-derekjohn.clark%40gmail.com [1]
Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-other.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
index b47418df099f..4b47b5886e33 100644
--- a/drivers/platform/x86/lenovo/wmi-other.c
+++ b/drivers/platform/x86/lenovo/wmi-other.c
@@ -1068,8 +1068,11 @@ static int lwmi_om_master_bind(struct device *dev)
 
 	priv->cd00_list = binder.cd00_list;
 	priv->cd01_list = binder.cd01_list;
-	if (!priv->cd00_list || !priv->cd01_list)
+	if (!priv->cd00_list || !priv->cd01_list) {
+		component_unbind_all(dev, NULL);
+
 		return -ENODEV;
+	}
 
 	lwmi_om_fan_info_collect_cd00(priv);
 
-- 
2.53.0

