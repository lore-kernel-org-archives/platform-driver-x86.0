From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: [PATCH v2 0/3] Sony-laptop: Adjustments for sony_nc_setup_rfkill()
Date: Wed, 1 Nov 2017 19:45:08 +0100
Message-ID: <17ee534c-9fe6-19c4-0522-76cd3cbe5f88@users.sourceforge.net>
References: <f33d9aa0-1a8e-f702-7513-5c0d5b464529@users.sourceforge.net>
 <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcMkXCioCzmLE0+BTmkqc5RSOx9yPO0ectVHMrMvewgwg@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Darren Hart <dvhart@infradead.org>, Marco Chiappero <marco@absence.it>, Matthew Garrett <mjg@redhat.com>, Mattia Dongili <malattia@linux.it>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Andy Shevchenko <andy@infradead.org>
List-Id: platform-driver-x86.vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 1 Nov 2017 19:34:56 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Fix exception handling
  Delete an unnecessary variable initialisation
  Use common error handling code
---

v2:
Two additional suggestions were taken into account from a corresponding
source code review.

 drivers/platform/x86/sony-laptop.c | 33 ++++++++++++++++++---------------
 1 file changed, 18 insertions(+), 15 deletions(-)

-- 
2.14.3
