From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] platform/x86: dell-laptop: fix phantom kbd backlight on
 Inspiron 10xx
Date: Thu, 12 Sep 2019 09:33:58 +0200
Message-ID: <20190912073358.n5bxqosowhky5uhb@pali>
References: <156824368856.28378.14511879419677114177@WARFSTATION>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <156824368856.28378.14511879419677114177@WARFSTATION>
Sender: linux-kernel-owner@vger.kernel.org
To: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 12 September 2019 01:14:48 Pacien TRAN-GIRARD wrote:
> This patch registers a quirk disabling keyboard backlight support
> for the Dell Inspiron 1012 and 1018.
> 
> Those models wrongly report supporting the KBD_LED_OFF_TOKEN and
> KBD_LED_ON_TOKEN SMBIOS tokens, exposing keyboard brightness controls
> through sysfs which freeze the system when used.
> 
> The associated SMBIOS calls never return and cause the system to
> hang, notably at boot when systemd-backlight tries to restore
> previous brightness settings.

Hi! This sounds like a firmware bug. Have you already reported it to Dell?

> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=107651
> Signed-off-by: Pacien TRAN-GIRARD <pacien.trangirard@pacien.net>

-- 
Pali Rohár
pali.rohar@gmail.com
