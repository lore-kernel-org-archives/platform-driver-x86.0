From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/3] platform/x86/pcengines-apuv2: add mpcie reset gpio
 export
Date: Tue, 16 Jul 2019 20:23:59 +0200
Message-ID: <83ada4a1-c18b-95b4-0891-62ba3f3aa276@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-2-fe@dev.tdt.de>
 <3e98bbd8-c051-4996-fc5a-88a58a2fa2d4@metux.net>
 <10c574cd0dfb1c607536c68fc1c60c06@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <10c574cd0dfb1c607536c68fc1c60c06@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 15.07.19 16:38, Florian Eckert wrote:

> I plugged in a mpcie  usb modem.
> In my test case it was a EC25 from Quectel in mpcie2 port.
> After that I did a reboot and exported the gpio via "/sys/class/gpio"
> Then I executed the command "echo 0 > /sys/class/gpio/<name>/value" and
> "echo 1 > /sys/class/gpio/<name>/value".
> Then I have seen the log message in the kernel that the device did an
> unregistration/registration

hmm, did the same, tried both gpios (mpcie2_reset, mpcie3_reset), but
nothin happened.

But strange: I'm missing some hw, modem doesn't appear ... I'll have to
check again whether i've got unstable hw or missing some kernel config.


--mtx


-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
