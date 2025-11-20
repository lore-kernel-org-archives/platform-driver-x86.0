Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62672EDD78;
	Thu, 20 Nov 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675567; cv=none; b=PXYslYTwo1zu7e2+3ELeIb/dihJZFzGOf2ooa02Cct9NcYauY/hib20refDeK5HIaWYJkd6lAJEgvZiNRWXdnm01+vDBr/vVWxy2gOZcB3bzKwgigN0prZZYtvxOwbc4T+aog94So/A5pMSZzpeQnBE4zExmg7XxXnWSaICn+x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675567; c=relaxed/simple;
	bh=HQaPLJAfT8RdWWuvDo+Ij/+rfCVAK4jaP2XYw+ls5+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JUfCdlPDkafxL2gP/wBNGALHY0Z7UuXoWKZLGFqqPkymh027VLkU08KyW1PQXcursMiR4kQx9fzSs4vOIRw6yfHqqsvfXqOIFCVntH6WXFHCfBVtmIsMPXZuoSndMZ6BfWQY8OLKh/Jn32IBQpTkvP6D3+uF0EaJg7a7fPBR0yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=iEegyXrQ; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="iEegyXrQ"
Received: from wse-pc.fritz.box (pd9e597c7.dip0.t-ipconnect.de [217.229.151.199])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 45B2F2FC0055;
	Thu, 20 Nov 2025 22:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1763675562;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=USPbSYD5NrHmNb8VxMgA4AxhixQiJPCfKPu2mJhl8Ks=;
	b=iEegyXrQbfuL3yH9utwObRMyzx4xnkOOHB+Lfpl3yz/7NQyqAr7Ls9AAhPExIARWEoSQJS
	hBxf9+Ckqs7IDmJVjTO8dun7E2BbuyqNvJ0e55pPCfhOyiBi1f5LIM+rPBZ8EbR302et7W
	XxQT0a9EchmQ7zjAdan5gF/EU94BeL4=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [PATCH v3 0/2] Start of upstream support for TUXEDO NB02 devices
Date: Thu, 20 Nov 2025 22:49:40 +0100
Message-ID: <20251120215240.436835-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the Uniwill driver from Armin now accepted I want to push the first
big addon to it that I worked on in parallel.

First this adds all current Tuxedo devices to use at least the input part
of the new driver.

V1-V2: - Drop the cTGP implementation to push that in an own patchset
       - Reorder patches
V2-V3: - Fix comment style
       - Be more verbose in commit messages
       - Add upcomming TUXEDO InfinityBook Max Gen10

Werner Sembach (2):
  platform/x86/uniwill: Handle more WMI events required for TUXEDO
    devices
  platform/x86/uniwill: Add TUXEDO devices

 drivers/platform/x86/uniwill/uniwill-acpi.c | 364 +++++++++++++++++++-
 drivers/platform/x86/uniwill/uniwill-wmi.h  |   2 +
 2 files changed, 365 insertions(+), 1 deletion(-)

-- 
2.43.0

