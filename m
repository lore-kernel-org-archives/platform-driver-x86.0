Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D2445AC4;
	Mon,  7 Sep 2026 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771702; cv=none; b=OI+6YqqAR10vZPrJmeRAk3VQ2HW4czoqW78WyG4gJA9JPJQAjf9eVJpFB6VBqiucRPCfOmx3xZF8B39mX884ZC2m8//n/A5ziFDGJEbhEehWaAWjWxEtHAG2w/l+EicKkR/L/b7FlBLbApV4h9OHTTUWO7Kh3H6SuRdkO4X5c5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771702; c=relaxed/simple;
	bh=ay26jzCOhQ2XhmxeES3TDvVxqRn2svhD14LsJ8+o7NQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sq97DwpDAwA5fWBBHESHV8PjCzpvVL3wjAxu8BFikSkfAaiEei7Uu+SIUlOabsfUb0Txv86j9TSvL/8IsMEQYnTnspE0NHL79wDm2sSBlVNPZsNjXZBJZsqXiVEaYmRcD6gaTrErzRQsgraCNFOS5CTKoFuXIYvgR0UmP7u6Dow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IlzAwy6F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IlzAwy6F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FF01F00A3A;
	Mon,  7 Sep 2026 09:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788771700;
	bh=/EBn7fl/ZV8AHwar5WNBqGOcTZcc/O9sGSFLExr9Gik=;
	h=From:To:Cc:Subject:Date;
	b=IlzAwy6Fzi7nziLw7BhAwhF4De1aDcj3Z6LgZ74nksWcBNcaXmQIHpcWLTnekQzms
	 dh8xkRH+op5vOzj0ka5PTvboTWAy9Nn9MGVYh23ich+5YSCVzgK3xc/fmMjvt0QaoS
	 RNeKjieWROUKVatS32+e+lnXlpBYZhRQeBvjrfpoialqqH9kOOrfDINESz7SX1i6fv
	 4I+OZQvPYNRgGctQ4NOGeQX5TV8VO4vGudAZUUqe1OcFhWeSfoiQJQXP7P1ztiqzsd
	 VX3lB8DKiwQH7+VCNTLDLmKZN5DBjslmNA+H5G2cvjyYBM68Q596T3a84BqPrH8Ce7
	 KwYOMx/0Iz3LA==
From: Thorsten Blum <blum@kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Thorsten Blum <blum@kernel.org>,
	ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Remove unreachable code in beep_read()
Date: Mon,  7 Sep 2026 11:01:05 +0200
Message-ID: <20260907090103.352995-3-blum@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1019; i=blum@kernel.org; h=from:subject; bh=ay26jzCOhQ2XhmxeES3TDvVxqRn2svhD14LsJ8+o7NQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFnzav2nPJ6rovXLzPy4qOD1V3t+frG2t3dS7d769Oqb9 j4Puzv6HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjAR1TkM/3TbiyuPtJZ3+8Sm BDifDnV6W+0ZJvt0pcsbD+1i12+fcxj+J7y1OjbrStrWEzLtE5d3G6Xyr7f7Z95updziEr7QQyS BFQA=
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit

The procfs entry /proc/acpi/ibm/beep is only created if beep_init()
succeeds, which requires beep_handle to be non-NULL. Remove the
unreachable code branch from beep_read().

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 1082c36ae723..069c9f1c359f 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5936,12 +5936,8 @@ static int __init beep_init(struct ibm_init_struct *iibm)
 
 static int beep_read(struct seq_file *m)
 {
-	if (!beep_handle)
-		seq_puts(m, "status:\t\tnot supported\n");
-	else {
-		seq_puts(m, "status:\t\tsupported\n");
-		seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
-	}
+	seq_puts(m, "status:\t\tsupported\n");
+	seq_puts(m, "commands:\t<cmd> (<cmd> is 0-17)\n");
 
 	return 0;
 }
