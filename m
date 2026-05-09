Received: from smtp-1909.mail.infomaniak.ch (smtp-1909.mail.infomaniak.ch [185.125.25.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB07264FBD
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 01:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778290748; cv=none; b=ojltzHgsToFMHOGNCmPSIkz2mueMcPKCdx1FV9bQrs1ehg6qO6WZubSl59/HjdVpZfXk4+QDxwv7Qabdc6eTmqI4M4P/Om1xtk50utDzzrcSUpNoRKIQ748sP2nf+CbVGVpg6tQexuZPNy5UaXUF2aa2S+T0oPNF/fYAKZgxmxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778290748; c=relaxed/simple;
	bh=1yu+/UM6Y0GoI7lTTWpwIsOj8noQkvZeDhVOAffQz28=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G36pWTiW5e9tkCIYII+huHm6Umb3D7WxCzd6F9RMIzL78c/2q34qq2Bymln+tdvLcBUNb46r2cgYbaUAFgApMlpw9e6wRd8F0UBsT6TBaOuaGUbog+pS/LJBjyJtiQkx3Cc6jgv3jGgBDtiSQOUkeYCFo9k/w969aRT2XBi5sho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=Kum6yGWT; arc=none smtp.client-ip=185.125.25.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="Kum6yGWT"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4gC7jn31BMzZHB
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1778290269;
	bh=a+WRQSJV9hBwuS2Du1AmZQPBdJRpx+moR5xxxAEURRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kum6yGWTUD6izp5cmKheJ7ciQZMN75B3AA5RX751ekqep6o2b1KJcO6ZCdKdsUVv/
	 mE9oYKF9KO6fQRONlaoNaO/a8OTjMn7TNBFXA6AaHqe9Q0kTUJAvjSpM9nufRPK5x/
	 zp8bK6ZoXQJ7UaTNNUmXphMh9tEZ7RqoEeQUijM494X8GVzauIyKlLYwjn9p/JdXtv
	 5Ra74mD3CCtTwEmHz/Z1V7Z86vREVV41MBDSXnOFxuCmjRn9rP6Oz9ZM1Qwoat4f+M
	 OX5WoTcE21liUkZiEd+aALgIx/ACEzbpi4kRo5Pa8pTPQ4hFZZC7LrO3navdghR7b/
	 GUsfQ72TRA2kg==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4gC7jn05jwz7F9
	for <platform-driver-x86@vger.kernel.org>; Sat,  9 May 2026 03:31:08 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Sat, 09 May 2026 03:31:08 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Daniel Gibson <daniel@gibson.sh>
Subject: [PATCH v2 4/5] Documentation/arch/x86/amd-debugging: Add example for reset register
Date: Sat,  9 May 2026 03:31:03 +0200
Message-ID: <20260509013105.816339-5-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260509013105.816339-1-daniel@gibson.sh>
References: <20260509013105.816339-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

To me it wasn't clear how I get the information stored in the reset
register, or how to identify the messages in the syslog mentioned there.

Mario Limonciello sent me an example line which illustrates what to
look for and I added it to the AMD debugging documentation, with a short
explanation.

Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 Documentation/arch/x86/amd-debugging.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index d92bf59d62c7..3176a1240fee 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -366,3 +366,8 @@ There are 6 classes of reasons for the reboot:
 This information is read by the kernel at bootup and printed into
 the syslog. When a random reboot occurs this message can be helpful
 to determine the next component to debug.
+
+For example, if bit 19 was set, you will get a message like this in the log on
+next bootup::
+
+  x86/amd: Previous system reset reason [0x00080000]: software wrote 0x6 to reset control register 0xCF9
-- 
2.48.1

