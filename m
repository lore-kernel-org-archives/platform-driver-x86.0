From: Gerhard Wiesinger <lists@wiesinger.com>
Subject: platform/x86/pcengines-apuv2: Missing apu4
Date: Fri, 26 Jul 2019 17:25:34 +0200
Message-ID: <2f22106f-4d13-f3a7-0862-3a71762d62ab@wiesinger.com>
References: <02b34d18-27bc-cb48-f698-03df61df7d91@wiesinger.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <02b34d18-27bc-cb48-f698-03df61df7d91@wiesinger.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Hello,

I saw that the apu4 board is completly missing (also on 5.3rc1). Can you 
please add it. Should be very easy, see below.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/platform/x86/pcengines-apuv2.c?h=v5.1.20

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/pcengines-apuv2.c?h=v5.3-rc1


For further rference:

https://www.pcengines.ch/apu2.htm

https://www.pcengines.ch/apu4c2.htm

https://www.pcengines.ch/apu4c4.htm

Please backport it also to 5.1.x and 5.2.x.


Thnx.

Ciao,

Gerhard


     /* APU4 w/ legacy bios < 4.0.8 */
     {
         .ident        = "apu4",
         .matches    = {
             DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
             DMI_MATCH(DMI_BOARD_NAME, "APU4")
         },
         .driver_data = (void *)&board_apu2,
     },
     /* APU4 w/ legacy bios >= 4.0.8 */
     {
         .ident       = "apu4",
         .matches     = {
             DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
             DMI_MATCH(DMI_BOARD_NAME, "apu4)
         },
         .driver_data = (void *)&board_apu2,
     },
     /* APU4 w/ mainline bios */
     {
         .ident       = "apu4",
         .matches     = {
             DMI_MATCH(DMI_SYS_VENDOR, "PC Engines"),
             DMI_MATCH(DMI_BOARD_NAME, "PC Engines apu4")
         },
         .driver_data = (void *)&board_apu2,
     },


|

MODULE_DESCRIPTION("PC Engines APUv2/APUv3/APUv4 board GPIO/LED/keys 
driver"); |
