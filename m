From: Dario Messina <nanodario@gmail.com>
Subject: Re: [PATCH] Add Second Fan Support for Thinkpad P50
Date: Sat, 20 Jul 2019 17:22:00 +0200
Message-ID: <5490267.oBufKZg01J@lenovodario>
References: <1522693621-3124-1-git-send-email-agk@godking.net> <20180926143449.bnqliemloqw7fuyv@t530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180926143449.bnqliemloqw7fuyv@t530.fritz.box>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Assmann <sassmann@kpanic.de>
Cc: Alexander Kappner <agk@godking.net>, ibm-acpi@hmh.eng.br, dvhart@infradead.org, andy@infradead.org, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

I have a Thinkpad P51 (BIOS version: N1UET74W, EC version: N1UHT26W).
This patch works on my computer and I can read both fan speeds through sysfs 
interface.

On 2018-09-26 16:34:19 CEST, Stefan Assmann wrote:
> Is there a way to actually control the second fan? There's pwm1, but no
> pwm2. And pwm1 only affects fan1.

I have played with the driver code and I noticed that it is possible to 
control both fans independently (unlike what the "Fan subdriver" comment in 
the code says).
You can do that simply by calling fan_select_fan1 or fan_select_fan2, to 
select a fan to be controlled, before calling fan_set_level. All control 
parameters (disengaged, manual speeds, auto) are fully independent.

What is not smooth is reading back current control parameters from register 
0x2f (like fan_pwm1_show or fan_pwm1_enable_show actually do), because the EC 
ignores which fan is currently selected and it always returns the last written 
value.


Distinti Saluti/Best Regards,
Dario Messina
