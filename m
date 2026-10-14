Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD42D6E5A;
	Wed, 14 Oct 2026 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016159; cv=none; b=cLJ61SISIPRbLZ2ogNlRcfeE7APNs5wIJ1O6Vx3HDVoK6QsaA0gLcSP/z3RlzqbQ85nR22ctn+rpoPx6AcRF2AhvszA0cGeSsvXnwJ3GW633/upecOtjDcWvbxRq2iYGa7R9xTBIggcxrZ+IbriviLH1OzILoEpWGxW/RQigZdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016159; c=relaxed/simple;
	bh=KiKQf58YhfqJ55SK2Fon15/aCzDyNxAQqqUSIZfY3Go=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kwsm8k7RFEX+H9Ghf1fm3p9wO3pkCyfnmtEBwn4bbejNmflRLEvykUaUV+wmL19ev+Y1NXQWbOJmUnZllnYkC7UO9nQCEriQhxUJoe5nsDN4Bexzqcv9+Smo9ceegosiCb6isUm2etRJ5Rr1ok6KIU204AEs1Wzo02HrG0n380s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7OZvvn8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7OZvvn8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76F19C2BCFC;
	Wed, 14 Oct 2026 22:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792016158;
	bh=KiKQf58YhfqJ55SK2Fon15/aCzDyNxAQqqUSIZfY3Go=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Q7OZvvn8e6fuvNc1twpqKXR80t9oPytgqXSAXKaDc3pqYyDQRec+EA/DL9zG+xtmt
	 T9XkfFn4hZ6jWKumITg09vXKSEPc+MPZYw0NQ4uRLrWUPvdmeg/LFf1Qk6yHe3QOUQ
	 1nIvBoj+mkew1aExq8KAGN+aB5Zow6aSt5v07bhRR9YQIl6+8J5LOyt2bT/LI2MwxV
	 p2JKEhk4BlM0R8Q9gun3l4dDd7hQRgNqi1tpEzjP0Q3go2qz7856gJeFIHg4ZY+MbR
	 3Bs1DwIH5lxFpOG5uR0UrZ5kRRjP8ZqIitdh7QepIwmuT4auoVgv8yPErSo6wLDjPa
	 0f1DqG9PUtTEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E9BCC6B24;
	Wed, 14 Oct 2026 22:15:58 +0000 (UTC)
From: =?utf-8?q?Mert_Erdo=C4=9Fan_via_B4_Relay?= <devnull+mrterdo75.gmail.com@kernel.org>
Date: Thu, 15 Oct 2026 01:15:41 +0300
Subject: [PATCH v2 1/2] platform/x86: hp-wmi: Add Victus 16-d1xxx board
 8A26 support
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261015-hp-wmi-victus-8a26-v2-1-3a9e40e00e64@gmail.com>
References: <20261015-hp-wmi-victus-8a26-v2-0-3a9e40e00e64@gmail.com>
In-Reply-To: <20261015-hp-wmi-victus-8a26-v2-0-3a9e40e00e64@gmail.com>
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792016155; l=1146;
 i=mrterdo75@gmail.com; s=20261007; h=from:subject:message-id;
 bh=L1CH7dlpQUM4NNhDRcqjtEsJk9TWWjgNN0gDBPxarCY=;
 b=11xG9szFUV7nbSEEVY2pC/SJryjsjF31k0UFfR3IXsMvt6cUqDy5OYltf7IOJ9aJ8p2qinc0c
 GXQYbZrlQaFBv1zjlDK+vlA42PBAtqi7XRSKzJgTg9CcIo4SELJBB6g
X-Developer-Key: i=mrterdo75@gmail.com; a=ed25519;
 pk=bUOfewdT6wnBK6cWdxYDgGaI8ee0+BwtzPbg982vJP8=
X-Endpoint-Received: by B4 Relay for mrterdo75@gmail.com/20261007 with
 auth_id=1127
X-Original-From: =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
Reply-To: mrterdo75@gmail.com

From: Mert Erdoğan <mrterdo75@gmail.com>

The Victus 16-d1xxx ships with at least two DMI board names. 8A25 is
already listed in victus_thermal_profile_boards, but 8A26 is not, so
on those machines the driver falls back to the generic thermal policy.
Selecting a platform profile then never issues the Victus performance
mode WMI call (HPWMI_SET_PERFORMANCE_MODE via HPWMI_GM), and the
firmware keeps the GPU's +15 W configurable TGP offset disabled.

Add 8A26 to the list so these machines use the same Victus thermal
profile path as 8A25.

Assisted-by: claude-opus-5-5
Signed-off-by: Mert Erdoğan <mrterdo75@gmail.com>
---
 drivers/platform/x86/hp/hp-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 387f60e88..15f1e9f63 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -234,6 +234,7 @@ static const char * const omen_timed_thermal_profile_boards[] = {
 static const char * const victus_thermal_profile_boards[] = {
 	"88F8",
 	"8A25",
+	"8A26",
 };
 
 /* DMI board-specific feature data for Omen and Victus laptops. */

-- 
2.56.0


