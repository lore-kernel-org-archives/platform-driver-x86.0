From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v4 4/5] toshiba_acpi: Support new keyboard backlight type
Date: Mon, 15 Sep 2014 10:47:47 -0700
Message-ID: <20140915174747.GB59389@vmdeb7>
References: <1410569437-3066-1-git-send-email-coproscefalo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1410569437-3066-1-git-send-email-coproscefalo@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Sep 12, 2014 at 06:50:36PM -0600, Azael Avalos wrote:
> Newer Toshiba models now come with a new (and different) keyboard
> backlight implementation with three modes of operation: TIMER,
> ON and OFF, and the LED is now controlled internally by the firmware.
> 
> This patch adds support for that type of backlight, changing the
> existing code to accomodate the new implementation.
> 
> The timeout value range is now 1-60 seconds, and the accepted
> modes are now: 1 (FN-Z), 2 (AUTO or TIMER), 8 (ON) and 10 (OFF),
> this adds two new entries kbd_type and available_kbd_modes,
> the first shows the keyboard type and the latter shows the
> supported modes depending on the keyboard type.
> 
> Signed-off-by: Azael Avalos <coproscefalo@gmail.com>
> ---
> Changes since v3:
> Fixed typos on patch description
> Dropped changes to toshiba_kbd_bl_mode_show and simply added the new mode mask
>  drivers/platform/x86/toshiba_acpi.c | 188 ++++++++++++++++++++++++++++++------
>  1 file changed, 156 insertions(+), 32 deletions(-)

Queued, thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
