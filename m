From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 0/2] input/serio: Add a firmware_id sysfs attribute
Date: Wed,  9 Apr 2014 14:46:49 +0200
Message-ID: <1397047611-12620-1-git-send-email-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:23728 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932560AbaDIMq7 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 9 Apr 2014 08:46:59 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org

Hi All,

Sorry about doing a v2 so shortly after the resend, while reviewing
the patches one last time I noticed that the code in the
"input/serio/8042: Add firmware_id support"

Suffered a bit from too much copy-paste, so in this v2 that patch has
been refactored using a helper function to avoid code duplication.

Regards,

Hans
