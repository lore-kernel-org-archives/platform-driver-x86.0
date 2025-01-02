Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457F282E1;
	Thu,  2 Jan 2025 19:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735847045; cv=none; b=dW3GGyy9CYcF4f470Z2+5/FNCihw5hmJ9pC5k0Ma+lIS9O0VBn5Lsug7Y+XL9dHf18tx80o1p1tjfWCNq5+zyLZnONaXSmh6hy7wkcJC33nQyRzl7XQ5aH5ABV9fi3Wp2yP10TBzKbZlSmldm35jn2Yci7tSi36P42iah7//5KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735847045; c=relaxed/simple;
	bh=DT+xqnA2m/bAYeHpH1oNAcB1ko6lElj3WZiP8+p96C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IYtrNApAWPERZMzRg/JO3qCUVbINjQ8XoYbf+ICtQKVUhEdcj97NX7yTfb3astEzLNP6DfiR2GgffYRVRJZuLAaxXVK+8lqfmNjzz2lr1xnV/5kmSTil7hfXnxl4xLxXAB1/OzS7CK6qapVd4aJn1XfwWuWCEoGGcbfOfMLQbug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu; spf=pass smtp.mailfrom=astier.eu; dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b=Fpq6mP/z; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IeGIypev; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astier.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astier.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=astier.eu header.i=@astier.eu header.b="Fpq6mP/z";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IeGIypev"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7BE0211401B7;
	Thu,  2 Jan 2025 14:44:02 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 02 Jan 2025 14:44:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=astier.eu; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to; s=fm2; t=1735847042; x=1735933442; bh=MFKdMWA1jCKS8kqfXxlIq
	K1Qm4flu81xnetQoPy74M0=; b=Fpq6mP/zUX8H8BJAWtcus06Qx2a7AvIY91dv9
	oeeNpQyGAlACb/EQGh+tTvVk4gekR4IonnsrVyLYnoat7MuuCAy1GVyKNbc3zZ+m
	TBAE51GYKTfrhr4h+ENQ8+jR3nKZf802zn3YvNiy3rRoLvRFAV9IkaCE6e+tnW9n
	PjuX+otIdljKxHEegFhueofnlZC7a7SUBpk6oKdOu8Juixs0pABqGTDsCapR8/b0
	InHYJU+ODASH6TmcHaD3hm1/VQj5w1qn2mR5Mu5pluo8hmTouvyJpiGaBL7+TINz
	kCyq7L3nR85qwdRwGeO9UvUQTwWq+OuRd16SADyhqjNdkrJZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735847042; x=1735933442; bh=MFKdMWA1jCKS8kqfXxlIqK1Qm4flu81xnet
	QoPy74M0=; b=IeGIypevCCbOTZ0VBsTpIaSfpTo9LkBOklUldJNYRwRyyVVz36g
	Y0D8BTRxHB/v4ZppKN0kAg9+R3bPTM7ksy55Q2uGt3VMd7RXTobpkBeHlCJOH+7S
	YTMVezy3zbFaF/9E21Wqj8PScTnDTHAr6MgVj9Og85tIZRjziOdajqTUwNu+1grI
	Dm4FUusAYtgSk7xNoRysPwL8I+qaHSqSTvS5S2GjlUQxI0EAG7gMjRa5PXqP7RmP
	Y1N+pdoDAUDBtsUNHvJi575wkfz4JIANocXN7IhtIRthojRWgSmAdxcqOba+dr47
	cuwjcfeeh7lEee/oyVctKqbpEVbxerkA4Ag==
X-ME-Sender: <xms:gex2ZxaDX70ToThA-WyQfT6e8FVEuznsShfVBtrdIy94BO4ixCIwug>
    <xme:gex2Z4awrqVvC1oVs8Ak4RDj9lqSKwxg4dIqGUw-jQo051Q4YvckPzvnTz8mDJ-3_
    WNG-J-Ck6e0nC-q-ec>
X-ME-Received: <xmr:gex2Zz_l4WT_nVb7LgDTw3NDWRhRF0knXnNSq2Ur_uJnpqD8lCLxrpk5eAegNaD6iTiTNEEk861QOjAPUhEFag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddguddvlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
    hfhrohhmpeetnhhishhsvgcutehsthhivghruceorghnihhsshgvsegrshhtihgvrhdrvg
    huqeenucggtffrrghtthgvrhhnpeegffdvuefgueetteeujedugeefudelleeludeghfeg
    hfegveffjeeggeeiffeffeenucffohhmrghinhepihhnthgvlhdrtghomhdpghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mheprghnihhsshgvsegrshhtihgvrhdrvghupdhnsggprhgtphhtthhopeekpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehplhgrthhfohhrmhdqughrihhvvghrqdigkeei
    sehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvg
    hlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnihhsshgvsegrshht
    ihgvrhdrvghupdhrtghpthhtohepjhhithhhuhdrjhhoshgvphhhsehinhhtvghlrdgtoh
    hmpdhrtghpthhtoheprghshhhokhdrrhgrjhdrlhhinhhugiesghhmrghilhdrtghomhdp
    rhgtphhtthhopehtohhnhidrlhhutghksehinhhtvghlrdgtohhmpdhrtghpthhtohephh
    guvghgohgvuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehilhhpohdrjhgrrhhv
    ihhnvghnsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:gex2Z_qhHCVm8h9DU4YZz4mdQVnUbpcmLyazcAnprC0hOFiGYlsWcg>
    <xmx:gex2Z8pXc-FrKB2dYIQgxfxXQCQOR2OBLtYtz3SWZVw92oz0y7o5BA>
    <xmx:gex2Z1R5GjoNbahTa1tKhZx4JR1hR-YjnqJL7QEpUnPOWTwYh2axog>
    <xmx:gex2Z0qyVKr19jtJaULCfQW2nnXga-7EQ2nvmIUXOLBwL9AsXJMBOA>
    <xmx:gux2Z4ebYBlWTm9wOWEb2usFnFwqzsi25DfV0gyqsGsLBph6w3AWBTlO>
Feedback-ID: iccec46d4:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 14:44:00 -0500 (EST)
From: Anisse Astier <anisse@astier.eu>
To: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Anisse Astier <anisse@astier.eu>,
	Jithu Joseph <jithu.joseph@intel.com>,
	Ashok Raj <ashok.raj.linux@gmail.com>,
	Tony Luck <tony.luck@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH] platform/x86/intel/ifs: Update documentation to match current availability of firmware images
Date: Thu,  2 Jan 2025 20:43:57 +0100
Message-ID: <20250102194358.33029-1-anisse@astier.eu>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware images necessary for the In-field scan[1] functionality are not
available at the moment[2], and require having access to at least an
Intel customer account[3].

Update documentation to match current state, it can be updated again
when the images are finally published.

[1] https://www.intel.com/content/www/us/en/support/articles/000099537/processors/intel-xeon-processors.html
[2] https://cdrdv2.intel.com/v1/dl/getContent/826383?explicitVersion=true
[3] https://www.intel.com/content/www/us/en/secure/design/confidential/software-kits/kit-details.html?kitId=815180

Signed-off-by: Anisse Astier <anisse@astier.eu>
---
I realize Intel had a few troubled years, and that having this feature
in the kernel must be quite helpful to some users. But right now, it
cannot be used unless one has a commercial relationship with Intel.

I am not advocating for the removal of this driver; this is just an
update of the documentation to show that the publication of the firmware
images necessary to use the driver might have fallen through the cracks,
and might not happen soon.

Kind regards,

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
2.47.1

