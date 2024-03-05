Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FF15CDD3
	for <platform-driver-x86@vger.kernel.org>; Tue,  5 Mar 2024 10:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709636382; cv=none; b=hjCELzfOCMd2KNDGa1KN4fqmk/3ZXQr/bLaE58xlL7ATyb+uffgYc72WbZcV9G+uRb6PS3kdrazr94MOYR8ta+WaZ1+JVRN7RDpbr3bKdDOvrs4qNf7O5h8y3c6wVfKri/aO4bsgFQKXgk1FZtqB/bnJowndRVkqbf5DEG2icIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709636382; c=relaxed/simple;
	bh=FhOrtUqzoaa2flD/fMhpT9C5hfyerUYteedSmYsk+LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8zC8CS3ca3Fk6tNq4trbZdcxh1qR34CKB4INsNjCf8nBObj78mqbk7oWtVZXxXMY09JVsk3+9OnkQalzhZz50zTsjyObheKQ6aXaUuy855COyYqg08o0TRseOYvcOKxJX7UhGE9JITY8cP7ViUz66/R99VgsnZlo1WSzNYMwWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=THuPTjN0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="THuPTjN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709636380;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WzcndcC1m2TcnVpv+r6Ek8gTDs5NG8qUhZQ62wTQPcg=;
	b=THuPTjN08qnIDoA4zE2crH4QA+Zjqo0D7BYiAh83AXPjJ+qnoItN6GiZCNFzYNACXyFo7b
	RnYnoi53sOlD/TQAPGbCsP97mNrfWQy1v7vHKZE99VYtRxy+tH2fmW2/wyrz4WAt4+s+C9
	2hA+5WZnXmB+HxzBGZPXHcJV4FoxHio=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-13-3IzbSbBLPA6z53j-SjyZqg-1; Tue,
 05 Mar 2024 05:59:34 -0500
X-MC-Unique: 3IzbSbBLPA6z53j-SjyZqg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0BF0429AA3B8;
	Tue,  5 Mar 2024 10:59:34 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.194.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B1B71C05E1C;
	Tue,  5 Mar 2024 10:59:32 +0000 (UTC)
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
Subject: [PATCH v4 4/5] platform/x86: pmc_atom: Check state of PMC clocks on s2idle
Date: Tue,  5 Mar 2024 11:59:14 +0100
Message-ID: <20240305105915.76242-5-hdegoede@redhat.com>
In-Reply-To: <20240305105915.76242-1-hdegoede@redhat.com>
References: <20240305105915.76242-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Extend the s2idle check with checking that none of the PMC clocks
is in the forced-on state. If one of the clocks is in forced on
state then S0i3 cannot be reached.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v3:
- Improve comment for clocks check

Changes in v2:
- Drop the PMC_CLK_* defines these are defined in
  include/linux/platform_data/x86/pmc_atom.h now
- Drop duplicated "pmc_atom: " prefix from pr_err() message
---
 drivers/platform/x86/pmc_atom.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/pmc_atom.c b/drivers/platform/x86/pmc_atom.c
index 7d391bd36eae..0aa7076bc9cc 100644
--- a/drivers/platform/x86/pmc_atom.c
+++ b/drivers/platform/x86/pmc_atom.c
@@ -477,6 +477,7 @@ static void pmc_s2idle_check(void)
 	u32 func_dis, func_dis_2;
 	u32 d3_sts_0, d3_sts_1;
 	u32 false_pos_sts_0, false_pos_sts_1;
+	int i;
 
 	func_dis = pmc_reg_read(pmc, PMC_FUNC_DIS);
 	func_dis_2 = pmc_reg_read(pmc, PMC_FUNC_DIS_2);
@@ -501,6 +502,16 @@ static void pmc_s2idle_check(void)
 
 	pmc_dev_state_check(d3_sts_0, m->d3_sts_0, func_dis, m->func_dis, false_pos_sts_0);
 	pmc_dev_state_check(d3_sts_1, m->d3_sts_1, func_dis_2, m->func_dis_2, false_pos_sts_1);
+
+	/* Forced-on PMC clocks prevent S0i3 */
+	for (i = 0; i < PMC_CLK_NUM; i++) {
+		u32 ctl = pmc_reg_read(pmc, PMC_CLK_CTL_OFFSET + 4 * i);
+
+		if ((ctl & PMC_MASK_CLK_CTL) != PMC_CLK_CTL_FORCE_ON)
+			continue;
+
+		pr_err("clock %d is ON prior to freeze (ctl 0x%08x)\n", i, ctl);
+	}
 }
 
 static struct acpi_s2idle_dev_ops pmc_s2idle_ops = {
-- 
2.43.2

