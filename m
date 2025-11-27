Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C102312834;
	Thu, 27 Nov 2025 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764275410; cv=none; b=eQic4iDm58GtA9W/B1ctkLBRMd2Cdz0y4R4J1oIFkm/J8rXUzFiW/zV6/Lk3r+TFhEm908V/AA/bmkTndvmI7sCDHjHSHKWISswBRPIFo4CFKwFup6HhgzZ4fjG5+ISZ/cURf68GcXWQ8qV7vY3yuUpZI1bwVzWqYWiuglvtUNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764275410; c=relaxed/simple;
	bh=LloVEcJksHBJX40dFSp0KnVrnfAEqrSLc4fesE9xSAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LV/3SHsleyjrdphYt6ltZ4Qa12NCbUV49/FTCTENHWsMgWiV6lDPMzIyTammFuWMPK4P3KMMREiwCAWLs+XINV/FyyBzGgfOKY+zDAxh94cQ1vucMuzUVAfU0CxWGdfciLfBN38Oz58bIZWfHRHrOaK1Ak9X+33kftdhssOoOL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=Z24Zfljo; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=ETfmR6gR; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="Z24Zfljo";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ETfmR6gR"
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 3AC1814001BA;
	Thu, 27 Nov 2025 15:30:05 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 27 Nov 2025 15:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1764275405; x=
	1764361805; bh=QInRf674ecpgR4hfBzebBjNsK60ERegZcTwTes9hF08=; b=Z
	24Zfljora5F4dk5tyiiGgfbBN1Vh6oShdrOH2hIW1QOTs/Cbkl8D4Pg0Tf95YHRd
	+Rv6meDonUGSO9azqD9D8tHr1ApBzMfmQg+NvmQdPSUxKTC3PnwUAnqyQFFpmxRG
	ArYqfiDseaoafiU8RXoZx/dUFSJ+ifgzKAU6R8nLs41SX9cdDjcJDFoTOHktAvr7
	qcjDmWqQeULzyyMO92DglfGxR7NO+NCb+fLOFbKtNo8J4jzq6TM2Fj0RcfV+iI6b
	PYjcGRBoIwnCSVH+6bpWcr5QakWEneWzxihsuMO5BMBIc/DMDGBYdu4ZXlWluO8S
	vV+ZaehkD3obiMaxN2Tbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1764275405; x=1764361805; bh=Q
	InRf674ecpgR4hfBzebBjNsK60ERegZcTwTes9hF08=; b=ETfmR6gRY1fRQ7qLM
	fzmkTg7XNRbdlddxQSAhjP98X2QGNbsbohTEJgtqonVEF5HWbKz//xOwQqkCoWsD
	xCv7pdgiYXYWxoQeGEQYCk5ks23xI95L+I9FPJ6VrRgzKLQyOAtaoCIp4nBUYCVO
	pKG6J0vvGQtX4qE3QZvJRulzgn86+XXMh5bW4yFaATL625BmZmruM96AGOhWXA7c
	FBvZgKV12htSWbQ99TX224abFvAoP7hKCMCGW1QGDI/du+tbDT5K9Rh8h2BXuJZU
	J9MP+kcBsNWq4q7oku3GP9Uqg/OWs4zf2ROQdsEBH6JgphBgvkeEErk9U9AhAape
	EJwAw==
X-ME-Sender: <xms:zLQoabL4C8Q1djSmKVuYpttqgy0zyWp8ht9vWpRnPC74MEVCjoRg0g>
    <xme:zLQoaYEpnd6uFZj7HpOx1EnNA0cymLb8063805ezWk8gyzNn-8DyoSClaIWPCoiKN
    fZINqvrk7kw0rxvpnkCXw6sP3f2XsTB7wbNGZes82ru87MZU-orWy0>
