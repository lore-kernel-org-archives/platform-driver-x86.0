From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/1] platform/x86: Rename silead_dmi to touchscreen_dmi
Date: Thu,  7 Jun 2018 23:00:22 +0200
Message-ID: <20180607210023.11789-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

This patch is part of / preparation for the EFI embedded firmware
stuff. But it can be merged by itself without the test of that series
and since silead_dmi.c sees quite a bit of churn I would like to get
this one of my queue and merged.

I guess it is to late for 4.18, but please consider queuing this
up for next when the merge window closes.

Note this applies on top of the alphabetically sort series which
I sent out earlier.

Regards,

Hans
