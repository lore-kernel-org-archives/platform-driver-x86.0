Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7173CF95A;
	Wed, 16 Sep 2026 05:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537789; cv=none; b=HFtVKIbwEO6tmVhWHqQkomsGQHk/CXT0PLKEIMTobnMupQTJMo8gHSyHH2mb0sAQq1OXM0/B+EUOIjxFM74UhOBVYDnbgTs+/O6vzD2p2/5IlWdXhE2w1Jp6EFqr9+oLkA6bVDLOqgXQFjKs5h+S2Jy8uC1W6+bk4dcR+shfEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537789; c=relaxed/simple;
	bh=zo/NxocoJWYPn8eQbbCqSd8XccYRnk32G2OLAApak9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qg9brwPnu6d72xFjrDL1ZCApi9HraAa95I2FBGlNnVyHDQTVIevaLcNO6ax1mjJEF390hWWaX0u6RCD/QkGGEfjx8I1fQy4v1xAgMOWV4DOJ7HvfnHjxrf9AArrSODh+UQl4+RhjQ69OVb48Py8SmVMWZcrPncaiwHOWV1eyzbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=SvCgZQfl; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SvCgZQfl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=3RFLNN/uqua2VShiFi6iCJVR1exNTstN1aXPfrn7u1Q=; b=SvCgZQflDvNhL9OrowcGO7hxIS
	hUAZKV1XfkDmy/EbLgW61AqWBBCLPfXRx6tONGD9piffdUBsTLJ33zuwnBYnJuPZKuN3YFYUkjK2L
	2QaJusWXovKHPr5+Ii8LeqFoTNi+sxu5opGofGESElzo7vvC4pPfZWASAXoQ7lgwd/FinqkI4qgC6
	BxOGH+hZH1S0LhrAEljRfj4bGtjK9Dpjf/2xhmkMFSODOrDEzAgY8P2WkmTWbQvI7F91/sme3f8aF
	UJMwyvV3tQfsSJ8KWdoLYF2FMJChBrWc/20K5ZzbRVD+BuD+JTKN5gD/vHyeJVP3E7QQBAA1APRvL
	5iBtp3Bw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6iWd-00000008Pni-2e2a;
	Wed, 16 Sep 2026 05:49:45 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs: TPMI: use literal block for commands
Date: Tue, 15 Sep 2026 22:49:41 -0700
Message-ID: <20260916054942.2054730-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use a literal block for 'echo' commands to separate them from
the surrounding text. Otherwise the lines run together, without any
clear break before or after the commands.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/ABI/testing/debugfs-tpmi |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

--- linux-next-20260914.orig/Documentation/ABI/testing/debugfs-tpmi
+++ linux-next-20260914/Documentation/ABI/testing/debugfs-tpmi
@@ -25,9 +25,11 @@ Description:
 Allows to write at any offset. It doesn't check for Read/Write access
 as hardware will not allow to write at read-only memory. This write is
 at offset multiples of 4. The format is instance,offset,contents.
-Example:
-echo 0,0x20,0xff > mem_write
-echo 1,64,64 > mem_write
+Example::
+
+  echo 0,0x20,0xff > mem_write
+  echo 1,64,64 > mem_write
+
 Users:		Debugging, any user space test suite
 
 What:		/sys/kernel/debug/tpmi-<n>/plr/domain<n>/status
