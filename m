From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/3] platform/x86/pcengines-apuv2: add mpcie reset gpio
 export
Date: Mon, 8 Jul 2019 21:44:30 +0200
Message-ID: <3c469213-f2d7-aa7e-4028-e8ce463a4441@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-2-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-2-fe@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 11:02, Florian Eckert wrote:
> On APUx we have also mpcie2/mpcie3 reset pins. To make it possible to reset
> the ports from the userspace, add the definition to this platform
> device. The gpio can then be exported by the legancy gpio subsystem to
> toggle the mpcie reset pin.

Are you sure they're also available on APUv2 (not just v3) ?

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
