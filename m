Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB1E185B48;
	Wed, 14 Oct 2026 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016159; cv=none; b=tKNafYp6y4ZcvpABU5K3n5phIdJHfPmwjeDbnQCmmfC4CIddXgWpEIJtwXlcYVLvEbR7kV02mgKau71vlRf+7+UwMDC7IMz4ixbfMeuY0kWv1ph4m2wCFuDdveAgaltCT8If29snISIwKMbVI0C+xaUKnSfAo11F/mqhdJD215c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016159; c=relaxed/simple;
	bh=1TjLGw/7UxfK5Ymd0MRVW6+3G8beSsmPjJm2MrC/5wo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=B/hNzUkcOjEqMbYvEf+rfLIvbm5MW9HYHtdmfEIr5j4X5HsJSaj6kmfHiaEuNDHa8NTZnzdj5hksuYYDPro2TNwTKOWrDEK8WKdK8q7tW5jMKN2rgVAM9hTLSXuBPC1IrW/F2uXdgBSVDIeDBXd6K5anZiycMlhVT/f7yN20sF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqM9b1/O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqM9b1/O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C828C2BCC7;
	Wed, 14 Oct 2026 22:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1792016158;
	bh=1TjLGw/7UxfK5Ymd0MRVW6+3G8beSsmPjJm2MrC/5wo=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=DqM9b1/OAYMTuy0c9FuoVfCEYCrU4zwWWF9UtP8B3kpkTUeyZcOK1sNARdOPDSi/u
	 K1WmAYBxs1/4HUlJUFN1CrFyhqQOIfOrgxFsLXM6pTfnrzC82SxZ90mk7o47PJyPf0
	 Jm/kY9381uDxU7fuChIjB/sKaBw3WxdJmVvLMaYrajxvdLF4zsOi1r4aLTOnegFjly
	 ShCi+B9Dc8kWg6MSNg0pqMhu49rQztHIKbOLw8NW7QmU/tt+VQ1VMDP9vEQbyb0STX
	 Z8phh6N+ChY1xFB+FTnMG+csBvLJlHVgoLmQ1r++3bKDeJuXBkWJIgjfgD0wYJafsY
	 JN4m5S9V8jfqQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418E0CC6B2A;
	Wed, 14 Oct 2026 22:15:58 +0000 (UTC)
From: =?utf-8?q?Mert_Erdo=C4=9Fan_via_B4_Relay?= <devnull+mrterdo75.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] platform/x86: hp-wmi: Add Victus 16-d1xxx 8A26 and
 16-e0xxx 88EE boards
Date: Thu, 15 Oct 2026 01:15:40 +0300
Message-Id: <20261015-hp-wmi-victus-8a26-v2-0-3a9e40e00e64@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBCEX4X07JrdRit48j0Mh1JXWCM/aaFqC
 O8uxbu3+ZKZ+WYV2AsHdc5m5TlKkL5bQe8y5Rrb1QxyW1lp1IYQT9AM8GoForhxCpBbbYCoYER
 0FedGrcPB813e2+m1/HGYqge7MT2lRiNh7P1ns0ZKvb+CSEApHY11dCgwv9Stlefe9a0ql2X5A
 p/3JyDGAAAA
X-Change-ID: 20261007-hp-wmi-victus-8a26-119e000cbe86
To: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>, 
 =?utf-8?q?Ege_Kundak=C3=A7=C4=B1o=C4=9Flu?= <egekun67@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792016155; l=1813;
 i=mrterdo75@gmail.com; s=20261007; h=from:subject:message-id;
 bh=1TjLGw/7UxfK5Ymd0MRVW6+3G8beSsmPjJm2MrC/5wo=;
 b=C6z1mPZD4yLTKO3U8T+Qldo2CKiyJXy3iLNeysle22VwCFJ3wQ/AViO4LAtHb+S5y+QK8++4t
 a+artZkM6N+AIiEcQDhu6udOs1NK1Tt8OYPuJ8Q5JY38h8QFLhokJiB
X-Developer-Key: i=mrterdo75@gmail.com; a=ed25519;
 pk=bUOfewdT6wnBK6cWdxYDgGaI8ee0+BwtzPbg982vJP8=
X-Endpoint-Received: by B4 Relay for mrterdo75@gmail.com/20261007 with
 auth_id=1127
X-Original-From: =?utf-8?q?Mert_Erdo=C4=9Fan?= <mrterdo75@gmail.com>
Reply-To: mrterdo75@gmail.com

Add two Victus board names to victus_thermal_profile_boards so that
selecting the performance platform profile enables the GPU cTGP offset
on these machines. Both were tested with the patched hp-wmi module
built out of tree on 7.2.9, with AC connected:

GPU power limit reported by nvidia-smi:

                            8A26 (RTX 3050)   88EE (RTX 3060)
  performance, unpatched    60 W              80 W
  performance               75 W              95 W
  balanced                  60 W              80 W
  quiet                     30 W              30 W

With performance selected, both are back at their maximum after
unplugging and replugging AC. On 88EE the EC register at 0x95 was also
checked and follows the selected profile. Before these patches both
machines used an acpi_call workaround sending the same WMI query.

On 88EE the 0x1A query only sets cTGP, while on 8A26 it also sets
Dynamic Boost (the NPCF DTGP flag). DTGP reads back as 0 on 88EE, but
the GPU still reaches its 95 W maximum, the same as on Windows.

Changes in v2:
- Shortened both changelogs, test details moved to this cover letter
- Sent both patches as one series
- Link to v1 (8A26): https://patch.msgid.link/20261007-hp-wmi-victus-8a26-v1-1-8a256ac14908@gmail.com
- Link to v1 (88EE): https://patch.msgid.link/20261010-hp-wmi-victus-88ee-v1-1-e2200686bc2b@gmail.com

---
Mert Erdoğan (2):
      platform/x86: hp-wmi: Add Victus 16-d1xxx board 8A26 support
      platform/x86: hp-wmi: Add Victus 16-e0xxx board 88EE support

 drivers/platform/x86/hp/hp-wmi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
---
base-commit: 98f039265e580291d5e76a11b2072541fbb1c393
change-id: 20261007-hp-wmi-victus-8a26-119e000cbe86

Best regards,
--  
Mert Erdoğan <mrterdo75@gmail.com>


