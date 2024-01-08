Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A040C1F
	for <platform-driver-x86@vger.kernel.org>; Mon,  8 Jan 2024 13:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LnYq5wRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704718967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=834OBtADOfD8fDcaTuEfxwxKzyURS/rvXADeGnaGoeU=;
	b=LnYq5wRvTXQHMkgLEZy/Rpta45MYIs2fEcq4E/MfXE31/9n5SjpBwDUnxqWa9he+7Zcyft
	2CPk5ImYECrjheWGhOGGGdY8rx/FjWsU2GYuXIuPuqXeHXc3nIVMJaalZ0TBSIC+BFc+aR
	gNga4Yle8H068/gPKyiHY2weotnXMoI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-615-WVTiAZhJNz-Q0D-MbuJIRg-1; Mon,
 08 Jan 2024 08:02:44 -0500
X-MC-Unique: WVTiAZhJNz-Q0D-MbuJIRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F26E229AA38F;
	Mon,  8 Jan 2024 13:02:42 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.88])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1BCE65190;
	Mon,  8 Jan 2024 13:02:39 +0000 (UTC)
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
Subject: [PATCH v3 0/5] x86: atom-punit/-pmc s2idle device state checks
Date: Mon,  8 Jan 2024 14:02:33 +0100
Message-ID: <20240108130238.540794-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

Hi All,

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

clk and x86/tip maintainers, it is probably the cleanest if this
entire series is merged through the pdx86 tree (*). Can we have
your ack for merging patch 1/5 resp. 5/5 through the pdx86 tree ?

Changes in v3:
- Reword commit message of patch 3/5 and 5/5
- Drop confusing /* Low Part */ and /* High Part */ comments in pmc_atom.c
- Add punit_s2idle_check_[un]register() helper functions

Changes in v2:
- Move CLK reg defines to include/linux/platform_data/x86/pmc_atom.h
- Drop duplicated "pmc_atom: " prefix from logged messages

Regards,

Hans

*) Andy recently mentioned that it might be a good idea to move
some of the arch/x86/platform code to drivers/platform/x86,
arch/x86/platform/atom/punit_atom_debug.c which is a completely
standalone driver definitly is a good candidate for this



Hans de Goede (3):
  clk: x86: Move clk-pmc-atom register defines to
    include/linux/platform_data/x86/pmc_atom.h
  platform/x86: pmc_atom: Annotate d3_sts register bit defines
  platform/x86: pmc_atom: Check state of PMC clocks on s2idle

Johannes Stezenbach (2):
  platform/x86: pmc_atom: Check state of PMC managed devices on s2idle
  x86/platform/atom: Check state of Punit managed devices on s2idle

 arch/x86/platform/atom/punit_atom_debug.c  | 54 +++++++++++++++-
 drivers/clk/x86/clk-pmc-atom.c             | 13 +---
 drivers/platform/x86/pmc_atom.c            | 75 ++++++++++++++++++++++
 include/linux/platform_data/x86/pmc_atom.h | 25 ++++++--
 4 files changed, 148 insertions(+), 19 deletions(-)

-- 
2.43.0

