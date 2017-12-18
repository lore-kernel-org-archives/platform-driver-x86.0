From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH 0/2] platform/x86/thinkpad_acpi: Adjustments for four function
 implementations
Date: Mon, 18 Dec 2017 22:26:36 +0100
Message-ID: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 18 Dec 2017 22:23:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in three functions
  Improve a size determination in tpacpi_new_rfkill()

 drivers/platform/x86/thinkpad_acpi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

-- 
2.15.1
