Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAD3DD53E;
	Tue, 21 Apr 2026 20:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776802277; cv=none; b=lKe/5OXImxij0gq2hKkdmt10uX5MIflVMDQMlm31/DjUPFvBskOeInvJHbeUq6+wmfDpLWKX2zTCVo5RPC5n/C40ZMSk4NWK6imt1FV15zC5MoHAqcEHKn6W6ADekME+skuNAtPpAUwVN0SgEjSj69k3IhLqndHPFeHaywCxWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776802277; c=relaxed/simple;
	bh=BMmGHqnU0VbT7a2h4q26RIinQIPIg+3Qu3IFaMBEbZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nm+XwbTBVAPX1dlqmgfFZXwtxJFKsAGySQVyxIMqYu2kZ5ScoFDzLW81G7kA3nXGj6+mcsFn2WqqJkle643+byBo2ao23Gz10F4UMQPW+GZhAYn7BWs4KRCYSmMQVUSQqdZTJBonnv5ErUXg3zDbnuYqebSPrn7ClQ4IlpqNHD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=UI/pxU/8; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="UI/pxU/8"
Received: from wse-pc.fritz.box (i5C75F683.versanet.de [92.117.246.131])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id B857C2FC0223;
	Tue, 21 Apr 2026 22:11:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1776802266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=17SF+WJJu5Owo9PF3gA+zi4NQqL9YV7WDcVIq+J7TYs=;
	b=UI/pxU/8PokNMdIieXYu6pHyaBEtep1hTjHEiieA5Eqz6wbx7OWr0IEflBD+qDWScu20mQ
	lJpMX9Zs62PTo8UBdOuonAGk6a/noeWj47GTfakbz5lQ2JJ2flHEAczroLvxoHts+wHlOI
	yl/xwOLSJYjUlwto3OHg67Bw+nlHZdc=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Werner Sembach <wse@tuxedocomputers.com>
Subject: [RFC PATCH 0/3] platform/x86: uniwill-laptop: Another improvement and another feature
Date: Tue, 21 Apr 2026 22:01:24 +0200
Message-ID: <20260421201103.142403-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This series is based on another not yet accepted series
https://lore.kernel.org/all/20260417050912.5582-1-W_Armin@gmx.de/

RFC because of that, because the third patch is not yet tested, and because
I have a question regarding the 3rd patch:

Should I abstract the call to wmi_evaluate_method away in a wrapper
function in uniwill-wmi somehow, or is it ok to have it straight in the
uniwill-laptop code like that? It is quite self contained.

Best regards,

Werner

Werner Sembach (3):
  platform/x86: uniwill-laptop: Make super key init lineup with other
    inits
  platform/x86: uniwill-laptop: Implement lightbar for XMG Fusion (L19)
  platform/x86: uniwill-laptop: Offer support to activate local dimming

 drivers/platform/x86/uniwill/uniwill-acpi.c | 195 ++++++++++++++++++--
 1 file changed, 182 insertions(+), 13 deletions(-)

-- 
2.43.0

