From: KIV <kiv.apple@gmail.com>
Subject: Problem with samsung_laptop module
Date: Sun, 24 Jun 2012 22:40:25 +0400
Message-ID: <1340563225.13498.4.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:51352 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375Ab2FXSkb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 24 Jun 2012 14:40:31 -0400
Received: by eaak11 with SMTP id k11so979702eaa.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 24 Jun 2012 11:40:30 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org

I use the kernel module samsung_laptop for laptop Samsung 300V4A-A05.
Because of this, the module brightness control does not work properly -
it is only possible to decrease brightness but not increase.

By editing the source code of the module revealed that all the blame
"workaround for brightness stepping quirk". It is activated on my
system, but if it is commented out everything starts to work as needed.

I offer the option to enter the kernel boot command line, which would be
forced to cut off this vorkarud or correct the error.

Sorry for my bad English.
