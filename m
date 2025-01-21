Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781961DA0F1;
	Tue, 21 Jan 2025 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737484781; cv=none; b=iN/1ufkDVzmg+MjjNOV6b51qBL8r0nLb8u5X+Xmyd2zdWlm2tJ0jF5jy7mcHCx2Ztn5qwRueKNQL0D18N+QS3RihGNDx+X2wMXPxgvqW812ul6RqoKjDzJlsz4HbDY0vAfbjz6JroPkFs0jEZNjYsmBWZ2H1fRQdnrVWWB7rjgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737484781; c=relaxed/simple;
	bh=Q5RMYTl9zlRDxAmgfWjXuJ+Fmc2lKn7HFnFzkBfNipw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ty6HZ7d4OLU6ZMvwa/61aA6kEZZt6KVp5aLXy0tyohg497NDWodfhQEA0gRQT5NkyH2WiBgj9JetJ3TvQUXCT66sj7x3nlC0rleuQkZUOUdiSpBde3vcuTP9HKRMWQTpgIKZiJ/ueDWJn+V6jipteZQ0ABqbpIFFYE1iiTvc/HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu; spf=pass smtp.mailfrom=astier.eu; dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b=wxMubUbX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=xtU2xOo4; arc=none smtp.client-ip=202.12.124.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astier.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b="wxMubUbX";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="xtU2xOo4"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 3ADBC11401DB;
	Tue, 21 Jan 2025 13:39:37 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 21 Jan 2025 13:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=astier.eu; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1737484777; x=
	1737571177; bh=l+8PDc/kUzXukEhW37dhsrUGyOFKSbyGJNuGKA5oUe0=; b=w
	xMubUbX2poHLB5matgjrUXGxyrm4vBXT0tO2GQSSD2sRM0NT1vAoWk8oUAfePcYz
	73x7C7kYzQDPoLq+ZVYpynk+uDSDvWSPNaPU/ESMbzVAKjghsrxn61iFMCL9uBur
	heAEN2UilCg27g3mlF6nUeU9xUuVVuVVOA1l1REn6QKJxu4P4NTQH9KgkvJLdBDa
	w1GjVA5td0hZAnvdwBiYdfqC98x6+YrziV0UoyUxiiYJCeliWRZqbM0JtlUuv8B5
	2jln6am4/7yDOwgl38O/HJwNUNIyAZUVUpLaLkD0xzDn76fBeyy5P+4m29biIyZa
	7V3pVDbH16N7m9jk0V3WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1737484777; x=1737571177; bh=l
	+8PDc/kUzXukEhW37dhsrUGyOFKSbyGJNuGKA5oUe0=; b=xtU2xOo4A7Pu91z7l
	dUCJg/2l8VMHRM2MwsG+zrW0+mx0Jwn1MuWgu5TMN2eutBkH8gCwewe/Ohf+nAjP
	l1XBRwYCJJCrzlASFqAUSh4cJGR6CmOIHbOdKuSBHaS0hRw+TbgKid0RldKj2Yyz
	RfrGsxaxOJsHzoxztyovVaDax2yUZ0KzCSByCFoN8SuQwNWIx/vVcspeBcMoGYMp
	hyAtGMik8l1czxptZLiVWsb3ZUofvxqmE0FajW13FSC7jmBRGt62GUoXZ4hpDsYz
	1QU6FnJGUGIV3MtoW1BF4WhUHhCf735fYuVbAd+lI8LwOhBdxveQbQ4pCBOURfIf
	5ZIdg==
X-ME-Sender: <xms:6OmPZyaLyBJvBubdKxfbHx8-aAJ-ct2MnqrJfG1f0t0FWLUo2ptwWA>
    <xme:6OmPZ1Z_Za9mw8aBDsaidHmjJnKY--teS1AITlPjYyIyF1tMOTphdc14AgZNffTzz
    sBSTYRSC_zLMRC1jGQ>
