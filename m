Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381F217B50A;
	Wed, 23 Sep 2026 02:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131808; cv=none; b=uVPeEBuE4puat5sAVR6MYXWjhtjKglF6YEqlRUpSFnHPBBkJ7vJVOArChV5HSR7nFXzkVs9MAjCrI2CUkw5ww0YUzaUNm8LuevqFR8qpDQdO/cmZ7+YfJRS61TE+qMG29+KhChIKw0xaFVzyLzsJEq+/xuHyc9ovnotQZMBUoqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131808; c=relaxed/simple;
	bh=IJjp6TJfH8b3kg8FpdNc7AAR/T8yrD2piXCxkjCZAWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=koYYuu70X5TPmohUYevj1u/6/v1GLNsSSDQFDKvRSkWCj/YbqREzrbp7O1+3Mwck55TvdcpsOnI8z0D8Zig4hKulUxDXjNC3QuieWDtu850fyzFk1J5BxFgYnf/I/1Wt5hszMB0Qyb7bFOULY182NtY2SfwWgK55o5dLvamIWhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZTaZJGms; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZTaZJGms"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=orrn+NdoCFzU23emXEq7tOhnV7XAniUCodDT+yO/cJk=; b=ZTaZJGms71Z3F9Vujt3b/I/wZi
	g+bpybjjeBWFY+hdMrjAZ9KnhBQaEit6jJDrgZdNYiGn8oIwBVrgY/kfVRZSc+FheIaq3yj0wK+Vi
	rptIJFhZb2T3sMsaxZfgFqee9qCcYYgrJcMvWIm/aIwEc2MRu2NgjM14Rpptf9DkU7lPXGcAxvx5C
	gblb0qaC2MyJYFq4xDuICNluccM5k0Prn7dVkF94WbNpDU5eHEq+Z9ZBIvuWb93+0lmolstabSUqK
	FBkAp1ITTR/cV/iau0/W8v1KYzzZPoVjzaRkCq3g7BK6scf/YiNjDO2P3B7CxG0KlkHzRNJlDgbFC
	RvUjtErA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9D3W-00000006zGN-23ep;
	Wed, 23 Sep 2026 02:49:58 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: ABI: sysfs-class-firmware-attributes: use literal blocks for console commands
Date: Tue, 22 Sep 2026 19:49:56 -0700
Message-ID: <20260923024957.845198-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a literal block for console I/O so that the lines aren't merged
together in the produced output.

Also correct some punctuation.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-class-firmware-attributes |   21 +++++-----
 1 file changed, 12 insertions(+), 9 deletions(-)

--- linux-next-20260921.orig/Documentation/ABI/testing/sysfs-class-firmware-attributes
+++ linux-next-20260921/Documentation/ABI/testing/sysfs-class-firmware-attributes
@@ -397,22 +397,25 @@ Description:
 		unlimited attributes.
 
 		Read the attribute to check what save mode is enabled (single or bulk).
-		E.g:
-		# cat /sys/class/firmware-attributes/thinklmi/attributes/save_settings
-		single
+		E.g::
+
+		  # cat /sys/class/firmware-attributes/thinklmi/attributes/save_settings
+		  single
 
 		Write the attribute with 'bulk' to enable bulk save mode.
-		Write the attribute with 'single' to enable saving, after every attribute set.
+		Write the attribute with 'single' to enable saving after every attribute set.
 		The default setting is single mode.
-		E.g:
-		# echo bulk > /sys/class/firmware-attributes/thinklmi/attributes/save_settings
+		E.g::
+
+		  # echo bulk > /sys/class/firmware-attributes/thinklmi/attributes/save_settings
 
 		When in bulk mode write 'save' to trigger a save of all currently modified attributes.
-		Note, once a save has been triggered, in bulk mode, attributes can no longer be set and
+		Note, once a save has been triggered in bulk mode, attributes can no longer be set and
 		will return a permissions error. This is to prevent users hitting the 48+ save limitation
 		(which requires entering the BIOS to clear the error condition)
-		E.g:
-		# echo save > /sys/class/firmware-attributes/thinklmi/attributes/save_settings
+		E.g::
+
+		  # echo save > /sys/class/firmware-attributes/thinklmi/attributes/save_settings
 
 What:		/sys/class/firmware-attributes/*/attributes/debug_cmd
 Date:		July 2021
