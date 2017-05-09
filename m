From: =?UTF-8?q?Christian=20K=C3=B6nig?= <deathsimple@vodafone.de>
Subject: Resizeable PCI BAR support v6
Date: Tue,  9 May 2017 18:49:02 +0200
Message-ID: <1494348547-1465-1-git-send-email-deathsimple@vodafone.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from pegasos-out.vodafone.de ([80.84.1.38]:54508 "EHLO
        pegasos-out.vodafone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754685AbdEIQtP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 May 2017 12:49:15 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
        by pegasos-out.vodafone.de (Rohrpostix1  Daemon) with ESMTP id 2B540261EF4
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 May 2017 18:49:14 +0200 (CEST)
Received: from pegasos-out.vodafone.de ([127.0.0.1])
        by localhost (rohrpostix1.prod.vfnet.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id y5cOMeQAd8BG for <platform-driver-x86@vger.kernel.org>;
        Tue,  9 May 2017 18:49:12 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-pci@vger.kernel.org, platform-driver-x86@vger.kernel.org, helgaas@kernel.org

Hi everyone,

is is the sixth incarnation of this set of patches. It enables device
drivers to resize and most likely also relocate the PCI BAR of devices
they manage to allow the CPU to access all of the device local memory at once.

This is very useful for GFX device drivers where the default PCI BAR is only
about 256MB in size for compatibility reasons, but the device easily have
multiple gigabyte of local memory.

Noteable changed compared to v5:
1. Added some rb.
2. Followed Andy's suggestion on patch #3 to use a next
   pointer to make it more readable.

Mostly every comment addressed now, so next question is how we want to
merge this upstream?

I would suggest patches #1-#4 through some PCI branch and we send #5 through the drm
maintainer as soon as the dependencies are accepted?

Thanks for all the help,
Christian.
