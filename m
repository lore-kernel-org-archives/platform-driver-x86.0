From: Florian Eckert <fe@dev.tdt.de>
Subject: Re: [PATCH 1/3] platform/x86/pcengines-apuv2: add mpcie reset gpio
 export
Date: Mon, 15 Jul 2019 16:38:51 +0200
Message-ID: <10c574cd0dfb1c607536c68fc1c60c06@dev.tdt.de>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-2-fe@dev.tdt.de>
 <3e98bbd8-c051-4996-fc5a-88a58a2fa2d4@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3e98bbd8-c051-4996-fc5a-88a58a2fa2d4@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


>> On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to 
>> reset
>> the ports from the userspace, add the definition to this platform
>> device. The gpio can then be exported by the legancy gpio subsystem to
>> toggle the mpcie reset pin.
>> 
> 
> Just tested your patch on an apu3. The driver itself seems to work,
> but the pins don't seem to actually do anything.
> 
> How exactly did you test it ? Do you have some test case ?

I plugged in a mpcie  usb modem.
In my test case it was a EC25 from Quectel in mpcie2 port.
After that I did a reboot and exported the gpio via "/sys/class/gpio"
Then I executed the command "echo 0 > /sys/class/gpio/<name>/value" and 
"echo 1 > /sys/class/gpio/<name>/value".
Then I have seen the log message in the kernel that the device did an 
unregistration/registration
.
-- Florian
