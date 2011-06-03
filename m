From: Marco Chiappero <marco@absence.it>
Subject: [PATCH 0/25] sony-laptop: code improvements and support extension
 for newer Vaios
Date: Fri, 03 Jun 2011 17:22:50 +0200
Message-ID: <4DE8FC4A.9010401@absence.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from aa011-1msr.fastwebnet.it ([62.101.93.131]:46013 "EHLO
	aa011-1msr.fastwebnet.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752910Ab1FCPWz (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 3 Jun 2011 11:22:55 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, Mattia Dongili <malattia@linux.it>, Javier Achirica <jachirica@gmail.com>, Marco Chiappero <marco@absence.it>

Hello,

this set of patches aims to reorganize and clean the driver code where 
necessary [patches 1-9, 13], improve some functionalities [patches 
10-12] and add some others present on recent Vaios (TT, Y1, Z1, F1, S1, 
SA/SB/SC, CA/SB and possibly others), such as ALS driven backlight 
control, HDD shock protection control and Battery charge control.

During the development of these patches a long list of new handles has 
been found and analyzed (the list can be read here: 
http://absence.it/vaio-acpi/handles_list.txt), many of them are now well 
known and mostly implemented by patches from 14 to 24.

During the development, this code has been made publicly available for a 
few months at http://code.google.com/p/vaio-f11-linux/issues/detail?id=6 
and http://www.absence.it/vaio-acpi/source/ where many people 
contributed with feedback and testing. The coded is now stable and well 
tested, even though improvements are still possible (and can be 
introduced later).

Some functionalities may require a userspace Vaio specific daemon (for 
ALS based backlight control, visual notifications, etc.), which is under 
development at http://git.zx2c4.com/sony-acpid/

All the code is written by me, with the exception of patch #23, written 
by me and Javier Achirica. Javier Achirica has been also a major 
contributor in the analysis of the ALS part (patch #23) and the 
"HighSpeed Charging" functionality (patch #18).

The patches are also available here: 
http://www.absence.it/vaio-acpi/source/patches/patchset/
