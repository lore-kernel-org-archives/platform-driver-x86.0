From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: [PATCH v10 1/7] intel_sgx: updated MAINTAINERS
Date: Sun, 24 Dec 2017 21:56:47 +0200
Message-ID: <20171224195854.2291-2-jarkko.sakkinen@linux.intel.com>
References: <20171224195854.2291-1-jarkko.sakkinen@linux.intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:53959 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750846AbdLXUCH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 24 Dec 2017 15:02:07 -0500
In-Reply-To: <20171224195854.2291-1-jarkko.sakkinen@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: intel-sgx-kernel-dev@lists.01.org, platform-driver-x86@vger.kernel.org, x86@kernel.org
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, open list <linux-kernel@vger.kernel.org>

Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 77d819b458a9..545a8e3168c0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7237,6 +7237,13 @@ L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	drivers/gpio/gpio-intel-mid.c
 
+INTEL SGX
+M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
+L:	intel-sgx-kernel-dev@lists.01.org
+Q:	https://patchwork.kernel.org/project/intel-sgx/list/
+F:	drivers/platform/x86/intel_sgx/
+K:	\bSGX_
+
 INVENSENSE MPU-3050 GYROSCOPE DRIVER
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-iio@vger.kernel.org
-- 
2.14.1
