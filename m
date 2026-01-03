Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91C74A21
	for <platform-driver-x86@vger.kernel.org>; Sat,  3 Jan 2026 00:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767400671; cv=none; b=cBMgrYBwl2qrzye5kbCyhjOt4NpLoekc85aBC4XqoGwYDLvJ7BTOXNJmwlP8JgJRb9qWW/zn+TZdYr5lO/+VeZ6oKixL+FP/6/wIClfDlQlMsZFwV17ztUuIIrnrrKVddeE+9V3tumzWtmQgryNPbOhgFSJ3lhMJP3xEeRoG4Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767400671; c=relaxed/simple;
	bh=aTQfdMOZBerJBy3XzsTgkGWqMwK9B54INXBv5lyz3Jo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z5Ir+/S6jVxdXOasQYs22qM2FIIGKbUWuxNubTMsF5U4Qzen43Z1sYBMixPFXxKEmACNu34KRn+iMVqVIpjAVXIDbpc0oFH2CrPuYJiuhgyPPRFQfVOvQXQFjNWACjXHyHkbb7SGIfyRqadtPPb5Islmnb0tH9BZO9m49ofS0wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ceon/Hs4; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ceon/Hs4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767400666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HbNodBb+FU9rSRI76CfyDtUQHPfSYMtYmsQz0ukTpk4=;
	b=ceon/Hs4l5I+4cUQwg6glQekk2dl6rp1RW2zPecS5BMSBI7pqc3Dvmb/S7sn5JSYD+tqWZ
	eZIINYsz2DaOmnKETECllQxChP/D2bmTksZrE6dotL/gB9Dsqt0q/eG0rhWIgwWAp6G8EW
	b9yfruCWfdkZNFiT8C1aQfPKEAIeR94=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 0/3] asus-armoury: add support for GA403WM and improve GA403U
Date: Sat,  3 Jan 2026 01:37:28 +0100
Message-ID: <20260103003731.404383-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi all,

Happy new year! This series adds support for the ASUS ROG Zephyrus G14 GA403WM
model: the previous patch for GA403WM has probably slipped through because
of me sending it as soon as I could and users adding models with only a few
hours sifference from each other.

In addition I noticed people sending more GA403U ppt values: they are the same
as GA403UI, but I want to be on the safe side so GA403U is now matching only
GA403UI and I have added a new entry for GA403UV.

Denis Benato (3):
  platform/x86: asus-armoury: add support for GA403WM
  asus-armoury: fix ppt data for GA403U* renaming to GA403UI
  platform/x86: asus-armoury: add support for GA403UV

 drivers/platform/x86/asus-armoury.h | 66 ++++++++++++++++++++++++++++-
 1 file changed, 65 insertions(+), 1 deletion(-)

-- 
2.52.0

