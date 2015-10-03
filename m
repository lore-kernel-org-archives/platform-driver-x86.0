From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4] platform/x86: Toshiba WMI Hotkey Driver
Date: Sat, 3 Oct 2015 10:18:33 -0700
Message-ID: <20151003171833.GE110874@vmdeb7>
References: <1443493948-2643-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443493948-2643-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 28, 2015 at 08:32:28PM -0600, Azael Avalos wrote:
> Toshiba laptops that feature WMI events for hotkeys were left unsupported
> by the toshiba_acpi driver, however, commit a88bc06e5aec ("toshiba_acpi:
> Avoid registering input device on WMI event laptops") added hardware
> support for such laptops, but the hotkeys are not handled there.
> 
> This driver adds support for hotkey monitoring on certain Toshiba laptops
> that manage the hotkeys via WMI events instead of the Toshiba
> Configuration Interface (TCI).
> 
> The toshiba_acpi driver and this one can co-exist, as this only takes
> care of hotkeys, while the proper takes care of hardware related stuff.
> 
> Currently the driver is under the EXPERIMENTAL flag, as the keymap
> and the notify function are incomplete (due to lack of hardware to test).
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>

Queued to testing, thanks Azael.


-- 
Darren Hart
Intel Open Source Technology Center
