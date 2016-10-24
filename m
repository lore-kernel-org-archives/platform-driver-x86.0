From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 3/4] platform: x86: dell-*: Call
 led_notify_brightness_change on kbd brightness change
Date: Mon, 24 Oct 2016 16:10:41 +0200
Message-ID: <20161024141041.GG12154@pali>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <20161023194652.24335-3-hdegoede@redhat.com>
 <20161024133459.GD12154@pali>
 <48df1537-4f76-6c7b-cb50-9c1aeaf41b6c@redhat.com>
 <20161024135101.GF12154@pali>
 <ec56e728-9e50-3e47-3a9f-5f0920da19e1@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ec56e728-9e50-3e47-3a9f-5f0920da19e1@redhat.com>
Sender: linux-leds-owner@vger.kernel.org
To: Hans de Goede <hdegoede@redhat.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 24 October 2016 15:57:41 Hans de Goede wrote:
> Hmm, the 0000 table contains:
> 
>         /* Key code is followed by keyboard illumination level */
>         { KE_IGNORE, 0xe00c, { KEY_KBDILLUMTOGGLE } },
> 
> We could use the same keycode in the 0011 table for kbd brightness events and then do:
> 
> 	if (event->keycode == KEY_KBDILLUMTOGGLE)
> 		dell_smbios_kbd_backlight_brightness_changed, NULL);
> 
> I will send an updated version using this.

Yea, that is great!

-- 
Pali Rohár
pali.rohar@gmail.com
