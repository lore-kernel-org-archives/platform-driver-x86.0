From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 0/3] acpi4asus's patchs for 2.6.39-rc1
Date: Wed, 30 Mar 2011 16:32:30 +0200
Message-ID: <1301495553-22468-1-git-send-email-corentin.chary@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from fb2.tech.numericable.fr ([82.216.111.50]:40920 "EHLO
	fb2.tech.numericable.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754163Ab1C3Onw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 30 Mar 2011 10:43:52 -0400
Received: from smtp1.tech.numericable.fr (smtp1.nc.sdv.fr [10.0.0.24])
	by fb2.tech.numericable.fr (Postfix) with ESMTP id 9A9011BCDB1
	for <platform-driver-x86@vger.kernel.org>; Wed, 30 Mar 2011 16:33:40 +0200 (CEST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Corentin Chary <corentin.chary@gmail.com>

Hi Matthew,
Some small and clean fixes for 2.6.39.
Thanks,

Corentin Chary (3):
  asus-laptop: remove removed features from
    feature-removal-schedule.txt
  asus-wmi: swap input name and phys
  eeepc-wmi: add keys found on EeePC 1215T

 Documentation/feature-removal-schedule.txt |   20 --------------------
 drivers/platform/x86/asus-wmi.c            |    4 ++--
 drivers/platform/x86/eeepc-wmi.c           |    2 ++
 3 files changed, 4 insertions(+), 22 deletions(-)

-- 
1.7.3.4
