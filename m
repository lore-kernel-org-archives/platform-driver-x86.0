From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
Subject: [PATCH 0/2] acer-wmi: remove threeg and interface sysfs files
Date: Wed, 25 May 2011 17:58:25 +0800
Message-ID: <1306317507-11743-1-git-send-email-jlee@novell.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:33377 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751397Ab1EYKAH (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 25 May 2011 06:00:07 -0400
Received: by vxi39 with SMTP id 39so5617069vxi.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 25 May 2011 03:00:05 -0700 (PDT)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: mjg@redhat.com
Cc: platform-driver-x86@vger.kernel.org, "Lee, Chun-Yi" <jlee@novell.com>

Remove threeg sysfs because we can autodetect internal 3G device and already
have the threeg rfkill now. And, We also remove interface sysfs and replaced
by information log.

The above 2 files are the last two sysfs interfaces that were provided by
acer-wmi.

Lee, Chun-Yi (2):
  acer-wmi: remove threeg sysfs support
  acer-wmi: remove interface sysfs file

 drivers/platform/x86/acer-wmi.c |   96 +++------------------------------------
 1 files changed, 7 insertions(+), 89 deletions(-)