X-ME-Received: <xmr:6OmPZ8_TRs0ahlj7lexxWgwisbzZ0Gj84cVRGDvY2sDH9j3kuByunNwLYyhQ9gFib8Qgb-Vp-RBFnhoOdmmyAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejvddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevuf
    ffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeetnhhishhsvgcutehsthhivghr
    uceorghnihhsshgvsegrshhtihgvrhdrvghuqeenucggtffrrghtthgvrhhnpefgudffie
    evkeeludehledujeetueeludffheegfffhveetuedvjedutddtfeeuvdenucffohhmrghi
    nhepihhnthgvlhdrtghomhdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghnihhsshgvsegrshhtihgvrhdrvghu
    pdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjih
    hthhhurdhjohhsvghphhesihhnthgvlhdrtghomhdprhgtphhtthhopegrnhhishhsvges
    rghsthhivghrrdgvuhdprhgtphhtthhopegrshhhohhkrdhrrghjrdhlihhnuhigsehgmh
    grihhlrdgtohhmpdhrtghpthhtohephhguvghgohgvuggvsehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrdgtoh
    hmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghrrd
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhnhidrlhhutghksehinhhtvghlrdgt
    ohhm
X-ME-Proxy: <xmx:6OmPZ0qVKxP2g_jk_yAP5v8vERv0b-NxtAWRqir5dceDV0Rz55UXBg>
    <xmx:6OmPZ9rQKlo_3R9A0ZgbJkMJO1v8f0cMimQYeGq-swrGOXS9gRsaAQ>
    <xmx:6OmPZyRlvfGWgDv_hcC9w2W1wO69NuOV8ubPaaNbsXWPdYJmf6GpEA>
    <xmx:6OmPZ9r5T_6xd0TR9dZq81j3aDPkXwrwebADGKct2wrc3NbpdmYh2Q>
    <xmx:6emPZxdOHn4mQFMLPxvaXxRLb4Ttv0jprfaPZFcVRIH3EsKeoKE2khK0>
Feedback-ID: iccec46d4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 13:39:35 -0500 (EST)
From: Anisse Astier <anisse@astier.eu>
To: jithu.joseph@intel.com
Cc: anisse@astier.eu,
	ashok.raj.linux@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	tony.luck@intel.com
Subject: [PATCH v2] platform/x86/intel/ifs: Update documentation to match current availability of firmware images
Date: Tue, 21 Jan 2025 19:39:30 +0100
Message-ID: <20250121183930.182315-1-anisse@astier.eu>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <928769f4-081c-4655-ad8a-f7b65ea21749@intel.com>
References: <928769f4-081c-4655-ad8a-f7b65ea21749@intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware images necessary for certain tests in the In-field scan[1] test
suite are not available at the moment[2], and require having access to
at least an Intel customer account[3].

Update documentation to match current state, it can be updated again
when the images are finally published.

[1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
[2] https://cdrdv2.intel.com/v1/dl/getContent/826383?explicitVersion=true
[3] https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=815180

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
Changes since v1:
 - update commit message to clarify that only some tests need the firmware
   images, thanks Jithu for the suggestion!

Regards,

Anisse
---
 drivers/platform/x86/intel/ifs/ifs.h | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel/ifs/ifs.h b/drivers/platform/x86/intel/ifs/ifs.h
index 5c3c0dfa1bf8..9a7ad9cc9d08 100644
--- a/drivers/platform/x86/intel/ifs/ifs.h
+++ b/drivers/platform/x86/intel/ifs/ifs.h
@@ -23,9 +23,11 @@
  * IFS Image
  * ---------
  *
- * Intel provides a firmware file containing the scan tests via
- * github [#f1]_.  Similar to microcode there is a separate file for each
- * family-model-stepping. IFS Images are not applicable for some test types.
+ * As of early 2025, Intel provides the firmware files containing the scan tests
+ * to select customers [#f1]_. When this driver was merged in 2022, it was
+ * announced that firmware files would be available via github [#f2]_. Similar
+ * to microcode there is a separate file for each family-model-stepping. IFS
+ * Images are not applicable for some test types.
  * Wherever applicable the sysfs directory would provide a "current_batch" file
  * (see below) for loading the image.
  *
@@ -125,7 +127,8 @@
  * 2) Hardware allows for some number of cores to be tested in parallel.
  * The driver does not make use of this, it only tests one core at a time.
  *
- * .. [#f1] https://github.com/intel/TBD
+ * .. [#f1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
+ * .. [#f2] https://github.com/intel/TBD
  *
  *
  * Structural Based Functional Test at Field (SBAF):
-- 
2.48.1