X-ME-Received: <xmr:zLQoafTZWXN1JhwzWrGSU7W8_FjUHiQPhhdDW24O6Rgt5JxBN8KV1DlY9ibSMHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvgeekudelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephffvve
    fufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrrhhkucfrvggrrhhsohhn
    uceomhhpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrth
    htvghrnhepfedtvdejfeelffevhffgjeejheduteetieeguefgkefhhfegjeduueethefg
    vdffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    hpvggrrhhsohhnqdhlvghnohhvohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohep
    hedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhpvggrrhhsohhnqdhlvghnoh
    hvohesshhquhgvsggsrdgtrgdprhgtphhtthhopehhrghnshhgsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehilhhpohdrjhgrrhhvihhnvghnsehlihhnuhigrdhinhhtvghlrd
    gtohhmpdhrtghpthhtohepphhlrghtfhhorhhmqdgurhhivhgvrhdqgiekieesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zLQoaUdGdFOm063SplKfFjE7Oyd43sNV0Iz_dc00bNgmqCXD4j86mw>
    <xmx:zLQoaeoQ3aOir--Vl-rc6j6mqahBJ8Y7zgEhdxtuTa5b_byqiMMn3w>
    <xmx:zLQoaV_f98mINSDtLlyyOhCH6HViiDRVFmZVdSLTXjZ9zxrpBSOjqA>
    <xmx:zLQoaadEQ2UX0vkFvL15RPpOQ-wrEbwDeR7qjgJEGMrKQ_2PhKP9og>
    <xmx:zbQoaS0a1fwrsPCNGsBpqf_-1RDTrEWvX_8MATotxMr2hPEr5Q4MxTc1>
Feedback-ID: ibe194615:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Nov 2025 15:30:03 -0500 (EST)
From: Mark Pearson <mpearson-lenovo@squebb.ca>
To: mpearson-lenovo@squebb.ca
Cc: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: think-lmi: Add WMI certificate thumbprint support for ThinkCenter
Date: Thu, 27 Nov 2025 15:29:48 -0500
Message-ID: <20251127202959.399040-1-mpearson-lenovo@squebb.ca>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mpearson-lenovo@squebb.ca>
References: <mpearson-lenovo@squebb.ca>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ThinkCenter team are adding WMI certificate thumbprint support.

Updating the driver to enable it. They are using the same GUID as
Thinkpad/ThinkStation.
Tested on M75q Gen 5.

Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
---
 drivers/platform/x86/lenovo/think-lmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/think-lmi.c b/drivers/platform/x86/lenovo/think-lmi.c
index 540b472b1bf3..c45f0206b4ab 100644
--- a/drivers/platform/x86/lenovo/think-lmi.c
+++ b/drivers/platform/x86/lenovo/think-lmi.c
@@ -195,7 +195,7 @@ static const struct tlmi_cert_guids thinkpad_cert_guid = {
 };
 
 static const struct tlmi_cert_guids thinkcenter_cert_guid = {
-	.thumbprint = NULL,
+	.thumbprint = LENOVO_CERT_THUMBPRINT_GUID, /* Same GUID as TP */
 	.set_bios_setting = LENOVO_TC_SET_BIOS_SETTING_CERT_GUID,
 	.save_bios_setting = LENOVO_TC_SAVE_BIOS_SETTING_CERT_GUID,
 	.cert_to_password = LENOVO_TC_CERT_TO_PASSWORD_GUID,
@@ -709,6 +709,10 @@ static ssize_t cert_thumbprint(char *buf, const char *arg, int count)
 	if (!tlmi_priv.cert_guid->thumbprint)
 		return -EOPNOTSUPP;
 
+	/* Older ThinkCenter BIOS may not have support */
+	if (!wmi_has_guid(tlmi_priv.cert_guid->thumbprint))
+		return -EOPNOTSUPP;
+
 	status = wmi_evaluate_method(tlmi_priv.cert_guid->thumbprint, 0, 0, &input, &output);
 	if (ACPI_FAILURE(status)) {
 		kfree(output.pointer);
-- 
2.43.0

