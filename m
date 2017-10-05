From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH resend] platform/x86: peaq-wmi: Add DMI check before binding to the WMI interface
Date: Thu,  5 Oct 2017 20:04:03 +0200
Message-ID: <20171005180404.15044-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:42358 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751430AbdJESEH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Oct 2017 14:04:07 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Kai Heng Feng <kai.heng.feng@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi All,

This is a resend with Kai Heng Feng added to the Cc. Kai can you please
test this patch. This patch replaces yours, as many devices seem to be
affected so a whitelist is the better approach here.

Regards,

Hans
