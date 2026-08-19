Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768C30B514;
	Wed, 19 Aug 2026 15:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787151779; cv=pass; b=MB9cNWtIJ+/6MjmixWrZQeVYfnQdb2SIWF73U9g+Ta3UIBdq5DCB0TRDgUkWYsRAlFqRFtAi5S9iBK14qFwvQXFJMG2cEMekGyZvqcYHYlMGInrjdCdudYysGGvltJTYWxFrpjv5HRuuFRHK2P2SV8KIgasF59bMMwTJIvTL2Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787151779; c=relaxed/simple;
	bh=m3/zjIJSD+vXrzk6rhthVn9Qvj8nBL+iV6kZjDZ5YlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PPUBC52lblc0+SEi8u7ku+B/HT6HmDU8YK5oA6cF4CjExQUE/o6jVGEJDb/piCBkeROdfo+OAZXIn1txdFpo3H/uaK6wr9cKB/v8G4obUFCamOIPSWyGI4JOejVIj0DN3GBNgFvhBaJwYSJfKIxQen+OlbYsNHQz6cQjxFmRjxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net; spf=pass smtp.mailfrom=moh53n.net; dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b=IGDvQ4Jb; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=moh53n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=moh53n.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=moh53n.net header.i=moh53n@moh53n.net header.b="IGDvQ4Jb"
ARC-Seal: i=1; a=rsa-sha256; t=1787151771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=esz8luwtA74Da7sU3ERxXJCqPcElxLuusCel2ZrVsWNi2G0ThPtu3r73Y+zFowTFIgzDUi6PZz5F5AD0bXFshfTmjGR0goqIgeEkXaCxLqqAd8KzmJDp9cw5NoM8Mb+lZoE5Q8ONTtgeuvW/VaeNGLjhpIKTfB6kslozZY19wYY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787151771; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HHrUYYDSSlPVwfozUxV1ycfTth9Y4+4LVqyHkpMPRbc=; 
	b=Pi9WSeUMNYNI00g8fkw8zleATKi4lfiMwcMMPBdxWQh+j5n7qgaolOuCYAPQQSbYtaTqUjfbrJHMl3r0VxUY1ugvPeQnqadtlQiR6Ic6V7/eUOzVXzhVQVXdrslaXokByNa6iZ0n3fBLk9EjV/1dOQ+gx+ODGBY6KZZY5Uxll+g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=moh53n.net;
	spf=pass  smtp.mailfrom=moh53n@moh53n.net;
	dmarc=pass header.from=<moh53n@moh53n.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787151771;
	s=m; d=moh53n.net; i=moh53n@moh53n.net;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=HHrUYYDSSlPVwfozUxV1ycfTth9Y4+4LVqyHkpMPRbc=;
	b=IGDvQ4JbdX3E1r+UNkfD5Wg3yS1gba8PWtckBWM8Qs0hxOX/zfgjtspKIXtTLZyV
	BMHuDETbMG8p8c6TBPy2FNtIcVAZYRzMN5ijEJS01SiBSE1cyQCRb5uCmW9Y+7ACXod
	yPLollgajmJVt1ftPX9Qz/xoG9i5g5ahI5Yc14sE=
Received: by mx.zohomail.com with SMTPS id 1787151769136622.4658863488661;
	Wed, 19 Aug 2026 08:02:49 -0700 (PDT)
From: Mohsen Tahmasebi <moh53n@moh53n.net>
To: "Lee, Chun-Yi" <jlee@suse.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohsen Tahmasebi <moh53n@moh53n.net>
Subject: [PATCH v2 0/3] platform/x86: acer-wmi: enable hwmon on Aspire A315-58G
Date: Wed, 19 Aug 2026 18:31:55 +0330
Message-ID: <20260819150205.19453-1-moh53n@moh53n.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Some Acer laptops expose the same WMI sensor interface without necessarily
supporting platform profile functionality.

This series cleans up the quirk fields by using bool, separates hwmon from
platform profile support, renames the predator_v4 quirk field to
platform_profile, and enables hwmon support on the Acer Aspire A315-58G.

Changes in v2:
- Use bool for boolean quirk fields, as suggested.
- Completely split hwmon from the predator_v4 quirk field.
- Rename the predator_v4 quirk field to platform_profile, as suggested.
- Enable hwmon for existing Predator-v4 quirk entries.

Link to v1: https://lore.kernel.org/platform-driver-x86/20260813154939.9850-1-moh53n@moh53n.net/


Mohsen Tahmasebi (3):
  platform/x86: acer-wmi: use bool for boolean quirk fields
  platform/x86: acer-wmi: split hwmon from platform profile quirk
  platform/x86: acer-wmi: enable hwmon on Aspire A315-58G

 drivers/platform/x86/acer-wmi.c | 56 ++++++++++++++++++++++-----------
 1 file changed, 38 insertions(+), 18 deletions(-)


base-commit: bd5f485f3f026225b86573e559af0b7254ef4184
-- 
2.54.0

