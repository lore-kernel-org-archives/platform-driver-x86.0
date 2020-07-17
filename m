From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on new Lenovo Thinkpads
Date: Fri, 17 Jul 2020 13:41:52 +0200
Message-ID: <20200717114155.56222-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org, Marco Trevisan <marco.trevisan@canonical.com>, Mark Pearson <mpearson@lenovo.com>, Christian Kellner <ckellner@redhat.com>, Benjamin Berg <bberg@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi All,

This is a simple patch-series adding support for 3 new hotkeys found
on various new Lenovo Thinkpad models.

There is one small complication, these 3 new hotkeys also require
the addition of new key-codes to include/uapi/linux/input-event-codes.h.

And those changes have to land first. It is probably easiest to just
merge everything through the platform/x86 tree, or alternatively we
would need an immutable branch from the input-subsys with the first
patch on there which the platform/x86 maintainers can then merge.

Dmitry, can you please let us know how you want to proceed with these
changes; And if you are ok with merging the input-event-codes.h changes
through the platform/x86 tree, may we have your Acked-by for that ?

Regards,

Hans
