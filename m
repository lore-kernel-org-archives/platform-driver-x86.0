From: Andy Ross <andy@windriver.com>
Subject: [PATCH 0/3] Pegatron Lucid tablet accelerometer
Date: Fri, 14 Jan 2011 12:14:08 -0800
Message-ID: <1295036050-10553-1-git-send-email-andy@windriver.com>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Corentin Chary <corentincj@iksaif.net>, linux-input@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Driver for the ACPI interface to the accelerometer on the Pegatron
Lucid tablets (sold as WeTab and ExoPC).  I put detection into
asus-laptop, as that seems to be the owner of the "\_SB.ATKD." space
in ACPI.  Hopefully that's the right choice.

Andy


