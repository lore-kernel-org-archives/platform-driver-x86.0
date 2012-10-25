From: Benson Leung <bleung@chromium.org>
Subject: [PATCH v2 0/1] Platform: x86: Add Chrome OS Laptop driver
Date: Thu, 25 Oct 2012 14:21:20 -0700
Message-ID: <1351200081-19349-1-git-send-email-bleung@chromium.org>
References: <1341961393-17728-1-git-send-email-bleung@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1341961393-17728-1-git-send-email-bleung@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, corentin.chary@gmail.com
Cc: bleung@chromium.org, olofj@chromium.org, olof@lixom.net
List-Id: platform-driver-x86.vger.kernel.org

Spun another version of this patch. Thanks Coretin for your feedback.
I've incorporated your suggestions.

v2 : * Added MODULE_DEVICE_TABLE for the dmi table.
     * Made __init and __initdata position consistent across this file.
     * Made prefix static const char *
     * Made strncmp expressions more explicit
     * Added an additional match for DMI_SYS_VENDOR for Samsung Lumpy.

Benson
