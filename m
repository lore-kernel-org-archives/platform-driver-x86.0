From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] Add wapf1 quirk for Asus X550VC
Date: Thu, 18 Jun 2015 14:39:24 -0700
Message-ID: <20150618213924.GC121898@vmdeb7>
References: <1433958262-25228-1-git-send-email-hanipouspilot@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1433958262-25228-1-git-send-email-hanipouspilot@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Tunin <hanipouspilot@gmail.com>
Cc: Corentin Chary <corentin.chary@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jun 10, 2015 at 08:44:22PM +0300, Dmitry Tunin wrote:
> Wireless is always blocked on this device.
> There is no way to unblock by software or hardware.
> 
> 1: asus-wlan: Wireless LAN
>    Soft blocked: no
>    Hard blocked: no
> 2: asus-bluetooth: Bluetooth
>    Soft blocked: yes
>    Hard blocked: no
> 3: phy0: Wireless LAN
>    Soft blocked: no
>    Hard blocked: yes
> 
> With wapf=4 bluetooth unblocks but wifi stays blocked
> 
> 1: asus-wlan: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: no
> 2: asus-bluetooth: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 3: phy0: Wireless LAN
> 	Soft blocked: no
> 	Hard blocked: yes
> 7: hci0: Bluetooth
> 	Soft blocked: no
> 	Hard blocked: no
> 
> Only with wapf=1 everything works OK.
> 
> Signed-off-by: Dmitry Tunin <hanipouspilot@gmail.com>
> Cc: stable@vger.kernel.org

Thanks Dmitry, queued.

-- 
Darren Hart
Intel Open Source Technology Center
