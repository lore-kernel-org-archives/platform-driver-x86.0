From: =?UTF-8?q?Miguel=20G=C3=B3mez?= <magomez@igalia.com>
Subject: [PATCH 0/1] Add support for Classmate V3 accelerometer to classmate-laptop
Date: Fri, 29 Jun 2012 14:46:29 +0200
Message-ID: <cover.1340971993.git.magomez@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp3.mundo-r.com ([212.51.32.191]:59300 "EHLO
	smtp4.mundo-r.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752710Ab2F2Mqq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 29 Jun 2012 08:46:46 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: cascardo@holoscopio.com, don@syst.com.br, mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Miguel=20G=C3=B3mez?= <magomez@igalia.com>

Classmate V3 has a different accelerometer than the previous versions. =
Main
differences between the new  (ACCE0001) and the old one (ACCE0000) are:

* ACPI method calls need to receive 4 parameters instead of 2
* Values returned by the accelerometer are 2 bytes signed integers, ins=
tead
of one unsigned byte
* New accelerometer has a new attribute (g_select) besides the sensitiv=
ity one.
This attribute's possible values are 0 (meaning 1.5g) and 1 (meaning 6g=
).

I haven't been able to find the datasheet of the accelerometer, so I go=
t most
of the behaviour of the device by looking at the previous model driver =
and by
experimenting with the hardware. Due to this, the range of the axis val=
ues
(currently defined as -255-255) may not be exact, and also the fuzz val=
ue (16)
may not be the best. But, with this configuration, the programs handlin=
g the
screen rotation developed for previous versions of Classmate are workin=
g
properly.

Initially I thought of modifying the ACCE0000 driver to be able to hand=
le both
devices, but the patch was quite big and messy, and it might add proble=
ms to the
previous hardware, so I decided to implement it as a new driver, follow=
ing the
structure of the ACCE0000 driver. This way the new code won't break the=
 old one.

In order to differenciate the new driver code from the old one, all the
function names that belong to the new driver end with "v3".

Hope everything is ok :)

Regards!

Miguel G=C3=B3mez (1):
  classmate-laptop: Add support for accelerometer in classmate V3.

 drivers/platform/x86/classmate-laptop.c |  400 +++++++++++++++++++++++=
+++++++-
 1 file changed, 398 insertions(+), 2 deletions(-)

--=20
1.7.9.5
