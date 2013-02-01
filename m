From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 0/4] Platform: x86: chromeos_laptop - Add more x86 Chromebooks
Date: Fri,  1 Feb 2013 14:34:42 -0800
Message-ID: <1359758086-2320-1-git-send-email-bleung@chromium.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:45826 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757912Ab3BAWe6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Feb 2013 17:34:58 -0500
Received: by mail-pb0-f53.google.com with SMTP id un1so2328962pbc.12
        for <platform-driver-x86@vger.kernel.org>; Fri, 01 Feb 2013 14:34:57 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: bleung@chromium.org, olofj@chromium.org, olof@lixom.net

This patch series will add support for the following devices on
the following laptops:

Acer C7 Chromebook - Cypress APA Smbus Trackpad
Acer AC700 - Taos tsl2563 light sensor
Samsung Series 5 Chromebook - Taos tsl2583 light sensor
Cr-48 - Taos tsl2563 light sensor

Cheers,
Benson
