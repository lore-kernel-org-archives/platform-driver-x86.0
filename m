From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 0/2] Platform: x86: chromeos_laptop - Deferred Probing
Date: Wed, 17 Jul 2013 17:20:59 -0700
Message-ID: <1374106861-3549-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: adurbin@chromium.org, olofj@chromium.org, axel.lin@ingics.com
List-Id: platform-driver-x86.vger.kernel.org

The following patch series refactors the dmi check system and
returns -EPROBE_DEFER when an expected i2c adapter is not present
at probe time.

This will allow the touchpad, touchscreen, and light sensors on
Pixel to load even if the i915 DDC and PANEL buses are instantiated
after chromeos_laptop.

[PATCH 1/2] Platform: x86: chromeos_laptop - Restructure device associations
[PATCH 2/2] Platform: x86: chromeos_laptop - Use deferred probing
