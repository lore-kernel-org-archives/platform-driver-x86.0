From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86: ideapad-laptop: Fix no_hw_rfkill_list
 for Lenovo RESCUER R720-15IKBN
Date: Sat, 26 Jan 2019 13:33:50 -0800
Message-ID: <20190126213350.GA41709@wrath>
References: <d4974133-580d-9166-f554-7e03bb1948b9@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d4974133-580d-9166-f554-7e03bb1948b9@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yang Fan <nullptr.cpp@gmail.com>
Cc: ike.pan@canonical.com, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Sat, Jan 19, 2019 at 07:16:33PM +0800, Yang Fan wrote:
> Commit ae7c8cba3221 ("platform/x86: ideapad-laptop: add lenovo RESCUER 
> R720-15IKBN to no_hw_rfkill_list") added
>     DMI_MATCH(DMI_BOARD_NAME, "80WW")
> for Lenovo RESCUER R720-15IKBN.
> 
> But DMI_BOARD_NAME does not match 80WW on Lenovo RESCUER R720-15IKBN, 
> thus cause Wireless LAN still be hard blocked.
> 
> On Lenovo RESCUER R720-15IKBN:
>     ~$ cat /sys/class/dmi/id/sys_vendor 
>     LENOVO
>     ~$ cat /sys/class/dmi/id/board_name 
>     Provence-5R3
>     ~$ cat /sys/class/dmi/id/product_name 
>     80WW
>     ~$ cat /sys/class/dmi/id/product_version 
>     Lenovo R720-15IKBN
> 
> So on Lenovo RESCUER R720-15IKBN:
>     DMI_SYS_VENDOR should match "LENOVO",
>     DMI_BOARD_NAME should match "Provence-5R3",
>     DMI_PRODUCT_NAME should match "80WW",
>     DMI_PRODUCT_VERSION should match "Lenovo R720-15IKBN".
> 
> Fix it, and in according with other entries in no_hw_rfkill_list, 
> use DMI_PRODUCT_VERSION instead of DMI_BOARD_NAME.
> 
> Fixes: ae7c8cba3221 ("platform/x86: ideapad-laptop: add lenovo 
> RESCUER R720-15IKBN to no_hw_rfkill_list")
> Signed-off-by: Yang Fan <nullptr.cpp@gmail.com>

Thanks for the patch, queued for testing.

-- 
Darren Hart
VMware Open Source Technology Center
