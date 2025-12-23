Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095AE31A807;
	Tue, 23 Dec 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766488731; cv=pass; b=tYkY3Ydv3ZDzEWIVRRU3DI+Grc8OY5EV9wb7+KEv4V5BEb9O+QtuSL7vbgiJqkBoLfgfachG+nXLfU552jsXfDlvODnSrBic9JyVUB/LbpZypjTr72QblCAg8hMniGg+8RsN8T9UIenTrIoWo8EzBTYbxMHCrF/u0H1ifBNNvIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766488731; c=relaxed/simple;
	bh=QClljwaaoe1UBFyeZQYvu2NveTEIdOGp6VqX67o1OBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hAXWt0I5WhyPQ0hASqoanrgwZXK1i1mbDxcW9y9pNQm6Vuhl5hOUiTGKKF6ejZLHrpPhmkTcv/e8lP7awBfotrMq9enXQequuHuqYf8nC3O58zbYqQ4aMtNjUl0JJO6CoVQvro3h8Od30cA36h+NEQe127PcKRDSXHW44QAxI64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=ZtXKBhUy; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="ZtXKBhUy"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id C6E38109D3942;
	Tue, 23 Dec 2025 20:18:43 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZI_UotduN72F; Tue, 23 Dec 2025 20:18:40 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 8B61410A0ECCF; Tue, 23 Dec 2025 20:18:40 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766488720;
	cv=none; b=mrlVJObpRq70bixu/6xU7jWZYLX+PRVZrL3xGmVnTnU7h/n616wIYxncYrZx0yp8zxP84FHwDUDsR1r9lmcym6XunnkuIi1ANeVYLNe0PVf6m/n9LXB+JuM7UcviTJrqdAUOEXY+GTwR/+XMhitwT3L1OIvVC1sb//d5Y+wuLkY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766488720; c=relaxed/relaxed;
	bh=QClljwaaoe1UBFyeZQYvu2NveTEIdOGp6VqX67o1OBc=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=Jsm2Cse1P0Dmm+ntw9wd6trMeh40yYN8j9tGdnmwe/4HKth14TzR9Y96M//+IgSUrybSm/IzYmMJRCefKspixhKWllTZWXW6YvcchgHlm447fxPsDfgY/xMfl7uTlN/bBCmGnlr1CK/HOFvV+qBznJlRPhCMpAXjv6H6KA9AvyI=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 8B61410A0ECCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766488720;
	bh=QClljwaaoe1UBFyeZQYvu2NveTEIdOGp6VqX67o1OBc=;
	h=From:To:Cc:Subject:Date:From;
	b=ZtXKBhUy4nRqtESuGOHAL1UCkAmt3YO8h+LLhOHbDDGN0ekIuQL3ahUJH240Kc8Ra
	 sTULxtsPrxoSqJTUEHywS3zQtlgoYYutZSjqREsMbMQGNY+779PnKE+OSa8m+FD3JU
	 /cbbGLWxIStaYZcoHQ7qDm95NKGZSfiIX2mHZCA8=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: platform-driver-x86@vger.kernel.org
Cc: kuurtb@gmail.com,
	Dell.Client.Kernel@dell.com,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: alienware-wmi: fix typo
Date: Tue, 23 Dec 2025 20:18:38 +0900
Message-ID: <20251223111838.2579217-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/admin-guide/laptops/alienware-wmi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Document=
ation/admin-guide/laptops/alienware-wmi.rst
index 27a32a8057da..e532c60db8e2 100644
--- a/Documentation/admin-guide/laptops/alienware-wmi.rst
+++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
@@ -105,7 +105,7 @@ information.
=20
 Manual fan control on the other hand, is not exposed directly by the AWCC
 interface. Instead it let's us control a fan `boost` value. This `boost` v=
alue
-has the following aproximate behavior over the fan pwm:
+has the following approximate behavior over the fan pwm:
=20
 ::
=20
--=20
2.47.3

