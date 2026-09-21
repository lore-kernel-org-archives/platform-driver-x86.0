Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED8F340DB0;
	Mon, 21 Sep 2026 04:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789966070; cv=none; b=B5JFopY0CKogfZDmrmHU1mp8PBG4NbY2AAw7Bgio8HPxHwPOM8WTQXGF3jXpoYavnaTqtBR3sj/91YY1c+FtPW8HprCqgDeRK8hp2kbWtHyMhHEQBj+zKryoDBMBCIwvqMIhY+opuPc1UeQKP9AVVLWdnJ6p/pay2+Z70sTeFZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789966070; c=relaxed/simple;
	bh=q6E6Ld8Z3mcHO1z35NHzzplEC7L/2Swizx8XRiUMcIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=guQOaKcolmmY5tnl1ScAkGHgDS19xHvZeqEH9c9O5RknPtpsm/0qHHHGzCypkjiE7ifLpSbJURiNUGXa6Ow7hf45QBdY2JPDa5MRGY7k99yt2WNoxmVhH/hR2Nvv9TKxiSNPmEocjqB7Ao60DP/BrjsCY34KqEpctjxkVtKmj7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wL2Huj4l; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wL2Huj4l"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=CSA49u37rYqAYETDO3RGaZh9F9F6Wuj6Kr47OrcbxQ4=; b=wL2Huj4lIhJE9vPy6XnXkvYnBH
	YT4iTMxWazEw6RBIeo2PdHCjKc7his1JTzxwvwA4QYM95YgRQSqWQMUi3RAK1Tqnn+M3C9wJwNO5o
	/mzqcHKQOw4eJWcaa+VV9I0maLfjphjlZbQSJyxmrGTODiwvT0sNq/Pcsy+prfiSwdUHeZ9wlU1GT
	4LiuzjMlrbC3dcqY2npUn3AilPgkXMPDCsRlwughBIFlXz5ENcg4omrdmrPwfIhSrJApbK9vJwKTi
	enYxZ39u0CvAh83Q3DYihvkMbMTb283enr4LcMnld/3d17IItGCeHHB3J/87mhcebB3fIfdvBaAFP
	EiBU1YcA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8VwR-00000000r5X-1IeQ;
	Mon, 21 Sep 2026 04:47:47 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jithu Joseph <jithu.joseph@intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Luck <tony.luck@intel.com>,
	Ashok Raj <ashok.raj.linux@gmail.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] Documentation/ABI: IFS: use literal blocks for commands
Date: Sun, 20 Sep 2026 21:47:45 -0700
Message-ID: <20260921044746.94316-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use literal blocks for console I/O to separate it from the
surrounding text. Otherwise the lines run together, without any
clear break before or after the commands.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jithu Joseph <jithu.joseph@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Ashok Raj <ashok.raj.linux@gmail.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/sysfs-platform-intel-ifs |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- linux-next-20260918.orig/Documentation/ABI/testing/sysfs-platform-intel-ifs
+++ linux-next-20260918/Documentation/ABI/testing/sysfs-platform-intel-ifs
@@ -10,8 +10,10 @@ Description:	Write <cpu#> to trigger IFS
 		Note that the test is per core. The cpu# can be
 		for any thread on the core. Running on one thread
 		completes the test for the core containing that thread.
-		Example: to test the core containing cpu5: echo 5 >
-		/sys/devices/virtual/misc/intel_ifs_<N>/run_test
+		Example: to test the core containing cpu5::
+
+		  echo 5 > /sys/devices/virtual/misc/intel_ifs_<N>/run_test
+
 Devices:	all
 
 What:		/sys/devices/virtual/misc/intel_ifs_<N>/status
