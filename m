From: Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/3] sony-laptop fixes for 2.6.39
Date: Tue,  5 Apr 2011 23:38:33 +0900
Message-ID: <1302014316-1094-1-git-send-email-malattia@linux.it>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:53399 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752619Ab1DEOi6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 5 Apr 2011 10:38:58 -0400
Received: by iwn34 with SMTP id 34so438617iwn.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2011 07:38:58 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg@redhat.com>
Cc: platform-driver-x86@vger.kernel.org

Hi Matthew,

a few fixes for the code that was added in 2.6.39.

One note about the "largely modified sony-laptop.c" mentioned in [PATCH 1/3]:
the file is distributed via the author's website[1] and a Google Code
project[2]. The file reports the same original license (GPLv2+) so I'm taking
bits and pieces from there and integrating them for mainline.

[1]: http://www.absence.it/vaio-acpi/
[2]: http://code.google.com/p/vaio-f11-linux/

Thanks
-- 
Mattia
