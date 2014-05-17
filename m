From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 0/3] Add acpi_video_unregister_backlight(), use in acer-wmi
Date: Sat, 17 May 2014 10:48:00 +0200
Message-ID: <1400316483-6356-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:49377 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757260AbaEQItT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 17 May 2014 04:49:19 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Aaron Lu <aaron.lu@intel.com>, Lee Chun-Yi <jlee@suse.com>
Cc: Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, platform-driver-x86@vger.kernel.org

Hi All,

Here is a v2 of my patch series to fix:

https://bugzilla.kernel.org/show_bug.cgi?id=35622
https://bugzilla.redhat.com/show_bug.cgi?id=1012674

I think its best if the entire series goes upstream through the acpi
tree since the platform/x86 patches depend on the acpi changes.

Changes since v1:
-Fix the syntax error in the #ifndef CONFIG_ACPI_VIDEO
 acpi_video_unregister_backlight inline definition.   

Regards,

Hans
