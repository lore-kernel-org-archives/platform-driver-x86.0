From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Portege Z930 extra keys and leds
Date: Tue, 24 Sep 2019 14:55:19 +0200
Message-ID: <09e715a0-08d2-100d-4bc3-c4f6c87f2a98@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Platform Driver <platform-driver-x86@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Hello folks,


does anybody happen to know how to drive the extra keys and leds
of Toshiba Portege Z930 notebook ?

It has two extra keys above the keyboard (right next to the power
button) and some indicator leds underneath the touch panel buttons.

Toshiba originally ships the notebook with some strange Windows software
(for some mysterious "ECO" mode) that reacts on these two buttons and
drives at least the rightmost LED directly - so there has to be *some*
way to control them by software.

When in a terminal (on the console only when /dev/input/event10 -
"Toshiba input device" is opened), both keys seem to generate an "x"
keypress, but nothing coming in in the event device.

Does anybody have an idea how to catch these key press events or
how to drive this myserious ("ECO") led ?


thx
--mtx


PS: tried on an older 4.14 kernel - haven't had a chance to upgrade
the notebook to something more recent :o
-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
