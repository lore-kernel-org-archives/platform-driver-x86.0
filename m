From: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Subject: X450LCP lost abillity to turn the screen off
Date: Sun, 10 Feb 2019 17:24:14 -0200
Message-ID: <20190210192408.GA81989@bebop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: jprvita@endlessm.com, andriy.shevchenko@linux.intel.com, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hi,

Since 5.0.0-rc4 I vefiried that my ASUS laptop cannot turn the screen of
anymore. There were several commits in 5.0 merge window touching this
functionality like:

  71b12beaf12f platform/x86: asus-nb-wmi: Drop mapping of 0x33 and 0x34 scan codes
  b3f2f3799a97 platform/x86: asus-nb-wmi: Map 0x35 to KEY_SCREENLOCK
  78f3ac76d9e5 platform/x86: asus-wmi: Tell the EC the OS will handle the display off hotkey

I didn't have time to track it down, and my previous working kernel was 4.12
(default in openSUSE Leap 15), but I hope I will be able to test older kernels this week.

-- 
Thanks,
Marcos
