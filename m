Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923F373C12;
	Sun, 14 Jun 2026 08:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781426692; cv=none; b=PI/0P+B4frmmdelAI3X3dr4qTQi9F0DjFiAeJX21oFeH9ci2kXefucM+4104cPvXqGETAyabVlYsjeqO4futSKgksSkRFaBgYAcnSquAi7zriI/PloqMBx0vncT1cdmubs9lwZnKhU6tQUoGGiHlgdjrxlmedB6WHXlrdCFw4+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781426692; c=relaxed/simple;
	bh=WaEkx2BAApK/ULGPa+rFKoVfPtpe1V9iWZzyBPX2zF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BuO24WyxoJcjc2KGVgSyUkN9bRhdON2tgsED5+a/BCN+NZz5o2y+0hv+NbOzPBjX5Dt0+4jQAWwzjZ4AwSqn/+fkEnFrV50FjPdYgfSnxiIiS16KTzj4nqUEuTVwzEOluD29hEPX7oXG4tc/jdt7fiGgED1Y5gYmxfFjD+FWsIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=UQDQW5SP; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="UQDQW5SP"
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 19E5526FFF;
	Sun, 14 Jun 2026 10:44:42 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XzdzaeVAe4CV; Sun, 14 Jun 2026 10:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1781426681; bh=WaEkx2BAApK/ULGPa+rFKoVfPtpe1V9iWZzyBPX2zF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UQDQW5SPp6rEwsBFUz8I4+a9BsTrov1UG4IFEBvrm4+qNtCssongADU44sI2JS4/0
	 6LUvDPtCsxoShNnLfce8tEVhhbIH9yvaKzHV3l3liOi7M1h42f5n05fEJWy8f3W9L9
	 TmOLDb8Cvlhjwj0WpCLxTWWJVTxjOIvCIe68b7KwiQsrOX9fpmYsbNIDzTICExlDhK
	 Gby1DrbVSBCeHywNWx0gD3hr6eDIlSKzlcJT+SNEEvzGkXqaS84UxQnyUQb4k4siXJ
	 j/MUHgp0qHR7TolTsqN7wnrXjNerNHtBddhJz37yemAwIdTZCGPCMDu3pCDSQvrOFC
	 ZhOlq1ipL469Q==
From: Marco Scardovi <scardracs@disroot.org>
To: ilpo.jarvinen@linux.intel.com
Cc: corentin.chary@gmail.com,
	denis.benato@linux.dev,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org,
	scardracs@disroot.org
Subject: [PATCH v2 0/1] platform/x86: asus-armoury: add support for G614PR
Date: Sun, 14 Jun 2026 10:44:11 +0200
Message-ID: <20260614084423.50723-1-scardracs@disroot.org>
In-Reply-To: <178119015973.12014.6231948241278781864.b4-ty@b4>
References: <178119015973.12014.6231948241278781864.b4-ty@b4>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ilpo,

Here is the v2 of the patch.

In this version, I have updated the AC power limits (.ppt_pl1_spl_max,
.ppt_pl2_sppt_def, .ppt_pl2_sppt_max, .ppt_pl3_fppt_def, and
.ppt_pl3_fppt_max) to match the correct hardware specifications for
the G614PR laptop model.

The previous v1 submission had underestimated these values (e.g. limiting
the PL1 to 90W and PL2/PL3 to 125W max). The updated values (120W for PL1
max, 140W default and 145W max for PL2/PL3) allow the ASUS ROG Strix G16
G614PR to utilize its full power envelopes correctly under AC power profiles
without artificial capping.

Thanks,
Marco

Marco Scardovi (1):
  platform/x86: asus-armoury: add support for G614PR

 drivers/platform/x86/asus-armoury.h | 34 +++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

-- 
2.54.0
