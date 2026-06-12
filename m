Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06843DA5C4
	for <platform-driver-x86@vger.kernel.org>; Fri, 12 Jun 2026 12:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781266237; cv=none; b=WiByas8mj6yLGdUbJlE/e4kRTRAqRtgzOEvLdwaBwBV7pOxhjAWRP9xEzwyWUR21rKYj83KGMSKunG001lTTAUyRlEb2e4O/Ka05zm7LCAmI1U6K787tT7QllK4TwUIM5ZVB0gqgL8BzAShap4lCUtTBp4Fdf+Y0+zrwW+6oLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781266237; c=relaxed/simple;
	bh=+xk2t9X1QFz74cZWd2sKc/wVGTj/8IYtjR5FuJk9cM4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dL1+koJ2OTrpDdHFOmyhT9FfVnkm9jl9bwc+A3Jchy+0RbdALPA1Lwjo5QW4qBEE2eeMvMPBVAevKkmkDJEllqzUp9v9ftSxLhjrSlu1BFq/4sZW+tC0QyP6HyRPnfGV8hyMN61HVxvTmMZWfx2+qnOhtj4w8vSVeeiZR6d08bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fdMIdX8n; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fdMIdX8n"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1781266221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=veRg2/rl1NWCWnKgdXNN0bPyJk1dvxqCFcnIOjZVJX8=;
	b=fdMIdX8n97YjVExsc3fUZlcKQlqnmyt3YK8MDDVCVEuIGECgxHobH5decTheKlKyf2LRTS
	kjTsgk8y1r1s8AGOcBJCCleOgHSg+Pj5QKSEk5qTNLsIamcav1GrjRO/Usscls+3UsvFoS
	MrdroCq4K5ZO5s3AXVM3AYr576248Ag=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH v2 0/3] platform/x86: asus-armoury: more ppt data
Date: Fri, 12 Jun 2026 12:10:05 +0000
Message-ID: <20260612121008.970269-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

This patch series adds support for three more ASUS models to the asus-armoury driver:
the GA402NJ, GA403UM, and FX608JPR.

Cheers!

Changelog:
- v1
  - Initial submission
- v2
  - Fix order of FX608JPR

Denis Benato (3):
  platform/x86: asus-armoury: add support for GA402NJ
  platform/x86: asus-armoury: add support for GA403UM
  platform/x86: asus-armoury: add support for FX608JPR

 drivers/platform/x86/asus-armoury.h | 92 +++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

-- 
2.47.3

