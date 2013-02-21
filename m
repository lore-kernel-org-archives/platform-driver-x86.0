From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 0/6] Platform: x86: chromeos_laptop - Add support for Chromebook Pixel
Date: Thu, 21 Feb 2013 12:14:54 -0800
Message-ID: <1361477700-26342-1-git-send-email-bleung@chromium.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:42616 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752390Ab3BUUPL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 21 Feb 2013 15:15:11 -0500
Received: by mail-pa0-f49.google.com with SMTP id kp6so19923pab.22
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Feb 2013 12:15:11 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: matthew.garrett@nebula.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: olofj@chromium.org, miletus@chromium.org

The following patch series will add support for the isl light sensor,
atmel mxt touchpad, and atmel mxt touchscreen on the Chromebook Pixel.

[PATCH 1/6] Platform: x86: chromeos_laptop - add i915 gmbuses to
[PATCH 2/6] Platform: x86: chromeos_laptop - Add a more general
[PATCH 3/6] Platform: x86: chromeos_laptop - Add isl light sensor for
[PATCH 4/6] Platform: x86: chromeos_laptop - Add support for probing
[PATCH 5/6] Platform: x86: chromeos_laptop - Add Pixel Trackpad
[PATCH 6/6] Platform: x86: chromeos_laptop - Add Pixel Touchscreen

This should be merged after the patch adding the HP Pavilion 14.
Platform: x86: chromeos_laptop - Add HP Pavilion 14
