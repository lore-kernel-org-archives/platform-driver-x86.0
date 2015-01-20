From: Oliver Neukum <oneukum@suse.de>
Subject: Re: [PATCH v2 0/4] toshiba_acpi: Add support for USB Sleep functions
Date: Tue, 20 Jan 2015 12:15:26 +0100
Message-ID: <1421752526.29486.18.camel@linux-0dmf.site>
References: <1421631025-27895-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1421631025-27895-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sun, 2015-01-18 at 18:30 -0700, Azael Avalos wrote:
> The following patches add support to several USB Sleep functions
> found on newer Toshiba laptops, allowing to use the USB ports while
> the laptop is asleep or turned off.

Hi,

this is most interesting. But the interface is terrible. If
possible we would like to have a generic interface for this,
which should not depend on the specific platform in use and would
have to be per bus or even per port (for example the ports on a
Thunderbolt dock would not work with your module).
Do you think we could provide a hook from generic code into
platform code to detect the capability for power control?

	Regards
		Oliver
