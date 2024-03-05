Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20AD548F0
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636372; cv=none; b=iOrk8pPLLZqXbRkX101zIPr/8wGo+SNCLyF88YDSe6uA2yNxgfHTNBN1CYosJ1brgmaeyay3m/DVso/WSx4PFaP6B5wncUe0yGiAWqIK7W6KSkMaxOvOkAkEkT9nrOinnShBpUycwhw0nicFFaRO7yAy5hybpciMl7phSWrpdOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636372; c=relaxed/simple;
	bh=sbz7IAGhakqXhD/4oACaPyAsY+nGzfa4LRS4j8yFcXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P78mFjVmWPR+u8gLlhmsZBPcvPmz9ejGcrshjJqLROJFY0IRH6P97aSqhLu5RPi2cDpFYgZmweA9Cyh+/Aig9mMR89I2YLIs/dt9PgysT1CseHi+uxp50bDQeJGMhkv6e3DdNP72MUyCrTnuwPJcAioMdC96kzt896OvDRExs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Dls/e62f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Dls/e62f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709636369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zmbK6AYcLZL6yFYyf+OP5nnp9BHT1LGiXivEh+rb0mg=;
	b=Dls/e62fdw1XkSnSrhAn11WncBJ8gijRMP7rCbmf2csw0G/U+RoC2b4UxSE4arYlE7/H7q
	yzjUvbisgIOx8rzBe9JCQqGf0uTCDSvDtRo4WEbqcUC+l3MHiZ9acA55+T2cK+AFAGRJCK
	bimE+jPcljIc8c9lVCVVdvHm5H22eDY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-480-xvDmXPDsP7GheBPv6FTcPg-1; Tue, 05 Mar 2024 05:59:26 -0500
X-MC-Unique: xvDmXPDsP7GheBPv6FTcPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05BD580F7EC;
	Tue,  5 Mar 2024 10:59:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DA4FD1C060DC;
	Tue,  5 Mar 2024 10:59:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v4 0/5] x86: atom-punit/-pmc s2idle device state checks
Date: Tue,  5 Mar 2024 11:59:10 +0100
Message-ID: <20240305105915.76242-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hi All,

Here is v4 of this patch series to add S0ix related s2idle
checks to the pmc_atom and punit_atom code.

Changes in v4:
- Add pmc_s2idle_check_register() helper which is a stub when
  CONFIG_SUSPEND is not set to avoid needing more then 1 ifdef
- Add a couple of Acked-by and Reviewed-by tags

Patches 1/5 and 5/5 have Acked-by-s from the clk resp. x86 maintainers to
be merged through the pdx86 tree together with the rest of the series.

Ilpo, I believe that this is ready for merging now. It would be great if
you can still pick this up for the 6.9 cycle. OTOH there is no big rush
to get these debug patches for older platforms merged. So postponing
them to the next cycle is fine too.

Below is the previous cover-letter of v3 with some more background info:

These patches are an upstream submission of a patch titled:
"Intel Atom suspend: add debug check for S0ix blockers"

Which I have been carrying in my personal kernel tree for years now.
This code originally comes from the latte-l-oss branch of:
https://github.com/MiCode/Xiaomi_Kernel_OpenSource

And has been posted on upstream mailinglists before by
Johannes Stezenbach, whose authorship I have kept for
the 2 base patches and has been reposted by Takashi Iwai
and at one point in time I picked this up from Takashi's
reposting as can be seen from the S-o-b lines. Unfortunately
I cannot find the original postings, so I have no link to
those.

The original version of this added some ugly hooks into
the intel_idle driver which I presume is why these patches
never got anywhere upstream.

With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
functionality this functionality can now be implemented cleanly
and that is what this patch-series does.

Changes in v3:
- Reword commit message of patch 3/5 and 5/5
- Drop confusing /* Low Part */ and /* High Part */ comments in pmc_atom.c
- Add punit_s2idle_check_[un]register() helper functions

Changes in v2:
- Move CLK reg defines to include/linux/platform_data/x86/pmc_atom.h
- Drop duplicated "pmc_atom: " prefix from logged messages

Regards,

Hans


Hans de Goede (3):
  clk: x86: Move clk-pmc-atom register defines to
    include/linux/platform_data/x86/pmc_atom.h
  platform/x86: pmc_atom: Annotate d3_sts register bit defines
  platform/x86: pmc_atom: Check state of PMC clocks on s2idle

Johannes Stezenbach (2):
  platform/x86: pmc_atom: Check state of PMC managed devices on s2idle
  x86/platform/atom: Check state of Punit managed devices on s2idle

 arch/x86/platform/atom/punit_atom_debug.c  | 54 ++++++++++++++-
 drivers/clk/x86/clk-pmc-atom.c             | 13 +---
 drivers/platform/x86/pmc_atom.c            | 79 ++++++++++++++++++++++
 include/linux/platform_data/x86/pmc_atom.h | 25 +++++--
 4 files changed, 152 insertions(+), 19 deletions(-)

-- 
2.43.2

