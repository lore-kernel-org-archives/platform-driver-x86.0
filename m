From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/5] platform/x86: intel-vbtn: Fixes + rework to make it work on more devices
Date: Sat,  2 May 2020 20:29:46 +0200
Message-ID: <20200502182951.114231-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-acpi-owner@vger.kernel.org>
Sender: linux-acpi-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Mario Limonciello <mario.limonciello@dell.com>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi All,

Here is a series of fixes, mostly aimed at fixing commit: de9647efeaa9
("platform/x86: intel-vbtn: Only activate tablet mode switch on 2-in-1's"=
)
causing the driver to not bind on some devices where it could and
should report SW_TABLET_MODE.

The last commit makes the driver also work on some devices where it
previously would not work because they lack a VBDL method.

Mario, can you test this on a Dell XPS 9360 (for which you wrote the
de9647efeaa9 commit) to ensure that this series does not cause a
regression there?  Also I have a question for you about using the DMI
chassis-type for this / a proposal for dealing with this differently
below the '---' of the commit msg of the 4th patch.

Regards,

Hans
