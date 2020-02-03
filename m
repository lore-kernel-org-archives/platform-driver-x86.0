From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v3 0/2] platform/x86: thinkpad_acpi: use standard charge control attribute names
Date: Mon,  3 Feb 2020 13:01:30 +0100
Message-ID: <20200203120132.102576-1-linux@weissschuh.net>
References: <20200131143650.4149-1-linux@weissschuh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200131143650.4149-1-linux@weissschuh.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
List-Id: platform-driver-x86.vger.kernel.org

This patch series switches the battery control sysfs attributes to their
standard names as documented in Documentation/ABI/testing/sysfs-class-power.

If backwards compatability is not required please drop patch 3 of this series.
The old names were not documented explicitly and new generic software should
automatically use the new attributes, which may allow to drop the old names.

Changes since v2:
* Preserved API backwards compat after each patch by merging the patches that
  switch over to the new API and reintroduce the compat aliases.

Thomas Weißschuh (2):
  platform/x86: thinkpad_acpi: remove unused defines
  platform/x86: thinkpad_acpi: use standard charge control attribute
    names

 drivers/platform/x86/thinkpad_acpi.c | 29 +++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

-- 
2.25.0
