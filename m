From: Benson Leung <bleung@chromium.org>
Subject: [PATCH 0/2] Add platform data and touchpad functionality for Pixel
Date: Fri,  1 Mar 2013 17:20:52 -0800
Message-ID: <1362187254-9227-1-git-send-email-bleung@chromium.org>
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: olofj@chromium.org, miletus@chromium.org, dmitry.torokhov@gmail.com, matthew.garrett@nebula.com, rydberg@euromail.se, djkurtz@chromium.org, jy0922.shim@samsung.com, wfp5p@virginia.edu, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc: bleung@chromium.org
List-Id: platform-driver-x86.vger.kernel.org

Add support for an "atmel_mxt_tp" variant in the atmel_mxt_ts.c driver.
Then, add platform data for the 224s trackpad and the 1664s touchscreen
in chromeos_laptop so that the existing version of the driver will
probe these devices correctly.

[PATCH 1/2] Input: atmel_mxt_ts - add device id for touchpad variant
[PATCH 2/2] Platform: x86: chromeos_laptop : Add basic platform data
