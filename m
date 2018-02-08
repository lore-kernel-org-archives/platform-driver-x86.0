From: <Mario.Limonciello@dell.com>
Subject: Dell SMBIOS initializing before backends are ready
Date: Thu, 8 Feb 2018 18:23:23 +0000
Message-ID: <8da25d14004a4bd6ac7415c5958bcfc8@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: pali.rohar@gmail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, dvhart@infradead.org, andy.shevchenko@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

After Paul's recent message regarding the odd wifi issue he had a=20
comment I wanted to investigate:

dell_smbios: "No dell-smbios drivers are loaded"

Coming up early in boot.  This is a side effect of dell-smbios having two
backend drivers that can be compiled as modules but no tie to force
them to initialize before calls to dell_smbios_call.

So I believe what is happening is dell_micmute_led_set is called from
the HDA driver and calls dell_smbios_call early too.

I haven't tried it on a platform with mic mute, but I suspect it might caus=
e
the mic mute LED status to be wrong initially (but corrected later when=20
toggled).

Ideas that came to mind:

1) In dell_smbios_call if no backends loaded, explicitly do a symbol_reques=
t
for both backends and run initialization at that time.

If that works, that would also resolve if someone manually unloaded both
backends but a kernel module still tried to perform a request.

2) Add a notifier chain for when the driver is ready (a backend is loaded)
to all consumers of dell_smbios_call.  Don't let other modules call
dell_smbios_call until notified.
Don't let the HDA driver call dell_micmute_led_set either.

3) try_module_get during dell-smbios initialization for both the backends

What's the correct way to address this?
