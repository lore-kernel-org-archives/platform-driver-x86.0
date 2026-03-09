Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4535349B1C
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Mar 2026 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081377; cv=none; b=hnhpyMOSmWeN3cOUJJmHMALwPfXCWdPT9ICZ5JX1mZZChxEvjg8ji50i+2eXQvhXPKaEJ8y6+UlWV4pi9cKFCqMU7bFn5nwbUBWxwt7KkKJHhyzQYZm1CktsZVKexoDgC8KRLcLRxrPOPEUSk77sSIaauXIbBTEcy+buhM7rGIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081377; c=relaxed/simple;
	bh=WvfqAhwXG/aPbHIq734LNU/IAgxONLMULDcFm/6KUow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HALZt5LNCh2R2XMc7xYNae4gBe3DPSUVtPQahUFJ1AkykwOR+WTDBqBl0gnIwuvhe1LMp9N/gvb/ZZA8Yt6WfHEKSusMUuWOAgcCLTmmDNqhEiFt7UxpCd4ibdGIKUWSUnPHdvw5GYWiMHrrBkdRM1RjADp7DS217hbBOg9rgms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e1p87pVk; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e1p87pVk"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773081374;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h5r+E5mw2OC08eXfZdNJ2POuHnDdz3XsT+jvzpe6axI=;
	b=e1p87pVkSN6gtYbwUf5g9fweWlJvwY+NnXxgjs/xI6VOFyxZDI25YAkZp9iTVGZazvw+5r
	QolF40XhLTj9jGkZanD2FOGQbuwQH9pc1dbvI9pMHwayvwWNgVKXOMwO0t1pZT6o4ir6D1
	NaAmPJg/2Lv2bUWeRUig3DATw9vm0JY=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/2] platform/x86: asus-armoury: add more ppt data
Date: Mon,  9 Mar 2026 19:35:56 +0100
Message-ID: <20260309183559.433555-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

this patch series includes PPT data for the models: GA503QM and G614FP.

Cheers,
Denis

Denis Benato (2):
  platform/x86: asus-armoury: add support for GA503QM
  platform/x86: asus-armoury: add support for G614FP

 drivers/platform/x86/asus-armoury.h | 48 +++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

-- 
2.53.0

