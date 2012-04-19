From: Martin Mokrejs <mmokrejs@fold.natur.cuni.cz>
Subject: Dell Vostro 3550: Fn+F1 does not *always* work
Date: Fri, 20 Apr 2012 00:54:30 +0200
Message-ID: <4F9097A6.60701@fold.natur.cuni.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fold.natur.cuni.cz ([195.113.57.32]:45750 "HELO
	fold.natur.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1756259Ab2DSUyg (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 Apr 2012 16:54:36 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org

Hi,
  it is weird that the Fn+F1 key combination should turn on the LCD display of the laptop
or the signal into external D-SUB or HDMI connector. However, it somehow does not work ideally.

1. If I go to virtual console VT2 to VT6, I can disable the LCD using the Fn+F1 fine. The LCD backlight
is still on but that is probably another issue.
2. But, I am in VT1 and press the Fn+F1 key, letter `p' gets printed on the screen. Ooops, actually
first it switches into VT12, and on another attempts starts to write `p' characters.


Anybody experiencing same behavior?
Thanks,
Martin
kernels 3.2.12 to 3.4.-rc3
