Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492A18F48
	for <platform-driver-x86@vger.kernel.org>; Sun, 31 Dec 2023 16:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iH9NcoW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704040411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W8veCn/nQGSZCEEveWsfYo1C47dAQy6IZmTA7gPkJeg=;
	b=iH9NcoW0QQcanmIDl9egeSmLj3mQs3pKivFBVjhGi+DbBcQGdN8taBg1ho62+5qvIXzwVs
	lBnv1zGIuRGOBHN239+Tn4m3u4DwYd3FV/lY8F7/sB0n2wv9JTHw3JQdjDzkgrswCAjmfn
	elAgdpbATP6u2q+gaUX9KBvBAEVxpvY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-21-CNB8CM3pN2q9atFQJw47ag-1; Sun,
 31 Dec 2023 11:33:27 -0500
X-MC-Unique: CNB8CM3pN2q9atFQJw47ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6E11C07540;
	Sun, 31 Dec 2023 16:33:27 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.192.48])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B498C15968;
	Sun, 31 Dec 2023 16:33:23 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Johannes Stezenbach <js@sig21.net>,
	Takashi Iwai <tiwai@suse.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 0/4] x86: atom-punit/-pmc s2idle device state checks
Date: Sun, 31 Dec 2023 17:33:18 +0100
Message-ID: <20231231163322.9492-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8

Hi All,

These 2 patches are an upstream submission of a patch titled:
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
never go anywhere upstream.

With the new acpi_s2idle_dev_ops and acpi_register_lps0_dev()
functionality this functionality can now be implemented cleanly
and that is what this patch-series does.

x86/tip maintainers, it is probably the cleanest if I merge
this entire series through the pdx86 tree (*). Can I have your
ack for merging patch 4/4 through the pdx86 tree ?

Regards,

Hans

*) Andy recently mentioned that it might be a good idea to move
some of the arch/x86/platform code to drivers/platform/x86,
arch/x86/platform/atom/punit_atom_debug.c which is a completely
standalone driver definitly is a good candidate for this


Hans de Goede (2):
  platform/x86: pmc_atom: Annotate d3_sts register bit defines
  platform/x86: pmc_atom: Check state of PMC clocks on s2idle

Johannes Stezenbach (2):
  platform/x86: pmc_atom: Check state of PMC managed devices on s2idle
  x86/platform/atom: Check state of Punit managed devices on s2idle

 arch/x86/platform/atom/punit_atom_debug.c  | 40 ++++++++++
 drivers/platform/x86/pmc_atom.c            | 86 ++++++++++++++++++++++
 include/linux/platform_data/x86/pmc_atom.h | 12 +--
 3 files changed, 132 insertions(+), 6 deletions(-)

-- 
2.43.0

