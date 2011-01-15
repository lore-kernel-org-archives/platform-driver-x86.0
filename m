From: "Axel G. Rossberg" <Axel@Rossberg.net>
Subject: Re: Bug#587014: screen brightness can't be modified on some
	Panasonic laptops
Date: Sat, 15 Jan 2011 13:01:29 +0000 (GMT)
Message-ID: <20110115.130129.315817196905527759.Axel@rossberg.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtprelay01.ispgateway.de ([80.67.18.43]:59643 "EHLO
	smtprelay01.ispgateway.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752911Ab1AONKn (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 15 Jan 2011 08:10:43 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: 587014@bugs.debian.org
Cc: Nicolas Limare <nicolas+debian@limare.net>, ben@decadent.org.uk, laforge@gnumonks.org, platform-driver-x86@vger.kernel.org

A solution for this problem that works for me (ubuntu 10.10,
2.6.35-24 kernel) is described here
http://ubuntuforums.org/showthread.php?t=1612560 

In a nutshell, add the boot option "acpi_osi=" to grub, by executing 

$ gksudo gedit /etc/default/grub

(which calls an editor) to replace in the file /etc/default/grub the line

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

with 

GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_osi="

Then execute 

$ sudo update-grub

and reboot.  Backlight-changing should now work seamlessly.

Axel
