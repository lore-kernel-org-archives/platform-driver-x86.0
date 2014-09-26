From: =?UTF-8?B?IkLDvGhtYW5uLCBSYWltYXIi?= <Raimar@Buehmann.de>
Subject: ideapad-laptop: cat fan_mode incorrect value on Lenovo S20-30
Date: Fri, 26 Sep 2014 22:38:03 +0200
Message-ID: <5425CEAB.5040002@Buehmann.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from relay2.mail.vrmd.de ([81.28.224.28]:59460 "EHLO
	relay2.mail.vrmd.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755127AbaIZUxH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 26 Sep 2014 16:53:07 -0400
Received: from [89.182.117.104] (helo=[192.168.0.35])
	by relay2.mail.vrmd.de with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.82)
	(envelope-from <Raimar@Buehmann.de>)
	id 1XXcGp-0005G0-8V
	for platform-driver-x86@vger.kernel.org; Fri, 26 Sep 2014 22:37:39 +0200
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

Hi all,

on my new Lenovo S20-30 with automatically loaded kernel module 
ideapad_laptop I am able to start interval mode of fan with

echo '1'>/sys/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/fan_mode

It is also possible to change it back to normal mode with '0'. But the 
result of

cat /sys/devices/pci0000:00/0000:00:1f.0/PNP0C09:00/VPC2004:00/fan_mode

shows 133. All following executions of the same cat command show 5. This 
happens every time after the fan_mode has been changed.

This seams to be a bug for me. Here is more about my hardware: 
https://wiki.archlinux.org/index.php/Lenovo_S20-30

Is it possible to fix this bug?

Kind regards,
Raimar
