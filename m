From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/2] platform/x86: silead_dmi: Add entries for 2 Chuwi tablets
Date: Wed, 20 Dec 2017 11:30:07 +0100
Message-ID: <20171220103009.7680-1-hdegoede@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:46596 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932133AbdLTKaM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 Dec 2017 05:30:12 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Andy, et al,

Here are 2 patches to add entries for 2 more Chuwi tablet models to
silead_dmi.c. Note that these are for 2 different tablets, even though
the entries look similar.

I've based this series on top of the review-andy branch for easy merging,
the first patch is not mine, but I've picked it up and used it as a base
for this series to avoid conflicts.

Regards,

Hans
