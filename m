Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5008397697;
	Mon,  6 Apr 2026 19:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504237; cv=none; b=JUH5xeK2KE589Xjn33VsVUZd4zaylUXEFz2QnYeSZFmi/hqYZuaPT6otF7YkI4Hc9LPu+qZYCxy94KLKTB/BZT4ni9tHKWj8vTcGG2XMfik8+v9jzFRUyXzTYW25xx3c4uUrNnZ0lD4NGXzQln2yze4GJolZ5eKTom0fb2Syo+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504237; c=relaxed/simple;
	bh=/GHcXEpHI4q28HOLkAa7hpPbMfQFN2h8/D8fV255OJk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ctce8rW/Jr+5O6dg0Z31ifFokqQCMggTDuJrA3OSDNoONDsma3+9/TlInjOfbbF2tEsUAMHUDx0pzEhgd+WHuLd6MAoqHRmQjSLPQriTzEuiM5vJy1+0LmpUPy0OKcdFNct/9952oOM+ULV9+3Q3gX2W87dQ7lkSt3L7rupdGiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=rr1s8eT9; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="rr1s8eT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1775504226; x=1776109026; i=w_armin@gmx.de;
	bh=h82fCWuRoIRPaLTJpQqASL0Fssnz7ZuXYX6XEbm5Wyw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rr1s8eT9iS0UNETsOEM5L7zYb6Un2YkaNrKbxBdfxTA0xOwbkYo5rE7HxlnGJ0Yo
	 lNGw2sCQE1lHfAceXjxAc/MgRR38GIpeOC2tMn2h0Fc7JRXsa/bTRiBdserMVA/bx
	 nX9cTubDCNfWaxcvsVdYR+PICLZ+/KD1HbtCRqWa9ea75qsVV+yigEARSE2OCwBwU
	 NU7FrJd8CabXKsxK/JqkOFm5jf7TCL63xmLeJcKwKFnOzaYvTlXHNxnUinlxvehQh
	 os1P4IJKQuOqUjuGJYALWBbR+5qkU5yVaRbp+av/D0fhdtL4gB/ySrSQOyESw0xIL
	 1R0AIufdMWuo3hOpuA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MDhlf-1wIOSj0kh5-00DJFL; Mon, 06
 Apr 2026 21:37:06 +0200
From: Armin Wolf <W_Armin@gmx.de>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: wse@tuxedocomputers.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] platform/x86: uniwill-laptop: Fix behavior of "force" module param
Date: Mon,  6 Apr 2026 21:36:50 +0200
Message-Id: <20260406193653.7799-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260406193653.7799-1-W_Armin@gmx.de>
References: <20260406193653.7799-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Qx5r4QbN88INLb4S2JkyI6lrD6hbIr6qLxCkQg+w9rXrqD0c81Z
 2cMv9yzEotVj4lT4Rjl4mYN5uHjqI7PGNXo5HRtpfbCqT/VWOjzckHPcGpGFymzCsiWACY1
 zFRHcyq6RJJoSIse6m0BYutu4Kiy0WIC2vjF8dC9Ef4lDYdGjSmCV1rdmNDt5dP7Jv5KZSc
 dC5aTSJave0x95ogtpDwg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:d7b9ANBpoRU=;28dsqzDYt8tQ/mlQDCSayjn1T54
 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

Users might want to force-enable all possible features even on
machines with a valid device descriptor. Until now the "force"
module param was ignored on such machines. Fix this to make
it easier to test for support of new features.

Fixes: d050479693bb ("platform/x86: Add Uniwill laptop driver")
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/uniwill/uniwill-acpi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfor=
m/x86/uniwill/uniwill-acpi.c
index 5551f193c2c1..7c7ea0e76966 100644
=2D-- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2481,8 +2481,6 @@ static int __init uniwill_init(void)
 		if (!force)
 			return -ENODEV;
=20
-		/* Assume that the device supports all features */
-		device_descriptor.features =3D UINT_MAX;
 		pr_warn("Loading on a potentially unsupported device\n");
 	} else {
 		/*
@@ -2500,6 +2498,12 @@ static int __init uniwill_init(void)
 		device_descriptor =3D *descriptor;
 	}
=20
+	if (force) {
+		/* Assume that the device supports all features */
+		device_descriptor.features =3D UINT_MAX;
+		pr_warn("Enabling potentially unsupported features\n");
+	}
+
 	ret =3D platform_driver_register(&uniwill_driver);
 	if (ret < 0)
 		return ret;
=2D-=20
2.39.5

