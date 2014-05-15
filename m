From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/4] Add acpi_video_unregister_backlight(), use in acer-wmi
Date: Thu, 15 May 2014 13:22:32 +0200
Message-ID: <1400152956-9053-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:8416 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751845AbaEOLWv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 15 May 2014 07:22:51 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Lee Chun-Yi <jlee@suse.com>, Aaron Lu <aaron.lu@intel.com>
Cc: Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Matthew Garrett <matthew.garrett@nebula.com>, Massimiliano <massi.ergosum@gmail.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org

Hi All,

Here is a non RFC version of my patch series to fix:

https://bugzilla.kernel.org/show_bug.cgi?id=35622
https://bugzilla.redhat.com/show_bug.cgi?id=1012674

I think its best if the entire series goes upstream through the acpi
tree since the platform/x86 patches depend on the acpi changes.

Regards,

Hans
